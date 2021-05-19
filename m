Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C553889E4
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 10:53:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB1336ECEF;
	Wed, 19 May 2021 08:53:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62EBA6ECE9;
 Wed, 19 May 2021 08:53:42 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id r5so17903740lfr.5;
 Wed, 19 May 2021 01:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version; bh=UEcEyDKGWc5BqkdIaL+KY18rDaFnEJEqEe+FVsf32e4=;
 b=pm/UKKRV9gwmB0Uu5gCiTQpFvJcZacaRAVe6USMnJD+vZf8FioX9Qm4ahmhiGvwZfm
 czyYuk+XzzzcvLwboCPNjltLmCK2rE7QFppt36mvZ/rerY0+4f/JZdnb8Bm8/ksrEoOK
 eSLJJRakrkbzJoA0q1bzvjtFX7JF6gMj4lEtBLg7zkm4S6isg1CfajfiHeQLcQwhzYIV
 an8JVbPE1xVstS20QK5TnPaJAsWaSI3LL0MzG1JkRovPmbtG65FWqWlXvhNZyq3CoDxH
 +IY/E7Min6W/pn8AbR37r3JtMj6UJ0lnPtKnSetmyCsYo+RAI5gA60guiV3jcglkiLaa
 yayQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=UEcEyDKGWc5BqkdIaL+KY18rDaFnEJEqEe+FVsf32e4=;
 b=XYUCgywAch3vsNCEWlHW8tB6bv2astfHgeQnAQT6nnX0QTQdoi43hDeVVe88A9KTuV
 /RLnEOTHajy9c7+sM3Xt/c8Lg1A70MujOYXWMKU7mlPTHdTouTkTv2QZm9d2/mOErhMx
 ErkqCYwU1hCLKxDUSZ7vtcpeMXBp+iVE+NLKeVImeJ/M8RPEzqCQ9x4NK5x22RwQOqWb
 RVaLR24c9oGqTkDPdfj2cvuvEY/blgBYfmhXIkHHYkh45+JHJSAa4GuIkxudd/i/Q7Fc
 PuekXFFSzCI2ihzw9cf1B5UzSyQOrPzXeY3Td5AKBTZerqg5zhVLitUUX702dmhuUCzt
 lSZg==
X-Gm-Message-State: AOAM533Lc9DHcvB5KmatY+L9zUVypy1kuNmKpL/xwiGB3mrmzATAlxcU
 ocZnxv5sSojaw4GJbQP9dyE=
X-Google-Smtp-Source: ABdhPJysBcXgR6Z/CIwY+Iwz/ekfBPu1hqkHTuicaAnUGj/RQs5cJ78qD9xNPIqA69DvrReWO0S/PQ==
X-Received: by 2002:a05:6512:3f2a:: with SMTP id
 y42mr7492369lfa.234.1621414420727; 
 Wed, 19 May 2021 01:53:40 -0700 (PDT)
Received: from eldfell ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id o8sm3537006ljp.49.2021.05.19.01.53.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 01:53:40 -0700 (PDT)
Date: Wed, 19 May 2021 11:53:37 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Harry Wentland <harry.wentland@amd.com>
Subject: Re: [RFC PATCH 0/3] A drm_plane API to support HDR planes
Message-ID: <20210519115337.3194fa11@eldfell>
In-Reply-To: <9d4ec9c3-6716-7c80-97d5-dd3c5c50ab51@amd.com>
References: <20210426173852.484368-1-harry.wentland@amd.com>
 <20210427175005.5b92badc@eldfell>
 <e51a3067-a0b3-16e4-5996-bd8527b7536b@amd.com>
 <20210517115726.4fc1c710@eldfell>
 <5f6abaaa45bb7f77110d9f87c9824e3f@sebastianwick.net>
 <b0834be8-9023-0fde-f15d-8c44f72e7702@amd.com>
 <20210518105615.212b84e4@eldfell>
 <9d4ec9c3-6716-7c80-97d5-dd3c5c50ab51@amd.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/GXzH8+oBwyxuqn61yuPy7Uc"; protocol="application/pgp-signature"
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
Cc: Deepak.Sharma@amd.com, amd-gfx@lists.freedesktop.org, mcasas@google.com,
 Shashank.Sharma@amd.com, dri-devel@lists.freedesktop.org, Shirish.S@amd.com,
 Sebastian Wick <sebastian@sebastianwick.net>, Krunoslav.Kovac@amd.com,
 hersenxs.wu@amd.com, Vitaly Prosyak <vitaly.prosyak@amd.com>,
 laurentiu.palcu@oss.nxp.com, Bhawanpreet.Lakha@amd.com,
 Nicholas.Kazlauskas@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/GXzH8+oBwyxuqn61yuPy7Uc
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 18 May 2021 10:19:25 -0400
Harry Wentland <harry.wentland@amd.com> wrote:

