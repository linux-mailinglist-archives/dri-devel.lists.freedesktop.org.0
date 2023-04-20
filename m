Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D0E66E8AAE
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 08:56:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43FA210E06B;
	Thu, 20 Apr 2023 06:56:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 543EF10E06B
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 06:56:43 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 59068219E9;
 Thu, 20 Apr 2023 06:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1681973801; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qEkSjJjFBHaUlC8jgoZ3zKl3NTvwS4++X1Qky9wBnQg=;
 b=p5eY+/MGx3unepxemKN+R7x8UTfOEQS3qhihpvd/RiY8/XF9HPDOp0dE9TazNCRDFSNNDW
 yn7Y3Ss/EE+ntT3EUGiSYS/L0ls3jNqph9RdY5FCGHnKWSn/5oolr45WjQTbcotPT0mqPE
 MY3KLpdlM1CxsBTtZkkwnKF+punO8GA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1681973801;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qEkSjJjFBHaUlC8jgoZ3zKl3NTvwS4++X1Qky9wBnQg=;
 b=pbynGrRTdf6Z9cGErrqDE2MwqRtnBlYqgJRL45qOygni62tzYcW6U5RJg+AYCSFfTedfSb
 VKUFVBqxinSih9Bg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2703113584;
 Thu, 20 Apr 2023 06:56:41 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ZNhHCCniQGReOQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 20 Apr 2023 06:56:41 +0000
Message-ID: <acda1509-940b-7411-7427-9fbb7b803999@suse.de>
Date: Thu, 20 Apr 2023 08:56:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3] drm/fbdev-generic: prohibit potential out-of-bounds
 access
To: Sui Jingfeng <15330273260@189.cn>, Daniel Vetter <daniel@ffwll.ch>
References: <20230417113219.1354078-1-suijingfeng@loongson.cn>
 <ZD5Vgx9Txaiz7Bun@phenom.ffwll.local>
 <139c9398-488d-df19-9ae2-2b4b47ef64f4@189.cn>
 <86a8b262-cbf2-b75f-9972-491f557edf74@189.cn>
 <CAKMK7uE-azFT02Sp2FDfMGTc57eYJEn8iM8Wk1mt5ucPs1qM-w@mail.gmail.com>
 <59dff860-9d1f-ec66-cd87-28693aa1fad2@suse.de>
 <867ab1ec-4ef9-3d91-2bfb-528cf304513a@189.cn>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <867ab1ec-4ef9-3d91-2bfb-528cf304513a@189.cn>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------HbPLyu0paUaLMRW1eWsdSnh5"
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
Cc: linux-fbdev@vger.kernel.org, Li Yi <liyi@loongson.cn>,
 Helge Deller <deller@gmx.de>, Lucas De Marchi <lucas.demarchi@intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 loongson-kernel@lists.loongnix.cn
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------HbPLyu0paUaLMRW1eWsdSnh5
Content-Type: multipart/mixed; boundary="------------azcvLGVtF0xtPiBZFXst0pIi";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sui Jingfeng <15330273260@189.cn>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-fbdev@vger.kernel.org, Helge Deller <deller@gmx.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 loongson-kernel@lists.loongnix.cn, dri-devel@lists.freedesktop.org,
 Li Yi <liyi@loongson.cn>
Message-ID: <acda1509-940b-7411-7427-9fbb7b803999@suse.de>
Subject: Re: [PATCH v3] drm/fbdev-generic: prohibit potential out-of-bounds
 access
References: <20230417113219.1354078-1-suijingfeng@loongson.cn>
 <ZD5Vgx9Txaiz7Bun@phenom.ffwll.local>
 <139c9398-488d-df19-9ae2-2b4b47ef64f4@189.cn>
 <86a8b262-cbf2-b75f-9972-491f557edf74@189.cn>
 <CAKMK7uE-azFT02Sp2FDfMGTc57eYJEn8iM8Wk1mt5ucPs1qM-w@mail.gmail.com>
 <59dff860-9d1f-ec66-cd87-28693aa1fad2@suse.de>
 <867ab1ec-4ef9-3d91-2bfb-528cf304513a@189.cn>
In-Reply-To: <867ab1ec-4ef9-3d91-2bfb-528cf304513a@189.cn>

