Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A1CE3640BB
	for <lists+dri-devel@lfdr.de>; Mon, 19 Apr 2021 13:45:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D87136E226;
	Mon, 19 Apr 2021 11:45:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD4316E226
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 11:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618832738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=koc049HugtBARt6EjAzw6mtyEEpABQogvtRQVut/VZw=;
 b=PxHqrdeFzL0pYWIBxiX+595HwHlAFs+oJw+kmtVUa8ypVe7Tge6CTV/2rWDuGwrrDKVOGn
 9MF5ederkTuvrd8QlDx1URj3g1LIiPx1zhZ8h56vdfu28q5+i5kW9NoREtPgJXGw/MqBt4
 lGWa+GNWKUtyR5mo7Cn1St2RyT/qL9o=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-570-fqEQ2WMLMXOLUf7lpX7CeA-1; Mon, 19 Apr 2021 07:45:34 -0400
X-MC-Unique: fqEQ2WMLMXOLUf7lpX7CeA-1
Received: by mail-wr1-f69.google.com with SMTP id
 v2-20020a0560001622b0290106e28f8af8so6337823wrb.9
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Apr 2021 04:45:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=koc049HugtBARt6EjAzw6mtyEEpABQogvtRQVut/VZw=;
 b=TDvw16psUT5RJonVV2J7UTnczvQGiyDy/QY9BL4VC3XQAZKDR3sZ40kmaFq4AZqU9V
 c1ShUoR6QOAsiFkRHQpkAgieZGaAE6HnWZ9izVgWpIScEo3JF31YMQL7avz8U5DLxq25
 AuHZYymSS5Oc1jLc3D36eod7LBdnaVeYObEkL7S8LRSYaUsqqNVDtbEpKmk0Hu2rJWkT
 HDtxJfLAy7ZCsYkPnRHG4b/eV3x3NG1vUUmAiu54NWUXMbfPbVeAcYHtg5SUUeBflxDD
 m1HT25PnzBQMQDWMiKfQY1AyYGJzkFMv0AZ2K05/bpieK2tah9D2xM0rzmvGbXMxBUW5
 8s/Q==
X-Gm-Message-State: AOAM530N26aKp6skCqUU5j+ZoC2mXo1lyYGTql1nuIG02UfCdA5vSI51
 axT7OXJjJh63nOad8rg6mVJflU8NUFlgVWN0FparBF5x+n4cwOTPuOiST3moooDmYpD1kUPBJ/s
 xcc7A3S+IXIW9xU6TdsBdwd9CF+SYLQ0swxpp88MFx2A1
X-Received: by 2002:a5d:6983:: with SMTP id g3mr13595815wru.415.1618832733324; 
 Mon, 19 Apr 2021 04:45:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMWuQi4zxk85zmf73Pwt63xQbdTQuszlMMCk8bIRtx2iSyg8ZGa26+dC0kfmhUNyg8Km1sHUnjbaHgtAhKXgI=
X-Received: by 2002:a5d:6983:: with SMTP id g3mr13595801wru.415.1618832733209; 
 Mon, 19 Apr 2021 04:45:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210416143725.2769053-1-lee.jones@linaro.org>
 <20210416143725.2769053-10-lee.jones@linaro.org>
In-Reply-To: <20210416143725.2769053-10-lee.jones@linaro.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 19 Apr 2021 13:45:22 +0200
Message-ID: <CACO55tvWgRUnLsLY+d1-j3tjFQbOgzZzWszfNPjx0d1K+Smw5A@mail.gmail.com>
Subject: Re: [PATCH 09/40] drm/nouveau/dispnv04/crtc: Demote non-conforming
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

Reviewed-by: Karol Herbst <kherbst@redhat.com>

On Fri, Apr 16, 2021 at 4:38 PM Lee Jones <lee.jones@linaro.org> wrote:
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

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
