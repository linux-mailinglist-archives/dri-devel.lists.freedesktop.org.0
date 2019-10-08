Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C42ECF351
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 09:15:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F2AE89FA6;
	Tue,  8 Oct 2019 07:15:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB1E889FA6
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 07:15:40 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id n14so16304799ljj.10
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Oct 2019 00:15:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version;
 bh=2l9RtaKrdt1x9x4OlJt6LOHBdzOKy9H1VprZXaBiWMM=;
 b=fwpc6GeaF9obMnP34817TV3qgr89xsWW4xy7njRFz9IAHGRVAMltgvL1oWCXM2dumM
 OJQIEsNgJ3GxVY3xNjGPYAbDygtHpqvmTwwymkx4SbR4MbinYYXfonOhCIxJ2rgc+HmP
 MLsbrnBwKogXH7fOvtK5u9ZFTG50ATFquIdtJQWxLkmqR4kE/kpMIvBkw1awav0fNMtn
 82MNd8+3mfo2Wquvvhw+d/M0Mt1jRRHE0ZB/tjfhsrDJ3g9F7flPdwZ00Abva9Y5yLeI
 ERzx1au4cqUQ6Jqh1j3gF6f1N0Z2A4ocoC5CfwoC7/1YN33ghkLRSkA4CPrZQ+bN9u3I
 0lEw==
X-Gm-Message-State: APjAAAV2zHK1y31VdjvdwdoicHeBzqKqQXnPfvZGMXsrbeSn/G7ckImr
 k6Vj+8eEKrYtztmc3iiE34E=
X-Google-Smtp-Source: APXvYqy++S6AJYSYtNKIk2I8XAOi2cjkvNKCuhbyi9FBtllUAjym38s2uSY/+psHnJAkvVm+nL15Gw==
X-Received: by 2002:a2e:9b48:: with SMTP id o8mr22094067ljj.127.1570518938950; 
 Tue, 08 Oct 2019 00:15:38 -0700 (PDT)
Received: from eldfell.localdomain ([194.136.85.206])
 by smtp.gmail.com with ESMTPSA id g10sm3353873lfb.76.2019.10.08.00.15.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Oct 2019 00:15:38 -0700 (PDT)
Date: Tue, 8 Oct 2019 10:15:28 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: "Keith Packard" <keithp@keithp.com>
Subject: Re: liboutput: thoughts about shared library on top of DRM/KMS
Message-ID: <20191008101528.1b447d5a@eldfell.localdomain>
In-Reply-To: <871rvopgjj.fsf@keithp.com>
References: <87y2xzqimw.fsf@keithp.com>
 <CAPj87rM5f1v9ETPJ3KhA7gQKKQoxhqbUx3at5Xi75+5nFQ79Sg@mail.gmail.com>
 <871rvopgjj.fsf@keithp.com>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:in-reply-to:references
 :mime-version;
 bh=2l9RtaKrdt1x9x4OlJt6LOHBdzOKy9H1VprZXaBiWMM=;
 b=Sh6My9bAFN3mO2LRED/9pYsGnK7Rrcmkpgcu9ZybK162DaSoFT4u4ZEeWO6IZua/g2
 e2cs0uMn+H5zFVRwise4cT9vcgZr+jNqW84nfLM5qYNfXweVLmxKKEWveMta+bOzE7wH
 uAsDmlSLiPILlw7S/pkkL4mKAoRBD5FVylOeUQ6zaanc76RGj+W+Esss8Lv+4x65aE30
 m3Plw0ULzH3mgCXUPirgEHBwv7DP5aHRcPUJon/Tg/nQUx/+szKg3QCHmHccRIWHdKI+
 cNIk58zWvT2/49tcOE2yceDSOEXYRMO+P6ACRYEoeYg/3FkQKwdN2Iv53jNMbUVku7cx
 Ig4g==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0597900985=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0597900985==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/EqYZTv7eThQm.+lHQNcIJgH"; protocol="application/pgp-signature"

--Sig_/EqYZTv7eThQm.+lHQNcIJgH
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 07 Oct 2019 14:16:32 -0400
"Keith Packard" <keithp@keithp.com> wrote:

> Daniel Stone <daniel@fooishbar.org> writes:
>=20
> > I think there would be a load of value in starting with simple helpers
> > which can be used independently of any larger scheme, tackling that
> > list above. =20
>=20
> Yeah, a helper library that didn't enforce at tonne of policy and just
> let the user glue things together on their own is probably going to be
> more generally usable by existing and new systems.
>=20
> I definitely like the idea of stealing the best parts of all existing
> systems and trying to make them work together.
>=20
> How many libraries we end up with isn't nearly as important to me as
> making sure they work well together; common data types, similar style,
> etc.
>=20

Hi,

a bunch of helpers is the more attractive idea to me too. We just have
to pay attention to API/ABI instability vs. usage: we should be able to
both redesign the API at will to go forward, but people will not be
happy using a library that breaks ABI all the time.

Libweston worked around that issue by making all major release versions
parallel-installable. That means literally all files or directories
have the major number in their base name. Another option would be to
have a static library only. I'm not sure which one would be more
attractive. If going with static-library-only, then we probably one day
want to convert into a dynamic library, and then the question of
whether the ABI is stable enough will arise again.

Using Meson should make the static-lib-only approach very easy,
downstream projects could include liboutput as a git sub-module or
such. That should eliminate the version dependency issues that builds
might otherwise have.


Thanks,
pq

--Sig_/EqYZTv7eThQm.+lHQNcIJgH
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAl2cN5EACgkQI1/ltBGq
qqeiIg/9G47T2CQildhOVRPwSWx8k4/m9mvNow9NbNljZ088E9Vhh8bvHSjdx/zk
l8SD5WMgF9HTKzrvYaoHWTsAOWCzvISUBY6WWE7tI0Ri2yQ1BxDe4VjA8cGaPX9T
WBMjoVTjLE0d4TlHC5BuGkkmi12s/7OFoNX6b3CUEZUaww48tPD87mMm4ObjOLsR
6hW81smPzR7WSRS+dl7J8wwnIOe3cp18ZmpYSuuBDPv7yUxTYvxYAwnqmnpobxmy
2oXTIMAKXFT+oG70N+oshde0ENtkdF0xCzp8pvwcqbkizigoQ/OTk9W3oB5zClQV
oLGxHfDTPDuCs2etL506ZU84pmvG2PRZJ8lIXEcKfuYzf978NH4M4d9rOgXS4EmL
5ygPp3uL2UBGLtyIA/H6UVOb6B69Lqtg/SN5Gog3P/Has1D9FSYPOZV6+2NflB1o
BnWYHKK3IN6/T2XzHDYg3c9Gy73/dmtXF4oUM9KsW4+tZ1jiXCi0n0i/SNtob+iD
73/zKzJD8/M9nDkvD5+AEo0scl7qAfsca2TaZ/Vbz786ocCSSqIJOqFstfQpxs6k
pIxz1YhFN+3yK9k3Jnb0Bw3W6caz+qtzzmDzILjdvVaLylbidkEfm/6Gp0AyzwgZ
esuj7PITbPfxeW6GMF3NUKt9I4ulZfq0vG5PbLEU+kSbljoStHk=
=AVBR
-----END PGP SIGNATURE-----

--Sig_/EqYZTv7eThQm.+lHQNcIJgH--

--===============0597900985==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0597900985==--
