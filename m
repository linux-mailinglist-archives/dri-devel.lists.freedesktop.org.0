Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FDA691B98
	for <lists+dri-devel@lfdr.de>; Fri, 10 Feb 2023 10:37:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6749910ECB4;
	Fri, 10 Feb 2023 09:37:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E20B910E1BB;
 Fri, 10 Feb 2023 09:37:44 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id fi26so4218836edb.7;
 Fri, 10 Feb 2023 01:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=0+dVSntmr+Ccew7Y7YwTEyR4YujCYFwh6mnJvDb57qE=;
 b=fKqvm83jI5G058LgsoRMW8ZrvtT70fmWu31+awSyoSsT4tBnrwE/zvw6J/wB8D4jJr
 aHeiYtEDt+WRUdtZ6NTOdjCqxElsEOBB9pmXxEH2KIaMZyCNxw1GfrP9oDOh9g54gUQT
 KqlcvUS63o0tKPP2/aBq1lToxQwCMy5ouTaGdinmt3yH++36LchuqMsBweDGXbna6mjp
 0NsyRBJJh7F6nS9F9+7hAsockIOM1Fuvm1T344Tk2pPswa0fTl7btbVletNVP+FSWsT2
 /pJJ0DpaJuXVQrgWG4wge6kw3/dReJI7VotXRydV67un0dzeyKoWk+L+Ol/KIeZfrPFx
 v93g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0+dVSntmr+Ccew7Y7YwTEyR4YujCYFwh6mnJvDb57qE=;
 b=H7jKawdPzWFSZYmS5T8eTK/kHinCs/0N3kNhFETm5XX2AIMlMCl9i+wZodasBud9PT
 y3bGgd+YYVXXYQIBdPNMJyhYlcjj+P1fTxU8UrOiD+rLGfmDQtf1/ZhFNsbyTRuewEw3
 IN/zJ89PpqQFn6lL0rKcP2G403uTCyADnuPlpWhr9xdwdCQEt2YTwHmhCmL01CbgV1R+
 pQmSz3m37vvt4rxgqSvgg4+0s0uyzpp/karzD3y2Yh5HxJYPz6pBHIa528ssrwEw/G68
 vUP9ec7/WGKYY9X7hzQoHYjMoxSYqvZvdG28savBrspg4hVW5a+ig4O2b67FlLtv3i5b
 d+0w==
X-Gm-Message-State: AO0yUKXvJA6qZM8XC5PyfnxHSoB0hLp/G9+P0TGlG7E5lUvwsdIiku/U
 LBPBOPhPNZgcVeNCtfcVxNU=
X-Google-Smtp-Source: AK7set+QsonNwUhbwl+zFSvtRzGc1G/a2GzSiSb6pLO8ih4ozNZKdXwbf3PrZRPTUKnqrrHJ4KMJ/Q==
X-Received: by 2002:a50:a69e:0:b0:4aa:c68c:5441 with SMTP id
 e30-20020a50a69e000000b004aac68c5441mr15005269edc.16.1676021863446; 
 Fri, 10 Feb 2023 01:37:43 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 c20-20020a50f614000000b004ac089bb600sm59758edn.0.2023.02.10.01.37.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 01:37:43 -0800 (PST)
Date: Fri, 10 Feb 2023 11:37:38 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH 3/3] drm/connector: Deprecate split for BT.2020 in
 drm_colorspace enum
Message-ID: <20230210113738.38ecda93@eldfell>
In-Reply-To: <hlhk2_vNweAm7d8c2FK8GlUEi1-JHOZTU2W8unUHLoyTtyjXQnnAoGur8KqYgrbw6nsP9Yy91k8OzgiP1k_zwIX4JB0Qt5W178zqOgHilZY=@emersion.fr>
References: <20230203020744.30745-1-joshua@froggi.es>
 <20230203020744.30745-3-joshua@froggi.es>
 <20230208113041.70691449@eldfell>
 <54695463-3e7f-4e4a-cd76-fa6f9de1d8e8@froggi.es>
 <hlhk2_vNweAm7d8c2FK8GlUEi1-JHOZTU2W8unUHLoyTtyjXQnnAoGur8KqYgrbw6nsP9Yy91k8OzgiP1k_zwIX4JB0Qt5W178zqOgHilZY=@emersion.fr>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/E6uLhe=draPW4ciJ5nPwjv6";
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Uma Shankar <uma.shankar@intel.com>,
 Vitaly.Prosyak@amd.com, Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/E6uLhe=draPW4ciJ5nPwjv6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 09 Feb 2023 17:03:19 +0000
Simon Ser <contact@emersion.fr> wrote:

> On Thursday, February 9th, 2023 at 17:38, Joshua Ashton <joshua@froggi.es=
> wrote:
>=20
> > > I mean, the strings are the uAPI, not the integers, right? =20
> >
> > Both are uAPI these days. =20
>=20
> Yes. The integers are uAPI, if you change them you'll break libliftoff
> users. There is an old thread discussing this somewhere. The tl;dr was
> that there is no use-case for exposing the same string with a different
> integer, so no good reason to justify the substantial complexity of
> handling this case.

Funny, I remember exactly the opposite.

This case would have been multiple different strings with the same
integer, anyway.

But no matter. If a uAPI header or documentation has exposed the
integers, then there is no taking that back.

This won't be a problem for enums that have no meaningful string names,
like enums where the integer names a blob that describes what the value
means, and enums where the integer is an index into an array of
descriptions exposed as a blob.


Thanks,
pq

--Sig_/E6uLhe=draPW4ciJ5nPwjv6
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmPmEGIACgkQI1/ltBGq
qqfqTRAAj7WPWENRE7RChF5er4n7CL49dobVCASuG0JNymuk5j8rzZXb1pQXUZ9E
9lK5v0tdGBv8h5EV2ITDB4RuHm7Ij17TxZ7d72ywthvUHVG0wMd2sRgkb1YE2YYi
eBwnwthJHdHWJ9Qm9wYBuVV43rlDlvsnSTKab1sJneGdPEwxXj8U+c3yVDnznoQ1
reUSNDNUIAoJCOWUpDHD7LfKL7rqymdQUwWSEvx3Pyq9jJYgtG8e+DzWfufHBQY2
Zq0YKk1qEZjmjovQQngfGx0Qk5jqV2/YytsfbU8/yYxcgtnZlAiUfGGxI3ODnkPN
zSdoYqwMBwUBwNRx4azSmGxK+f1meHRPTcCRvigzLkoOKSmf4/B7CK1/BSUlxOL0
3Bj12Xg0vVQgthHUDOrYyyCj6G69TFBJjGh82stBh1MHmYljjmtcIrqBP3g0H0OP
qhh5w2cKqSAhsCJWr9TTDpjVtZ08Rnf7bX+U73BgWO+7pu575fp6UIeIP2Aouk/U
2o4H1XQJ7lqm1rcHhl2LCoY0rsuKQCj8yKZlbRBsZcEhBm8nKJNE8RmbWN993KkX
a1ujgxYPb7yWUvxlizAdgSnZbC0VjJJUy4ff+UHAmqpYL0ltBHAU1wL1i2dB5/D3
kJWsQdZLeJAcYYD1C49X7loehknt9zOplgsVQHTlRvk0G9jDBkk=
=R1OV
-----END PGP SIGNATURE-----

--Sig_/E6uLhe=draPW4ciJ5nPwjv6--