> On 2021-05-18 3:56 a.m., Pekka Paalanen wrote:
> > On Mon, 17 May 2021 15:39:03 -0400
> > Vitaly Prosyak <vitaly.prosyak@amd.com> wrote:
> >  =20
> >> On 2021-05-17 12:48 p.m., Sebastian Wick wrote: =20

...

> >>> I suspect that this is not about tone mapping at all. The use cases
> >>> listed always have the display in PQ mode and just assume that no
> >>> content exceeds the PQ limitations. Then you can simply bring all
> >>> content to the color space with a matrix multiplication and then map =
the
> >>> linear light content somewhere into the PQ range. Tone mapping is
> >>> performed in the display only. =20
> >=20
> > The use cases do use the word "desktop" though. Harry, could you expand
> > on this, are you seeking a design that is good for generic desktop
> > compositors too, or one that is more tailored to "embedded" video
> > player systems taking the most advantage of (potentially
> > fixed-function) hardware?
> >  =20
>=20
> The goal is to enable this on a generic desktop, such as generic Wayland
> implementations or ChromeOS. We're not looking for a custom solution for
> some embedded systems, though the solution we end up with should obviously
> not prevent an implementation on embedded video players.

(There is a TL;DR: at the end.)

Echoing a little bit what Sebastian already said, I believe there are
two sides to this again:
- color management in the traditional sense
- modern standardised display technology

It was perhaps too harsh to say that generic Wayland compositors cannot
use enum-based color-related UAPI. Sometimes they could, sometimes it
won't be good enough.

Traditional color management assumes that no two monitors are the same,
even if they are the same make, model, and manufacturing batch, and are
driven exactly the same way. Hence, all monitors may require
calibration (adjusting monitor knobs), and/or they may require
profiling (measuring the light emission with a special hardware device
designed for that). Also the viewing environment has an effect.

For profiling to be at all meaningful, calibration must be fixed. This
means that there must be no dynamic on-the-fly adaptation done in the
monitor, in the display hardware, or in the kernel. That is a tall
order that I guess is going to be less and less achievable, especially
with HDR monitors.

The other side is where the end user trusts the standards, and trusts
that the drivers and the hardware do what they are specified to do.
This is where you can trust that the monitor does the tone-mapping magic
right.

Weston needs to support both approaches, because we want to prove our
new approach to traditional color management, but we also want to
support HDR, and if possible, do both at the same time. Doing both at
the same time is what we think foremost, because it's also the hardest
thing to achieve. If that can be done, then everything else works out
too.

However, this should not exclude the possibility to trust standards and
monitor magic, when the end user wants it.

It's also possible that a monitor simply doesn't support a mode that
would enable fully color managed HDR, so Weston will need to be able to
drive monitors with e.g. BT.2020/PQ data eventually. It's just not the
first goal we have.

This debate is a little bit ironic. The Wayland approach to traditional
color management is that end users should trust the display server to
do the right thing, where before people only trusted the individual
apps using a specific CMS implementation. The display server was the
untrusted one that should just get out of the way and not touch
anything. Now I'm arguing that I don't want to trust monitor magic, who
knows what atrocities it does to my picture! But take the next logical
step, and one would be arguing that end users should trust also
monitors to do the right thing. :-)

