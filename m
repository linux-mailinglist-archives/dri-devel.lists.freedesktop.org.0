Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1175351C7
	for <lists+dri-devel@lfdr.de>; Thu, 26 May 2022 18:01:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1252E10E043;
	Thu, 26 May 2022 16:01:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1849710E043
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 16:01:20 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id y13so3895450eje.2
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 09:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=muVoFK53cly8UGkO/IVCCGOOWf4SlvW8Ah8wz/JuMYA=;
 b=AxVXi03p5UNt0Fr/8FDLRPX5zQexwuRutI6hUxd4KJvSUBo+WTG0kvpmKKylKzPIqu
 1lWSrumYqzhq0Cvn7on/Uq/4WfbWeYVdE7dtbnD8vjC/Wi9w3PVjCHwFmAPpsJsqZJqp
 jcyV/+yVBLz9Ii3IVSUC8uEj79X4+PYhrVtbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=muVoFK53cly8UGkO/IVCCGOOWf4SlvW8Ah8wz/JuMYA=;
 b=38A1mtxBylLehamCLUSs8+eQY3aPMPWXuaFFUQyFJwK5tV4MmJEAMHWhrBtwUmuEfs
 rSdXFo3tj2lV1waLH670tOzPMwyO+1gy03dclK+fZm+v0K3X/vUHaNEGz8rVNYW34pLj
 Vd+4Saw1b4LureBr0nwpE/EOXUX+Hy/X8RapEATCHoqNQRFGb1V8pgOxjQ57i66Svfd+
 VKgIp1gtC0AqIcj+hLkvp01KkPLLL1GmK9tHqzAi/Ke89RCVej5O+TszQcX3jkTVlYov
 Et2bJsccjEvBDgmtur5RkX8aXrXMZfDqaKlIoLLXFKF37ZONWgSyjSQpiaAlcjmxlYaw
 2p3A==
X-Gm-Message-State: AOAM532ENe+vV08CINTjp9oqQJY6q9aZKjGCoKYm4qdsg9ZIsFCtSv0C
 KJKXj+Kczzl8642Di1Bv+y3uX+G/TVbjXV4rJSA=
X-Google-Smtp-Source: ABdhPJwftd4HggFAhXpSne1h5moRMiEfpRzupVM7qB9DlINJJwjUb36ltRjSEimHE7CR9Uu8Dwpt6w==
X-Received: by 2002:a17:907:7256:b0:6ff:2ed0:95d with SMTP id
 ds22-20020a170907725600b006ff2ed0095dmr1302094ejc.452.1653580877904; 
 Thu, 26 May 2022 09:01:17 -0700 (PDT)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com.
 [209.85.221.53]) by smtp.gmail.com with ESMTPSA id
 t21-20020a508d55000000b0042ab0693c45sm949345edt.29.2022.05.26.09.01.16
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 May 2022 09:01:16 -0700 (PDT)
Received: by mail-wr1-f53.google.com with SMTP id u3so2703495wrg.3
 for <dri-devel@lists.freedesktop.org>; Thu, 26 May 2022 09:01:16 -0700 (PDT)
X-Received: by 2002:a5d:5085:0:b0:20d:5f6:63fa with SMTP id
 a5-20020a5d5085000000b0020d05f663famr31419542wrt.679.1653580875415; Thu, 26
 May 2022 09:01:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220513130533.v3.1.I31ec454f8d4ffce51a7708a8092f8a6f9c929092@changeid>
 <5857c510-9783-a483-8414-65d7350618d6@suse.de>
 <CAD=FV=X99EWmRk82ako7cL7BWPEsTG=L7VVBVDFX5qKc1MifSA@mail.gmail.com>
 <CAD=FV=U3Wywjev9tEhkL_zE1cV5NwEknH2YwHqyhd5TQtiJ=AQ@mail.gmail.com>
 <Yo4ufWm5WiXsnRX8@phenom.ffwll.local>
 <CAOw6vbLu7TzTppUYv1cynMvn+ykTuGiYBCNhN7FO2kYqZj4DUg@mail.gmail.com>
 <CAKMK7uHTkQjQ5=HOb0MtXD4JZRj3Szt5vm9gQZ6BixZ8LtUpxQ@mail.gmail.com>
In-Reply-To: <CAKMK7uHTkQjQ5=HOb0MtXD4JZRj3Szt5vm9gQZ6BixZ8LtUpxQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 26 May 2022 09:01:03 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WgRjW2yFKvRkcKoj-nGEAhku6_d3kgs9WhTC6bVrzxeQ@mail.gmail.com>
Message-ID: <CAD=FV=WgRjW2yFKvRkcKoj-nGEAhku6_d3kgs9WhTC6bVrzxeQ@mail.gmail.com>
Subject: Re: [PATCH v3] drm/probe-helper: Make 640x480 first if no EDID
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 LKML <linux-kernel@vger.kernel.org>, Sean Paul <seanpaul@google.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 Sean Paul <seanpaul@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, May 26, 2022 at 8:42 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Thu, 26 May 2022 at 03:28, Sean Paul <seanpaul@chromium.org> wrote:
> >
> > On Wed, May 25, 2022 at 9:26 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > On Mon, May 23, 2022 at 05:59:02PM -0700, Doug Anderson wrote:
> > > > Hi,
> > > >
> > > > On Fri, May 20, 2022 at 5:01 PM Doug Anderson <dianders@chromium.or=
g> wrote:
> > > > >
> > > > > Hi,
> > > > >
> > > > > On Mon, May 16, 2022 at 3:28 AM Thomas Zimmermann <tzimmermann@su=
se.de> wrote:
> > > > > >
> > > > > > Hi Douglas,
> > > > > >
> > > > > > I understand that you're trying to tell userspace that the mode=
list has
> > > > > > been made up, but it's not something that should be done via fr=
agile
> > > > > > heuristics IMHO.
> > > > > >
> > > > > > I looked at the Chromium source code that you linked, but I can=
not say
> > > > > > whether it's doing the correct thing. It all depends on what yo=
ur
> > > > > > program needs.
> > > > > >
> > > > > > In that function, you could also search for 'DRM_MODE_TYPE_USER=
DEF'.
> > > > > > It's the mode that the user specified on the kernel command lin=
e. If
> > > > > > Chromium's automatic mode selection fails, you'd give your user=
s direct
> > > > > > control over it.
> > > > >
> > > > > That doesn't really work for Chrome OS. Certainly a kernel hacker
> > > > > could do this, but it's not something I could imagine us exposing=
 to
