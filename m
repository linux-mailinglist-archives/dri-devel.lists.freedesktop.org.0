Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E66EA8325E9
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 09:43:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38D9010E987;
	Fri, 19 Jan 2024 08:43:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
 [209.85.167.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD19D10E97A;
 Fri, 19 Jan 2024 08:43:22 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id
 2adb3069b0e04-50e9e5c97e1so614083e87.0; 
 Fri, 19 Jan 2024 00:43:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705653741; x=1706258541; darn=lists.freedesktop.org;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=WdyARQyfSA+ob44wLkAXE/HyCuSai2Kd85wQsKHR8qk=;
 b=FYuFT+d7i+KmH0P0aIbKOHxFAA5n+cYZOCzckwIaGpSlSNeRoYgttIsFzA7sN6qsqG
 cS1tOSaQxz+pdV7TYi6JsTJBF70r3wRgYLQKKHtN855MM9tjPBtzlAmJtS2FiE0J4COE
 Iiv6iTIrist7FOP/cSYWwTD8ys2zIRJ95yk5AuP5Pq2WbAOG4JA7oRFgFGkjyZ2yITgH
 sYv65S/tu05BDB+elHWod8AoXeXUDGs605o01HyALzzg4ZSxek87F4Iqa94SvtCM7Ml8
 YPYjcXSaGlREz0uNwNHRYLn3h8I+iVfjnt9EGI3M4xWTRrkfMjIK2jVBu0R7sfYeFuR+
 hqXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705653741; x=1706258541;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WdyARQyfSA+ob44wLkAXE/HyCuSai2Kd85wQsKHR8qk=;
 b=WBViGkpeS3v7/QmWDxke7YNesEeVXiA0j9+1QCYGsXXy4lHxs2ZGI3aTciFsw3sIYg
 6jCKBgUMLds2fU8wveWIcpmQPD/JxFXDssXU7/EHkCgrRLQYVfj92CzeKXwAbQ6Sgjbq
 ynUUg9pCh4ocIikKNPwkW7kPzF9JzmPCkSdz68z1lMuwGIzTPoTupTO3HkihaVA2PJOE
 M5cd56wnMQxCfwScMIQ/0Z2KMDiZxL1W+Ytaw0ijlE9sOVlJKyqFQ6hDx1Ej1PAuafIC
 3ZYFaKOmcwK2jS31OKFYoc9DEa5a1JdR8Kb9axUHBIKXjSbtwm5XAYmswaUYTnppLtij
 nwcw==
X-Gm-Message-State: AOJu0Yx8BvtoHevjtveDXAl1/Hat6PAgFYVG5zH6xcwqsbcgvvEGPiX7
 p/BUddiLBjQhfkz+LrAcGdFpw+42E5kfOvJdJRzcEFxdVJ7Dz8cn
X-Google-Smtp-Source: AGHT+IFRB1QDRjaGLSo/qI6q8q3krKm76ZOd9NEu2AZfM1fxFho+Ehu7nOfA7or/Kz8LaiVdo68yPw==
X-Received: by 2002:a05:6512:2813:b0:50f:775:eb49 with SMTP id
 cf19-20020a056512281300b0050f0775eb49mr479306lfb.81.1705653740727; 
 Fri, 19 Jan 2024 00:42:20 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 28-20020ac25f5c000000b0050e902ce211sm902594lfz.276.2024.01.19.00.42.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jan 2024 00:42:19 -0800 (PST)
Date: Fri, 19 Jan 2024 10:42:05 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Andri Yngvason <andri@yngvason.is>
Subject: Re: [PATCH v2 2/4] drm/uAPI: Add "force color format" drm property
 as setting for userspace
Message-ID: <20240119104205.7e4ad65d@eldfell>
In-Reply-To: <CAFNQBQwoGvSF1ryOPUUnedYUG64HqFQNXjMf6R7piufN64Vc=g@mail.gmail.com>
References: <20240115160554.720247-1-andri@yngvason.is>
 <20240115160554.720247-3-andri@yngvason.is>
 <20240116114235.GA311990@toolbox>
 <CAFNQBQz3TNj_7BSmFw4CFMNuR4B+1d+y3f058s+rzTuzdYogqA@mail.gmail.com>
 <20240116132918.GB311990@toolbox>
 <CAFNQBQyfWmfu5T7bgZDZFGfyhsxQi7YXmY_wPc9Y+mm5iSspXQ@mail.gmail.com>
 <20240117112150.4399d0bb@eldfell>
 <CAFNQBQwoGvSF1ryOPUUnedYUG64HqFQNXjMf6R7piufN64Vc=g@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Z/=HP4_XCgPfwY+his9cDQz";
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

--Sig_/Z/=HP4_XCgPfwY+his9cDQz
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 17 Jan 2024 12:58:15 +0000
Andri Yngvason <andri@yngvason.is> wrote:

> mi=C3=B0., 17. jan. 2024 kl. 09:21 skrifa=C3=B0i Pekka Paalanen <ppaalane=
n@gmail.com>:

...

> > EDID and DisplayID standards also evolve. The kernel could be behind
> > userspace in chasing them, which was the reason why the kernel does not
> > validate HDR_OUTPUT_METADATA against EDID.
> >
> > The design of today with HDR_OUTPUT_METADATA and whatnot is
> > that userspace is responsible for checking sink capabilities, and
> > atomic check is responsible for driver and display controller
> > capabilities. =20
>=20
> I'm not really sure where you're going with this. Are you for or
> against userspace parsing EDID instead of getting the information from
> the kernel?

In that specific email, neither. I attempted to describe the current
situation without any bias towards whether I think that is a good or
not design. There is an existing behaviour, and if you want to deviate
from that, you need more justification than for following it.

Even the video modes list that I mentioned as the major example of
things that userspace should not parse from EDID itself is not
exhaustive nor exclusive. Userspace can still craft an arbitrary video
mode and set it. If the driver and display controller can do it, it
passes I believe, even if it would literally destroy the sink (in the
CRT era, you could burn the flyback transistor of an unfortunate
monitor).

If you want me to take a stance, I think the kernel not gating settings
based on EDID for these things is a good idea for these reasons:

- EDID can easily be wrong, and it is easier to test sink "unsupported"
  configurations if you do not need to craft a modified EDID and
  (reboot to?) load it in the kernel first.

- EDID spec gets occasionally extended. If the kernel gated settings,
  you would not be able to test new features without getting an updated
  kernel that allows them to pass. This mostly applies to blob
  properties, and not enums, because you cannot set arbitrary values to
  enum properties.

Finally, as to why userspace parsing EDID at all is a good idea:

- The kernel is not interested in most of the stuff contained in EDIDs,
  so it has no inherent reason to parse everything.

- EDID is a fairly wide "API" and gets occasionally extended.
  Replicating all that in a kernel UAPI is a lot of work that won't
  benefit the kernel itself. There does not seem to be benefit in
  reinventing EDID information encoding in fine-grained UAPI
  structures, but there certainly is risk, because UAPI is written in
  stone once published. Userspace can get the equivalent from libraries
  like libdisplay-info which are much easier to develop and replace
  than UAPI.


Thanks,
pq

--Sig_/Z/=HP4_XCgPfwY+his9cDQz
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmWqNd0ACgkQI1/ltBGq
qqfnGQ/+OppgwQEB+aMxVc0+MwMmuQ47nz4bvWEPs5Lx7wYFUk9EFcYcIduOtIQm
I+RTnC0SgenSgRIr1uDRkC2v1JF0+o7q7p4w2Hg81CXws7+T/7UwZ9W1EU6XB4Sq
2u2okBIqfBYN8Gs1L2HYxNhsPGjHN9S2V1hGTjebvgGJRiSz+ZqsRWguZV6atTas
D8+n/Wo0FfGzgejMXm0lv7Hbv7wIkFT/sTkkEAm9OJDBoWNQpDuS35dhqRifuszh
Etsjmze5JoreY/WbhIUCOl8UrCkCisE+OpO00xLaWqUDUdUSDczDjqFiPL5yS58c
mR2kpzKjsSDcUr4CfwckOV1CCg0RDx8ADbyNvaqOFunC4P2wB1b7PY1TJkoyZbg1
assUq2mDL31RiYOw8uubszgWqGlE8jHbY/KeP1j4MWkaU0Q8fphyDUpChIi64KeK
rDIM+/MzimLKJ0sWj4mTgls2i9wyQCDIQL/RTK45KX7n1hny27sXeChPleG8gikP
YiVcGl/bWyxvIj5rmS+XPVd1h2eWe34u73P0JZHJHeuMujM+yHF54CsoLW9fHz0X
mEoY5GeYTqzvpajEd10xxTYWGEb5QwTSWgfNjNYZkctU8SOay4WdimDT/H8rkM8G
iP+TASYZkYvo8j3n2i3oy7oZufviaSbDt3ycQZfi6YpGKnFBU5k=
=aTzT
-----END PGP SIGNATURE-----

--Sig_/Z/=HP4_XCgPfwY+his9cDQz--
