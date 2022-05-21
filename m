Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 835AD52F67C
	for <lists+dri-devel@lfdr.de>; Sat, 21 May 2022 02:02:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1968110ECD6;
	Sat, 21 May 2022 00:02:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BA6610EBC4
 for <dri-devel@lists.freedesktop.org>; Sat, 21 May 2022 00:02:07 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id m20so18214044ejj.10
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 17:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5Hxa6+qS9fIPO89ddVWrccYQHlKE1/5D9kW9MMuathA=;
 b=BsLD0XyXQ6aUCt8XdDDdgGJx+e5CnjRgib2MXW3YMcy9F0tjwKE/PR2zGvDsh4ybfo
 BZ2cjEIABtYk0dWKUDXWwvfb7NO9dp99AxzPhlbN55/jlO9oNey5Wi/tZEBV9ufUL3A0
 M2AJvVZ+jvu39U7CUih5oopgEUx5/RTQrULf0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5Hxa6+qS9fIPO89ddVWrccYQHlKE1/5D9kW9MMuathA=;
 b=kRBNfaft6hjxgU9XQZ9ZYG9gvxZsvAiiUbbLis66MEQyxvIHK+oMPSqdlUJfXHVxPR
 siT1ZhIloUT4hvoDIJRQ2ZYB+56KMIi5VxXYucr09U7Ei90X/JD2bx45U2VJrabnVsJV
 OHmPO5d+kCEGKPu8wJBMSzREBo8BJR5csDRZxx6TXm2cdkl4/3woiD/t+cRBVlsLHZmd
 Lc77Gn7T1fZ8Ojnow1mrxL8+XtK5p89dcMbZhm6NSpvJk/Oew5URUcYFGUdzXvq0K1xl
 6C/5jiapkqsImhPtx0EF+i2ntNeUYJADzO8tu/hSBAcxlPK4FiJBVwixg9I+G0PAr8O+
 bZgg==
X-Gm-Message-State: AOAM5329Sok8CDUo1XgJkQ9Sw0zl4pr/qpKqqLTOxPOzFrElJRhf7dDK
 APKzvlB5oW2y7U/17sfIHkopo8HD4ok0D2FjKvA=
X-Google-Smtp-Source: ABdhPJy64VFgYgcwJ8epRqgFw/kA2J2NLg8QbVL//Lu1mnLHMFPw7VhTuYOB4WwW/JJcxls2hfKJEQ==
X-Received: by 2002:a17:906:7954:b0:6f3:c1c8:f814 with SMTP id
 l20-20020a170906795400b006f3c1c8f814mr11191887ejo.230.1653091325225; 
 Fri, 20 May 2022 17:02:05 -0700 (PDT)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com.
 [209.85.221.41]) by smtp.gmail.com with ESMTPSA id
 qx16-20020a170907b59000b006f3ef214e60sm3594303ejc.198.2022.05.20.17.02.02
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 May 2022 17:02:03 -0700 (PDT)
Received: by mail-wr1-f41.google.com with SMTP id r23so13399135wrr.2
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 17:02:02 -0700 (PDT)
X-Received: by 2002:a05:6000:1c03:b0:20e:5cac:1eb5 with SMTP id
 ba3-20020a0560001c0300b0020e5cac1eb5mr10297360wrb.422.1653091321358; Fri, 20
 May 2022 17:02:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220513130533.v3.1.I31ec454f8d4ffce51a7708a8092f8a6f9c929092@changeid>
 <5857c510-9783-a483-8414-65d7350618d6@suse.de>
In-Reply-To: <5857c510-9783-a483-8414-65d7350618d6@suse.de>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 20 May 2022 17:01:49 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X99EWmRk82ako7cL7BWPEsTG=L7VVBVDFX5qKc1MifSA@mail.gmail.com>
Message-ID: <CAD=FV=X99EWmRk82ako7cL7BWPEsTG=L7VVBVDFX5qKc1MifSA@mail.gmail.com>
Subject: Re: [PATCH v3] drm/probe-helper: Make 640x480 first if no EDID
To: Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?St=C3=A9phane_Marchesin?= <marcheu@chromium.org>
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
 LKML <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "Aravind Venkateswaran \(QUIC\)" <quic_aravindh@quicinc.com>,
 Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, May 16, 2022 at 3:28 AM Thomas Zimmermann <tzimmermann@suse.de> wro=
