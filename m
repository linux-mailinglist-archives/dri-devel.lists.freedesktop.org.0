Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F336E5CF1
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 11:06:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9888B89196;
	Tue, 18 Apr 2023 09:06:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71B4F89196
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 09:05:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 86DA92191A;
 Tue, 18 Apr 2023 09:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1681808756; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9f7EH0bAGIlDf+07QmiwJudly2lTlBbte391E9o28jk=;
 b=k6XmAgBx4zThyWyxyTBpnS+Oef+mjZ5pOHFB0IO6oiLSuPdnf+6DbhmFlp9Njodlz+Y8dY
 Qqdh6v8aUgno75ezDL632nQD26ZL3zbqIp+GYklXUwSHil/Z9iY0F4tw8AQKhWV7yuPMZW
 17OaZ7IaDkb1bHQ99is7Cs4KDAT0JxY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1681808756;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9f7EH0bAGIlDf+07QmiwJudly2lTlBbte391E9o28jk=;
 b=056ELgotfRrwM/nloe3MXkH6PdQVi5FPmOtG+V7RHFh86omKUB8cpzKEZndUyJvzjLvUR8
 vxnS47NgsGBjQWBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4DD1913581;
 Tue, 18 Apr 2023 09:05:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id nScAEnRdPmSwHAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 18 Apr 2023 09:05:56 +0000
Message-ID: <02692686-aef1-bab3-96d7-316b24913302@suse.de>
Date: Tue, 18 Apr 2023 11:05:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3] drm/fbdev-generic: prohibit potential out-of-bounds
 access
Content-Language: en-US
To: Sui Jingfeng <suijingfeng@loongson.cn>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Li Yi <liyi@loongson.cn>, Helge Deller <deller@gmx.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 loongson-kernel@lists.loongnix.cn
References: <20230417113219.1354078-1-suijingfeng@loongson.cn>
 <ZD5Vgx9Txaiz7Bun@phenom.ffwll.local>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <ZD5Vgx9Txaiz7Bun@phenom.ffwll.local>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------PBWDoE807gYAK12iCcPfPxtK"
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
--------------PBWDoE807gYAK12iCcPfPxtK
Content-Type: multipart/mixed; boundary="------------okCtEE5uOubhLm12S6ubwjI4";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sui Jingfeng <suijingfeng@loongson.cn>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Li Yi <liyi@loongson.cn>, Helge Deller <deller@gmx.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 loongson-kernel@lists.loongnix.cn
Message-ID: <02692686-aef1-bab3-96d7-316b24913302@suse.de>
Subject: Re: [PATCH v3] drm/fbdev-generic: prohibit potential out-of-bounds
 access
References: <20230417113219.1354078-1-suijingfeng@loongson.cn>
 <ZD5Vgx9Txaiz7Bun@phenom.ffwll.local>
In-Reply-To: <ZD5Vgx9Txaiz7Bun@phenom.ffwll.local>

