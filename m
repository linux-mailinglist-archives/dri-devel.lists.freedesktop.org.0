Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A7151CC22
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 00:35:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B37F310EDDC;
	Thu,  5 May 2022 22:35:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C40F110EDDC
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 22:35:41 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id z2so9713128ejj.3
 for <dri-devel@lists.freedesktop.org>; Thu, 05 May 2022 15:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=uM/Kum/c6qxO7h9cLoMxnqEHCEa1oke1Uu6HXgDrvxs=;
 b=M8+RnEbfE5VgNT1nuGONVnbO7QlSTt3AwT+6sXpUiJVXgdlsmpya/rtwiZDISXMMMs
 RXr95J9tgo9ooZx4vp9emNbPZyXhurkxBWzJtaz4SC1KuOElI50nhBJt4M/3spsWK6xe
 Day8R5RhNgu3Wq7uYCsToFSU5db+RMaRFlqXE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=uM/Kum/c6qxO7h9cLoMxnqEHCEa1oke1Uu6HXgDrvxs=;
 b=Sxlsorm7sFiVQNKjE1Khv2arpPCcRNJEzHLLsDPvVQRoJHF7HAADva7XtngejViGwq
 IL+fyPZvMmMQdrhdlH6Kz0msLHWIZoAAOUxwnZ6kGHPFHMJ9PexbQaIHCp6EcGeAp2vz
 RPdIstKP2OnprV3qBMJPey1e8l3eXTaoahrRrL8yriIHelvpXAFHnhrGEU45wroj/Hhs
 mdKD1NNBAgbI1hZ1UfGhxf2Ohhhycq3/+eyjrqKUxhw8VKv9PrFAye+3OLEbgZGZurwi
 JgaArEeoHTWtXH+GximR9PTHiC0g15n4lN2yyWrExrM6+59OruNj71Y7k5tP6XRXgVHb
 3E6Q==
X-Gm-Message-State: AOAM530VBgDFXPIpRi1y/tiG0YiQfQ4eRqf4jf1QgWXJm9Pr9xlmb3TQ
 2UGEUBs0WBE9gLmvRoBKCxz+ybHxkPsktLUTMuA=
X-Google-Smtp-Source: ABdhPJzlYJRex75mx1G9j0uYbQw70BMUnk7uOcsi5mTtwekeQuDGNx/5le42rU3vORFN1ofth+mPeA==
X-Received: by 2002:a17:907:96a8:b0:6f4:45f1:6e76 with SMTP id
 hd40-20020a17090796a800b006f445f16e76mr367161ejc.186.1651790139776; 
 Thu, 05 May 2022 15:35:39 -0700 (PDT)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com.
 [209.85.128.46]) by smtp.gmail.com with ESMTPSA id
 e13-20020a056402088d00b0042617ba63b5sm1382466edy.63.2022.05.05.15.35.39
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 15:35:39 -0700 (PDT)
Received: by mail-wm1-f46.google.com with SMTP id m62so3455158wme.5
 for <dri-devel@lists.freedesktop.org>; Thu, 05 May 2022 15:35:39 -0700 (PDT)
X-Received: by 2002:a05:600c:4f08:b0:391:fe3c:40e6 with SMTP id
 l8-20020a05600c4f0800b00391fe3c40e6mr7004338wmq.34.1651789717388; Thu, 05 May
 2022 15:28:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220503162033.1.Ia8651894026707e4fa61267da944ff739610d180@changeid>
 <YnJv3B/85hTz54SC@intel.com>
 <CAD=FV=WndmKuEB0=OVQP9YuJaSmD0uxkNs5LE0wWsFj7gBvhBA@mail.gmail.com>
 <1c6c9fde6e85f09cc89ea8dc6e8716fef58f3ee1.camel@redhat.com>
 <YnPjO4kbjezQl5Da@intel.com>
 <CAD=FV=XbZEagm5qR207mcVm1Ry=bGeuRAqTYx3SBoZfyo6fSkg@mail.gmail.com>
 <YnPoYsnx7IeBfJ5D@intel.com>
 <CAD=FV=WxxEGM4cLBHGMeRBFDAXGJJF105kLZ588JSFJRg8PM8A@mail.gmail.com>
 <CAA8EJppSof0wZ9nph8v_2pgRZj2BJiZ1hTBfLgQ+CFsT+h_dyQ@mail.gmail.com>
 <CAD=FV=WuAV-mrm0Bokqyyn7UgP5-jyNdhh8e4rqJibJ0Kutp_Q@mail.gmail.com>
 <CAA8EJpq=u0FF7wJ0hJv=Q-NhpUU_pnQxy5PX06DZUq5v5evydg@mail.gmail.com>
 <CAD=FV=XXLB90KOMvnWTTPyNNcCCVo+gja+2_iSGPnfu77wzknA@mail.gmail.com>
 <03024c6d-bd85-8878-4e1f-f17376b5894a@linaro.org>
