Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A48A73E5827
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 12:20:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C23D489FC3;
	Tue, 10 Aug 2021 10:20:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8547389FC3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 10:20:42 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id f5so9742225wrm.13
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 03:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=8RAzZS2hEugFiV4ZxID8a4ZMcTz4OPkpeI06mw37uVk=;
 b=DGGlOAZ2n6wwyKWNsJB+0bvHEx3kSPt1H9FV85g0/pWtL6jz/f/Cn1YObyE+d4c2QT
 wQH+IfYdz+EmuExe4c1zux72MY8itRr6ZfAkS4qy/ShxWysYpsRFj8y10/2ftXmLZ//3
 UPDoAxBSgq4gfttlRqNEHxnR3EKm+2s1lZnSE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=8RAzZS2hEugFiV4ZxID8a4ZMcTz4OPkpeI06mw37uVk=;
 b=DKCBVWE5PJIeH306s4rQaX97FuPjoPFVctpXUkvxYst4XrYbZnpc05Riwvpeqsj10P
 NAGehgXSomocNtxnBSScQf//rprwwaLlHo+/WIoS1UpWNgogxRqEppaUbjLstsSMeLLL
 4mwiVXap8FecVKttjlCWXVQ1MJy4umDHuVy8ETK39RNgT/aqiODZxy5W/dS0pDArYvav
 DoVlhwNGFoSbEzYHDrtvTGx7LjeIC//TrpLl5ib2cTe4DQPsv460hpp4wAR3W1IvuCa5
 fSfIVGKkbsA+EgTHqeekVS36WhhQWLXvjDJIbMKaw+YrbE9E/9/5BmoixwWtj3XAXvaI
 zo+Q==
X-Gm-Message-State: AOAM532rBHhDYaeOiTEZHuruKW3/GM7T5S4xAus0SwYkT3joaNU2IZ8n
 hnzQpYu+zDfUcLLzCrwQliOZGA==
X-Google-Smtp-Source: ABdhPJxE4DlZ7A2HljtV10Bk58EMZUJKx7lMKSfiibUOtkXLH7tUkPVu6ftZl2LbyOCfq4M/TbeUyQ==
X-Received: by 2002:adf:90b1:: with SMTP id i46mr16671362wri.159.1628590840965; 
 Tue, 10 Aug 2021 03:20:40 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f17sm26871903wrt.18.2021.08.10.03.20.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 03:20:40 -0700 (PDT)
Date: Tue, 10 Aug 2021 12:20:38 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Paul Cercueil <paul@crapouillou.net>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 "H . Nikolaus Schaller" <hns@goldelico.com>,
 Paul Boddie <paul@boddie.org.uk>, list@opendingux.net,
 Sam Ravnborg <sam@ravnborg.org>, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/8] drm/ingenic: Use standard
 drm_atomic_helper_commit_tail
Message-ID: <YRJS9kZt5jUe5Z3r@phenom.ffwll.local>
Mail-Followup-To: Paul Cercueil <paul@crapouillou.net>,
 David Airlie <airlied@linux.ie>,
 "H . Nikolaus Schaller" <hns@goldelico.com>,
 Paul Boddie <paul@boddie.org.uk>, list@opendingux.net,
 Sam Ravnborg <sam@ravnborg.org>, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20210808134526.119198-1-paul@crapouillou.net>
 <20210808134526.119198-4-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210808134526.119198-4-paul@crapouillou.net>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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

On Sun, Aug 08, 2021 at 03:45:21PM +0200, Paul Cercueil wrote:
> By making the CRTC's .vblank_enable() function return an error when it
> is known that the hardware won't deliver a VBLANK, we can drop the
> ingenic_drm_atomic_helper_commit_tail() function and use the standard
> drm_atomic_helper_commit_tail() function instead.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 28 ++++-------------------
>  1 file changed, 4 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> index bc71ba44ccf4..3ed7c27a8dde 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -706,29 +706,6 @@ static int ingenic_drm_encoder_atomic_check(struct drm_encoder *encoder,
>  	}
>  }
>  
> -static void ingenic_drm_atomic_helper_commit_tail(struct drm_atomic_state *old_state)
> -{
> -	/*
> -	 * Just your regular drm_atomic_helper_commit_tail(), but only calls
> -	 * drm_atomic_helper_wait_for_vblanks() if priv->no_vblank.
> -	 */
> -	struct drm_device *dev = old_state->dev;
> -	struct ingenic_drm *priv = drm_device_get_priv(dev);
> -
> -	drm_atomic_helper_commit_modeset_disables(dev, old_state);
> -
> -	drm_atomic_helper_commit_planes(dev, old_state, 0);
> -
> -	drm_atomic_helper_commit_modeset_enables(dev, old_state);
> -
> -	drm_atomic_helper_commit_hw_done(old_state);
> -
> -	if (!priv->no_vblank)
> -		drm_atomic_helper_wait_for_vblanks(dev, old_state);
> -
> -	drm_atomic_helper_cleanup_planes(dev, old_state);
> -}
> -
>  static irqreturn_t ingenic_drm_irq_handler(int irq, void *arg)
>  {
>  	struct ingenic_drm *priv = drm_device_get_priv(arg);
> @@ -749,6 +726,9 @@ static int ingenic_drm_enable_vblank(struct drm_crtc *crtc)
>  {
>  	struct ingenic_drm *priv = drm_crtc_get_priv(crtc);
>  
> +	if (priv->no_vblank)
> +		return -EWOULDBLOCK;

I think other drivers return EINVAL here. I'm not sure exactly this is
specified, but the errno here is visible to userspace.

Maybe would be good to update the kerneldoc for this hook?

Anyway this is great, with the errno fixed:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> +
>  	regmap_update_bits(priv->map, JZ_REG_LCD_CTRL,
>  			   JZ_LCD_CTRL_EOF_IRQ, JZ_LCD_CTRL_EOF_IRQ);
>  
> @@ -856,7 +836,7 @@ static const struct drm_mode_config_funcs ingenic_drm_mode_config_funcs = {
>  };
>  
>  static struct drm_mode_config_helper_funcs ingenic_drm_mode_config_helpers = {
> -	.atomic_commit_tail = ingenic_drm_atomic_helper_commit_tail,
> +	.atomic_commit_tail = drm_atomic_helper_commit_tail,
>  };
>  
>  static void ingenic_drm_unbind_all(void *d)
> -- 
> 2.30.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
