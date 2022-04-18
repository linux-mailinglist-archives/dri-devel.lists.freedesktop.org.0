Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BFE50601A
	for <lists+dri-devel@lfdr.de>; Tue, 19 Apr 2022 01:11:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C262C10E07A;
	Mon, 18 Apr 2022 23:11:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6960A10E07A
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Apr 2022 23:11:10 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id b24so19099494edu.10
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Apr 2022 16:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JMRDVPzzdy2VtEsvZFC+mN/uQt6YOpKPb2l8bAyzeoE=;
 b=jCVoz2F192/OpBxELXgLrI9ovvx3jYEcNmqgLpIHzqfD45Ns+p7bSBWfnYIOigYmds
 hybixW0fQFXDmANrp+NQnbDAEikM84xxZMStkknfAphz2mcVdgidyWsud/bYCB0HlZjr
 J4Jz7A8LiGm2h22QzDgB7o2Evi5zklOzBa5qU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JMRDVPzzdy2VtEsvZFC+mN/uQt6YOpKPb2l8bAyzeoE=;
 b=tBrERVHOaPSFlMMDb5UrNehlV9vCljNT6o6WdnBQ1z+jREcIQpcjWoOnzhmrQEXf4l
 ovdV+3+CXaSlPT5Zdirbs9zwO14kGd/2BHpltz4LC/sE348qKlRLvyn203aJ+JN+LxVh
 uVcEF7oUWsOvaSAgULal8itsjHrcxlkbp6pkUxHCmc+hcNUItRS52hnMpWkKvsWV+z4J
 2W1Md0WOLQ0u9joCB2C/+qK5mD4CvqN2+iNUug7yeC9MnCM3EDCJfjXHM/tW/BNhw34+
 Mw0JuQghCBFOYJOlmH8Sr9hUpSLhtJHIjWLRgLEYUZpHNVVtPbjI+Y+Qj0o3AulcuHRI
 8gMA==
X-Gm-Message-State: AOAM532BGzwCSlLAyanntHwSWUMTMsGNu3+tMFNy/F5eVh8DiqA9yyPi
 8vXSpQNWFDtYhU4ZH2zUnVBA+6mvMtsZYwAc
X-Google-Smtp-Source: ABdhPJywKj8lcGFBm/XsqrnczN0Ur5T7ybvOXTpkh2L4h6eGJfM7WJ/FmubaDCJmlpVmMy1KSkgwWg==
X-Received: by 2002:a05:6402:1e88:b0:423:d43d:8c65 with SMTP id
 f8-20020a0564021e8800b00423d43d8c65mr12474879edf.226.1650323468083; 
 Mon, 18 Apr 2022 16:11:08 -0700 (PDT)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com.
 [209.85.221.47]) by smtp.gmail.com with ESMTPSA id
 dd6-20020a1709069b8600b006df08710d00sm4997069ejc.85.2022.04.18.16.11.06
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Apr 2022 16:11:06 -0700 (PDT)
Received: by mail-wr1-f47.google.com with SMTP id u3so20215512wrg.3
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Apr 2022 16:11:06 -0700 (PDT)
X-Received: by 2002:a5d:4d0e:0:b0:207:a329:24fa with SMTP id
 z14-20020a5d4d0e000000b00207a32924famr9393978wrt.342.1650323465918; Mon, 18
 Apr 2022 16:11:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220409023628.2104952-1-dianders@chromium.org>
 <20220408193536.RFC.1.I4182ae27e00792842cb86f1433990a0ef9c0a073@changeid>
 <a9a5dfb7-819b-d3a2-2c47-d5b239d21ad3@linaro.org>
 <CAD=FV=WKwErpD7iCu+2jFvMutmmmgLUEhAnw8s=27wUxcpF-aQ@mail.gmail.com>
 <CAA8EJppOVqaAEVeQY7p0EfCObJxfL591kbaYLYfbgOHHtmfhXw@mail.gmail.com>
 <CAD=FV=UmXzPyVOa-Y0gpY0qcukqW3ge5DBPx6ak88ydEqTsBiQ@mail.gmail.com>
 <ddb8d8fa-89dc-268b-0505-9ee7df8c272e@linaro.org>
