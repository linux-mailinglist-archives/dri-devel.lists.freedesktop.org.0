Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F3924835C
	for <lists+dri-devel@lfdr.de>; Tue, 18 Aug 2020 12:51:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 625F7899A5;
	Tue, 18 Aug 2020 10:51:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37599899A5
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Aug 2020 10:51:35 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id E132420024;
 Tue, 18 Aug 2020 12:51:29 +0200 (CEST)
Date: Tue, 18 Aug 2020 12:51:27 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Tian Tao <tiantao6@hisilicon.com>
Subject: Re: [PATCH drm/hisilicon 0/4] Use drv_err instead of DRM_ERROR in
 hibmc driver
Message-ID: <20200818105127.GA2017472@ravnborg.org>
References: <1597733504-30812-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1597733504-30812-1-git-send-email-tiantao6@hisilicon.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=f+hm+t6M c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=e5mUnYsNAAAA:8 a=p9VVrILX5DuZkMnRgawA:9
 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linuxarm@huawei.com, xinliang.liu@linaro.org,
 kraxel@redhat.com, tzimmermann@suse.de, alexander.deucher@amd.com,
 tglx@linutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 18, 2020 at 02:51:40PM +0800, Tian Tao wrote:
> patch #1 is using the drv_err instead of DRM_ERROR in hibmc_ttm.c
> patch #2 is using the drv_err instead of DRM_ERROR in hibmc_drm_vdac.c
> patch #3 is using the drv_err and drm_dbg_atomic  instead of DRM_ERROR
> and DRM_DEBUG_ATOMIC  in hibmc_drm_de.c
> patch #4 is using the drv_err and drm_warn instead of DRM_ERROR and
> DRM_WARN in hibmc_drm_drv.c
> 
> Tian Tao (4):
>   drm/hisilicon: Use drv_err instead of DRM_ERROR in hibmc_ttm
>   drm/hisilicon: Use drv_err instead of DRM_ERROR in hibmc_drm_vdac
>   drm/hisilicon: Use drv_err instead of DRM_ERROR in hibmc_drm_de
>   drm/hisilicon: Use drv_err instead of DRM_ERROR in hibmc_drm_drv

Hi Tian.

Code looks fine, but subjects says "drv_err", where code uses "drm_err".
This confused me, mind fixing the $subject before applying

	Sam

> 
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_de.c   | 14 +++++++-------
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c  | 24 ++++++++++++------------
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_vdac.c |  4 ++--
>  drivers/gpu/drm/hisilicon/hibmc/hibmc_ttm.c      |  2 +-
>  4 files changed, 22 insertions(+), 22 deletions(-)
> 
> -- 
> 2.7.4
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
