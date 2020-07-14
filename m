Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 524CC2205A3
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jul 2020 09:00:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BC096E43D;
	Wed, 15 Jul 2020 06:59:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72E536E41A;
 Tue, 14 Jul 2020 16:33:09 +0000 (UTC)
Received: by mail-il1-x143.google.com with SMTP id i18so14737248ilk.10;
 Tue, 14 Jul 2020 09:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2v74DtJfidVxmpf1PQZAEw4tnokF3wni9AEugEzeRKc=;
 b=cNdSutJBzO6Kg8H5UK7GGzsZNIn63ZqSknBHVkJciFbNow2tN+84fFUTAH5ZWU+mrg
 fk3cgF0krZkHrFmPCQMinrGzt1pfEpS5m4C5kw2z04157wfxymSGiKcJhwfwnzdTSiGx
 S55Cn5uS4Q1K5fT0oTPssneFnFfj+6jsPKOx8+j/ga41IfEpW7AzrHIfiyIWgQlL8KLQ
 tMgmStbxR0XKAwBUJ05ei5zSoiBoWh0NdZCv8N+0TaDo5TGihA5UlCIgq0OLHTzHrVxs
 WURrOvOt1gEMBryG3njE3YlybrCfm2iV//DMa0I4XtbbQmf9mETetU/zw9HdhIVnx+wN
 OJZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2v74DtJfidVxmpf1PQZAEw4tnokF3wni9AEugEzeRKc=;
 b=Liu19vIWk5n//PFBYKJN0SqEfLYkIORF1XKjXow3YhYM58pmXelN5m6yZkpSJHvrCY
 iAkakuRC1FgmS23z63Mt7vGjbdXQeFcqHnnmIMaG3X8hz3KhVlMJxG8HXW3uqMrIgNm/
 /eHieBr6e4w3TbfQ1XtbpSvmNSBrhjRIRh6mu6SyXN2OCVgxn/a7ndo+VgesxrgpI0SU
 60MDKxWJk+VoFTL6qPm8iykenB1JDIAN4oucCOwruutATTbXFLAK4rX3uMoWEwlL7pZA
 4o40bDFomL8XTmyXU9CjLY16vtTmpd2oDtAhw92Tig1YWm9NLSEtqSj9yWOr+XImvB9+
 p7eg==
X-Gm-Message-State: AOAM530O+3FaLuzSPkCHaillcJ3AIrDeaFAG6Bt+YsvDRFlU6TiUR/nU
 p+3Bw5tKaWIKsF7CmvZ42dxEhitB2/4eAWxzkJ0=
X-Google-Smtp-Source: ABdhPJwIuFjoprAEwGXRfj5lcBjDIs4LLbNalWFrIBkfLOGyR6XHqrRCeUWiFE0ODwubXbHbkOA0ENGHJUyJiNFgxrU=
X-Received: by 2002:a92:849c:: with SMTP id y28mr4965659ilk.33.1594744388613; 
 Tue, 14 Jul 2020 09:33:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200710230224.2265647-1-dianders@chromium.org>
 <CAL_JsqKC5WtHb-coMCxMTDJ7CJcjVXcAxDT4J9N-Xyr=0uuURA@mail.gmail.com>
 <CAD=FV=XWKoTd_t2uRGpw3oa0Nij2EPeAJpOHhUipXFW07JN2qw@mail.gmail.com>
 <CAL_JsqLJM5nwNSdugMBLDVtjP97dikCm_AiHjnDs1jqBOFoaaQ@mail.gmail.com>
 <CAD=FV=UP0AHWr22U69TKcwwAefPCYMsfzymobczqmrdB6BOOhA@mail.gmail.com>
In-Reply-To: <CAD=FV=UP0AHWr22U69TKcwwAefPCYMsfzymobczqmrdB6BOOhA@mail.gmail.com>
From: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Date: Tue, 14 Jul 2020 10:32:57 -0600
Message-ID: <CAOCk7NoX-XAXy2WaYGjGOtEmypis-DO-W1cfU0wnucHH0oZrqg@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH 0/9] drm/msm: Avoid possible infinite probe
 deferral and speed booting
