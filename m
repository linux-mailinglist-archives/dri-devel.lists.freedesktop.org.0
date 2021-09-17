Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B74140FB03
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 17:02:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF1466ED90;
	Fri, 17 Sep 2021 15:02:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 002456ED90
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 15:02:52 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id m4so10599363ilj.9
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 08:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=of3pzp6ngh1THhlWWwkrDWJfjHn4qZe44WtK5BBm5Bs=;
 b=hNjwfSyRvCw84sKueLQnIlHOzk7sD/liJnudOd0IhLnnowuPUDeyviQGmRg2x0dBZF
 ktS39oeyRZOPLccweWkyZsgR2ur6Tc3YXX7mef4Hm1CphYNd3LbIstIRtlTA24a4KDDy
 Dc1RFNJu6EJaMQfHJUsg7/WhCvieiw5QmwMmo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=of3pzp6ngh1THhlWWwkrDWJfjHn4qZe44WtK5BBm5Bs=;
 b=77dJhQpW+yKOWAu4UXyIB+dsI3DNge7dmK5E0baeb2siL2qTLd9WPr0XP0zs+7xATY
 5U3F7vlpKVfuVdVtl6qPAiO0omxZqN5PAISU+XQXBdN2UGKm7SvWvSCPtRD9GFpjVpDR
 mNRD0orXQL0/XPgk6D9QTRkRVIUnp7+DgU8Ak9hjWVAgCHg/iZzlcl8RlSUmcte3fTmR
 Z54h5vO58Q8Hw7U5J4iH4sZ06iWeY/zvB3UnYyvtRbG8Asn72idDw3qK650Uw+RB79MI
 kLV20WntdXII29iN7VB+Qxfc3ezwI6A3fuacSRurjp//mikG2HgogwnG4GE3o6cLtK4h
 mzEg==
X-Gm-Message-State: AOAM533wyn7A7hi7/ZC/xEmXbtukkeGeUZzGDsrhibqtDp31Xb4WQpsD
 h94x43cSm+Ejccf0jN8kmK/U9b71zQs07Q==
X-Google-Smtp-Source: ABdhPJzR2qq17CGyM1Y4ibrdvf3D1fjWdxbTJ3z7RHUcFK9oFs6qAMJ4U4oJ230t7CUp4KjFu36hqw==
X-Received: by 2002:a92:c26f:: with SMTP id h15mr8119482ild.271.1631890971973; 
 Fri, 17 Sep 2021 08:02:51 -0700 (PDT)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com.
 [209.85.166.44])
 by smtp.gmail.com with ESMTPSA id s7sm3534121ioe.11.2021.09.17.08.02.50
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Sep 2021 08:02:51 -0700 (PDT)
Received: by mail-io1-f44.google.com with SMTP id p80so5979624iod.10
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Sep 2021 08:02:50 -0700 (PDT)
X-Received: by 2002:a02:6d59:: with SMTP id e25mr9249829jaf.68.1631890969830; 
 Fri, 17 Sep 2021 08:02:49 -0700 (PDT)
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
In-Reply-To: <CAE-0n52vqjGgdNMFBjW=7vo5B3wZcbnggpzQS05vb7Rr3dO8Vw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 17 Sep 2021 08:02:36 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WPOvL5xK+nFtgcyH=99=pMFs2eogO0XTg=32Q4QOU+4g@mail.gmail.com>
Message-ID: <CAD=FV=WPOvL5xK+nFtgcyH=99=pMFs2eogO0XTg=32Q4QOU+4g@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] drm/bridge: parade-ps8640: Use regmap APIs
To: Stephen Boyd <swboyd@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Philip Chen <philipchen@chromium.org>,
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

Hi,

