Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3059CDB7F1
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 07:30:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06DF410E08D;
	Wed, 24 Dec 2025 06:30:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XrDFoehr";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jq6LR5vD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E11510E08D
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 06:30:43 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BNNjtu11924369
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 06:30:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=2YjurWD8jh8UqL9X0F1WKQTe
 /Sb7eB2QeGBD5SBBMi4=; b=XrDFoehrzciAgNzkDzThZtCrvgFQ/QAl79gnSPO2
 D5uKOt92DLBoGZ2Xt+Ttz1rUtFzEZYJy0xwTYSjvyXuw2LD4BNkj2w45mWzqVX6q
 JbftIL3H2Cjw8VWn9g8jod0eLhc4luczrqjH355srPEhLeZ3Hpl4kRrUBgo/kxjp
 EgBx6JD5BLO4MehVoRoBOGac9La2/273gDxnpDjP8n1ST7cVw36/0BZt4ERP87s1
 ITE+0KSBk+ApXq8VJqXkSP3RBgWRBgfll+bi1IZCsxL6afaZaXTtDlBfUqTU6Bvs
 VB975/nV2WuXfsDS4lpMBZPg40Np4ggN2pxm8KjizhS9tg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7xjsa0c1-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 06:30:43 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4edb6a94873so110600001cf.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Dec 2025 22:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766557842; x=1767162642;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=2YjurWD8jh8UqL9X0F1WKQTe/Sb7eB2QeGBD5SBBMi4=;
 b=Jq6LR5vDckGvxtuatZLUT511wsjzhpEg5IyFS9U23brKFO4ICfITiX5F3kZbV7PZpZ
 GsCD9J3y4hXDivUbK8Hk4FaWYiJs/NyOnvLWUflcCzNS0RKBpc+LMxRpIL+zG5nCBGsj
 rkBokFXFsPdm1+9KQjFqbNE7G+/6uBnTkiZzgmKbRQSc340KZwNIMzdB4+P975RQDC/k
 S+70azzY8me9EYveBZ7Bj4t9oJL1x3ChgawCXH0N4wkH47TEmnZl/y+0N+HZrtxQPBrf
 Z77UI20k999ds5JiTYn7d1mklOgM7Rl4fShz8JWXJ2N+tSj97ptdVKuneszNRTqXVyuL
 9VEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766557842; x=1767162642;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2YjurWD8jh8UqL9X0F1WKQTe/Sb7eB2QeGBD5SBBMi4=;
 b=ftOLsTeRK9z7A+0z72zC7XjpngZyd2MCFb7+KOWaIZTgckEcaOfPY9j5FvdqtH//vQ
 ersQmW/Ll9LXmQiHGlXuA1VosNor/to9pUcxUm9+0eZZ3bSpRbVsaj+dJR8Kl2BHhXm3
 fx2ik0FVSGCH5DBV66GpABdEf8hhQ12eJaEzacEgKVHJ+eIo5DiKeOz8KlJZWAgvEGMy
 TnUllycQL91+x+B3S4U0I7SyQfk5mfh/D9uNailWEybWWbHUqZpk7Nllzg+Qv/bRDCO6
 Nu1K1JOsipga04TJ0Rksrwvy4PnzFx0/NzbGsm5ajxN+oHYCwFSjV044FYqSRjrotSlZ
 2bIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJesQXFTwxPsLLeq6lSGsNCvrJOdgm8BTVTUM4GKEip/iSLdptpuLMRxFkiJV65/CjdxBo/kgHZ7I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz/i/797l7I5IKVLiS9UxIK5bUwL0thUr62Kc8FspzluUhjH6xn
 oaiLuKDG3oKWza8KGStDTfc7u8XG/N3yAKd24V9DKWhNyteRXkAY/2ckNPAUoXF+A5jz3oxXv1e
 b+MY0ZwDvkD134sT4e0g9JVQCYPcgSRpEf2+zY+P3lC2zKEbFEtFYYtlMKH5RK3XRPGM0KeA=
