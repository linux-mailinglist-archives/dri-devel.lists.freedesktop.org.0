Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEA3720143
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 14:13:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C7E110E674;
	Fri,  2 Jun 2023 12:13:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E8D510E674
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jun 2023 12:13:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 50C7B1FDB1;
 Fri,  2 Jun 2023 12:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1685708031; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NIXT2MGHYFrGcX+BNmXNeUtdeqZMVAVbU6fseMsIfws=;
 b=iVMgW4BY4/MR+mpOS+fKMS97QRSGKQh1CedbZq1U4cQTV83CfYYnsIrRRQU6ME3BflAKqx
 OTGmYkD+PEbQRixnaE4mlK43g8y3FV/3xr6tT6c+GLOlIWz3yup6e//XElGdXeoWOuxKnZ
 IMcswmBUvfMPynZVjQF0C2wx2atyW+Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1685708031;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NIXT2MGHYFrGcX+BNmXNeUtdeqZMVAVbU6fseMsIfws=;
 b=C2c8ZJCUpLVj/tu+U60ggkSqeTh4IIajwgxB8mNZt7VOAiEaxBbjPQVcsApmaW5VB2rlhb
 SqdiC1He+yXqXwAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 35A1C13A2E;
 Fri,  2 Jun 2023 12:13:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KcjKC//ceWRKEQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 02 Jun 2023 12:13:51 +0000
Message-ID: <50f1a97d-368a-e36f-2065-89314baa898b@suse.de>
Date: Fri, 2 Jun 2023 14:13:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH] mailmap: Add missing email address
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
References: <20230531133724.133872-1-maxime@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230531133724.133872-1-maxime@cerno.tech>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------aCBAwXE6OCdOTZ7c03Afss81"
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------aCBAwXE6OCdOTZ7c03Afss81
Content-Type: multipart/mixed; boundary="------------dJQOAUyJ1zw0shiJtET0JlNo";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.freedesktop.org
Message-ID: <50f1a97d-368a-e36f-2065-89314baa898b@suse.de>
Subject: Re: [PATCH] mailmap: Add missing email address
References: <20230531133724.133872-1-maxime@cerno.tech>
In-Reply-To: <20230531133724.133872-1-maxime@cerno.tech>

--------------dJQOAUyJ1zw0shiJtET0JlNo
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDMxLjA1LjIzIHVtIDE1OjM3IHNjaHJpZWIgTWF4aW1lIFJpcGFyZDoNCj4gSSd2
ZSBiZWVuIHVzaW5nIHRoYXQgZW1haWwgYWRkcmVzcyBmb3IgY29udHJpYnV0aW9ucyBmb3Ig
YSB3aGlsZSBidXQgaXQNCj4gc2VlbXMgSSBuZXZlciBhZGRlZCBpdCB0byBtYWlsbWFwLg0K
PiANCj4gU2lnbmVkLW9mZi1ieTogTWF4aW1lIFJpcGFyZCA8bWF4aW1lQGNlcm5vLnRlY2g+
DQoNCkFja2VkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4N
Cg0KPiAtLS0NCj4gICAubWFpbG1hcCB8IDEgKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKQ0KPiANCj4gZGlmZiAtLWdpdCBhLy5tYWlsbWFwIGIvLm1haWxtYXANCj4g
aW5kZXggYTI4OWIyNWVhMmM3Li5jMTRlZWZlZDI1OWMgMTAwNjQ0DQo+IC0tLSBhLy5tYWls
bWFwDQo+ICsrKyBiLy5tYWlsbWFwDQo+IEBAIC0zMzEsNiArMzMxLDcgQEAgTWF1cm8gQ2Fy
dmFsaG8gQ2hlaGFiIDxtY2hlaGFiQGtlcm5lbC5vcmc+IDxtLmNoZWhhYkBzYW1zdW5nLmNv
bT4NCj4gICBNYXVybyBDYXJ2YWxobyBDaGVoYWIgPG1jaGVoYWJAa2VybmVsLm9yZz4gPG1j
aGVoYWJAcy1vcGVuc291cmNlLmNvbT4NCj4gICBNYXhpbSBNaWtpdHlhbnNraXkgPG1heHRy
YW05NUBnbWFpbC5jb20+IDxtYXhpbW1pQG1lbGxhbm94LmNvbT4NCj4gICBNYXhpbSBNaWtp
dHlhbnNraXkgPG1heHRyYW05NUBnbWFpbC5jb20+IDxtYXhpbW1pQG52aWRpYS5jb20+DQo+
ICtNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+IDxtYXhpbWVAY2Vybm8udGVj
aD4NCj4gICBNYXhpbWUgUmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+IDxtYXhpbWUucmlw
YXJkQGJvb3RsaW4uY29tPg0KPiAgIE1heGltZSBSaXBhcmQgPG1yaXBhcmRAa2VybmVsLm9y
Zz4gPG1heGltZS5yaXBhcmRAZnJlZS1lbGVjdHJvbnMuY29tPg0KPiAgIE1heXVyZXNoIEph
bm9ya2FyIDxtYXl1ckB0aS5jb20+DQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBo
aWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkg
R21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdG
OiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1v
ZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------dJQOAUyJ1zw0shiJtET0JlNo--

--------------aCBAwXE6OCdOTZ7c03Afss81
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmR53P4FAwAAAAAACgkQlh/E3EQov+BV
tBAAtAO+fXabAhlycj/spxQhFnyaQvK65GvShBulYqHrkbulHeWzSHCskmpUlydkDtWsF883Kxvy
t0hgadksfiUXzLv4lhMBLoXSTwac/2galfIaTbIb4Bov9rleUbj4ma1cIrI1Bm2yBKdjQ+A2Rs1K
4lu827WnaSyi4f7MdpyFKb6hw80FsiUVyFETENPlLcP0DLI6Ng6hRt85HKbKbgwz3olDI5j0FuoH
R0FCxS+wBvZUvnYvFU3QRcaumhZOUrNFMmODZKMNZjfDihfqblQPZJy6kMiRaoMzSLiVblzB6Dnn
NyH4M/IWx1bVwAYu0B/FAuRVz6T7Cy9a64nIiuaokdJWggCca7bPkmgOVLdIyamtou/cdTaUzryq
UQhwNpOML8avCI8JH627mi+28vc17OkZuegROURh0fi1s3lW13xv1SDyrBDOWdCILW4oJvhTZQ9n
YjA/lHXDHlCKVZGtO+rQCcOjPkjNy30t7CnViO0IJTCB2XwrNwhE7xG70o4m5mHX+rPRdtrhUNL/
Q/Ya2BmeCSixeiN5ByIsNBms0oRYev5eqlyW/4yOS/rn74l0j7GRG+N8QgDDa2M0v17omJAJtx4S
VnM3snAp5iZEPyvAoFlgcISy4JVrHJ1DyH92cefjnJb4cmh6aLd6sKpYBo7vR62A0Gj0r0A7iG6s
egk=
=/jsW
-----END PGP SIGNATURE-----

--------------aCBAwXE6OCdOTZ7c03Afss81--
