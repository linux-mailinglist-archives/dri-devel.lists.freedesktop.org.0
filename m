Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1E8B522E0
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 22:50:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B48310E9DE;
	Wed, 10 Sep 2025 20:50:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="V8F4g2wH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DE7A10E9DE
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 20:50:42 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58AJ6LEB024784
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 20:50:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SPob3xHolBsWwjw80JPpgSx8g/7DdiQrQAaQRydH9WY=; b=V8F4g2wHOl6fj7hm
 4qkm0WgSAHE/uy+VoHAMy+ROcydNcqBvT4x+C9Yh72Xffie0sm184uN4Ug9ByPKp
 w49V8bDrrPxsfEU5i56Y5TvWozYh5TPB27EH6liK2hxR7g5mAg+v5aZduW736bYI
 wIr/qsEkvVLwS8Mz+RSCOGY74+lYogsyqgQe4bjb0v/FEjiJlij3EvHA3kgJcJz+
 2YFK4fRYHUUl9JbnfqlTIa2qZR47WODt6IUbd1s455yVK5fO2zNMv9Szhb0hs+UD
 mOSy7gByFmK08M8G2bI8khzQWVmwiP1iL3C6kUD9wr5J+OV6/mKoL9fQY8DgYWRr
 5WaBfg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493f6h085s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 20:50:41 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-324e41e946eso15648799a91.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Sep 2025 13:50:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757537441; x=1758142241;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SPob3xHolBsWwjw80JPpgSx8g/7DdiQrQAaQRydH9WY=;
 b=SU3uiEal1hCtVzZLe9WNR6dBbNOKlsXSt566WQO1WQBLZ174mB1x8AhX7f91TPctEm
 RyghpgdKiFeYkfyX8EEIZkmAe9l0zbOVNAuTxzExJN79/MTarX4MlyAnJlG7OEmkTsZ7
 ug2WFY1BZmOsQyZFBwrSdfNzbbuNu9E9pfpwBHXOTzSZMk/07suFsXQ0+R6WXV1euzSo
 /EGR3vp5HlMJQB7aLPV8G90CclFYSuW5DiO9So/0aM0x/Ad8WWCDK6ymMnPyTE6xfZSn
 WPTgxtBsQ28cydrMC1zULi6BLY9fHPUNjWCl7gKImNitqGs5OsvRPpjnetpyX/VWA65n
 nHpw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtyOIh1DY9iRfSsdicSALDsvmwZqx0eHwWp+wsb+GNfC/ibAoot+Oz/nsbUZXLUGNhoiuAtFr9y0o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy6eVpUuc5IvtDC1DNuLlNysleqc5Gs0SPMtjtQKqhzSJ0dOtVC
 T+jUXL6QY/PPtd4wi5IX5kBrOgJ9oPQrQu9TJzikOPLBo+uYbIfGtbwgcZrgBp46NS9IN8ucT8E
 LnDL68w58pTFVkMwGQkGOCLNvg2vELY/TKMRngHt6EiKEzfxGxrR5a0ZL16JzjWMd4ufXv60=
X-Gm-Gg: ASbGncvRRt+0rDf7v3YlCE7IrEgC1Vw1t5CXv03lvlNuyTkOcR8ZeBJmj/CCtyjUWH5
 9IFmrbBQjyOINbH7mK/SZ70DV8fSGSr5x614eHSV0kiUdqFEhrIqkGGydW8fy2T0KWRQp1lXFhM
 ePrHCBNAGaxakoWzRePU2JDwdCJqmfbdTv018js56OlsIP5e+sKqjAfV7MLtqCRJRjo5vbi1LOB
 Vmqgk2587Pwqs6k+MWd9F3Jmo0J3l5kV9P/4Faaf1kEl8uKfgrv3DcoCnknAQ9lV3IPv1FK8v5E
 KBjMZThhqWWQiAX9uIyxj7DgjMYbTAJx4eIHYfq2FeCU1dhFH27ww/PhBUV4jckw
