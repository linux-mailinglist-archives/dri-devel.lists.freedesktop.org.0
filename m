Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A08867BB7C
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 20:56:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4144310E85B;
	Wed, 25 Jan 2023 19:56:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BB2810E85B
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jan 2023 19:56:20 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E25A121CD7;
 Wed, 25 Jan 2023 19:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1674676578; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0k6N5kE57VZVpq+fQtdtp8c94mweCUDz7pBZZ4tonHA=;
 b=UHW9RuYEXRBi8OPXL3b8MT8caa9jQf7FKYlLxE9Rc6ucbIsly/YkqCLHESRcRlxG5DNa5E
 CiuaZ+sJW8CeZEZUgT5jf80dWOhGg17H4pm3AtsfY6IkmvvsAx/RbObXHDHu1moABSLDOT
 RXXWjFbHd0zfQMpxS4qj5y4qXdwEBAI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1674676578;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0k6N5kE57VZVpq+fQtdtp8c94mweCUDz7pBZZ4tonHA=;
 b=gQ4MBHWKgLDAT7A56WFDOH9YMgBcyeCxVFFvcjTLfqW/CSU95E4orj77XXEGLBupsC3/xA
 SNiapv5D7No/efBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 992C31339E;
 Wed, 25 Jan 2023 19:56:18 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 7tRlJGKJ0WN6dAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 25 Jan 2023 19:56:18 +0000
Message-ID: <82ad8c89-9d6a-ffa8-e2ad-7b53ac27cafb@suse.de>
Date: Wed, 25 Jan 2023 20:56:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] drm/ssd130x: Init display before the SSD130X_DISPLAY_ON
 command
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20230125184230.3343206-1-javierm@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230125184230.3343206-1-javierm@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------sNf0DUNwwdHy7oxjUmXOZkda"
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
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------sNf0DUNwwdHy7oxjUmXOZkda
Content-Type: multipart/mixed; boundary="------------Z3tK6Z4kby7W05R2Xt4Vf69v";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
Message-ID: <82ad8c89-9d6a-ffa8-e2ad-7b53ac27cafb@suse.de>
Subject: Re: [PATCH] drm/ssd130x: Init display before the SSD130X_DISPLAY_ON
 command
References: <20230125184230.3343206-1-javierm@redhat.com>
In-Reply-To: <20230125184230.3343206-1-javierm@redhat.com>

