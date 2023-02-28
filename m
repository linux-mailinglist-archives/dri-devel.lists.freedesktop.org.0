Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53ED36A5664
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 11:12:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D42110E03B;
	Tue, 28 Feb 2023 10:12:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3328610E03B
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 10:12:28 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id k14so12403906lfj.7
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 02:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677579146;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=a0ZALjz8hZncQ1TonGfmo+zvU7/0+j9qAf4rZWFHe/0=;
 b=nYgerGIcu7sGl5NDCbCsOLN8LiFOA5AlDWF+riegmmZaL/NNdVEl9GmkOf8+0Fn9aW
 c0RPA5ZEwTBGJtbYRrzaU/0q9scmMvNITYbsJVG7z4/PiOZwZfdNLmgrRfjQlv+ssh8n
 PfmncCG5kB3wcbsBb1JDPC1o4w2ntPetD98Mzg9Yp1CFosXiW7MAluLmuWZdWeBvMp9t
 SweGLkKNOtVDU5RVl8b4qk5eew94cmp9iDoEyY9Fn2ICaylhxytetwh+Io94Gg/xOkS+
 ueH7WYqCU9c3VbC2NSfnaFWgmNC6kj7nws2/Kl9otxFgZmJk2HyVp8hfwQi8LsaAmbrp
 p+aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677579146;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a0ZALjz8hZncQ1TonGfmo+zvU7/0+j9qAf4rZWFHe/0=;
 b=FwsUVnPJV1g1ndiXD7qXrxE8RaZsz7fmDN3XC2rU5vZVZuwp145UrRLY+vx/vcFfYf
 8cehk/zrAyLcznxXQPW+JDEk9tRA2ZSDjdmJ55hKk6ALdHeNI6qQNu+hJNABqaOCMVPF
 7Rkz7aT71+bBDY1PlGOzQeCpjb1EmZtXG03KJ44OZvs7QUHo+x0gzyU8rPzl4tjtNmYZ
 oLv/GRT79xQko3yqVVozaFmQJGavG1TCKvreTsi9avDUKMOcmU647CuUEPsvOPOcXwxr
 ajCwVmc72b0o7t8blKv/F+RcHrBc//UHA6lwg5xSWdGFUam4vXjU+PbRNWr4El+xuXES
 USWQ==
X-Gm-Message-State: AO0yUKX/horV8JrhWXL06I36c+0eEjvHZwDDU9bJ4rpea3qV2ARo9jsv
 Z7oJ+EpmDBofK7kpB/FySU0=
X-Google-Smtp-Source: AK7set9zE2K1Lct40MR/LeWIb3lNTK3z3FyYjIB9r56f6ydGYHic1I4b0hKXvFJ2A/fVoYkptq+0qw==
X-Received: by 2002:a05:6512:3d1d:b0:4dd:cf7a:990e with SMTP id
 d29-20020a0565123d1d00b004ddcf7a990emr871946lfv.8.1677579146148; 
 Tue, 28 Feb 2023 02:12:26 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 h2-20020ac25962000000b004db9dbe09c6sm1270642lfp.89.2023.02.28.02.12.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 02:12:25 -0800 (PST)
Date: Tue, 28 Feb 2023 12:12:22 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: document TV margin properties
Message-ID: <20230228121222.4abf13cb@eldfell>
In-Reply-To: <UA_4dHbPqQvjG0TrP7OhP73PFlhdTNg9Mx9GW3MRGX_JskeQHTNaZyKTBj4AmJoSgutHZeQTa08RkRBuFS6xfTPpEm7MrVtJZEaq88ZYg1s=@emersion.fr>
References: <20230227122108.117279-1-contact@emersion.fr>
 <20230228104642.21dae84c@eldfell>
 <UA_4dHbPqQvjG0TrP7OhP73PFlhdTNg9Mx9GW3MRGX_JskeQHTNaZyKTBj4AmJoSgutHZeQTa08RkRBuFS6xfTPpEm7MrVtJZEaq88ZYg1s=@emersion.fr>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Ep4D4Dhm2KuW0_vTbqgZci/";
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
Cc: Noralf =?UTF-8?B?VHLDuG5uZXM=?= <noralf@tronnes.org>,
 Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/Ep4D4Dhm2KuW0_vTbqgZci/
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 28 Feb 2023 09:53:47 +0000
Simon Ser <contact@emersion.fr> wrote:

