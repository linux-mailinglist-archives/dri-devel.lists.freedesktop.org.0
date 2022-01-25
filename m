Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08F3B49ADDD
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 09:17:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03A7410EE47;
	Tue, 25 Jan 2022 08:17:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D37710EE47
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jan 2022 08:17:36 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F2BF81F380;
 Tue, 25 Jan 2022 08:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1643098655; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k74T8QNEE7RRJs0MYsQ1b9WwVvajtW41wbWKa1P0nqs=;
 b=hPGonIOwba5v+UQF53B6zZBcfZf0jUhvEq/62fiiE30KLIk86N0MF1ndc75QILWahi/XAR
 fEOtQYhYXvm4YXSL4UakuhxIveQYJDLLd3QbXAvIzjd3fz7ZARhxU15ZuH8ZxGZCf/0d1e
 YulMPOlo/9Wn/Qpsgp01J1iuIh33zMA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1643098655;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k74T8QNEE7RRJs0MYsQ1b9WwVvajtW41wbWKa1P0nqs=;
 b=tCM3g+Fr8HPogORkr6nzh/qahVP2uRuv9YOPXGjtm8P43Y/08f/whTNZqXGbM+XuDXRpPX
 NZdmgIPo16gEbdDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CB1B513D8D;
 Tue, 25 Jan 2022 08:17:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id M8GAMB6y72GpJAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 25 Jan 2022 08:17:34 +0000
Message-ID: <1d284e6b-f1af-25f1-f7c8-e137dcbb8f1d@suse.de>
Date: Tue, 25 Jan 2022 09:17:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/docs: Document where the C8 color lut is stored
Content-Language: en-US
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20220124194706.930319-1-daniel.vetter@ffwll.ch>
 <20220124221633.952374-1-daniel.vetter@ffwll.ch>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220124221633.952374-1-daniel.vetter@ffwll.ch>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0bvsO8LUUNRETkTSCFas30ZP"
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0bvsO8LUUNRETkTSCFas30ZP
Content-Type: multipart/mixed; boundary="------------S2mMX1EOEyg8K1QpoOv5jQwK";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: David Airlie <airlied@linux.ie>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, Daniel Vetter <daniel.vetter@intel.com>
Message-ID: <1d284e6b-f1af-25f1-f7c8-e137dcbb8f1d@suse.de>
Subject: Re: [PATCH] drm/docs: Document where the C8 color lut is stored
References: <20220124194706.930319-1-daniel.vetter@ffwll.ch>
 <20220124221633.952374-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20220124221633.952374-1-daniel.vetter@ffwll.ch>

