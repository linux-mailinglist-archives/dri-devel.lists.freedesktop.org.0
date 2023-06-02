Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B10DE72013B
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 14:13:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE06210E676;
	Fri,  2 Jun 2023 12:13:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20AF010E678
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jun 2023 12:12:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6BB541FDAF;
 Fri,  2 Jun 2023 12:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1685707974; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IYIAHDMmiE1O2mmuQzkbbS+OyPQbKM3RtLGdWxOhflM=;
 b=Q2eEud1dHdWbj63hvUj5MzU8CalW7mrMzE9vcPOjV0+1F/XIjHZ50pui367Mfo9YonUctI
 tjb6Gu2b6kGgWs71a4FkvP514KFY0Ar6T47AUegipQHRmiLdHouk47nRfWLUV2fV/a2OvP
 G4lnykpWvWKfZ4xC52QzhNlNjufuWhw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1685707974;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IYIAHDMmiE1O2mmuQzkbbS+OyPQbKM3RtLGdWxOhflM=;
 b=MkLlk4wmkoBVTEe8h0gFyVSLfi4rRsD8rCOQ4sK9u4HIxyrPBflAV/TrZIVyNutOdJq1cE
 Mo9RIN011FavmyDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3434013A2E;
 Fri,  2 Jun 2023 12:12:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id rpTKC8bceWTFEAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 02 Jun 2023 12:12:54 +0000
Message-ID: <8ea1e2e8-302c-5519-768b-fff0556269ae@suse.de>
Date: Fri, 2 Jun 2023 14:12:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH] drm/todo: Fix corrupted duplicate in defio section
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
References: <843fbc95dd5b067b64fa684204234b915ecf0304.1685705373.git.geert+renesas@glider.be>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <843fbc95dd5b067b64fa684204234b915ecf0304.1685705373.git.geert+renesas@glider.be>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------PDRo2NaZMTe6VE3xxJWI7t4S"
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------PDRo2NaZMTe6VE3xxJWI7t4S
Content-Type: multipart/mixed; boundary="------------C80EVAhQvWk2LOVmMUaricJH";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-ID: <8ea1e2e8-302c-5519-768b-fff0556269ae@suse.de>
Subject: Re: [PATCH] drm/todo: Fix corrupted duplicate in defio section
References: <843fbc95dd5b067b64fa684204234b915ecf0304.1685705373.git.geert+renesas@glider.be>
In-Reply-To: <843fbc95dd5b067b64fa684204234b915ecf0304.1685705373.git.geert+renesas@glider.be>