In-Reply-To: <ddb8d8fa-89dc-268b-0505-9ee7df8c272e@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 18 Apr 2022 16:10:52 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Ur3afHhsXe7a3baWEnD=MFKFeKRbhFU+bt3P67G0MVzQ@mail.gmail.com>
Message-ID: <CAD=FV=Ur3afHhsXe7a3baWEnD=MFKFeKRbhFU+bt3P67G0MVzQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/6] drm/dp: Helpers to make it easier for drivers to
 use DP AUX bus properly
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Philip Chen <philipchen@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Robert Foss <robert.foss@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Apr 15, 2022 at 5:54 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> >>> * They rely on there being exactly 1 AUX device, or we make it a rule
> >>> that we wait for all AUX devices to probe (?)
> >>
> >> Is the backlight a separate device on an AUX bus? Judging from
> >> drm_panel_dp_aux_backlight(), it isn't. I assumed that aux bus is just
> >> a point-to-point bus, so there is always a single client.
> >
> > Define "device". ;-)
>
> "a device on the AUX bus" = the device, which lists dp_aux_bus_type as
> dev->bus_type.

Right. So I guess I was thinking that we _could_ have modeled the
backlight as a device which lists dp_aux_bus_type as dev->bus_type.
AKA:

1. We could have had a second node in the sc7180-trogdor-homestar
device tree under the DP controller for the DP AUX backlight.

2. Instead of manually calling drm_panel_dp_aux_backlight() from
panel-edp.c and panel-samsung-atna33xc20.c the backlight could have
just probed on its own.

3. In the device tree, the panel could have had a link to the
backlight's phandle which would have made the existing
drm_panel_of_backlight() "just work" and we wouldn't have needed the
manual call to drm_panel_dp_aux_backlight().

Oh. But. Maybe. Not.

We couldn't really have done that because we would have been able to
do the DP AUX transactions for the backlight without powering on the
panel. So we couldn't really have probed them separately. OK, you guys
win this round. ;-)


> > It's a seperate "struct device" from a Linux point of view since it's
> > a backlight class device. Certainly it's highly correlated to the
> > display, but one can conceptually think of them as different devices,
> > sorta. ;-)
> >
> > I actually dug a tiny bit more into the whole "touchscreen over aux".
> > I guess DP 1.2 has a standard of "USB over DP AUX". No idea how that
> > would be modeled, of course.
>
> Ugh. Do you have any details of the standard itself? Like how does it
> looks like from the host point of view. And if the AUX is required to be
> powered for this USB bus to work?
>
> In other words: if we were to model it at this moment, would it be the
> child of the panel device (like backlight) or a separate device sitting
> on the same AUX bus?

I spent a bunch of time searching and I couldn't find more than a
reference, like "hey we came up with this idea and we're gonna write
down in the spec that you could totally do USB over the AUX channel,
but ummmm, we haven't actually implemented it yet". ;-) I certainly
could be wrong, but all of the references I could find were distinctly
lacking in details or pointers to other docs w/ more info.

...but while searching I _did_ find a lot of details (in the eDP 1.4
spec) about "Multi-touch over AUX". That looks like something that's
actually more well thought out and maybe even implemented somewhere.

From what I can tell though, it looks as if it's the same thing as the
backlight. In other words it's only available when the panel is
powered.

I don't think we want to do anything so drastic like moving the
ownership of panel power to the AUX bus or anything, so I guess this
means that:

a) The panel driver will remain in charge of powering the panel
(including anything on the DP AUX bus) on and off and getting the
power sequencing right.

b) That means that we can really think of the panel as the _only_
thing on the DP AUX bus.

c) Anything else on the DP AUX bus will be underneath the panel driver.


