Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DFB7D971F
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 14:01:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F37AC10E981;
	Fri, 27 Oct 2023 12:01:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F45010E980;
 Fri, 27 Oct 2023 12:01:18 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2c5720a321aso26387221fa.1; 
 Fri, 27 Oct 2023 05:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698408077; x=1699012877; darn=lists.freedesktop.org;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=Z7vMndX83Gr3k0OCwC8Ax9DA5eeWz4Cl6qUwV1M5lwA=;
 b=hQ94dbV0odRkXk3YZgYRaw1hxlrNZKJ6IFdboJePqmXT2TbhynBYZQu8tWbB2eZ+7g
 Vfhqv1/qwJIDplNgZN6iOXrYf7c9fE+Us9q22q/cLiQKblXsQmSekCciEGpOgPJL1pl7
 37N2VHz7AF6yuwcDgXJunWTSdZbTlgkDzPLXlzHLQiyO8JnQC3d++CJFPslcwaKSNmBN
 l+GvZzqK9vDLACljU70NGJvjg/RG1pXoE7vcninG8+zAVXWA+2G25mBAJ7UG2tRZfey8
 yB4rRit4WIBLkZRy+tvDEnbSMq6PhbK/3LVNmbe9mVzQSTJUiKkH0N2e/pmSNpw3HZB/
 olVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698408077; x=1699012877;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z7vMndX83Gr3k0OCwC8Ax9DA5eeWz4Cl6qUwV1M5lwA=;
 b=bwTvTjBIfLaUCW0CyRIonN/SyCEYD7FTTmKtYw+pK8JOPJgGfewRn+dTTsSkTzWSnL
 9OlThMjjym+a8Hs7c4FsvsefETum2Y5yqqg48eBo7KCnIiRDnMDevOCGf6phzNbvEJ7T
 jXkhfR6zbI056kAWXCVdIITqZLnGzMXZIYwqmZv0or/1e4O5t6t/Qkw7FzkJ2kPCQjWs
 1NIPv0VRARxAH9RTicxBxYEgfqdfIxTquEriim70ZvFHoFIEryDNvMxo9OL1a5xzVnSj
 yJAHFGzqkm5PcTyP8O6o72hOp61eXEB6nfNftdSj7RM+AgzPJ/ZxBSV3tTM4WC+hSt7N
 Qepw==
X-Gm-Message-State: AOJu0YxHa5BUuhPoSCopG7x9VOdyBqsDKEjthL18yEdBN8ePaePiI++U
 yNpxmwnSfxmUqdRDQrG+0Ug=
X-Google-Smtp-Source: AGHT+IHPgVdEymNq+w/M8IQuudzxyCdig3EtTHV5MDlIf3YJaJiDZl0DO2ppjEGvepWSJ44YtUvwLg==
X-Received: by 2002:a2e:9d55:0:b0:2c5:1674:8d79 with SMTP id
 y21-20020a2e9d55000000b002c516748d79mr1979063ljj.21.1698408076301; 
 Fri, 27 Oct 2023 05:01:16 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 r3-20020a2e8e23000000b002b6daa3fa2csm256000ljk.69.2023.10.27.05.01.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Oct 2023 05:01:15 -0700 (PDT)
Date: Fri, 27 Oct 2023 15:01:03 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Sebastian Wick <sebastian.wick@redhat.com>
Subject: Re: [RFC PATCH v2 06/17] drm/doc/rfc: Describe why prescriptive
 color pipeline is needed