> On Tuesday, February 28th, 2023 at 09:46, Pekka Paalanen <ppaalanen@gmail=
.com> wrote:
>=20
> > can these be negative as well, to achieve overscan and not just
> > underscan? Did I get overscan and underscan right... these are related
> > to under/overscan, aren't they?
> >=20
> > Hmm, no, I guess that doesn't make sense, there is no room in the
> > signal to have negative margins, it would result in clipping the
> > framebuffer while scaling up. So this can only be used to scale
> > framebuffer down, add borders, and the TV then scales it back up
> > again? =20
>=20
> Correct.
>=20
> > Looks like neither my Intel nor AMD cards support these, I don't see
> > the properties. More things to the list of KMS properties Weston needs
> > to explicitly control. Oh, it seems vc4 exclusive for now. =20
>=20
> i915 does support it but for TV connectors only (i915/display/intel_tv.c).
> gud also supports it.
>=20
> > Where does this text appear in the HTML kernel docs? I tried to look at
> > drm_connector.c but I cannot find the spot where this patch applies. =20
>=20
> Here:
> https://dri.freedesktop.org/docs/drm/gpu/drm-kms.html#analog-tv-specific-=
connector-properties

Analog TV properties? So this does not apply to e.g. HDMI?

I believe HDMI TVs do have the problems that margins could mitigate.

> > Is this actually a connector property? How does that work, should this
> > not be a CRTC property? =20
>=20
> Yeah, it's a connector property for some reason.
>=20
> > Is this instead not scaling anything but simply sending metadata
> > through the connector? =20
>=20
> No metadata is sent. This is purely equivalent to setting up CRTC_*
> properties to scale the planes.

Oh! That would be really good to mention in the doc. Maybe even prefer
plane props over this? Or is this for analog TV, and plane props for
digital TV?


The above are the important comments. All below is just musings you can
ignore if you wish.

> > Or are there underlying requirements that this connector property is
> > actually affecting the CRTC, which means that it is fundamentally
> > impossible to use multiple connectors with different values on the same
> > CRTC? And drivers will reject any attempt, so there is no need to
> > define what conflicting settings will do? =20
>=20
> I don't think any driver above supports cloning CRTCs for these
> connector types. i915 sets clonable =3D false for these connectors.
> vc4 picks the first connector's TV margins, always.

Sounds like i915 does it right, and vc4 does not, assuming vc4 does not
prevent cloning.

>=20
> > IOW, does simply the existence of these properties on a connector
> > guarantee that the connector must be the only one on a CRTC? =20
>=20
> I suppose that there could exist some hardware capable of applying
> margins post-CRTC? Such driver could support cloning CRTCs and still
> applying the connector margins correctly.

Yeah, theoretically. But in the KMS object model, is there the idea
that connectors do not do image manipulation, they can only convert the
signal type at most and send metadata?


Thanks,
pq

--Sig_/Ep4D4Dhm2KuW0_vTbqgZci/
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmP904YACgkQI1/ltBGq
qqcOfg/8CpJvAsjGA6d9fwq+ttDBsS23cm+0Lte5mVLLtCGkQO8t0CUrGMrvgPFt
TmxXqxin+30PVXX8zNSqkn1atW7f2hM7cEehVXXI4e5lfCbSI9GYcDbCDkftqKjc
ixwrqocUDoBKjtR+Fp5i5Sv1wGhkW4q/sIOXGkTEMLZ6CQVfwzeW0Ob0UdnAy2Ov
+jGJat7RWNx+W7zYahvjj0uyCVsyBTnY34i/pEIXNFWK5kOIdUfevRygpy3H0Ptq
oFDtVzUHz8zlnk9N0PIuusGc5yi2FHIZ1B42g3TcifMKDSxSZc010k2kIi/QY2xM
m+paj3bYCyKpkNtrV5tsdK9LkJrSVmhfFHuGiznYYBKDBOsSOvQr/F+2X+hT38d4
3bOPtKuUtH+Q9cl/o506LA/G0COw2Ge7wQ+DRyflmOBk00+u3PcAHzNHs46x0grq
g3o1uv8y/UyhL0StAxQGmke3OS+kEr5bNJJ5GwpEey+RX/KVw1o4EHEnVcJdewe1
Om7vn9sSaStkR0b+6f6p+Vfcieme8MAKCd8Bt5fwis4NPy9TWa1o04HE1E19O4wX
UqL3EcDotsq0GoG+LdHwuiuLyyqhWjBMwwEqvZToTN/6x/q3BM+yRhfbBsoJAIrG
bbSUnC8Knj2C+kzR/efvWfkCdLzhSdU0gFbaujmqZiY2TTQP5Ic=
=L0G9
-----END PGP SIGNATURE-----

--Sig_/Ep4D4Dhm2KuW0_vTbqgZci/--
