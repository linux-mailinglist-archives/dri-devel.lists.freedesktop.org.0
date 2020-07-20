Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4B92258DF
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jul 2020 09:44:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AB976E157;
	Mon, 20 Jul 2020 07:44:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F5506E157
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 07:44:16 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id c80so21259391wme.0
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jul 2020 00:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=20SMlD+A4VIJMsR26B/2DgrUrGz2fRix7+w2Orep+0E=;
 b=jgEL6WY/qRm79F9vPLshN0nbrVOny5ry4N0n6Coi1tTCWe9oesaS0uTV52D0H0pZ6i
 wc1unYka1hb7RVzWm7+L7JlpRxBJcojRzsG6bTrJNVK4KzJMbAYVnsuZOYIupqNl3DOx
 Mz1aRrd/rJqnYXFKbtEbQcQWVy8YxTIksTvmU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=20SMlD+A4VIJMsR26B/2DgrUrGz2fRix7+w2Orep+0E=;
 b=ZvLe37VZl0mfVdvko30ElAMlLNsHKtQ1nubI7YljWrYKSBN37dkK+WOFeeGCeVUJ3q
 yeL12uwS8VZ4sYtHqR7y5PBRQyFYphulLrCT7Q7eaEsbIUe4YAW7yVu9RN2VgQmlskSr
 8H0MWp+Y14PnKeiA92JhTZyug0YadisW4/gX7qm3C0vibpYVrr4pPACaRCg0HrzxcatU
 oYwsoHM/mHVBI+HAg2xwLKMWrvP7PNUiQw7wZchHcY/GwLoNuu/fymUxILVXhLSrqZwT
 2ZdyN/H4WTVZsbYwK7x+s5x7PtVMOTLcZMI+q2jhyT2qPGyhhczl5QqSVmb99lnsmvC3
 csNw==
X-Gm-Message-State: AOAM5335NfOIAqAdSZ8VzBEX8joFL+vdbvMcAkddo/tpdJCblAQH/w+H
 bS8O2ruv5CYVoK6gUn2Rkz90SzBQkS0=
X-Google-Smtp-Source: ABdhPJywzfoo9yD4QIdX7Jk3CsF0um/d5+/YFa9VkkkzGeYwKi5hTdPcgOVCEpx/fRySuSYOkv1oLw==
X-Received: by 2002:a7b:c197:: with SMTP id y23mr21507732wmi.114.1595231054677; 
 Mon, 20 Jul 2020 00:44:14 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id m2sm31088183wmg.0.2020.07.20.00.44.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jul 2020 00:44:14 -0700 (PDT)
Date: Mon, 20 Jul 2020 09:44:12 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: dan.carpenter@oracle.com
Subject: Re: [bug report] drm/ingenic: Add support for the IPU
Message-ID: <20200720074412.GX3278063@phenom.ffwll.local>
References: <20200720072237.GA8232@mwanda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200720072237.GA8232@mwanda>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: paul@crapouillou.net, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 20, 2020 at 10:22:37AM +0300, dan.carpenter@oracle.com wrote:
> Hello Paul Cercueil,
> 
> The patch fc1acf317b01: "drm/ingenic: Add support for the IPU" from
> Jul 16, 2020, leads to the following static checker warning:
> 
> 	drivers/gpu/drm/ingenic/ingenic-drm-drv.c:232 ingenic_drm_crtc_atomic_check()
> 	error: potentially dereferencing uninitialized 'ipu_state'.
> 
> drivers/gpu/drm/ingenic/ingenic-drm-drv.c
>    197  static int ingenic_drm_crtc_atomic_check(struct drm_crtc *crtc,
>    198                                           struct drm_crtc_state *state)
>    199  {
>    200          struct ingenic_drm *priv = drm_crtc_get_priv(crtc);
>    201          struct drm_plane_state *f1_state, *f0_state, *ipu_state;
>    202          long rate;
>    203  
>    204          if (!drm_atomic_crtc_needs_modeset(state))
>    205                  return 0;
>    206  
>    207          if (state->mode.hdisplay > priv->soc_info->max_width ||
>    208              state->mode.vdisplay > priv->soc_info->max_height)
>    209                  return -EINVAL;

Random entirely unrelated drive-through comment: These mode checks should
be in crtc_helper_funcs->mode_valid so that they're shared between the
atomic_check and output probe paths.

But preexisting issues, just something that would be nice to rectify.

Cheers, Daniel

>    210  
>    211          rate = clk_round_rate(priv->pix_clk,
>    212                                state->adjusted_mode.clock * 1000);
>    213          if (rate < 0)
>    214                  return rate;
>    215  
>    216          if (priv->soc_info->has_osd) {
>    217                  f1_state = drm_atomic_get_plane_state(state->state, &priv->f1);
>    218                  f0_state = drm_atomic_get_plane_state(state->state, &priv->f0);
>    219  
>    220                  if (IS_ENABLED(CONFIG_DRM_INGENIC_IPU) && priv->ipu_plane) {
> 
> Do we need to check both the CONFIG and the priv->ipu_plane or would it
> be sufficient to just check if (priv->ipu_plane) {?
> 
>    221                          ipu_state = drm_atomic_get_plane_state(state->state, priv->ipu_plane);
>    222  
>    223                          /* IPU and F1 planes cannot be enabled at the same time. */
>    224                          if (f1_state->fb && ipu_state->fb) {
>    225                                  dev_dbg(priv->dev, "Cannot enable both F1 and IPU\n");
>    226                                  return -EINVAL;
>    227                          }
>    228                  }
>    229  
>    230                  /* If all the planes are disabled, we won't get a VBLANK IRQ */
>    231                  priv->no_vblank = !f1_state->fb && !f0_state->fb &&
>    232                                    !(priv->ipu_plane && ipu_state->fb);
>                                             ^^^^^^^^^^^^^^^
> Because here we're only checking "priv->ipu_plane".
> 
>    233          }
>    234  
>    235          return 0;
>    236  }
> 
> regards,
> dan carpenter
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