Message-ID: <20231027150103.48bf5bdc@eldfell>
In-Reply-To: <20231027100132.GA435169@toolbox>
References: <20231019212133.245155-7-harry.wentland@amd.com>
 <20231020142256.GA859375@toolbox> <20231020175703.09cd2578@eldfell>
 <20f33898-4c40-4854-a1e8-afaef52f6524@amd.com>
 <20231023111219.6e287958@eldfell>
 <bf69b740-dce7-94f1-293d-a4b274b52f55@nvidia.com>
 <20231026115747.44cbddad@eldfell> <20231026173003.GA319477@toolbox>
 <1255ad3-e22b-063-ffb8-18ea852f054@nvidia.com>
 <34be9d0b-18d7-7568-cf30-b3b1b9f77045@mailbox.org>
 <20231027100132.GA435169@toolbox>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/qzJf.QSdSkd9ESB+pK6tMsk";
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
Cc: Sasha McIntosh <sashamcintosh@google.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Michel =?UTF-8?B?RMOkbnplcg==?= <michel.daenzer@mailbox.org>,
 Xaver Hugl <xaver.hugl@gmail.com>, Shashank Sharma <shashank.sharma@amd.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>, Victoria Brekenfeld <victoria@system76.com>,
 dri-devel@lists.freedesktop.org, Christopher Braga <quic_cbraga@quicinc.com>,
 Melissa Wen <mwen@igalia.com>, Jonas =?UTF-8?B?w4VkYWhs?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>, Joshua Ashton <joshua@froggi.es>,
 Aleix Pol <aleixpol@kde.org>, Hector Martin <marcan@marcan.st>,
 wayland-devel@lists.freedesktop.org, Arthur Grillo <arthurgrillo@riseup.net>,
 Naseer Ahmed <quic_naseer@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/qzJf.QSdSkd9ESB+pK6tMsk
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 27 Oct 2023 12:01:32 +0200
Sebastian Wick <sebastian.wick@redhat.com> wrote:

> On Fri, Oct 27, 2023 at 10:59:25AM +0200, Michel D=C3=A4nzer wrote:
> > On 10/26/23 21:25, Alex Goins wrote: =20
> > > On Thu, 26 Oct 2023, Sebastian Wick wrote: =20
> > >> On Thu, Oct 26, 2023 at 11:57:47AM +0300, Pekka Paalanen wrote: =20
> > >>> On Wed, 25 Oct 2023 15:16:08 -0500 (CDT)
> > >>> Alex Goins <agoins@nvidia.com> wrote:
> > >>> =20
> > >>>> Despite being programmable, the LUTs are updated in a manner that =
is less
> > >>>> efficient as compared to e.g. the non-static "degamma" LUT. Would =
it be helpful
> > >>>> if there was some way to tag operations according to their perform=
ance,
> > >>>> for example so that clients can prefer a high performance one when=
 they
> > >>>> intend to do an animated transition? I recall from the XDC HDR wor=
kshop
> > >>>> that this is also an issue with AMD's 3DLUT, where updates can be =
too
> > >>>> slow to animate. =20
> > >>>
> > >>> I can certainly see such information being useful, but then we need=
 to
> > >>> somehow quantize the performance. =20
> > >=20
> > > Right, which wouldn't even necessarily be universal, could depend on =
the given
> > > host, GPU, etc. It could just be a relative performance indication, t=
o give an
> > > order of preference. That wouldn't tell you if it can or can't be ani=
mated, but
> > > when choosing between two LUTs to animate you could prefer the higher
> > > performance one.
> > >  =20
> > >>>
> > >>> What I was left puzzled about after the XDC workshop is that is it
> > >>> possible to pre-load configurations in the background (slow), and t=
hen
> > >>> quickly switch between them? Hardware-wise I mean. =20
> > >=20
> > > This works fine for our "fast" LUTs, you just point them to a surface=
 in video
> > > memory and they flip to it. You could keep multiple surfaces around a=
nd flip
> > > between them without having to reprogram them in software. We can eas=
ily do that
> > > with enumerated curves, populating them when the driver initializes i=
nstead of
> > > waiting for the client to request them. You can even point multiple h=
ardware
> > > LUTs to the same video memory surface, if they need the same curve.
> > >  =20
> > >>
> > >> We could define that pipelines with a lower ID are to be preferred o=
ver
> > >> higher IDs. =20
> > >=20
> > > Sure, but this isn't just an issue with a pipeline as a whole, but the
> > > individual elements within it and how to use them in a given context.
> > >  =20
> > >>
> > >> The issue is that if programming a pipeline becomes too slow to be
> > >> useful it probably should just not be made available to user space. =
=20
> > >=20
> > > It's not that programming the pipeline is overall too slow. The LUTs =
we have
> > > that are relatively slow to program are meant to be set infrequently,=
 or even
