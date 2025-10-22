Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E567DBFD8B8
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 19:22:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E078310E816;
	Wed, 22 Oct 2025 17:22:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kV3uDGCk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B4A910E81B
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 17:22:30 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MBwVWY030208
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 17:22:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 voTjpZJScGbpaAh+LIIeJcD5hnR/2l86hSL4gjLUr2g=; b=kV3uDGCkQlEzVfmH
 GHqRMCkeEJVe48Gsl4gm5a1eqh8ZBJRui9LL9BcSW2lMBA842rD9iaXdrX4C8kd4
 J/HXdmG9BK+VWdUWOF+F8c+0CjPKHBMzN8oOZ8/CIreJ/NSwQZGX3ia3gROyB+gy
 W6M2HS+AYRvsDrCxsbLq+YeYoHUNSFI7HfwDAv7Bl4s3L9j9FagqTmr7xWDD4mJc
 JW1ZpehARakuTi15YMcQC8RxiXMV7LyTOeO8TnVKONImo5el6B2r9iAXblNp2twH
 xKGa7WWyjifvzIQjsFhGHCb3MXSQlVSkF9mtRWhlH3aLbwxRyhrYnhy1miW0xcO2
 Y2DZ3g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v2ge5g5r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 17:22:29 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b5529da7771so4268490a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 10:22:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761153748; x=1761758548;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=voTjpZJScGbpaAh+LIIeJcD5hnR/2l86hSL4gjLUr2g=;
 b=oPcAsBA5pGABcwumXUKXm+ztNJazYoPinnb+BzVjmcjg5QD/953fT3wUFYWIwJc4Ew
 IftItSF6eNo0T0WY342aNmoyiDVACmvK6qbcNBEut0jBlhsSdCQo/lQOdQfc8o49zW+6
 vfMZG7RFuUlu0vzO3cbQv3hQHTrjPcovzzNNxP/wzP9VX0X/R7crTU4NU0iyJpNZPtn5
 ZxdP4x86IrYRNa33z5qt+Umme8IsvVttQ3hFjIfivwoGuA3GO8VD27X6M72OUSN/TemC
 /EfqUnf6BNUQq+oxsL57xPX7UGf54slOC4WDKAf/gutZ5SPGir0/sXNSb7XGfvw4+6IL
 z0zA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXzpJ+reO3LZ4gJQ647Ierl8Ui448tbGHY7rnVRlUBLTH3iAcg1PDgjsE/xl0hvsqprW9/WYkTiGbQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyeJHSOdO9QzsOEYuJw8oHLBFICiI6F4+adx4MM29klfUuIvGKO
 a54cgXJ/HliE7gbbAgNqcg3E7++ZWR34hdN12GQhOiLruUmw+Igao41ZcqB8vNXz74v+ygTcmzz
 /4V0tGMogywovv2+z1S+tby5O0OT4I8/UBUkvOq5TwgFwiyGrqPCclHVlYFRjxjUV2FljtSM=
X-Gm-Gg: ASbGnctcTDGAe23CsSsrJb9xNr0qgf/RBE2i8EWSmOyHmUVTksew9WgRyKMNJswYcwJ
 4jzYeMUK1sz7ONuYVlqBPUFALcII3EWAE5el/g3O9szZkt056XH2srRl9Sw5Uc1W9zL0pdxgpBP
 jLXpPCmPhEVgviuOCqxpydAyE17tqpq84wLXlgECR+fHIYnnVxg/xG23U6MAyd84cIe6LqC4/ky
 /xG8rnle7YH/glPdDyfVxUWM3BvYiiidlKSF1w4BZ70OZvHAks5DO+9XJlXH1h1UAMUDupnJTIA
 7kBmS+niP5TkyenV5IoUU/Gm6n+mRjiNkG22wa7DJqFRyiyIZHlhgldeZB2gks/HR3pjoCeNYT2
 YfGwxYkZtgQKr223mObhYOtcyAKv9IDkIh21JhxAXDS55drB5+ZcyFx9bTIJRGA==
X-Received: by 2002:a17:902:d586:b0:269:8072:5be7 with SMTP id
 d9443c01a7336-290cba419dfmr259563965ad.56.1761153748014; 
 Wed, 22 Oct 2025 10:22:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUtnk/zARI/NFYLbVHaAKvyVscRFUT3H0jNKPi1KTDyIE2ZTjtsueDNfbPwZeS9DXYSJYTjQ==
X-Received: by 2002:a17:902:d586:b0:269:8072:5be7 with SMTP id
 d9443c01a7336-290cba419dfmr259563565ad.56.1761153747516; 
 Wed, 22 Oct 2025 10:22:27 -0700 (PDT)
Received: from [192.168.0.43] (ip68-107-70-201.sd.sd.cox.net. [68.107.70.201])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-292ffe67d03sm31383415ad.86.2025.10.22.10.22.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Oct 2025 10:22:27 -0700 (PDT)
Message-ID: <fd95a733-98c5-43d3-afd1-7052be02bcf4@oss.qualcomm.com>
Date: Wed, 22 Oct 2025 10:22:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Fix comment
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
 jeff.hugo@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
 zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251022124107.3712466-1-youssef.abdulrahman@oss.qualcomm.com>
From: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251022124107.3712466-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMCBTYWx0ZWRfX3NR3r+mOi49x
 f8rFrvwd/9si/Jxm/tJvJ1IW7F2nGBqbEeYKc0wMMGn6toVUXWJxAHD8Tx1bc1NkhpDquQTbyQq
 QOXnj8Vju7ctRIuCx2iBSF9HMp0mZLtrwZjROtK70iUtTLOvbyCn0z75WcefNhCxbarfu51T1Po
 G+TKpnmO3I2efKnI35eQFiheUS6UPinM6NtdM2hLCcRJZyKrDg7dAn0AOQktwgv5Owbz4K+eLlC
 h2lfPW2wMPAJE8aPw+qRW16UzpuUM7ZGEe4Vr6exPsqVEO5WWqlwj+CgsabW2knra83g+i1ZTGv
 z1x6g6jg2xdC5EZKCK3uMAiJykj6KLDOZA9g2TEjl/r7tq6bin3SScUI3uqe+sSCsXZJQHZumNM
 Tuv4Z2rA0VngHiPcajqwGkE0kj5IeQ==
X-Authority-Analysis: v=2.4 cv=KqFAGGWN c=1 sm=1 tr=0 ts=68f912d5 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=5tLIbcgRqjftBxpLK6l6Jw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=sS_EF5oJ7B5xURoN_h4A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: Qnf6cotXQktMzYTV-uJSPL3Sk5hbithb
X-Proofpoint-ORIG-GUID: Qnf6cotXQktMzYTV-uJSPL3Sk5hbithb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_07,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180020
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


On 10/22/2025 5:41 AM, Youssef Samir wrote:
> From: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
> 
> Replace the word "Qranium" with "qaic" in the function parameter description.
> 
> Signed-off-by: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
> ---


Reviewed-by: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
