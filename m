Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDA36C2925C
	for <lists+dri-devel@lfdr.de>; Sun, 02 Nov 2025 17:39:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D19F10E1D1;
	Sun,  2 Nov 2025 16:39:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MofBD+Fv";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hRSNp+A4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7644710E1D8
 for <dri-devel@lists.freedesktop.org>; Sun,  2 Nov 2025 16:39:30 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5A2FuGZx541139
 for <dri-devel@lists.freedesktop.org>; Sun, 2 Nov 2025 16:39:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=Vsudp5PRE81p+UL97II9GrFo
 Q82PxOzVdfpShaNANXY=; b=MofBD+FvgCKPFuq3/UZeyNcPO7m4lbnHivOxOn7h
 /9eQpsVBicILU9Wyi7oVMysvN7k7Mw9FwfT4cK38MU7Xn9j/1v/0p6/Jf6+/PVhO
 gWjMNLjyOeisd7CIbEtHAh3y7coy+AFabvbvPQNy5jnA6RaGEUMgR++iZmAmLSpe
 FcF9U8T7xzAOGwsxol6eOhhJkNqSmZlDbcZrzrZiAZn9Ez/KyqbMLuBybNFobZGt
 AKrAXmbeaQ/JJrjNAqJO71reaAmJEanyzsfP6lFJkKGi84AHIyY/ZHYgjIvjNIlD
 VzG8fDkGWx/j74iJT8C/kUi3FZfSjsTjW7BgeK1e/d4lMA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a57weaht5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Nov 2025 16:39:29 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4ecf8faf8bdso80528651cf.1
 for <dri-devel@lists.freedesktop.org>; Sun, 02 Nov 2025 08:39:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1762101569; x=1762706369;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Vsudp5PRE81p+UL97II9GrFoQ82PxOzVdfpShaNANXY=;
 b=hRSNp+A4rURFK3/QMyUxwEiEjZb04aqoiYUoIhcFDOpeBBIUtDCbEKFKNupBl+WDhe
 ZfUPTWiaDrTjBsZOWSBreKinLG2ysI/X270daDOoR1VyGm5dvTuy3jQhyf9kcxD83p8c
 8zA/anwFgRb88goQuH7KMuJEYw6zqSIfwrjzpoZAWXrdeLTMQM7e7InUOltntsx+s3vV
 nD/BxqXRUBOa4RU9IKUg8q4fA50OKD4Pd6akNYEeSC1vRnwD8lYaTJsUh0bUsJPAYA2o
 weUXYvWUfPod0zUiPoPCWG/N8l4sGFF+Iik3r7ewm+CB5q5iKOmJrrsa25fhTQ8xp3q9
 CQmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762101569; x=1762706369;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vsudp5PRE81p+UL97II9GrFoQ82PxOzVdfpShaNANXY=;
 b=NdqPRRI6d1JBH3fylucR+RwYTVId/kkVRcwPXfUGW4DOHftIamLfl5J8cO0OalWjMQ
 qXDKWI7fG5288YiYnYOawLh/Qbxhhow5AL9V0++CN3iooWx3/f1vtff/smoT21hhk8gQ
 7vW2/ViFEkukWf5bv/UKtlKR/FmnLrt3gNW9QxbuEPtxsdQhFVzdH49sX585mwI2pA/H
 5i4blnZsKgT3/q6bwFLVXogg/TpYfLhWpBc4D8JmPFg/MLzFL0gWAbX8rsb8utKd+W6D
 A1fTDOuC/tAaPtbyq9lPL6PffcEymKplcDwQMHox/D60UqsUw3btRca/HhWhe81tMMGz
 NlfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfSa5L/vu5zBcGoYWwK/ap/+GBwGRQSSmBL9vv1YicRusK5DGq044YAE18bmkhPcXDx3YOYz6Vphw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz6sS3aqddh+D3g7acHeLzDjrRM5bnQGGrFaXK2pUgrIWLZShsP
 FSYzLDrBsOuLzNgCmpTJtN9fC2ymJ1hWOyaEevAoZ4RELoNjAfaWpAoPSSVRW5RVYBNzyefg6Eu
 9XrpBC6fqQoCytFREMII0mMcDyA6CfwAAMEnEhN7p4aI3zivdwzviPlJn0tY7YP3ua+KuMYU=
