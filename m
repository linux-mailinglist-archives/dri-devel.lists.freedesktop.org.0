Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFDC741017C
	for <lists+dri-devel@lfdr.de>; Sat, 18 Sep 2021 00:49:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AFF96E0CD;
	Fri, 17 Sep 2021 22:49:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2873F6E0CD
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 22:49:16 +0000 (UTC)
Received: by mail-qk1-x731.google.com with SMTP id m21so22214226qkm.13
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 15:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gD3D1HE4zYILu0+ZzkTQiVhB8QdO4UEirY2pAFsXAsg=;
 b=DNI0JghGS/WxXoZfwSOl/X9w3UNCgpUUCeVhuj6wL4UmBoTqF0gmnpp44a7/HPq10w
 HRI/x3+zg2doHDzTKrVweEnN1amNMoITseoC+BKj2ADxrlWrKcbVX+BVykGKpd3z+tVo
 HWZ70ILMD4fKmMZjSXvOX1FRUirS4gZ7baPsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gD3D1HE4zYILu0+ZzkTQiVhB8QdO4UEirY2pAFsXAsg=;
 b=5KQeRG4aYk0fG9J2giwS9xjtbnso6xYen0GHjaq8oWKJw6wjEBxpgHjSWD5ZF+/jt0
 rrcvsP5kdqPXtx4pG/3+cULrpQ8MPkjoEb7GTHb+My1svVlEoku/qHjEOoD6ppZibNIa
 StP69Tc1W9wanfySoySe/molf3tXhqi5apqUTTkJRhCLL7LpOLKNBd9iDCjj4/CYjtfk
 5/JeoPee6zZ4+n2vK76NXpVMlQFIRydn3y9jP4jzIxjcuYPvJGOB8WJNtwBS+FHXJzQ3
 EcECNFVWzMom8iK14hcnmX73iW7/BSY+w5Rn9ALAjs/SsveBeEQQhiBD4xVlChD07X75
 OTEQ==
X-Gm-Message-State: AOAM532BIxO80bKi2Rtx8ukd+Hf9Uq4EPIQVTm032nogaXYgSANi/Jed
 NjG7BDYL9pQ+7foP8X+Id9qC2UvNjKQW1yvPkcgFqQ==
X-Google-Smtp-Source: ABdhPJwupEDp9zIQbb4xnXalet3Zjc0UBz5BI0iQ8rOV46nAslGCfwjYWs5+DQuj8YXFe9ziyqnHUW4xEWCQCk73Jgw=
X-Received: by 2002:a25:6744:: with SMTP id b65mr1144453ybc.100.1631918955276; 
 Fri, 17 Sep 2021 15:49:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210914162825.v3.1.I85e46da154e3fa570442b496a0363250fff0e44e@changeid>
 <20210914162825.v3.2.Ib06997ddd73e2ac29e185f039d85cfa8e760d641@changeid>
 <CAE-0n53BXh3_6jEW5oTbPA-V=MSaN=RvqaU8uoY9GNOm-0Pv_g@mail.gmail.com>
 <CAD=FV=WKQg-fU1jaSOh3RTa5HpSAiTzt2-Sycwt59uv1WemYxg@mail.gmail.com>
 <CAE-0n539tJLLWHdL65ZU_1qOzA-RsEqGqVi-19VLHz_W5dT6VA@mail.gmail.com>
 <CAD=FV=U_FX_Rg=h+w0yzpzi7fcUCg0Thn2_nXixsCRVsYFUGHQ@mail.gmail.com>
 <CAE-0n52F6j-qfA_h76BPyMRHi7hJzm6bX8eD5jS-C+ydz=vkBA@mail.gmail.com>
 <CAD=FV=XdN6SLZQ=kAe4S7Z7CjSrqnAQsj2uRiePXKFp07chVBg@mail.gmail.com>
 <CAE-0n52vqjGgdNMFBjW=7vo5B3wZcbnggpzQS05vb7Rr3dO8Vw@mail.gmail.com>
 <CAD=FV=WPOvL5xK+nFtgcyH=99=pMFs2eogO0XTg=32Q4QOU+4g@mail.gmail.com>
In-Reply-To: <CAD=FV=WPOvL5xK+nFtgcyH=99=pMFs2eogO0XTg=32Q4QOU+4g@mail.gmail.com>
From: Philip Chen <philipchen@chromium.org>
Date: Fri, 17 Sep 2021 15:49:04 -0700
Message-ID: <CA+cxXhmOPUxe=GH7f-BMUVD=FF-0+18ThQc4EthwTY0+epr3Ug@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] drm/bridge: parade-ps8640: Use regmap APIs
To: Doug Anderson <dianders@chromium.org>
Cc: Stephen Boyd <swboyd@chromium.org>, LKML <linux-kernel@vger.kernel.org>, 
 Andrzej Hajda <a.hajda@samsung.com>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
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

