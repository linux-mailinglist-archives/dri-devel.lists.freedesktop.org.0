Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2144DC7A7
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 14:34:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 937CC89236;
	Thu, 17 Mar 2022 13:34:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28F9310EBC9
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 13:34:15 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4DD9821108;
 Thu, 17 Mar 2022 13:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1647524053; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TnTW0AHfArrZNnyXiVHt4csKgKZmgMwipN/WKuAH7ao=;
 b=ouZDJ+4vuj781dxIHZJshd3jYQBowR5FHcxA3cQi/c68Cay/myZ0Y9y7XibBb3aNLbN1W0
 8+U8U/89wBtvmBW4Ob0VBM1qUPdphBiUUonTJuJQqOA5peGrV2i3cLr4HEOshiGW7Exq91
 2Tdl7mV+wl4+Rxounbv/KEbzf/L5xtE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1647524053;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TnTW0AHfArrZNnyXiVHt4csKgKZmgMwipN/WKuAH7ao=;
 b=atKJO+9nj51/AJIkaI/3R+tamSSc63N1SjzS4/R/j0YSdil/+cuJSFm4dT29bpnm0sdJnu
 Md2yPDX04otnhgBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 25F2C13BAC;
 Thu, 17 Mar 2022 13:34:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Ts03CNU4M2KeFAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 17 Mar 2022 13:34:13 +0000
Message-ID: <7fec4a78-9a48-788e-44aa-d0f42350d00d@suse.de>
Date: Thu, 17 Mar 2022 14:34:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] fbdev: defio: fix the pagelist corruption
Content-Language: en-US
To: Chuansheng Liu <chuansheng.liu@intel.com>, jayalk@intworks.biz,
 daniel@ffwll.ch, deller@gmx.de
References: <20220317054602.28846-1-chuansheng.liu@intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220317054602.28846-1-chuansheng.liu@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------be07U3Qd9ZKbKruygCjUopbf"
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------be07U3Qd9ZKbKruygCjUopbf
Content-Type: multipart/mixed; boundary="------------3e7v8DAR0tPjI7yWfAB0kmoP";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Chuansheng Liu <chuansheng.liu@intel.com>, jayalk@intworks.biz,
 daniel@ffwll.ch, deller@gmx.de
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <7fec4a78-9a48-788e-44aa-d0f42350d00d@suse.de>
Subject: Re: [PATCH] fbdev: defio: fix the pagelist corruption
References: <20220317054602.28846-1-chuansheng.liu@intel.com>
In-Reply-To: <20220317054602.28846-1-chuansheng.liu@intel.com>

