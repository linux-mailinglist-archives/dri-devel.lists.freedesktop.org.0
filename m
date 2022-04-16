Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2CB5031FB
	for <lists+dri-devel@lfdr.de>; Sat, 16 Apr 2022 02:09:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0585E10E231;
	Sat, 16 Apr 2022 00:09:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FC1A10E041
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Apr 2022 00:09:39 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id y10so325293ejw.8
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 17:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wfViRToI8NMog1EM1oALflDw/OnzHe0DaB3vq2lgics=;
 b=bc3YxIO3zkRIOWcBG93hUCPQs0IAyazH7fKA5MBGEIo7I3mjAUaNc7aDYCeWC2mtSL
 14upvMBFsbvtztLOxz6j92GxU20NrPp8HL2qbOdKj6pQDMp1cS8u+ulThNl+1csuXUu+
 LrENTv0pYu65R0BfmQSwMvcpqWv4hGPTAaRGc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wfViRToI8NMog1EM1oALflDw/OnzHe0DaB3vq2lgics=;
 b=zDHlGa0F6CMrA6l6fn3eJ7rmaR6RnDcupFmEPoa20mtYXmbcf2hDmskfyG8jbMCRR1
 5lqOcS6mEYNcu0kXuAIkHj6RRVGvn4Z7RxKl/igkUQxxyWR8QXWRZmQpUaue1AgxNIr2
 Vl9oroNmeQPTdf2lAY833yUfGVc7n6wXrGqf7MEUHPR2uvf8E9R38OysA9Xh173LGpDy
 NaHVGRQELIyMwFBxD3WFvtkco5cc9gHzyraT6UQnHEdQzaJ9+tcdcl0oQxrNdkvyX6jl
 R0uNDV8P0ij15DnjL8SfX+E/a2aum2zpVeQuJH/t4hr6Ok6SbNjQKgFoqjNc53RLuV/x
 cYuQ==
X-Gm-Message-State: AOAM533WCjTSxB+POqNqHFn6n8l/CF3swtblURKv1iTGpESsdz3sB56p
 zu+0TwSy7O/1s54BDlDcHRqH/oWiPKFSkQ==
X-Google-Smtp-Source: ABdhPJy/vYfV192mU8PW8sqlggErab4UHWuyUu2T4GZdXF0qidxdDp1/8A5OQxyYrPEjOha3//9BLg==
X-Received: by 2002:a17:907:94d5:b0:6ef:5908:44b9 with SMTP id
 dn21-20020a17090794d500b006ef590844b9mr1022454ejc.444.1650067777149; 
 Fri, 15 Apr 2022 17:09:37 -0700 (PDT)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com.
 [209.85.221.53]) by smtp.gmail.com with ESMTPSA id
 i26-20020a50d75a000000b0041e84bb406fsm3359352edj.0.2022.04.15.17.09.35
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Apr 2022 17:09:35 -0700 (PDT)
Received: by mail-wr1-f53.google.com with SMTP id c10so12233359wrb.1
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Apr 2022 17:09:35 -0700 (PDT)
X-Received: by 2002:a5d:4d0e:0:b0:207:a329:24fa with SMTP id
 z14-20020a5d4d0e000000b00207a32924famr859316wrt.342.1650067774465; Fri, 15
 Apr 2022 17:09:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220409023628.2104952-1-dianders@chromium.org>
 <20220408193536.RFC.1.I4182ae27e00792842cb86f1433990a0ef9c0a073@changeid>
 <a9a5dfb7-819b-d3a2-2c47-d5b239d21ad3@linaro.org>
 <CAD=FV=WKwErpD7iCu+2jFvMutmmmgLUEhAnw8s=27wUxcpF-aQ@mail.gmail.com>
 <CAA8EJppOVqaAEVeQY7p0EfCObJxfL591kbaYLYfbgOHHtmfhXw@mail.gmail.com>
In-Reply-To: <CAA8EJppOVqaAEVeQY7p0EfCObJxfL591kbaYLYfbgOHHtmfhXw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 15 Apr 2022 17:09:21 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UmXzPyVOa-Y0gpY0qcukqW3ge5DBPx6ak88ydEqTsBiQ@mail.gmail.com>
Message-ID: <CAD=FV=UmXzPyVOa-Y0gpY0qcukqW3ge5DBPx6ak88ydEqTsBiQ@mail.gmail.com>
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