X-Gm-Gg: AY/fxX5yZChvFap00tG2+axujcpnEhc+uL7JDRtrlEXCurGXxt6nDsj891buoN4lIIP
 +uAWezXnXAU9vtbBQ9QkwCZ2H0lCfRdnnY0T2o5PzvlKyq3rc0YL97Hagi0UX9unGV21hpjYWQk
 O8TfU4NIuUMdC8fRa4nln35FIoNpkVFBB+DYI1aMaOSpWvY/kqSrhvrJR9IvT/HY1PVZLBR2RJQ
 hl1sM9KcMWtVX1/EJccBtDFjkU61NuhCafA30E6mOjo7WQrU5VAG1Grv10Veb4Dj01W2B8OXiHW
 +tZ5IZp2bKaTwEJLbPyflRcozUNBkZv0h9dMv4zK865f7+n+uQry0SDW1xzQdXTt8kLcl2Fu2qj
 0docbchzv5Ee8O4mE6Jx6upSrHbuAoo2kwtdgXf+9dp5/g4b0rKfOGynTfeimNgPhIYKeM7z3KG
 cS3WUaLVnsVsIkExIQ44baOzk=
X-Received: by 2002:a05:622a:98f:b0:4f1:be95:5a4c with SMTP id
 d75a77b69052e-4f4abdbe4c5mr271859971cf.63.1766557842496; 
 Tue, 23 Dec 2025 22:30:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFs8OTLRrX7w+WgO9mKTBEV/5O6XcUqQZtImlGkrnAnKULcRdKtjdo/2z5FmNuRMxsq5DzMQg==
X-Received: by 2002:a05:622a:98f:b0:4f1:be95:5a4c with SMTP id
 d75a77b69052e-4f4abdbe4c5mr271859751cf.63.1766557842139; 
 Tue, 23 Dec 2025 22:30:42 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a185dd7c8sm4580330e87.26.2025.12.23.22.30.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Dec 2025 22:30:41 -0800 (PST)
Date: Wed, 24 Dec 2025 08:30:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nikolay Kuratov <kniv@yandex-team.ru>
Cc: linux-kernel@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>, Jessica Zhang <jesszhan0024@gmail.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, stable@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Add missing NULL pointer check for pingpong
 interface
Message-ID: <bphspkokcyfzd4v3sqdkq2xwyfahoi45zxcdhugewuxzaymgsl@wkpbbbdcm4x7>
References: <20251211093630.171014-1-kniv@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211093630.171014-1-kniv@yandex-team.ru>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA1MyBTYWx0ZWRfX8WOvb3o4xcNj
 Q3iuTHl+K1Aoan6yfAkzu1+6SxZ7dz3jw2Yk4VLPng2oetyViLz/sbUpJHuVz06BIHVefKjAT4Q
 KK4EL6GdHzAF4B7M9JM3Y26Ik+VkkEltCV8Xu6bhNDcf4WrS5j/kEYPcnIV+idysCrWF/iXdDMM
 lRfG+bcq5wMmkKe7WlGxuSzb5rx3wv07qRlWnysBsJYVA/ks3l8W1LTSRRkVzJbbKR74OZmiCYo
 J+uFN4fHO98sUt/LrJiVTpmwaVPcB/WwLSgzwxKPDsL/u5sjljvIPStOZdn5y2rACzpgLHYNHOV
 S+UFur1xBhcZoLqer2AqKpuVUljMzrOM6iPxZbAzckv282Ux//aUlGhhW+RGbi/AWO27ig8VgEE
 83d3h+HDwM2bV/08729sXJiNYWdfUo20bDfH8lu76raWf4ZoZFCX8kL72iFSZz+AHo7NQCHmgnx
 thy3WScp4hoLvYWzm8g==
X-Proofpoint-ORIG-GUID: jF2DeorTJUKvsdLJi0gcr4tdyvLLTeHu
X-Authority-Analysis: v=2.4 cv=YcqwJgRf c=1 sm=1 tr=0 ts=694b8893 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=6R7veym_AAAA:8 a=EUspDBNiAAAA:8 a=q4VHR2A0D8CO_ZJfzXEA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=ILCOIF4F_8SzUMnO7jNM:22
X-Proofpoint-GUID: jF2DeorTJUKvsdLJi0gcr4tdyvLLTeHu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240053
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

On Thu, Dec 11, 2025 at 12:36:30PM +0300, Nikolay Kuratov wrote:
> It is checked almost always in dpu_encoder_phys_wb_setup_ctl(), but in a
> single place the check is missing.
> Also use convenient locals instead of phys_enc->* where available.
> 
> Cc: stable@vger.kernel.org
> Fixes: d7d0e73f7de33 ("drm/msm/dpu: introduce the dpu_encoder_phys_* for writeback")
> Signed-off-by: Nikolay Kuratov <kniv@yandex-team.ru>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