--------------3e7v8DAR0tPjI7yWfAB0kmoP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTcuMDMuMjIgdW0gMDY6NDYgc2NocmllYiBDaHVhbnNoZW5nIExpdToNCj4g
RWFzaWx5IGhpdCB0aGUgYmVsb3cgbGlzdCBjb3JydXB0aW9uOg0KPiA9PQ0KPiBsaXN0X2Fk
ZCBjb3JydXB0aW9uLiBwcmV2LT5uZXh0IHNob3VsZCBiZSBuZXh0IChmZmZmZmZmZmMwY2Vi
MDkwKSwgYnV0DQo+IHdhcyBmZmZmZWM2MDQ1MDdlZGM4LiAocHJldj1mZmZmZWM2MDQ1MDdl
ZGM4KS4NCj4gV0FSTklORzogQ1BVOiA2NSBQSUQ6IDM5NTkgYXQgbGliL2xpc3RfZGVidWcu
YzoyNg0KPiBfX2xpc3RfYWRkX3ZhbGlkKzB4NTMvMHg4MA0KPiBDUFU6IDY1IFBJRDogMzk1
OSBDb21tOiBmYmRldiBUYWludGVkOiBHICAgICBVDQo+IFJJUDogMDAxMDpfX2xpc3RfYWRk
X3ZhbGlkKzB4NTMvMHg4MA0KPiBDYWxsIFRyYWNlOg0KPiAgIDxUQVNLPg0KPiAgIGZiX2Rl
ZmVycmVkX2lvX21rd3JpdGUrMHhlYS8weDE1MA0KPiAgIGRvX3BhZ2VfbWt3cml0ZSsweDU3
LzB4YzANCj4gICBkb193cF9wYWdlKzB4Mjc4LzB4MmYwDQo+ICAgX19oYW5kbGVfbW1fZmF1
bHQrMHhkYzIvMHgxNTkwDQo+ICAgaGFuZGxlX21tX2ZhdWx0KzB4ZGQvMHgyYzANCj4gICBk
b191c2VyX2FkZHJfZmF1bHQrMHgxZDMvMHg2NTANCj4gICBleGNfcGFnZV9mYXVsdCsweDc3
LzB4MTgwDQo+ICAgPyBhc21fZXhjX3BhZ2VfZmF1bHQrMHg4LzB4MzANCj4gICBhc21fZXhj
X3BhZ2VfZmF1bHQrMHgxZS8weDMwDQo+IFJJUDogMDAzMzoweDdmZDk4ZmM4ZmFkMQ0KPiA9
PQ0KPiANCj4gRmlndXJlIG91dCB0aGUgcmFjZSBoYXBwZW5zIHdoZW4gb25lIHByb2Nlc3Mg
aXMgYWRkaW5nICZwYWdlLT5scnUgaW50bw0KPiB0aGUgcGFnZWxpc3QgdGFpbCBpbiBmYl9k
ZWZlcnJlZF9pb19ta3dyaXRlKCksIGFub3RoZXIgcHJvY2VzcyBpcw0KPiByZS1pbml0aWFs
aXppbmcgdGhlIHNhbWUgJnBhZ2UtPmxydSBpbiBmYl9kZWZlcnJlZF9pb19mYXVsdCgpLCB3
aGljaCBpcw0KPiBub3QgcHJvdGVjdGVkIGJ5IHRoZSBsb2NrLg0KPiANCj4gVGhpcyBmaXgg
aXMgdG8gaW5pdCBhbGwgdGhlIHBhZ2UgbGlzdHMgb25lIHRpbWUgZHVyaW5nIGluaXRpYWxp
emF0aW9uLA0KPiBpdCBub3Qgb25seSBmaXhlcyB0aGUgbGlzdCBjb3JydXB0aW9uLCBidXQg
YWxzbyBhdm9pZHMgSU5JVF9MSVNUX0hFQUQoKQ0KPiByZWR1bmRhbnRseS4NCj4gDQo+IEZp
eGVzOiAxMDVhOTQwNDE2ZmMgKCJmYmRldi9kZWZpbzogRWFybHktb3V0IGlmIHBhZ2UgaXMg
YWxyZWFkeQ0KPiBlbmxpc3RlZCIpDQo+IENjOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1l
cm1hbm5Ac3VzZS5kZT4NCj4gU2lnbmVkLW9mZi1ieTogQ2h1YW5zaGVuZyBMaXUgPGNodWFu
c2hlbmcubGl1QGludGVsLmNvbT4NCg0KSWYgeW91IGZpeCBHZWVydCdzIGNvbW1lbnQsIGZl
ZWwgZnJlZSB0byBhZGQNCg0KUmV2aWV3ZWQtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emlt
bWVybWFubkBzdXNlLmRlPg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IC0tLQ0KPiAg
IGRyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYl9kZWZpby5jIHwgOSArKysrKysrKy0NCj4g
ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZiX2RlZmlvLmMgYi9k
cml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJfZGVmaW8uYw0KPiBpbmRleCA5OGIwZjIzYmY1
ZTIuLmVhZmI2NmNhNGYyOCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9j
b3JlL2ZiX2RlZmlvLmMNCj4gKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZiX2Rl
ZmlvLmMNCj4gQEAgLTU5LDcgKzU5LDYgQEAgc3RhdGljIHZtX2ZhdWx0X3QgZmJfZGVmZXJy
ZWRfaW9fZmF1bHQoc3RydWN0IHZtX2ZhdWx0ICp2bWYpDQo+ICAgCQlwcmludGsoS0VSTl9F
UlIgIm5vIG1hcHBpbmcgYXZhaWxhYmxlXG4iKTsNCj4gICANCj4gICAJQlVHX09OKCFwYWdl
LT5tYXBwaW5nKTsNCj4gLQlJTklUX0xJU1RfSEVBRCgmcGFnZS0+bHJ1KTsNCj4gICAJcGFn
ZS0+aW5kZXggPSB2bWYtPnBnb2ZmOw0KPiAgIA0KPiAgIAl2bWYtPnBhZ2UgPSBwYWdlOw0K
PiBAQCAtMjIwLDYgKzIxOSw4IEBAIHN0YXRpYyB2b2lkIGZiX2RlZmVycmVkX2lvX3dvcmso
c3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQ0KPiAgIHZvaWQgZmJfZGVmZXJyZWRfaW9faW5p
dChzdHJ1Y3QgZmJfaW5mbyAqaW5mbykNCj4gICB7DQo+ICAgCXN0cnVjdCBmYl9kZWZlcnJl
ZF9pbyAqZmJkZWZpbyA9IGluZm8tPmZiZGVmaW87DQo+ICsJc3RydWN0IHBhZ2UgKnBhZ2U7
DQo+ICsJaW50IGk7DQo+ICAgDQo+ICAgCUJVR19PTighZmJkZWZpbyk7DQo+ICAgCW11dGV4
X2luaXQoJmZiZGVmaW8tPmxvY2spOw0KPiBAQCAtMjI3LDYgKzIyOCwxMiBAQCB2b2lkIGZi
X2RlZmVycmVkX2lvX2luaXQoc3RydWN0IGZiX2luZm8gKmluZm8pDQo+ICAgCUlOSVRfTElT
VF9IRUFEKCZmYmRlZmlvLT5wYWdlbGlzdCk7DQo+ICAgCWlmIChmYmRlZmlvLT5kZWxheSA9
PSAwKSAvKiBzZXQgYSBkZWZhdWx0IG9mIDEgcyAqLw0KPiAgIAkJZmJkZWZpby0+ZGVsYXkg
PSBIWjsNCj4gKw0KPiArCS8qIGluaXRpYWxpemUgYWxsIHRoZSBwYWdlIGxpc3RzIG9uZSB0
aW1lICovDQo+ICsJZm9yIChpID0gMDsgaSA8IGluZm8tPmZpeC5zbWVtX2xlbjsgaSArPSBQ
QUdFX1NJWkUpIHsNCj4gKwkJcGFnZSA9IGZiX2RlZmVycmVkX2lvX3BhZ2UoaW5mbywgaSk7
DQo+ICsJCUlOSVRfTElTVF9IRUFEKCZwYWdlLT5scnUpOw0KPiArCX0NCj4gICB9DQo+ICAg
RVhQT1JUX1NZTUJPTF9HUEwoZmJfZGVmZXJyZWRfaW9faW5pdCk7DQo+ICAgDQoNCi0tIA0K
VGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29m
dHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8
cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRz
ZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------3e7v8DAR0tPjI7yWfAB0kmoP--

