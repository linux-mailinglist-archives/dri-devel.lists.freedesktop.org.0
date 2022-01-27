Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6245D49DF73
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 11:29:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 844E710E8A4;
	Thu, 27 Jan 2022 10:29:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E207610EE46
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 10:29:54 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 92BD6218FA;
 Thu, 27 Jan 2022 10:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1643279393; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k+7bp/aW0AFpzZxFdq7tylcGZe85zu4f9lodF9imttM=;
 b=LHHmiaycY5xdsp0S5Mlg9u1HVRJxy+qm7mc/vDAnM3ZA/TQdEiqe33OQZ6xA08SLN60jWe
 Xcb0Amq1rtrBPdJmb10msICI1yYO19k16RDnrwjdst5t9gR83pDHkENeGSek1uNHd8xVK2
 XOFUTHIZ5BfDUHD80TP4T/K5liNSdv0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1643279393;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k+7bp/aW0AFpzZxFdq7tylcGZe85zu4f9lodF9imttM=;
 b=xEaHYB/hrB7oTFpYHwCcy0ITgCgMSntVS406+WLCATn6lwztJoQVTcpctjfU+/Cq7WKgB0
 rStxedAzZTz27UBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7323B13F73;
 Thu, 27 Jan 2022 10:29:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id bOkeGyF08mHgQQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 27 Jan 2022 10:29:53 +0000
Message-ID: <673d9748-c4ea-9044-a342-d1eb3d5ffc91@suse.de>
Date: Thu, 27 Jan 2022 11:29:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/fb-helper: Mark screen buffers in system memory with
 FB_VIRTFB
Content-Language: en-US
To: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
References: <20220127102621.30047-1-tzimmermann@suse.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220127102621.30047-1-tzimmermann@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------gILQLpkUJRhJU6rVuMqL5f04"
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
--------------gILQLpkUJRhJU6rVuMqL5f04
Content-Type: multipart/mixed; boundary="------------rSxo0d6BnVDk033qa0FLapr0";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org
Message-ID: <673d9748-c4ea-9044-a342-d1eb3d5ffc91@suse.de>
Subject: Re: [PATCH] drm/fb-helper: Mark screen buffers in system memory with
 FB_VIRTFB
References: <20220127102621.30047-1-tzimmermann@suse.de>
In-Reply-To: <20220127102621.30047-1-tzimmermann@suse.de>

