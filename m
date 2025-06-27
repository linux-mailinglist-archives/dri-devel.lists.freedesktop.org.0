Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C019AEB77C
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 14:17:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F05410E9DD;
	Fri, 27 Jun 2025 12:17:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="j2mYc7i4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7831F10E9DD
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 12:17:49 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RC1nO8029995
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 12:17:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 QJ19J1LIBwAi1TN0tW2T4j6V8Ae2MTfdTDqckVMIpqg=; b=j2mYc7i4EvQ/nNkj
 aRo4PcxFrCba/VMkMsNwtWEc1u7WDv2paXrJLHlMPWOXmKt5lkU69Ll8yhYF9mu+
 R50p/AC9BRl6XeBaPLJ6WB2jehuJ3OiWdg6bI8E91DhsXP/i6WMB4b78856mlfb1
 WhtGCij4FlPhdCMz3VyzukA0zdp2RD7RH2s1xjulgPjyMJeAsuC4hhCFKNVVfV7Q
 xX90rvmVEzdrqoPKz4IGD3Qfo2VvYsVXW2azychnvYX7LxGalFPnmiqAuoE4nZwT
 AHZLAhVABcIrepqEhQPrBWMWkvWzyNtNXuot46uAzccaF7banUZ4dJVR8l+GyWHx
 IsOIjw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47hkpbhet4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 12:17:47 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6fd1dcf1c5bso4127776d6.3
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 05:17:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751026667; x=1751631467;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QJ19J1LIBwAi1TN0tW2T4j6V8Ae2MTfdTDqckVMIpqg=;
 b=hbHOKJ2Jo8CIdVg7jdQd78Ed0axLr8XuhUPNOPpx0Oa/1QChvUWgz//9dQcPrxoCUz
 UsKzs2NgQtN/EzYK6o/xcu8BrhSuDIyw3u11NBNv7Tkrx9LCQFhBYLVBXD4DCPpDr2Gb
 Jc2neE/93nSN8/0H2Zrne3l7JNKpBWEPLTiGd9aNzryzT+NXqSzjHlvCY8vOo+Jny8jq
 RwZ2/bCAwsZjLAqqz9HWKQEwmb4Hje+SdfBHv63uzsP0G533OyzYH9wWluK4FgEL0vB/
 JL+3oVNBYb/g9COBTDqSCa/LgkKD4abjF400DTpty6MgV9z5Z/U3Bhbzx+jbEhc0EmJ1
 y6Ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCUqRwhkrg8IlkwoOpfnConL7LVlK/4Zo01osbqtvmOqma6SzYo67a3gYYSMuwNg6+KN/n9IKeH/eu8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJ5dJRS4TdBQcmri7PnnDvMZSPmzK9AzMBh2k/74dL6ppohbwZ
 I9t1XdEirCa9ucwshinTk9i9P21T6YM6iXOIIrkRwp+uSUXRLytiyMNBxT3k5oJjgRIMC3bToeU
 GnAUMY6MX+1wsPYnF3cpBWG4NcNp5Zvn+SBwM6i7HFGfELw39FKbVKaYMY0wo201JZzEm0EA=
X-Gm-Gg: ASbGncu5muC3OG7CN0tYGDzgLEMZm5j/Y5UEKywl0OhrEcKWOTQciug2muKkA15JRGh
 DQ9oKihLeu5qjSmjEg69d4DMB71xE2KFdyxxyjq8B5P3Q26iKfXBWYjn57KSBSbsvzRNklSMOCy
 bPiCSbn6smgGYqifpaFu0WagdpH9IQq4R78ypHbNp+2+TAenUE82qa3qyLypC7t9PgyjWdLvWJ1
 rJvTBqLO8uTv1JGBcr9J4CtyVKFH42BkxRt8kIdnWjC1LVlkUiVijPWHJVS/38fPFNl/S5S+0BD
 rsRc3gbcsGZXfysw+rDGgzcLOWRzwXHpgXn4v6tMyKQ68pjLVVy1hdMosVhCxvCC9H2kP2Kv8co
 E6Zw=
X-Received: by 2002:a05:620a:198a:b0:7d3:c69e:267 with SMTP id
 af79cd13be357-7d44394f337mr156191085a.12.1751026666699; 
 Fri, 27 Jun 2025 05:17:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIK9htb9TjdDdSp1TC694025TRJoUgCOt8XrvN3XdaNpk29pDfLu1EUHUVl+ULYjW5QjCFLw==
X-Received: by 2002:a05:620a:198a:b0:7d3:c69e:267 with SMTP id
 af79cd13be357-7d44394f337mr156188785a.12.1751026666346; 
 Fri, 27 Jun 2025 05:17:46 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae353ca205dsm113371766b.160.2025.06.27.05.17.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jun 2025 05:17:45 -0700 (PDT)
Message-ID: <3f2279ce-7d4c-4ea7-8d3d-ba98208e212f@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 14:17:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] arm64: dts: qcom: sa8775p: add GDSP
 fastrpc-compute-cb nodes
To: Ling Xu <quic_lxu5@quicinc.com>, srini@kernel.org,
 amahesh@qti.qualcomm.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
 arnd@arndb.de, gregkh@linuxfoundation.org
Cc: quic_kuiw@quicinc.com, ekansh.gupta@oss.qualcomm.com,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250627103319.2883613-1-quic_lxu5@quicinc.com>
 <20250627103319.2883613-3-quic_lxu5@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250627103319.2883613-3-quic_lxu5@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDEwMSBTYWx0ZWRfX2pJBLg9b2RVG
 iISOiyKEFUQTaF/YQotIP1b2rDIk64P19ocSJC4dGDt0Iox3vZrzEFFcu//A7rOIZk1gY61E0fK
 zg4VQzxl+1xuhXynQgopkEgoFz79F+NFBOYXBNHnII8a+1z7xjO9UWp2LwfFiyF49jrYR3MOoKW
 BGE1qiVqbhMtQwvh6W8/+LF2c80VnLJNHlVH0NwvoIy2G3E3w8DEpavTDjIylEzy84my7qs+YL4
 leruy6/kGM6OKbf/bVE27KJPBWO0SeRvcr4SGlHG9aXXR4HZ1d9zSUdzQmXYyHuJ0VwYdCGVoFz
 C9KNtgvRg624ZyMF2HiRYz83368ju1kH6YAu2hiylkV50PjZsYLnK1qpVtSzqfYXUxjNouh45Vx
 1nfZXZa8SKZ1PWJWcMriqz/oN9wYT9MTRXlOH13OmlNQQho2M4YAr3Q9wd+Y02SvGqRLmdfk
X-Proofpoint-GUID: 0h_aTF6Vv6E2DiKyehpqu97-stggrI-s
X-Authority-Analysis: v=2.4 cv=AY2xH2XG c=1 sm=1 tr=0 ts=685e8beb cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=iYJyFzv8ufejENf4NzsA:9 a=QEXdDO2ut3YA:10 a=pMdvUiCErLUA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 0h_aTF6Vv6E2DiKyehpqu97-stggrI-s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_04,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=859 phishscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 adultscore=0 impostorscore=0
 clxscore=1015 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270101
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

On 6/27/25 12:33 PM, Ling Xu wrote:
> Add GDSP0 and GDSP1 fastrpc compute-cb nodes for sa8775p SoC.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Ling Xu <quic_lxu5@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
