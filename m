Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1492CC83869
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 07:47:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2393D10E34B;
	Tue, 25 Nov 2025 06:47:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KAMItyJG";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CuTmrpE6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BB0510E34B
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 06:47:27 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AP2gnGx1741249
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 06:47:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 00TPfGnlju//wYRaKPxLV+zceO3Lch/e2xfZkJJGhq8=; b=KAMItyJGXW/Pi3ry
 dE7sQ6OflnLQJICZGBl3oPgvnIf4G4k7Dtip5meqRdZYTaBDpzZ7BHjq8N0Dq4Xm
 g6XuZhitlw2oFVny620y+8k29FBkVvW/QQiwTGZUejE57i2/WDdLNusHsa3/56Qb
 v0+Xu3aLF6EX4BNvAnyp7hwpt6sSaBBxCwjS5ki7jzEh1MVqjYrX1W0d13hZ4TIA
 3C4UBgRrRGXXbKUe8vAfRdBiBZhdu5AUdNKG411/fnuz4Kj+XIgepmFrvZu53NZ1
 OFVBvVDch68PFaH0LcyAH4tBC/5yVYxuqMV+EFDhcPuZD931U4Zb+rP98DjS7ARF
 ZleM5w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amteba7wb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 06:47:26 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-2982b47ce35so55497495ad.2
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Nov 2025 22:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764053245; x=1764658045;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=00TPfGnlju//wYRaKPxLV+zceO3Lch/e2xfZkJJGhq8=;
 b=CuTmrpE6S0bCuTwyzYI0K2sfHBTrEix/VGt3TBwbU0fUv8zdutdDuqQyZz/IiuvrVg
 erBu3kBNk2rxwn4+ebBFS5CymcQpHPcbQn5LAd0WMHwmd3SGKnB3IGhMfNDb7az4Sepf
 pzsRAGhPmsiQCQljd0QaTKoWIgjo54z4daRCra/6kLm+hXy2LaqUHCQyl5h9OCWi3B/s
 6+x8hRN1E1TTJKxB+EKhiwmSLWXjy1e7AXalM4tomEXLhKYEJX+hjv8E/iORBl1Y/rUo
 vMCv032fhjeEm0YZ8E1lgo+iVqQPiRDmoGQY/kYcRPlRKiId3MUNtqJeTlPFwPxykPqf
 p5RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764053245; x=1764658045;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=00TPfGnlju//wYRaKPxLV+zceO3Lch/e2xfZkJJGhq8=;
 b=SX37JUDKH86meJV9x/HalRuMrE2DxMWTa01aoVHZFjpYeTMkhqxICz/5HAguqT3h1A
 E6AOBpNeRy9yn4u48t2v8/dHa0I/CXLKElDPkiwN7+grRYpCHgddPsWmi2eUfaPB9lf4
 2xHEhlM7rHaIbXLpxmeZ6o14xl6iIgUlsuAlzjF6lpbhUav83zFc7awLJCimfExBcOG/
 /W0fP56kJQtlhniWi3tcnEaK1rK158Fhi3tpjBj28x4bbSHJBdQxsLdysPtb8CeZoloC
 3uT57g06+R6Sy44a19t2TONuAfE2WAFxQp9wOqW2QPFLom8OcoDJjwp6+J6d6tTxPQju
 GrmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+sRd18gXLT5YY5PHbOmMGjwx/t/aYs5REv7VZt9PcL9N9nCUuEUccZWoTKJ5macoXkLdee+IqDCA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzCYmsbHmUQRNGi907KcuNEi+8LsilMh6e3c94NHLoN2edfTfWh
 E0lGh28vFAEAR2gl0xZiY1KLk9BoWsepH3MMPVlI44wfHl8AC8btnFljPULrszS7NNBngLRt9Ke
 0vzMgyO98Deo62aBaMHHtm7IbkkzoC8yYENaWcNNFYDnylCxd5J1NCZ2M+Q70l0b3/LMkV5I=
X-Gm-Gg: ASbGnctAzTtLz9blQEteq64DkuIjBVAxSb7VEHnO+wm3JLsPtmVNsZdz+cmWlUL3NOP
 FGqYQBMbUDUd5yOmNS53L8OvjRNtD9oRvG0Lvv5DscJ/M9H+WL+5hB3W32ge80pmJQrRaq1yaMW
 6/RfIUX+F//nmfLN9GrlN0voFkJvptKBncCaekfq8KK1nbZnBAcc1k9FK+x9SJ1mw3PNX5YH2ZM
 VLjvNuRLE49nPV9zoXNkC0Z9MG9KFb9IotG7T6LsSQMzTvk81zaN8A+zFg1j8+oKOTOOhDUom8O
 drjlwXLE7S76RsqiMLWO1sJCYee6VXNbgHtHoBcJ4QiJeXf9z6XNNQJeC/O+ni7CZ99HAicPlXr
 lClTAu5MFNh+aPyxp1Wn26Bbf71HCSpMyqnj/Tvn8ju+GlzqlDQG19WaLamvMUR3DJbIAuA==