In-Reply-To: <03024c6d-bd85-8878-4e1f-f17376b5894a@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 5 May 2022 15:28:23 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UZWBdiH_KY3JJZiLYyAkqZHfy+SD7GQaTwSDmF58AHBg@mail.gmail.com>
Message-ID: <CAD=FV=UZWBdiH_KY3JJZiLYyAkqZHfy+SD7GQaTwSDmF58AHBg@mail.gmail.com>
Subject: Re: [PATCH] drm: Document that power requirements for DP AUX transfers
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Jani Nikula <jani.nikula@intel.com>,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Robert Foss <robert.foss@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, May 5, 2022 at 3:15 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 06/05/2022 00:24, Doug Anderson wrote:
> > Hi,
> >
> > On Thu, May 5, 2022 at 1:56 PM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> >>
> >> On Thu, 5 May 2022 at 23:21, Doug Anderson <dianders@chromium.org> wro=
te:
> >>>
> >>> Hi,
> >>>
> >>> On Thu, May 5, 2022 at 1:10 PM Dmitry Baryshkov
> >>> <dmitry.baryshkov@linaro.org> wrote:
> >>>>
> >>>> On Thu, 5 May 2022 at 18:53, Doug Anderson <dianders@chromium.org> w=
rote:
> >>>>>
> >>>>> Hi,
> >>>>>
> >>>>> On Thu, May 5, 2022 at 8:29 AM Ville Syrj=C3=A4l=C3=A4
> >>>>> <ville.syrjala@linux.intel.com> wrote:
> >>>>>>
> >>>>>> On Thu, May 05, 2022 at 08:00:20AM -0700, Doug Anderson wrote:
> >>>>>>> Hi,
> >>>>>>>
> >>>>>>> On Thu, May 5, 2022 at 7:46 AM Ville Syrj=C3=A4l=C3=A4
> >>>>>>> <ville.syrjala@linux.intel.com> wrote:
> >>>>>>>>
> >>>>>>>> On Wed, May 04, 2022 at 02:10:08PM -0400, Lyude Paul wrote:
> >>>>>>>>> On Wed, 2022-05-04 at 09:04 -0700, Doug Anderson wrote:
> >>>>>>>>>> Hi,
> >>>>>>>>>>
> >>>>>>>>>> On Wed, May 4, 2022 at 5:21 AM Ville Syrj=C3=A4l=C3=A4
> >>>>>>>>>> <ville.syrjala@linux.intel.com> wrote:
> >>>>>>>>>>>
> >>>>>>>>>>> On Tue, May 03, 2022 at 04:21:08PM -0700, Douglas Anderson wr=
ote:
> >>>>>>>>>>>> When doing DP AUX transfers there are two actors that need t=
o be
> >>>>>>>>>>>> powered in order for the DP AUX transfer to work: the DP sou=
rce and
> >>>>>>>>>>>> the DP sync. Commit bacbab58f09d ("drm: Mention the power st=
ate
> >>>>>>>>>>>> requirement on side-channel operations") added some document=
ation
> >>>>>>>>>>>> saying that the DP source is required to power itself up (if=
 needed)
> >>>>>>>>>>>> to do AUX transfers. However, that commit doesn't talk anyth=
ing about
> >>>>>>>>>>>> the DP sink.
> >>>>>>>>>>>>
> >>>>>>>>>>>> For full fledged DP the sink isn't really a problem. It's ex=
pected
> >>>>>>>>>>>> that if an external DP monitor isn't plugged in that attempt=
ing to do
> >>>>>>>>>>>> AUX transfers won't work. It's also expected that if a DP mo=
nitor is
> >>>>>>>>>>>> plugged in (and thus asserting HPD) that it AUX transfers wi=
ll work.
> >>>>>>>>>>>>
> >>>>>>>>>>>> When we're looking at eDP, however, things are less obvious.=
 Let's add
> >>>>>>>>>>>> some documentation about expectations. Here's what we'll say=
:
> >>>>>>>>>>>>
> >>>>>>>>>>>> 1. We don't expect the DP AUX transfer function to power on =
an eDP
> >>>>>>>>>>>> panel. If an eDP panel is physically connected but powered o=
ff then it
> >>>>>>>>>>>> makes sense for the transfer to fail.
> >>>>>>>>>>>
> >>>>>>>>>>> I don't agree with this. I think the panel should just get po=
wred up
> >>>>>>>>>>> for AUX transfers.
> >>>>>>>>>>
> >>>>>>>>>> That's definitely a fair thing to think about and I have at ti=
mes
> >>>>>>>>>> thought about trying to make it work that way. It always ends =
up
> >>>>>>>>>> hitting a roadblock.
> >>>>>>>>
> >>>>>>>> How do you even probe the panel initially if you can't power it =
on
> >>>>>>>> without doing some kind of full modeset/etc.?
> >>>>>>>
> >>>>>>> It's not that we can't power it on without a full modeset. It' th=
at at
> >>>>>>> panel probe time all the DRM components haven't been hooked toget=
her
> >>>>>>> yet, so the bridge chain isn't available yet. The panel can power
> >>>>>>> itself on, though. This is why the documentation I added says: "i=
f a
> >>>>>>> panel driver is initiating a DP AUX transfer it may power itself =
up
> >>>>>>> however it wants"
> >>>>>>>
> >>>>>>>
> >>>>>>>>>> The biggest roadblock that I recall is that to make this work =
then
> >>>>>>>>>> you'd have to somehow ensure that the bridge chain's pre_enabl=
e() call
> >>>>>>>>>> was made as part of the AUX transfer, right? Since the transfe=
r
> >>>>>>>>>> function can be called in any context at all, we have to coord=
inate
> >>>>>>>>>> this with DRM. If, for instance, DRM is mid way through poweri=
ng the
> >>>>>>>>>> panel down then we need to wait for DRM to fully finish poweri=
ng down,
> >>>>>>>>>> then we need to power the panel back up. I don't believe that =
we can
> >>>>>>>>>> just force the panel to stay on if DRM is turning it off becau=
se of
> >>>>>>>>>> panel power sequencing requirements. At least I know it would =
have the
> >>>>>>>>>> potential to break "samsung-atna33xc20.c" which absolutely nee=
ds to
> >>>>>>>>>> see the panel power off after it's been disabled.
> >>>>>>>>>>
> >>>>>>>>>> We also, I believe, need to handle the fact that the bridge ch=
ain may
> >>>>>>>>>> not have even been created yet. We do AUX transfers to read th=
e EDID
> >>>>>>>>>> and also to setup the backlight in the probe function of panel=
-edp. At
> >>>>>>>>>> that point the panel hasn't been linked into the chain. We had=
 _long_
> >>>>>>>>>> discussions [1] about moving these out of probe and decided th=
at we
> >>>>>>>>>> could move the EDID read to be later but that it was going to =
really
> >>>>>>>>>> ugly to move the AUX backlight later. The backlight would end =
up
> >>>>>>>>>> popping up at some point in time later (the first call to pane=
l
> >>>>>>>>>> prepare() or maybe get_modes()) and that seemed weird.
> >>>>>>>>>>
> >>>>>>>>>> [1]
> >>>>>>>>>> https://lore.kernel.org/lkml/CAD=3DFV=3DU5-sTDLYdkeJWLAOG-0wgx=
R49VxtwUyUO7z2PuibLGsg@mail.gmail.com/
> >>>>>>>>>>
> >>>>>>>>>>
> >>>>>>>>>>> Otherwise you can't trust that eg. the /dev/aux
> >>>>>>>>>>> stuff is actually usable.
> >>>>>>>>>>
> >>>>>>>>>> Yeah, it's been on my mind to talk more about /dev/aux. I thin=
k
> >>>>>>>>>> /dev/aux has some problems, at least with eDP. Specifically:
> >>>>>>>>>>
> >>>>>>>>>> 1. Even if we somehow figure out how to power the panel on as =
part of
> >>>>>>>>>> the aux transfer, we actually _still_ not guaranteed to be abl=
e to
> >>>>>>>>>> talk to it as far as I understand. My colleague reported to me=
 that on
> >>>>>>>>>> a system he was working with that had PSR (panel self refresh)=
 that
> >>>>>>>>>> when the panel was powered on but in PSR mode that it wouldn't=
 talk
> >>>>>>>>>> over AUX. Assuming that this is correct then I guess we'd also=
 have to
> >>>>>>>>>> do even more coordination with DRM to exit PSR and block futur=
e
> >>>>>>>>>> transitions of PSR. (NOTE: it's always possible that my collea=
gue ran
> >>>>>>>>>> into some other bug and that panels are _supposed_ to be able =
to talk
> >>>>>>>>>> in PSR. If you think this is the case, I can always try to dig=
 more).
> >>>>>>>>>
> >>>>>>>>> TBH - the coordination with drm I don't think would be the diff=
icult part, as
> >>>>>>>>> we'd just need to add some sort of property (ideally invisible =
to userspace)
> >>>>>>>>> that can be used in an atomic commit to disable PSR - similar t=
o how we enable
> >>>>>>>>> CRC readback from sysfs in the majority of DRM drivers. That be=
ing said
> >>>>>>>>> though, I think we can just leave the work of solving this prob=
lem up to
> >>>>>>>>> whoever ends up needing this to work.
> >>>>>>>>
> >>>>>>>> The driver should just disable/prevent PSR when doing AUX if the=
 hardware
