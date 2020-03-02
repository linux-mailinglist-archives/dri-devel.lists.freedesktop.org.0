Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D500C17662B
	for <lists+dri-devel@lfdr.de>; Mon,  2 Mar 2020 22:41:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 009C889C46;
	Mon,  2 Mar 2020 21:41:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8792F89C46;
 Mon,  2 Mar 2020 21:41:19 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id v4so1718215wrs.8;
 Mon, 02 Mar 2020 13:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ugtzqTmjkrOuYqOizL3eqLFHBvOrFYDyXjGV8kdq5tQ=;
 b=varMi/O7TXID2SN3rVr2GSnfoTWc4BxGbNIyUa3MLpZBbUFH4QjbH8XQA5J36HPzuQ
 YoZkkKNf0Hhh9mwaMMGU/N/ar1hKzOpP6W93hdel4BCCfBk5lN4OGzw0jchNMlSWqRgN
 IlFlRtqfxjbtUpFJvg4N2s/6JK3LV3fusp9FL5GcBaD5NCYu43kUOCtjfUeJsL6qJAYj
 5XMXyvwB4XhD0DDiKvrpHAgcsEza1ZcsZtWViuLCLUPd69/cYG3uYCqlCvPISeGsrUsF
 WsSOW1Ojmbex68bLDQutL18BH4cGnkehJ+8LNrKNqSqarQN4qTgwYCKX7d9CSx69pk04
 Hm7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ugtzqTmjkrOuYqOizL3eqLFHBvOrFYDyXjGV8kdq5tQ=;
 b=cRSvACTJbtaprFUFhQk2PI0ry+fGzsv6UhewDZkxpGLatC2Ty9HPPplmv503sx141l
 U0AT6s6fRKmNX1QNp38aFL9K+p203dyRkVolwdvOXKB/YY3It0KEpvVbFWl1Dg7q6Wa0
 +GZ7ge3OzFNjOJk4D2nqpu47IHxOMsXR4QyFcmLTBWwA/Cj1GuLfgWV2L7omMKENRCdX
 Mu0d10Tnm2/DSgCzQ4K+OJQYac+KUL3uKB0XR4HF8u13uKAO0QXxSS2BI5+Q3YRT66nk
 2eFpbVRS5Cb+LgseQQgx0kFMNLcXwnwwA5CB+y4zLNkxmA4G2zNwfGbkMYeVh4SSYvkT
 fF5w==
X-Gm-Message-State: ANhLgQ3tV1NMJTLm2m/RDyLtVdURAKwAvmMQyiFqPe8ZO6iyPqOwcEOu
 MSRBiqmkSriXjZfJZB15jEzvqUygAS6OQOz/iVE=
X-Google-Smtp-Source: ADFU+vvyqTHghCxiZ2fR+MymbTcfdnXWvm8jfNy3R7c6M476skPmpyIvvuRUJOpoW0lUn0h5OdUxOTg6T69Il5GG8I4=
X-Received: by 2002:adf:9282:: with SMTP id 2mr1584980wrn.124.1583185278193;
 Mon, 02 Mar 2020 13:41:18 -0800 (PST)
MIME-Version: 1.0
References: <20200302125649.61443-1-pankaj.laxminarayan.bharadiya@intel.com>
 <20200302125649.61443-3-pankaj.laxminarayan.bharadiya@intel.com>
In-Reply-To: <20200302125649.61443-3-pankaj.laxminarayan.bharadiya@intel.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 2 Mar 2020 16:41:07 -0500
Message-ID: <CADnq5_PhWWz-41Y2DY_mRsHHu3MRwa1DdJ9R50A175Fmrd-R9Q@mail.gmail.com>
Subject: Re: [PATCH 2/9] drm/radeon: remove radeon_fb_{add,
 remove}_connector functions
