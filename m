Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63720B6EF4
	for <lists+dri-devel@lfdr.de>; Wed, 18 Sep 2019 23:41:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67BB57A0B1;
	Wed, 18 Sep 2019 21:41:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from anholt.net (anholt.net [50.246.234.109])
 by gabe.freedesktop.org (Postfix) with ESMTP id 183687A0C9
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Sep 2019 21:41:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by anholt.net (Postfix) with ESMTP id BA94910A382A;
 Wed, 18 Sep 2019 14:41:22 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at anholt.net
Received: from anholt.net ([127.0.0.1])
 by localhost (kingsolver.anholt.net [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id U0tRk3rrtVlI; Wed, 18 Sep 2019 14:41:21 -0700 (PDT)
Received: from eliezer.anholt.net (localhost [127.0.0.1])
 by anholt.net (Postfix) with ESMTP id 658A210A37A1;
 Wed, 18 Sep 2019 14:41:21 -0700 (PDT)
Received: by eliezer.anholt.net (Postfix, from userid 1000)
 id 6B0342FE2141; Wed, 18 Sep 2019 14:41:22 -0700 (PDT)
From: Eric Anholt <eric@anholt.net>
To: John Stultz <john.stultz@linaro.org>, dri-devel@lists.freedesktop.org
Subject: Re: [RFC][PATCH] libdrm: Convert to Android.mk to Android.bp
In-Reply-To: <20190917191536.19105-1-john.stultz@linaro.org>
References: <20190917191536.19105-1-john.stultz@linaro.org>
User-Agent: Notmuch/0.22.2+1~gb0bcfaa (http://notmuchmail.org) Emacs/26.1
 (x86_64-pc-linux-gnu)
Date: Wed, 18 Sep 2019 14:41:22 -0700
Message-ID: <87pnjxqo3h.fsf@anholt.net>
MIME-Version: 1.0
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
Cc: Rob Clark <robdclark@chromium.org>, Jiyong Park <jiyong@google.com>,
 Robert Foss <robert.foss@collabora.com>, Mauro Rossi <issor.oruam@gmail.com>,
 Alistair Strachan <astrachan@google.com>, Eric Anholt <anholt@google.com>,
 Sean Paul <seanpaul@chromium.org>, Dan Willemsen <dwillemsen@google.com>,
 Emil Velikov <emil.velikov@collabora.com>,
 Vishal Bhoj <vishal.bhoj@linaro.org>
Content-Type: multipart/mixed; boundary="===============1773862239=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1773862239==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

John Stultz <john.stultz@linaro.org> writes:

> This patch removes the deprecated Android.mk files and replaces
> them with Android.bp files.
>
> This is needed in order to build libdrm/master against recent
> Android releases and AOSP/master, as some of the Treble build
> options required since Android O cannot be expressed in
> Andorid.mk files.
>
> Patch originally by Dan Willemsen with fixes folded in by:
>  Jerry Zhang, Eliott Hughes and myself.
>
> With this change, the only patches carried by Android for libdrm
> would be the gerrit OWNERS meta-data file.

Acked-by: Eric Anholt <eric@anholt.net>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAl2CpIIACgkQtdYpNtH8
nuje2BAAuXKYlXNFGXAaomO2WuCQzv68jfAiNzQ5v1alSRcqxalFZIL2mg2zDSQI
dpNwSbfYRi1+AOTI1iIRTHlj0Bey5G6d3YiGpnB2MMe5e8JyWTXtALeuvKprhLyn
tn581qd5v+t2aZVzLQDQPxtXhGDoNCNPXg5snJYt3HXgb3+JVw7ZsvG+0dgaQSyE
eC31CEFOhZAbh8O++moEIdjO1SFDwXlSNDsWIGK7TIRqhP7jaNRrpauqmo9MDEzD
dFWmZequsWmEq/7uHcFjPAal+2FMVfGabyddnN/3S07R9OMojQ0wK4oo42GuRYbA
9mtXg5DVRBR54HLiScF1fQ2VewN80YYLMM1rYjWlVrJx1MiqtYNcu7host/aOBN4
2Zl8NScA6myqIyhPWMMa6EtF8buGKZZOiuMdEFDYHKQbm8vKLsG/GHcoh/zu+Kzx
0+Fnw/oQq4aFN9MMKZRM/S9LxUkZg+OTYGOq5yskxA5BaZuiaZRwqdlYy8gk4x+A
fvKQDIZRGT3IowkPBb64EoLyByMZcJHpoYmW26BoPn5is1E0OMLOb83p1FohpmF/
1QhtQ/4dH5Y+ugxZEvkCF5anyfQXLBgCJvu6Zo3HDRmSWqasz+CdMHFFcML6FNKy
vPAKdwlwZXOtcHhE9bxguwX+YI6vi24IqSNdTO8Q3hIKgsiP6u0=
=kbAk
-----END PGP SIGNATURE-----
--=-=-=--

--===============1773862239==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1773862239==--
