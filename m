Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A21551C38F2
	for <lists+dri-devel@lfdr.de>; Mon,  4 May 2020 14:11:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 354966E3A6;
	Mon,  4 May 2020 12:10:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C037B6E3A2
 for <dri-devel@lists.freedesktop.org>; Mon,  4 May 2020 12:10:57 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id e26so8151305wmk.5
 for <dri-devel@lists.freedesktop.org>; Mon, 04 May 2020 05:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=QZsQPhulMeuGGdXqcMLWTvBPN1IAi8Q4rxPSgR6E8lg=;
 b=EL90A13qAInRQh0x6Dyj4LZR784QVP+/7Wew9W+3ki0QOwGIHhx+HIzaAU6bt+EMsp
 XQuvIaBO4CJ9XV8YEZP77hLNmXWhgYAN8U38zUBTgFobil4YtUqpjE5OeiTUbBRpKHZH
 bTZigiSlegjOVoqJYLT63mIgEgIcub5NFO+1U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QZsQPhulMeuGGdXqcMLWTvBPN1IAi8Q4rxPSgR6E8lg=;
 b=oK4fMAj62k2THFjYi3UFiqs0JNG2vPVVkO7HaCiSxqiNs3FDhSDOCWv2DRLM2Glg8O
 e0byTxejU8eBX+IPrG3JyaM1719NasFzW818OtFzftmio3g69OdfRHEm34j6vifyNexS
 mycm5V4R6yOU0uCN1oCyL15BEaBL7AaD1EDQRUK8QYhsgihWOMvhY03v2OLiy0WtNoZH
 tpKkP5nDEjpj359mdCk8Zf0vZn5/AccMdu8y9fjO50qXvVYIPrNmX+VY/tNC7mwLKlrN
 UGWyJ5anRr6rPkzkZsFIidccekmqQdRj94SK6q1LRMomJWhj7d9Pq4M6bMoEuyWya8iC
 pSlQ==
X-Gm-Message-State: AGi0PuZincdHEtxAOj1FIDFLjPofPhzsjQ0/aYJtAQHdtGAo9IcoCfoX
 h0+4f0AUYlG2yYlG0iQBK2oJyQ==
X-Google-Smtp-Source: APiQypJ5UcRT1RaebVl3tUak6GjmnczSSfRX0Iz/LWBmcNdvH8hGTEQ+sjowkQl8Fm2iVTbMICsb9g==
X-Received: by 2002:a1c:6455:: with SMTP id y82mr14113226wmb.128.1588594256441; 
 Mon, 04 May 2020 05:10:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v16sm12965133wml.30.2020.05.04.05.10.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 05:10:55 -0700 (PDT)
Date: Mon, 4 May 2020 14:10:53 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 15/17] drm/mgag200: Remove waiting from DPMS code
Message-ID: <20200504121053.GL10381@phenom.ffwll.local>
References: <20200429143238.10115-1-tzimmermann@suse.de>
 <20200429143238.10115-16-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200429143238.10115-16-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.4.0-4-amd64 
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
Cc: john.p.donnelly@oracle.com, dri-devel@lists.freedesktop.org,
 kraxel@redhat.com, airlied@redhat.com, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 29, 2020 at 04:32:36PM +0200, Thomas Zimmermann wrote:
> The mgag200 drivers waits for the VSYNC flag to get signalled (i.e.,
> the page flip happens) before changing DPMS settings. This doesn't work
> reliably if no mode has been programmed. Therefore remove the waiting
> code. Synchronization with page flips should be done by DRM's vblank
> handlers anyway.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

This looks a bit dangerous, hw might get angry if we drop these waits.

Generally with atomic you should never have a situation in driver code
where you expect the display to be on, but it isn't. So this should be
fixable by making sure we're calling this dpms function at the right spot,
e.g. for the enable path obviously the display is always going to be off,
and for the disable path the display is guaranteed to be on. So maybe just
a bool enable, or split the dpms function into two.

The old legacy helpers where a lot more fast&loose in this regard.
-Daniel

> ---
>  drivers/gpu/drm/mgag200/mgag200_mode.c | 26 --------------------------
>  1 file changed, 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
> index ee1cbe5decd71..884fc668a6dae 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
> @@ -75,30 +75,6 @@ static void mga_crtc_load_lut(struct drm_crtc *crtc)
>  	}
>  }
>  
> -static inline void mga_wait_vsync(struct mga_device *mdev)
> -{
> -	unsigned long timeout = jiffies + HZ/10;
> -	unsigned int status = 0;
> -
> -	do {
> -		status = RREG32(MGAREG_Status);
> -	} while ((status & 0x08) && time_before(jiffies, timeout));
> -	timeout = jiffies + HZ/10;
> -	status = 0;
> -	do {
> -		status = RREG32(MGAREG_Status);
> -	} while (!(status & 0x08) && time_before(jiffies, timeout));
> -}
> -
> -static inline void mga_wait_busy(struct mga_device *mdev)
> -{
> -	unsigned long timeout = jiffies + HZ;
> -	unsigned int status = 0;
> -	do {
> -		status = RREG8(MGAREG_Status + 2);
> -	} while ((status & 0x01) && time_before(jiffies, timeout));
> -}
> -
>  #define P_ARRAY_SIZE 9
>  
>  static int mga_g200se_set_plls(struct mga_device *mdev, long clock)
> @@ -1435,8 +1411,6 @@ static void mga_crtc_dpms(struct drm_crtc *crtc, int mode)
>  #endif
>  	WREG8(MGAREG_SEQ_INDEX, 0x01);
>  	seq1 |= RREG8(MGAREG_SEQ_DATA) & ~0x20;
> -	mga_wait_vsync(mdev);
> -	mga_wait_busy(mdev);
>  	WREG8(MGAREG_SEQ_DATA, seq1);
>  	msleep(20);
>  	WREG8(MGAREG_CRTCEXT_INDEX, 0x01);
> -- 
> 2.26.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
