Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A79555CCA
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jun 2019 02:07:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A01E68912D;
	Wed, 26 Jun 2019 00:07:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from anholt.net (anholt.net [50.246.234.109])
 by gabe.freedesktop.org (Postfix) with ESMTP id D27428912D
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2019 00:07:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by anholt.net (Postfix) with ESMTP id 7FC4C10A2F17;
 Tue, 25 Jun 2019 17:07:39 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at anholt.net
Received: from anholt.net ([127.0.0.1])
 by localhost (kingsolver.anholt.net [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id nGl1yTbOCQMk; Tue, 25 Jun 2019 17:07:38 -0700 (PDT)
Received: from eliezer.anholt.net (localhost [127.0.0.1])
 by anholt.net (Postfix) with ESMTP id 3FF6C10A1128;
 Tue, 25 Jun 2019 17:07:38 -0700 (PDT)
Received: by eliezer.anholt.net (Postfix, from userid 1000)
 id 79F4C2FE21CE; Tue, 25 Jun 2019 17:07:37 -0700 (PDT)
From: Eric Anholt <eric@anholt.net>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 1/7] drm/fb-helper: use gem_bo.resv,
 not dma_buf.resv in prepare_fb
In-Reply-To: <20190625204208.5614-2-daniel.vetter@ffwll.ch>
References: <20190625204208.5614-1-daniel.vetter@ffwll.ch>
 <20190625204208.5614-2-daniel.vetter@ffwll.ch>
User-Agent: Notmuch/0.22.2+1~gb0bcfaa (http://notmuchmail.org) Emacs/26.1
 (x86_64-pc-linux-gnu)
Date: Tue, 25 Jun 2019 17:07:37 -0700
Message-ID: <87woh96wfq.fsf@anholt.net>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: multipart/mixed; boundary="===============0982165129=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0982165129==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain

Daniel Vetter <daniel.vetter@ffwll.ch> writes:

> With
>
> commit 5f6ed9879a414636405a2bd77f122881695959e4
> Author: Daniel Vetter <daniel.vetter@ffwll.ch>
> Date:   Fri Jun 14 22:35:57 2019 +0200
>
>     drm/prime: automatically set gem_obj->resv on import
>
> we consistently set drm_gem_bo.resv for imported buffers. Which means
> we don't need to check to check the dma-buf in the prepare_fb helper,
> but can generalize them so they're also useful for display+render
> drivers which use gem_bo.resv to track their own rendering for their
> own scanout buffers.

1-3 are:

Reviewed-by: Eric Anholt <eric@anholt.net>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAl0St0kACgkQtdYpNtH8
nug6fw/9GpFqHQONwX/TjLh/QCOP/JKMFhVQH6KxUdURZciLnXtsbH2Uad+uwDkF
v2OWAWKTMOYjsDHhFqdTLSAADFTsv/QJxukqARlPjTo2evjbnYZmZvuDD2hxBT9c
IkAThWimvRJHJ9UPmUcGROvcCOkNqs2iyTvZ+Na46ImrFou6REWjx+rq1RhMn6rV
NNk47nH+utlyiHKOBrYkEyuG2Wk2d+ArBM9on/j9Hk3RZO+8RWe3tulLSpg9FDSe
NxJqOtyyZnWQYpqC+G+InC/62+uVVRCT3Zg2WuF0TyMDjqBOTmbRcJXwzAEDkeNU
27I+0v3ahqktu/pXL8dNissNLTfFF4DhBbcBTPm7Eowv5aAFDd0Kff2KWQKZ0JlV
mIfZ2MoOpiRMuBZY1c/0QFzYmgBuK62RxRhX0zaj/vX6e/ugnYjjHjeNuEhIuEhk
RJeVASMweHPLj6ICh0MRcBj+ZOXU2IKp6gWwWFgCq8zu+Go4gO8sxfxHq1T6kgKJ
5K1z5g+E1c3rGr00BdF8XGuy85dTpEir7MJ+zJeIqkLxeLnGZgOgPR7fWPYPZPw6
80B1sEcoJ3k9Ar/LfdcLc6oRpDdhwUeMCF9SUZj1keRZPl7C4Ue9MYJLvDrH9dWb
idT8X924PwvyRYYrmWIEI57hB0dpXT6qjA2zJlaSJ9cbl3mlzpM=
=zGSA
-----END PGP SIGNATURE-----
--=-=-=--

--===============0982165129==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0982165129==--