--------------okCtEE5uOubhLm12S6ubwjI4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTguMDQuMjMgdW0gMTA6MzIgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBP
biBNb24sIEFwciAxNywgMjAyMyBhdCAwNzozMjoxOVBNICswODAwLCBTdWkgSmluZ2Zlbmcg
d3JvdGU6DQo+PiBUaGUgZmJkZXYgdGVzdCBvZiBJR1QgbWF5IHdyaXRlIGFmdGVyIEVPRiwg
d2hpY2ggbGVhZCB0byBvdXQtb2YtYm91bmQNCj4+IGFjY2VzcyBmb3IgdGhlIGRybSBkcml2
ZXJzIHVzaW5nIGZiZGV2LWdlbmVyaWMuIEZvciBleGFtcGxlLCBvbiBhIHg4Ng0KPj4gKyBh
c3BlZWQgYm1jIGNhcmQgcGxhdGZvcm0sIHdpdGggYSAxNjgweDEwNTAgcmVzb2x1dGlvbiBk
aXNwbGF5LCBydW5uaW5nDQo+PiBmYmRldiB0ZXN0IGlmIElHVCB3aWxsIGNhdXNlIHRoZSBs
aW51eCBrZXJuZWwgaGFuZyB3aXRoIHRoZSBmb2xsb3dpbmcNCj4+IGNhbGwgdHJhY2U6DQo+
Pg0KPj4gICAgT29wczogMDAwMCBbIzFdIFBSRUVNUFQgU01QIFBUSQ0KPj4gICAgW0lHVF0g
ZmJkZXY6IHN0YXJ0aW5nIHN1YnRlc3QgZW9mDQo+PiAgICBXb3JrcXVldWU6IGV2ZW50cyBk
cm1fZmJfaGVscGVyX2RhbWFnZV93b3JrIFtkcm1fa21zX2hlbHBlcl0NCj4+ICAgIFtJR1Rd
IGZiZGV2OiBzdGFydGluZyBzdWJ0ZXN0IG51bGxwdHINCj4+DQo+PiAgICBSSVA6IDAwMTA6
bWVtY3B5X2VybXMrMHhhLzB4MjANCj4+ICAgIFJTUDogMDAxODpmZmZmYTE3ZDQwMTY3ZDk4
IEVGTEFHUzogMDAwMTAyNDYNCj4+ICAgIFJBWDogZmZmZmExN2Q0ZWI3ZmE4MCBSQlg6IGZm
ZmZhMTdkNDBlMGFhODAgUkNYOiAwMDAwMDAwMDAwMDAxNGMwDQo+PiAgICBSRFg6IDAwMDAw
MDAwMDAwMDFhNDAgUlNJOiBmZmZmYTE3ZDQwZTBiMDAwIFJESTogZmZmZmExN2Q0ZWI4MDAw
MA0KPj4gICAgUkJQOiBmZmZmYTE3ZDQwMTY3ZTIwIFIwODogMDAwMDAwMDAwMDAwMDAwMCBS
MDk6IGZmZmY4OTUyMmVjZmY4YzANCj4+ICAgIFIxMDogZmZmZmExN2Q0ZTRjNTAwMCBSMTE6
IDAwMDAwMDAwMDAwMDAwMDAgUjEyOiBmZmZmYTE3ZDRlYjdmYTgwDQo+PiAgICBSMTM6IDAw
MDAwMDAwMDAwMDFhNDAgUjE0OiAwMDAwMDAwMDAwMDAwNDFhIFIxNTogZmZmZmExN2Q0MDE2
N2UzMA0KPj4gICAgRlM6ICAwMDAwMDAwMDAwMDAwMDAwKDAwMDApIEdTOmZmZmY4OTUyNTcz
ODAwMDAoMDAwMCkga25sR1M6MDAwMDAwMDAwMDAwMDAwMA0KPj4gICAgQ1M6ICAwMDEwIERT
OiAwMDAwIEVTOiAwMDAwIENSMDogMDAwMDAwMDA4MDA1MDAzMw0KPj4gICAgQ1IyOiBmZmZm
YTE3ZDQwZTBiMDAwIENSMzogMDAwMDAwMDFlYWVjYTAwNiBDUjQ6IDAwMDAwMDAwMDAxNzA2
ZTANCj4+ICAgIENhbGwgVHJhY2U6DQo+PiAgICAgPFRBU0s+DQo+PiAgICAgPyBkcm1fZmJk
ZXZfZ2VuZXJpY19oZWxwZXJfZmJfZGlydHkrMHgyMDcvMHgzMzAgW2RybV9rbXNfaGVscGVy
XQ0KPj4gICAgIGRybV9mYl9oZWxwZXJfZGFtYWdlX3dvcmsrMHg4Zi8weDE3MCBbZHJtX2tt
c19oZWxwZXJdDQo+PiAgICAgcHJvY2Vzc19vbmVfd29yaysweDIxZi8weDQzMA0KPj4gICAg
IHdvcmtlcl90aHJlYWQrMHg0ZS8weDNjMA0KPj4gICAgID8gX19wZnhfd29ya2VyX3RocmVh
ZCsweDEwLzB4MTANCj4+ICAgICBrdGhyZWFkKzB4ZjQvMHgxMjANCj4+ICAgICA/IF9fcGZ4
X2t0aHJlYWQrMHgxMC8weDEwDQo+PiAgICAgcmV0X2Zyb21fZm9yaysweDJjLzB4NTANCj4+
ICAgICA8L1RBU0s+DQo+PiAgICBDUjI6IGZmZmZhMTdkNDBlMGIwMDANCj4+ICAgIC0tLVsg
ZW5kIHRyYWNlIDAwMDAwMDAwMDAwMDAwMDAgXS0tLQ0KPj4NCj4+IFRoZSBkaXJlY3QgcmVh
c29uIGlzIHRoYXQgZGFtYWdlIHJlY3RhbmdlIGNvbXB1dGVkIGJ5DQo+PiBkcm1fZmJfaGVs
cGVyX21lbW9yeV9yYW5nZV90b19jbGlwKCkgZG9lcyBub3QgZ3VhcmFudGVlZCB0byBiZSBp
bi1ib3VuZC4NCj4+IEl0IGlzIGFscmVhZHkgcmVzdWx0cyBpbiB3b3JrYXJvdW5kIGNvZGUg
cG9wdWxhdGUgdG8gZWxzZXdoZXJlLiBBbm90aGVyDQo+PiByZWFzb24gaXMgdGhhdCBleHBv
c2luZyBhIGxhcmdlciBidWZmZXIgc2l6ZSB0aGFuIHRoZSBhY3R1YWwgbmVlZGVkIGhlbHAN
Cj4+IHRvIHRyaWdnZXIgdGhpcyBidWcgaW50cmluc2ljIGluIGRybV9mYl9oZWxwZXJfbWVt
b3J5X3JhbmdlX3RvX2NsaXAoKS4NCj4+DQo+PiBPdGhlcnMgZmJkZXYgZW11bGF0aW9uIHNv
bHV0aW9ucyB3cml0ZSB0byB0aGUgR0VNIGJ1ZmZlciBkaXJlY3RseSwgdGhleQ0KPj4gd29u
J3QgcmVwcm9kdWNlIHRoaXMgYnVnIGJlY2F1c2UgdGhlIC5mYl9kaXJ0eSBmdW5jdGlvbiBj
YWxsYmFjayBkbyBub3QNCj4+IGJlaW5nIGhvb2tlZCwgc28gbm8gY2hhbmNlIGlzIGdpdmVu
IHRvIGRybV9mYl9oZWxwZXJfbWVtb3J5X3JhbmdlX3RvX2NsaXAoKQ0KPj4gdG8gZ2VuZXJh
dGUgYSBvdXQtb2YtYm91bmQgd2hlbiBkcm1fZmJfaGVscGVyX3N5c193cml0ZSgpIGlzIGNh
bGxlZC4NCj4+DQo+PiBUaGlzIHBhdGNoIGJyZWFrIHRoZSB0cmlnZ2VyIGNvbmRpdGlvbiBv
ZiB0aGlzIGJ1ZyBieSBzaHJpbmtpbmcgdGhlIHNoYWRvdw0KPj4gYnVmZmVyIHNpemUgdG8g
c2l6ZXMtPnN1cmZhY2VfaGVpZ2h0ICogYnVmZmVyLT5mYi0+cGl0Y2hlc1swXS4NCj4+DQo+
PiBGaXhlczogJzhmYmM5YWY1NWRlMCAoImRybS9mYmRldi1nZW5lcmljOiBTZXQgc2NyZWVu
IHNpemUgdG8gc2l6ZSBvZiBHRU0NCj4+IGJ1ZmZlciIpJw0KPj4NCj4+IFNpZ25lZC1vZmYt
Ynk6IFN1aSBKaW5nZmVuZyA8c3VpamluZ2ZlbmdAbG9vbmdzb24uY24+DQo+PiAtLS0NCj4+
ICAgZHJpdmVycy9ncHUvZHJtL2RybV9mYmRldl9nZW5lcmljLmMgfCAyICstDQo+PiAgIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPj4NCj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiZGV2X2dlbmVyaWMuYyBiL2RyaXZl
cnMvZ3B1L2RybS9kcm1fZmJkZXZfZ2VuZXJpYy5jDQo+PiBpbmRleCA4ZTUxNDhiZjQwYmIu
LmIwNTdjZmJiYTkzOCAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJk
ZXZfZ2VuZXJpYy5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiZGV2X2dlbmVy
aWMuYw0KPj4gQEAgLTk0LDcgKzk0LDcgQEAgc3RhdGljIGludCBkcm1fZmJkZXZfZ2VuZXJp
Y19oZWxwZXJfZmJfcHJvYmUoc3RydWN0IGRybV9mYl9oZWxwZXIgKmZiX2hlbHBlciwNCj4+
ICAgCWZiX2hlbHBlci0+YnVmZmVyID0gYnVmZmVyOw0KPj4gICAJZmJfaGVscGVyLT5mYiA9
IGJ1ZmZlci0+ZmI7DQo+PiAgIA0KPj4gLQlzY3JlZW5fc2l6ZSA9IGJ1ZmZlci0+Z2VtLT5z
aXplOw0KPj4gKwlzY3JlZW5fc2l6ZSA9IHNpemVzLT5zdXJmYWNlX2hlaWdodCAqIGJ1ZmZl
ci0+ZmItPnBpdGNoZXNbMF07DQo+IA0KPiBTbyBJIHJlYWQgY29yZSBzb21lIG1vcmUgYW5k
IHN0dW1ibGVkIG92ZXIgZHJtX2ZiX2hlbHBlcl9kZWZlcnJlZF9pbygpLg0KPiBXaGljaCBo
YXMgYWxsIHRoZSBjb2RlIGFuZCBjb21tZW50cyBhYm91dCB0aGlzLCBpbmNsdWRpbmcgbGlt
aXRpbmcuDQo+IA0KPiBJIHRoaW5rIGl0IHdvdWxkIGJlIGNsZWFyZXIgaWYgd2UgZml4IHRo
ZSBpc3N1ZSB0aGVyZSwgaW5zdGVhZCBvZiBwYXNzaW5nDQo+IGxpbWl0cyBhcm91bmQgaW4g
b2JzY3VyZSBwbGFjZXMgdGhhdCB0aGVuIGFnYWluIGdldCBicm9rZW4/IFRoZSB0aGluZyBp
cywNCj4gVGhvbWFzIGJvdGggYXV0aG9yZWQgdGhlIGxpbWl0IGNoZWNrcyBpbiBkcm1fZmJf
aGVscGVyX2RlZmVycmVkX2lvKCkgYW5kDQo+IHRoZSBwYXRjaCB3aGljaCBicm9rZW4gdGhl
bSBhZ2Fpbiwgc28gY2xlYXJseSB0aGlzIGlzbid0IHZlcnkgb2J2aW91cy4gSSdtDQo+IHRo
aW5raW5nIG9mIHNvbWV0aGluZyBsaWtlIHRoaXM6DQo+IA0KPiANCj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJt
X2ZiX2hlbHBlci5jDQo+IGluZGV4IGVmNGViOGIxMjc2Ni4uNzI2ZGFiNjdjMzU5IDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jDQo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMNCj4gQEAgLTY5NywxMCArNjk3LDcgQEAg
dm9pZCBkcm1fZmJfaGVscGVyX2RlZmVycmVkX2lvKHN0cnVjdCBmYl9pbmZvICppbmZvLCBz
dHJ1Y3QgbGlzdF9oZWFkICpwYWdlcmVmbGkNCj4gICAJICogb2YgdGhlIHNjcmVlbiBhbmQg
YWNjb3VudCBmb3Igbm9uLWV4aXN0aW5nIHNjYW5saW5lcy4gSGVuY2UsDQo+ICAgCSAqIGtl
ZXAgdGhlIGNvdmVyZWQgbWVtb3J5IGFyZWEgd2l0aGluIHRoZSBzY3JlZW4gYnVmZmVyLg0K
PiAgIAkgKi8NCj4gLQlpZiAoaW5mby0+c2NyZWVuX3NpemUpDQo+IC0JCXRvdGFsX3NpemUg
PSBpbmZvLT5zY3JlZW5fc2l6ZTsNCj4gLQllbHNlDQo+IC0JCXRvdGFsX3NpemUgPSBpbmZv
LT5maXguc21lbV9sZW47DQo+ICsJdG90YWxfc2l6ZSA9IGhlbHBlci0+ZmItPmhlaWdodCAq
IGhlbHBlci0+ZmItPnBpdGNoZXNbMF07DQoNCkJ1dCB3ZSBub3cgaGF2ZSB0d28gcGxhY2Vz
IHdoZXJlIHdlIGNvbXB1dGUgdGhlIHNpemUgb2YgdGhlIGJ1ZmZlci4gVGhhdCANCnZpb2xh
dGVzIHRoZSBTUE9UIHJ1bGUuIENhbiB3ZSBhdCBsZWFzdCBhZGQgYSB3YXJuaW5nIGlmIHRv
dGFsX3NpemUgaXMgDQpsYXJnZXIgdGhhbiBlaXRoZXIgb2YgdGhlIGluZm8gZmllbGRzPw0K
DQoNClllc3RlcmRheSwgSSd2ZSBiZWVuIHRoaW5raW5nIGFib3V0IGRpc2Nvbm5lY3Rpbmcg
dGhlIHNpemUgb2YgdGhlIERSTSANCmZyYW1lYnVmZmVyIGZyb20gdGhlIG92ZXJhbGwgc2l6
ZSBvZiB0aGUgR0VNIGJ1ZmZlci4gVGhhdCdzIHByb2JhYmx5IHRoZSANCm9ubHkgd2F5IHRv
IGZ1bGx5IHJlc29sdmUgdGhvc2UgcHJvYmxlbXMuIEl0J3MganVzdCB0aGF0IGl0J3MgYSBo
dWdlIGNhbiANCm9mIHdvcm1zLiA6Lw0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+ICAg
CW1heF9vZmYgPSBtaW4obWF4X29mZiwgdG90YWxfc2l6ZSk7DQo+ICAgDQo+ICAgCWlmICht
aW5fb2ZmIDwgbWF4X29mZikgew0KPiANCj4gDQo+IEkgdGhpbmsgdGhhdCB3b3VsZCBtYWtl
IGl0IHV0bW9zdCBjbGVhciBvbiB3aGF0IHdlJ3JlIGRvaW5nIGFuZCB3aHkuDQo+IE90aGVy
d2lzZSB3ZSdyZSBqdXN0IGdvaW5nIHRvIHJlLWNyZWF0ZSB0aGUgc2FtZSBidWcgYWdhaW4s
IGxpa2Ugd2UndmUNCj4gZG9uZSBhbHJlYWR5IDotKQ0KPiAtRGFuaWVsDQo+IA0KPj4gICAJ
c2NyZWVuX2J1ZmZlciA9IHZ6YWxsb2Moc2NyZWVuX3NpemUpOw0KPj4gICAJaWYgKCFzY3Jl
ZW5fYnVmZmVyKSB7DQo+PiAgIAkJcmV0ID0gLUVOT01FTTsNCj4+IC0tIA0KPj4gMi4yNS4x
DQo+Pg0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERl
dmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxk
c3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJu
YmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------okCtEE5uOubhLm12S6ubwjI4--