--------------Z3tK6Z4kby7W05R2Xt4Vf69v
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDI1LjAxLjIzIHVtIDE5OjQyIHNjaHJpZWIgSmF2aWVyIE1hcnRpbmV6IENhbmls
bGFzOg0KPiBDb21taXQgNjIyMTEzYjlmMTFmICgiZHJtL3NzZDEzMHg6IFJlcGxhY2Ugc2lt
cGxlIGRpc3BsYXkgaGVscGVycyB3aXRoIHRoZQ0KPiBhdG9taWMgaGVscGVycyIpIGNoYW5n
ZWQgdGhlIGRyaXZlciB0byBqdXN0IHVzZSB0aGUgYXRvbWljIGhlbHBlcnMgaW5zdGVhZA0K
PiBvZiB0aGUgc2ltcGxlIEtNUyBhYnN0cmFjdGlvbiBsYXllci4NCj4gDQo+IEJ1dCB0aGUg
Y29tbWl0IGFsc28gbWFkZSBhIHN1YnRsZSBjaGFuZ2Ugb24gdGhlIGRpc3BsYXkgcG93ZXIg
c2VxdWVuY2UgYW5kDQo+IGluaXRpYWxpemF0aW9uIG9yZGVyLCBieSBtb3ZpbmcgdGhlIHNz
ZDEzMHhfcG93ZXJfb24oKSBjYWxsIHRvIHRoZSBlbmNvZGVyDQo+IC5hdG9taWNfZW5hYmxl
IGhhbmRsZXIgYW5kIHRoZSBzc2QxMzB4X2luaXQoKSBjYWxsIHRvIENSVEMgLnJlc2V0IGhh
bmRsZXIuDQo+IA0KPiBCZWZvcmUgdGhpcyBjaGFuZ2UsIGJvdGggc3NkMTMweF9wb3dlcl9v
bigpIGFuZCBzc2QxMzB4X2luaXQoKSB3ZXJlIGNhbGxlZA0KPiBpbiB0aGUgc2ltcGxlIGRp
c3BsYXkgcGlwZWxpbmUgLmVuYWJsZSBoYW5kbGVyLCBzbyB0aGUgZGlzcGxheSB3YXMgYWxy
ZWFkeQ0KPiBpbml0aWFsaXplZCBieSB0aGUgdGltZSB0aGUgU1NEMTMwWF9ESVNQTEFZX09O
IGNvbW1hbmQgd2FzIHNlbnQuDQo+IA0KPiBGb3Igc29tZSByZWFzb25zLCBpdCBvbmx5IG1h
ZGUgdGhlIHNzZDEzMHggU1BJIGRyaXZlciB0byBmYWlsIGJ1dCB0aGUgSTJDDQo+IHdhcyBz
dGlsbCB3b3JraW5nLiBUaGF0IGlzIHRoZSByZWFzb24gd2h5IHRoZSBidWcgd2FzIG5vdCBu
b3RpY2VkIGJlZm9yZS4NCj4gDQo+IFRvIHJldmVydCB0byB0aGUgb2xkIGRyaXZlciBiZWhh
dmlvciwgbW92ZSB0aGUgc3NkMTMweF9pbml0KCkgY2FsbCB0byB0aGUNCj4gZW5jb2RlciAu
YXRvbWljX2VuYWJsZSBhcyB3ZWxsLiBCZXNpZGVzIGZpeGluZyB0aGUgcGFuZWwgbm90IGJl
aW5nIHR1cm5lZA0KPiBvbiB3aGVuIHVzaW5nIFNQSSwgaXQgYWxzbyBnZXRzIHJpZCBvZiB0
aGUgY3VzdG9tIENSVEMgLnJlc2V0IGNhbGxiYWNrLg0KPiANCj4gRml4ZXM6IDYyMjExM2I5
ZjExZiAoImRybS9zc2QxMzB4OiBSZXBsYWNlIHNpbXBsZSBkaXNwbGF5IGhlbHBlcnMgd2l0
aCB0aGUgYXRvbWljIGhlbHBlcnMiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBKYXZpZXIgTWFydGlu
ZXogQ2FuaWxsYXMgPGphdmllcm1AcmVkaGF0LmNvbT4NCg0KUmV2aWV3ZWQtYnk6IFRob21h
cyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KDQo+IC0tLQ0KPiANCj4gICBk
cml2ZXJzL2dwdS9kcm0vc29sb21vbi9zc2QxMzB4LmMgfCAxOCArKysrKysrLS0tLS0tLS0t
LS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMo
LSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc29sb21vbi9zc2QxMzB4
LmMgYi9kcml2ZXJzL2dwdS9kcm0vc29sb21vbi9zc2QxMzB4LmMNCj4gaW5kZXggYjE2MzMw
YThiNjI0Li44Y2JmNWFhNjZlMTkgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9z
b2xvbW9uL3NzZDEzMHguYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vc29sb21vbi9zc2Qx
MzB4LmMNCj4gQEAgLTY2MywxOCArNjYzLDggQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1f
Y3J0Y19oZWxwZXJfZnVuY3Mgc3NkMTMweF9jcnRjX2hlbHBlcl9mdW5jcyA9IHsNCj4gICAJ
LmF0b21pY19jaGVjayA9IGRybV9jcnRjX2hlbHBlcl9hdG9taWNfY2hlY2ssDQo+ICAgfTsN
Cj4gICANCj4gLXN0YXRpYyB2b2lkIHNzZDEzMHhfY3J0Y19yZXNldChzdHJ1Y3QgZHJtX2Ny
dGMgKmNydGMpDQo+IC17DQo+IC0Jc3RydWN0IGRybV9kZXZpY2UgKmRybSA9IGNydGMtPmRl
djsNCj4gLQlzdHJ1Y3Qgc3NkMTMweF9kZXZpY2UgKnNzZDEzMHggPSBkcm1fdG9fc3NkMTMw
eChkcm0pOw0KPiAtDQo+IC0Jc3NkMTMweF9pbml0KHNzZDEzMHgpOw0KPiAtDQo+IC0JZHJt
X2F0b21pY19oZWxwZXJfY3J0Y19yZXNldChjcnRjKTsNCj4gLX0NCj4gLQ0KPiAgIHN0YXRp
YyBjb25zdCBzdHJ1Y3QgZHJtX2NydGNfZnVuY3Mgc3NkMTMweF9jcnRjX2Z1bmNzID0gew0K
PiAtCS5yZXNldCA9IHNzZDEzMHhfY3J0Y19yZXNldCwNCj4gKwkucmVzZXQgPSBkcm1fYXRv
bWljX2hlbHBlcl9jcnRjX3Jlc2V0LA0KPiAgIAkuZGVzdHJveSA9IGRybV9jcnRjX2NsZWFu
dXAsDQo+ICAgCS5zZXRfY29uZmlnID0gZHJtX2F0b21pY19oZWxwZXJfc2V0X2NvbmZpZywN
Cj4gICAJLnBhZ2VfZmxpcCA9IGRybV9hdG9taWNfaGVscGVyX3BhZ2VfZmxpcCwNCj4gQEAg
LTY5Myw2ICs2ODMsMTIgQEAgc3RhdGljIHZvaWQgc3NkMTMweF9lbmNvZGVyX2hlbHBlcl9h
dG9taWNfZW5hYmxlKHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlciwNCj4gICAJaWYgKHJl
dCkNCj4gICAJCXJldHVybjsNCj4gICANCj4gKwlyZXQgPSBzc2QxMzB4X2luaXQoc3NkMTMw
eCk7DQo+ICsJaWYgKHJldCkgew0KPiArCQlzc2QxMzB4X3Bvd2VyX29mZihzc2QxMzB4KTsN
Cj4gKwkJcmV0dXJuOw0KPiArCX0NCj4gKw0KPiAgIAlzc2QxMzB4X3dyaXRlX2NtZChzc2Qx
MzB4LCAxLCBTU0QxMzBYX0RJU1BMQVlfT04pOw0KPiAgIA0KPiAgIAliYWNrbGlnaHRfZW5h
YmxlKHNzZDEzMHgtPmJsX2Rldik7DQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBo
aWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkg
R21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2
ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------Z3tK6Z4kby7W05R2Xt4Vf69v--

