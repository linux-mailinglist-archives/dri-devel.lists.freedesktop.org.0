Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB84421E981
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 09:06:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1F1D89E2B;
	Tue, 14 Jul 2020 07:04:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 694706E258;
 Mon, 13 Jul 2020 14:58:46 +0000 (UTC)
Received: by mail-io1-xd42.google.com with SMTP id e64so13766473iof.12;
 Mon, 13 Jul 2020 07:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Mr56/9hhLOah/1WskpzGTun6YF0+zSZRxtX7at7eeVk=;
 b=Gc+A3oOTz9nxjK8Oyz2sB/jyvAya9tVKQeexSVdJCjoV2OVdcuV0hIniUbCNB6CwVZ
 6tY79EfIWpa2RVlOKKs3UFWTSFhE8GHr7esXVeevmPwDOy3oVqXj4hnc2uQQRiRTIySw
 JryBhJveeYTzUlsqJK+yoBd2NT6eWoHVH60yiUeOtgMme73L4+xdqzK+uptFtkMMV8f3
 Our1KWeXztm/kR0adTbs2OqgrVgmSlL3WLs5pQ3mii/5JG5wFgyfV4CKA+3qyalk+uns
 vKkfdSYpj0+EVH22FK8/xli/MytuOFNPdL0TvjcH7vC8l79CN4vVCKEjohHu054mLGju
 EWGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Mr56/9hhLOah/1WskpzGTun6YF0+zSZRxtX7at7eeVk=;
 b=bBtT+oQs5q1KYP+l31+5FArb3D37bMriDZ9CsugthTjku/LnZ7o2UnRHcgGOT7jWej
 Wore6S0k+BUwQUeeJxTYmNjI8Tl/QJ4kXOCoWi2hbOKi/ex5Ec9DH1PragQsEacrJwGH
 BRXp6HVKHQMIFv0I3Rnj149mVUz+wo+i5pcxINtqtq5LGsBsShIYXplJc+1dWDAGKI9C
 mEeMog3TcObQBtyUk0Ezn55DLBMVhdW/hKCG77xTi962UBmUKoO9AgYv1nvunKEbh7ox
 5ZgFzA7Ne1T4/FnkFumGH7WxivD4+b8/8EJvffp3zmPB7pBLt9WgXqJCdAE5LaWBmG7X
 ccCg==
X-Gm-Message-State: AOAM531mDsCyTPrJVU8HnceeZgPIyVwfArWv62N9fmFW31SOA3dR4oQy
 EVa3/bWujcx+fvd4/UOejzIwGWBTHtq4jzJ5BqezbA==
X-Google-Smtp-Source: ABdhPJyIb4TLaDuRzssmGjD8GlxCnRNZPX1fjJp7B0DVJOpqXfeErBQ2zLmh4Yjcd81ES/b/Ybs6G90MJv7Otmmv4ng=
X-Received: by 2002:a02:c604:: with SMTP id i4mr442905jan.19.1594652325448;
 Mon, 13 Jul 2020 07:58:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200710230224.2265647-1-dianders@chromium.org>
 <CAL_JsqKC5WtHb-coMCxMTDJ7CJcjVXcAxDT4J9N-Xyr=0uuURA@mail.gmail.com>
In-Reply-To: <CAL_JsqKC5WtHb-coMCxMTDJ7CJcjVXcAxDT4J9N-Xyr=0uuURA@mail.gmail.com>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Mon, 13 Jul 2020 08:58:34 -0600
Message-ID: <CAOCk7NrCXXM_RgohjhooJUcenTkV5ajs+Xg1QE-7F5BDRYppyw@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 0/9] drm/msm: Avoid possible infinite probe
 deferral and speed booting
To: Rob Herring <robh+dt@kernel.org>
X-Mailman-Approved-At: Tue, 14 Jul 2020 07:02:44 +0000
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
Cc: Sean Paul <sean@poorly.run>, DTML <devicetree@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Douglas Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 13, 2020 at 8:11 AM Rob Herring <robh+dt@kernel.org> wrote:
>
> On Fri, Jul 10, 2020 at 5:02 PM Douglas Anderson <dianders@chromium.org> wrote:
> >
> > I found that if I ever had a little mistake in my kernel config,
> > or device tree, or graphics driver that my system would sit in a loop
> > at bootup trying again and again and again.  An example log was:
>
> Why do we care about optimizing the error case?
>
> >   msm ae00000.mdss: bound ae01000.mdp (ops 0xffffffe596e951f8)
> >   msm_dsi ae94000.dsi: ae94000.dsi supply gdsc not found, using dummy regulator
> >   msm_dsi_manager_register: failed to register mipi dsi host for DSI 0
> >   [drm:ti_sn_bridge_probe] *ERROR* could not find any panel node
> >   ...
> >
> > I finally tracked it down where this was happening:
> >   - msm_pdev_probe() is called.
> >   - msm_pdev_probe() registers drivers.  Registering drivers kicks
> >     off processing of probe deferrals.
> >   - component_master_add_with_match() could return -EPROBE_DEFER.
> >     making msm_pdev_probe() return -EPROBE_DEFER.
> >   - When msm_pdev_probe() returned the processing of probe deferrals
> >     happens.
> >   - Loop back to the start.
> >
> > It looks like we can fix this by marking "mdss" as a "simple-bus".
> > I have no idea if people consider this the right thing to do or a
> > hack.  Hopefully it's the right thing to do.  :-)
>
> It's a simple test. Do the child devices have any dependency on the
> parent to probe and/or function? If so, not a simple-bus.
>
> > Once I do this I notice that my boot gets marginally faster (you
> > don't need to probe the sub devices over and over) and also if I
>
> Can you quantify that?
>
> Have you run with devlinks enabled. You need a command line option to
> enable. That too should reduce deferred probes.
>
> > have a problem it doesn't loop forever (on my system it still
> > gets upset about some stuck clocks in that case, but at least I
> > can boot up).
>
> Deferred probe only runs when a device is added, so it's not like it
> is continually running.

But it is.  I've hit this as well, but haven't attempted a fix.

So we have a parent device, with several sub devices.  The parent
device probes which causes the sub devices to probe.  One of the sub
devices successfully probes, and another fails with EPROBE_DEFER.
This both caused the probe defer framework to immediately schedule
processing the probe defer queue, and also cause all of the chile
devices and the parent device to be removed to probe defer later.
Since the system state doesn't change (one of the sub devices actually
requires an independent other device to have probed), the system ends
up an an infinite probe defer loop.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
