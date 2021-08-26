Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A21A13F8DDB
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 20:31:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EB926E897;
	Thu, 26 Aug 2021 18:31:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4C476E897
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 18:31:26 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2306E1FEA5;
 Thu, 26 Aug 2021 18:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1630002685; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v2qQJXLtU/xI/8Fl0CxKUNYZKBYemafAmaf/JNpnnAM=;
 b=pFsRpy4cB0mtF8Zv/8n0fw4ELzw1fdHcZsR8cNIGzD2YQ3GhAr/9DpayRcyVhXZSpLSe09
 iJMQWHB6jZEFVLpwS8QfsC/zQQ+kZC/Z2K6mxaCbUesVoBRHByVuRZEyDEcU9pDzwvRK6E
 zR/2acrJfU+NLyVYyK++jhoJZhB4jV8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1630002685;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v2qQJXLtU/xI/8Fl0CxKUNYZKBYemafAmaf/JNpnnAM=;
 b=ZLjg1PmOOuFYjkxJZhpoNCIcPv00Uh7dL01qI4lnuYaBsyyrZO2Jg23+8KE6daWQDIOHel
 NFM1aGinKVr8sYBQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 0FC0E13737;
 Thu, 26 Aug 2021 18:31:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id 0SzWAv3dJ2FhFAAAGKfGzw
 (envelope-from <tzimmermann@suse.de>); Thu, 26 Aug 2021 18:31:25 +0000
To: Amanoel Dawod <kernel@amanoeldawod.com>
Cc: dri-devel@lists.freedesktop.org
References: <5186020a-192f-4e04-adc2-25a34305fea6@www.fastmail.com>
 <e80ae664-7184-69dd-5e6e-e228c720bb85@suse.de>
 <2ec3ae15-e8d7-4db3-baef-04b8ab9dc467@www.fastmail.com>
 <e3343649-a96d-7306-67d0-5f8fc9427429@suse.de>
 <ab196ef1-44d5-4aef-a1ab-e43bed2a87e4@www.fastmail.com>
 <7486abc7-ce39-915f-b697-b9adb356f98f@suse.de>
 <4c161178-4d15-4ca6-9069-9c9a781c7019@www.fastmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: drm: simpledrm: fbdev emulation error with CONFIG_DRM_SIMPLEDRM
 enabled
Message-ID: <f80168a3-02e3-1c79-98e3-11b9f7573a6e@suse.de>
Date: Thu, 26 Aug 2021 20:31:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <4c161178-4d15-4ca6-9069-9c9a781c7019@www.fastmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="bdp6QCkckiF0I4lgfzmG2kobklE4Jfwi9"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--bdp6QCkckiF0I4lgfzmG2kobklE4Jfwi9
Content-Type: multipart/mixed; boundary="lhMJUCaZVY4GYzHnekyfA4aamaPBQOjdF";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Amanoel Dawod <kernel@amanoeldawod.com>
Cc: dri-devel@lists.freedesktop.org
Message-ID: <f80168a3-02e3-1c79-98e3-11b9f7573a6e@suse.de>
Subject: Re: drm: simpledrm: fbdev emulation error with CONFIG_DRM_SIMPLEDRM
 enabled
References: <5186020a-192f-4e04-adc2-25a34305fea6@www.fastmail.com>
 <e80ae664-7184-69dd-5e6e-e228c720bb85@suse.de>
 <2ec3ae15-e8d7-4db3-baef-04b8ab9dc467@www.fastmail.com>
 <e3343649-a96d-7306-67d0-5f8fc9427429@suse.de>
 <ab196ef1-44d5-4aef-a1ab-e43bed2a87e4@www.fastmail.com>
 <7486abc7-ce39-915f-b697-b9adb356f98f@suse.de>
 <4c161178-4d15-4ca6-9069-9c9a781c7019@www.fastmail.com>
In-Reply-To: <4c161178-4d15-4ca6-9069-9c9a781c7019@www.fastmail.com>

--lhMJUCaZVY4GYzHnekyfA4aamaPBQOjdF
Content-Type: multipart/mixed;
 boundary="------------B09C9E527F82598E544F61C1"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------B09C9E527F82598E544F61C1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Amanoel

Am 25.08.21 um 21:12 schrieb Amanoel Dawod:
>=20
> No problem, managed to boot directly into a text terminal and grabbed D=
RM
> related dmesg log.
> Hopefully it's what you're looking for :)
>=20
> Find it attached please.

Thanks, this was helpful. The failure is shown at