> >>>>>>>> can't guarantee the PSR and AUX won't interfere with each other.
> >>>>>>>
> >>>>>>> OK, fair enough. If we can solve the PSR problem that would be gr=
eat.
> >>>>>>>
> >>>>>>>
> >>>>>>>> For i915 we have no problems with powering the panel on for AUX,=
 but
> >>>>>>>> there is still a race with PSR vs. AUX because both use the same=
 hardware
> >>>>>>>> internally. I've been nagging at people to fix this for i915 but=
 I don't
> >>>>>>>> think it still got done :( Originally we were supposed to get a =
hardware
> >>>>>>>> mutex for this but that plan got scrapped for some reason.
> >>>>>>>
> >>>>>>> I haven't looked at the i915 DRM code much, but my understanding =
is
> >>>>>>> that it's more of an "all in one" approach. The one driver pretty=
 much
> >>>>>>> handles everything itself. That means that powering the panel up =
isn't
> >>>>>>> too hard. Is that right?
> >>>>>>
> >>>>>> Yeah, we don't have too many "helpful" abstractions in the way ;)
> >>>>>>
> >>>>>>>>>> for userspace to be mucking with /dev/aux. For DP's case I gue=
ss
> >>>>>>>>>> /dev/aux is essentially enabling userspace drivers to do thing=
s like
> >>>>>>>>>> update firmware on DP monitors or play with the backlight. I g=
uess we
> >>>>>>>>>> decided that we didn't want to add drivers in the kernel to ha=
ndle
> >>>>>>>>>> this type of stuff so we left it for userspace? For eDP, thoug=
h, there
> >>>>>>>>>
> >>>>>>>>> The main reason DP AUX got exposed to userspace in the first pl=
ace was for
> >>>>>>>>> usecases like fwupd,
> >>>>>>>>
> >>>>>>>> My memory says the original reason was debugging. Or at least I =
had
> >>>>>>>> no idea fwupd had started to use this until I saw some weird loo=
king
> >>>>>>>> DPCD addresses in some debug log.
> >>>>>>>>
> >>>>>>>> But I suppose it's possible there were already plans for firmwar=
e
> >>>>>>>> updates and whatnot and it just wasn't being discussed when this=
 was
> >>>>>>>> being developed.
> >>>>>>>
> >>>>>>> If it's just for debugging, I'd argue that leaving it as-is shoul=
d be
> >>>>>>> fine. Someone poking around with their system can find a way to m=
ake
> >>>>>>> sure that the panel stays on.
> >>>>>>
> >>>>>> That could require altering the state of the system quite a bit, w=
hich
> >>>>>> may defeat the purpose.
> >>>>>
> >>>>> It does? In my experience you just need to make sure that the panel=
 is
> >>>>> turned on. ...or are you saying that you'd use this for debugging a
> >>>>> case where the system isn't probing properly?
> >>>>>
> >>>>> If things are truly in bad shape, at least on boards using device t=
ree
> >>>>> it's easy to tweak the device tree to force a regulator to stay on.=
 I
> >>>>> suppose we could also add a "debugfs" entry for the panel that also
> >>>>> forces it to be powered on.
> >>>>>
> >>>>>
> >>>>>>   At least I would not be willing to accept such
> >>>>>> a limitation.
> >>>>>
> >>>>> Hmm, so where does that leave us? Are you against landing this patc=
h?
> >>>>> I've done a lot of cleanups recently and I just don't think I have =
the
> >>>>> time to rework all the AUX transfer functions and figure out how to
> >>>>> power the panel. It also seems like a lot of added complexity for a
> >>>>> debug path.
> >>>>
> >>>> If my 2c counts, I support landing this patch. It clearly documents
> >>>> current behaviour and expectations.
> >>>>
> >>>> If that helps,
> >>>> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>>>
> >>>> As for the /dev/aux, question, I think we can make the following pla=
n work:
> >>>> - Document that eDP panel power up can be handled by using the
> >>>> pm_runtime API (which is the case for both panel-edp and atna33xc20)=
).
> >>>> I think this is a sensible requirement anyway. And both panels show
> >>>> how to handle different poweron/poweroff timings.
> >>>> - Make drm_dp_aux_dev_get_by_minor() pm_runtime_get() the attached p=
anel.
> >>>
> >>> This matches what you suggested previously, but I still think it has =
a
> >>> potential problem as I talked about in the my previous (very long)
> >>> reply [1]. The relevant part was:
> >>>
> >>>> Now, despite the fact that the generic eDP panel code doesn't follow
> >>>> the "strict"ness I just described, the _other_ DP panel I worked on
> >>>> recently (samsung-atna33xc20) does. In testing we found that this
> >>>> panel would sometimes (like 1 in 20 times?) crash if you ever stoppe=
d
> >>>> outputting data to the display and then started again. You absolutel=
y
> >>>> needed to fully power cycle the display each time. I tried to docume=
nt
> >>>> this to the best of my ability in atana33xc20_unprepare(). There's
> >>>> also a WARN_ON() in atana33xc20_enable() trying to detect if someone
> >>>> is doing something the panel driver doesn't expect.
> >>>
> >>> Specifically, I think you could get in trouble if you did:
> >>>
> >>> a) drm wants to power down the panel.
> >>>
> >>> b) drm calls the panel's disable() function
> >>>
> >>> c) we start an aux transfer and grab a runtime pm reference
> >>>
> >>> d) drm calls the panel's unprepare() function =3D> atana33xc20_unprep=
are()
> >>>
> >>> e) atana33xc20_unprepare()'s pm_runtime_put_sync_suspend() _won't_
> >>> power off the panel (we still have the reference from step c), even
> >>> though it needs to.
> >>>
> >>> f) we'll finish an aux transfer and, presumably, call
> >>> pm_runtime_put_autosuspend()
> >>>
> >>> g) drm wants to power the panel back up
> >>>
> >>> h) drm calls the panel's prepare() function, but power wasn't properl=
y cycled
> >>
> >> Why? We'd need to extend the prepare() function with the flag
> >> data_was_on, which is set in the enable() and cleared in the suspend
> >> path. If we see this flag in the prepare() callback, we should
> >> forcibly power cycle the panel by toggling the regulator. Yes, this
> >> will cause additional wait.
> >>
> >> Another option might be to toggle the autosuspend support. Let the
> >> disable() call pm_runtime_dont_autosuspend() (which would turn all
> >> autosuspend calls into plain pm_runtime_put()) and allow it again in
> >> the resume(). I'm not 100% sure that this will work, but it looks like
> >> it should.
> >
> > It turns out, though, that we _want_ autosuspend sometimes, even when
> > the panel is disabled. Specifically, if the panel is disabled and then
> > atana33xc20_get_modes() gets called then we _don't_ want to fully
> > power the panel off. It's expected that there will be a future call to
> > prepare() soon after the get_modes() and we don't want a full power
> > cycle (500 ms) there. This mechanism is also fully allowed by the eDP
> > spec. The only time we _need_ a full power cycle is after disable().
>
> Yes. That's why I proposed to put pm_runtime_dont_autosuspend() call to
> the disable(). So that after get_modes() there will be no power cycle,
> but only after disable() call.