--------------azcvLGVtF0xtPiBZFXst0pIi
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTkuMDQuMjMgdW0gMjA6MzAgc2NocmllYiBTdWkgSmluZ2Zlbmc6DQo+IEhp
LA0KPiANCj4gT24gMjAyMy80LzE5IDIzOjQ2LCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToN
Cj4+IEhpDQo+Pg0KPj4gQW0gMTkuMDQuMjMgdW0gMTc6MDkgc2NocmllYiBEYW5pZWwgVmV0
dGVyOg0KPj4+IE9uIFR1ZSwgMTggQXByIDIwMjMgYXQgMjA6MTYsIFN1aSBKaW5nZmVuZyA8
MTUzMzAyNzMyNjBAMTg5LmNuPiB3cm90ZToNCj4+Pj4NCj4+Pj4gSGksDQo+Pj4+DQo+Pj4+
IE9uIDIwMjMvNC8xOSAwMTo1MiwgU3VpIEppbmdmZW5nIHdyb3RlOg0KPj4+Pj4gSGksDQo+
Pj4+Pg0KPj4+Pj4gT24gMjAyMy80LzE4IDE2OjMyLCBEYW5pZWwgVmV0dGVyIHdyb3RlOg0K
Pj4+Pj4+IE9uIE1vbiwgQXByIDE3LCAyMDIzIGF0IDA3OjMyOjE5UE0gKzA4MDAsIFN1aSBK
aW5nZmVuZyB3cm90ZToNCj4+Pj4+Pj4gVGhlIGZiZGV2IHRlc3Qgb2YgSUdUIG1heSB3cml0
ZSBhZnRlciBFT0YsIHdoaWNoIGxlYWQgdG8gDQo+Pj4+Pj4+IG91dC1vZi1ib3VuZA0KPj4+
Pj4+PiBhY2Nlc3MgZm9yIHRoZSBkcm0gZHJpdmVycyB1c2luZyBmYmRldi1nZW5lcmljLiBG
b3IgZXhhbXBsZSwgb24gYSANCj4+Pj4+Pj4geDg2DQo+Pj4+Pj4+ICsgYXNwZWVkIGJtYyBj
YXJkIHBsYXRmb3JtLCB3aXRoIGEgMTY4MHgxMDUwIHJlc29sdXRpb24gZGlzcGxheSwNCj4+
Pj4+Pj4gcnVubmluZw0KPj4+Pj4+PiBmYmRldiB0ZXN0IGlmIElHVCB3aWxsIGNhdXNlIHRo
ZSBsaW51eCBrZXJuZWwgaGFuZyB3aXRoIHRoZSANCj4+Pj4+Pj4gZm9sbG93aW5nDQo+Pj4+
Pj4+IGNhbGwgdHJhY2U6DQo+Pj4+Pj4+DQo+Pj4+Pj4+IMKgwqDCoCBPb3BzOiAwMDAwIFsj
MV0gUFJFRU1QVCBTTVAgUFRJDQo+Pj4+Pj4+IMKgwqDCoCBbSUdUXSBmYmRldjogc3RhcnRp
bmcgc3VidGVzdCBlb2YNCj4+Pj4+Pj4gwqDCoMKgIFdvcmtxdWV1ZTogZXZlbnRzIGRybV9m
Yl9oZWxwZXJfZGFtYWdlX3dvcmsgW2RybV9rbXNfaGVscGVyXQ0KPj4+Pj4+PiDCoMKgwqAg
W0lHVF0gZmJkZXY6IHN0YXJ0aW5nIHN1YnRlc3QgbnVsbHB0cg0KPj4+Pj4+Pg0KPj4+Pj4+
PiDCoMKgwqAgUklQOiAwMDEwOm1lbWNweV9lcm1zKzB4YS8weDIwDQo+Pj4+Pj4+IMKgwqDC
oCBSU1A6IDAwMTg6ZmZmZmExN2Q0MDE2N2Q5OCBFRkxBR1M6IDAwMDEwMjQ2DQo+Pj4+Pj4+
IMKgwqDCoCBSQVg6IGZmZmZhMTdkNGViN2ZhODAgUkJYOiBmZmZmYTE3ZDQwZTBhYTgwIFJD
WDogDQo+Pj4+Pj4+IDAwMDAwMDAwMDAwMDE0YzANCj4+Pj4+Pj4gwqDCoMKgIFJEWDogMDAw
MDAwMDAwMDAwMWE0MCBSU0k6IGZmZmZhMTdkNDBlMGIwMDAgUkRJOiANCj4+Pj4+Pj4gZmZm
ZmExN2Q0ZWI4MDAwMA0KPj4+Pj4+PiDCoMKgwqAgUkJQOiBmZmZmYTE3ZDQwMTY3ZTIwIFIw
ODogMDAwMDAwMDAwMDAwMDAwMCBSMDk6IA0KPj4+Pj4+PiBmZmZmODk1MjJlY2ZmOGMwDQo+
Pj4+Pj4+IMKgwqDCoCBSMTA6IGZmZmZhMTdkNGU0YzUwMDAgUjExOiAwMDAwMDAwMDAwMDAw
MDAwIFIxMjogDQo+Pj4+Pj4+IGZmZmZhMTdkNGViN2ZhODANCj4+Pj4+Pj4gwqDCoMKgIFIx
MzogMDAwMDAwMDAwMDAwMWE0MCBSMTQ6IDAwMDAwMDAwMDAwMDA0MWEgUjE1OiANCj4+Pj4+
Pj4gZmZmZmExN2Q0MDE2N2UzMA0KPj4+Pj4+PiDCoMKgwqAgRlM6wqAgMDAwMDAwMDAwMDAw
MDAwMCgwMDAwKSBHUzpmZmZmODk1MjU3MzgwMDAwKDAwMDApDQo+Pj4+Pj4+IGtubEdTOjAw
MDAwMDAwMDAwMDAwMDANCj4+Pj4+Pj4gwqDCoMKgIENTOsKgIDAwMTAgRFM6IDAwMDAgRVM6
IDAwMDAgQ1IwOiAwMDAwMDAwMDgwMDUwMDMzDQo+Pj4+Pj4+IMKgwqDCoCBDUjI6IGZmZmZh
MTdkNDBlMGIwMDAgQ1IzOiAwMDAwMDAwMWVhZWNhMDA2IENSNDogDQo+Pj4+Pj4+IDAwMDAw
MDAwMDAxNzA2ZTANCj4+Pj4+Pj4gwqDCoMKgIENhbGwgVHJhY2U6DQo+Pj4+Pj4+IMKgwqDC
oMKgIDxUQVNLPg0KPj4+Pj4+PiDCoMKgwqDCoCA/IGRybV9mYmRldl9nZW5lcmljX2hlbHBl
cl9mYl9kaXJ0eSsweDIwNy8weDMzMCANCj4+Pj4+Pj4gW2RybV9rbXNfaGVscGVyXQ0KPj4+
Pj4+PiDCoMKgwqDCoCBkcm1fZmJfaGVscGVyX2RhbWFnZV93b3JrKzB4OGYvMHgxNzAgW2Ry
bV9rbXNfaGVscGVyXQ0KPj4+Pj4+PiDCoMKgwqDCoCBwcm9jZXNzX29uZV93b3JrKzB4MjFm
LzB4NDMwDQo+Pj4+Pj4+IMKgwqDCoMKgIHdvcmtlcl90aHJlYWQrMHg0ZS8weDNjMA0KPj4+
Pj4+PiDCoMKgwqDCoCA/IF9fcGZ4X3dvcmtlcl90aHJlYWQrMHgxMC8weDEwDQo+Pj4+Pj4+
IMKgwqDCoMKgIGt0aHJlYWQrMHhmNC8weDEyMA0KPj4+Pj4+PiDCoMKgwqDCoCA/IF9fcGZ4
X2t0aHJlYWQrMHgxMC8weDEwDQo+Pj4+Pj4+IMKgwqDCoMKgIHJldF9mcm9tX2ZvcmsrMHgy
Yy8weDUwDQo+Pj4+Pj4+IMKgwqDCoMKgIDwvVEFTSz4NCj4+Pj4+Pj4gwqDCoMKgIENSMjog
ZmZmZmExN2Q0MGUwYjAwMA0KPj4+Pj4+PiDCoMKgwqAgLS0tWyBlbmQgdHJhY2UgMDAwMDAw
MDAwMDAwMDAwMCBdLS0tDQo+Pj4+Pj4+DQo+Pj4+Pj4+IFRoZSBkaXJlY3QgcmVhc29uIGlz
IHRoYXQgZGFtYWdlIHJlY3RhbmdlIGNvbXB1dGVkIGJ5DQo+Pj4+Pj4+IGRybV9mYl9oZWxw
ZXJfbWVtb3J5X3JhbmdlX3RvX2NsaXAoKSBkb2VzIG5vdCBndWFyYW50ZWVkIHRvIGJlDQo+
Pj4+Pj4+IGluLWJvdW5kLg0KPj4+Pj4+PiBJdCBpcyBhbHJlYWR5IHJlc3VsdHMgaW4gd29y
a2Fyb3VuZCBjb2RlIHBvcHVsYXRlIHRvIGVsc2V3aGVyZS4gDQo+Pj4+Pj4+IEFub3RoZXIN
Cj4+Pj4+Pj4gcmVhc29uIGlzIHRoYXQgZXhwb3NpbmcgYSBsYXJnZXIgYnVmZmVyIHNpemUg
dGhhbiB0aGUgYWN0dWFsIG5lZWRlZA0KPj4+Pj4+PiBoZWxwDQo+Pj4+Pj4+IHRvIHRyaWdn
ZXIgdGhpcyBidWcgaW50cmluc2ljIGluIA0KPj4+Pj4+PiBkcm1fZmJfaGVscGVyX21lbW9y
eV9yYW5nZV90b19jbGlwKCkuDQo+Pj4+Pj4+DQo+Pj4+Pj4+IE90aGVycyBmYmRldiBlbXVs
YXRpb24gc29sdXRpb25zIHdyaXRlIHRvIHRoZSBHRU0gYnVmZmVyIA0KPj4+Pj4+PiBkaXJl
Y3RseSwgdGhleQ0KPj4+Pj4+PiB3b24ndCByZXByb2R1Y2UgdGhpcyBidWcgYmVjYXVzZSB0
aGUgLmZiX2RpcnR5IGZ1bmN0aW9uIGNhbGxiYWNrIA0KPj4+Pj4+PiBkbyBub3QNCj4+Pj4+
Pj4gYmVpbmcgaG9va2VkLCBzbyBubyBjaGFuY2UgaXMgZ2l2ZW4gdG8NCj4+Pj4+Pj4gZHJt
X2ZiX2hlbHBlcl9tZW1vcnlfcmFuZ2VfdG9fY2xpcCgpDQo+Pj4+Pj4+IHRvIGdlbmVyYXRl
IGEgb3V0LW9mLWJvdW5kIHdoZW4gZHJtX2ZiX2hlbHBlcl9zeXNfd3JpdGUoKSBpcyBjYWxs
ZWQuDQo+Pj4+Pj4+DQo+Pj4+Pj4+IFRoaXMgcGF0Y2ggYnJlYWsgdGhlIHRyaWdnZXIgY29u
ZGl0aW9uIG9mIHRoaXMgYnVnIGJ5IHNocmlua2luZyB0aGUNCj4+Pj4+Pj4gc2hhZG93DQo+
Pj4+Pj4+IGJ1ZmZlciBzaXplIHRvIHNpemVzLT5zdXJmYWNlX2hlaWdodCAqIGJ1ZmZlci0+
ZmItPnBpdGNoZXNbMF0uDQo+Pj4+Pj4+DQo+Pj4+Pj4+IEZpeGVzOiAnOGZiYzlhZjU1ZGUw
ICgiZHJtL2ZiZGV2LWdlbmVyaWM6IFNldCBzY3JlZW4gc2l6ZSB0byBzaXplIG9mDQo+Pj4+
Pj4+IEdFTQ0KPj4+Pj4+PiBidWZmZXIiKScNCj4+Pj4+Pj4NCj4+Pj4+Pj4gU2lnbmVkLW9m
Zi1ieTogU3VpIEppbmdmZW5nIDxzdWlqaW5nZmVuZ0Bsb29uZ3Nvbi5jbj4NCj4+Pj4+Pj4g
LS0tDQo+Pj4+Pj4+IMKgwqAgZHJpdmVycy9ncHUvZHJtL2RybV9mYmRldl9nZW5lcmljLmMg
fCAyICstDQo+Pj4+Pj4+IMKgwqAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pDQo+Pj4+Pj4+DQo+Pj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX2ZiZGV2X2dlbmVyaWMuYw0KPj4+Pj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9k
cm1fZmJkZXZfZ2VuZXJpYy5jDQo+Pj4+Pj4+IGluZGV4IDhlNTE0OGJmNDBiYi4uYjA1N2Nm
YmJhOTM4IDEwMDY0NA0KPj4+Pj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiZGV2
X2dlbmVyaWMuYw0KPj4+Pj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiZGV2X2dl
bmVyaWMuYw0KPj4+Pj4+PiBAQCAtOTQsNyArOTQsNyBAQCBzdGF0aWMgaW50DQo+Pj4+Pj4+
IGRybV9mYmRldl9nZW5lcmljX2hlbHBlcl9mYl9wcm9iZShzdHJ1Y3QgZHJtX2ZiX2hlbHBl
ciAqZmJfaGVscGVyLA0KPj4+Pj4+PiDCoMKgwqDCoMKgwqAgZmJfaGVscGVyLT5idWZmZXIg
PSBidWZmZXI7DQo+Pj4+Pj4+IMKgwqDCoMKgwqDCoCBmYl9oZWxwZXItPmZiID0gYnVmZmVy
LT5mYjsNCj4+Pj4+Pj4gwqDCoCAtwqDCoMKgIHNjcmVlbl9zaXplID0gYnVmZmVyLT5nZW0t
PnNpemU7DQo+Pj4+Pj4+ICvCoMKgwqAgc2NyZWVuX3NpemUgPSBzaXplcy0+c3VyZmFjZV9o
ZWlnaHQgKiBidWZmZXItPmZiLT5waXRjaGVzWzBdOw0KPj4+Pj4+IFNvIEkgcmVhZCBjb3Jl
IHNvbWUgbW9yZSBhbmQgc3R1bWJsZWQgb3ZlciANCj4+Pj4+PiBkcm1fZmJfaGVscGVyX2Rl
ZmVycmVkX2lvKCkuDQo+Pj4+Pj4gV2hpY2ggaGFzIGFsbCB0aGUgY29kZSBhbmQgY29tbWVu
dHMgYWJvdXQgdGhpcywgaW5jbHVkaW5nIGxpbWl0aW5nLg0KPj4+Pj4+DQo+Pj4+Pj4gSSB0
aGluayBpdCB3b3VsZCBiZSBjbGVhcmVyIGlmIHdlIGZpeCB0aGUgaXNzdWUgdGhlcmUsIGlu
c3RlYWQgb2YNCj4+Pj4+PiBwYXNzaW5nDQo+Pj4+Pj4gbGltaXRzIGFyb3VuZCBpbiBvYnNj
dXJlIHBsYWNlcyB0aGF0IHRoZW4gYWdhaW4gZ2V0IGJyb2tlbj8NCj4+Pj4+DQo+Pj4+PiBO
bywgaXQgaXMgbW9yZSBvYnNjdXJlIGRvaW5nIHRoYXQgd2F5Li4uDQo+Pj4+Pg0KPj4+Pj4N
Cj4+Pj4+IEFzIHRoZSBzaXplIG9mIHRoZSBzaGFkb3cgc2NyZWVuIGJ1ZmZlciB3aWxsIGJl
IGV4cG9zZWQgdG8gdXNlcnNwYWNlLg0KPj4+Pj4NCj4+Pj4+IFRoZSBzaXplICdoZWxwZXIt
PmZiLT5oZWlnaHQgKiBoZWxwZXItPmZiLT5waXRjaGVzWzBdJyBpcyBhDQo+Pj4+PiBleGFj
dGx5KGJlc3QpIGZpdCwNCj4+Pj4+DQo+Pj4+PiBZb3UgYXJlIGd1YXJhbnRlZWQgdG8gd2Fz
dGUgYXQgbGVhc2Ugb25lIGJ5dGUgYnkgaW5jcmVhc2luZyBvbmUgYnl0ZSwNCj4+Pj4+DQo+
Pj4+PiBhbmQgY2FuIG5vdCBzdG9yZSBhbGwgcGl4ZWxzIGJ5IGRlY3JlYXNpbmcgb25lIGJ5
dGUgKEluIHRoZSBjYXNlIHdoZXJlDQo+Pj4+PiBgaGVscGVyLT5mYi0+cGl0Y2hlc1swXSA9
IGhlbHBlci0+ZmItPndpZHRoICogNGApLg0KPj4+Pj4NCj4+Pj4+IEl0IGltcGxpY2l0bHkg
dGVsbCB0aGUgdXNlcnNwYWNlIGRvIG5vdCBnbyBiZXlvbmQgdGhhdCBib3VuZGFyeS4NCj4+
Pj4+DQo+Pj4+PiBhbHRob3VnaCB1c2Vyc3BhY2UgcHJvZ3JhbSBjYW4gc3RpbGwgY2hvb3Nl
IHRvIHdyaXRlwqAgYWZ0ZXIgRU9GLA0KPj4+Pj4NCj4+Pj4+IEJ1dCBpdCBpcyBmb3IgdGVz
dCBwdXJwb3NlLCB0byB0ZXN0IHRoZSBrZXJuZWwgaWYgaXQgY2FuIHJldHVybiBhDQo+Pj4+
PiAtRUZCSUcgb3Igbm90Lg0KPj4+Pj4NCj4+Pj4+PiBUaGUgdGhpbmcgaXMsDQo+Pj4+Pj4g
VGhvbWFzIGJvdGggYXV0aG9yZWQgdGhlIGxpbWl0IGNoZWNrcyBpbiANCj4+Pj4+PiBkcm1f
ZmJfaGVscGVyX2RlZmVycmVkX2lvKCkgYW5kDQo+Pj4+Pj4gdGhlIHBhdGNoIHdoaWNoIGJy
b2tlbiB0aGVtIGFnYWluLCBzbyBjbGVhcmx5IHRoaXMgaXNuJ3QgdmVyeQ0KPj4+Pj4+IG9i
dmlvdXMuIEknbQ0KPj4+Pj4+IHRoaW5raW5nIG9mIHNvbWV0aGluZyBsaWtlIHRoaXM6DQo+
Pj4+Pj4NCj4+Pj4+Pg0KPj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJt
X2ZiX2hlbHBlci5jDQo+Pj4+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5j
DQo+Pj4+Pj4gaW5kZXggZWY0ZWI4YjEyNzY2Li43MjZkYWI2N2MzNTkgMTAwNjQ0DQo+Pj4+
Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYw0KPj4+Pj4+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMNCj4+Pj4+PiBAQCAtNjk3LDEwICs2
OTcsNyBAQCB2b2lkIGRybV9mYl9oZWxwZXJfZGVmZXJyZWRfaW8oc3RydWN0IGZiX2luZm8N
Cj4+Pj4+PiAqaW5mbywgc3RydWN0IGxpc3RfaGVhZCAqcGFnZXJlZmxpDQo+Pj4+Pj4gwqDC
oMKgwqDCoMKgwqAgKiBvZiB0aGUgc2NyZWVuIGFuZCBhY2NvdW50IGZvciBub24tZXhpc3Rp
bmcgc2NhbmxpbmVzLiANCj4+Pj4+PiBIZW5jZSwNCj4+Pj4+PiDCoMKgwqDCoMKgwqDCoCAq
IGtlZXAgdGhlIGNvdmVyZWQgbWVtb3J5IGFyZWEgd2l0aGluIHRoZSBzY3JlZW4gYnVmZmVy
Lg0KPj4+Pj4+IMKgwqDCoMKgwqDCoMKgICovDQo+Pj4+Pj4gLcKgwqDCoCBpZiAoaW5mby0+
c2NyZWVuX3NpemUpDQo+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgIHRvdGFsX3NpemUgPSBpbmZv
LT5zY3JlZW5fc2l6ZTsNCj4+Pj4+PiAtwqDCoMKgIGVsc2UNCj4+Pj4+PiAtwqDCoMKgwqDC
oMKgwqAgdG90YWxfc2l6ZSA9IGluZm8tPmZpeC5zbWVtX2xlbjsNCj4+Pj4+PiArwqDCoMKg
IHRvdGFsX3NpemUgPSBoZWxwZXItPmZiLT5oZWlnaHQgKiBoZWxwZXItPmZiLT5waXRjaGVz
WzBdOw0KPj4+Pj4NCj4+Pj4+IFRoaXMgaXMganVzdCB0byBtaXRpZ2F0ZSB0aGUgbWlzdGFr
ZXMgYWxyZWFkeSBoYXMgYmVlbiBtYWRlLA0KPj4+Pj4NCj4+Pj4+IGJlY2F1c2UgaXTCoCBk
byBub3QgZG8gYSBnb29kIHNwbGl0dGluZyBiZXR3ZWVuIHRoZSAqY2xpcCogcGFydCBhbmQg
dGhlDQo+Pj4+PiAqZGFtYWdlIHVwZGF0ZSogcGFydC4NCj4+Pj4+DQo+Pj4+PiBBbiBpZGVh
bCBjbGlwcGluZyBkbyBub3Qgb2JzY3VyZSBpdHMgdXBkYXRpbmcgYmFja2VuZCB3aXRoIGEN
Cj4+Pj4+IG91dC1vZi1ib3VuZCBkYW1hZ2UgcmVjdGFuZ2xlLg0KPj4+Pj4NCj4+Pj4+IFdo
eSBkaWQgdGhlIGRybV9mYl9oZWxwZXJfbWVtb3J5X3JhbmdlX3RvX2NsaXAoKSBjYW4gbm90
IGRvIGEgZ29vZCBqb2INCj4+Pj4+IGluIGFsbCBjYXNlDQo+Pj4+Pg0KPj4+Pj4gdG8gcGFz
cyBpdHMgYmFja2VuZCBhIGFsd2F5cyBtZWFuaW5nZnVsIGRhbWFnZSByZWN0ID8NCj4+Pj4+
DQo+Pj4+Pj4gwqDCoMKgwqDCoMKgIG1heF9vZmYgPSBtaW4obWF4X29mZiwgdG90YWxfc2l6
ZSk7DQo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoCBpZiAobWluX29mZiA8IG1heF9vZmYpIHsN
Cj4+Pj4+Pg0KPj4+Pj4+DQo+Pj4+Pj4gSSB0aGluayB0aGF0IHdvdWxkIG1ha2UgaXQgdXRt
b3N0IGNsZWFyIG9uIHdoYXQgd2UncmUgZG9pbmcgYW5kIHdoeS4NCj4+Pj4+PiBPdGhlcndp
c2Ugd2UncmUganVzdCBnb2luZyB0byByZS1jcmVhdGUgdGhlIHNhbWUgYnVnIGFnYWluLCBs
aWtlIA0KPj4+Pj4+IHdlJ3ZlDQo+Pj4+Pj4gZG9uZSBhbHJlYWR5IDotKQ0KPj4+Pj4NCj4+
Pj4+IE5vLCB3ZSBjcmVhdGUgbm8gYnVncywgd2UgZml4IG9uZS4NCj4+Pj4+DQo+Pj4+PiBU
aGFua3MuDQo+Pj4+Pg0KPj4+PiBCdXQgaG9uZXN0bHkgSSBkbyBub3QgaGF2ZSBzdHJvbmcg
ZmVlbCB0b3dhcmQgdGhpcywgSSBqdXN0IHR5cGUgd2hhdCANCj4+Pj4gSSdtDQo+Pj4+IHVu
ZGVyc3RhbmQgd2l0aG91dCBzZWVpbmcgeW91IHJlc2VuZCBhIFYzLg0KPj4+Pg0KPj4+PiBJ
dCdzIE9LIGluIG92ZXJhbGwswqAgSSB3aWxsIGhlbHAgdG8gdGVzdCB0aGlzIHRvbW9ycm93
LsKgIDotKQ0KPj4+DQo+Pj4gQXBvbG9naWVzIGZvciBtYWtpbmcgeW91IGp1bXAgYXJvdW5k
IGFsbCB0aGUgdGltZSBhbmQgZG9pbmcgZGlmZmVyZW50DQo+Pj4gdmVyc2lvbnMgb2YgdGhl
IHNhbWUgYnVnZml4IDotLw0KPj4+DQo+Pj4gSSB0aGluayB0aGlzIG9uZSBoZXJlIGlzIG9r
IHRvIG1lcmdlLCBJIGp1c3QgdGhvdWdodCB3aGVuIGxvb2tpbmcgYXQNCj4+PiB0aGUgaGlz
dG9yeSB0aGF0IHdlIHJldmVydCB0aGUgZXhhY3QgcGF0Y2ggd2l0aG91dCBhbnkgb3RoZXIg
Y2hhbmdlcw0KPj4+IG9yIGNvbW1lbnRzLCBhbmQgdXN1YWxseSB0aGF0IG1lYW5zIHNvbWVv
bmUgd2lsbCBjb21lIHVwIHdpdGggdGhlIHNhbWUNCj4+PiBjbGVhbnVwIGlkZWEgYWdhaW4s
IGFuZCB0aGVuIHdlJ2xsIGhhdmUgYSBidWcgYWdhaW4uIFNvIG1heWJlIGENCj4+PiBjb21t
ZW50IG9yIGEgV0FSTl9PTiBvciBzb21ldGhpbmcgZWxzZSB3b3VsZCBiZSBnb29kLg0KPj4+
DQo+Pj4gSSBndWVzcyB3ZSBjb3VsZCBhbHNvIGRvIHlvdXIgcGF0Y2gsIGJ1dCBwdXQgYSBX
QVJOX09OIHRoYXQgdGhlDQo+Pj4gY29tcHV0ZWQgdG90YWxfc2l6ZSBpcyBuZXZlciBiaWdn
ZXIgdGhhbiB0aGUgZHJtX2ZiIHNpemUgaW50bw0KPj4+IGRybV9mYl9oZWxwZXJfZGVmZXJy
ZWRfaW8oKT8gVGhhdCB3b3VsZCBhbHNvIG1ha2Ugc3VyZSB0aGF0IHRoaXMgYnVnDQo+Pj4g
ZG9lc24ndCBnZXQgcmVzdXJyZWN0ZWQgYWdhaW4uDQo+Pg0KPj4gV2UnZCBoYXZlIHRvIHB1
dCB0aGlzIHRlc3QgaW50byBkcm1fZmJkZXZfZ2VuZXJpYy5jLiBPdGhlcndpc2Ugd2UnbGwg
DQo+PiBicmVhayBpOTE1LCB3aGljaCBhbHNvIHVzZXMgZGVmZXJyZWQgSS9PLCBidXQgd2l0
aG91dCBzaGFkb3cgDQo+PiBidWZmZXJpbmcuLiBNYXliZSB0ZXN0IGluIGRybV9mYmRldl9n
ZW5lcmljX2hlbHBlcl9mYl9kaXJ0eSgpIGlmIHRoZSANCj4+IGNsaXAgcmVjdGFuZ2xlIGV4
dGVuZHMgdGhlIGZyYW1lYnVmZmVyIHNpemUuDQo+Pg0KPiBZZWFoLCBpOTE1IGNhcnZlIG91
dCBwYXJ0IG9mIHN5c3RlbSByYW0gYXMgdmlkZW8gbWVtb3J5LMKgIGl0IGlzIGFsc28gDQo+
IGNhbGxlZCBzdG9sZW4gbWVtb3J5Lg0KPiANCj4gSSBqdXN0IGxlYXJuZWQgaXQgcmVjZW50
bHkgZnJvbSBpOTE1IHJlbGF0ZWQgZG9jdW1lbnQuDQo+IA0KPiANCj4gQnV0IGZyb20gd2hh
dCBJJ20gdW5kZXJzdGFuZGluZywgSXQncyBzdGlsbCBSQU0gaW4gaXRzIG5hdHVyZSwganVz
dCANCj4gcmVzZXJ2ZWQgYnkgZmlybXdhcmUuDQo+IA0KPiBJdHMgYmFuZHdpZHRoIGlzIGV4
dHJlbWVseSBoaWdoLCB3aHkgbm90IHdyaXRlIHRvIHRoZSBHRU0gYnVmZmVyIGRpcmVjdGx5
Pw0KPiANCj4gd2h5IGRlZmVycmVkIEkvTyBwYXkgb2ZmPw0KDQppOTE1IGRvZXNuJ3QgdXNl
IHNoYWRvdyBidWZmZXJpbmcuIEkgb25seSBmbHVzaGVzIGl0cyBjYWNoZXMgaW4gcmVndWxh
ciANCmludGVydmFsczogDQpodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC9sYXRl
c3Qvc291cmNlL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZmIuYyNMMTg2
NSANCi4gVGhlIGFjdHVhbCBjbGlwcGluZyByZWN0YW5nbGUgaXMgbm90IHJlbGV2YW50Lg0K
DQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiANCj4+IEJlc3QgcmVnYXJkcw0KPj4g
VGhvbWFzDQo+Pg0KPj4+IC1EYW5pZWwNCj4+DQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4N
CkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdl
cm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1h
bnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxkLCBCb3Vk
aWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------azcvLGVtF0xtPiBZFXst0pIi--

