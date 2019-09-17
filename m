Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00667B50F8
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 17:05:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBE4E6ECD1;
	Tue, 17 Sep 2019 15:05:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39BD76ECD1
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 15:05:35 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: shadeslayer) with ESMTPSA id E130C28CED0
From: Rohan Garg <rohan.garg@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/ioctl: Add a ioctl to label GEM objects
Date: Tue, 17 Sep 2019 17:05:27 +0200
Message-ID: <7822046.gLmiR1X9Zk@solembum>
Organization: Collabora Ltd.
In-Reply-To: <0ac8c7d3-e8b0-3ead-f05b-80944b92e1af@shipmail.org>
References: <20190916103541.29015-1-rohan.garg@collabora.com>
 <0ac8c7d3-e8b0-3ead-f05b-80944b92e1af@shipmail.org>
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
Content-Type: multipart/mixed; boundary="===============0858314029=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0858314029==
Content-Type: multipart/signed; boundary="nextPart3383785.CeefsCTPCk"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart3383785.CeefsCTPCk
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi

> 
> We're not closing a device, are we?
>

Ah, yes, I'll fix this in v2.
 
> 
> Do we have a mechanism in place to stop a malicious unprivileged app
> from allocating all kernel memory to gem labels?
> 

I'm unsure why this is a concern since a malicious app could also potentially 
allocate lots of GEM buffers and cause the same situation.

Cheers
Rohan Garg
--nextPart3383785.CeefsCTPCk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEYitc3NselT9dMmhSpwS9TvJnIJQFAl2A9jcACgkQpwS9TvJn
IJSPlw//WvJ0OGtbAIczu7bGLKGIe15Sb1Ol1c2c6umdQ2TRpyGwABtbYVctVYWr
iYXHcY2vxW+l03CHpr57s06wHDdlagNIyMSw+HUXz3mPMcrZjuFXhi0BteQ/NAVV
ZTvV+H1e5PsJwR7V1U0SjTLuaVcQ11d3aU2BvUVwFpijTopfr3S8g7KRypn3f3sa
Rr24agxigjUoO3nrS+ojaAhuu8C12oNhd9Q11tbU8th9dFRh8uovANnYYlVrMd0A
4nu9OylNY1AZcAjbhue1Mp77oNMKGSBbo+4HIVWJc+ts1QTJGtgj2cxMWWk729BH
LyIsiQNU1bWJ4GVA797IPd1/zT/AySYI1pQMvFMDVCtkqqgKzmEzeGLWeKgxttei
QjGPSuZWPgayDq7NPpS1HUfeFBU41A1PT1PpXakXc7X8g7qm265heC+9SsH/jmkq
JQNs9QXqayk422YLNjTWL5kgp/1RHUWpjZl1zTx0XNq9HrCK2oP3AdNTUS7ZKN9Q
JU4wjp5Txk8xUtqrvfHikb2FP4cMJZv8JzDjnzJdXkrvAmWErkYBghhaJ5DydKuW
Fbt9NFLqL3vGTArotxx4opfSRHBWV7gtAjRQ5L2HT2/j+ZG37cA2/2LmrKx+R33x
nH32j0ztCIrlotW2kme/3nPwVzeRxNg3znoVbcL8VM/nYWoNNaA=
=4+sX
-----END PGP SIGNATURE-----

--nextPart3383785.CeefsCTPCk--




--===============0858314029==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0858314029==--



