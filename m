Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 134DC48AA8F
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 10:31:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBDB210E736;
	Tue, 11 Jan 2022 09:31:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E20910E736
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Jan 2022 09:31:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1698D212C2;
 Tue, 11 Jan 2022 09:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1641893478; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=729ym1KdSQ6wD7+4ye4amZHgCE3/BQvTTChbjrN90vc=;
 b=TuTYpUIbfIrumViN8fOigL6HgszF02+tA9QJXc2pOEzk7asb0eVwfqdwyMtLrSJvtboTD1
 24eZbBogUoh8YLcIDPuD/e6H0rnwWtdI7g17qW8RJijt/YCW7Y+iQsvvcXTCC30KsAzZQQ
 KvRQK39/Im7T8X/17CCUkxmBtdc52No=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1641893478;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=729ym1KdSQ6wD7+4ye4amZHgCE3/BQvTTChbjrN90vc=;
 b=5Ritn2iUODqi4ijCESqvcKgwQ8mWl01KC7elNSfV5NDVNhIIa429bEwbF8d363Ze0yAT00
 0eMnGGEZ490t5BBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B0ADF13AC9;
 Tue, 11 Jan 2022 09:31:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gbjtKWVO3WESOgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 11 Jan 2022 09:31:17 +0000
Message-ID: <0963819e-6739-2ad9-c5d8-dc3529032d22@suse.de>
Date: Tue, 11 Jan 2022 10:31:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH v1 2/2] drm/sprd: fix potential NULL dereference
Content-Language: en-US
To: Kevin Tang <kevin3.tang@gmail.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
 robh+dt@kernel.org, mark.rutland@arm.com
References: <20211224141213.27612-1-kevin3.tang@gmail.com>
 <20211224141213.27612-3-kevin3.tang@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20211224141213.27612-3-kevin3.tang@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------oGOWVmqw00NZF4L2Kml1PTCr"
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
Cc: devicetree@vger.kernel.org, zhang.lyra@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 orsonzhai@gmail.com, lukas.bulwahn@gmail.com, zou_wei@huawei.com,
 pony1.wu@gmail.com, dan.carpenter@oracle.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------oGOWVmqw00NZF4L2Kml1PTCr
Content-Type: multipart/mixed; boundary="------------RxA0M5YTa40QrnC99Sw5OLft";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Kevin Tang <kevin3.tang@gmail.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
 robh+dt@kernel.org, mark.rutland@arm.com
Cc: devicetree@vger.kernel.org, zhang.lyra@gmail.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 lukas.bulwahn@gmail.com, orsonzhai@gmail.com, zou_wei@huawei.com,
 pony1.wu@gmail.com, dan.carpenter@oracle.com
Message-ID: <0963819e-6739-2ad9-c5d8-dc3529032d22@suse.de>
Subject: Re: [PATCH v1 2/2] drm/sprd: fix potential NULL dereference
References: <20211224141213.27612-1-kevin3.tang@gmail.com>
 <20211224141213.27612-3-kevin3.tang@gmail.com>
In-Reply-To: <20211224141213.27612-3-kevin3.tang@gmail.com>

