Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99647830232
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 10:23:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 228B610E64E;
	Wed, 17 Jan 2024 09:22:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
 [209.85.167.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACFBF10E646;
 Wed, 17 Jan 2024 09:22:55 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id
 2adb3069b0e04-50eabbc3dccso12622600e87.2; 
 Wed, 17 Jan 2024 01:22:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705483314; x=1706088114; darn=lists.freedesktop.org;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=zRavkJT8UB3W/PeIVELlFv5gmSCcs2Exh6iemXWqtts=;
 b=aA/UPXzqyxQ5RrWQMhIjZSvVE+jY9+X+uWbkNNvoAyzpVVdNzxV5E3Aic5xDU9dUNt
 9zjYhF6PmQtAzlRXsFg0SmNVQy4tZcbcxVihUggm1U7BSooDLJXXwtA+zFdwA8/RPvUD
 u8h0aY6Ak0Qdnrv1xOUiRQV+2yRwwy7bh0ZLTaeSIXA9eA+qLYNYkMkYhjKq83LMUBKL
 79e8ZOn5gFnNISiIcEVEy3E6zOg6Hk1Vm/PGh3nz4alL/pqwKQXCGyfrEYGet21dVx7g
 pzDbGNhhGvuLlVm7VIgCYK49q74yjyREVwji0lj4BAYCq9vmaHk/qALwQT8hWsT/dKMR
 IT6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705483314; x=1706088114;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zRavkJT8UB3W/PeIVELlFv5gmSCcs2Exh6iemXWqtts=;
 b=KYGU+4yfyQZ+QsYoI1sl2AhllsCbFGpL1YwLMKDEcpBIShNxqLY6wG8iSMC9csCEzR
 w/CG+WiVD6XmotFMcgzZiTZwZQPNytVSgYgJB6zy05Y6UriP8nCS7OvUl3F7jHYXntbq
 gQGZD2e0FNXrkML9R87hcTl2WIZmO7KUPb/eGIZSh3pkL7ru0WjHVxDRyGJ9UdCIjGWC
 jJZ6BrbDn0CbB0A+zZgp0GlvY/WpsuF1kKcQfRG1Cxg99BsU6rxUMHWb8vuAPdjemAjw
 Kr4/zu5Pt+/nRFXZPnOksrTolronxIdMGtoyEopcmAUH4WvWVS1jL6Wk0FKfi4zvF/TP
 PMTQ==
X-Gm-Message-State: AOJu0Ywg3vCUwSr9qOHSdLFRsRYXDvmAOu6WqM382Yh7C//skKzFYLfZ
 2b7xIMxq+p39csXFxPBijpQ=
X-Google-Smtp-Source: AGHT+IHr54oi6PcTsg+Js8lZpQuf984VW0RHv/CKCTWOd8DS6raRNtGB2deJAgfr59VUqJ+wezvYRA==
X-Received: by 2002:ac2:43ac:0:b0:50e:4725:eb5b with SMTP id
 t12-20020ac243ac000000b0050e4725eb5bmr2035896lfl.23.1705483313574; 
 Wed, 17 Jan 2024 01:21:53 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 dx5-20020a0565122c0500b0050e6451baf0sm186579lfb.53.2024.01.17.01.21.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jan 2024 01:21:53 -0800 (PST)
Date: Wed, 17 Jan 2024 11:21:50 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Andri Yngvason <andri@yngvason.is>
Subject: Re: [PATCH v2 2/4] drm/uAPI: Add "force color format" drm property
 as setting for userspace
Message-ID: <20240117112150.4399d0bb@eldfell>
In-Reply-To: <CAFNQBQyfWmfu5T7bgZDZFGfyhsxQi7YXmY_wPc9Y+mm5iSspXQ@mail.gmail.com>
References: <20240115160554.720247-1-andri@yngvason.is>
 <20240115160554.720247-3-andri@yngvason.is>
 <20240116114235.GA311990@toolbox>
 <CAFNQBQz3TNj_7BSmFw4CFMNuR4B+1d+y3f058s+rzTuzdYogqA@mail.gmail.com>
 <20240116132918.GB311990@toolbox>
 <CAFNQBQyfWmfu5T7bgZDZFGfyhsxQi7YXmY_wPc9Y+mm5iSspXQ@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/ip8efVltUL2zqq.bM1A74uy";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Sebastian Wick <sebastian.wick@redhat.com>, amd-gfx@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Leo Li <sunpeng.li@amd.com>,
 intel-gfx@lists.freedesktop.org, "Pan, 
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 linux-kernel@vger.kernel.org, Werner Sembach <wse@tuxedocomputers.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/ip8efVltUL2zqq.bM1A74uy
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 16 Jan 2024 14:11:43 +0000
Andri Yngvason <andri@yngvason.is> wrote:

> =C3=BEri., 16. jan. 2024 kl. 13:29 skrifa=C3=B0i Sebastian Wick
> <sebastian.wick@redhat.com>:
> >
> > On Tue, Jan 16, 2024 at 01:13:13PM +0000, Andri Yngvason wrote: =20
> [...]
> > > =C5=9Fri., 16. jan. 2024 kl. 11:42 skrifa=C4=9Fi Sebastian Wick
> > > <sebastian.wick@redhat.com>: =20
> > > >
> > > > On Mon, Jan 15, 2024 at 04:05:52PM +0000, Andri Yngvason wrote: =20
> > > > > From: Werner Sembach <wse@tuxedocomputers.com>
> > > > >
> > > > > Add a new general drm property "force color format" which can be =
used
> > > > > by userspace to tell the graphics driver which color format to us=
e. =20
> > > >
> > > > I don't like the "force" in the name. This just selects the color
> > > > format, let's just call it "color format" then.
> > > > =20
> > >
> > > In previous revisions, this was "preferred color format" and "actual
> > > color format", of which the latter has been dropped. I recommend
> > > reading the discussion for previous revisions. =20
> >
> > Please don't imply that I didn't read the thread I'm answering to.

FYI, I have not read this thread.

> > =20
> > > There are arguments for adding "actual color format" later and if it
> > > is added later, we'd end up with "color format" and "actual color
> > > format", which might be confusing, and it is why I chose to call it
> > > "force color format" because it clearly communicates intent and
> > > disambiguates it from "actual color format". =20
> >
> > There is no such thing as "actual color format" in upstream though.
> > Basing your naming on discarded ideas is not useful. The thing that sets
> > the color space for example is called "Colorspace", not "force
> > colorspace".
> > =20
>=20
> Sure, I'm happy with calling it whatever people want. Maybe we can
> have a vote on it?

It would sound strange to say "force color format" =3D "auto". Just drop
the "force" of it.

If and when we need the feedback counterpart, it could be an immutable
prop called "active color format" where "auto" is not a valid value, or
something in the new "output properties" design Sima has been thinking
of.

> > > [...] =20
> > > > > @@ -1396,6 +1404,15 @@ static const u32 dp_colorspaces =3D
> > > > >   *   drm_connector_attach_max_bpc_property() to create and attac=
h the
> > > > >   *   property to the connector during initialization.
> > > > >   *
> > > > > + * force color format:
> > > > > + *   This property is used by userspace to change the used color=
 format. When
> > > > > + *   used the driver will use the selected format if valid for t=
he hardware, =20
> > > >
> > > > All properties are always "used", they just can have different valu=
es.
> > > > You probably want to talk about the auto mode here. =20
> > >
> > > Maybe we can say something like: If userspace does not set the
> > > property or if it is explicitly set to zero, the driver will select
> > > the appropriate color format based on other constraints. =20
> >
> > The property can be in any state without involvement from user space.
> > Don't talk about setting it, talk about the state it is in:
> >
> >   When the color format is auto, the driver will select a format.
> > =20
>=20
> Ok.
>=20
> > > > =20
> > > > > + *   sink, and current resolution and refresh rate combination. =
Drivers to =20
> > > >
> > > > If valid? So when a value is not actually supported user space can =
still
> > > > set it? What happens then? How should user space figure out if the
> > > > driver and the sink support the format? =20
> > >
> > > The kernel does not expose this property unless it's implemented in t=
he driver. =20
> >
> > If the driver simply doesn't support *one format*, the enum value for
> > that format should not be exposed, period. This isn't about the property
> > on its own. =20
>=20
> Right, understood. You mean that enum should only contain values that
> are supported by the driver.

Yes. When a driver installs a property, it can choose which of the enum
entries are exposed. That cannot be changed later though, so the list
cannot live by the currently connected sink, only by what the driver
and display controlled could ever do.

> > > This was originally "preferred color format". Perhaps the
> > > documentation should better reflect that it is now a mandatory
> > > constraint which fails the modeset if not satisfied. =20
> >
> > That would definitely help.
> > =20
> > > >
> > > > For the Colorspace prop, the kernel just exposes all formats it sup=
ports
> > > > (independent of the sink) and then makes it the job of user space to
> > > > figure out if the sink supports it.
> > > >
> > > > The same could be done here. Property value is exposed if the driver
> > > > supports it in general, commits can fail if the driver can't suppor=
t it
> > > > for a specific commit because e.g. the resolution or refresh rate. =
User
> > > > space must look at the EDID/DisplayID/mode to figure out the suppor=
ted
> > > > format for the sink. =20
> > >
> > > Yes, we can make it possible for userspace to discover which modes are
> > > supported by the monitor, but there are other constraints that need to
> > > be satisfied. This was discussed in the previous revision. =20
> >
> > I mean, yes, that's what I said. User space would then only be
> > responsible for checking the sink capabilities and the atomic check
> > would take into account other (non-sink) constraints. =20
>=20
> Since we need to probe using TEST_ONLY anyway, we'll end up with two
> mechanisms to do the same thing where one of them depends on the other
> for completeness.

What do you mean by "same thing"?

Neither HDMI nor DisplayPort have a feedback message saying your
infoframe contents are unacceptable, that I know of. Even if there was,
it would come too late for failing the atomic commit ioctl in
non-blocking mode.

In general, display signalling is that you send whatever to the sink,
and hope for the best.

EDID is used to describe what the sink can accept, so in theory the
kernel could parse EDID for all of these details and reject atomic
commits that attempt unsupported configurations. However, EDID are also
notoriously buggy. They are good for a best guess, but I believe it is
useful to be able to try "unsupported" things. IIRC, PS VR2
intentionally lies for instance.

Even if the kernel did reject everything based on EDID, the only way
today for userspace to know what should work is to parse the EDID
itself. TEST_ONLY trials lead to a combinatorial explosion too easily.
So userspace is already expected to parse EDID, with the major
exception being video mode lists that are explicitly provided by the
kernel in UAPI.

EDID and DisplayID standards also evolve. The kernel could be behind
userspace in chasing them, which was the reason why the kernel does not
validate HDR_OUTPUT_METADATA against EDID.

The design of today with HDR_OUTPUT_METADATA and whatnot is
that userspace is responsible for checking sink capabilities, and
atomic check is responsible for driver and display controller
capabilities.

> > > In any case, these things can be added later and need not be a part of
> > > this change set. =20
> >
> > No, this is the contract between the kernel and user space and has to be
> > figured out before we can merge new uAPI.

Indeed.


Thanks,
pq

--Sig_/ip8efVltUL2zqq.bM1A74uy
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmWnnC4ACgkQI1/ltBGq
qqdB5BAAh7LaxgteKSguZoNt+nqr7i6lhRLwQZDZmshd7HexrDNff0gzhdzgXMak
Ca3dWNi66ButZluKmUiNtViO68DIxT1vZm3Eg1oLM/JumVUgEnd6Yd2mwBJnmdEi
YsGz9FoJf6F72dqtFKoN9hgBeOR4xaN5RG0l6rpFEj2thYtNPgoFzz3AU6tNVCJ3
s5FqG9i0nYrU/JihyeG33xCeTS9QyZLo7anpUVSyvwo3QSP1FRcuhzw0xH4qo68d
NS0f21m8jCYtICx7h/4e3h9eBzlZYjuoUE/zG6ZSXM3NLdVsxtpAIsGNMABygCHw
7Qlp8xV112YN+iSFlWm7Y09LALY/BQNHe3SKuG7dKGVj2nSlo/+JKbHNbpuUCWjb
bowhelndO1DIlEsqpinzCYwvCbT04QU4/5sfjQixTRme6M/L7qtVIvussxprjCSg
guk62+q8Nn2VNI7S7cNvAYWEqO4CzEKenkW3A65pQrFu+sWT4GfEUy1Sc07ejZ/6
73ewFy0xDY/s30zSA4OuGqVaMhNrOig6BVk0iw6pgUfF00juH0iv8kscpzqvUIVO
ezEMrgRYPQ5U+FfF/LORoQUg0Rdp7FYhs/6+hpURe3Kb55LD9y39z9FvIpCfX0FL
Unvy0HzUHzUx6NmYGtbx9auDBrgXQw9H42z/fZneQIsHqX5xTjw=
=Vvyc
-----END PGP SIGNATURE-----

--Sig_/ip8efVltUL2zqq.bM1A74uy--