On Fri, Apr 15, 2022 at 3:45 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Sat, 16 Apr 2022 at 00:13, Doug Anderson <dianders@chromium.org> wrote:
> >
> > Hi,
> >
> > On Thu, Apr 14, 2022 at 5:47 PM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> > >
> > > On 09/04/2022 05:36, Douglas Anderson wrote:
> > > > As talked about in the kerneldoc for "struct dp_aux_ep_client" in this
> > > > patch and also in the past in commit a1e3667a9835 ("drm/bridge:
> > > > ti-sn65dsi86: Promote the AUX channel to its own sub-dev"), to use the
> > > > DP AUX bus properly we really need two "struct device"s. One "struct
> > > > device" is in charge of providing the DP AUX bus and the other is
> > > > where we'll try to get a reference to the newly probed endpoint
> > > > devices.
> > > >
> > > > In ti-sn65dsi86 this wasn't too difficult to accomplish. That driver
> > > > is already broken up into several "struct devices" anyway because it
> > > > also provides a PWM and some GPIOs. Adding one more wasn't that
> > > > difficult / ugly.
> > > >
> > > > When I tried to do the same solution in parade-ps8640, it felt like I
> > > > was copying too much boilerplate code. I made the realization that I
> > > > didn't _really_ need a separate "driver" for each person that wanted
> > > > to do the same thing. By putting all the "driver" related code in a
> > > > common place then we could save a bit of hassle. This change
> > > > effectively adds a new "ep_client" driver that can be used by
> > > > anyone. The devices instantiated by this driver will just call through
> > > > to the probe/remove/shutdown calls provided.
> > > >
> > > > At the moment, the "ep_client" driver is backed by the Linux auxiliary
> > > > bus (unfortunate naming--this has nothing to do with DP AUX). I didn't
> > > > want to expose this to clients, though, so as far as clients are
> > > > concerned they get a vanilla "struct device".
> > >
> > > I have been thinking about your approach for quite some time. I think
> > > that enforcing a use of auxilliary device is an overkill. What do we
> > > really need is the the set callbacks in the bus struct or a notifier. We
> > > have to notify the aux_bus controller side that the client has been
> > > probed successfully or that the client is going to be removed.
> >
> > It seems like these new callbacks would be nearly the same as the
> > probe/remove callbacks in my proposal except:
> >
> > * They rely on there being exactly 1 AUX device, or we make it a rule
> > that we wait for all AUX devices to probe (?)
>
> Is the backlight a separate device on an AUX bus? Judging from
> drm_panel_dp_aux_backlight(), it isn't. I assumed that aux bus is just
> a point-to-point bus, so there is always a single client.

Define "device". ;-)

It's a seperate "struct device" from a Linux point of view since it's
a backlight class device. Certainly it's highly correlated to the
display, but one can conceptually think of them as different devices,
sorta. ;-)

I actually dug a tiny bit more into the whole "touchscreen over aux".
I guess DP 1.2 has a standard of "USB over DP AUX". No idea how that
would be modeled, of course.

I guess the summary is that I'm OK w/ changing it to assume one device
for now, but I'm still not sure it's compelling to move to normal
callbacks. The API for callbacks is pretty much the same as the one I
proposed and IMO leaving it the way it is (with an extra struct
device) doesn't really add much complexity and has a few (small) nice
benefits.


> > * We need to come up with a system for detecting when everything
> > probes or is going to be removed, though that's probably not too hard.
> > I guess the DP AUX bus could just replace the panel's probe function
> > with its own and essentially "tail patch" it. I guess it could "head
> > patch" the remove call? ...or is there some better way you were
> > thinking of knowing when all our children probed?
> >
> > * The callback on the aux bus controller side would not be able to
> > DEFER. In other words trying to acquire a reference to the panel can
> > always be the last thing we do so we know there can be no reasons to
> > defer after. This should be doable, but at least in the ps8640 case it
> > will require changing the code a bit. I notice that today it actually
> > tries to get the panel side _before_ it gets the MIPI side and it
> > potentially can return -EPROBE_DEFER if it can't find the MIPI side. I
> > guess I have a niggling feeling that we'll find some reason in the
> > future that we can't be last, but we can probably ignore that. ;-)
> >
> > I can switch this all to normal callbacks if that's what everyone
> > wants, but it doesn't feel significantly cleaner to me and does seem
> > to have some (small) downsides.
> >
> >
> > > And this
> > > approach would make driver's life easier, since e.g. the bus code can
> > > pm_get the EP device before calling callbacks/notifiers and
> > > pm_put_autosuspend it afterwards.
> >
> > Not sure about doing the pm calls on behalf of the EP device. What's
> > the goal there?
>
> I think any driver can pm_runtime_get another device. The goal is to
> let the 'post_probe' callback to power up the panel, read the EDID,
> etc.

Right. I was hoping to keep this as a separate discussion since I
think it's largely unrelated to the probe ordering issue, but we can
talk about it here if you want.

There are a lot of open questions here and it's definitely hard to
wrap your head around all of it. Maybe I'll just spam some thoughts
and see if they all make sense together...

1. At the moment, there's no guarantee that a DP AUX Endpoint (AKA
panel) will use pm_runtime() to power itself up enough to do an AUX
transfer. At the moment the two eDP panels drivers I'm aware of use
pm_runtime, but that's actually a fairly new behavior. I guess we'd
have to codify it as "required" if we were going to rely on it.

2. In general, panels have powered themselves enough to read the EDID
in their prepare() stage, which is equivalent to the bridge's
pre_enable(). During some of my early patches to try to support EDID
reading in ti-sn65dsi86 I actually relied upon it. It was like that in
v3 [1]. Personally I see this as the "official" interface to power on
the panel from the DP controller. As such I'm not sure we need to add
pm_runtime() as an equivalent option.

