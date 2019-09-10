Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7680AE71C
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2019 11:37:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F17FF6E869;
	Tue, 10 Sep 2019 09:37:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C83346E869
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2019 09:37:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: shadeslayer) with ESMTPSA id A5B4628BA8D
From: Rohan Garg <rohan.garg@collabora.com>
To: dri-devel <dri-devel@lists.freedesktop.org>
Subject: RFC: IOCTL to label BO in DRM Core
Date: Tue, 10 Sep 2019 11:36:31 +0200
Message-ID: <2944062.7iTOG62oOJ@solembum>
Organization: Collabora Ltd.
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
Content-Type: multipart/mixed; boundary="===============1064240787=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============1064240787==
Content-Type: multipart/signed; boundary="nextPart3202241.oaCzAanxfY"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart3202241.oaCzAanxfY
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi
I'm investigating a way to label BO's in panfrost, similar to how VC4 does it 
and realised that this could be something that's might be useful to all 
drivers.

With that in mind, would anyone be opposed to add a DRM_IOCTL_BO_SET_LABEL in 
DRM core that can be utilised by all drivers to label BO's?

Cheers
Rohan Garg
--nextPart3202241.oaCzAanxfY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEYitc3NselT9dMmhSpwS9TvJnIJQFAl13bp8ACgkQpwS9TvJn
IJT5pQ/+NNxVqb9rVISctrRgifnQI3fSPQxGTLPfSfUsa9tFZxbTpC/+Rd9zXXJv
JXk1ZxRnADLbuuWArJkmD5T/RFrrajwTlAdEERx8E5frkciU8rcVmltELnIbGdhR
+VailtsBMtUnL3q3Tu5mB7R9fL7S+qA1/AXSVZPWtEMXpMNd6uIk3W05zZ1cUGFV
VCFA9fVONPAZf2EHtzCN83K7zDIL9Q1022csHkNkbXLzS4FZkcE2LXsO4LT5o0Zl
Tce/cIjztnFbNSMYGP2SeS1kNLQRj5HsxLSd/pSuQ5nDJCixEzWqxzckPP+esRDA
Hxdk4fJNw3iRWjXrR6oHjrak0LFAaG82iw+o5mdBcRF2oPj9TVRkVmFhynXjJ8+C
t3VydRWXWJcE7ECTJGVkUJjVOaRypVLjuRAGSAZ215CEX7Ytemi4s7hD4aXT/khD
07gcgDz57sbEZ7y44UYO2KmUe7+CJf1c+FIEF0LRLvo1XbW8xgaruSe1xjiqPGXI
MGTWtmPO5AIAsfDyxOk+djnW6JiUncQ7jysNmhsfZbVD4mPOz/yRa7tYmmEFEMkJ
Ryo/DeaN1Es/uNNJMV6P5ekIP5pPgwv6pQxZVmB5+Yc3tTTxrh22pZuSfuO8RXrA
VM0zdohsdgyszwSNNBCKpqs+fVFZiOalXOJkpnH1AztVzoHwu/o=
=EiSN
-----END PGP SIGNATURE-----

--nextPart3202241.oaCzAanxfY--




--===============1064240787==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1064240787==--