te:
>
> Hi Douglas,
>
> I understand that you're trying to tell userspace that the modelist has
> been made up, but it's not something that should be done via fragile
> heuristics IMHO.
>
> I looked at the Chromium source code that you linked, but I cannot say
> whether it's doing the correct thing. It all depends on what your
> program needs.
>
> In that function, you could also search for 'DRM_MODE_TYPE_USERDEF'.
> It's the mode that the user specified on the kernel command line. If
> Chromium's automatic mode selection fails, you'd give your users direct
> control over it.

That doesn't really work for Chrome OS. Certainly a kernel hacker
could do this, but it's not something I could imagine us exposing to
an average user of a Chromebook.


> When there's no flagged mode or if
> /sys/class/drm/card<...>/status contains "unconnected", you can assume
> that the modelist is artificial and try the modes in an appropriate order=
.

So "no flagged" means that nothing is marked as preferred, correct?

...so I guess what you're suggesting is that the order that the kernel
is presenting the modes to userspace is not ABI. If there are no
preferred modes then userspace shouldn't necessarily assume that the
first mode returned is the best mode. Instead it should assume that if
there is no preferred mode then the mode list is made up and it should
make its own decisions about the best mode to start with. If this is
the ABI from the kernel then plausibly I could convince people to
change userspace to pick 640x480 first in this case.

> If we really want the kernel to give additional guarantees, we should
> have a broader discussion about this topic IMHO.

Sure. I've added St=C3=A9phane Marchesin to this thread in case he wants to
chime in about anything.

Overall, my take on the matter:

* Mostly I got involved because, apparently, a DP compliance test was
failing. The compliance test was upset that when it presented us with
no EDID that we didn't default to 640x480. There was a push to make a
fix for this in the Qualcomm specific driver but that didn't sit right
with me.

* On all devices I'm currently working with (laptops), the DP is a
secondary display. If a user was trying to plug in a display with a
bad EDID and the max mode (1024x768) didn't work, they could just use
the primary display to choose a different resolution. It seems
unlikely a user would truly be upset and would probably be happy they
could get their broken display to work at all. Even if this is a
primary display, I believe there are documented key combos to change
the resolution of the primary display even if you can't see anything.

* That all being said, defaulting to 640x480 when there's no EDID made
sense to me, especially since it's actually defined in the DP spec. So
I'm trying to do the right thing and solve this corner case. That
being said, if it's truly controversial I can just drop it.


So I guess my plan will be to give St=C3=A9phane a little while in case he
wants to chime in. If not then I guess I'll try a Chrome patch...
...and if that doesn't work, I'll just drop it.


