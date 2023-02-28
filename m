Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 962186A542E
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 09:11:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CA6910E4B2;
	Tue, 28 Feb 2023 08:11:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5130810E4B2
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 08:11:15 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B93F71FDC3;
 Tue, 28 Feb 2023 08:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1677571873; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eB7VzrwsfNeZQQWEzBTFCA6Ns/th+yjCySvbiMKUaYI=;
 b=PuoFJu/W4Bk63GOIH4BfpPy+hmoyu+i7b3YoQ+tMvQzypvsuzMSUml13cUzklbyTHcgXLh
 MOpOORwhwb6z94//xv38UswH/QQu5QQH6EXBEcDL92pTeuVo5GAAePWL6Afmd15IiAFKHU
 rXcDKJoHSJm2jHkvg/7VMGfdJy05dZ4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1677571873;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eB7VzrwsfNeZQQWEzBTFCA6Ns/th+yjCySvbiMKUaYI=;
 b=ovmkV/MDpa+zBhiXvk03XhlHZJXOUUDfLaE3NOPYdzr2u2Yr5jl0YtVI1o3gJf7FSbg9PE
 l+8/vp2b7h67SBBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8BFFB1333C;
 Tue, 28 Feb 2023 08:11:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +MJAISG3/WP9DwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 28 Feb 2023 08:11:13 +0000
Message-ID: <461f3a89-53d0-4a80-2d9b-0d3d648e1405@suse.de>
Date: Tue, 28 Feb 2023 09:11:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] drm/vram-helper: fix function names in vram helper doc
To: Luc Ma <onion0709@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <63fd57cb.620a0220.4e1b.8886@mx.google.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <63fd57cb.620a0220.4e1b.8886@mx.google.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------FbLabhrzYMnpImjYo3IhHy0K"
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
--------------FbLabhrzYMnpImjYo3IhHy0K
Content-Type: multipart/mixed; boundary="------------ux3ot5d93FfytfKQUaxIeWYc";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Luc Ma <onion0709@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <461f3a89-53d0-4a80-2d9b-0d3d648e1405@suse.de>
Subject: Re: [PATCH v2] drm/vram-helper: fix function names in vram helper doc
References: <63fd57cb.620a0220.4e1b.8886@mx.google.com>
In-Reply-To: <63fd57cb.620a0220.4e1b.8886@mx.google.com>

