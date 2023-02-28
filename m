Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4406A589A
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 12:53:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 825CA10E689;
	Tue, 28 Feb 2023 11:53:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com
 [IPv6:2607:f8b0:4864:20::92f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF1EE10E4CC
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 11:53:10 +0000 (UTC)
Received: by mail-ua1-x92f.google.com with SMTP id m5so940190uae.11
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 03:53:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P8qIS1ydSfbOdQnqJwzC7/wntuFM3uKa8vMIjXEhUt8=;
 b=Aow2vUOwNV4Fg683b+J5B4upDikvCsd1DyzL79uiRHWxWFBO9hb0bUDBGihOjQSOuD
 6YWz7KZ7x3bTABb5/k+WhvSUC4HRBK2TYQt8jMv1ZksClo59dNDPyAw4x3q3J9rGE2Hk
 MVILtrcApUG0Ed08l8NwN6dH1FIL6Ecoe0FBUm1A1iZ/gYoMuP9usboufN5PVMi4CE7A
 H//Om3y5Y2eiiKNuE/B/2NEIzzJxJFr8KDnavu7qNd44oTM3KgpnL6xsb5XvAHv8k+ZW
 Gd1R+BtcFarS4QqIC+rwXbPT1ruXN6R3rItEy7OoC/775vqwL2KhkVvCXmlfPIE8KzBt
 EE7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P8qIS1ydSfbOdQnqJwzC7/wntuFM3uKa8vMIjXEhUt8=;
 b=MFAs/zpYyPwZHVCG6E+/mTwlTA1l8c9jixto044UNHHDhb5dxD6OECDgmF3lEarM4P
 RpRIe4Zd2N5nIKtVb9pyWTrD0a97oFxei59kqtPeM6Fvw6LMoLeZu/5Bt5p7dBsJNZrr
 GLlKKftu9s4/EvM9i2awqNJp+yK9MFcl6hZFIatPpp8s0spsqkg9tyqUNTMA+2nqGFFU
 8/7574OAbnjnAtC7j7Tr948cZQYkHcmzw0f7QaBCXmiI0lcTSpmKYglu93elC7QvpZjt
 Y2tHMb+N28NapWMI5H6EXfwOqzcb0wvjOyGjej9KbCSYaMDviXwtEMKi5cRlpUsD5vKh
 1kcA==
X-Gm-Message-State: AO0yUKXuoK9EnYksHgyYGwd2WXkMU0IIW7Ty3Huqh0r183poNmAO8wi/
 t57X38UXtvvoEprUwzXwe20ZBbRZtwbcEtgopqlaug==
X-Google-Smtp-Source: AK7set9woaEKg+lit9/Flw/5pCGCjlDuLr+Ptb9m7wJWV6Jy0ndTzYcH0w0Z6RwtYly5hKqEUscnHCnXxt3uSJr3s+U=
X-Received: by 2002:ab0:5b41:0:b0:68a:5c52:7f2b with SMTP id
 v1-20020ab05b41000000b0068a5c527f2bmr1557398uae.1.1677585189984; Tue, 28 Feb
 2023 03:53:09 -0800 (PST)
MIME-Version: 1.0
References: <20230227122108.117279-1-contact@emersion.fr>
 <20230228104642.21dae84c@eldfell>
 <UA_4dHbPqQvjG0TrP7OhP73PFlhdTNg9Mx9GW3MRGX_JskeQHTNaZyKTBj4AmJoSgutHZeQTa08RkRBuFS6xfTPpEm7MrVtJZEaq88ZYg1s=@emersion.fr>
 <20230228121222.4abf13cb@eldfell>
 <CAPY8ntD1ScfbT5C-L1i0D6ZikKn2VtLX8dCdhvKGzSjHvyn=ug@mail.gmail.com>
 <Y/3pX6fAhM6Kb3OR@intel.com>
In-Reply-To: <Y/3pX6fAhM6Kb3OR@intel.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 28 Feb 2023 11:52:54 +0000
Message-ID: <CAPY8ntD8xj9fEJqdOwDZPmfTGwurzwqSS+2=75=eDjTeYQE8uQ@mail.gmail.com>
Subject: Re: [PATCH] drm: document TV margin properties
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
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
Cc: Pekka Paalanen <ppaalanen@gmail.com>,
 =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
 Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 28 Feb 2023 at 11:45, Ville Syrj=C3=A4l=C3=A4
<ville.syrjala@linux.intel.com> wrote:
>
> On Tue, Feb 28, 2023 at 11:37:38AM +0000, Dave Stevenson wrote:
> > Hi Pekka
> >
> > On Tue, 28 Feb 2023 at 10:12, Pekka Paalanen <ppaalanen@gmail.com> wrot=
e:
> > >
> > > On Tue, 28 Feb 2023 09:53:47 +0000
> > > Simon Ser <contact@emersion.fr> wrote:
> > >
> > > > On Tuesday, February 28th, 2023 at 09:46, Pekka Paalanen <ppaalanen=
@gmail.com> wrote:
> > > >
> > > > > can these be negative as well, to achieve overscan and not just
> > > > > underscan? Did I get overscan and underscan right... these are re=
lated
> > > > > to under/overscan, aren't they?
> > > > >
> > > > > Hmm, no, I guess that doesn't make sense, there is no room in the
> > > > > signal to have negative margins, it would result in clipping the
> > > > > framebuffer while scaling up. So this can only be used to scale
> > > > > framebuffer down, add borders, and the TV then scales it back up
> > > > > again?
> > > >
> > > > Correct.
> > > >
> > > > > Looks like neither my Intel nor AMD cards support these, I don't =
see
> > > > > the properties. More things to the list of KMS properties Weston =
needs
> > > > > to explicitly control. Oh, it seems vc4 exclusive for now.
> >
> > I've started a discussion with Simon with regard overscan handling [1].
> > There would be nothing stopping Weston ignoring the DRM properties if
> > Weston/userspace provides a way to reduce the destintation rectangle
> > on the display device. Using that would also be renderer agnostic.
> >
> > [1] https://gitlab.freedesktop.org/wlroots/wlroots/-/issues/3597
> >
> > > > i915 does support it but for TV connectors only (i915/display/intel=
_tv.c).
> > > > gud also supports it.
> > > >
> > > > > Where does this text appear in the HTML kernel docs? I tried to l=
ook at
> > > > > drm_connector.c but I cannot find the spot where this patch appli=
es.
> > > >
> > > > Here:
> > > > https://dri.freedesktop.org/docs/drm/gpu/drm-kms.html#analog-tv-spe=
cific-connector-properties
> > >
> > > Analog TV properties? So this does not apply to e.g. HDMI?
> > >
> > > I believe HDMI TVs do have the problems that margins could mitigate.
> >
> > Correct. Particularly on TVs instead of monitors, it's not uncommon to
> > find the HDMI output gets overscanned.
> >
> > > > > Is this actually a connector property? How does that work, should=
 this
> > > > > not be a CRTC property?
> > > >
> > > > Yeah, it's a connector property for some reason.
> > > >
> > > > > Is this instead not scaling anything but simply sending metadata
> > > > > through the connector?
> > > >
> > > > No metadata is sent. This is purely equivalent to setting up CRTC_*
> > > > properties to scale the planes.
> > >
> > > Oh! That would be really good to mention in the doc. Maybe even prefe=
r
> > > plane props over this? Or is this for analog TV, and plane props for
> > > digital TV?
> > >
> > >
> > > The above are the important comments. All below is just musings you c=
an
> > > ignore if you wish.
> > >
> > > > > Or are there underlying requirements that this connector property=
 is
> > > > > actually affecting the CRTC, which means that it is fundamentally
> > > > > impossible to use multiple connectors with different values on th=
e same
> > > > > CRTC? And drivers will reject any attempt, so there is no need to
> > > > > define what conflicting settings will do?
> > > >
> > > > I don't think any driver above supports cloning CRTCs for these
> > > > connector types. i915 sets clonable =3D false for these connectors.
> > > > vc4 picks the first connector's TV margins, always.
> > >
> > > Sounds like i915 does it right, and vc4 does not, assuming vc4 does n=
ot
> > > prevent cloning.
> >
> > The cloneable flag is in struct intel_encoder, not core.
>
> It gets converted into the core thing by intel_encoder_possible_clones().

Thanks Ville.
vc4 never adds additional possible_clones, therefore I believe it is
still doing the right thing.

  Dave