To: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
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
Cc: David Airlie <airlied@linux.ie>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 2, 2020 at 8:08 AM Pankaj Bharadiya
<pankaj.laxminarayan.bharadiya@intel.com> wrote:
>
> drm_fb_helper_{add,remove}_one_connector() are dummy functions now
> and serve no purpose. Hence remove their calls.
>
> This is the preparatory step for removing the
> drm_fb_helper_{add,remove}_one_connector() functions from
> drm_fb_helper.h
>
> Signed-off-by: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  drivers/gpu/drm/radeon/radeon_dp_mst.c | 10 ----------
>  drivers/gpu/drm/radeon/radeon_fb.c     | 12 ------------
>  drivers/gpu/drm/radeon/radeon_mode.h   |  3 ---
>  3 files changed, 25 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_dp_mst.c b/drivers/gpu/drm/radeon/radeon_dp_mst.c
> index 28eef9282874..5a9fb0ad175a 100644
> --- a/drivers/gpu/drm/radeon/radeon_dp_mst.c
> +++ b/drivers/gpu/drm/radeon/radeon_dp_mst.c
> @@ -303,23 +303,13 @@ static struct drm_connector *radeon_dp_add_mst_connector(struct drm_dp_mst_topol
>
>  static void radeon_dp_register_mst_connector(struct drm_connector *connector)
>  {
> -       struct drm_device *dev = connector->dev;
> -       struct radeon_device *rdev = dev->dev_private;
> -
> -       radeon_fb_add_connector(rdev, connector);
> -
>         drm_connector_register(connector);
>  }
>
>  static void radeon_dp_destroy_mst_connector(struct drm_dp_mst_topology_mgr *mgr,
>                                             struct drm_connector *connector)
>  {
> -       struct radeon_connector *master = container_of(mgr, struct radeon_connector, mst_mgr);
> -       struct drm_device *dev = master->base.dev;
> -       struct radeon_device *rdev = dev->dev_private;
> -
>         drm_connector_unregister(connector);
> -       radeon_fb_remove_connector(rdev, connector);
>         drm_connector_cleanup(connector);
>
>         kfree(connector);
> diff --git a/drivers/gpu/drm/radeon/radeon_fb.c b/drivers/gpu/drm/radeon/radeon_fb.c
> index 85548cf2529a..1c02cd771d52 100644
> --- a/drivers/gpu/drm/radeon/radeon_fb.c
> +++ b/drivers/gpu/drm/radeon/radeon_fb.c
> @@ -403,15 +403,3 @@ bool radeon_fbdev_robj_is_fb(struct radeon_device *rdev, struct radeon_bo *robj)
>                 return true;
>         return false;
>  }
> -
> -void radeon_fb_add_connector(struct radeon_device *rdev, struct drm_connector *connector)
> -{
> -       if (rdev->mode_info.rfbdev)
> -               drm_fb_helper_add_one_connector(&rdev->mode_info.rfbdev->helper, connector);
> -}
> -
> -void radeon_fb_remove_connector(struct radeon_device *rdev, struct drm_connector *connector)
> -{
> -       if (rdev->mode_info.rfbdev)
> -               drm_fb_helper_remove_one_connector(&rdev->mode_info.rfbdev->helper, connector);
> -}
> diff --git a/drivers/gpu/drm/radeon/radeon_mode.h b/drivers/gpu/drm/radeon/radeon_mode.h
> index 629567da29f1..c7f223743d46 100644
> --- a/drivers/gpu/drm/radeon/radeon_mode.h
> +++ b/drivers/gpu/drm/radeon/radeon_mode.h
> @@ -986,9 +986,6 @@ bool radeon_fbdev_robj_is_fb(struct radeon_device *rdev, struct radeon_bo *robj)
>
>  void radeon_crtc_handle_vblank(struct radeon_device *rdev, int crtc_id);
>
> -void radeon_fb_add_connector(struct radeon_device *rdev, struct drm_connector *connector);
> -void radeon_fb_remove_connector(struct radeon_device *rdev, struct drm_connector *connector);
> -
>  void radeon_crtc_handle_flip(struct radeon_device *rdev, int crtc_id);
>
>  int radeon_align_pitch(struct radeon_device *rdev, int width, int bpp, bool tiled);
> --
> 2.20.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