To: Doug Anderson <dianders@chromium.org>
X-Mailman-Approved-At: Wed, 15 Jul 2020 06:59:56 +0000
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
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Andy Gross <agross@kernel.org>, freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 13, 2020 at 5:50 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Mon, Jul 13, 2020 at 1:25 PM Rob Herring <robh+dt@kernel.org> wrote:
> >
> > On Mon, Jul 13, 2020 at 9:08 AM Doug Anderson <dianders@chromium.org> wrote:
> > >
> > > Hi,
> > >
> > > On Mon, Jul 13, 2020 at 7:11 AM Rob Herring <robh+dt@kernel.org> wrote:
> > > >
> > > > On Fri, Jul 10, 2020 at 5:02 PM Douglas Anderson <dianders@chromium.org> wrote:
> > > > >
> > > > > I found that if I ever had a little mistake in my kernel config,
> > > > > or device tree, or graphics driver that my system would sit in a loop
> > > > > at bootup trying again and again and again.  An example log was:
> > > >
> > > > Why do we care about optimizing the error case?
> > >
> > > It actually results in a _fully_ infinite loop.  That is: if anything
> > > small causes a component of DRM to fail to probe then the whole system
> > > doesn't boot because it just loops trying to probe over and over
> > > again.  The messages I put in the commit message are printed over and
> > > over and over again.
> >
> > Sounds like a bug as that's not what should happen.
> >
> > If you defer during boot (initcalls), then you'll be on the deferred
> > list until late_initcall and everything is retried. After
> > late_initcall, only devices getting added should trigger probing. But
> > maybe the adding and then removing a device is causing a re-trigger.
>
> Right, I'm nearly certain that the adding and then removing is causing
> a re-trigger.  I believe the loop would happen for any case where we
> have a probe function that:
>
> 1. Adds devices.
> 2. After adding devices it decides that it needs to defer.
> 3. Removes the devices it added.
> 4. Return -EPROBE_DEFER from its probe function.
>
> Specifically from what I know about how -EPROBE_DEFER works I'm not
> sure how it wouldn't cause an infinite loop in that case.
>
> Perhaps the missing part of my explanation, though, is why it never
> gets out of this infinite loop.  In my case I purposely made the
> bridge chip "ti-sn65dsi86.c" return an error (-EINVAL) in its probe
> every time.  Obviously I wasn't going to get a display up like this,
> but I just wanted to not loop forever at bootup.  I tracked down
> exactly why we get an - EPROBE_DEFER over and over in this case.
>
> You can see it in msm_dsi_host_register().  If some components haven't
> shown up when that function runs it will _always_ return
> -EPROBE_DEFER.
>
> In my case, since I caused the bridge to fail to probe, those
> components will _never_ show up.  That means that
> msm_dsi_host_register() will _always_ return -EPROBE_DEFER.
>
> I haven't dug through all the DRM code enough, but it doesn't
> necessarily seem like the wrong behavior.  If the bridge driver or a
> panel was a module then (presumably) they could show up later and so
> it should be OK for it to defer, right?
>
> So with all that, it doesn't really feel like this is a bug so much as
> it's an unsupported use case.  The current deferral logic simply can't
> handle the case we're throwing at it.  You cannot return -EPROBE_DEFER
> if your probe function adds devices each time through the probe
> function.
>
> Assuming all the above makes sense, that means we're stuck with:
>
> a) This patch series, which makes us not add devices.
>
> b) Some other patch series which rearchitects the MSM graphics stack
> to not return -EPROBE_DEFER in this case.

This isn't a MSM specific issue.  This is an issue with how the DSI
interface works, and how software is structured in Linux.  I would
expect that pretty much any DSI host in the kernel would have some
version of this issue.

The problem is that DSI is not "hot pluggable", so to give the DRM
stack the info it needs, we need both the DSI controller (aka the MSM
graphics stack in your case), and the thing it connects to (in your
case, the TI bridge, normally the actual panel) because the DRM stack
expects that if init completes, it has certain information
(resolution, etc), and some of that information is in the DSI
controller, and some of it is on the DSI device.

