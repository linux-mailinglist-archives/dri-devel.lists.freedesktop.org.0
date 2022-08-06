Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC0258B599
	for <lists+dri-devel@lfdr.de>; Sat,  6 Aug 2022 14:41:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D643C10E87C;
	Sat,  6 Aug 2022 12:41:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DACB210E0D5;
 Sat,  6 Aug 2022 12:40:52 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id k14so2382774pfh.0;
 Sat, 06 Aug 2022 05:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc;
 bh=o6pt3V1ha9yMo8oPh0RhSV7A5lQkFUBOGwSJxIjKq5Y=;
 b=K3zZNGyQzBOJGo9GHJ77B64dvtlpK4HGVReHiflBNDRpOjaH5sqOdA8CSpHY5CKTyf
 jMxciE0uAHt180KJ/Y+huKoZL4LmZDsa6WkKOyCwoxB/ThJX4uVJEg7ZTShFI/az0Ar2
 z7gP6VTnSFHOO3nyj7PfGi5h2pn3jkcI30MOA4gJBLa6ZPkeSr1jNi+ni+/957EXpVKE
 8cMH0A3oIzRK5Ii74+i2xFTbbdfg/VV4lJGKX03EHlP6Q0ikAumdp8EVEn0EXa//V+ro
 7vXPHclNzVW+zRBDjtu+d19HsGrRLP2TD974QnRupiahEXDmXn0SLRi8PGivCy1jVQMg
 wXwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=o6pt3V1ha9yMo8oPh0RhSV7A5lQkFUBOGwSJxIjKq5Y=;
 b=6NTuzYho6NrbPH5Q0W7WbBF8jIF+h/GjUNld7/LnrkNh0ha7HXYG6JYaSaZpnE88lT
 AhqH7KW/Ku+zYUNJaa4o5Dt0YFeKc5pzmozXkOkljm4C5yNdut2tK5Mk7RxAxOspdjyn
 0mMzUD9bWeB+t53haOcHhkI2QMro+JhLO7VEPZ8ZAqoXHExb2Dh6dWDAITPlN9mx56rC
 o4H/uVqWtSZ73vjd0JlCvtsnQ9te5a+O1BoYauEPhgxAUeqw/y5NL7bjaibl5qes+2o8
 BQYRbJ76BsKhP5fzpF7Hvd+z8tJ3O2lC0WYRpoV/Ya6i1+vVbqHWCIILm2B/GjT284Wc
 3Utg==
X-Gm-Message-State: ACgBeo3JjNV2Gxx3TyoYxxCuVbT+s39pMRSxJYnNfcngjvpPV9QNX9sQ
 T5bZnUfULDMZ5+zS+Kif9Wvb87XKQeY=
X-Google-Smtp-Source: AA6agR4HVXRr5ozE4MZULCJYLmm+yzEtIzOb6rNsc6/YEix1fRqJBoSHmvvrRwFlh1pZPSou+4rtrw==
X-Received: by 2002:a63:d555:0:b0:41b:ca49:54c3 with SMTP id
 v21-20020a63d555000000b0041bca4954c3mr9091265pgi.360.1659789652285; 
 Sat, 06 Aug 2022 05:40:52 -0700 (PDT)
Received: from debian.me (subs02-180-214-232-10.three.co.id. [180.214.232.10])
 by smtp.gmail.com with ESMTPSA id
 r19-20020a634413000000b0040c9df2b060sm3072702pga.30.2022.08.06.05.40.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Aug 2022 05:40:51 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
 id 80D7A103B77; Sat,  6 Aug 2022 19:40:46 +0700 (WIB)
Date: Sat, 6 Aug 2022 19:40:46 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Jim Cromie <jim.cromie@gmail.com>
Subject: Re: [PATCH v5 19/33] doc-dyndbg: edit dynamic-debug-howto for
 brevity, audience
Message-ID: <Yu5hTr6qcLwiPRNp@debian.me>
References: <20220805215355.3509287-1-jim.cromie@gmail.com>
 <20220805215355.3509287-20-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="zCnbKQzWNc0slIHJ"
Content-Disposition: inline
In-Reply-To: <20220805215355.3509287-20-jim.cromie@gmail.com>
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
Cc: linux-doc@vger.kernel.org, gregkh@linuxfoundation.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch, jbaron@akamai.com,
 seanpaul@chromium.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, intel-gvt-dev@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--zCnbKQzWNc0slIHJ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 05, 2022 at 03:53:41PM -0600, Jim Cromie wrote:
> Rework/modernize docs:
>=20
>  - use /proc/dynamic_debug/control in examples
>    its *always* there (when dyndbg is config'd), even when <debugfs> is n=
ot.
>    drop <debugfs> talk, its a distraction here.
>=20
>  - alias ddcmd=3D'echo $* > /proc/dynamic_debug/control
>    focus on args: declutter, hide boilerplate, make pwd independent.
>=20
>  - swap sections: Viewing before Controlling. control file as Catalog.
>=20
>  - focus on use by a system administrator
>    add an alias to make examples more readable
>    drop grep-101 lessons, admins know this.
>=20
>  - use init/main.c as 1st example, thread it thru doc where useful.
>    everybodys kernel boots, runs these.
>=20
>  - add *prdbg* api section
>    to the bottom of the file, its for developers more than admins.
>    move list of api functions there.
>=20
>  - simplify - drop extra words, phrases, sentences.
>=20
>  - add "decorator" flags line to unify "prefix", trim fmlt descriptions
>=20
> CC: linux-doc@vger.kernel.org
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
>=20

The documentation LGTM (no new warnings).

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--zCnbKQzWNc0slIHJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTsebsWCPCpxY9T92n/R0PGQ3AzwAUCYu5hNQAKCRD/R0PGQ3Az
wGuzAYDy/O8VqIX4dB6ItFwNHJm1rs7Qg4OuYgYbKFvhP69MPdWx64MR4soFNSUx
y/x/+HABgNTyMUR8QKMtJnT6K443IFX7iqf6bs05/IbT4PqLQjZXkpc+PQBWALvU
6LjFercp5g==
=Aeer
-----END PGP SIGNATURE-----

--zCnbKQzWNc0slIHJ--