> > > just once, to allow the scaler and tone mapping operator to operate i=
n fixed
> > > point PQ space. You might still want the tone mapper, so you would ch=
oose a
> > > pipeline that includes them, but when it comes to e.g. animating a ni=
ght light,
> > > you would want to choose a different LUT for that purpose.
> > >  =20
> > >>
> > >> The prepare-commit idea for blob properties would help to make the
> > >> pipelines usable again, but until then it's probably a good idea to =
just
> > >> not expose those pipelines. =20
> > >=20
> > > The prepare-commit idea actually wouldn't work for these LUTs, becaus=
e they are
> > > programmed using methods instead of pointing them to a surface. I'm a=
ctually not
> > > sure how slow it actually is, would need to benchmark it. I think not=
 exposing
> > > them at all would be overkill, since it would mean you can't use the =
preblending
> > > scaler or tonemapper, and animation isn't necessary for that.
> > >=20
> > > The AMD 3DLUT is another example of a LUT that is slow to update, and=
 it would
> > > obviously be a major loss if that wasn't exposed. There just needs to=
 be some
> > > way for clients to know if they are going to kill performance by tryi=
ng to
> > > change it every frame. =20
> >=20
> > Might a first step be to require the ALLOW_MODESET flag to be set when =
changing the values for a colorop which is too slow to be updated per refre=
sh cycle?
> >=20
> > This would tell the compositor: You can use this colorop, but you can't=
 change its values on the fly. =20
>=20
> I argued before that changing any color op to passthrough should never
> require ALLOW_MODESET and while this is really hard to guarantee from a
> driver perspective I still believe that it's better to not expose any
> feature requiring ALLOW_MODESET or taking too long to program to be
> useful for per-frame changes.
>=20
> When user space has ways to figure out if going back to a specific state
> (in this case setting everything to bypass) without ALLOW_MODESET we can
> revisit this decision, but until then, let's keep things simple and only
> expose things that work reliably without ALLOW_MODESET and fast enough
> to work for per-frame changes.
>=20
> Harry, Pekka: Should we document this? It obviously restricts what can
> be exposed but exposing things that can't be used by user space isn't
> useful.

In an ideal world... but in real world, I don't know.

Would it help if there was a list collected, with all the things in
various hardware that is known to be too heavy to reprogram every
refresh? Maybe that would allow a more educated decision?

I bet that depends also on the refresh rate.

I would probably be fine with some sort of update cost classification
on colorops, and the kernel keeping track of blobs: if userspace sets
the same blob on the same colorop that is already there (by blob ID, no
need to compare contents), then it's a no-op change.


Anyway, I really like reading Alex Goins' reply, it seems we are very
much on the same page here. :-)


Thanks,
pq

--Sig_/qzJf.QSdSkd9ESB+pK6tMsk
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmU7pn8ACgkQI1/ltBGq
qqeXIhAAiHaMN9pDkSrfBcXkPlbzHCXbbjBrBMvYrVyB+OnY6X90Rwag5DjXKXYD
vY7ES0Kwke2jHlE15z41V2DrQ0dFopQLMpdSdPc+YAPmKR4jaYFdkl+pr8v96E5L
qSpLQztbmoUjn32+cISuFSxQ+2ecawrHOSywAcY7ZeWdBWzrY0bvpGyvVDVyzrd+
ynbRa3KPHonA2MPXEdlNBxbdnTJ5Cd2Lfgxjxa5yXC29H6xu8fYCnekMlnwloetj
ojoUYvC7B+4Mr/f47eNeJgeSX6w8+/73zRYOciY5xeYo6erVZmhf9i5L6mGHhODu
n3QarYTEvki3tranIMkEuqNL588h1zp99SQcvRM9+LLNtnmAmiFYxPEaT29jQkDj
PHO9Z625tXBALdP8mw1EBAgLO786d45fHarHCxSB+fZuY8ENZ238Ndeiln6Qgqaj
XQse5PlZ1iRnXagF+cnMe5U0JICaHVfsvmk99EriwLav7IrM6cOEpwmWoJdlVts0
eMH3J96fCMJoQEY52oBDyDsUw/u4rpoA4yvsfXt45hSJjs+7vCxaYOFyf/cS1Tgk
WpRQDuOgyUDqIGlQKkWSzkZ1ty5e0A/WT8iiIM9h9LbSFcQR/1//aFWuv0U70AM1
c2SI+bLx7YBDSKtT56yexiCPhzZNFG2rpOOEOIIDmgz+LeiDJYI=
=zC2z
-----END PGP SIGNATURE-----

--Sig_/qzJf.QSdSkd9ESB+pK6tMsk--