>
> c) Smarten up the deferral system to somehow detect this loop.  I'm
> really not sure how to do this.  You'd have to somehow know that you
> keep adding the same devices over and over again and they didn't get
> us out of the deferral loop last time and so you should eventually
> give up.
>
>
> > > > >   msm ae00000.mdss: bound ae01000.mdp (ops 0xffffffe596e951f8)
> > > > >   msm_dsi ae94000.dsi: ae94000.dsi supply gdsc not found, using dummy regulator
> > > > >   msm_dsi_manager_register: failed to register mipi dsi host for DSI 0
> > > > >   [drm:ti_sn_bridge_probe] *ERROR* could not find any panel node
> > > > >   ...
> > > > >
> > > > > I finally tracked it down where this was happening:
> > > > >   - msm_pdev_probe() is called.
> > > > >   - msm_pdev_probe() registers drivers.  Registering drivers kicks
> > > > >     off processing of probe deferrals.
> > > > >   - component_master_add_with_match() could return -EPROBE_DEFER.
> > > > >     making msm_pdev_probe() return -EPROBE_DEFER.
> > > > >   - When msm_pdev_probe() returned the processing of probe deferrals
> > > > >     happens.
> > > > >   - Loop back to the start.
> > > > >
> > > > > It looks like we can fix this by marking "mdss" as a "simple-bus".
> > > > > I have no idea if people consider this the right thing to do or a
> > > > > hack.  Hopefully it's the right thing to do.  :-)
> > > >
> > > > It's a simple test. Do the child devices have any dependency on the
> > > > parent to probe and/or function? If so, not a simple-bus.
> > >
> > > Great!  You can see in the earlier patch in the series that the very
> > > first thing that happens when the parent device probes is that it
> > > calls devm_of_platform_populate().  That means no dependencies, right?
> >
> > It should. But then I reviewed the MDSS binding today and it looks
> > like the MDSS is the interrupt parent for at least some child devices?
>
> Hrm.  How does that work?  Let's see...
>
> ...ah, I believe it works because we don't try to grab interrupts in
> the probe path of our sub-components.  That means we probe them just
> fine without the parent.  I guess it has to be like this because
> otherwise we end up with circular dependencies.
>
> So there is a dependency of the child on the parent and of the parent
> on the child (the parent won't really probe until the children do).
> No idea if this means that the whole thing was architected in a
> non-optimal way or if it's just really hard to fit the DRM Component
> model into the Linux Driver model (or both).  Where does that leave us
> about whether "simple-bus" is OK, though?
>
>
>
> > >  So that means it's fine/correct to add "simple-bus" here?
> > >
> > >
> > > > > Once I do this I notice that my boot gets marginally faster (you
> > > > > don't need to probe the sub devices over and over) and also if I
> > > >
> > > > Can you quantify that?
> > >
> > > I'd say < 100 us.  I can try to quantify more if needed, but it wasn't
> > > the point of this patch.
> > >
> > >
> > > > Have you run with devlinks enabled. You need a command line option to
> > > > enable. That too should reduce deferred probes.
> > >
> > > Ah, good idea!  I will try it.  However, even with devlinks, if there
> > > is any chance of deferred probes then we need a fix like this.  The
> > > point of the patch isn't about speeding things up but about avoiding
> > > an infinite loop at bootup due to a small bug.
> >
> > I think a deferred probe would only happen if there's a dependency we
> > don't track (but we're tracking about everything that's common). But
> > if there's some error, I'm not sure what would happen. Seems like a
> > good test case. :)
>
> Maybe now that I've pointed at msm_dsi_host_register() it will help
> clarify.  I don't know a ton about the MSM DRM world (mostly I just
> jumped in here because I was sick of getting stuck in this infinite
> loop), but I'm not sure how we can get around the problems.
>
> I guess in my specific case we could maybe determine that the bridge
> chip returned -EINVAL and thus would never probe, but what about if I
> put the bridge chip driver in a loadable kernel module?
>
> My device links knowledge is super weak (and I'm currently mostly
> focused on the slightly older 5.4 kernel if that matters) but are you
> saying that the system should just know which device would eventually
> provide the bridge/panel and would know not to probe the main DRM
> driver until after it probes?
>
>
> > > > > have a problem it doesn't loop forever (on my system it still
> > > > > gets upset about some stuck clocks in that case, but at least I
> > > > > can boot up).
> > > >
> > > > Deferred probe only runs when a device is added, so it's not like it
> > > > is continually running.
> > >
> > > If you don't mind looking at the code patch, see:
> > >
> > > https://lore.kernel.org/r/20200710160131.4.I358ea82de218ea5f4406572ade23f5e121297555@changeid/
> > >
> > > Specifically you can see that each time we try to probe we were
> > > calling of_platform_populate().  That appeared to be enough to trigger
> > > things.
> >
> > Like I said, sounds like a bug. Even if 'simple-bus' is the
> > appropriate thing to do here, it should be fixed or at least
> > understood.
> >
> > Rob
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
