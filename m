Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E552540EDD5
	for <lists+dri-devel@lfdr.de>; Fri, 17 Sep 2021 01:21:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D64AC6E9AE;
	Thu, 16 Sep 2021 23:21:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 397E388ED5
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 23:21:27 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id a22so9933039iok.12
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 16:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZzSB36ZkwEpDl58uCbypLFCm2qihOMOcGHfbLv01Ydo=;
 b=UZHoORh1hC43GEKKx443VbZL9XCVPvVl/Zj8Gg17sfemdvC5o0hr5dt3SxHoMeK6d6
 e5h1Sqspq/OBIT+tx7oWZjlaQRbDu7ID59G8ThIWF0RYwiQaImBkFFbve8d5QlAUIjp8
 skqQTwOSnufyk1tSs+cV7kB1ZYz+2SRVuyePg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZzSB36ZkwEpDl58uCbypLFCm2qihOMOcGHfbLv01Ydo=;
 b=uPMe4vV1W1x8yaTBbhuL2hgpDtTXFmEqzrLFw+WzUYpu6GBtSKT9uo0mWMz6WCB0GK
 wL107XnfdNknDfnEyd5/KshQXbQ6GwjHrR8dpPjAsVCzhLux3lijx77fU2W3um4eS3v1
 lGA0C+WpvDG/plf5xvBr7DAckv2nshE+aj0Kntl9CRHbpRODwqwpYsB67cB9GCpmPxbB
 vuCyLWazr9VhoinAIVNPBP6B4KB3anvc68NRv0kZrPyk0xFJBCGpoUH8Iqf9dFXm1sWt
 U7ZEoFD2edAIQkpGOVEfhIv+FcrRbRD8+GNJkF8whCZukbZ+dzYodE4q9CZiFTShyyiO
 0bpA==
X-Gm-Message-State: AOAM53040jLaNfGbIu3IG8VjHOUCv1ZsHYcO2A/k7bUl+DTPoOqpQ0bO
 Y3ps/r8Udi9klZMpnP7WMune/aA6ikAUbQ==
X-Google-Smtp-Source: ABdhPJxW3HwlHOaJknETYLIBQNij8hWT1hwMFZu1PTfMQCkz/VyIRYe3FCUGasg3aXGduo1Un4Gxsw==
X-Received: by 2002:a05:6638:25cd:: with SMTP id
 u13mr5797910jat.114.1631834486034; 
 Thu, 16 Sep 2021 16:21:26 -0700 (PDT)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com.
 [209.85.166.181])
 by smtp.gmail.com with ESMTPSA id l1sm2603909ilc.65.2021.09.16.16.21.25
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Sep 2021 16:21:25 -0700 (PDT)
Received: by mail-il1-f181.google.com with SMTP id w1so8360460ilv.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Sep 2021 16:21:25 -0700 (PDT)
X-Received: by 2002:a92:da0c:: with SMTP id z12mr5613764ilm.120.1631834484804; 
 Thu, 16 Sep 2021 16:21:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210914162825.v3.1.I85e46da154e3fa570442b496a0363250fff0e44e@changeid>
 <20210914162825.v3.2.Ib06997ddd73e2ac29e185f039d85cfa8e760d641@changeid>
 <CAE-0n53BXh3_6jEW5oTbPA-V=MSaN=RvqaU8uoY9GNOm-0Pv_g@mail.gmail.com>
 <CAD=FV=WKQg-fU1jaSOh3RTa5HpSAiTzt2-Sycwt59uv1WemYxg@mail.gmail.com>
 <CAE-0n539tJLLWHdL65ZU_1qOzA-RsEqGqVi-19VLHz_W5dT6VA@mail.gmail.com>
 <CAD=FV=U_FX_Rg=h+w0yzpzi7fcUCg0Thn2_nXixsCRVsYFUGHQ@mail.gmail.com>
 <CAE-0n52F6j-qfA_h76BPyMRHi7hJzm6bX8eD5jS-C+ydz=vkBA@mail.gmail.com>