On Thu, Sep 16, 2021 at 11:12 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> > > > In the case of devm_regmap_init_i2c(), the driver could be fine but
> > > > you might be trying to instantiate it on a system whose i2c bus lacks
> > > > the needed functionality. That's not a bug in the bridge driver but an
> > > > error in system integration. Yeah, after bringup of the new system you
> > > > probably don't need the error, but it will be useful during people's
> > > > bringups year after year.
> > > >
> > >
> > > The point I'm trying to make is that these error messages in probe
> > > almost never get printed after the driver is brought up on the hardware
> > > that starts shipping out to non-kernel developers. Of course they happen
> > > when kernel devs are enabling new hardware year after year on the same
> > > tried and tested driver. They're worthwhile messages to have to make our
> > > lives easier at figuring out some misconfiguration, etc. The problem is
> > > they lead to bloat once the bringup/configuration phase is over.
> > >
> > > At one point we directed driver authors at dev_dbg() for these prints so
> > > that the strings would be removed from the kernel image if debugging
> > > wasn't enabled. It looks like dev_err_probe() goes in the opposite
> > > direction by printing an error message and passing the string to an
> > > exported function, so dev_dbg() won't reduce the image size. Ugh!
> >
> > So maybe the key here is that "CONFIG_PRINTK=n" is not the same as
> > "CONFIG_I_THINK_PROBE_ERRORS_ARE_BLOAT" and it's not just that one has
> > a more flippant name than the other. I think your argument about the
> > fact that these errors almost never come up in practice is actually
> > true for pretty much _all_ probe errors, isn't it? So if you wanted to
> > keep non-probe errors in your system (keep PRINTK=y) and just do away
> > with these bloat-y probe errors then dev_err_probe() could really be
> > the key and there'd be a big benefit for using for all these errors
> > during probe, not just ones that have a chance of deferring. ...and
> > yes, you could make this config do something fancy like do a stack
> > dump or print the return address if you actually hit one of these
> > errors once you've thrown away the string.
>
> Yes, but it's also just as important to push similar messages, i.e. "I
> failed to get some resource", into the API that hands resources out so
> that bloat is minimized further and drivers are kept simple.

Sure, but this is a slippery slope. If there's any chance that a
caller might want to know about the error but _not_ want the error
message printed then you can't push the error message into the API.
It's really hard to find error cases (even with "get resource" type
functions) where the caller _always_ wants the error reported. Even
kmalloc() has a nod to this with __GFP_NOWARN, though I'm not
advocating adding a "no warn" flag to all APIs. It's always possible
that the caller is expecting some types of errors and handles the case
elegantly.

Let's pop all the way back up to the original point here, which was
about devm_regmap_init_i2c(). What should happen with errors? Let's
look specifically at the errors that could be returned by
regmap_get_i2c_bus() which is the first thing devm_regmap_init_i2c()
tries to do. Those errors have to do with the i2c bus not supporting
the features needed by our regmap.


a) We could return the error without printing anything like the code does today.

No bloat, but during bringup of this bridge chip on a new i2c bus we'd
have to manually add printouts to the probe function to figure out
this error.


b) We could push error reporting into regmap_get_i2c_bus().

No per-driver bloat, but some drivers might have a legitimate reason
not to have an error print here. Perhaps they have a fallback `regmap`
config that they want to be able to use that works with different bus
capabilities. I don't think we can do this.


c) We could use dev_dbg() to print the error

Only bloat if dynamic debug or DEBUG is defined


d) We could use dev_err_probe() to print the error

Extra bloat, though it could be minimized (without sacrificing all
"printk") with a future patch to drop the string from dev_err_probe()
and perhaps replace it with a WARN_ON(). Also handles the fact that
perhaps someday someone might find a reason that regmap_get_i2c_bus()
and/or devm_regmap_init_i2c() should suddenly start returning
-EPROBE_DEFER.


I'm still advocating for "d)" above and I believe you originally
advocated for "a)" or "c)". It's really not such a huge deal, so if
you're adamant about "a)" then I'll shut up. I'm curious if I've
managed to convince you all about "d)" though.

-Doug
