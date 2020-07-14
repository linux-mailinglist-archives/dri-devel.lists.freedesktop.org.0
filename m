Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 539D5220079
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jul 2020 00:13:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B513A6EA2D;
	Tue, 14 Jul 2020 22:13:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8214389BE8;
 Tue, 14 Jul 2020 22:13:14 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3EA21206D9;
 Tue, 14 Jul 2020 22:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594764794;
 bh=p8xfw2q/yMrH6U15B1idZInMuEtxyddvH406FsTsfxQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=2MLTFbXt3lEqDEHZWcpTPElKFx2Mlpghv3AL6pGhKHdgtX4mZSwhub989kb/xglYq
 XdY4ivbtJ9Ha6PoGmeb4P0ynrMTl+Bg0GtPgQps2K6CvEvZRHhUZYCCjChTf1YeSxh
 Sq9eTZDFW3irH7nWbO73vba+/B8p402NiNoCxREU=
Received: by mail-ot1-f52.google.com with SMTP id e90so14246618ote.1;
 Tue, 14 Jul 2020 15:13:14 -0700 (PDT)
X-Gm-Message-State: AOAM531lgwvs6xaDp/aDMXYbXVzDQNQ7YQ+Q9pYIx+yg1CKP1oh1haeW
 BuB7p4RWcpAnd1aD1w5J4Z0vvPTKt4PJn7GDsw==
X-Google-Smtp-Source: ABdhPJyLD2OHAbfUvFU/OhpgQL9qmOMS53+t6bNPLQXFwTVUYSvJnvKU/NsVsjit+NH5JJh+nFWuvW57mAWywVgrxuM=
X-Received: by 2002:a9d:2646:: with SMTP id a64mr5739450otb.107.1594764793562; 
 Tue, 14 Jul 2020 15:13:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200710230224.2265647-1-dianders@chromium.org>
 <CAL_JsqKC5WtHb-coMCxMTDJ7CJcjVXcAxDT4J9N-Xyr=0uuURA@mail.gmail.com>
 <CAD=FV=XWKoTd_t2uRGpw3oa0Nij2EPeAJpOHhUipXFW07JN2qw@mail.gmail.com>
 <CAL_JsqLJM5nwNSdugMBLDVtjP97dikCm_AiHjnDs1jqBOFoaaQ@mail.gmail.com>
 <CAD=FV=UP0AHWr22U69TKcwwAefPCYMsfzymobczqmrdB6BOOhA@mail.gmail.com>
 <CAOCk7NoX-XAXy2WaYGjGOtEmypis-DO-W1cfU0wnucHH0oZrqg@mail.gmail.com>