In-Reply-To: <CAE-0n52F6j-qfA_h76BPyMRHi7hJzm6bX8eD5jS-C+ydz=vkBA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 16 Sep 2021 16:21:12 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XdN6SLZQ=kAe4S7Z7CjSrqnAQsj2uRiePXKFp07chVBg@mail.gmail.com>
Message-ID: <CAD=FV=XdN6SLZQ=kAe4S7Z7CjSrqnAQsj2uRiePXKFp07chVBg@mail.gmail.com>
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

On Thu, Sep 16, 2021 at 3:17 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> TL;DR: Please try to reduce these error messages in drivers and
> consolidate them into subsystems so that drivers stay simple.
>
> Quoting Doug Anderson (2021-09-15 09:41:39)
> > Hi,
> >
> > On Tue, Sep 14, 2021 at 7:50 PM Stephen Boyd <swboyd@chromium.org> wrote:
> > >
> > >
> > > I'd rather see any sort of error message in getter APIs be pushed into
> > > the callee so that we reduce the text size of the kernel by having one
> > > message instead of hundreds/thousands about "failure to get something".
> > > As far as I can tell this API is designed to skip printing anything when
> > > EPROBE_DEFER is returned, and only print something when it isn't that
> > > particular error code. The other benefit of this API is it sets the
> > > deferred reason in debugfs which is nice to know why some device failed
> > > to probe. Of course now with fw_devlink that almost never triggers so
> > > the feature is becoming useless.
> >
> > I guess we need to split this apart into two issues. One (1) is
> > whether we should be printing errors like this in probe() and the
> > other (2) is the use of dev_err_probe() for cases where err could
> > never be -EPROBE_DEFER.
> >
> > So the argument about reducing the text size for thousands of slightly
> > different errors is all about (1), right? In other words, you'd be
> > equally opposed to a change that added a normal error print with
> > dev_err(), right? IMO, this is a fair debate to have and it comes down
> > to a choice that has pros and cons. Yes the error messages are not
> > needed in the normal case and yes they bloat the kernel size, but when
> > something inevitably goes wrong then you have a way to track it down
> > instead of trying to guess or having to recompile the code to add
> > prints everywhere. Often this can give you a quick clue about a
> > missing Kconfig or a wrongly coded device tree file without tons of
> > time adding prints and recompiling code. That seems like it's worth
> > something...
>
> Agreed. dev_err_probe() does that by putting that into the deferred
> reason debugfs file. I'm saying that drivers shouldn't really be using
> this API unless they're doing something exotic. The subsystems that are
> implementing the 'get' operation that may defer should use this function
> and then drivers should just return the error value to driver core so
> that we can consolidate error messages and shrink the kernel size.
>
> Maybe we can look for the defer reason in call_driver_probe() and print
> a warning message if the string is set. Right now -EPROBE_DEFER is
> handled but it's a dev_dbg() print that probably nobody enables and it
> doesn't print the reason string.

Actually, in recent versions of the kernel it stashes the reason too.
I think there's a debugfs file "devices_deferred"


