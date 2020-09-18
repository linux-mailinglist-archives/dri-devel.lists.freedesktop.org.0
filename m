Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D30726FD4E
	for <lists+dri-devel@lfdr.de>; Fri, 18 Sep 2020 14:48:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 886C66ECE7;
	Fri, 18 Sep 2020 12:48:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E30B6ECE7
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 12:48:12 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id e17so5219795wme.0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 05:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=j6z/UJ7CNrSXR9o7Cfm16LszuY4Y2gIbIznxSeH0B9A=;
 b=lG981rnRtgZAm6syEr1bZwt4N84LNEPYwI/TtyOO/VThTo/f9Li5vCEwYo6F3ZuutF
 6Gslyar/X9Ttu77h6dUYdULlgBkFmFESpKnO8YxLOmCCqVxm+xNqSqCSvB8T2cqti2My
 /HA7oinA8lX9Ie/JT9IPM3+mo8pr5NmmDoZmI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=j6z/UJ7CNrSXR9o7Cfm16LszuY4Y2gIbIznxSeH0B9A=;
 b=Lt3Yf6lGuynh1qt4jcRjE9hHH6JZtH7BymG7ST+QPtVaZPCNwfuNLH5TrUzCWY3aI9
 3Dmkx4uRb2sLmGxJTq3UUQpU+41jJZK1Zo+gaSg4E6yZY5gz5+QW4D/QyIYil+fypgGO
 H90RTS+OAGVRCcXA18/yQoQpp+iqni0MXKTdwjJ7cv/7l7BnBqNJl+OKsHhnYztogEAy
 LKtLbvkUYmQStEC/DMgy2Wx25tkWl9+ymMQ3obC7kt0AOjTlW6+9ttaUG4Cg4u2/21b5
 qtQgBDQ66K9/gnHXHihS8lCNTENDdCNvbLeYcMBIMpQaPkYmgYFApQBwvcATiMy3B2Fm
 PFmQ==
X-Gm-Message-State: AOAM532DNuGIE1FKoYwxuT5Hqx6a2+2hNhrzc32Zrmo9dYWfjOv2PXkr
 BNGSBoXvg3YIXe00mmbiKQiLohvDLT5UQRXO
X-Google-Smtp-Source: ABdhPJyAwBd6mEl7zhhB5tmC68RAnfpPY5rzLITEX8vAOCgabHANhMyPXmiUCR2jm9cGTwuUEaAfOw==
X-Received: by 2002:a7b:c141:: with SMTP id z1mr15912912wmi.79.1600433290849; 
 Fri, 18 Sep 2020 05:48:10 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b18sm5415123wrn.21.2020.09.18.05.48.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2020 05:48:10 -0700 (PDT)
Date: Fri, 18 Sep 2020 14:48:08 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 0/3] fbdev: stop using compat_alloc_user_space
Message-ID: <20200918124808.GD438822@phenom.ffwll.local>
Mail-Followup-To: Arnd Bergmann <arnd@arndb.de>, linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 "David S . Miller" <davem@davemloft.net>, hch@lst.de,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20200918100812.1447443-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200918100812.1447443-1-arnd@arndb.de>
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
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "David S . Miller" <davem@davemloft.net>, hch@lst.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Sep 18, 2020 at 12:08:10PM +0200, Arnd Bergmann wrote:
> The fbdev code uses compat_alloc_user_space in a few of its
> compat_ioctl handlers, which tends to be a bit more complicated
> and error-prone than calling the underlying handlers directly,
> so I would like to remove it completely.
> 
> This modifies two such functions in fbdev, and removes another
> one that is completely unused.
> 
>     Arnd
> 
> Arnd Bergmann (3):
>   fbdev: simplify fb_getput_cmap()
>   fbdev: sbuslib: remove unused FBIOSCURSOR32 helper
>   fbdev: sbuslib: remove compat_alloc_user_space usage

Looks all good, but we're also kinda looking for a new volunteer for
handling fbdev patches ... drm-misc commit rights, still not interested?
-Daniel

> 
>  drivers/video/fbdev/core/fbmem.c |  44 +++++------
>  drivers/video/fbdev/sbuslib.c    | 124 ++++++++++++++++++-------------
>  2 files changed, 90 insertions(+), 78 deletions(-)
> 
> -- 
> 2.27.0
> 
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