--------------ux3ot5d93FfytfKQUaxIeWYc
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjguMDIuMjMgdW0gMDI6MjQgc2NocmllYiBMdWMgTWE6DQo+IFJlZmVyIHRv
IGRybW1fdnJhbV9oZWxwZXJfaW5pdCgpIGluc3RlYWQgb2YgdGhlIG5vbi1leGlzdGVudA0K
PiBkcm1tX3ZyYW1faGVscGVyX2FsbG9jX21tKCkuDQo+IA0KPiBGaXhlczogYTVmMjNhNzIz
NTVkICgiZHJtL3ZyYW0taGVscGVyOiBNYW5hZ2VkIHZyYW0gaGVscGVycyIpDQo+IFNpZ25l
ZC1vZmYtYnk6IEx1YyBNYSA8bHVjQHNpZXRpdW0uY29tPg0KDQpJIGRpZG4ndCBub3RpY2Ug
YmVmb3JlOiB5b3VyIHNlbmRlciBlbWFpbCBhZGRyZXNzIGhhcyB0byBtYXRjaCB0aGUgDQpz
aWduZWQtb2ZmLWJ5IGFkZHJlc3MuIEkgY2FuIGZpeCB0aGF0IHdoZW4gSSBjb21taXQgdGhl
IHBhdGNoLiBXaGljaCANCmVtYWlsIGFkZHJlc3Mgc2hhbGwgSSB1c2U/DQoNCkFwYXJ0IGZy
b20gdGhhdA0KDQpSZXZpZXdlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5u
QHN1c2UuZGU+DQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gLS0tDQo+IHYxIC0+IHYy
OiBpbXByb3ZlZCBjb21taXQgbWVzc2FnZSBhbmQgYWRkIGNoYW5nZWxvZw0KPiANCj4gICBk
cml2ZXJzL2dwdS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5jIHwgNiArKystLS0NCj4gICAx
IGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5jDQo+IGluZGV4IGQ0MGIzZWRi
NTJkMC4uZjE1MzlkNDQ0OGM2IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJt
X2dlbV92cmFtX2hlbHBlci5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3Zy
YW1faGVscGVyLmMNCj4gQEAgLTQ1LDcgKzQ1LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBk
cm1fZ2VtX29iamVjdF9mdW5jcyBkcm1fZ2VtX3ZyYW1fb2JqZWN0X2Z1bmNzOw0KPiAgICAq
IHRoZSBmcmFtZSdzIHNjYW5vdXQgYnVmZmVyIG9yIHRoZSBjdXJzb3IgaW1hZ2UuIElmIHRo
ZXJlJ3Mgbm8gbW9yZSBzcGFjZQ0KPiAgICAqIGxlZnQgaW4gVlJBTSwgaW5hY3RpdmUgR0VN
IG9iamVjdHMgY2FuIGJlIG1vdmVkIHRvIHN5c3RlbSBtZW1vcnkuDQo+ICAgICoNCj4gLSAq
IFRvIGluaXRpYWxpemUgdGhlIFZSQU0gaGVscGVyIGxpYnJhcnkgY2FsbCBkcm1tX3ZyYW1f
aGVscGVyX2FsbG9jX21tKCkuDQo+ICsgKiBUbyBpbml0aWFsaXplIHRoZSBWUkFNIGhlbHBl
ciBsaWJyYXJ5IGNhbGwgZHJtbV92cmFtX2hlbHBlcl9pbml0KCkuDQo+ICAgICogVGhlIGZ1
bmN0aW9uIGFsbG9jYXRlcyBhbmQgaW5pdGlhbGl6ZXMgYW4gaW5zdGFuY2Ugb2YgJnN0cnVj
dCBkcm1fdnJhbV9tbQ0KPiAgICAqIGluICZzdHJ1Y3QgZHJtX2RldmljZS52cmFtX21tIC4g
VXNlICZEUk1fR0VNX1ZSQU1fRFJJVkVSIHRvIGluaXRpYWxpemUNCj4gICAgKiAmc3RydWN0
IGRybV9kcml2ZXIgYW5kICAmRFJNX1ZSQU1fTU1fRklMRV9PUEVSQVRJT05TIHRvIGluaXRp
YWxpemUNCj4gQEAgLTczLDcgKzczLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZ2Vt
X29iamVjdF9mdW5jcyBkcm1fZ2VtX3ZyYW1fb2JqZWN0X2Z1bmNzOw0KPiAgICAqCQkvLyBz
ZXR1cCBkZXZpY2UsIHZyYW0gYmFzZSBhbmQgc2l6ZQ0KPiAgICAqCQkvLyAuLi4NCj4gICAg
Kg0KPiAtICoJCXJldCA9IGRybW1fdnJhbV9oZWxwZXJfYWxsb2NfbW0oZGV2LCB2cmFtX2Jh
c2UsIHZyYW1fc2l6ZSk7DQo+ICsgKgkJcmV0ID0gZHJtbV92cmFtX2hlbHBlcl9pbml0KGRl
diwgdnJhbV9iYXNlLCB2cmFtX3NpemUpOw0KPiAgICAqCQlpZiAocmV0KQ0KPiAgICAqCQkJ
cmV0dXJuIHJldDsNCj4gICAgKgkJcmV0dXJuIDA7DQo+IEBAIC04Niw3ICs4Niw3IEBAIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2dlbV9vYmplY3RfZnVuY3MgZHJtX2dlbV92cmFtX29i
amVjdF9mdW5jczsNCj4gICAgKiB0byB1c2Vyc3BhY2UuDQo+ICAgICoNCj4gICAgKiBZb3Ug
ZG9uJ3QgaGF2ZSB0byBjbGVhbiB1cCB0aGUgaW5zdGFuY2Ugb2YgVlJBTSBNTS4NCj4gLSAq
IGRybW1fdnJhbV9oZWxwZXJfYWxsb2NfbW0oKSBpcyBhIG1hbmFnZWQgaW50ZXJmYWNlIHRo
YXQgaW5zdGFsbHMgYQ0KPiArICogZHJtbV92cmFtX2hlbHBlcl9pbml0KCkgaXMgYSBtYW5h
Z2VkIGludGVyZmFjZSB0aGF0IGluc3RhbGxzIGENCj4gICAgKiBjbGVhbi11cCBoYW5kbGVy
IHRvIHJ1biBkdXJpbmcgdGhlIERSTSBkZXZpY2UncyByZWxlYXNlLg0KPiAgICAqDQo+ICAg
ICogRm9yIGRyYXdpbmcgb3Igc2Nhbm91dCBvcGVyYXRpb25zLCByc3AuIGJ1ZmZlciBvYmpl
Y3RzIGhhdmUgdG8gYmUgcGlubmVkDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBo
aWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkg
R21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2
ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------ux3ot5d93FfytfKQUaxIeWYc--

--------------FbLabhrzYMnpImjYo3IhHy0K
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmP9tyAFAwAAAAAACgkQlh/E3EQov+B1
3w/9FkZuySIEXRNzLPDEntA1fhN1g5MgN6mdJfCmsJ0S5USmnfWFD1GaCzCN6ZLkaZbCoue5BcJG
8Z88kWGtwb+DexWXGxmWSsjGCPvkrEpFX84Am+gDVPtbBnoUXk+0LUiPhGV7D6GXQWl1Wx012c1B
EVAX+1h7enbjbC/2tqQqcfRhVnU2HdGTqlksVoeq7PaM/AKNM13Q7qAI5cdVmfGJy8kZSs2u0nbw
X0sQRABg2W3Nu1dPE7DVkbttT1wfZu8HvgRbAY3T5E+hH+G4yJe8kBL6OmSF9I9YQpID0/vbrMXW
PNDivoo11h3aXH0fKpgEnACaFVtKghJb3Vt5+0dpOacf3vv0IP2Emq37E2hYFeCmNnJxpT2UJ7ZB
Q8iMTsdbCxxi0X/5cT164uVBmSonVXVU+XGIjaauATlPsRVtC8Nft8O3w66d7a2TpOUHSLpoz3nq
cdD+Os6bcqcFCawGE8HDJIXvFr8xHkS7DENqLtZd7Hfz+LaByIJuhXfHbD0YzheRFrBceYFPq1Rx
ZlZ0U61XMr/wlaKqY8LEaLb0QYDi2PwA5Qsj44PMIF3kHKlFeu1IYnumr4nspYCW+BnFOKz6An3r
VBNiS0j2WVsApX3RB+qe+2FG93BOF3xa+jJWVjdhpnC2oUjTZwdFBgr7Foh+qREHOEZ6jAT8Mu+0
u8o=
=D0Gt
-----END PGP SIGNATURE-----

--------------FbLabhrzYMnpImjYo3IhHy0K--
