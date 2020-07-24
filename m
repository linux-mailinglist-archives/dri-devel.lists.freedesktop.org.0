Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 229E122BCB8
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jul 2020 06:06:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9062E6E919;
	Fri, 24 Jul 2020 04:06:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com
 [IPv6:2607:f8b0:4864:20::b42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10FE56E48C;
 Fri, 24 Jul 2020 04:06:36 +0000 (UTC)
Received: by mail-yb1-xb42.google.com with SMTP id x9so4004173ybd.4;
 Thu, 23 Jul 2020 21:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FMi2ZZ+NdpJJAU9E2QYvkgkKvGnLkZj8QP+4FOG0DcM=;
 b=ClUOVyifk6lzelGKJgVbaiRlNdrJFOn0+lW65SYxxEYVyZ9QzjArnN+4GnBg/Lx9sE
 LA3Me0kFLEbrgMHXKB8U1P+aljrjmvoHlUtGwl1XOe9O0u96bZOlaVM/m1B8c9F5jlqq
 24eB9CsxwnVW4QXrlZzu57s5mxAnS7edjHLtvlAdFOh+EbVB1pKVQSnOl/h4kaPgilmb
 HAtZ0SYWTpzrBly+u2akz266TjDvYP0PuCpKkE9FNekmIdEUJsspTbYYqYcEUEHS23V9
 dtnQl+M5BYPdOrrsoeeP5QBH8LNzOK/S7jQOfnNcMkxzv8K/0+Sk+yKp0iZxvS0UqVJA
 Ji3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FMi2ZZ+NdpJJAU9E2QYvkgkKvGnLkZj8QP+4FOG0DcM=;
 b=Kcl9ixh+vKcBaKBHeuyMECLHYPLhpSEEn5qfPPQpTO5H3rJRcNviMkL79qRqjQ1nmJ
 kO82ly4txsWPOIFnrcf1abxySmX084c2iFSHoWknEyWGea+Vf2jJVGkJ5YeWZUuJjczc
 HSEk+8DlACIHoNTbaVXBwvyLLUMTAq/ALlh1ARGxs5odZQRHOZiLSDLuwi5Im4vRwd8Y
 1U4Z4HWfbbBgcMqg7AM8z15gPIDcg4p55uvSZsgy5LSHbB4b6ZcamCOwI8Hvu+emgTxo
 UEjuisKDhqN8DBTwpPqhM9GL0USlyFoLX6T3rOssExN/qk4Bz6dEhZXAoSR477HMuBrH
 2QDw==
X-Gm-Message-State: AOAM530Wg9awtwDPxzx1cgnveuDczlDHBDuVp0X7YMpmDUvYsEWG68b1
 2bwohExV6mlMEPtHdVefDKkKdrOxCs+brc+DtDg=
X-Google-Smtp-Source: ABdhPJxRC0DLtfqtfjDzauZzULj91DPQTZNooTf47lzz2rGnMYe46xbhdWUDHKWprnZ6rciPRzha4XNNNcsJaOtbGfU=
X-Received: by 2002:a25:4d41:: with SMTP id a62mr13327085ybb.83.1595563595210; 
 Thu, 23 Jul 2020 21:06:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200718033352.1810-1-jajones@nvidia.com>
In-Reply-To: <20200718033352.1810-1-jajones@nvidia.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Fri, 24 Jul 2020 14:06:23 +1000
Message-ID: <CACAvsv6a6Td=igGXwrpPUASMfYPCH9VvWdEY6PBaY+0cybJNxA@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH v2] drm/nouveau: Accept 'legacy' format modifiers
To: James Jones <jajones@nvidia.com>
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
Cc: Nouveau <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 "Kirill A . Shutemov" <kirill@shutemov.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 18 Jul 2020 at 13:34, James Jones <jajones@nvidia.com> wrote:
>
> Accept the DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK()
> family of modifiers to handle broken userspace
> Xorg modesetting and Mesa drivers. Existing Mesa
> drivers are still aware of only these older
> format modifiers which do not differentiate
> between different variations of the block linear
> layout. When the format modifier support flag was
> flipped in the nouveau kernel driver, the X.org
> modesetting driver began attempting to use its
> format modifier-enabled framebuffer path. Because
> the set of format modifiers advertised by the
> kernel prior to this change do not intersect with
> the set of format modifiers advertised by Mesa,
> allocating GBM buffers using format modifiers
> fails and the modesetting driver falls back to
> non-modifier allocation. However, it still later
> queries the modifier of the GBM buffer when
> creating its DRM-KMS framebuffer object, receives
> the old-format modifier from Mesa, and attempts
> to create a framebuffer with it. Since the kernel
> is still not aware of these formats, this fails.
>
> Userspace should not be attempting to query format
> modifiers of GBM buffers allocated with a non-
> format-modifier-aware allocation path, but to
> avoid breaking existing userspace behavior, this
> change accepts the old-style format modifiers when
> creating framebuffers and applying them to planes
> by translating them to the equivalent new-style
> modifier. To accomplish this, some layout
> parameters must be assumed to match properties of
> the device targeted by the relevant ioctls. To
> avoid perpetuating misuse of the old-style
> modifiers, this change does not advertise support
> for them. Doing so would imply compatibility
> between devices with incompatible memory layouts.
>
> Tested with Xorg 1.20 modesetting driver,
> weston@c46c70dac84a4b3030cd05b380f9f410536690fc,
> gnome & KDE wayland desktops from Ubuntu 18.04,
> and sway 1.5
>
> Reported-by: Kirill A. Shutemov <kirill@shutemov.name>
> Fixes: fa4f4c213f5f ("drm/nouveau/kms: Support NVIDIA format modifiers")
> Link: https://lkml.org/lkml/2020/6/30/1251
> Signed-off-by: James Jones <jajones@nvidia.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_display.c | 26 +++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
> index 496c4621cc78..31543086254b 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_display.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_display.c
> @@ -191,8 +191,14 @@ nouveau_decode_mod(struct nouveau_drm *drm,
>                    uint32_t *tile_mode,
>                    uint8_t *kind)
>  {
> +       struct nouveau_display *disp = nouveau_display(drm->dev);
>         BUG_ON(!tile_mode || !kind);
>
> +       if ((modifier & (0xffull << 12)) == 0ull) {
> +               /* Legacy modifier.  Translate to this device's 'kind.' */
> +               modifier |= disp->format_modifiers[0] & (0xffull << 12);
> +       }
I believe this should be moved into the != MOD_LINEAR case.

> +
>         if (modifier == DRM_FORMAT_MOD_LINEAR) {
>                 /* tile_mode will not be used in this case */
>                 *tile_mode = 0;
> @@ -227,6 +233,16 @@ nouveau_framebuffer_get_layout(struct drm_framebuffer *fb,
>         }
>  }
>
> +static const u64 legacy_modifiers[] = {
> +       DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(0),
> +       DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(1),
> +       DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(2),
> +       DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(3),
> +       DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(4),
> +       DRM_FORMAT_MOD_NVIDIA_16BX2_BLOCK(5),
> +       DRM_FORMAT_MOD_INVALID
> +};
> +
>  static int
>  nouveau_validate_decode_mod(struct nouveau_drm *drm,
>                             uint64_t modifier,
> @@ -247,8 +263,14 @@ nouveau_validate_decode_mod(struct nouveau_drm *drm,
>              (disp->format_modifiers[mod] != modifier);
>              mod++);
>
> -       if (disp->format_modifiers[mod] == DRM_FORMAT_MOD_INVALID)
> -               return -EINVAL;
> +       if (disp->format_modifiers[mod] == DRM_FORMAT_MOD_INVALID) {
> +               for (mod = 0;
> +                    (legacy_modifiers[mod] != DRM_FORMAT_MOD_INVALID) &&
> +                    (legacy_modifiers[mod] != modifier);
> +                    mod++);
> +               if (legacy_modifiers[mod] == DRM_FORMAT_MOD_INVALID)
> +                       return -EINVAL;
> +       }
>
>         nouveau_decode_mod(drm, modifier, tile_mode, kind);
>
> --
> 2.17.1
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
