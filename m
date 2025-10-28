Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D5EC16EF2
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 22:23:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B4DB10E667;
	Tue, 28 Oct 2025 21:23:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="G7nBaMX2";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OKdBPkeC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7734C10E666
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 21:23:43 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59SJlNk22502832
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 21:23:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7WqiEnjAgMfmsuJ0ixstPssdOKbvkewqIqpstd+r89s=; b=G7nBaMX2wopTqieT
 FOuyo9eyoR2LoFSFbXdxnJSnyIK/gpHEg0nKoO8jmyBe2pEvVkBYmhBo5bd8vMg8
 srXwJ9KT7g1LW1oWa2JfIcip74CVBe6NhZ1PH1SywrMmz6sN+8MaLUH8J0Z3S19b
 vqSIboFmODQRGPBMXEo6hWW1N+bfyLZKP08rHjCvkkRsp5jaIrsIK9VZHy6a6HKk
 AJ7DrYyPJOGUZZnywXiLqhyeCVokPe/+P5zcOx8UJ0tBgUu9Emm+EVHhIdFKPIHP
 AtQ5lzY3Z9c8XzMd3OtsN9+HX+wq6tdFYSnjTGlmYEManY6r5bgK0zYqjT76F36W
 c2y2+Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a34a1g735-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 21:23:42 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4eceefa36d0so107097181cf.1
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 14:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1761686622; x=1762291422;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=7WqiEnjAgMfmsuJ0ixstPssdOKbvkewqIqpstd+r89s=;
 b=OKdBPkeCb6Qg0szW62N7PcKcAofYH1k794jjzL7zH4nVTq/jqZpQy0YjsIqAmjVKtm
 u5V2ZaSzrWjqyVWMmeOnRvdQukT9j4wh/7sVp82fwlp/YV8STgrMC3eEJ+UHBlPkVGCQ
 QQL93su+byZN0iJ9n9OcMhHPsXqQl+AXTejsuKEYvk85i6uTQdNrxrh0+7zw7ZokrIMT
 fKXBkj14UReTR9xVlCtPL04SDIW2Bh5Dm/mD5SxeShLppGkqIKSOM5uKrVKzhz58xiDo
 Er9mc7v3+DUCiRZ0UDp6yO69ET4W6BJn+z7ZLbsz5szuzvOoybaYJ68KUxOutIgqKsdR
 fXaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761686622; x=1762291422;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7WqiEnjAgMfmsuJ0ixstPssdOKbvkewqIqpstd+r89s=;
 b=M8TkshyUJXRbS9O5vJsHB/nLpWH9Fn6H8NxClBMBvsEi0iXVztadKgo4zvOa41GQRG
 2B3anY5a4WpzCWo1MiSajU8ne0WHm9/Z4fM4hTmF5H+BldEmlXvQmUpWE8zNTKXXr/3/
 boBQ2ui+dBIMZJxKmXsIav22u3224PL7Zs/9q/vUfG+iCTBQupznH9pBnJa0uWmFDk3E
 1KWrYV3mV8gRpRqafQX+yFGaYjjNAjiCe6suqCyFvdY2EfMIA6kkgNc6KurP4anSciC1
 GXBMDGPWWEJQR51Y10BqBZL7BvPFkL69/m6tIApe3tfjkuNLkjMui/5H2BobzIfTrkZ8
 bVkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGzpCQV6DTnaQNWSGuEcAO6lb34+1uRB6MukAHnAM7EzKF9stjQc9GHOZoP9kKrw+BP0My0C+X2NY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyETtrLHieElxI15AzRrA8tzFvXpcC8SSjCoI+h45byl5/KREDE
 xodOj0ajRhwHIv7dI3m04eHd9GfGHYg02fT1ofkDUkhOXPzOUaH0MgJYG0hKqauJpSnNQEyUmSG
 E4e9SYU4j/GERbDmCDGmtQbFqkXGk1Ob1j9ilEjUk6nAvOqQDpxaXqSD9lapfTli745P32rI=
X-Gm-Gg: ASbGnctX2SAv5Eda3aGeJYUvdcuQbGdXRA9AzMu7IA9riPJ8MrjzYMintUTKOaB0X93
 ZNdYWCXYEcwUvna2XSaJ+WCWdfIrYaUxskWdb7uiRtiZznyhb1ZFh/954lZGzTBnD4wU6FYsEcm
 Emk4ZBW881hlp46J0IvZ7ox964Gd8bKSMEoa7j7DzTaY7KkW08nguAx4ikrvE6+M0unhcAxBmBe
 cY5fJ9UYrp4gEqcoSzlN7vCWjESm5CkEIZoOr8JzOrfYDhgYZ0Yzwb5MLCX+NWnAVS2h2JTD5Ed
 xEF/9UTrP+rFnM+XMSs24wd26R40zptcRfiwdk935V4cPRNkf+oTUm4QATz8ltvhzhgfywZhNAi
 OSFr+YKEQCRQKowwb95EUafqEQ6jiySbAuPwe+4P8s2Vu2mWYUI19oA8i6RwDgTCE4fs4A7n0Aj
 dLXR21ZHXa2OJv
X-Received: by 2002:a05:622a:4a13:b0:4e8:afdb:6f56 with SMTP id
 d75a77b69052e-4ed15c4caa1mr10464061cf.74.1761686621624; 
 Tue, 28 Oct 2025 14:23:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIxBrdIO7mfWQKtvDvRPRtB9L8H/kLm56MKcuYi7AAbrvZ0yHrj06ejtcwIC3X95uJDXxrIg==