> > I guess the summary is that I'm OK w/ changing it to assume one device
> > for now, but I'm still not sure it's compelling to move to normal
> > callbacks. The API for callbacks is pretty much the same as the one I
> > proposed and IMO leaving it the way it is (with an extra struct
> > device) doesn't really add much complexity and has a few (small) nice
> > benefits.
>
> I think Stephen didn't like too many similarities between
> dp_aux_ep_client and dp_aux_ep_device. And I'd second him here.
>
>
> >>> * We need to come up with a system for detecting when everything
> >>> probes or is going to be removed, though that's probably not too hard.
> >>> I guess the DP AUX bus could just replace the panel's probe function
> >>> with its own and essentially "tail patch" it. I guess it could "head
> >>> patch" the remove call? ...or is there some better way you were
> >>> thinking of knowing when all our children probed?
> >>>
> >>> * The callback on the aux bus controller side would not be able to
> >>> DEFER. In other words trying to acquire a reference to the panel can
> >>> always be the last thing we do so we know there can be no reasons to
> >>> defer after. This should be doable, but at least in the ps8640 case it
> >>> will require changing the code a bit. I notice that today it actually
> >>> tries to get the panel side _before_ it gets the MIPI side and it
> >>> potentially can return -EPROBE_DEFER if it can't find the MIPI side. I
> >>> guess I have a niggling feeling that we'll find some reason in the
> >>> future that we can't be last, but we can probably ignore that. ;-)
> >>>
> >>> I can switch this all to normal callbacks if that's what everyone
> >>> wants, but it doesn't feel significantly cleaner to me and does seem
> >>> to have some (small) downsides.
> >>>
> >>>
> >>>> And this
> >>>> approach would make driver's life easier, since e.g. the bus code can
> >>>> pm_get the EP device before calling callbacks/notifiers and
> >>>> pm_put_autosuspend it afterwards.
> >>>
> >>> Not sure about doing the pm calls on behalf of the EP device. What's
> >>> the goal there?
> >>
> >> I think any driver can pm_runtime_get another device. The goal is to
> >> let the 'post_probe' callback to power up the panel, read the EDID,
> >> etc.
> >
> > Right. I was hoping to keep this as a separate discussion since I
> > think it's largely unrelated to the probe ordering issue, but we can
> > talk about it here if you want.
>
> As for me they are pretty much tired one to another. As reading EDID
> (even if it is just to read the panel ID) is one of the main issue with
> panel probe path. I just don't want to end up in a situation when we
> refactor aux_bus probe to fix the ordering/race issue and then we have
> to refactor it again for reading EDID.
>
> >
> > There are a lot of open questions here and it's definitely hard to
> > wrap your head around all of it. Maybe I'll just spam some thoughts
> > and see if they all make sense together...
>
> Thank you for the lengthy explanation. And I should be your pardon for
> partially ignoring DP/ dp bridges patches earlier.
>
> >
> > 1. At the moment, there's no guarantee that a DP AUX Endpoint (AKA
> > panel) will use pm_runtime() to power itself up enough to do an AUX
> > transfer. At the moment the two eDP panels drivers I'm aware of use
> > pm_runtime, but that's actually a fairly new behavior. I guess we'd
> > have to codify it as "required" if we were going to rely on it.
>
> * document it as a "required"
>
> >
> > 2. In general, panels have powered themselves enough to read the EDID
> > in their prepare() stage, which is equivalent to the bridge's
> > pre_enable(). During some of my early patches to try to support EDID
> > reading in ti-sn65dsi86 I actually relied upon it. It was like that in
> > v3 [1]. Personally I see this as the "official" interface to power on
> > the panel from the DP controller. As such I'm not sure we need to add
> > pm_runtime() as an equivalent option.
> >
> > 3. In the cover letter of v4 of my ti-sn65dsi86 EDID patch series I
> > talked about why I switched to having EDID reading driven by the panel
> > instead of powering on the panel (via pre_enable) and reading the EDID
> > in the controller. One reason talked about there is that the "generic"
> > eDP panel driver actually needs the EDID, or at least enough of it to
> > get the panel ID, so that it can adjust its power sequence timings. If
> > the EDID reading is completely handled by the DP driver and the panel
> > can't do it then we'd need to figure out how to communicate it back.
>
> I think with the current drm_bridge_connector-based code this should be
> handled properly. Anyway, it should be the panel, who reads the EDID,
> not the DP core. Actually just a random idea that just came to my mind.
> Maybe (!) we should break ties between msm dp core and the whole
> EDID/HPD/dp_panel story. In other words, split the whole DP EDID reading
> to the separate drm_bridge. Maybe I'm overengineering it here.

I had similar inklings before but I never explored it. I have a vague
recollection of mentioning it to Laurent and him thinking it was a bad
idea, though. No idea if I just dreamed that, though.


> > 4. In general, panels can be pretty persnickety about their power
> > sequencing. As far as I've been able to tell, the official spec
> > provides two things you can do:
> >
> > 4a) You can power the panel up enough to do AUX transfers and then
> > power it back off.
> >
> > 4b) You can power the panel up enough to do AUX transfers, then finish
> > powering it all the way up (turn on screen, backlight, etc). When you
> > turn the screen off, if you follow the spec strictly, you're also
> > _required_ to fully power the panel off. In other words, remove _all_
> > power from the display including any power that would be needed to do
> > AUX transfers.
>
> Ugh. It's a pity that we can not leave AUX enabled forever, while doing
> all kinds of turning the screen off  and on again.