--------------RxA0M5YTa40QrnC99Sw5OLft
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCm9uIHRoZSBjaGFuZ2VzIGZvciBwbGF0Zm9ybV9nZXRfcmVzb3VyY2UoKSwgeW91
IGNhbg0KDQpBY2tlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2Uu
ZGU+DQoNCmJ1dCBzZWUgbXkgY29tbWVudHMgYmVsb3cuDQoNCkFtIDI0LjEyLjIxIHVtIDE1
OjEyIHNjaHJpZWIgS2V2aW4gVGFuZzoNCj4gcGxhdGZvcm1fZ2V0X3Jlc291cmNlKCkgbWF5
IGZhaWwgYW5kIHJldHVybiBOVUxMLCBzbyBjaGVjayBpdCdzIHZhbHVlDQo+IGJlZm9yZSB1
c2luZyBpdC4NCj4gDQo+ICdkcm0nIGNvdWxkIGJlIG51bGwgaW4gc3ByZF9kcm1fc2h1dGRv
d24sIGFuZCBkcm1fd2FybiBtYXliZSBkZXJlZmVyZW5jZQ0KPiBpdCwgcmVtb3ZlIHRoaXMg
d2FybmluZyBsb2cuDQo+IA0KPiBDYzogT3Jzb24gWmhhaSA8b3Jzb256aGFpQGdtYWlsLmNv
bT4NCj4gQ2M6IENodW55YW4gWmhhbmcgPHpoYW5nLmx5cmFAZ21haWwuY29tPg0KPiBTaWdu
ZWQtb2ZmLWJ5OiBLZXZpbiBUYW5nIDxrZXZpbi50YW5nQHVuaXNvYy5jb20+DQo+IC0tLQ0K
PiAgIGRyaXZlcnMvZ3B1L2RybS9zcHJkL3NwcmRfZHB1LmMgfCAzICsrKw0KPiAgIGRyaXZl
cnMvZ3B1L2RybS9zcHJkL3NwcmRfZHJtLmMgfCA4ICsrLS0tLS0tDQo+ICAgZHJpdmVycy9n
cHUvZHJtL3NwcmQvc3ByZF9kc2kuYyB8IDMgKysrDQo+ICAgMyBmaWxlcyBjaGFuZ2VkLCA4
IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3NwcmQvc3ByZF9kcHUuYyBiL2RyaXZlcnMvZ3B1L2RybS9zcHJkL3Nw
cmRfZHB1LmMNCj4gaW5kZXggMDZhMzQxNGVlLi42OTY4M2I3YmEgMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9zcHJkL3NwcmRfZHB1LmMNCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3NwcmQvc3ByZF9kcHUuYw0KPiBAQCAtNzkwLDYgKzc5MCw5IEBAIHN0YXRpYyBpbnQg
c3ByZF9kcHVfY29udGV4dF9pbml0KHN0cnVjdCBzcHJkX2RwdSAqZHB1LA0KPiAgIAlpbnQg
cmV0Ow0KPiAgIA0KPiAgIAlyZXMgPSBwbGF0Zm9ybV9nZXRfcmVzb3VyY2UocGRldiwgSU9S
RVNPVVJDRV9NRU0sIDApOw0KPiArCWlmICghcmVzKQ0KPiArCQlyZXR1cm4gLUVJTlZBTDsN
Cj4gKw0KDQpZb3UgY2FuIGFkZCBhbiBlcnJvciBtZXNzYWdlIGlmIHRoaXMgZmFpbHMuDQoN
Cg0KPiAgIAljdHgtPmJhc2UgPSBkZXZtX2lvcmVtYXAoZGV2LCByZXMtPnN0YXJ0LCByZXNv
dXJjZV9zaXplKHJlcykpOw0KPiAgIAlpZiAoIWN0eC0+YmFzZSkgew0KPiAgIAkJZGV2X2Vy
cihkZXYsICJmYWlsZWQgdG8gbWFwIGRwdSByZWdpc3RlcnNcbiIpOw0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3NwcmQvc3ByZF9kcm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9z
cHJkL3NwcmRfZHJtLmMNCj4gaW5kZXggYTA3N2UyZDRkLi41NDAzMDgzOWUgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zcHJkL3NwcmRfZHJtLmMNCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3NwcmQvc3ByZF9kcm0uYw0KPiBAQCAtMTU0LDEyICsxNTQsOCBAQCBzdGF0
aWMgdm9pZCBzcHJkX2RybV9zaHV0ZG93bihzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQ0KPiAgIHsNCj4gICAJc3RydWN0IGRybV9kZXZpY2UgKmRybSA9IHBsYXRmb3JtX2dldF9k
cnZkYXRhKHBkZXYpOw0KPiAgIA0KPiAtCWlmICghZHJtKSB7DQo+IC0JCWRybV93YXJuKGRy
bSwgImRybSBkZXZpY2UgaXMgbm90IGF2YWlsYWJsZSwgbm8gc2h1dGRvd25cbiIpOw0KPiAt
CQlyZXR1cm47DQo+IC0JfQ0KPiAtDQo+IC0JZHJtX2F0b21pY19oZWxwZXJfc2h1dGRvd24o
ZHJtKTsNCj4gKwlpZiAoZHJtKQ0KPiArCQlkcm1fYXRvbWljX2hlbHBlcl9zaHV0ZG93bihk
cm0pOw0KDQpUaGlzIGNoYW5nZSBzaG91bGQgYmUgaW4gYSBzZXBhcmF0ZSBwYXRjaC4gSW5z
dGVhZCBvZiByZW1vdmluZyB0aGUgDQp3YXJuaW5nLCB5b3Ugc2hvdWxkIHJhdGhlciB1c2Ug
ZGV2X2VycigpIG9yIGRldl93YXJuKCkgZnJvbSBbMV0uIE5vdCANCmJlaW5nIGFibGUgdG8g
c2h1dCBkb3duIGhlcmUgbG9va3MgbGlrZSBhIHNlcmlvdXMgZHJpdmVyIGJ1ZyB0aGF0IHRo
ZSANCnVzZXIgc2hvdWxkIGtub3cgYWJvdXQuDQoNCg0KPiAgIH0NCj4gICANCj4gICBzdGF0
aWMgY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCBkcm1fbWF0Y2hfdGFibGVbXSA9IHsNCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zcHJkL3NwcmRfZHNpLmMgYi9kcml2ZXJz
L2dwdS9kcm0vc3ByZC9zcHJkX2RzaS5jDQo+IGluZGV4IDkxMWIzY2RkYy4uOTU1YzU5OTVh
IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vc3ByZC9zcHJkX2RzaS5jDQo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9zcHJkL3NwcmRfZHNpLmMNCj4gQEAgLTkwNyw2ICs5MDcs
OSBAQCBzdGF0aWMgaW50IHNwcmRfZHNpX2NvbnRleHRfaW5pdChzdHJ1Y3Qgc3ByZF9kc2kg
KmRzaSwNCj4gICAJc3RydWN0IHJlc291cmNlICpyZXM7DQo+ICAgDQo+ICAgCXJlcyA9IHBs
YXRmb3JtX2dldF9yZXNvdXJjZShwZGV2LCBJT1JFU09VUkNFX01FTSwgMCk7DQo+ICsJaWYg
KCFyZXMpDQo+ICsJCXJldHVybiAtRUlOVkFMOw0KPiArDQoNCkFnYWluLCBhbiBlcnJvciBt
ZXNzYWdlIHNlZW1zIGFwcHJvcHJpYXRlLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQpb
MV0gDQpodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC9sYXRlc3Qvc291cmNlL2lu
Y2x1ZGUvbGludXgvZGV2X3ByaW50ay5oI0wxNDUNCg0KPiAgIAljdHgtPmJhc2UgPSBkZXZt
X2lvcmVtYXAoZGV2LCByZXMtPnN0YXJ0LCByZXNvdXJjZV9zaXplKHJlcykpOw0KPiAgIAlp
ZiAoIWN0eC0+YmFzZSkgew0KPiAgIAkJZHJtX2Vycihkc2ktPmRybSwgImZhaWxlZCB0byBt
YXAgZHNpIGhvc3QgcmVnaXN0ZXJzXG4iKTsNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0K
R3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2Vy
bWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihI
UkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYN
Cg==

