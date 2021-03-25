Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 405DE349775
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 17:59:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66D876EB6B;
	Thu, 25 Mar 2021 16:58:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 241816EB6B;
 Thu, 25 Mar 2021 16:58:56 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 t23-20020a0568301e37b02901b65ab30024so2604015otr.4; 
 Thu, 25 Mar 2021 09:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t/O8m8IOxntS1mga4RbDV2Gzqftugt1u1+gs5VyZdC4=;
 b=a78uJ8XUGc4mp4RwZAcUS04PRHfHNn/08Xu8uIrKZnd65Va4oDoP2ujHDOdPitOWzE
 BtOh4Scmu8ttlkmvkIDz1fzxnU+IJAV+eAwOl8+eMX1tnQFdz3N9EpRtgYCy81fbGLtj
 ZahiqequFsDEemqzPchIwSjgr3CrOzczBAj+QZxlIi0MaP/m1rDinrxYlif95w+ZU+Ol
 cUYMFdGragNZ5SO4SxhVnT1r9sJwBadqEW7fmHew58n0RWFIdAlZfeGcpn3fcfD7H94L
 R75aWC8NCkh2TIKwAW67K6/Cp7FW1Qz7sXpFfJvnHtbb1Ef6zSl396ixJuSdrEo4Jze4
 IfdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t/O8m8IOxntS1mga4RbDV2Gzqftugt1u1+gs5VyZdC4=;
 b=r/EeVU5v8zvFZRwnuA9O4zJhd+UCq8OAOz7WpdsCKP6Mbl8uAC6EzlztfZLDP+TZaJ
 HMd4yEuXsHjw+k0RcaYRNykqXbGV7lJUoMg9Ciz0cSVQcdIWXgTF4J+1Y8EX7VzRQ2fh
 Z8t+968u6dIIOeKIc5f3wLemQZz1I18PfEJdVY1j0fTD1b7uSE75b9QrQ56MGZvX+0kD
 6Kw094wJ9Q3JKz+8kWZXLYFUKmlXwUa/ja1VdCOsmPNmn06Eb906o3QTz2z73jQUziFP
 d+2Z5LxUPdX9MPUlVGg1dLLdWYJ7fCTi56HSxld8Wg4scBv5XaKRJTkyLd5sFqlS4/VH
 nxrA==
X-Gm-Message-State: AOAM531Sv7mM3bW2A06W3WzDwhGoYCYqe0um7kjtx+wMGF8JZQx0BuF2
 wTOCtgt+l03v5aDVixiyzxlP4un+/vL5fkXU6oQ=
X-Google-Smtp-Source: ABdhPJw14TYBs7o1WtDY0VivKSYj0WmYdQT29x4nDgfsxDbXb/GVfMOnZv+4HX7Xdujmn+3OwMzliGPUeXRFOx7Lzhk=
X-Received: by 2002:a9d:d89:: with SMTP id 9mr8504280ots.23.1616691535380;
 Thu, 25 Mar 2021 09:58:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210324201624.712307-1-markyacoub@chromium.org>
In-Reply-To: <20210324201624.712307-1-markyacoub@chromium.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 25 Mar 2021 12:58:44 -0400
Message-ID: <CADnq5_Nn7v7BB0XY1iiEHwQu+noNSOqpBGEjwu6K=YaKdrPDdA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amdgpu: Ensure that the modifier requested is
 supported by plane.
To: Mark Yacoub <markyacoub@chromium.org>
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Mark Yacoub <markyacoub@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 24, 2021 at 4:16 PM Mark Yacoub <markyacoub@chromium.org> wrote:
>
> From: Mark Yacoub <markyacoub@google.com>
>
> On initializing the framebuffer, call drm_any_plane_has_format to do a
> check if the modifier is supported. drm_any_plane_has_format calls
> dm_plane_format_mod_supported which is extended to validate that the
> modifier is on the list of the plane's supported modifiers.
>
> The bug was caught using igt-gpu-tools test: kms_addfb_basic.addfb25-bad-modifier
>
> Tested on ChromeOS Zork by turning on the display, running an overlay
> test, and running a YT video.
>
> === Changes from v1 ===
> Explicitly handle DRM_FORMAT_MOD_INVALID modifier.
>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> Signed-off-by: default avatarMark Yacoub <markyacoub@chromium.org>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c    | 13 +++++++++++++
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  | 18 +++++++++++++++---
>  2 files changed, 28 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> index afa5f8ad0f563..a947b5aa420d2 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> @@ -908,6 +908,19 @@ int amdgpu_display_gem_fb_verify_and_init(
>                                          &amdgpu_fb_funcs);
>         if (ret)
>                 goto err;
> +       /* Verify that the modifier is supported. */
> +       if (!drm_any_plane_has_format(dev, mode_cmd->pixel_format,
> +                                     mode_cmd->modifier[0])) {
> +               struct drm_format_name_buf format_name;
> +               drm_dbg_kms(dev,
> +                           "unsupported pixel format %s / modifier 0x%llx\n",
> +                           drm_get_format_name(mode_cmd->pixel_format,
> +                                               &format_name),
> +                           mode_cmd->modifier[0]);
> +
> +               ret = -EINVAL;
> +               goto err;
> +       }
>
>         ret = amdgpu_display_framebuffer_init(dev, rfb, mode_cmd, obj);
>         if (ret)
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 961abf1cf040c..6fc746996c24f 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -3939,6 +3939,7 @@ static bool dm_plane_format_mod_supported(struct drm_plane *plane,
>  {
>         struct amdgpu_device *adev = drm_to_adev(plane->dev);
>         const struct drm_format_info *info = drm_format_info(format);
> +       int i;
>
>         enum dm_micro_swizzle microtile = modifier_gfx9_swizzle_mode(modifier) & 3;
>
> @@ -3946,11 +3947,22 @@ static bool dm_plane_format_mod_supported(struct drm_plane *plane,
>                 return false;
>
>         /*
> -        * We always have to allow this modifier, because core DRM still
> -        * checks LINEAR support if userspace does not provide modifers.
> +        * We always have to allow these modifiers:
> +        * 1. Core DRM checks for LINEAR support if userspace does not provide modifiers.
> +        * 2. Not passing any modifiers is the same as explicitly passing INVALID.
>          */
> -       if (modifier == DRM_FORMAT_MOD_LINEAR)
> +       if (modifier == DRM_FORMAT_MOD_LINEAR ||
> +           modifier == DRM_FORMAT_MOD_INVALID) {
>                 return true;
> +       }
> +
> +       /* Check that the modifier is on the list of the plane's supported modifiers. */
> +       for (i = 0; i < plane->modifier_count; i++) {
> +               if (modifier == plane->modifiers[i])
> +                       break;
> +       }
> +       if (i == plane->modifier_count)
> +               return false;
>
>         /*
>          * The arbitrary tiling support for multiplane formats has not been hooked
> --
> 2.31.0.291.g576ba9dcdaf-goog
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