> Even better, we could make the defer reason the 'probe failed reason'
> instead, and then jam the dev_err_probe() string into there regardless
> of EPROBE_DEFER being returned or not. This would elevate this API to
> any sort of device probe error. One more crazy idea is that we could
> save the stack when the dev_err_probe() call is made and print out the
> stacktrace when the error string is printed in driver core. I'm not sure
> this is any better than making it a WARN_ON() though.
>
> >
> > One could also make the argument that if you don't care about all
> > these similar errors bloating the text segment that it would be pretty
> > easy to create a new Kconfig: "CONFIG_I_THINK_PROBE_ERRORS_ARE_BLOAT".
> > If that config is set then it could throw away the strings for every
> > dev_err_probe() that you compile in.
>
> I'll leave this little CONFIG_PRINTK=n sledgehammer here.
>
> >
> >
> > I'm not so convinced about the argument (2) that dev_err_probe()
> > should only be used if the error code could be -EPROBE_DEFER. Compare
> > these two:
> >
> > Old:
> >   ret = do_something_that_cant_defer();
> >   if (ret < 0) {
> >     dev_err(dev, "The foo failed to bar (%pe)\n", ERR_PTR(ret));
> >     return ret;
> >   }
> >
> > New:
> >   ret = do_something_that_cant_defer();
> >   if (ret < 0)
> >     return dev_err_probe(dev, ret, "The foo failed to bar\n");
> >
> > It seems clear to me that the "New" case is better. The error code is
> > printed in a consistent fashion compared to all other error prints and
> > the fact that it returns the error code makes it cleaner. It's fine
> > that the error could never be -EPROBE_DEFER. Certainly we could add a
> > new function called dev_err_with_code() that worked exactly like
> > dev_err_probe() except that it didn't have special logic for
> > -EPROBE_DEFER but why?
> >
> > Also note that the current function is dev_err_probe(), not
> > dev_err_might_defer(). By the name, it should be useful / OK to use
> > for any errors that come up in the probe path.
>
> I looked at the documentation for dev_err_probe()
>
>  * This helper implements common pattern present in probe functions for error
>  * checking: print debug or error message depending if the error value is
>  * -EPROBE_DEFER and propagate error upwards.
>  * In case of -EPROBE_DEFER it sets also defer probe reason, which can be
>  * checked later by reading devices_deferred debugfs attribute.
>
> This seems to imply that it's all about EPROBE_DEFER. I'm just
> reconstructing what I read from kernel-doc. If the intent is to use it
> outside of probe defer, then please update the documentation to
> alleviate confusion.

Meh. Yeah, it talks a lot about -EPROBE_DEFER, but it doesn't say it's
only for that.

Sure, I'll post a patch.

https://lore.kernel.org/r/20210916161931.1.I32bea713bd6c6fb419a24da73686145742b6c117@changeid


> > In the case of devm_regmap_init_i2c(), the driver could be fine but
> > you might be trying to instantiate it on a system whose i2c bus lacks
> > the needed functionality. That's not a bug in the bridge driver but an
> > error in system integration. Yeah, after bringup of the new system you
> > probably don't need the error, but it will be useful during people's
> > bringups year after year.
> >
>
> The point I'm trying to make is that these error messages in probe
> almost never get printed after the driver is brought up on the hardware
> that starts shipping out to non-kernel developers. Of course they happen
> when kernel devs are enabling new hardware year after year on the same
> tried and tested driver. They're worthwhile messages to have to make our
> lives easier at figuring out some misconfiguration, etc. The problem is
> they lead to bloat once the bringup/configuration phase is over.
>
> At one point we directed driver authors at dev_dbg() for these prints so
> that the strings would be removed from the kernel image if debugging
> wasn't enabled. It looks like dev_err_probe() goes in the opposite
> direction by printing an error message and passing the string to an
> exported function, so dev_dbg() won't reduce the image size. Ugh!

So maybe the key here is that "CONFIG_PRINTK=n" is not the same as
"CONFIG_I_THINK_PROBE_ERRORS_ARE_BLOAT" and it's not just that one has
a more flippant name than the other. I think your argument about the
fact that these errors almost never come up in practice is actually
true for pretty much _all_ probe errors, isn't it? So if you wanted to
keep non-probe errors in your system (keep PRINTK=y) and just do away
with these bloat-y probe errors then dev_err_probe() could really be
the key and there'd be a big benefit for using for all these errors
during probe, not just ones that have a chance of deferring. ...and
yes, you could make this config do something fancy like do a stack
dump or print the return address if you actually hit one of these
errors once you've thrown away the string.

I also wouldn't necessarily agree that dev_dbg() was an amazing fit
for these error messages. They truly were error-level things that were
happening. These are things that are causing the probe to abort, not
just extra spammy debug info. Calling them "error" messages rather
than "debug" messages seems better...


-Doug