--------------RxA0M5YTa40QrnC99Sw5OLft--

--------------oGOWVmqw00NZF4L2Kml1PTCr
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmHdTmUFAwAAAAAACgkQlh/E3EQov+DX
JA/8DGS6/Nw+X7bksgxPQAr8kTXiI2i23JS9ANrtL6nOab0+3gMmgav0+H4w9j82y4ZmthYbX4ji
gXHvQ/euj5TkR1UOOEwc69g0A6/7kBRfOrur4X1EIbFGzFxrnw94i1CSlKEEGVic45TmiOv+4L7+
7Xjdpc0iEPiz7Xa76mIYyJ5yXad5TXXjsGTUUHRS0bgRD8M0/zEVP2yGg3fmkPazqUx8QxVTCBeS
yWmzYPQk4KQlWk95qSvImCmkCoEnol5JB1wJLniE+bzDY6FVDQqwdvySFF2jv7Unlq9zwlGA0ySO
vMbqRsF7LdVfx1kgdTI/zsuSXbM+n5EaOvtQWMcEY2HYkxiFH1mTwv/QQKSgkL09HF0GtUtOqqvP
zQZUKHhb8jwUyK0R2hNEEBDv4B5tHRZRSOMm2LClTfU67EDER36Fb/MYjlZ6XerWOttNF2sVQx+v
0zStHL5ccifTCdXoKvQI1wpXB7Jw53n11hVDW8DMmyjtOp6kqbiLrOi6pLpujJXCgcvBjV/1eUiQ
Yd61KiBudOAaUKJyiyQNrtvIuM1gj+zqP1Ycz24OJJOzx3lEV/iP6BrhoV5EIQU1fMbEpGoQjKd9
Kla8RExnX6antcU+W/L7e49CB5FBK/K539gmaotCUe/s24mmmd81N3Y/NEfda98tprsYh93orVbP
UwE=
=q/3s
-----END PGP SIGNATURE-----

--------------oGOWVmqw00NZF4L2Kml1PTCr--