Yeah. I mean, it's possible that the issues with the Samsung panel
would have been solvable some other way, but definitely when we were
having problems with it the HW guys who were looking at it were
claiming that it was a violation and I couldn't find anything to prove
them wrong. :-( ...and fully power cycling fixed all the problems...


> > Now the generic eDP panel code doesn't currently follow the
> > "strict"ness of the spec and I'm not actually sure if that's how the
> > spec is intended to be interpreted anyway. There are two timing
> > diagrams, though. One for "aux transfer only" and the other for
> > "normal system operation". In the "normal system operation" the
> > diagram doesn't allow for the backlight to ever go off and on again.
> >
> > Now, despite the fact that the generic eDP panel code doesn't follow
> > the "strict"ness I just described, the _other_ DP panel I worked on
> > recently (samsung-atna33xc20) does. In testing we found that this
> > panel would sometimes (like 1 in 20 times?) crash if you ever stopped
> > outputting data to the display and then started again. You absolutely
> > needed to fully power cycle the display each time. I tried to document
> > this to the best of my ability in atana33xc20_unprepare(). There's
> > also a WARN_ON() in atana33xc20_enable() trying to detect if someone
> > is doing something the panel driver doesn't expect. I've also been
> > trying to keep my eyes out to see if we need to do the same thing in
> > generic eDP panel code, either for everyone or via some type of
> > per-panel quirk. There's definitely a good reason to avoid the extra
> > cycling if possible since powering panels off and on again often
> > requires hundreds of milliseconds of delay in order to meet timing
> > diagrams. ...and we do this if we ever change panel "modes".
>
> Point noted.
>
> >
> > ...OK, so why does this all matter? I guess my point here is I worry a
> > little bit about saying that the DP controller code can willy nilly
> > request the panel to be powered whenever it wants. If the DP
> > controller was trying to hold the panel powered and then we _needed_
> > to power the panel off then that would be bad. It doesn't mean we
> > can't be careful about it, of course...
> >
> > Said another way, in my mental model these three sequences are allowed:
> >
> > s1) prepare, unprepare
> > s2) prepare, enable, disable, unprepare
> > s3) prepare, enable, disable, unprepare, prepare, enable, disable, unprepare
> >
> > ...and this sequence is _not_ allowed:
> >
> > s4) prepare, enable, disable, enable, disable, unprepare
>
> A strange random question (for which there is probably an existing
> obvious answer somwewhere, 4 a.m. here).
>
> Is there any reason why can't we drop prepare/unprepare for the eDP
> panels and use the following sequence;
>
> - get_modes() = perform AUX-only transfer the first time we hit the
> function to read the EDID. return cached copy afterwards.

side note: we already do cache the EDID.


> - a sequence of enable()/disable() calls doing a full powerup/powerdown?

Aside from the fact that there's a bunch of code out there that
assumes that panels are powered on in pre_enable() ? For instance, on
parade-ps8640 we still support old device trees where the panel isn't
listed under the DP AUX bus. These devices only support a hardcoded
panel, not the generic "edp-panel". There you can see that
ps8640_bridge_get_edid() assumes it can power the panel on with
drm_bridge_chain_pre_enable()

...but besides that, it still wouldn't work. For reasons I won't get
into, here's the current order the bridge chains are called for
prepare and enable:

pre_enable:   start from connector and move to encoder
enable:       start from encoder and move to connector

So if we stop turning on panel power in pre_enable() then when the DP
controller's enable() is running the panel won't have any power. I
don't think that will be so bueno.