> [    3.263394] [drm:0xffffffffc0303583] bad framebuffer height 2304, sh=
ould be >=3D 768 && <=3D 768

where the FB height is too large. But I'm puzzled why this happens. The=20
only way seems to be tiling, which isn't supported by Linux' simple=20
framebuffers AFAIK. All framebuffers are supposed to be linear.

You said that the resolution is 3840 x 2160, but the attached log says=20
1024x768. I guess that the former is the monitor's native resolution and =

the latter is the display mode?

The attached patch adds a few extra lines of debugging output. Could you =

please apply it, rebuild, and report back with the log.

Best regards
Thomas

>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer

--------------B09C9E527F82598E544F61C1
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-fb-extra-output.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="0001-fb-extra-output.patch"

=46rom 0558d0df9faac232056e6f55a33d10ca301bf7e8 Mon Sep 17 00:00:00 2001
From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Thu, 26 Aug 2021 20:26:35 +0200
Subject: [PATCH] fb extra output

---
 drivers/gpu/drm/drm_fb_helper.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_hel=
per.c
index 3ab078321045..d3e412efbbda 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -1631,9 +1631,14 @@ static int drm_fb_helper_single_fb_probe(struct dr=
m_fb_helper *fb_helper,
 		sizes.surface_width  =3D max_t(u32, desired_mode->hdisplay + x, sizes.=
surface_width);
 		sizes.surface_height =3D max_t(u32, desired_mode->vdisplay + y, sizes.=
surface_height);
=20
+		DRM_ERROR("x=3D%d y=3D%d, desired_mode->hdisplay=3D%u desired_mode->vd=
isplay=3D%u sizes.surface_width=3D%u sizes.surface_height=3D%u\n",
+			  x, y, desired_mode->hdisplay, sizes.surface_width, desired_mode->vd=
isplay + y, sizes.surface_height);
+
 		for (j =3D 0; j < mode_set->num_connectors; j++) {
 			struct drm_connector *connector =3D mode_set->connectors[j];
=20
+			DRM_ERROR("connector->has_tile=3D%d\n", (int)connector->has_tile);
+
 			if (connector->has_tile &&
 			    desired_mode->hdisplay =3D=3D connector->tile_h_size &&
 			    desired_mode->vdisplay =3D=3D connector->tile_v_size) {
--=20
2.32.0


--------------B09C9E527F82598E544F61C1--

--lhMJUCaZVY4GYzHnekyfA4aamaPBQOjdF--

--bdp6QCkckiF0I4lgfzmG2kobklE4Jfwi9
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmEn3fwFAwAAAAAACgkQlh/E3EQov+Cg
UQ/9HV0wkTabHXzQ8OHeOWwQWxjUpRUHSyykBvrIjBISMFUdSlVRCJwBlNyslABRP9ZVXUpgn7gz
o5ZPmTP5Ekn9blDsyqX7TllBNluzqYIqupW8j6eB64jG0t5zN9UZD65PopuNclJpgJO3BWIrt0vH
0rMDJmpRVRwv2i/jkS3WWyJitzhl3Pl4Wc1UJ7AIjiBtOwl68kGYwhjwKQ9YOS0NQM+87wwlGt/i
86GTSDBn7IzNgaUjvKt2o7hp5YN0z45IQJFjvaUPrm6rlZSJ0t8E2YGnXg+BcfFAmGWWtBjnAfA9
0w0oHJZsZL7CX2We6Li4Fe3dhNFV1TpTbVZcrQvS9+yDWkwtT5JzQzncyzUpehpBm29SyR+iW69q
s9XYsSiZl6G20DcGUU/3DHvROe5ueUBfphHz765e/SGJIdeA9IYGIwb3fM3WOVueu1d4Vowcpkj5
9nnE52hDyvQbmPV/eqZ8Xq3s1CsIuGJ5rnifQK2W95ePsxn86C/0ZkadZBcJ+2TC/5Ykp5sTH3ia
VYmItvOIsbkMo2Q1elXFv791tUMMUiLDRCy896/b4MPLs4GLR5SN4oLKvU5tpz/xYJfrOUJj3kJe
G7dLdLTiAD8Q1pNaUlg9SAhs4fKbHSLjxTp8fupUF/0zZsCK+USsArwxfgbXCFN/VIzErF4kdAYr
1gA=
=eWQW
-----END PGP SIGNATURE-----

--bdp6QCkckiF0I4lgfzmG2kobklE4Jfwi9--