X-Received: by 2002:a17:902:f691:b0:295:68dd:4ebf with SMTP id
 d9443c01a7336-29b6c3e3c48mr173257475ad.16.1764053244801; 
 Mon, 24 Nov 2025 22:47:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHmIP2SmCaWX4l2Q1mTmrRkAYkOO9IckP1bEh+Ip5Dio5d5HQJ6eWo4kL/upXP1t6txnvwWIw==
X-Received: by 2002:a17:902:f691:b0:295:68dd:4ebf with SMTP id
 d9443c01a7336-29b6c3e3c48mr173257205ad.16.1764053244243; 
 Mon, 24 Nov 2025 22:47:24 -0800 (PST)
Received: from [10.133.33.235] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29b5b2ac81bsm156886485ad.93.2025.11.24.22.47.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 22:47:23 -0800 (PST)
Message-ID: <7b243866-a877-40c3-86cd-ddfb582969eb@oss.qualcomm.com>
Date: Tue, 25 Nov 2025 14:47:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 37/38] drm/msm/dp: fix the intf_type of MST interfaces
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-37-01faacfcdedd@oss.qualcomm.com>
 <pp7s4wyvchoe2en6xqtow7cw3wfjfgnb5lu2l4f26azwssolpk@ydjm2ezqumu5>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <pp7s4wyvchoe2en6xqtow7cw3wfjfgnb5lu2l4f26azwssolpk@ydjm2ezqumu5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: UNS1xtEZqYqoEHHUl0rIEUf2AzmoZj1A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDA1NCBTYWx0ZWRfXwTV+HGcbwJbQ
 tTJbmaQaQPvssnydFRIXJN6QLup41+X3zGz/Xyq+nHJwTCctThjoB9g0OwlfWIOt+Iu65AQRUoB
 XWWOVhFJVzKeTuGZXLMXEARx+QbpsoNzOGh+10zuRir6zgdTvXp7Gr54p4RilkV8SS9IeKHN/Ca
 7+neIlabxkVqxOue10XFgHwUAafHnEV4suotrvn3EkGYttiCtXwepN/ITJB5J6YefeHnVeYJAVv
 5Qjuep7pNAqpasiiYMvSnDgD9O0yNmzlcn1+Rm1cBrASmp/FwAV79LFLwkh+qgy+6Fz0+So0DfB
 0kxaI2s97Zy0MctlcGE/OlORzZxUN3Afg/8M9YAOMU3aIYS/esDFWE9tAebROrJx29SPb/59wyO
 fO5t6flj9hr/qP69L9KccXxwEnlZQg==
X-Proofpoint-ORIG-GUID: UNS1xtEZqYqoEHHUl0rIEUf2AzmoZj1A
X-Authority-Analysis: v=2.4 cv=d7f4CBjE c=1 sm=1 tr=0 ts=692550fe cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=Sm_-M3Yy7wF-AUM9z_0A:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_01,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 adultscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250054
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/27/2025 9:18 AM, Dmitry Baryshkov wrote:
> On Mon, Aug 25, 2025 at 10:16:23PM +0800, Yongxing Mou wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> Interface type of MST interfaces is currently INTF_NONE. Update this to
>> INTF_DP. And correct the intf_6 intr_underrun/intr_vsync index for
>> dpu_8_4_sa8775p.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h |  6 +++---
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  | 12 ++++++------
>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h |  6 +++---
> 
> Also, as far as I remember, INTF_3 is not a DP1, but DP0 MST on the following platforms:
> - 4.0, SDM845
> - 5.0, SM8150
> - 5.2, SM7150
> - 5.3, SM6150
> - 6.0, SM8250
> - 7.0, SM8350
> - 8.1, SM8450
> - 9.0, SM8550
> - 9.1, SAR2130P
> - 10.0, SM8650
> 
> Please update them them as a separate patch.
> 
Sure.. thanks for that. i check the HPD, INTF_3 should always being DP0 
MST(if DPU hardware exist INTF_3). will post another patch to fix them.> 
For this patch:
> 
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> 
> 