X-Gm-Gg: ASbGncvRDkBIdCrUCJaUNv4SnFUFqWEcGMLenUkk1+CkETR1NMlj5/3gDpvyCtiM2BW
 62HBh97LuqEZqFm+jEuGUZt8FlTWdG2k1z16G1wIUipCow1xw92Veo84In4fhIBgG/6Z0TdOoh5
 sq2R0ooXD6+RwHrtu20tyDfDnRaiBqtJvckFYtUnn6cOEd3WQaBoQl2IZRD7XRRhkvaodvJNbL5
 a7SAuldVZ58haCOyuPRc3HZYtUgHymZ4AEB32aIX3HhagpJ2gRa1H+46rkqX5sPe3reJH5wDJTf
 V93q9C2PWXoWFTG/6DFtgBjE7v3wPeJApdZmSpCREWBT0GpaVuCCIRn/wJ4iQ8WhOtlyHHYDTOG
 UKOcVfyToCcJ1V+BVhN9WNV+1nA8psTJa9lU7CBA5DwsN5ltyEWKyxVhAH2YjobCWC/mfbKlui2
 zPvWiJ7326WY9o
X-Received: by 2002:a05:622a:834f:b0:4ed:423d:48d4 with SMTP id
 d75a77b69052e-4ed423d4eccmr57411251cf.54.1762101568701; 
 Sun, 02 Nov 2025 08:39:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFBDCWJDKPzqxu7f2En5m/zHiJp5IOVrgHqGPH6qz1rOivQAZXaoWbSK0Fgiw9Mg8qUeB+6cA==
X-Received: by 2002:a05:622a:834f:b0:4ed:423d:48d4 with SMTP id
 d75a77b69052e-4ed423d4eccmr57410861cf.54.1762101568242; 
 Sun, 02 Nov 2025 08:39:28 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-594282be8adsm789469e87.51.2025.11.02.08.39.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Nov 2025 08:39:27 -0800 (PST)
Date: Sun, 2 Nov 2025 18:39:25 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: simona@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, geert@linux-m68k.org,
 tomi.valkeinen@ideasonboard.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, imx@lists.linux.dev,
 linux-samsung-soc@vger.kernel.org, nouveau@lists.freedesktop.org,
 virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-tegra@vger.kernel.org, intel-xe@lists.freedesktop.org,
 xen-devel@lists.xenproject.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [PATCH v6 13/25] drm/msm: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
Message-ID: <vptw5tquup34e3jen62znnw26qe76f3pys4lpsal5g3czwev6y@2q724ibos7by>
References: <20250821081918.79786-1-tzimmermann@suse.de>
 <20250821081918.79786-14-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250821081918.79786-14-tzimmermann@suse.de>
X-Authority-Analysis: v=2.4 cv=M85A6iws c=1 sm=1 tr=0 ts=69078941 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=pGLkceISAAAA:8 a=COk6AnOGAAAA:8 a=tVI0ZWmoAAAA:8
 a=4vBwfh3hQKJL6CJddaEA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22 a=-BPWgnxRz2uhmvdm1NTO:22
X-Proofpoint-ORIG-GUID: qCF8lNpFiAY79RcCzXnzIPlnforlRRG3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAyMDE1NCBTYWx0ZWRfX9D00WeTVo1YY
 W0YhYuG6A8hyja6X4oqnGY9ydyC+iLSeVksMsaFxD3AWbMOS9cjaxi0ln0+okL9usQu2gDakx4S
 6EhCxcQTuLNcuBJNUVD4LYljF//9yncqn9lI18BzU3Dd2Sdc7qorwpzxABSF3v19ALjUPU6GOP0
 nREhdEx7aZcQGrZ1nn9MHXTDmfGGLR30LG6zSnSYqn2GIUJUockUoHDggweT7sfUr9Gw2EurbGv
 /KmHSG+2mDD8aDCPptRPGIbkgx1XjChaWNPwOn7FexHQbDCsKkFsZfuERJK9p4b0LKBcSUmSp/q
 KqRV644q1n6jJqb1LhVWPHzxPsCp5eh/GwPKw11Jo3lU6bP5A7bAXchMEIO6IDsWAG0Lp+6Ng4P
 1hVcMaidinCisVvbdoVIFpCGTYbWrA==
X-Proofpoint-GUID: qCF8lNpFiAY79RcCzXnzIPlnforlRRG3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-02_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511020154
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

On Thu, Aug 21, 2025 at 10:17:20AM +0200, Thomas Zimmermann wrote:
> Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch
> and buffer size. Alignment is specified in bytes, but the hardware
> requires the scanline pitch to be a multiple of 32 pixels. Therefore
> compute the byte size of 32 pixels in the given color mode and align
> the pitch accordingly. This replaces the existing code in the driver's
> align_pitch() helper.
> 
> v3:
> - clarify pitch alignment in commit message (Dmitry)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/gpu/drm/msm/msm_gem.c | 27 +++++++++++++++++++++++++--
>  1 file changed, 25 insertions(+), 2 deletions(-)
> 

This broke kms_getfb@getfb-reject-nv12 and kms_getfb@getfb2-accept-nv12
IGT tests. I'll submit a fix separately.

-- 
With best wishes
Dmitry