> > > > > an average user of a Chromebook.
> > > > >
> > > > >
> > > > > > When there's no flagged mode or if
> > > > > > /sys/class/drm/card<...>/status contains "unconnected", you can=
 assume
> > > > > > that the modelist is artificial and try the modes in an appropr=
iate order.
> > > > >
> > > > > So "no flagged" means that nothing is marked as preferred, correc=
t?
> > > > >
> > > > > ...so I guess what you're suggesting is that the order that the k=
ernel
> > > > > is presenting the modes to userspace is not ABI. If there are no
> > > > > preferred modes then userspace shouldn't necessarily assume that =
the
> > > > > first mode returned is the best mode. Instead it should assume th=
at if
> > > > > there is no preferred mode then the mode list is made up and it s=
hould
> > > > > make its own decisions about the best mode to start with. If this=
 is
> > > > > the ABI from the kernel then plausibly I could convince people to
> > > > > change userspace to pick 640x480 first in this case.
> > > > >
> > > > > > If we really want the kernel to give additional guarantees, we =
should
> > > > > > have a broader discussion about this topic IMHO.
> > > > >
> > > > > Sure. I've added St=C3=A9phane Marchesin to this thread in case h=
e wants to
> > > > > chime in about anything.
> > > > >
> > > > > Overall, my take on the matter:
> > > > >
> > > > > * Mostly I got involved because, apparently, a DP compliance test=
 was
> > > > > failing. The compliance test was upset that when it presented us =
with
> > > > > no EDID that we didn't default to 640x480. There was a push to ma=
ke a
> > > > > fix for this in the Qualcomm specific driver but that didn't sit =
right
> > > > > with me.
> > > > >
> > > > > * On all devices I'm currently working with (laptops), the DP is =
a
> > > > > secondary display. If a user was trying to plug in a display with=
 a
> > > > > bad EDID and the max mode (1024x768) didn't work, they could just=
 use
> > > > > the primary display to choose a different resolution. It seems
> > > > > unlikely a user would truly be upset and would probably be happy =
they
> > > > > could get their broken display to work at all. Even if this is a
> > > > > primary display, I believe there are documented key combos to cha=
nge
> > > > > the resolution of the primary display even if you can't see anyth=
ing.
> > > > >
> > > > > * That all being said, defaulting to 640x480 when there's no EDID=
 made
> > > > > sense to me, especially since it's actually defined in the DP spe=
c. So
> > > > > I'm trying to do the right thing and solve this corner case. That
> > > > > being said, if it's truly controversial I can just drop it.
> > > > >
> > > > >
> > > > > So I guess my plan will be to give St=C3=A9phane a little while i=
n case he
> > > > > wants to chime in. If not then I guess I'll try a Chrome patch...
> > > > > ...and if that doesn't work, I'll just drop it.
> > > >
> > > > OK, this userspace code seems to work:
> > > >
> > > > https://crrev.com/c/3662501 - ozone/drm: Try 640x480 before picking
> > > > the first mode if no EDID
> > > >
> > > > ...so we'll see how review of that goes. :-)
> >
> > Mirroring some of my comments on that review here :-)
> >
> > IMO, this should be addressed in the kernel, or not at all. The kernel
> > ensures other aspects of DisplayPort implementation are compliant, so
> > I don't think this would be any exception. Further, the kernel is the
> > one creating the "safe" mode list, so it seems odd that userspace
> > would override that. Finally, relying on every userspace to do the
> > right thing is asking for trouble (we have 3 places which would need
> > this logic in CrOS).
>
> Oh I missed the part that this is defined in the DP spec as _the_ fallbac=
k mode.
>
> I think the probe helpers could check whether it's a DP connector and
> then dtrt per DP spec? I think that should have a solid chance of
> avoiding the regression mess, since the really shoddy stuff tends to
> be VGA/HDMI.

I'm fine with making this DP-specific if that's what people think is best.


> Also if DP says only 640x480 should be the fallback if there's no
> other mode list source, then I think we should trim it down to only
> that. But also only for DP.

So the DP spec says that 640x480 is _the_ default fallback, but it
also says that we're also allowed to have some implementation-specific
fall-back modes as well, so I'd rather not fully trim the list and
just make it clear (somehow) that 640x480 ought to be the default.
Would you be OK going back to v2 of this patch [1] but adding a check
that the connector type is DP and also making sure that the spec is
referenced?


> Also ofc that patch should reference the right DP spec sections :-)

My original patch description for this patch (v3) did reference
section 4.2.2.6 (EDID Corruption Detection) of the DP 1.4a Link CTS.
...or did you want this in inline comments in the patch itself?


[1] https://lore.kernel.org/r/20220510135101.v2.1.I31ec454f8d4ffce51a7708a8=
092f8a6f9c929092@changeid