--------------PBWDoE807gYAK12iCcPfPxtK
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQ+XXMFAwAAAAAACgkQlh/E3EQov+Cb
URAApsj5a3GcFJcfUhlRcqlBuwTGwMn/ZBlEbD5pmfg5CkJn000B47De7FLeNHQWevBX2lB9uicz
E/BzWc78jCGtkFKEQ1yY0FarEY5WyiD9fGdabIbmaqEBCvb8ErZvY/NL7qSZCUNfcHpX/QS+eiPA
Xz8yBJrgfc/XW8EKKcvtZBDK+L2rNMNzmU85L+c09QN8GmK1fKGq9vPvob0J6ZUIZMcLl7IanG05
U/n0Lk4OjzMgxtG3mu3/zTjXhuTPIWdHM+SYl+0TxVmUkMp3GBcT3Yud24RvcqyBbDx0p5a6/pAc
Lby+OqZxg2AOdUs5byqpZ4ySnn8N9E2IQXUurgAX/X2lRSYQb3PL0E/PSV6GAE3P6uGknrDAZ6pJ
cyO0NTIvmT1kVHztiImZs5OMWT05p2FMqF1Y9/XvO/vnG/4PDt+x2yJe9ohaPcZhtELLfPUPVare
LcrZpXk9orLxDH9LivchRFfrQewi1rPVHd7WcWbU4D/vhoJurJn50/JVnqr10Bre8c+Wkpw8C/5H
gwfGKtXAyPou8ttHk+EHo4t8oYaInUvo+pFNUAzS/pClh0KkwBiBahY8CiGlVjH9QYiiPtnm4hXs
bzeRIlLMVupEeRCVuZ2M5XC4Xe8QMwHgZdb8bMQUAmuGkGHO+13CIxGJEr61+gjXKPeSVKbwq1T3
Hwc=
=0V93
-----END PGP SIGNATURE-----

--------------PBWDoE807gYAK12iCcPfPxtK--
