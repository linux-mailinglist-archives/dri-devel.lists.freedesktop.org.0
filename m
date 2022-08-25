Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F115A18B9
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 20:22:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAFE110E107;
	Thu, 25 Aug 2022 18:22:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D7F810E095;
 Thu, 25 Aug 2022 18:22:27 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-11cb3c811d9so24288610fac.1; 
 Thu, 25 Aug 2022 11:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=MGe3WpmXir6Ke6Ubn/rvyEt+IuTgTbmR2BcwTZxEuos=;
 b=ay81z9kuifVn+h4UdfbrMIDA14dtt9RZ8zv+D9rZ9QCc/wr66/okNM/hnmGJ8KaBLX
 gKu+qAsnIFzfv1ohz67mNbVSvhpROiPQp4GR09S8dHQBZsqO6eRO+eOPQM1LXpv73qFb
 ta4G05KLFpXGCR2J8dmXcqjMiVWNuy1svsXCcZop6EQdKGt+b53X0iRwlEHPL4yMaAyD
 KaZ9GZytXN+au5zzDNHIUpNuaM++X/hdiA0KGAj4SYxzE3fXXKfp3WNFtey4omNd6kC9
 mpzWP9M8ZRvORoPJNC289WjbIIHT8N9Q3VCEZ+H8zauMzmL2Rh13eJ1gd3HnxZSVlaci
 qlfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=MGe3WpmXir6Ke6Ubn/rvyEt+IuTgTbmR2BcwTZxEuos=;
 b=xFpmwEb+JVahW4TXeNM/7Ti+h0UlymzomeoDET/U+z9xOIzIAmEa3ERdUcQrOJ+ub7
 1gRDAGDr1qF6D9NuYN8f8CuoSpyxAZ7LUGJMKvvSrgJqt5a0b7xtvvMPWOuiXH2mKAHr
 uW959eUD0BQHOLKmku6/qwUhK1FQw3rwt81QITlb8VEJfBVs3tNPaETXI8pQeeNR9LPI
 zYIPaq8W/Ph1HOsw++9M2BOfHQQ7rL2oq+ixTftVSvGslsU9XFLIG4jBT4JBtfxerQTH
 tVWbLIA9I4lKRtkdjMgPADGpIJqqe8SlxoDRMvb5+FJoBBAY8sG435FXEuS9FHEw7GrH
 9Ndw==
X-Gm-Message-State: ACgBeo0kSRCKQgAv35BRJSO/Tv7oT48Y0YrunGzK07DjOX2q3ShIiBfo
 DE55xGTTGCaFx74RtijVROpJB2GSGdb+bth6MGQ=
X-Google-Smtp-Source: AA6agR4PiMpS5zvDjJzh9SNmvRuEzLxk+3w7piJb+fuQZmrMsOnKR2PCDeQpWyrdrHwXwmRVQ5SS8n0LgAZ1BD7Y95I=
X-Received: by 2002:a05:6870:3484:b0:11e:4465:3d9b with SMTP id
 n4-20020a056870348400b0011e44653d9bmr211969oah.46.1661451746692; Thu, 25 Aug
 2022 11:22:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220824150834.427572-1-contact@emersion.fr>
 <20220824150834.427572-5-contact@emersion.fr>
In-Reply-To: <20220824150834.427572-5-contact@emersion.fr>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 25 Aug 2022 14:22:15 -0400
Message-ID: <CADnq5_MX0Qh7v-Wy1nBhMEWT9bhmQn4W-2Wo97CZgKcby1Xc+w@mail.gmail.com>
Subject: Re: [PATCH 4/4] amd/display: indicate support for atomic async
 page-flips on DCN
To: Simon Ser <contact@emersion.fr>
Content-Type: text/plain; charset="UTF-8"
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
Cc: daniel.vetter@ffwll.ch, amd-gfx@lists.freedesktop.org, mwen@igalia.com,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com, hwentlan@amd.com,
 nicholas.kazlauskas@amd.com, joshua@froggi.es
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 24, 2022 at 11:09 AM Simon Ser <contact@emersion.fr> wrote:
>
> amdgpu_dm_commit_planes already sets the flip_immediate flag for
> async page-flips. This flag is used to set the UNP_FLIP_CONTROL
> register. Thus, no additional change is required to handle async
> page-flips with the atomic uAPI.
>
> Note, async page-flips are still unsupported on DCE with the atomic
> uAPI. The mode_set_base callbacks unconditionally set the
> GRPH_SURFACE_UPDATE_H_RETRACE_EN field of the GRPH_FLIP_CONTROL
> register to 0, which disables async page-flips.

Can you elaborate a bit on this? We don't use hsync flips at all, even
in non-atomic, as far as I recall.  The hardware can also do immediate
flips which take effect as soon as you update the base address
register which is what we use for async updates today IIRC.

Alex

>
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Joshua Ashton <joshua@froggi.es>
> Cc: Melissa Wen <mwen@igalia.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Harry Wentland <hwentlan@amd.com>
> Cc: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index ef816bf295eb..9ab01c58bedb 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -3804,7 +3804,6 @@ static int amdgpu_dm_mode_config_init(struct amdgpu_device *adev)
>         adev_to_drm(adev)->mode_config.prefer_shadow = 0;
>         /* indicates support for immediate flip */
>         adev_to_drm(adev)->mode_config.async_page_flip = true;
> -       adev_to_drm(adev)->mode_config.atomic_async_page_flip_not_supported = true;
>
>         adev_to_drm(adev)->mode_config.fb_base = adev->gmc.aper_base;
>
> --
> 2.37.2
>
>