--------------sNf0DUNwwdHy7oxjUmXOZkda
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPRiWIFAwAAAAAACgkQlh/E3EQov+C7
CxAAiiI4/gJIcoiJgRDtIrFnPOmqPKEnXk9pIG5Q4s+y9soTfsSTrY91eDcsmaU95RXOFocTb2b3
lenDoKkbuZ1f4lGO9WA6Ef6tpeZSiCqXsK64Z9VvYl2eq54RA7amOK5dMqqM0jFHaszUIi71ZoTw
T3+7eWRRQ0oc3dnFRutjuN1cQqyrdYTMmRhuNvJewOWx0FC4QM4blDq4mWcJEYcx9b98gumALKPh
jx9IsXLvEoTcMlNdNgT9RHPaOL0W8HVtmZ+TL4uXer9LV3duCMg5ZPFu5Xizzrn01xC9vVIMfNb4
HQozKE4nHB6r+W/3yGMsBf6WmdwMs87XK8suRDnpw1Lmjn4T51uVHuaqDWO2ZNi8nlG5mGvQTQz0
fAo/v4eyx1gIn7t/ZYOHmFz9rRga2QNYAmYSJOf5Y+VswBf0M2mclO5RGuUHlgcUlL2lKSCA66/W
cuD3kXW4MldHDSxaMpWami/g4mNCvXTmSRnY0fOBvq9LcvwbgJ+EvV+KmE7UIwY0XYCGdA9OEynD
2xzlLUykIjwP9jMwSIPiHUQliK2Ps6XKPuF7vY49aMaLzEYwCoC7lkj9yjNpihJfnA+VPRzp42SI
Rircf9u5974M3q2rK99S5DpZyyXBUSYaLFqXwEWyeSOzPpBQDzqRNdqivp1+ZjANJSshq05YGaWS
IQ4=
=WpXs
-----END PGP SIGNATURE-----

--------------sNf0DUNwwdHy7oxjUmXOZkda--
