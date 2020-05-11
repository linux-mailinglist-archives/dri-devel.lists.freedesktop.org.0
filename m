Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E054D1CD98C
	for <lists+dri-devel@lfdr.de>; Mon, 11 May 2020 14:22:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DAF36E448;
	Mon, 11 May 2020 12:22:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BAAA6E448
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 12:22:09 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id t199so14912436oif.7
 for <dri-devel@lists.freedesktop.org>; Mon, 11 May 2020 05:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZY5CwuQVCnYlEVabKI73ABVH1IvMEeXvCtNVZpf7Tro=;
 b=Pj24XGUuQs2GDZHSexFLKNpui+qj0s7VHxuw6NFvC0AvS2wbVsgJOvLE2Z+lvgMfRm
 nSuXG91tjVXxxeJXrR8bdbChneohaNZhXY+0Fim9wWiVQnqcxUubpu9GpMfwdp+HZFIn
 +GHIh+ZSVIl2yp0CQjYSVAVEJTIfKPJkIg0T8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZY5CwuQVCnYlEVabKI73ABVH1IvMEeXvCtNVZpf7Tro=;
 b=ol7BQGywEo4W2dKNCAb677Mwqcb/lLcGtsDx/Ye6d25Urr3Ik6V4mQs7DjZBEDF9MH
 UQjd5L5mh5xBYcT04s2rV8Y3beRhJ6GtueDLZO4gitHn0GRD7i4kc3KlCFVwU5u5Tbl0
 +e73BudOnmD0/85e72MORKFCghJphzwgxFGuXdTZOyl8jt8kYLNZaSk4snCQqoa24QtZ
 kPN/QNRflz5786MiB/UUoRv4Jp80jdyCkwRAJ12IO5zbMxe+WWJI+z60uaIOOI13EWVH
 ULYEgc13S+c2P//FAU/9/yXMJ8LkAlLRRZfzFRM7jN9CiY4R0hMUC5LLdBeV5hwgKZK2
 0TIQ==
X-Gm-Message-State: AGi0PuZIe5RSRbsJYQdwGqCQsE/G8/4rW83hiva8vNi3gNkNHrzugAki
 XXKwZDI3Pqcp1nltx/YNA+QjVq9lerqWJPEFMhNtrOz6
X-Google-Smtp-Source: APiQypLaLp1Py5/HgaUPfUd3OuFGQPYOI/YIpsVKy/0b6agJW6Aa7LgGQNmlP548/YKPc72Z7/+MpSjoZcyLL3lHGH8=
X-Received: by 2002:aca:52d5:: with SMTP id g204mr19438046oib.14.1589199728401; 
 Mon, 11 May 2020 05:22:08 -0700 (PDT)
MIME-Version: 1.0
References: <1589050310-19666-1-git-send-email-andrey.grodzovsky@amd.com>
 <20200511095433.GA206103@phenom.ffwll.local>
 <20200511114307.jfirnlvkikmulyhu@wunner.de>
In-Reply-To: <20200511114307.jfirnlvkikmulyhu@wunner.de>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 11 May 2020 14:21:57 +0200
Message-ID: <CAKMK7uGA7XHPwuS3GF9u+YQ-GRBfZzf5CCRH15Tx_qnH3Pcchw@mail.gmail.com>
Subject: Re: [PATCH 0/6] RFC Support hot device unplug in amdgpu
To: Lukas Wunner <lukas@wunner.de>
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
Cc: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 11, 2020 at 1:43 PM Lukas Wunner <lukas@wunner.de> wrote:
>
> On Mon, May 11, 2020 at 11:54:33AM +0200, Daniel Vetter wrote:
> > - One unfortunate thing with drm_dev_unplug is that the driver core is
> >   very opinionated and doesn't tell you whether it's a hotunplug or a
> >   driver unload. In the former case trying to shut down hw just wastes
> >   time (and might hit driver bugs), in the latter case driver engineers
> >   very much expect everything to be shut down.
>
> You can get that information at the PCI bus level with
> pci_dev_is_disconnected().  The flag queried by this function is set
> upon hot removal.  Be aware however that the device is guaranteed to
> be unreachable if the function returns true, but the converse is NOT
> guaranteed, i.e. the function may return false even though the device
> has just gone away.
>
> Those somewhat difficult semantics are one of the reasons why some
> people are skeptical of the function's merits (notably Greg KH).
> See this LWN article for more information:
>
> https://lwn.net/Articles/767885/
> (scroll down to the "Surprise removal" section)
>
> I've suggested to Greg a few years back that we should have a flag
> at the device level to indicate whether it's gone, not just at the bus
> level.  That way the property could be expressed regardless of the bus
> used.  It would facilitate the feature you're missing, that the driver
> core tells you whether it's a surprise removal or not.  Unfortunately
> Greg rejected the idea.

Ok, so at least for pci devices you could do something like

if (pci_dev_is_disconnected())
    drm_dev_unplug();
else
    drm_dev_unregister();

In the ->remove callback and both users and developers should be
happy. I guess for other drivers like usb/spi just yanking the cable
for driver hacking is good enough - loss of power should also reset
the device :-)
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