3. In the cover letter of v4 of my ti-sn65dsi86 EDID patch series I
talked about why I switched to having EDID reading driven by the panel
instead of powering on the panel (via pre_enable) and reading the EDID
in the controller. One reason talked about there is that the "generic"
eDP panel driver actually needs the EDID, or at least enough of it to
get the panel ID, so that it can adjust its power sequence timings. If
the EDID reading is completely handled by the DP driver and the panel
can't do it then we'd need to figure out how to communicate it back.

4. In general, panels can be pretty persnickety about their power
sequencing. As far as I've been able to tell, the official spec
provides two things you can do:

4a) You can power the panel up enough to do AUX transfers and then
power it back off.

4b) You can power the panel up enough to do AUX transfers, then finish
powering it all the way up (turn on screen, backlight, etc). When you
turn the screen off, if you follow the spec strictly, you're also
_required_ to fully power the panel off. In other words, remove _all_
power from the display including any power that would be needed to do
AUX transfers.

Now the generic eDP panel code doesn't currently follow the
"strict"ness of the spec and I'm not actually sure if that's how the
spec is intended to be interpreted anyway. There are two timing
diagrams, though. One for "aux transfer only" and the other for
"normal system operation". In the "normal system operation" the
diagram doesn't allow for the backlight to ever go off and on again.

Now, despite the fact that the generic eDP panel code doesn't follow
the "strict"ness I just described, the _other_ DP panel I worked on
recently (samsung-atna33xc20) does. In testing we found that this
panel would sometimes (like 1 in 20 times?) crash if you ever stopped
outputting data to the display and then started again. You absolutely
needed to fully power cycle the display each time. I tried to document
this to the best of my ability in atana33xc20_unprepare(). There's
also a WARN_ON() in atana33xc20_enable() trying to detect if someone
is doing something the panel driver doesn't expect. I've also been
trying to keep my eyes out to see if we need to do the same thing in
generic eDP panel code, either for everyone or via some type of
per-panel quirk. There's definitely a good reason to avoid the extra
cycling if possible since powering panels off and on again often
requires hundreds of milliseconds of delay in order to meet timing
diagrams. ...and we do this if we ever change panel "modes".

...OK, so why does this all matter? I guess my point here is I worry a
little bit about saying that the DP controller code can willy nilly
request the panel to be powered whenever it wants. If the DP
controller was trying to hold the panel powered and then we _needed_
to power the panel off then that would be bad. It doesn't mean we
can't be careful about it, of course...

Said another way, in my mental model these three sequences are allowed:

s1) prepare, unprepare
s2) prepare, enable, disable, unprepare
s3) prepare, enable, disable, unprepare, prepare, enable, disable, unprepare

...and this sequence is _not_ allowed:

s4) prepare, enable, disable, enable, disable, unprepare

...and, in my mind, it's up to the panel driver to know whether in
sequence s3) it has to _force_ power off between the unprepare and a
prepare.

If pm_runtime() officially replaces prepare/unprepare then it's less
obvious (in my mind) that we have to coordinate with enable().

5. In general I've been asserting that it should be up to the panel to
power things on and drive all AUX transactions. ...but clearly my
model isn't reality. We certainly do AUX transactions from the DP
driver because the DP driver needs to know things about the connected
device, like the number of lanes it has, the version of eDP it
supports, and the available bit rates to name a few. Those things all
work today by relying on the fact that pre-enable powers the panel on.
It's pretty easy to say that reading the EDID (and I guess AUX
backlight) is the odd one out. So right now I guess my model is:

5a) If the panel code wants to access the AUX bus it can do so by
powering itself on and then just doing an AUX transaction and assuming
that the provider of the AUX bus can power itself on as needed.

5b) If the DP code wants to access the AUX bus it should make sure
that the next bridge's pre_enable() has been called. It can then
assume that the device is powered on until the next bridge's
post_disable() has been called.

So I guess tl;dr: I'm not really a huge fan of the DP driver powering
the panel on by doing a pm_runtime_get() on it. I'd prefer to keep
with the interface that we have to pre_enable() the panel to turn it
on.


[1] https://lore.kernel.org/r/20210402152701.v3.8.Ied721dc895156046ac523baa55a71da241cd09c7@changeid/
[2] https://lore.kernel.org/r/20210416223950.3586967-1-dianders@chromium.org/


> BTW: as I'm slowly diving into DP vs eDP differences. Do we need to
> write the EDID checksum like we do for DP?

Write the EDID checksum? I don't know what that means. You mean
dp_panel_get_edid_checksum()? I'm not 100% sure, a quick glance seems
to make me feel it has to do with DP compliance testing? I can dig
more if need be. The generic EDID reading code already calculates the
checksum, so unless you're doing some funny business you shouldn't
need to check it again...


> Do you have any good summary for eDP vs DP differences?

I don't. :( Mostly stuff here is me trying to grok bits out of what
existing drivers were doing and trying to cross reference it with the
eDP spec that I have (which I don't believe I can share,
unfortunately).

-Doug
