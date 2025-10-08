Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49EDFBC64F5
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 20:35:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 959A510E8C0;
	Wed,  8 Oct 2025 18:35:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="RUFpGBqE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B0F510E8C9
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 18:35:26 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598I5LOh014388
 for <dri-devel@lists.freedesktop.org>; Wed, 8 Oct 2025 18:35:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=xSHZDNSLOzH3MPX1s32+tclJ
 Xc0PAppuSaRFMMxBNWY=; b=RUFpGBqE3Qij+NgJJFT+awiFz7Fzce42vKXIjP7D
 erXIDS3fI8GiNpxbiOhA23cl8TMqy61hIO4lyYX+VzSVHS7agZvkkBmO0jet/qHT
 9a/lqhkUJPUvLABrf7bPx3V5dtOTyqqbamccGhgMCXF8r4XZwuLqKIHt3tmxdZVW
 hhtpx36OTdtmfl0CTz/GKNqGrR8d7sAKu1xHdC5/DrzFXL1smR0/auMwFx6sYMib
 HPUEFIWyHA49mIhLnp3lxOOddHYcRqTiuuIuSuNL3IVhq8dbbSCZBEzi7+STYs0K
 /ybcJsWdhgZJqKdQlBeLVnpNVgT/tqHB8IYdgSQeDneIKw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4u08de-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 18:35:26 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4df7cdf22cbso49094341cf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Oct 2025 11:35:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759948525; x=1760553325;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xSHZDNSLOzH3MPX1s32+tclJXc0PAppuSaRFMMxBNWY=;
 b=V4+35bM/2QAJd8/4UQJjn/83sFr7o5MS46oaUtmQM93Kt9DWKjr3obTFuKH3KzBLLD
 QVghmJi4aMDWFSH6IF0UP+py+tfpzYNRaNi+lY4YbXPGeGaYg64ZsoUI1OZmgvCUuZxd
 gWdLBfydmVclB2AB4LHZ7IYTrUGGLPtXrkRdB9qVtd+cA7eM9wq5S7LBpkKtnpCYkmTo
 35MAqGDvxJiF8PmM0HCqzejO4FxCHXA8oVEfeJZTIMpjeDp1YNy/49W+jQ2IRB4FSoUe
 B4MiLDB2/2Na0L6dTcpiOB7bmFxiBbOoswADVrNIW5Wp9XqAJ7YdXjeQ9clNQ0TnDGLa
 SDFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVVgoiGHhJ7ubPbQrAaso/qaeh/HVUSpTG1vXVy/3IvEVT3oe116Rz0Ni0aOSVU2x2Sak4j1Ypq1W0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/Pc+iK5F15bOX7Q9OkTbT7tfzKAKu/kimLngC+8aKKhaKDdR/
 iQCjXEixLcWQNS2HYYrGERmvm6V4lcftsla1nifAbeY9jm1hlvEz2holQuFlpx+xSjYNUBkm2hD
 fEI0wgo3bC/LZ5Esgm/cuj7TY4T1zTnaupTQLljO3FP+I436bKJOZhdGYDJOSepm2UXh3y4M=
X-Gm-Gg: ASbGncvM55NbkCoMpmVhOgiOFqA/jUA94MhRwXnWvw+98KBjVUgNFtnFqD0FQvNaBPC
 ulkdHPO1rr5ZnpiJmb0/JwtBtwU93gHNgp6kAxGaQ7fyOz8f6UadTIg5lGXcFD2Yrh9wuBsw65y
 pd7vKKbXN/fZ+SxXmwB7v9+xodnekGHfs5J94qAbwXrSVtEb8stuESD3bbBbPeAwD8y4GHp9MH2
 pmp6uYdthiB73XBD/5Le3V7Zr7UBaSmnH9vrogG3PKiZIchi7dXIuUKrHJY2x49I8zzN7P+QgMg
 cRxVYdOC6kyY4fZNcbSfwg1eCaiYwgBvMRkzNZbW2iHJzrr6zxhRX97OhfLpLfGYioxJ5vvHUPh
 BNN2+x+XfBrpQSZqnO2uy51PhYdTcSKZVeRqys34YykbgkJPUPgXzTtYZgw==
X-Received: by 2002:a05:622a:653:b0:4b6:3d70:8810 with SMTP id
 d75a77b69052e-4e6de86a6c6mr102184121cf.22.1759948525209; 
 Wed, 08 Oct 2025 11:35:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+GRyATEZ5xCciBiRuia3BvCYrjaAbKsk7RaZroPM4ffxy90J8k7tUfbYdbiIhdrXen9VAKw==
X-Received: by 2002:a05:622a:653:b0:4b6:3d70:8810 with SMTP id
 d75a77b69052e-4e6de86a6c6mr102183581cf.22.1759948524599; 
 Wed, 08 Oct 2025 11:35:24 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5907ad9dff6sm237523e87.66.2025.10.08.11.35.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Oct 2025 11:35:23 -0700 (PDT)
Date: Wed, 8 Oct 2025 21:35:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 03/16] drm/atomic-helper: Add private_obj reset helper
Message-ID: <vqahipszjixclomlf6zjduy66lvmguv427vhamt2o5kgphwym2@a4vgirwx3rj3>
References: <20251008-drm-private-obj-reset-v1-0-805ab43ae65a@kernel.org>
 <20251008-drm-private-obj-reset-v1-3-805ab43ae65a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251008-drm-private-obj-reset-v1-3-805ab43ae65a@kernel.org>
X-Authority-Analysis: v=2.4 cv=Vrcuwu2n c=1 sm=1 tr=0 ts=68e6aeee cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fayWGQF51Q0vBahr2RsA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 7yEGz-TkdmNuI6TTxMrjLpjjkTFs16gH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX6AVUlteFJjEn
 9Z4REXrkR11TAvtncYlT9wJdhwaaqGP+bjgz2SXOyDLklErLuZbpQx7dl20YCThoqG+ifl92Uxs
 udtTR5F/krtdNw8yN0A+qU4BC2Gemkfivp59f9ytRQiWk9r5/v6QVPRnibmwBxsEp+eVVKo7Qhb
 LYIRoSPA4cEMNybIdVbV81IBVyKRj7Plbcpgy8Fj5QxhkaHClUaQt99fLVTd5f/cpxIYFuH2ltO
 +Qt6D/8+IQhBkFBEdAGot4itrYbTtM7G8ay6JkbtXKQg5EBuqAneKcaj4IT2MFXcMwHH7hTBMoq
 alBLlZ3NTV0aLviX/4pU/wDSseXfY6ee3dNwePVW490k2bZ7CDsxqvcV/4AHUAKXgcYx0bWrGDu
 098Er7NokjnWWUJhZtZa9Cja6COzJw==
X-Proofpoint-ORIG-GUID: 7yEGz-TkdmNuI6TTxMrjLpjjkTFs16gH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 clxscore=1015 adultscore=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
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

On Wed, Oct 08, 2025 at 02:04:01PM +0200, Maxime Ripard wrote:
> Now that we have a reset callback for drm_private_objs, we can provide a
> helper for it.
> 
> It's somewhat different from the other similar helpers though, because
> we definitely expect drm_private_obj to be subclassed. It wouldn't make
> sense for a driver to use it as-is.
> 
> So we can't provide a straight implementation of the reset callback, but
> rather we provide the parts that will deal with the drm_private_obj
> initialization, and we will leave the allocation and initialization of
> the subclass to drivers.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_atomic_state_helper.c | 24 ++++++++++++++++++++++++
>  include/drm/drm_atomic_state_helper.h     |  3 +++
>  2 files changed, 27 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