--------------S2mMX1EOEyg8K1QpoOv5jQwK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjQuMDEuMjIgdW0gMjM6MTYgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBB
bHNvIGFkZCBub3RlcyB0aGF0IGZvciBhdG9taWMgZHJpdmVycyBpdCdzIHJlYWxseSBzb21l
d2hlcmUgZWxzZSBhbmQNCj4gbm8gbG9uZ2VyIGluIHN0cnVjdCBkcm1fY3J0Yy4NCj4gDQo+
IE1heWJlIHdlIHNob3VsZCBwdXQgYSBiaWdnZXIgd2FybmluZyBoZXJlIHRoYXQgdGhpcyBp
cyBjb25mdXNpbmcsDQo+IHNpbmNlIHRoZSBwaXhlbCBmb3JtYXQgaXMgYSBwbGFuZSBwcm9w
ZXJ0eSwgYnV0IHRoZSBHQU1NQV9MVVQgcHJvcGVydHkNCj4gaXMgb24gdGhlIGNydGMuIEJ1
dCBJIHRoaW5rIHdlIGNhbiBmaXggdGhpcyBpZi93aGVuIHNvbWVvbmUgZmluZHMgYQ0KPiBu
ZWVkIGZvciBhIHBlci1wbGFuZSBDTFVULCBzaW5jZSBJJ20gbm90IHN1cmUgc3VjaCBodyBl
dmVuIGV4aXN0cy4gSSdtDQoNCk9sZGVyIEhXIGhhcyBjdXJzb3IgcGxhbmVzIHdpdGggc2Vw
YXJhdGUgcGFsZXR0ZXM7IDE2IGNvbG9ycyBvbiBNYXRyb3ggDQpJSVJDLiBOb3QgdmVyeSB1
c2VmdWwgZm9yIHVzLCB0aG91Z2guDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gYWxz
byBub3Qgc3VyZSB3aGV0aGVyIGV2ZW4gaGFyZHdhcmUgd2l0aCBhIENMVVQgYW5kIGEgZnVs
bCBjb2xvcg0KPiBjb3JyZWN0aW9uIHBpcGVsaW5lIHdpdGggZGVnYW1tL2NnbS9nYW1tYSBl
eGlzdHMuDQo+IA0KPiBNb3RpdmF0ZWQgYnkgY29tbWVudHMgZnJvbSBHZWVydCB0aGF0IHdl
IGhhdmUgYSBnYXAgaGVyZS4NCj4gDQo+IHYyOiBNb3JlIG5hbWVzIGZvciBjb2xvciBsdXRz
IChMYXVyZW50KS4NCj4gDQo+IENjOiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNo
YXJ0QGlkZWFzb25ib2FyZC5jb20+DQo+IFJldmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0
IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+DQo+IENjOiBHZWVydCBVeXR0
ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPg0KPiBDYzogVmlsbGUgU3lyasOkbMOk
IDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4NCj4gQ2M6IE1hYXJ0ZW4gTGFua2hv
cnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+DQo+IENjOiBNYXhpbWUg
UmlwYXJkIDxtcmlwYXJkQGtlcm5lbC5vcmc+DQo+IENjOiBUaG9tYXMgWmltbWVybWFubiA8
dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51
eC5pZT4NCj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4NCj4gU2lnbmVk
LW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+DQo+IC0t
LQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fY29sb3JfbWdtdC5jIHwgIDQgKysrKw0KPiAg
IGluY2x1ZGUvZHJtL2RybV9jcnRjLmggICAgICAgICAgIHwgMTAgKysrKysrKysrKw0KPiAg
IDIgZmlsZXMgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fY29sb3JfbWdtdC5jIGIvZHJpdmVycy9ncHUvZHJtL2Ry
bV9jb2xvcl9tZ210LmMNCj4gaW5kZXggYmIxNGY0ODhjOGY2Li45MDc5ZmJlMjFkMmYgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29sb3JfbWdtdC5jDQo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9kcm1fY29sb3JfbWdtdC5jDQo+IEBAIC04Miw2ICs4MiwxMCBA
QA0KPiAgICAqCWRyaXZlciBib290LXVwIHN0YXRlIHRvby4gRHJpdmVycyBjYW4gYWNjZXNz
IHRoaXMgYmxvYiB0aHJvdWdoDQo+ICAgICoJJmRybV9jcnRjX3N0YXRlLmdhbW1hX2x1dC4N
Cj4gICAgKg0KPiArICoJTm90ZSB0aGF0IGZvciBtb3N0bHkgaGlzdG9yaWNhbCByZWFzb25z
IHN0ZW1taW5nIGZyb20gWG9yZyBoZXJpdGFnZSwNCj4gKyAqCXRoaXMgaXMgYWxzbyB1c2Vk
IHRvIHN0b3JlIHRoZSBjb2xvciBtYXAgKGFsc28gc29tZXRpbWVzIGNvbG9yIGx1dCwgQ0xV
VA0KPiArICoJb3IgY29sb3IgcGFsZXR0ZSkgZm9yIGluZGV4ZWQgZm9ybWF0cyBsaWtlIERS
TV9GT1JNQVRfQzguDQo+ICsgKg0KPiAgICAqIOKAnEdBTU1BX0xVVF9TSVpF4oCdOg0KPiAg
ICAqCVVuc2lnbmVkIHJhbmdlIHByb3BlcnR5IHRvIGdpdmUgdGhlIHNpemUgb2YgdGhlIGxv
b2t1cCB0YWJsZSB0byBiZSBzZXQNCj4gICAgKglvbiB0aGUgR0FNTUFfTFVUIHByb3BlcnR5
ICh0aGUgc2l6ZSBkZXBlbmRzIG9uIHRoZSB1bmRlcmx5aW5nIGhhcmR3YXJlKS4NCj4gZGlm
ZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9jcnRjLmggYi9pbmNsdWRlL2RybS9kcm1fY3J0
Yy5oDQo+IGluZGV4IDRkMDFiNGQ4OTc3NS4uYTcwYmFlYTA2MzZjIDEwMDY0NA0KPiAtLS0g
YS9pbmNsdWRlL2RybS9kcm1fY3J0Yy5oDQo+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9jcnRj
LmgNCj4gQEAgLTI4NSw2ICsyODUsMTAgQEAgc3RydWN0IGRybV9jcnRjX3N0YXRlIHsNCj4g
ICAJICogTG9va3VwIHRhYmxlIGZvciBjb252ZXJ0aW5nIHBpeGVsIGRhdGEgYWZ0ZXIgdGhl
IGNvbG9yIGNvbnZlcnNpb24NCj4gICAJICogbWF0cml4IEBjdG0uICBTZWUgZHJtX2NydGNf
ZW5hYmxlX2NvbG9yX21nbXQoKS4gVGhlIGJsb2IgKGlmIG5vdA0KPiAgIAkgKiBOVUxMKSBp
cyBhbiBhcnJheSBvZiAmc3RydWN0IGRybV9jb2xvcl9sdXQuDQo+ICsJICoNCj4gKwkgKiBO
b3RlIHRoYXQgZm9yIG1vc3RseSBoaXN0b3JpY2FsIHJlYXNvbnMgc3RlbW1pbmcgZnJvbSBY
b3JnIGhlcml0YWdlLA0KPiArCSAqIHRoaXMgaXMgYWxzbyB1c2VkIHRvIHN0b3JlIHRoZSBj
b2xvciBtYXAgKGFsc28gc29tZXRpbWVzIGNvbG9yIGx1dCwNCj4gKwkgKiBDTFVUIG9yIGNv
bG9yIHBhbGV0dGUpIGZvciBpbmRleGVkIGZvcm1hdHMgbGlrZSBEUk1fRk9STUFUX0M4Lg0K
PiAgIAkgKi8NCj4gICAJc3RydWN0IGRybV9wcm9wZXJ0eV9ibG9iICpnYW1tYV9sdXQ7DQo+
ICAgDQo+IEBAIC0xMDc1LDEyICsxMDc5LDE4IEBAIHN0cnVjdCBkcm1fY3J0YyB7DQo+ICAg
CS8qKg0KPiAgIAkgKiBAZ2FtbWFfc2l6ZTogU2l6ZSBvZiBsZWdhY3kgZ2FtbWEgcmFtcCBy
ZXBvcnRlZCB0byB1c2Vyc3BhY2UuIFNldCB1cA0KPiAgIAkgKiBieSBjYWxsaW5nIGRybV9t
b2RlX2NydGNfc2V0X2dhbW1hX3NpemUoKS4NCj4gKwkgKg0KPiArCSAqIE5vdGUgdGhhdCBh
dG9taWMgZHJpdmVycyBuZWVkIHRvIGluc3RlYWQgdXNlDQo+ICsJICogJmRybV9jcnRjX3N0
YXRlLmdhbW1hX2x1dC4gU2VlIGRybV9jcnRjX2VuYWJsZV9jb2xvcl9tZ210KCkuDQo+ICAg
CSAqLw0KPiAgIAl1aW50MzJfdCBnYW1tYV9zaXplOw0KPiAgIA0KPiAgIAkvKioNCj4gICAJ
ICogQGdhbW1hX3N0b3JlOiBHYW1tYSByYW1wIHZhbHVlcyB1c2VkIGJ5IHRoZSBsZWdhY3kg
U0VUR0FNTUEgYW5kDQo+ICAgCSAqIEdFVEdBTU1BIElPQ1Rscy4gU2V0IHVwIGJ5IGNhbGxp
bmcgZHJtX21vZGVfY3J0Y19zZXRfZ2FtbWFfc2l6ZSgpLg0KPiArCSAqDQo+ICsJICogTm90
ZSB0aGF0IGF0b21pYyBkcml2ZXJzIG5lZWQgdG8gaW5zdGVhZCB1c2UNCj4gKwkgKiAmZHJt
X2NydGNfc3RhdGUuZ2FtbWFfbHV0LiBTZWUgZHJtX2NydGNfZW5hYmxlX2NvbG9yX21nbXQo
KS4NCj4gICAJICovDQo+ICAgCXVpbnQxNl90ICpnYW1tYV9zdG9yZTsNCj4gICANCg0KLS0g
DQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBT
b2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBO
w7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6Rm
dHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------S2mMX1EOEyg8K1QpoOv5jQwK--