--------------C80EVAhQvWk2LOVmMUaricJH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDIuMDYuMjMgdW0gMTM6MzAgc2NocmllYiBHZWVydCBVeXR0ZXJob2V2ZW46
DQo+IFBhcnQgb2YgdGhlIHBhcmFncmFwaCB3YXMgYWNjaWRlbnRhbGx5IGR1cGxpY2F0ZWQu
DQoNClRoaXMgVE9ETyBpdGVtIGlzIG1vc3RseSBvYnNvbGV0ZS4gSXQgc2hvdWxkIGJlIHJl
bW92ZWQuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IEZpeGVzOiBiZTVjYWRj
N2U3YjRjZWU4ICgiZHJtL3RvZG86IEJldHRlciBkZWZpbyBzdXBwb3J0IGluIHRoZSBnZW5l
cmljIGZiZGV2IGVtdWxhdGlvbiIpDQo+IFNpZ25lZC1vZmYtYnk6IEdlZXJ0IFV5dHRlcmhv
ZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+DQo+IC0tLQ0KPiAgIERvY3VtZW50YXRp
b24vZ3B1L3RvZG8ucnN0IHwgMyArLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9ncHUvdG9kby5yc3QgYi9Eb2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdA0KPiBpbmRleCA2
NjczNmRiMDBlNmQxODJkLi5jMjVlM2NkYmU5NjQ5NjdhIDEwMDY0NA0KPiAtLS0gYS9Eb2N1
bWVudGF0aW9uL2dwdS90b2RvLnJzdA0KPiArKysgYi9Eb2N1bWVudGF0aW9uL2dwdS90b2Rv
LnJzdA0KPiBAQCAtMzEyLDggKzMxMiw3IEBAIGV2ZXJ5dGhpbmcgYWZ0ZXIgaXQgaGFzIGRv
bmUgdGhlIHdyaXRlLXByb3RlY3QvbWt3cml0ZSB0cmlja2VyeToNCj4gICANCj4gICAtIFNl
dCB0aGUgbWt3cml0ZSBhbmQgZnN5bmMgY2FsbGJhY2tzIHdpdGggc2ltaWxhciBpbXBsZW1l
bnRpb25zIHRvIHRoZSBjb3JlDQo+ICAgICBmYmRldiBkZWZpbyBzdHVmZi4gVGhlc2Ugc2hv
dWxkIGFsbCB3b3JrIG9uIHBsYWluIHB0ZXMsIHRoZXkgZG9uJ3QgYWN0dWFsbHkNCj4gLSAg
cmVxdWlyZSBhIHN0cnVjdCBwYWdlLiAgdWZmLiBUaGVzZSBzaG91bGQgYWxsIHdvcmsgb24g
cGxhaW4gcHRlcywgdGhleSBkb24ndA0KPiAtICBhY3R1YWxseSByZXF1aXJlIGEgc3RydWN0
IHBhZ2UuDQo+ICsgIHJlcXVpcmUgYSBzdHJ1Y3QgcGFnZS4NCj4gICANCj4gICAtIFRyYWNr
IHRoZSBkaXJ0eSBwYWdlcyBpbiBhIHNlcGFyYXRlIHN0cnVjdHVyZSAoYml0ZmllbGQgd2l0
aCBvbmUgYml0IHBlciBwYWdlDQo+ICAgICBzaG91bGQgd29yaykgdG8gYXZvaWQgY2xvYmJl
cmluZyBzdHJ1Y3QgcGFnZS4NCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3Mg
RHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJI
DQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2
byBUb3RldiwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1h
bg0KSFJCIDM2ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------C80EVAhQvWk2LOVmMUaricJH--

--------------PDRo2NaZMTe6VE3xxJWI7t4S
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmR53MUFAwAAAAAACgkQlh/E3EQov+Dq
gA/8CCMHTbViNZPBj3aMrnXkmOc7HjdmhyxLvianCpjfD0p8fKekc/GNa1+dA1hQyb9rwxhKFPaQ
ROfU0ih0Xoe2ZuGEM8EtFzf5gT+2gvkAGivQ4LKHfmvowovz0VBNaQXIJc2UTTsoB9T/51DFeQNo
cWJt5YznGLUrGCxbXOW61ei6B9naHNO1x/SLJYdAY15O48DEa/PypyBO00BoMy2HbMFJzxxPqPHJ
Iq86BnhJ4Hcn9jKOw2ne/XpTNNW9WWuYkgT6rZF3B1/EG63lHw/jbmaMX+N0gZXJZeQnm3AW8jPn
pXlzoLbdfnq62zPUe2nLr2kz5vjyN73yWFjA4V3S8hAWkf9cy0VakLr63If7W+APfeR1ilgyKVcC
GWBP99+MBUs9YtSb1Idfi/Hp9czq8w68gvdhKhb+z7XrdGjr0hyfdS+ZHvjznyxemb69gOm+cjLY
yq9HWmLVemRJfVu2VAS7pl2HGjrae1OGAqvkLxX5Np4zawkwi9LMu618IF1CwjXHhpMxD6vPg7Ne
FQTBoOYvHzZcjmsPF/S4YPpJqxDogsf3yQv97iKdL9LtEsv/0gQ2veNF09EdyT2HoJ6GTjxy14jM
qG78v0BDSUpikt+Ht87zGpv3MWohh2ub8hov+c4UzISAr7BqW9Skq0JegyaNc/GP4mYA7SG4IxKu
PdM=
=Vmu/
-----END PGP SIGNATURE-----

--------------PDRo2NaZMTe6VE3xxJWI7t4S--
