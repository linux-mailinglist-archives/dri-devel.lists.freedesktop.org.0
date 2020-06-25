Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4802B2097F6
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jun 2020 02:47:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A07BC6E88B;
	Thu, 25 Jun 2020 00:47:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DC186E8AB
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jun 2020 00:47:26 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id ft14so1078059pjb.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jun 2020 17:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=05voGHapV3v2tFXJ01TbMw21PCVprhpQaXbrlBrqygY=;
 b=FVOb9GIfBGZ922ZCKREGsKrLGYAuqMPyiKgSLOBvk9Zo4hrf2pVzCVps/xq6fAtGjo
 nvdV/tBax4EN45Mge61+BA1qJsG0KI09cVvmIft03LU5Mke/DZNk/zVq2gsqktAD9w5V
 Ia8OUwtNHXXBbJUGuBTHjdUNZJKkYiMx7porkR90WbxjAWWkFQPm5lUwymAwjGho9ANr
 jKaAwktoh0Pru3tVJlxwARxJ6Iruu1/38rk5xY6C6/vTxiDmAn3XUDOxpIYRW+Btea30
 qJ6N9jSM534sia6UxDV6033vAsF6pNYVSl3e6/BPL71m/lKk1p9Mgj2yTtOTF/qt9o2b
 COlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=05voGHapV3v2tFXJ01TbMw21PCVprhpQaXbrlBrqygY=;
 b=YRLzb5ODHUPu8WKSNIQRgtjmSedm5QUjJXBfJ1jrTncw5E3h56h4lnwR8hbrctBJF1
 apG1+cOnkJpzf7lkw0+o+r5n3anRoWpH0x7VigJPLUJ6ZjmxtpW6p8Pd9Lxhrmz4ZJTh
 FmyFFnWjQHtthBa7DbZvbu1x2OdQg7Jsu0f3WEx3kLnJsLt0FeQLb1NFEx1jrRby29ax
 L8x5WympADSS3h5Uv9nCR5zbsvYNGvZdhf2doACzUJcUYfgW+d7Lwp/uRYpegE9WU888
 9CY6sqWOv3Rzso5o+5iWUw0Ip0nifj7ZkiAQcaGvvpd465ehgY//272EofttGi++pzFP
 vV+Q==
X-Gm-Message-State: AOAM531EQ4ha2AWy8P9JXQYUejWr/nLWMn5aezu5YmovJSqYwZSTPERq
 BsyrMYu5u+E5fqmgZst3s64=
X-Google-Smtp-Source: ABdhPJx2JugfcpQsNsP+qu0DqzyhWFIb/RDnlrCiM12R4lWEaL504i0IX2I61z5IXtK8bgEKpBE1NQ==
X-Received: by 2002:a17:90a:7401:: with SMTP id
 a1mr453250pjg.218.1593046046228; 
 Wed, 24 Jun 2020 17:47:26 -0700 (PDT)
Received: from arch ([2601:600:9500:4390::aa23])
 by smtp.gmail.com with ESMTPSA id s36sm17901897pgl.35.2020.06.24.17.47.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2020 17:47:25 -0700 (PDT)
Message-ID: <94e6d4d0e047d306d96717b5cdd2442b21ea9932.camel@gmail.com>
Subject: Re: [RFC PATCH 1/2] drm/hyperv: Add DRM driver for hyperv synthetic
 video device
From: Deepak Rawat <drawat.floss@gmail.com>
To: Gerd Hoffmann <kraxel@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 24 Jun 2020 17:47:23 -0700
In-Reply-To: <20200623161742.u6hnb7iodptv4s6t@sirius.home.kraxel.org>
References: <20200622110623.113546-1-drawat.floss@gmail.com>
 <20200622110623.113546-2-drawat.floss@gmail.com>
 <20200622124622.yioa53bvipvd4c42@sirius.home.kraxel.org>
 <f6923296368dc676df10e75593ebc18575efc476.camel@gmail.com>
 <20200623094225.GJ20149@phenom.ffwll.local>
 <20200623161742.u6hnb7iodptv4s6t@sirius.home.kraxel.org>
User-Agent: Evolution 3.36.3 
MIME-Version: 1.0
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
Cc: linux-hyperv@vger.kernel.org, Stephen Hemminger <sthemmin@microsoft.com>,
 David Airlie <airlied@linux.ie>, Haiyang Zhang <haiyangz@microsoft.com>,
 Wei Liu <wei.liu@kernel.org>, dri-devel@lists.freedesktop.org,
 Michael Kelley <mikelley@microsoft.com>, Jork Loeser <jloeser@microsoft.com>,
 Wei Hu <weh@microsoft.com>, K Y Srinivasan <kys@microsoft.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


> > > Thanks for the review. Unfortunately only the first vmbus message
> > > take
> > > effect and subsequent calls are ignored. I originally implemented
> > > using
> > > vram helpers but I figured out calling this vmbus message again
> > > won't
> > > change the vram location.
> 
> /me notices there also is user_ctx.  What is this?

Not sure, I will try to get in touch with hyper-v folks internally to
see if page-flip can be used.

> 
> > I think that needs a very big comment. Maybe even enforce that with
> > a
> > "vram_gpa_set" boolean in the device structure, and complain if we
> > try to
> > do that twice.
> > 
> > Also I guess congrats to microsoft for defining things like that :-
> > /
> 
> I would be kind of surprised if the virtual device doesn't support
> pageflips.  Maybe setting vram_gpa just isn't the correct way to do
> it.  Is there a specification available?
> 
> There are a number of microsoft folks in Cc:  Anyone willing to
> comment?
> 
> thanks,
>   Gerd
> 
> PS: And, yes, in case pageflips really don't work going with shmem
>     helpers + blits is reasonable.
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