--------------be07U3Qd9ZKbKruygCjUopbf
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmIzONQFAwAAAAAACgkQlh/E3EQov+AG
Rw//SZtWsBmQK+ly779aKo7P3Na0OyFMSvTZE5bW4HMt0ySPccDQXeznCdogDXFOuxS9i0uGiZM9
xrEaTF2BwrdwAV3qERXsO9lxMKYHNQe54WGq4u/nVtp7D75afQEF1nuVfEqel+ErHFEJOk9QGrHt
FDr+jznzE7Iojkn3sqGjTMLjNafV1MtPU4eNddElwmzPA+dStf0zqmhKw8HrnVZEhfgaNjYrwtdS
zhyqDdDVmEGEVrn7YdaFR5jK9tQhWq899mASy5k1GYVNmm/5AhYvbJtB0lD4ZndeByt2v9E3ERzs
UeJRo2fFPUQt9FZI0qqdInSJPZz1js1XqV/TSx+p/EbO4i7yj1jjEbukvGm9btB2l9LGhNk+oTlL
27iOrJylp9iRfT4MftPqRAraSc5M9obtu9NRbcsLx8669z/s1c2+ebtr/Q0f9p59bqLpBl0Horv/
DX3hrplFJyTkHbSPiYNnB+TMd5XCInBMyjRTIIy5HiWBEa0NlE7pLSVorK3c0+/gvtkN2Dc+EiCd
S7yz4MUtzGRK+0oEFJOkBqc0n5BkYy9Orf5frphkUjKrj8KRwx2UqRLxd0wjljvPnM/WgM+3Qtz4
v9QeRzzHqHwv2OFtq6a/zGdyQyPg0UPmIxfskCYsfD8OtgROgvztxdkcuSnT+9VjjqMohV8CPuUU
1rA=
=1L9C
-----END PGP SIGNATURE-----

--------------be07U3Qd9ZKbKruygCjUopbf--