--------------rSxo0d6BnVDk033qa0FLapr0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDI3LjAxLjIyIHVtIDExOjI2IHNjaHJpZWIgVGhvbWFzIFppbW1lcm1hbm46DQo+
IE1hcmsgc2NyZWVuIGJ1ZmZlcnMgaW4gc3lzdGVtIG1lbW9yeSB3aXRoIEZCX1ZJUlRGQi4g
T3RoZXJ3aXNlLCB0aGUNCg0KRkJJTkZPXyBpcyB0aGUgbmFtZS4gV2lsbCBiZSBmaXhlZCBi
ZWZvcmUgbWVyZ2luZw0KDQo+IGJ1ZmZlcnMgYXJlIG1tYXAnZWQgYXMgSS9PIG1lbW9yeSAo
aS5lLiwgVk1fSU8pLiBGb3Igc2hhZG93IGJ1ZmZlcnMsDQo+IGFsc28gc2V0IHRoZSBGQl9S
RUFEU19GQVNUIGhpbnQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFu
biA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2Ry
bV9mYl9oZWxwZXIuYyB8IDkgKysrKysrLS0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDYgaW5z
ZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxw
ZXIuYw0KPiBpbmRleCBlZDQzYjk4N2QzMDYuLmYxNTEyN2EzMmY3YSAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYw0KPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vZHJtX2ZiX2hlbHBlci5jDQo+IEBAIC0yMzQ2LDYgKzIzNDYsNyBAQCBzdGF0aWMg
aW50IGRybV9mYl9oZWxwZXJfZ2VuZXJpY19wcm9iZShzdHJ1Y3QgZHJtX2ZiX2hlbHBlciAq
ZmJfaGVscGVyLA0KPiAgIAlmYmktPmZib3BzID0gJmRybV9mYmRldl9mYl9vcHM7DQo+ICAg
CWZiaS0+c2NyZWVuX3NpemUgPSBzaXplcy0+c3VyZmFjZV9oZWlnaHQgKiBmYi0+cGl0Y2hl
c1swXTsNCj4gICAJZmJpLT5maXguc21lbV9sZW4gPSBmYmktPnNjcmVlbl9zaXplOw0KPiAr
CWZiaS0+ZmxhZ3MgPSBGQklORk9fREVGQVVMVDsNCj4gICANCj4gICAJZHJtX2ZiX2hlbHBl
cl9maWxsX2luZm8oZmJpLCBmYl9oZWxwZXIsIHNpemVzKTsNCj4gICANCj4gQEAgLTIzNTMs
MTkgKzIzNTQsMjEgQEAgc3RhdGljIGludCBkcm1fZmJfaGVscGVyX2dlbmVyaWNfcHJvYmUo
c3RydWN0IGRybV9mYl9oZWxwZXIgKmZiX2hlbHBlciwNCj4gICAJCWZiaS0+c2NyZWVuX2J1
ZmZlciA9IHZ6YWxsb2MoZmJpLT5zY3JlZW5fc2l6ZSk7DQo+ICAgCQlpZiAoIWZiaS0+c2Ny
ZWVuX2J1ZmZlcikNCj4gICAJCQlyZXR1cm4gLUVOT01FTTsNCj4gKwkJZmJpLT5mbGFncyB8
PSBGQklORk9fVklSVEZCIHwgRkJJTkZPX1JFQURTX0ZBU1Q7DQo+ICAgDQo+ICAgCQlmYmkt
PmZiZGVmaW8gPSAmZHJtX2ZiZGV2X2RlZmlvOw0KPiAtDQo+ICAgCQlmYl9kZWZlcnJlZF9p
b19pbml0KGZiaSk7DQo+ICAgCX0gZWxzZSB7DQo+ICAgCQkvKiBidWZmZXIgaXMgbWFwcGVk
IGZvciBIVyBmcmFtZWJ1ZmZlciAqLw0KPiAgIAkJcmV0ID0gZHJtX2NsaWVudF9idWZmZXJf
dm1hcChmYl9oZWxwZXItPmJ1ZmZlciwgJm1hcCk7DQo+ICAgCQlpZiAocmV0KQ0KPiAgIAkJ
CXJldHVybiByZXQ7DQo+IC0JCWlmIChtYXAuaXNfaW9tZW0pDQo+ICsJCWlmIChtYXAuaXNf
aW9tZW0pIHsNCj4gICAJCQlmYmktPnNjcmVlbl9iYXNlID0gbWFwLnZhZGRyX2lvbWVtOw0K
PiAtCQllbHNlDQo+ICsJCX0gZWxzZSB7DQo+ICAgCQkJZmJpLT5zY3JlZW5fYnVmZmVyID0g
bWFwLnZhZGRyOw0KPiArCQkJZmJpLT5mbGFncyB8PSBGQklORk9fVklSVEZCOw0KPiArCQl9
DQo+ICAgDQo+ICAgCQkvKg0KPiAgIAkJICogU2hhbWVsZXNzbHkgbGVhayB0aGUgcGh5c2lj
YWwgYWRkcmVzcyB0byB1c2VyLXNwYWNlLiBBcw0KDQotLSANClRob21hcyBaaW1tZXJtYW5u
DQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBH
ZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0K
KEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rl
dg0K

--------------rSxo0d6BnVDk033qa0FLapr0--

--------------gILQLpkUJRhJU6rVuMqL5f04
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmHydCAFAwAAAAAACgkQlh/E3EQov+A0
MQ/6A5FLnQCd9R8rl+5Uo1g4+DkIgl35tOim6drfNahyher/rCG1apEm3aXpRXVUGgLjWTSPvLnB
YQ56fCkZN24EOdDUtrRv7L/jGY/1yA8axjvEcoqUXXivK0FxrZZ/JQzNyLJZp/AkNJipXEHv9nPG
hXazsYCKtaErWhQSuY7LlXhyLM+FkogxDlX96hHu+B2z84ynweelm/PgL3zo/Xv//5jIAbwVyIpS
K8quxcb4iKIcPct43Liluc/5UtTMmN+tfOmcqYxCAGmEqumbUts6CwMitEzt0LrczcnjZsh9dW3Y
K6jItXRNQ6ZuPu67HwnYzD1drlWM/mTO+MpaqULO4EaNsOubskB7MDGBti8e//JQdx4SPkCXDqAj
R1Hjm31bsYJBWo0+TM1mxeEFiL0oxNkhXJlRS7LUZq+l+qTraY3SYQgtQquNB4LoDaRWYq3g26f4
vgiZ0pWrLOVWrn2QPxejselGzwodobUfYkZWp59FH8l4KpaChbgM3Nqjo/J6b7sLAF950WqsmUfe
I8nuwA3XwtZR/aXlgwPuThL8KAVb6GUmO+nCGDeZPHY7h8K87Wn142VNSqxGE02D8DQktBsv8FGf
bINmSE7/yNVC03esEWk/o9ycczcniGFgPR/cVojzy7behLZKikpiEbdIj3HL8VDS+ZV8VsbxJiuF
4js=
=P34F
-----END PGP SIGNATURE-----

--------------gILQLpkUJRhJU6rVuMqL5f04--