> Best regards
> Thomas
>
> [1]
> https://elixir.bootlin.com/linux/v5.17.8/source/drivers/gpu/drm/drm_sysfs=
.c#L196
>
> Am 13.05.22 um 22:06 schrieb Douglas Anderson:
> > If we're unable to read the EDID for a display because it's corrupt /
> > bogus / invalid then we'll add a set of standard modes for the
> > display. Since we have no true information about the connected
> > display, these modes are essentially guesses but better than nothing.
> > None of the modes returned is marked as preferred, but the modes are
> > currently sorted such that the higher resolution modes are listed
> > first.
> >
> > When userspace sees these modes presented by the kernel it needs to
> > figure out which one to pick. At least one userspace, ChromeOS [1]
> > seems to use the rules:
> > 1. Try to pick the first mode marked as preferred.
> > 2. If no modes were marked as preferred then pick the first mode.
> >
> > The rules above seem pretty reasonable, but they have unfortunate side
> > effect that when we have no EDID present we'll default to the highest
> > resolution (least likely to work) mode.
> >
> > Let's change things slightly. In the case of a failed EDID read we
> > still won't mark anything preferred but we _won't_ sort the modes at
> > the end of drm_helper_probe_single_connector_modes(). The
> > drm_add_modes_noedid() adds 640x480 first and so by skipping the call
> > to drm_mode_sort() it will stay first. That will be a hint to
> > userspace to default to 640x480.
> >
> > This change makes userspace that behaves like ChromeOS does compliant
> > with section 4.2.2.6 (EDID Corruption Detection) of the DP 1.4a Link
> > CTS. That section indicates that, at least on DP, if we have a corrupt
> > EDID userspace may allow other modes to be tried but should default to
> > 640x480 in the absence of more information. Note that if
> > drm_add_modes_noedid() ever changes to _not_ list 640x480 first we
> > might need to do more here, but that seems unlikely and, in any case,
> > it would be caught by a future run of DP compliance testing.
> >
> > Note: this change could pave the way to further improvement to
> > drm_helper_probe_single_connector_modes(). Specifically, in the case
> > of no EDID we could add additional "standard" modes that are riskier
> > than 1024x768 (the current max we add). Now that we're giving
> > userspace the hint that it should default to 640x480 perhaps it would
> > be OK to offer the options of the higher resolution modes just in case
> > they work. This further improvement is left as an exercise to the
> > reader.
> >
> > [1] https://source.chromium.org/chromium/chromium/src/+/a051f741d0a15ca=
ff2251301efe081c30e0f4a96:ui/ozone/platform/drm/common/drm_util.cc;l=3D488
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> > Note that this is the second of two related and similar-sounding but
> > different patches. See also ("drm/probe-helper: For DP, add 640x480 if
> > all other modes are bad") [2]. I'm hoping to land _both_ of the
> > patches since they address different issues. This patch addresses the
> > case of a corrupt EDID and having 640x480 be the default in the
> > "guessed" modes. The other patch handles the case where the EDID
> > _isn't_ corrupt but all the modes listed can't be made with the
> > existing situations. The two patches can land in either order.
> >
> > Also note that I didn't carry any Tested-by / Reviewed-by tags since
> > the patch is now quite different (yet again for v2 to v3).
> >
> > [2] https://lore.kernel.org/r/20220510131309.v2.2.I4ac7f55aa446699f8c20=
0a23c10463256f6f439f@changeid
> >
> > Changes in v3:
> > - Don't set preferred, just disable the sort.
> >
> > Changes in v2:
> > - Don't modify drm_add_modes_noedid() 'cause that'll break others
> > - Set 640x480 as preferred in drm_helper_probe_single_connector_modes()
> >
> >   drivers/gpu/drm/drm_probe_helper.c | 14 ++++++++++++--
> >   1 file changed, 12 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_p=
robe_helper.c
> > index 682359512996..21dd60f30cc7 100644
> > --- a/drivers/gpu/drm/drm_probe_helper.c
> > +++ b/drivers/gpu/drm/drm_probe_helper.c
> > @@ -425,6 +425,7 @@ int drm_helper_probe_single_connector_modes(struct =
drm_connector *connector,
> >       bool verbose_prune =3D true;
> >       enum drm_connector_status old_status;
> >       struct drm_modeset_acquire_ctx ctx;
> > +     bool sort_list =3D true;
> >
> >       WARN_ON(!mutex_is_locked(&dev->mode_config.mutex));
> >
> > @@ -516,8 +517,16 @@ int drm_helper_probe_single_connector_modes(struct=
 drm_connector *connector,
> >               count =3D drm_add_override_edid_modes(connector);
> >
> >       if (count =3D=3D 0 && (connector->status =3D=3D connector_status_=
connected ||
> > -                        connector->status =3D=3D connector_status_unkn=
own))
> > +                        connector->status =3D=3D connector_status_unkn=
own)) {
> >               count =3D drm_add_modes_noedid(connector, 1024, 768);
> > +             /*
> > +              * Want lower res modes, like 640x480, first. That indica=
tes
> > +              * to userspace that these are "better" modes. Since we h=
ave
> > +              * no EDID the modes are a guess anyway, so guess the saf=
er
> > +              * mode first.
> > +              */
> > +             sort_list =3D false;
> > +     }
> >       count +=3D drm_helper_probe_add_cmdline_mode(connector);
> >       if (count =3D=3D 0)
> >               goto prune;
> > @@ -576,7 +585,8 @@ int drm_helper_probe_single_connector_modes(struct =
drm_connector *connector,
> >       if (list_empty(&connector->modes))
> >               return 0;
> >
> > -     drm_mode_sort(&connector->modes);
> > +     if (sort_list)
> > +             drm_mode_sort(&connector->modes);
> >
> >       DRM_DEBUG_KMS("[CONNECTOR:%d:%s] probed modes :\n", connector->ba=
se.id,
> >                       connector->name);
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
> (HRB 36809, AG N=C3=BCrnberg)
> Gesch=C3=A4ftsf=C3=BChrer: Ivo Totev