--------------HbPLyu0paUaLMRW1eWsdSnh5
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmRA4igFAwAAAAAACgkQlh/E3EQov+Bd
3BAApglO58Ji0nMcHhyM/akAPknePw+6nRBZcINLib0p8GgyXtz7fleRS8V7/V1c6gXQuo4Oprpn
4An29PXp/eyX4ikjrS+OaID5Ifvph7kJznU04svBc6z2oQi/phN8xHEO68Ig4V4JXXSEP/cDMoI9
FjXqY2PAnyrNshO6qcCYCTZwRroXCAhsflE1yi9FfOtKpILDOVawaR9V4Dn54itk5PeXw3QefqUD
Fsp60u5Mx3Z34oQdf4IXKvcexKEL2Ac9SKdIAPfWMUJbAvONqjLaY3E0klocD59ASEsPw6ub/c/5
xSGJjHNAAxEQnTP4cxtWaLDa1WsYV+nTeRabR0G7pQ2LNQgafr+Z1LrjS02BUlaYMvtbYBIisjGw
beabxL6MMSFyniwOGGMFBLiZAFz0I2Kd9bP/4r/G8ZGi+at4mcN2TZPP6ywz+S7YcJAyTKhp5mRI
lkLZfK9K9cic/3qS+ID+Q0lpghHY7GhfW+4zHvSzLE2WTjyXy5ZjJQWfoX8CFsFApkF8EVP/rqZU
nm4fnsqnLSBAYl6EWLJn876uuR4VvWVX+izdn51wI5pW4IrvbOQA8hQYnMbi7jAUMixi835q1qxQ
8SMSXSRxqfb/oI4EtdpjE03M3UA1uSAGAr+I9wB540P9aLYn9fYRiV3gEjW20v7JleugQvHWipTC
VJI=
=Hxy8
-----END PGP SIGNATURE-----

--------------HbPLyu0paUaLMRW1eWsdSnh5--
