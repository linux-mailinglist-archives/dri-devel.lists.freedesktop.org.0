Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 630B4543933
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 18:41:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 518EA112ADB;
	Wed,  8 Jun 2022 16:41:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D700E112ADA
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 16:41:00 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id v14so2846621wra.5
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 09:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=4KALtjBBT08O9f+W5oEVbO7yUQhwk75FRj0E2UhZnuc=;
 b=B5Zg3XIkQ6j/FDkQy1jOteslSh3gNT5GmdEr/237BWBZiVNNqq7D345YLl0kMTCNln
 P1n/8QmUhkUUmlyiQMLQbG+BPe5WZsml8SvuwUt6uv68QY7XiEVlBL6FlqA8cK0O9VOg
 M0l9SKxRQ2utlaPJgl9VpIJHEcmW+qRV/ueqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=4KALtjBBT08O9f+W5oEVbO7yUQhwk75FRj0E2UhZnuc=;
 b=EXANkj9V3h/GjkjDCJePKiZnFAm732x3Vvff32X/KaIg0cKfwfv9oeVS1BceUoCmjC
 fSoh10xg/mMQaiAgVmiyK3mggf3UL6Bppcc91NCrRRyQPSpFXfy/KLSP94jOKUs+aE4n
 g1eDcirYeufCFlyIXNaj/656a7faVIoEVcJmnFrSX91c+RnuoiyVvvo2tts80OuhsdoK
 ku0QX/FT1j0SnpAsuKp9WKSf25a0/YroBV6BFDeIZFh9nLCPUmuU1+F2yM73+Xarsboi
 nfF630h9G5yHTNgcmDVAH/rVqeFGQC2UTyR/DjlhvYN5IvKJIg9sbYON8nheqDxE0qb1
 fJtg==
X-Gm-Message-State: AOAM531ExocadtfzWIWHrSxcN3XbuLhT22hD4oDWHg9v1ph1708gkPFv
 OhuZfH/juOnYwyV6zmbF7fr2A3QW5cAjxg==
X-Google-Smtp-Source: ABdhPJySw0YXyJN2Dkkyfzo1EfPGQryvgBGuPdH2UDIEf43gsm4hA6IhEX0HCUAjxwSI2SpgTEnu1w==
X-Received: by 2002:adf:fa03:0:b0:210:dcda:ee82 with SMTP id
 m3-20020adffa03000000b00210dcdaee82mr33745633wrr.139.1654706459449; 
 Wed, 08 Jun 2022 09:40:59 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 p15-20020a05600c358f00b003973ea7e725sm37090494wmq.0.2022.06.08.09.40.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 09:40:58 -0700 (PDT)
Date: Wed, 8 Jun 2022 18:40:57 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] fbcon: Remove obsolete reference to initmem_freed
Message-ID: <YqDRGRFbATkhhZFv@phenom.ffwll.local>
References: <b8b9147a48e233fe32e072f2085c7b413cd92a00.1654702835.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8b9147a48e233fe32e072f2085c7b413cd92a00.1654702835.git.geert+renesas@glider.be>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 08, 2022 at 05:41:16PM +0200, Geert Uytterhoeven wrote:
> initmem_freed was removed in v2.1.124, and the underlying issue was
> fixed for good in commit 92b004d1aa9f367c ("video/logo: prevent use of
> logos after they have been freed").
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

So I got totally lost in late_initcall_sync trying to figure out whether
there's any fun races against driver load, and I guess as long as you
don't manage to hotplug an usb display link at just the right time this
works.

But also that's all just the existing logo.c code, so pure distraction.

Thanks for your patch, pushed to drm-misc-next.
-Daniel

> ---
>  drivers/video/fbdev/core/fbcon.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
> index 594650452afd14d8..1be8aa9f80747987 100644
> --- a/drivers/video/fbdev/core/fbcon.c
> +++ b/drivers/video/fbdev/core/fbcon.c
> @@ -2180,7 +2180,6 @@ static int fbcon_switch(struct vc_data *vc)
>  	if (logo_shown == FBCON_LOGO_DRAW) {
>  
>  		logo_shown = fg_console;
> -		/* This is protected above by initmem_freed */
>  		fb_show_logo(info, ops->rotate);
>  		update_region(vc,
>  			      vc->vc_origin + vc->vc_size_row * vc->vc_top,
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