> > ...and, in my mind, it's up to the panel driver to know whether in
> > sequence s3) it has to _force_ power off between the unprepare and a
> > prepare.
> >
> > If pm_runtime() officially replaces prepare/unprepare then it's less
> > obvious (in my mind) that we have to coordinate with enable().
>
> I see
>
> >
> > 5. In general I've been asserting that it should be up to the panel to
> > power things on and drive all AUX transactions. ...but clearly my
> > model isn't reality. We certainly do AUX transactions from the DP
> > driver because the DP driver needs to know things about the connected
> > device, like the number of lanes it has, the version of eDP it
> > supports, and the available bit rates to name a few. Those things all
> > work today by relying on the fact that pre-enable powers the panel on.
> > It's pretty easy to say that reading the EDID (and I guess AUX
> > backlight) is the odd one out. So right now I guess my model is:
> >
> > 5a) If the panel code wants to access the AUX bus it can do so by
> > powering itself on and then just doing an AUX transaction and assuming
> > that the provider of the AUX bus can power itself on as needed.
> >
> > 5b) If the DP code wants to access the AUX bus it should make sure
> > that the next bridge's pre_enable() has been called. It can then
> > assume that the device is powered on until the next bridge's
> > post_disable() has been called.
> >
> > So I guess tl;dr: I'm not really a huge fan of the DP driver powering
> > the panel on by doing a pm_runtime_get() on it. I'd prefer to keep
> > with the interface that we have to pre_enable() the panel to turn it
> > on.
>
> Again, thank for the explanation. Your concerns make more sense now.
> As much as I hate writing docs, maybe we should put at least basic notes
> (regarding panel requirements) somewhere to the DP/DP AUX documentation?

Sure. I actually don't mind writing docs, but my problem is trying to
figure out where the heck to put them where someone would actually
notice them. I could throw a blurb in the kernel doc for `struct
drm_dp_aux` I guess? How about a deal: if you can tell me where to put
the above facts (essentially 5a and 5b) then I'm happy to post a patch
adding them.

Huh, actually, maybe the right place is in the "transfer" function of
that structure which, as of commit bacbab58f09d ("drm: Mention the
power state requirement on side-channel operations"), actually has a
blurb. ...but I don't think the blurb there is totally complete. What
if I changed it to this:

 * Also note that this callback can be called no matter the
 * state @dev is in and also no matter what state the panel is
 * in. It's expected:
 * - If the @dev providing the AUX bus is currently unpowered then
 *   it will power itself up for the transfer.
 * - If the panel is not in a state where it can respond (it's not
 *   powered or it's in a low power state) then this function will
 *   fail. Note that if a panel driver is initiating a DP AUX transfer
 *   it may power itself up however it wants. All other code should
 *   use the pre_enable() bridge chain (which eventually calls the
 *   panel prepare function) to power the panel.


> > [1] https://lore.kernel.org/r/20210402152701.v3.8.Ied721dc895156046ac523baa55a71da241cd09c7@changeid/
> > [2] https://lore.kernel.org/r/20210416223950.3586967-1-dianders@chromium.org/
> >
> >
> >> BTW: as I'm slowly diving into DP vs eDP differences. Do we need to
> >> write the EDID checksum like we do for DP?
> >
> > Write the EDID checksum? I don't know what that means. You mean
> > dp_panel_get_edid_checksum()? I'm not 100% sure, a quick glance seems
> > to make me feel it has to do with DP compliance testing? I can dig
> > more if need be. The generic EDID reading code already calculates the
> > checksum, so unless you're doing some funny business you shouldn't
> > need to check it again...
>
> I was thinking about  dp_link_send_edid_checksum() /

That one seems to be only used for DP_TEST_LINK_EDID_READ. I _think_
that's for DP compliance testing and I don't think we need compliance
testing for eDP.

> drm_dp_send_real_edid_checksum().

I don't see calls to this right now for Qualcomm, but it also looks
related to compliance testing?


So I guess where does that leave us? Maybe:

1. I'll add a WARN_ON() in of_dp_aux_populate_ep_devices() if there is
more than one DP AUX endpoint with a comment explaining why we assume
one DP AUX endpoint.

2. I'll create this new structure in drm_dp_aux_bus.h:

struct dp_aux_populate_callbacks {
  int (*done_probing)(struct drm_dp_aux *aux);
  void (*pre_remove)(struct drm_dp_aux *aux);
};

3. I'll add a second version of the populate functions that AUX bus
providers can use if they want callbacks:

int of_dp_aux_populate_ep_devices_cb(struct drm_dp_aux *aux,
                                     struct dp_aux_populate_callbacks *cb);
int devm_of_dp_aux_populate_ep_devices_cb(struct drm_dp_aux *aux,
                                          struct dp_aux_populate_callbacks *cb);

The old functions will just be changed to wrap the above and pass NULL
for the callbacks. To me, this seems better/simpler than notifiers or
any other scheme, but yell if you disagree.

4. I'll call the callsbacks in dp_aux_ep_probe() after a successful
probe. I'll add a second callback and will call it in
dp_aux_ep_remove() before passing the remove through to the panel.


If that sounds peachy then I think it should be pretty doable.


-Doug