--------------0bvsO8LUUNRETkTSCFas30ZP
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmHvsh4FAwAAAAAACgkQlh/E3EQov+AD
VRAAzTJO/ilcdUnRr+ypCZ1IsyfJUdEOtrvI6iybiOY0sOvU8HWinMxogC/noIytlUQqIeobQwVn
LIz8nn27tkvNPEp461cNPGuHWSh1/Hp+X8sqXNG1inY4ULYvImUeU7Khgjvu88CVZLg122Ni7QBH
a77k0toE0D6Qb4rnvRGovCGiO2cPJTPcpLf6lCLuJmsO/SWPCxUNmW2HO+owuI9+W0JMu2WHC2yC
Ws73RibwyY2T10Qo9CZh6yDlNFJoepQH+4Y0g/Typ4d854qMU50mcVJ/E8zvhS+p5ZS5odQN3eLI
ch/gi5yIYjBGO71yvfJJS5t35pa9y4uTKNqCPM5cPRw+FMLOMTS6NPbv2IIIFpeXb2uhJQnhnT7S
HSlje8okGZKt91P+1blNyTmOxxAYmdcORDVmhmTCjOx7HavKwi9iPtFtdEZWTIbrYxgcgpKFnpyr
AgeFpF22L3JukHglrO6yb2a3kF9kRVJc6uvsB33ouyfwqeETlkMSgin/gEq5WAXb287pE9yVRweI
b//1WlNGLoeSvfbPmuWddbkhYqfF4Bp0rs7nNNeC+77GtMEKLwOO5MCBBe/csFclqY07IOd7Ii2O
AUNgdIQ2VyPWOdWXnDiuwbQPGeB43Md/veF203JomY4jMH8XwuUjEfWIHzxbPTt6/ynzF1O3r42P
EGo=
=TcUC
-----END PGP SIGNATURE-----

--------------0bvsO8LUUNRETkTSCFas30ZP--