Ah, I see! One issue is that it's valid to call get_modes() but then
_not_ follow it up with a subsequent power on of the panel. We can't
leave the panel in a high power state in that case. I think that would
be a problem..


> > In any case, we can come up with complex ways to solve this, but I'm
> > still just not convinced that it's worth it. There's no valid use case
> > other than debugging. IMO if we're poking around and want to read DP
> > registers while the panel is on then it works just fine. A user doing
> > this can ensure that the panel is on while poking. Certainly I've done
> > that and it wasn't a big imposition.
> >
> > If someone wants to submit patches to attempt this then I'm happy to
> > test them, but I feel like it's adding complexity for very little
> > value. The way it works now is simple / understandable and mathes my
> > intuition from other busses, like i2c. The bus is just responsible for
> > powering itself, not the devices on the bus. It has also long been
> > documented since commit 83127f67e450 ("drm/panel: Flesh out
> > kerneldoc") in 2016 that the way to turn on a panel for communication
> > over the command bus is via drm_panel_prepare(). I don't think we need
> > to change this.
>
> Yes.
>
>
> >> The second option leaves a possible window for the panel issues if the
> >> userspace AUX transfer is ongoing while the panel is being unprepared
> >> and then prepared again. In this case it will never be power cycled.
> >> However after some thought I think this is correct. You wouldn't like
> >> to power cycle a panel while you are e.g. updating the firmware.
> >
> > As per my earlier responses, nothing we are doing here solves the
> > firmware update anyway. Even if we automatically power the panel for
> > the duration of a single aux transfer, nothing prevents the panel from
> > turning off between transfers. There's no API to "keep the power on
> > until I say stop". You certainly wouldn't want a panel to turn off
> > midway through a firmware update. IMO if we want to use this for
> > firmware update, we either need an special way to force the panel on
> > (in which case, we don't need to worry about it in the aux transfer
> > function) or (better IMO) we need to manage the firmware update in the
> > panel driver and prevent some type of sysfs interface to provide the
> > new firmware and kick off the update. Presumably having this managed
> > by the panel driver would be best because the panel driver could know
> > to, for instance, re-read the EDID after the firmware update took
> > place.
>
> That's why I suggested pm_runtime_get()'ting the panel from
> drm_dp_aux_dev_get_by_minor(). This way the whole userspace session will
> be protected.
>
> But as you said, this becomes more and more complex with little added val=
ue.

Ah! I had missed the drm_dp_aux_dev_get_by_minor(). Seems like that
would work. If we ever come back to this, IMO I'd rather see it
actually end up calling the panel prepare() if we can figure out how
to do that. ...and also make sure that we're not currently in the
middle of a drm call that's turning on or turning off the panel. The
fact that (I think) we need to coordinate with DRM anyway means that I
think using the existing panel API wouldn't be that hard to do.

-Doug