X-Received: by 2002:a17:90b:5584:b0:32b:cb05:849a with SMTP id
 98e67ed59e1d1-32d43f936fbmr20933681a91.29.1757537440768; 
 Wed, 10 Sep 2025 13:50:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgJXUpYTL8I7hHNV60o5NvlVmaX9wyglwKhRnYCLq0zaPYXXiRus2xum9n0Qgv2GWgeXlXqQ==
X-Received: by 2002:a17:90b:5584:b0:32b:cb05:849a with SMTP id
 98e67ed59e1d1-32d43f936fbmr20933645a91.29.1757537440323; 
 Wed, 10 Sep 2025 13:50:40 -0700 (PDT)
Received: from [192.168.1.6] ([106.222.234.137])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-32dd62b59ffsm45380a91.7.2025.09.10.13.50.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Sep 2025 13:50:39 -0700 (PDT)
Message-ID: <69af97f2-75bb-494f-a081-cd967c442c15@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 02:20:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] drm/msm: Assorted fixes and changes
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Jonathan Marek
 <jonathan@marek.ca>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250911-assorted-sept-1-v2-0-a8bf1ee20792@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250911-assorted-sept-1-v2-0-a8bf1ee20792@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: SJZsuRUV8YS8XF9nmzATAsJgn2jnk-z4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEwMDE3NyBTYWx0ZWRfX20wBXqMCP4j/
 f+bpPmaCaUHAeBNX8PIQ+MCMFY1I+4Yqe1WBr61hUU+GJpSVjm707DVNT672e3TRXUjQDPC4eaO
 eOPsvMQluWI1cQjNXk+jM1bBkG6BtfnKz6mYrC4+cwfhlrjkTLndKC9HbKosU48Ts4HNVCG1G70
 vE9WH/awG0m+IsUSVdEfCCfG4QivWLK6k+332cnLZKLbXC3lCUvTeun50kEsd1LYiY4seeRHdox
 oSVEb7xHu8ZXCKIoCLukI7UUi6EJgqKz0fVrSUeZ1tL5aGGSSoumAzwjhX4nTVa0PebGWpRBBSH
 pGKGfu3cpyiHdGuRJMLQHcopeuLkyWiMaAqgqK27MwmcexMWM/Jq1PJ4z3sdqqkm0e/8Ghozuqh
 GjIh8AG/
X-Authority-Analysis: v=2.4 cv=WPB/XmsR c=1 sm=1 tr=0 ts=68c1e4a1 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Cna2H39EMVpDwGpHkUETmA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=6_OwgA1yP801watpjiAA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: SJZsuRUV8YS8XF9nmzATAsJgn2jnk-z4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509100177
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

On 9/11/2025 2:14 AM, Akhil P Oommen wrote:
> A few changes and fixes that were lying in my stack.
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
> Changes in v2:
> - EDITME: describe what is new in this series revision.
> - EDITME: use bulletpoints and terse descriptions.

Oops, sent it too soon before updating the changelog:

Changes in v2:
- Update the documentation for DRM_GEM_GPUVA flag (Rob)
- Use parenthesis in Macro definition (Konrad)
- Reworded the comment in acd_probe() (Rob)

-Akhil.

> - Link to v1: https://lore.kernel.org/r/20250902-assorted-sept-1-v1-0-f3ec9baed513@oss.qualcomm.com
> 
> ---
> Akhil P Oommen (4):
>       drm/msm: Fix bootup splat with separate_gpu_drm modparam
>       drm/msm/a6xx: Fix GMU firmware parser
>       drm/msm/adreno: Add a modparam to skip GPU
>       drm/msm/a6xx: Add a comment to acd_probe()
> 
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c      |  9 ++++++++-
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 13 +++++++++++++
>  drivers/gpu/drm/msm/msm_drv.c              |  1 +
>  include/drm/drm_drv.h                      |  3 ++-
>  4 files changed, 24 insertions(+), 2 deletions(-)
> ---
> base-commit: 5cc61f86dff464a63b6a6e4758f26557fda4d494
> change-id: 20250901-assorted-sept-1-5556f15236b8
> 
> Best regards,