X-Received: by 2002:a05:622a:4a13:b0:4e8:afdb:6f56 with SMTP id
 d75a77b69052e-4ed15c4caa1mr10463691cf.74.1761686621070; 
 Tue, 28 Oct 2025 14:23:41 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59301f749easm3402826e87.89.2025.10.28.14.23.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Oct 2025 14:23:40 -0700 (PDT)
Date: Tue, 28 Oct 2025 23:23:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: federico@izzo.pro
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 nicola@corna.info, David Heidelberg <david@ixit.cz>,
 Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>
Subject: Re: [PATCH v3] drm/msm/dpu: Add DSPP GC driver to provide GAMMA_LUT
 DRM property
Message-ID: <gmk7aho74xb2wwlc27t6qaozfnqsjjyccmzm5moe53tyzuwm4o@ri7cfoqz23ks>
References: <20251019-dpu-add-dspp-gc-driver-v3-1-840491934e56@izzo.pro>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251019-dpu-add-dspp-gc-driver-v3-1-840491934e56@izzo.pro>
X-Authority-Analysis: v=2.4 cv=dbiNHHXe c=1 sm=1 tr=0 ts=6901345e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=p0WdMEafAAAA:8 a=VwQbUJbxAAAA:8 a=ze386MxoAAAA:8 a=EUspDBNiAAAA:8
 a=WrUPyqytC3nuxuxCNLkA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=iBZjaW-pnkserzjvUTHh:22 a=poXaRoVlC6wW9_mwW8W4:22
 a=pHzHmUro8NiASowvMSCR:22 a=n87TN5wuljxrRezIQYnT:22
X-Proofpoint-ORIG-GUID: -y6iLmI15kLxgio7ZUECb3jWt_W_NgTU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE4MCBTYWx0ZWRfXz13s6sk7N2bg
 JBf/mSQ5dZekBBpc5i8H0fEKq8MaPU85coHv00uteTrjXuAX+jnYUS97UYxsKQ68EeuogCC7uaV
 Z3ud3UZDK4C2cjXj10kuRBtndxI5I/d8QLINmv7lEUk4K5lvUp+cNc5eN0nhJItyTgRKIXE6uND
 hR26YihMw6kPKzHfOqFtH84plH2/6RvyfRtE5nzaF4jiHTWJDPyR23eiQETNQ4tR2kCHnswovkN
 PrYPxb9yweRsRMvo8tiWuV1+2U24hhm8VTflrQP7DtXc1Ce2IpsONqR2S56soGKLADwg8xwAd8Z
 UXKmGXDWuDQKv3qgPBY9UQLrGnDhjVQbJ16RbG40ilB5FNeR2ASYNi7TwKtdi7F8fM1g7B5ZLzE
 eX8U2x2BfRQ+IzL4ADDM/rFiv9ZoOA==
X-Proofpoint-GUID: -y6iLmI15kLxgio7ZUECb3jWt_W_NgTU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510280180
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

On Sun, Oct 19, 2025 at 12:06:32PM +0200, Federico Amedeo Izzo via B4 Relay wrote:
> From: Federico Amedeo Izzo <federico@izzo.pro>
> 
> Add support for DSPP GC block in DPU driver for Qualcomm SoCs.
> Expose the GAMMA_LUT DRM property, which is needed to enable
> night light and basic screen color calibration.
> 
> I used LineageOS downstream kernel as a reference and found the LUT
> format by trial-and-error on OnePlus 6.
> 
> Tested on oneplus-enchilada (sdm845-mainline 6.16-dev) and xiaomi-tissot
> (msm8953-mainline 6.12/main).
> 
> Tested-by: David Heidelberg <david@ixit.cz>  # Pixel 3 (next-20251018)
> Tested-by: Guido Günther <agx@sigxcpu.org> # on sdm845-shift-axolotl
> Signed-off-by: Federico Amedeo Izzo <federico@izzo.pro>
> ---
> DRM GAMMA_LUT support was missing on sdm845 and other Qualcomm SoCs using
> DPU for CRTC. This is needed in userspace to enable features like Night
> Light or basic color calibration.
> 
> I wrote this driver to enable Night Light on OnePlus 6, and after the
> driver was working I found out it applies to the 29 different Qualcomm SoCs
> that use the DPU display engine, including X1E for laptops.
> 
> I used the LineageOS downstream kernel as reference and found the correct 
> LUT format by trial-and-error on OnePlus 6.
> 
> This was my first Linux driver and it's been a great learning
> experience.
> 
> The patch was reviewed by postmarketOS contributors here: 
> https://gitlab.com/sdm845-mainline/linux/-/merge_requests/137
> During review the patch was tested successfully on hamoa (X1E).
> ---
> Changes in v3:
> - Remove memset() after kzalloc() in dpu_crtc.c
> - Simplify error messages in dpu_crtc.c and dpu_hw_dspp.c
> - Use 0 for DPU_REG_WRITE() instead of reg = 0 in dpu_hw_dspp.c
> - Link to v2: https://lore.kernel.org/r/20251019-dpu-add-dspp-gc-driver-v2-1-30c8cb79cb17@izzo.pro
> 
> Changes in v2:
> - Fix gc register .len and .version in dpu_hw_catalog.c
> - Apply coding style suggestions
> - Link to v1: https://lore.kernel.org/r/20251018-dpu-add-dspp-gc-driver-v1-1-ed0369214252@izzo.pro
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c       | 86 +++++++++++++++++++++-----
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  4 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  4 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c     |  3 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c    | 54 ++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h    | 26 ++++++++
>  6 files changed, 163 insertions(+), 14 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