The above has two catches:

- Do you actually trust hardware manufacturers and marketers and EDID?
  Monitors have secret sauce you can't inspect nor change.

- You feed a single video stream to a monitor, in a single format,
  encoding and color space. The display server OTOH gets an arbitrary
  number of input video streams in arbitrary formats, encodings, and
  color spaces, and it needs to composite them into one.

Composition is hard. It's not enough to know what kind of signals you
take in and what kind of signal you must output. You also need to know
what the end user wants from the result: the render intent.

Even if we trust the monitor magic to do the right thing in
interpreting and displaying our output signal, we still need to know
what the end user wants from the composition, and we need to control
the composition formula to achieve that.

TL;DR:

I would summarise my comments so far into these:

- Telling the kernel the color spaces and letting it come up with
  whatever color transformation formula from those is not enough,
  because it puts the render intent policy decision in the kernel.

- Telling the kernel what color transformations need to be done is
  good, if it is clearly defined.

- Using an enum-based UAPI to tell the kernel what color
  transformations needs to be done (e.g. which EOTF or EOTF^-1 to apply
  at a step in the abstract pipeline) is very likely ok for many
  Wayland compositors in most cases, but may not be sufficient for all
  use cases. Of course, one is always bound by what hardware can do, so
  not a big deal.

- You may need to define mutually exclusive KMS properties (referring
  to my email in another branch of this email tree).

- I'm not sure I (we?) can meaningfully review things like "SDR boost"
  property until we know ourselves how to composite different types of
  content together. Maybe someone else could.

Does this help or raise thoughts?

The work on Weston CM&HDR right now is aiming to get it up to a point
where we can start nicely testing different compositing approaches and
methods and parameters, and I expect that will also feed back into the
Wayland CM&HDR protocol design as well.


Thanks,
pq

--Sig_/GXzH8+oBwyxuqn61yuPy7Uc
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmCk0hEACgkQI1/ltBGq
qqdcrxAAmyFaG6gyK/MNdGRjSKtgHyPQzJhVRQOUjKfwOD5GIIWm3tr30wF36Kn8
c00/jxQQqm0xrewJikJMgNdsS0WYaTTuMC+M3cxi2gmf3tDBSOCgLP0rrAuI+5he
kPnQTGplsq/dGluJTPC7AWx4HJvlZflyoheHIIhq2Rq0/FZYwRsW4dntZqJWaPlQ
GBoXvFmHmXdpGSvWkK1CRkRwjjlZQ1IjnRP9qTXjNz15c+9vSsqiQaQSVPrLryRA
jrvyPZj8F05D76QGXO+0NAaW0AXsfb6m3rx4tJekSExAanQUOZInjYBi69MY0WSv
gGaI6+3k2e1Qtg3F8aFXbcfYOzoB8qjjbnIdxvSUNCBm71M4EGI2dpMbem4dP8qo
61v4WnZ/0qigDhtxKmF6l9kYAT7oTA1vTKm6TjYVG5s9VRkfLb9yU4KyundaYCIY
Ffk+wLpVHb+ZT5Ut2mgDzYrlt+t8GpOSdpMh3rf0GYQeaAife8nMt0kEiXUCbPdq
zz/dSoT9MpWw2l1e5IYhb0H/nu65r34aiapfx2Z8SZdREQHZt0fSJdbrLUtOD2D0
EdTu6O9eItIt4wFrgSp5wXOUKnQoh1iS2x85aid3HRveYxpKxKO3l63FJvPyxVzo
941VnyYq9Y8v31h3Glkt3PvwpZ7Pu8UV2hOxpOVWhGHgseJJ1Gw=
=ZcZj
-----END PGP SIGNATURE-----

--Sig_/GXzH8+oBwyxuqn61yuPy7Uc--
