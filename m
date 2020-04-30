Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 581E01BEEF2
	for <lists+dri-devel@lfdr.de>; Thu, 30 Apr 2020 06:13:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA0866EB3D;
	Thu, 30 Apr 2020 04:13:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com
 [IPv6:2607:f8b0:4864:20::b43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E6176EB30;
 Thu, 30 Apr 2020 04:13:48 +0000 (UTC)
Received: by mail-yb1-xb43.google.com with SMTP id t18so2497298ybp.2;
 Wed, 29 Apr 2020 21:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nCPU1gorl1WvKPs1iOzqt5NnAoZZ0QjF1DsfHjpy8kM=;
 b=Ii1k25Ep82LJUh9M/ERKSLRZZMHzCZJcAt1rSs48NIWvUSPIXd3KhGWlVDHwrm5Huf
 DZ3WA2/yrmDAKjQVyP7BVi/sT24Qys5QhodRggUD/ZFgNVQ+9SuBtohrETk5cm1T2k07
 bwu9aGGLxLtJt7z9Q5kECnBm4yy1dQppTyeJbcIAPnvqj7oX3AF36w737sJV9FJdNkUk
 u9WorZUm7UmGWo2Vp6eoWQH+zM3looOdqR2BUBjj935PPz+gcOTehJxmrKIV0BFnIb/6
 voEB5HXLF96MrHmV+MtIVLoT/M+A1//If9kYfDokBjfBacPK31PLHp/C72neuG2ioqlv
 m9Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nCPU1gorl1WvKPs1iOzqt5NnAoZZ0QjF1DsfHjpy8kM=;
 b=kfMv+n+Zy9RBu6pTgWrt8LJLjx+qvMMGydbRhdB/I0SGA2odwml/7qd19cb3HSHpsI
 v7WuknwnCxjBdJrglphhbFPOi8dZ2XPoSU89q99Hdv1TkVnpdXfxQ0ALH77jdvwOFpNP
 DcuAgfo48y/pq+lnzsLMWNWpRtRlyRQG+zQFVmWnNEd0tNXwKSjf8r7ljRsASGAHFVXd
 Ttas5fwqgKfn/hiP+S8mnLkiH+xNcNde9wgvyYHTXPKQZRIy9of+n3+2y9gQhincpVa0
 qg7VhU3qgtxR/yTvYL95DNov70zDA5wU1/DJ7c0+bBtJs6vIFr1Vxq4lCzBeSIf7qrrM
 0UrQ==
X-Gm-Message-State: AGi0PuYHCR37rAZoELFMhEoDR3wOi+volIc2WVnCIucvUGx5aQTY69ru
 sj9ySdPWO1LHxWFOQMV/xMcokjgvlFhqUXrGyrQ=
X-Google-Smtp-Source: APiQypJ+S/o2UH998viYT0pSpKOLZuxf89e5j2PIAZQncI/FHYU5+W9PA0cNSif2Ta7PceldqOcWJlZm7TxLCyUqKLc=
X-Received: by 2002:a25:8b02:: with SMTP id i2mr2565409ybl.283.1588220027294; 
 Wed, 29 Apr 2020 21:13:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200416075428.25521-1-tiwai@suse.de>
In-Reply-To: <20200416075428.25521-1-tiwai@suse.de>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Thu, 30 Apr 2020 14:13:36 +1000
Message-ID: <CACAvsv7pZX+h_JqWeu=0yK1u2nwzDGODKWpHarzB-80u89JLZg@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH] drm/nouveau: Fix regression by audio component
 transition
To: Takashi Iwai <tiwai@suse.de>
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
Cc: ML nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Good catch!  The OR is definitely a far better choice than the head
here, as it's what we use to select the GPU-side HDA registers too.

Merged.

On Thu, 16 Apr 2020 at 17:54, Takashi Iwai <tiwai@suse.de> wrote:
>
> Since the commit 742db30c4ee6 ("drm/nouveau: Add HD-audio component
> notifier support"), the nouveau driver notifies and pokes the HD-audio
> HPD and ELD via audio component, but this seems broken.  The culprit
> is the naive assumption that crtc->index corresponds to the HDA pin.
> Actually this rather corresponds to the MST dev_id (alias "pipe" in
> the audio component framework) while the actual port number is given
> from the output ior id number.
>
> This patch corrects the assignment of port and dev_id arguments in the
> audio component ops to recover from the HDMI/DP audio regression.
>
> Fixes: 742db30c4ee6 ("drm/nouveau: Add HD-audio component notifier support")
> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=207223
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Takashi Iwai <tiwai@suse.de>
> ---
>  drivers/gpu/drm/nouveau/dispnv50/disp.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> index a3dc2ba19fb2..3a9fd565079d 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -481,15 +481,16 @@ nv50_dac_create(struct drm_connector *connector, struct dcb_output *dcbe)
>   * audio component binding for ELD notification
>   */
>  static void
> -nv50_audio_component_eld_notify(struct drm_audio_component *acomp, int port)
> +nv50_audio_component_eld_notify(struct drm_audio_component *acomp, int port,
> +                               int dev_id)
>  {
>         if (acomp && acomp->audio_ops && acomp->audio_ops->pin_eld_notify)
>                 acomp->audio_ops->pin_eld_notify(acomp->audio_ops->audio_ptr,
> -                                                port, -1);
> +                                                port, dev_id);
>  }
>
>  static int
> -nv50_audio_component_get_eld(struct device *kdev, int port, int pipe,
> +nv50_audio_component_get_eld(struct device *kdev, int port, int dev_id,
>                              bool *enabled, unsigned char *buf, int max_bytes)
>  {
>         struct drm_device *drm_dev = dev_get_drvdata(kdev);
> @@ -505,7 +506,8 @@ nv50_audio_component_get_eld(struct device *kdev, int port, int pipe,
>                 nv_encoder = nouveau_encoder(encoder);
>                 nv_connector = nouveau_encoder_connector_get(nv_encoder);
>                 nv_crtc = nouveau_crtc(encoder->crtc);
> -               if (!nv_connector || !nv_crtc || nv_crtc->index != port)
> +               if (!nv_connector || !nv_crtc || nv_encoder->or != port ||
> +                   nv_crtc->index != dev_id)
>                         continue;
>                 *enabled = drm_detect_monitor_audio(nv_connector->edid);
>                 if (*enabled) {
> @@ -599,7 +601,8 @@ nv50_audio_disable(struct drm_encoder *encoder, struct nouveau_crtc *nv_crtc)
>
>         nvif_mthd(&disp->disp->object, 0, &args, sizeof(args));
>
> -       nv50_audio_component_eld_notify(drm->audio.component, nv_crtc->index);
> +       nv50_audio_component_eld_notify(drm->audio.component, nv_encoder->or,
> +                                       nv_crtc->index);
>  }
>
>  static void
> @@ -633,7 +636,8 @@ nv50_audio_enable(struct drm_encoder *encoder, struct drm_display_mode *mode)
>         nvif_mthd(&disp->disp->object, 0, &args,
>                   sizeof(args.base) + drm_eld_size(args.data));
>
> -       nv50_audio_component_eld_notify(drm->audio.component, nv_crtc->index);
> +       nv50_audio_component_eld_notify(drm->audio.component, nv_encoder->or,
> +                                       nv_crtc->index);
>  }
>
>  /******************************************************************************
> --
> 2.16.4
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
