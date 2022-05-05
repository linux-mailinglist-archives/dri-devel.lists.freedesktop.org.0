Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EBB51CAD4
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 22:56:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B16910F5BD;
	Thu,  5 May 2022 20:56:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [IPv6:2607:f8b0:4864:20::b2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ECF310F5BD
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 20:56:37 +0000 (UTC)
Received: by mail-yb1-xb2a.google.com with SMTP id r11so9690137ybg.6
 for <dri-devel@lists.freedesktop.org>; Thu, 05 May 2022 13:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=f/CCC5dv+rEv401sgwjGksfSrZdpSoct3vZ9rGexjuM=;
 b=CcXtqd3tqvwYmWhooCooMgW/RUkZ3ehTpfyedmNSsPD8jRsQRePn4CJyK0lgKseb6Z
 LOsSKT9XrjG2j2XegR+HdSf57uAYyhfsjlyOzBgWlAprM6513YGXzRTrL7B7+UVC6z7H
 RQatEcKz0LQMRx35O8oYBE3U0qle2Si+XHBHFCYBKq9H4vmDS3qUf9LjMQGarELj1jNm
 ByV9mBbjvDZpVp+DvUAVO//tp3cum6bGUv3upzpniU6Jxjn1iAZAJSN0EmyKLgfw+M3V
 ZjTwytt/vjFn+bvMKe29RKPX1AnHhHZtQpcMEXr8Qp/XNuluU4wPhE2L4ytOkBwN7AxR
 CwFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=f/CCC5dv+rEv401sgwjGksfSrZdpSoct3vZ9rGexjuM=;
 b=yhYH67bp47nlfk+IdR6V7BiUu/jXbPURdZPNaVIfxrPVnCHOspLsxmdXHmItlCqzLl
 FFOS+zo4wAWd2qgVMThpemhxQrKYhBLseZB0mLYEEYZU8Py7qsNqsaqic2hqS3RS0fNy
 XnIAFvYhS+DnYvTPfrhiWxpF73QzYb2ft/RLzxhreOfQ771iXjNNqG37OK/5NJPSyMEf
 jmyEPHfqQCl/bB0/2ccdyKCWlvhG4UPYOnZYDvPHvWzPY8RvSq3h+R8+uuDWcyi6ujYD
 i3XQ1zowe6KPP5cGiApuHGPmCFw/BRmE2vC/OftfmV3gN3cWzfjkXmhnIlQFCjKrVdi+
 YtUQ==
X-Gm-Message-State: AOAM533TWHjqriJ7+FTg9hjAiGvASjaxOl5WyCMhc7ZXnYQcD6l8/+By
 YhpgMuhA7034Xk6qUNSv0J4FKkDEs92vBStNIG/z+w==
X-Google-Smtp-Source: ABdhPJxnrVm5GjZzXHQOnh3T8sLat7hbw14hE7l9YEGAJNHZncjJf/5plMDt3ViZ/6AYkfgl/z/AHoJgO9vs7pUUuIs=
X-Received: by 2002:a25:84c1:0:b0:63e:7733:f95a with SMTP id
 x1-20020a2584c1000000b0063e7733f95amr54396ybm.234.1651784196425; Thu, 05 May
 2022 13:56:36 -0700 (PDT)
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
In-Reply-To: <CAD=FV=WuAV-mrm0Bokqyyn7UgP5-jyNdhh8e4rqJibJ0Kutp_Q@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 5 May 2022 23:56:24 +0300
Message-ID: <CAA8EJpq=u0FF7wJ0hJv=Q-NhpUU_pnQxy5PX06DZUq5v5evydg@mail.gmail.com>
Subject: Re: [PATCH] drm: Document that power requirements for DP AUX transfers
To: Doug Anderson <dianders@chromium.org>
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

On Thu, 5 May 2022 at 23:21, Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Thu, May 5, 2022 at 1:10 PM Dmitry Baryshkov
> <dmitry.baryshkov@linaro.org> wrote:
> >
> > On Thu, 5 May 2022 at 18:53, Doug Anderson <dianders@chromium.org> wrot=
e:
> > >
> > > Hi,
> > >
> > > On Thu, May 5, 2022 at 8:29 AM Ville Syrj=C3=A4l=C3=A4
> > > <ville.syrjala@linux.intel.com> wrote:
> > > >
> > > > On Thu, May 05, 2022 at 08:00:20AM -0700, Doug Anderson wrote:
> > > > > Hi,
> > > > >
> > > > > On Thu, May 5, 2022 at 7:46 AM Ville Syrj=C3=A4l=C3=A4
> > > > > <ville.syrjala@linux.intel.com> wrote:
> > > > > >
> > > > > > On Wed, May 04, 2022 at 02:10:08PM -0400, Lyude Paul wrote:
> > > > > > > On Wed, 2022-05-04 at 09:04 -0700, Doug Anderson wrote:
> > > > > > > > Hi,
> > > > > > > >
> > > > > > > > On Wed, May 4, 2022 at 5:21 AM Ville Syrj=C3=A4l=C3=A4
> > > > > > > > <ville.syrjala@linux.intel.com> wrote:
> > > > > > > > >
> > > > > > > > > On Tue, May 03, 2022 at 04:21:08PM -0700, Douglas Anderso=
n wrote:
> > > > > > > > > > When doing DP AUX transfers there are two actors that n=
eed to be
> > > > > > > > > > powered in order for the DP AUX transfer to work: the D=
P source and
> > > > > > > > > > the DP sync. Commit bacbab58f09d ("drm: Mention the pow=
er state
> > > > > > > > > > requirement on side-channel operations") added some doc=
umentation
> > > > > > > > > > saying that the DP source is required to power itself u=
p (if needed)
> > > > > > > > > > to do AUX transfers. However, that commit doesn't talk =
anything about
> > > > > > > > > > the DP sink.
> > > > > > > > > >
> > > > > > > > > > For full fledged DP the sink isn't really a problem. It=
's expected
> > > > > > > > > > that if an external DP monitor isn't plugged in that at=
tempting to do
> > > > > > > > > > AUX transfers won't work. It's also expected that if a =
DP monitor is
> > > > > > > > > > plugged in (and thus asserting HPD) that it AUX transfe=
rs will work.
> > > > > > > > > >
> > > > > > > > > > When we're looking at eDP, however, things are less obv=
ious. Let's add
> > > > > > > > > > some documentation about expectations. Here's what we'l=
l say:
> > > > > > > > > >
> > > > > > > > > > 1. We don't expect the DP AUX transfer function to powe=
r on an eDP
> > > > > > > > > > panel. If an eDP panel is physically connected but powe=
red off then it
> > > > > > > > > > makes sense for the transfer to fail.
> > > > > > > > >
> > > > > > > > > I don't agree with this. I think the panel should just ge=
t powred up
> > > > > > > > > for AUX transfers.
> > > > > > > >
> > > > > > > > That's definitely a fair thing to think about and I have at=
 times
> > > > > > > > thought about trying to make it work that way. It always en=
ds up
> > > > > > > > hitting a roadblock.
> > > > > >
> > > > > > How do you even probe the panel initially if you can't power it=
 on
> > > > > > without doing some kind of full modeset/etc.?
> > > > >
> > > > > It's not that we can't power it on without a full modeset. It' th=
at at
> > > > > panel probe time all the DRM components haven't been hooked toget=
her
> > > > > yet, so the bridge chain isn't available yet. The panel can power
> > > > > itself on, though. This is why the documentation I added says: "i=
f a
> > > > > panel driver is initiating a DP AUX transfer it may power itself =
up
> > > > > however it wants"
> > > > >
> > > > >
> > > > > > > > The biggest roadblock that I recall is that to make this wo=
rk then
> > > > > > > > you'd have to somehow ensure that the bridge chain's pre_en=
able() call
> > > > > > > > was made as part of the AUX transfer, right? Since the tran=
sfer
> > > > > > > > function can be called in any context at all, we have to co=
ordinate
> > > > > > > > this with DRM. If, for instance, DRM is mid way through pow=
ering the
> > > > > > > > panel down then we need to wait for DRM to fully finish pow=
ering down,
> > > > > > > > then we need to power the panel back up. I don't believe th=
at we can
> > > > > > > > just force the panel to stay on if DRM is turning it off be=
cause of
> > > > > > > > panel power sequencing requirements. At least I know it wou=
ld have the
> > > > > > > > potential to break "samsung-atna33xc20.c" which absolutely =
needs to
> > > > > > > > see the panel power off after it's been disabled.
> > > > > > > >
> > > > > > > > We also, I believe, need to handle the fact that the bridge=
 chain may
> > > > > > > > not have even been created yet. We do AUX transfers to read=
 the EDID
> > > > > > > > and also to setup the backlight in the probe function of pa=
nel-edp. At
> > > > > > > > that point the panel hasn't been linked into the chain. We =
had _long_
> > > > > > > > discussions [1] about moving these out of probe and decided=
 that we
> > > > > > > > could move the EDID read to be later but that it was going =
to really
> > > > > > > > ugly to move the AUX backlight later. The backlight would e=
nd up
> > > > > > > > popping up at some point in time later (the first call to p=
anel
> > > > > > > > prepare() or maybe get_modes()) and that seemed weird.
> > > > > > > >
> > > > > > > > [1]
> > > > > > > > https://lore.kernel.org/lkml/CAD=3DFV=3DU5-sTDLYdkeJWLAOG-0=
wgxR49VxtwUyUO7z2PuibLGsg@mail.gmail.com/
> > > > > > > >
> > > > > > > >
> > > > > > > > > Otherwise you can't trust that eg. the /dev/aux
> > > > > > > > > stuff is actually usable.
> > > > > > > >
> > > > > > > > Yeah, it's been on my mind to talk more about /dev/aux. I t=
hink
> > > > > > > > /dev/aux has some problems, at least with eDP. Specifically=
:
> > > > > > > >
> > > > > > > > 1. Even if we somehow figure out how to power the panel on =
as part of
> > > > > > > > the aux transfer, we actually _still_ not guaranteed to be =
able to
> > > > > > > > talk to it as far as I understand. My colleague reported to=
 me that on
> > > > > > > > a system he was working with that had PSR (panel self refre=
sh) that
> > > > > > > > when the panel was powered on but in PSR mode that it would=
n't talk
> > > > > > > > over AUX. Assuming that this is correct then I guess we'd a=
lso have to
> > > > > > > > do even more coordination with DRM to exit PSR and block fu=
ture
> > > > > > > > transitions of PSR. (NOTE: it's always possible that my col=
league ran
> > > > > > > > into some other bug and that panels are _supposed_ to be ab=
le to talk
> > > > > > > > in PSR. If you think this is the case, I can always try to =
dig more).
> > > > > > >
> > > > > > > TBH - the coordination with drm I don't think would be the di=
fficult part, as
> > > > > > > we'd just need to add some sort of property (ideally invisibl=
e to userspace)
> > > > > > > that can be used in an atomic commit to disable PSR - similar=
 to how we enable
> > > > > > > CRC readback from sysfs in the majority of DRM drivers. That =
being said
> > > > > > > though, I think we can just leave the work of solving this pr=
oblem up to
> > > > > > > whoever ends up needing this to work.
> > > > > >
> > > > > > The driver should just disable/prevent PSR when doing AUX if th=
e hardware
> > > > > > can't guarantee the PSR and AUX won't interfere with each other=
.
> > > > >
> > > > > OK, fair enough. If we can solve the PSR problem that would be gr=
eat.
> > > > >
> > > > >
> > > > > > For i915 we have no problems with powering the panel on for AUX=
, but
> > > > > > there is still a race with PSR vs. AUX because both use the sam=
e hardware
> > > > > > internally. I've been nagging at people to fix this for i915 bu=
t I don't
> > > > > > think it still got done :( Originally we were supposed to get a=
 hardware
> > > > > > mutex for this but that plan got scrapped for some reason.
> > > > >
> > > > > I haven't looked at the i915 DRM code much, but my understanding =
is
> > > > > that it's more of an "all in one" approach. The one driver pretty=
 much
> > > > > handles everything itself. That means that powering the panel up =
isn't
> > > > > too hard. Is that right?
> > > >
> > > > Yeah, we don't have too many "helpful" abstractions in the way ;)
> > > >
> > > > > > > > for userspace to be mucking with /dev/aux. For DP's case I =
guess
> > > > > > > > /dev/aux is essentially enabling userspace drivers to do th=
ings like
> > > > > > > > update firmware on DP monitors or play with the backlight. =
I guess we
> > > > > > > > decided that we didn't want to add drivers in the kernel to=
 handle
> > > > > > > > this type of stuff so we left it for userspace? For eDP, th=
ough, there
> > > > > > >
> > > > > > > The main reason DP AUX got exposed to userspace in the first =
place was for
> > > > > > > usecases like fwupd,
> > > > > >
> > > > > > My memory says the original reason was debugging. Or at least I=
 had
> > > > > > no idea fwupd had started to use this until I saw some weird lo=
oking
> > > > > > DPCD addresses in some debug log.
> > > > > >
> > > > > > But I suppose it's possible there were already plans for firmwa=
re
> > > > > > updates and whatnot and it just wasn't being discussed when thi=
s was
> > > > > > being developed.
> > > > >
> > > > > If it's just for debugging, I'd argue that leaving it as-is shoul=
d be
> > > > > fine. Someone poking around with their system can find a way to m=
ake
> > > > > sure that the panel stays on.
> > > >
> > > > That could require altering the state of the system quite a bit, wh=
ich
> > > > may defeat the purpose.
> > >
> > > It does? In my experience you just need to make sure that the panel i=
s
> > > turned on. ...or are you saying that you'd use this for debugging a
> > > case where the system isn't probing properly?
> > >
> > > If things are truly in bad shape, at least on boards using device tre=
e
> > > it's easy to tweak the device tree to force a regulator to stay on. I
> > > suppose we could also add a "debugfs" entry for the panel that also
> > > forces it to be powered on.
> > >
> > >
> > > >  At least I would not be willing to accept such
> > > > a limitation.
> > >
> > > Hmm, so where does that leave us? Are you against landing this patch?
> > > I've done a lot of cleanups recently and I just don't think I have th=
e
> > > time to rework all the AUX transfer functions and figure out how to
> > > power the panel. It also seems like a lot of added complexity for a
> > > debug path.
> >
> > If my 2c counts, I support landing this patch. It clearly documents
> > current behaviour and expectations.
> >
> > If that helps,
> > Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >
> > As for the /dev/aux, question, I think we can make the following plan w=
ork:
> > - Document that eDP panel power up can be handled by using the
> > pm_runtime API (which is the case for both panel-edp and atna33xc20)).
> > I think this is a sensible requirement anyway. And both panels show
> > how to handle different poweron/poweroff timings.
> > - Make drm_dp_aux_dev_get_by_minor() pm_runtime_get() the attached pane=
l.
>
> This matches what you suggested previously, but I still think it has a
> potential problem as I talked about in the my previous (very long)
> reply [1]. The relevant part was:
>
> > Now, despite the fact that the generic eDP panel code doesn't follow
> > the "strict"ness I just described, the _other_ DP panel I worked on
> > recently (samsung-atna33xc20) does. In testing we found that this
> > panel would sometimes (like 1 in 20 times?) crash if you ever stopped
> > outputting data to the display and then started again. You absolutely
> > needed to fully power cycle the display each time. I tried to document
> > this to the best of my ability in atana33xc20_unprepare(). There's
> > also a WARN_ON() in atana33xc20_enable() trying to detect if someone
> > is doing something the panel driver doesn't expect.
>
> Specifically, I think you could get in trouble if you did:
>
> a) drm wants to power down the panel.
>
> b) drm calls the panel's disable() function
>
> c) we start an aux transfer and grab a runtime pm reference
>
> d) drm calls the panel's unprepare() function =3D> atana33xc20_unprepare(=
)
>
> e) atana33xc20_unprepare()'s pm_runtime_put_sync_suspend() _won't_
> power off the panel (we still have the reference from step c), even
> though it needs to.
>
> f) we'll finish an aux transfer and, presumably, call
> pm_runtime_put_autosuspend()
>
> g) drm wants to power the panel back up
>
> h) drm calls the panel's prepare() function, but power wasn't properly cy=
cled

Why? We'd need to extend the prepare() function with the flag
data_was_on, which is set in the enable() and cleared in the suspend
path. If we see this flag in the prepare() callback, we should
forcibly power cycle the panel by toggling the regulator. Yes, this
will cause additional wait.

Another option might be to toggle the autosuspend support. Let the
disable() call pm_runtime_dont_autosuspend() (which would turn all
autosuspend calls into plain pm_runtime_put()) and allow it again in
the resume(). I'm not 100% sure that this will work, but it looks like
it should.

The second option leaves a possible window for the panel issues if the
userspace AUX transfer is ongoing while the panel is being unprepared
and then prepared again. In this case it will never be power cycled.
However after some thought I think this is correct. You wouldn't like
to power cycle a panel while you are e.g. updating the firmware.

>
> This was the whole reason why I wanted to document that the official
> API for powering the panel was via the panel's prepare() function.
>
> [1] https://lore.kernel.org/r/CAD=3DFV=3DUmXzPyVOa-Y0gpY0qcukqW3ge5DBPx6a=
k88ydEqTsBiQ@mail.gmail.com/
>
> -Doug



--=20
With best wishes
Dmitry
