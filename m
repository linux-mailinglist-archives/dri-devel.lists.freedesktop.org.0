Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAE3292AEC
	for <lists+dri-devel@lfdr.de>; Mon, 19 Oct 2020 17:56:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91A6D6EA06;
	Mon, 19 Oct 2020 15:56:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C82A46EA06
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Oct 2020 15:56:23 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id g12so269087wrp.10
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Oct 2020 08:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=ExyTIzaV0pr3Eai44qIOEkkWvYQoFZOO2NPesnlxaJg=;
 b=LauR/Atww+62lrIAoI0S2aXFYC3jXL8fwHGmpYG11gT0kpCJSlFHUFXzKtkFAV4O0P
 HgNhi4Xzc7LNZ86YW6xp2qpqxF9fUjmU3Sww/YmAaNfW8lzaxOhMfDssyPcFYnBMQloE
 zTbV1d/w/3aqdvChRUejuygCo/WdvsgMuPWKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=ExyTIzaV0pr3Eai44qIOEkkWvYQoFZOO2NPesnlxaJg=;
 b=lh6pM0xEwpbLGZJ7ceTf6XDhrO7l1Bgktedg2xxjZVaBwTMcslY6ElI3yLrN3KWhzY
 +EutcsLxRDc9zfwnlmFYGgfOePy1Djhtrb5jzsr6UVlc+mvaszmir7eoHWUca7eZFnaH
 HCYoNC5cygcT11ddoDkCBmmsjC/nQqB1oFDZkKJUMdQHUXa6ewdhR6ZYGi4JaW/1e/jQ
 +6JB4OtX/FPsEiGipe6UN6py5OAQNVGTIGJYzEw//NQ14/P/ndyqFj3kn0o1b6CShMxN
 Q9K7oNXkNqSNK60E72nITRJcf6y9FoZQ/PvEtkEpxMFzYMjvleobIqKld6yutJN/epVT
 BTjQ==
X-Gm-Message-State: AOAM530z+7snJwm99LBGqf18UO0I1fKlw+gI1MxJ2KKHCzfCMxxVEmrh
 TGCZgbEWpim93Ki7tE77+HLkQA==
X-Google-Smtp-Source: ABdhPJwXRObsL8ejRw2Heh5XRu+rRn4ydix5fTKFeZYFLvSwm2ojMD2la1MO54JxNhao+Rk9S4EHZg==
X-Received: by 2002:adf:deca:: with SMTP id i10mr257359wrn.96.1603122982550;
 Mon, 19 Oct 2020 08:56:22 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w11sm191745wrs.26.2020.10.19.08.56.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 08:56:21 -0700 (PDT)
Date: Mon, 19 Oct 2020 17:56:19 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Peilin Ye <yepeilin.cs@gmail.com>
Subject: Re: [PATCH 2/2 RESEND] docs: fb: Add font_6x8 to available built-in
 fonts
Message-ID: <20201019155619.GH401619@phenom.ffwll.local>
Mail-Followup-To: Peilin Ye <yepeilin.cs@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Sven Schneider <s.schneider@arkona-technologies.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <717bb41dda8e2ed615f3faadfbc3e215de726d38.1603037079.git.yepeilin.cs@gmail.com>
 <20201018205401.698242-1-yepeilin.cs@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201018205401.698242-1-yepeilin.cs@gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: linux-fbdev@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Sven Schneider <s.schneider@arkona-technologies.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Oct 18, 2020 at 04:54:01PM -0400, Peilin Ye wrote:
> Recently we added a new 6x8 font in commit e2028c8e6bf9 ("lib/fonts: add
> font 6x8 for OLED display"). Add its name to the "compiled-in fonts"
> list.
> 
> Signed-off-by: Peilin Ye <yepeilin.cs@gmail.com>
> ---
> Resending +Cc: dri-devel, sorry if I spammed.

Both this and patch 1/2 with the actual bugfix merged to
drm-misc-next-fixes, should still make it into the merge window before
-rc1.

Thanks, Daniel

> 
>  Documentation/fb/fbcon.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/fb/fbcon.rst b/Documentation/fb/fbcon.rst
> index 9aad964b767c..57f66de2f7e1 100644
> --- a/Documentation/fb/fbcon.rst
> +++ b/Documentation/fb/fbcon.rst
> @@ -81,7 +81,7 @@ C. Boot options
>  1. fbcon=font:<name>
>  
>  	Select the initial font to use. The value 'name' can be any of the
> -	compiled-in fonts: 10x18, 6x10, 7x14, Acorn8x8, MINI4x6,
> +	compiled-in fonts: 10x18, 6x10, 6x8, 7x14, Acorn8x8, MINI4x6,
>  	PEARL8x8, ProFont6x11, SUN12x22, SUN8x16, TER16x32, VGA8x16, VGA8x8.
>  
>  	Note, not all drivers can handle font with widths not divisible by 8,
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