In-Reply-To: <CAOCk7NoX-XAXy2WaYGjGOtEmypis-DO-W1cfU0wnucHH0oZrqg@mail.gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 14 Jul 2020 16:13:02 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+Nys+ry-3D07e-68e=9Pb34C9Js6piAnzwd1gXf_DmTw@mail.gmail.com>
Message-ID: <CAL_Jsq+Nys+ry-3D07e-68e=9Pb34C9Js6piAnzwd1gXf_DmTw@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 0/9] drm/msm: Avoid possible infinite probe
 deferral and speed booting
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
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
Cc: Sean Paul <sean@poorly.run>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Doug Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 14, 2020 at 10:33 AM Jeffrey Hugo <jeffrey.l.hugo@gmail.com> wrote:
>
> On Mon, Jul 13, 2020 at 5:50 PM Doug Anderson <dianders@chromium.org> wrote:
> >
> > Hi,
> >
> > On Mon, Jul 13, 2020 at 1:25 PM Rob Herring <robh+dt@kernel.org> wrote:
> > >
> > > On Mon, Jul 13, 2020 at 9:08 AM Doug Anderson <dianders@chromium.org> wrote:
> > > >
> > > > Hi,
> > > >
> > > > On Mon, Jul 13, 2020 at 7:11 AM Rob Herring <robh+dt@kernel.org> wrote:
> > > > >
> > > > > On Fri, Jul 10, 2020 at 5:02 PM Douglas Anderson <dianders@chromium.org> wrote:
> > > > > >
> > > > > > I found that if I ever had a little mistake in my kernel config,
> > > > > > or device tree, or graphics driver that my system would sit in a loop
> > > > > > at bootup trying again and again and again.  An example log was:
> > > > >
> > > > > Why do we care about optimizing the error case?
> > > >
> > > > It actually results in a _fully_ infinite loop.  That is: if anything
> > > > small causes a component of DRM to fail to probe then the whole system
> > > > doesn't boot because it just loops trying to probe over and over
> > > > again.  The messages I put in the commit message are printed over and
> > > > over and over again.
> > >
> > > Sounds like a bug as that's not what should happen.
> > >
> > > If you defer during boot (initcalls), then you'll be on the deferred
> > > list until late_initcall and everything is retried. After
> > > late_initcall, only devices getting added should trigger probing. But
> > > maybe the adding and then removing a device is causing a re-trigger.
> >
> > Right, I'm nearly certain that the adding and then removing is causing
> > a re-trigger.  I believe the loop would happen for any case where we
> > have a probe function that:
> >
> > 1. Adds devices.
> > 2. After adding devices it decides that it needs to defer.
> > 3. Removes the devices it added.
> > 4. Return -EPROBE_DEFER from its probe function.
> >
> > Specifically from what I know about how -EPROBE_DEFER works I'm not
> > sure how it wouldn't cause an infinite loop in that case.
> >
> > Perhaps the missing part of my explanation, though, is why it never
> > gets out of this infinite loop.  In my case I purposely made the
> > bridge chip "ti-sn65dsi86.c" return an error (-EINVAL) in its probe
> > every time.  Obviously I wasn't going to get a display up like this,
> > but I just wanted to not loop forever at bootup.  I tracked down
> > exactly why we get an - EPROBE_DEFER over and over in this case.
> >
> > You can see it in msm_dsi_host_register().  If some components haven't
> > shown up when that function runs it will _always_ return
> > -EPROBE_DEFER.
> >
> > In my case, since I caused the bridge to fail to probe, those
> > components will _never_ show up.  That means that
> > msm_dsi_host_register() will _always_ return -EPROBE_DEFER.
> >
> > I haven't dug through all the DRM code enough, but it doesn't
> > necessarily seem like the wrong behavior.  If the bridge driver or a
> > panel was a module then (presumably) they could show up later and so
> > it should be OK for it to defer, right?
> >
> > So with all that, it doesn't really feel like this is a bug so much as
> > it's an unsupported use case.  The current deferral logic simply can't
> > handle the case we're throwing at it.  You cannot return -EPROBE_DEFER
> > if your probe function adds devices each time through the probe
> > function.
> >
> > Assuming all the above makes sense, that means we're stuck with:
> >
> > a) This patch series, which makes us not add devices.
> >
> > b) Some other patch series which rearchitects the MSM graphics stack
> > to not return -EPROBE_DEFER in this case.
>
> This isn't a MSM specific issue.  This is an issue with how the DSI
> interface works, and how software is structured in Linux.  I would
> expect that pretty much any DSI host in the kernel would have some
> version of this issue.
>
> The problem is that DSI is not "hot pluggable", so to give the DRM
> stack the info it needs, we need both the DSI controller (aka the MSM
> graphics stack in your case), and the thing it connects to (in your
> case, the TI bridge, normally the actual panel) because the DRM stack
> expects that if init completes, it has certain information
> (resolution, etc), and some of that information is in the DSI
> controller, and some of it is on the DSI device.

Ah yes, DRM's lack of hot-plug and discrete component support... Is
that not improved with some of the bridge rework?

Anyways, given there is a child dependency on the parent, I don't
think we should work-around DRM deficiencies in DT.

BTW, There's also a deferred probe timeout you can use which stops
deferring probe some number of seconds after late_initcall.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
