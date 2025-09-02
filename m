Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D548CB400A9
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 14:33:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1275B10E6B0;
	Tue,  2 Sep 2025 12:33:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="JrvnP5+t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 589D310E6B0
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 12:33:11 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582AlB8L020481
 for <dri-devel@lists.freedesktop.org>; Tue, 2 Sep 2025 12:33:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vSvPlAtycm0pq6Ig/4XPFbNEtXJ7S/Va70A53TQ5/A4=; b=JrvnP5+tLTWa98Ty
 yumJjQYn3dO0XnbKa5+FlBG7AHsOP6WEPFza7CP86KjUy292hW/VGjv0Z/fZqNmV
 0rvKK7CR/TlEESvwdAlnMBMpLvMwcjRpD7Dx27zkOSdeD/g4tCnTekR3VhJF7n6H
 VVSf/lt+s7aKADlobM5MeekYXFh/pxhHgUNInvKRdyX3683BFfIBjP5JOCXXMO+n
 ugzYWbBvv8Z+DY8ia+3PXOLCJZebNTnnLi/ahpupXgoNjlRZrt1igtgO2SJfOcoX
 NAt24AC2+I5TYLwb2BwI5xHtH6xdSFQ5f9FWnr32FeXAJ0jkMqe9UGtCdWnKVXmf
 Phq/6A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ur8ryujn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 12:33:10 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4b3387c826eso7436251cf.2
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 05:33:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756816389; x=1757421189;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vSvPlAtycm0pq6Ig/4XPFbNEtXJ7S/Va70A53TQ5/A4=;
 b=N7d1tbSm2sIAGsrh9TB9/8xudNr7Z3iVjnmQ1K2k5RlUJfd0CIjNOEb+bQnpuSUrdo
 Qj578aC9ambjK5sgqIj/EIehGemAhI6mqM0mC1Jot2cuHiT76QOWisQA1AEQ0tEl+ZxM
 4Tq+KZuQzco+VEMBr0vnl6x3nNjkanYL7wsPdOuufJLDxmNBNIQERFiWRkbZpLztWM0t
 HKiuhkKOz6p7a1NASHzxXaEf9loYM93ChE2VCM/KJEScIBvkP8WGd6hOYzNvcreo1mrf
 KUYSnjxcimU+44Fv7bfkHGcluZpWu+TTPfbnOF1NJqHUep5BsNrDYz8Rd5bTfjsIqFA0
 09fg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkiIZHj8IdIy3DDSu4Yvuo3C8tC3llQtBpWVGWi9IieI3pkow4Y9KfXytEzGhaxdDKBp4vdqP2kjo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwewcKCkYXDS5F7LxlRFjRlp+F5lqlrLTEEcECulyy74h4c3zIp
 UDjV12Vkc1nAyR8PuQUATyURpKBi6hHYHV1wktmgWd1dTZOmbOu+yIYwZhodM1C6Dyu/SHiAd3r
 85XC8bDiPNQU/WRbF0tvU8bmytPuflX3dPIRcH5pTp14xYJGrxxOfW6a8s/dBHQhv0HqdFSU=
X-Gm-Gg: ASbGncvmy1BN1ElsTe11s1qMlfvVK8pgH94oHlhrkWbuTEIYo5gG69yWjBEWEqy4+jg
 lEIHNqAN8N8rLNQpVInQlGnA6Fdl/FNttD8d7FM6RSPC+IYlGRg2BbrI1+f7iq4+xaOE4gRlzOX
 semNMBZWk+38XDsXmjPS6YqBoM4cjjITgGpEkQXKeXQcYkyNpNIa+OAonX3Vv3Bmr2J2sfclflv
 ViC2p29WEZN5N3pkpMteWYfy2fuc8Vm2YO67tcY7vJrOP+cq2UZ4zrjeaW2+3mnJzvx39pDwd6e
 5ZFBtAYBVGi2Gxxxr+n008g2ucO3rQe/LCsLaoyMho9WwN6BEKxHRP7fYIHXTNm1jfslyLrrAMm
 Bo9yT6qiGynxmI1CE79xbqQ==
X-Received: by 2002:ac8:5d87:0:b0:4ab:5c58:bb25 with SMTP id
 d75a77b69052e-4b313dd02a0mr101705971cf.1.1756816389221; 
 Tue, 02 Sep 2025 05:33:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFygbSXPmg/W2fjM/6E1xOIRsZDrVD2qEEhASg0Xx0E83kK/rba5OZ+uTMQ8o+BQvRuG1WRPQ==
X-Received: by 2002:ac8:5d87:0:b0:4ab:5c58:bb25 with SMTP id
 d75a77b69052e-4b313dd02a0mr101705591cf.1.1756816388644; 
 Tue, 02 Sep 2025 05:33:08 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b040df6e19fsm723031766b.100.2025.09.02.05.33.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 05:33:08 -0700 (PDT)
Message-ID: <694f0989-64ea-4c3c-8613-863da1dd286a@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 14:33:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] drm/msm/a6xx: Add a comment to acd_probe()
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Jonathan Marek <jonathan@marek.ca>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250902-assorted-sept-1-v1-0-f3ec9baed513@oss.qualcomm.com>
 <20250902-assorted-sept-1-v1-4-f3ec9baed513@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250902-assorted-sept-1-v1-4-f3ec9baed513@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAxOSBTYWx0ZWRfXyvQA97CXh//+
 StHVvfG2ZlMTCUAcMuE6MywIWCukZ7MLDWC54XMg0zfeHxIhzbnIJjy4gcW10sgGELgPF73sVgx
 I5NjOrEXbY/IBEVj+GZLovKurpnfG9ySQv9Gmde+Ydgeifqhad+VzUnp3AMg8c9KU5WZZ5d0S0M
 CekdPW34M2ERT9aq8/eTqoWw3ZolL3WPL1m2L+2eioVzTTH+kk4qUcD+SJos5l7IpNm0LsWX98+
 9aLMZdPxmr+Fn9HEvutuDuERh0h3oyff72mcAmlF7/AxX2nbQVlCJJRvB7VGzTwbxX235CrrwVG
 p2jykcsaESYZseCL0TS1W37j5aMeufJTse0EcWzqSqqMxy8hbfyL7OZ6bdm4nd08+2WduFy2qCK
 kRg9UQjR
X-Proofpoint-GUID: LVpwzHN6jCbG4r7BJ2XgvaaLceraiu_K
X-Proofpoint-ORIG-GUID: LVpwzHN6jCbG4r7BJ2XgvaaLceraiu_K
X-Authority-Analysis: v=2.4 cv=PNkP+eqC c=1 sm=1 tr=0 ts=68b6e406 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=KrKh6rb5Vgb6-fdLxr8A:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300019
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

On 9/2/25 1:50 PM, Akhil P Oommen wrote:
> It is not obvious why we can skip error checking of
> dev_pm_opp_find_freq_exact() API. Add a comment explaining it.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index ea52374c9fcd481d816ed9608e9f6eb1c2e3005a..de8f7051402bf0fd931fc065b5c4c49e2bfd5dc7 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -1694,6 +1694,7 @@ static int a6xx_gmu_acd_probe(struct a6xx_gmu *gmu)
>  		u32 val;
>  
>  		freq = gmu->gpu_freqs[i];
> +		/* This is unlikely to fail because we are passing back a known freq */

This could probably mention that known == we just retrieved it a couple
function calls above, but I suppose the reader can come up with such
conclusions

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
