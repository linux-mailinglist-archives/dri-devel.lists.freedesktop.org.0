Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B839E3418F6
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 10:57:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFF456E9E1;
	Fri, 19 Mar 2021 09:57:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C340A6E9DD
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 09:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616147864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UsREr7KDpE+wzs5UrnU5bq27soizKgijk7jOaTMCif8=;
 b=V6Iqbxz2n64U1zJiA+9pWxx/O9XKThGpYU1nL0vMh0o73DI3C6KVY7Yq3J+riehiyRew1j
 RPaKb+nKRWE5kV/lJDhbEHuKLbmBmcXU/t4380hYiv9z39PiQxQgrEzOlr8FZsdnPpM066
 tsQSUnKMrVhrqa2iv3o/NTLL1oYX+pw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-116-6DDHsqNvPA68aWaIW49LLQ-1; Fri, 19 Mar 2021 05:57:42 -0400
X-MC-Unique: 6DDHsqNvPA68aWaIW49LLQ-1
Received: by mail-wr1-f70.google.com with SMTP id 9so5991479wrb.16
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 02:57:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UsREr7KDpE+wzs5UrnU5bq27soizKgijk7jOaTMCif8=;
 b=NVUkTCua73RwYqGrBBPi3lvMJ2k/CpVwxlEbhx3HaaPeSze8AlCpNR+aO3odYoUGzA
 Mz+4sgt3jmn3S/0hcz8gMwvIcbDtkXAQmL6y5nWV1YZwkcNHwXAs5MugJ9hVC7LfZKBK
 ZhsVBGPbOePNOtnmdtvKexaLQsIZ9F4foGitIachNvwhYQdnn1KCoMFTUdeqnYZkSzY9
 E8qRJIxhBphOF3eXz5zunugD7PyngNDbUCEkqR9D3v7Io5zYt1a69j4fy6Ryw6q/IegJ
 CzxfAB+D2UnAuzO8tD9CzMxkbCgl1wraSamy4+e2f0tkREEGLKou+MGBhInMDqJfmD+0
 oe9g==
X-Gm-Message-State: AOAM533UFYjlxnK7VloLW+yhbai0wiPP3gowcnR01RbhY1LhUvnjGq58
 3opOJf1ksvlWAQl4NC3D2S/DylOq/2+f9mMCvqyONvoVVrRuK2sWHjgzqQ5vlZyk+omnitGjiFq
 hivkkG2Y+2fA2tk/rgUjxbcgocq8qwv90GrPPeiO2Azj+
X-Received: by 2002:a1c:ddc6:: with SMTP id u189mr3005063wmg.171.1616147861265; 
 Fri, 19 Mar 2021 02:57:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwsfPewyX1Blixhz1/TwL1Ho9nuqLqhf9NMZtw3nWuN8DcHlGRHQ08GhxRWzE7D+tyku9OEoToJb5cXiQ8FNE8=
X-Received: by 2002:a1c:ddc6:: with SMTP id u189mr3005053wmg.171.1616147861146; 
 Fri, 19 Mar 2021 02:57:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210319082428.3294591-1-lee.jones@linaro.org>
 <20210319082428.3294591-13-lee.jones@linaro.org>
In-Reply-To: <20210319082428.3294591-13-lee.jones@linaro.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 19 Mar 2021 10:57:30 +0100
Message-ID: <CACO55tvitU6wHR1DVNAx1rGVEYRCs_PKQpdgrARPTMZgg3K_Tg@mail.gmail.com>
Subject: Re: [PATCH 12/19] drm/nouveau/dispnv04/crtc: Demote non-conforming
 kernel-doc headers
To: Lee Jones <lee.jones@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 19, 2021 at 9:25 AM Lee Jones <lee.jones@linaro.org> wrote:
>
> Fixes the following W=1 kernel build warning(s):
>
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c:462: warning: Function parameter or member 'crtc' not described in 'nv_crtc_mode_set_regs'
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c:462: warning: Function parameter or member 'mode' not described in 'nv_crtc_mode_set_regs'
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c:640: warning: Function parameter or member 'crtc' not described in 'nv_crtc_mode_set'
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c:640: warning: Function parameter or member 'mode' not described in 'nv_crtc_mode_set'
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c:640: warning: Function parameter or member 'adjusted_mode' not described in 'nv_crtc_mode_set'
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c:640: warning: Function parameter or member 'x' not described in 'nv_crtc_mode_set'
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c:640: warning: Function parameter or member 'y' not described in 'nv_crtc_mode_set'
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c:640: warning: Function parameter or member 'old_fb' not described in 'nv_crtc_mode_set'
>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/gpu/drm/nouveau/dispnv04/crtc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> index f9e962fd94d0d..f9a276ea5a9e0 100644
> --- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> +++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> @@ -449,7 +449,7 @@ nv_crtc_mode_set_vga(struct drm_crtc *crtc, struct drm_display_mode *mode)
>         regp->Attribute[NV_CIO_AR_CSEL_INDEX] = 0x00;
>  }
>
> -/**
> +/*
>   * Sets up registers for the given mode/adjusted_mode pair.
>   *
>   * The clocks, CRTCs and outputs attached to this CRTC must be off.
> @@ -625,7 +625,7 @@ nv_crtc_swap_fbs(struct drm_crtc *crtc, struct drm_framebuffer *old_fb)
>         return ret;
>  }
>
> -/**
> +/*
>   * Sets up registers for the given mode/adjusted_mode pair.
>   *
>   * The clocks, CRTCs and outputs attached to this CRTC must be off.
> --
> 2.27.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
