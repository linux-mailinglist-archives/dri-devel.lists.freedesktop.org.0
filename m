Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 848E869CF3F
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 15:22:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8BB010E13A;
	Mon, 20 Feb 2023 14:22:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5280010E13A
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Feb 2023 14:22:05 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 05C67203E1;
 Mon, 20 Feb 2023 14:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1676902924; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=usq2J/A02vvXu+D3dj5S2uYZKeTAbNVbciu3CO0eiEw=;
 b=Iyn/H30XD9cJIrf0ikAp7FcWKtx0Cvtwfu/XZ4MVpqzC138dOouySwusuOuaFeKMiMz/gG
 C1j88F79yAbXuwqBnspJdxX2pjbEcaMILL756C5IpLKJIB1duXDruat2toT82JY37iXwWI
 PXgnB9x/MmXTJcHAfurhduYSmciJNiQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1676902924;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=usq2J/A02vvXu+D3dj5S2uYZKeTAbNVbciu3CO0eiEw=;
 b=ag0OK4/Pexe3qUqIWsQ9rF9d1qwqgidytqC4p3yO714nprAYGzcwGfp2fZOfMgu7yBhjpf
 OxZk2N9Hx2assoBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D5545139DB;
 Mon, 20 Feb 2023 14:22:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id b1oNMwuC82PzLwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 20 Feb 2023 14:22:03 +0000
Message-ID: <edafc067-f8f1-e45b-9b0b-da0f1cabac4b@suse.de>
Date: Mon, 20 Feb 2023 15:22:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 17/17] drm/cirrus: Use VGA macro constants to unblank
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>
References: <20230215161517.5113-1-tzimmermann@suse.de>
 <20230215161517.5113-18-tzimmermann@suse.de>
 <20230216113330.rmzmkdvpxdqk2nrd@sirius.home.kraxel.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230216113330.rmzmkdvpxdqk2nrd@sirius.home.kraxel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------7gXLJSRR3CZNUIuU32SQhT0T"
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
Cc: airlied@redhat.com, sam@ravnborg.org, javierm@redhat.com,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------7gXLJSRR3CZNUIuU32SQhT0T
Content-Type: multipart/mixed; boundary="------------0BWpDwiySRfk7ruJQ1dQXzG0";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: javierm@redhat.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, airlied@redhat.com,
 sam@ravnborg.org
Message-ID: <edafc067-f8f1-e45b-9b0b-da0f1cabac4b@suse.de>
Subject: Re: [PATCH 17/17] drm/cirrus: Use VGA macro constants to unblank
References: <20230215161517.5113-1-tzimmermann@suse.de>
 <20230215161517.5113-18-tzimmermann@suse.de>
 <20230216113330.rmzmkdvpxdqk2nrd@sirius.home.kraxel.org>
In-Reply-To: <20230216113330.rmzmkdvpxdqk2nrd@sirius.home.kraxel.org>

--------------0BWpDwiySRfk7ruJQ1dQXzG0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTYuMDIuMjMgdW0gMTI6MzMgc2NocmllYiBHZXJkIEhvZmZtYW5uOg0KPiBP
biBXZWQsIEZlYiAxNSwgMjAyMyBhdCAwNToxNToxN1BNICswMTAwLCBUaG9tYXMgWmltbWVy
bWFubiB3cm90ZToNCj4+IFNldCB0aGUgVkdBIGJpdCBmb3IgdW5ibGFua2luZyB3aXRoIG1h
Y3JvIGNvbnN0YW50cyBpbnN0ZWFkIG9mIG1hZ2ljDQo+PiB2YWx1ZXMuIE5vIGZ1bmN0aW9u
YWwgY2hhbmdlcy4NCj4gDQo+IGJsYW5rL3VuYmxhbmsgc2hvdWxkIHdvcmsgc2ltbGlhciB0
byBib2NocyAoc2VlIGNvbW1pdCAyNTBlNzQzOTE1ZDQpLA0KPiB0aGF0IGlzIG1heWJlIGEg
bmljZSB0aGluZyB0byBhZGQgb2YgeW91IG1vZGVybml6ZSB0aGUgZHJpdmVyIGFueXdheS4N
Cj4gDQo+IHRha2UgY2FyZSwNCj4gICAgR2VyZA0KPiANCg0KRG8geW91IGhhdmUgY29tbWVu
dHMgb24gdGhlIG90aGVyIHBhdGNoZXM/DQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCi0t
IA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0Ug
U29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkg
TsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOk
ZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------0BWpDwiySRfk7ruJQ1dQXzG0--

--------------7gXLJSRR3CZNUIuU32SQhT0T
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPzggsFAwAAAAAACgkQlh/E3EQov+C5
wA/+O1d2tfCvQgNMsri96mX7NyZ+d7B8d61CHLnf88JgtpPk2r9Tuy2yNKDv8dXLP26L6INx0v5i
FOY1MqBIJJUYfGlml7CoELqWPO+PSk0YXLwX4VocqgJkAz5GPa8oz5j/38emUbf9USVDT6YJKDbl
VRzQBJQg23L1zINO2DyP4IpNa8rz2ScWgC05kWjHltdHnQ5KRDFzynx3BI6bgufV4lw6QVDacrAp
LROfE2Ul1jCKxK3LhvHsw01Ecz5wqA7KEvkDaAxlQPabnVuIBV24guP8wCcXyHDB6WYIT2ZkF6om
0sRLZUOd3AA1Y+dOb9fs1zmdWKpL6AQBRBPG3DPeJdjZDOHe3P+j4JHDnQn+nNQVNVZbEN8Au1c2
XXZyDyua+yLNxDqqyf/hBt36ldOHI4ayrCkl5LnL6GvvtCXlZxXwusEm8kEUlsa1DX8H7OatXaJY
CjBflw5Xvig037q6FGpRt64N1WDrPXHRCnazVPiAZcLgkcHY5wVIgv66LMQ57ARt1HoFGC+f2Hbz
SdjPtzxyK1QSFRqOdkevaUkKa2OG9Tcpb17EdbxMDVfAQUVlOSSCU4+5p2HHuIJsPNj6JCa4/8wd
YuuuG+ZfcjR4Ohvlthcf07MaTFVQmSADDA4SkcEqszR8CjFWCPyWSE4AOmFOIsoX2v5dF6gJBouG
+xI=
=FlQa
-----END PGP SIGNATURE-----

--------------7gXLJSRR3CZNUIuU32SQhT0T--