Hi Doug and Stephen,

Thanks for the review.
Before we reach a consensus on the best logging option, I'll just
remove the printouts from this patch and just return PTR_ERR.
Once we reach a consensus, we can probably improve logging in a separate patch.

On Fri, Sep 17, 2021 at 8:02 AM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Thu, Sep 16, 2021 at 11:12 PM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > > > > In the case of devm_regmap_init_i2c(), the driver could be fine but
> > > > > you might be trying to instantiate it on a system whose i2c bus lacks
> > > > > the needed functionality. That's not a bug in the bridge driver but an
> > > > > error in system integration. Yeah, after bringup of the new system you
> > > > > probably don't need the error, but it will be useful during people's
> > > > > bringups year after year.
> > > > >
> > > >
> > > > The point I'm trying to make is that these error messages in probe
> > > > almost never get printed after the driver is brought up on the hardware
> > > > that starts shipping out to non-kernel developers. Of course they happen
> > > > when kernel devs are enabling new hardware year after year on the same
> > > > tried and tested driver. They're worthwhile messages to have to make our
> > > > lives easier at figuring out some misconfiguration, etc. The problem is
> > > > they lead to bloat once the bringup/configuration phase is over.
> > > >
> > > > At one point we directed driver authors at dev_dbg() for these prints so
> > > > that the strings would be removed from the kernel image if debugging
> > > > wasn't enabled. It looks like dev_err_probe() goes in the opposite
> > > > direction by printing an error message and passing the string to an
> > > > exported function, so dev_dbg() won't reduce the image size. Ugh!
> > >
> > > So maybe the key here is that "CONFIG_PRINTK=n" is not the same as
> > > "CONFIG_I_THINK_PROBE_ERRORS_ARE_BLOAT" and it's not just that one has
> > > a more flippant name than the other. I think your argument about the
> > > fact that these errors almost never come up in practice is actually
> > > true for pretty much _all_ probe errors, isn't it? So if you wanted to
> > > keep non-probe errors in your system (keep PRINTK=y) and just do away
> > > with these bloat-y probe errors then dev_err_probe() could really be
> > > the key and there'd be a big benefit for using for all these errors
> > > during probe, not just ones that have a chance of deferring. ...and
> > > yes, you could make this config do something fancy like do a stack
> > > dump or print the return address if you actually hit one of these
> > > errors once you've thrown away the string.
> >
> > Yes, but it's also just as important to push similar messages, i.e. "I
> > failed to get some resource", into the API that hands resources out so
> > that bloat is minimized further and drivers are kept simple.
>
> Sure, but this is a slippery slope. If there's any chance that a
> caller might want to know about the error but _not_ want the error
> message printed then you can't push the error message into the API.
> It's really hard to find error cases (even with "get resource" type
> functions) where the caller _always_ wants the error reported. Even
> kmalloc() has a nod to this with __GFP_NOWARN, though I'm not
> advocating adding a "no warn" flag to all APIs. It's always possible
> that the caller is expecting some types of errors and handles the case
> elegantly.
>
> Let's pop all the way back up to the original point here, which was
> about devm_regmap_init_i2c(). What should happen with errors? Let's
> look specifically at the errors that could be returned by
> regmap_get_i2c_bus() which is the first thing devm_regmap_init_i2c()
> tries to do. Those errors have to do with the i2c bus not supporting
> the features needed by our regmap.
>
>
> a) We could return the error without printing anything like the code does today.
>
> No bloat, but during bringup of this bridge chip on a new i2c bus we'd
> have to manually add printouts to the probe function to figure out
> this error.
>
>
> b) We could push error reporting into regmap_get_i2c_bus().
>
> No per-driver bloat, but some drivers might have a legitimate reason
> not to have an error print here. Perhaps they have a fallback `regmap`
> config that they want to be able to use that works with different bus
> capabilities. I don't think we can do this.
>
>
> c) We could use dev_dbg() to print the error
>
> Only bloat if dynamic debug or DEBUG is defined
>
>
> d) We could use dev_err_probe() to print the error
>
> Extra bloat, though it could be minimized (without sacrificing all
> "printk") with a future patch to drop the string from dev_err_probe()
> and perhaps replace it with a WARN_ON(). Also handles the fact that
> perhaps someday someone might find a reason that regmap_get_i2c_bus()
> and/or devm_regmap_init_i2c() should suddenly start returning
> -EPROBE_DEFER.
>
>
> I'm still advocating for "d)" above and I believe you originally
> advocated for "a)" or "c)". It's really not such a huge deal, so if
> you're adamant about "a)" then I'll shut up. I'm curious if I've
> managed to convince you all about "d)" though.
>
> -Doug
