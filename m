Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D16766E14FB
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 21:16:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9F9D10EBF1;
	Thu, 13 Apr 2023 19:16:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DC7910EBEE
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 19:16:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id BA1801FD70;
 Thu, 13 Apr 2023 19:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1681413395; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UZ84NE6eHS0P+kUbcSWEbvYAi0L3z1iClyO7JQPD/Jc=;
 b=xqNMquoXQgo7bR11bNel3jqCX+5LrtqZEpY5hWASAvpfxeE7QFFs7jv4d0uEcxyNT7NXbP
 /VzNwTMMIIPOOG/HFEppfPTcXXQ1s3MS08P8iiLYwe5GkZM+cUecRo5Zd93c/qbUlC1flx
 vu6u12dzYS6wqDKGJKD//pAsgqHHE7o=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1681413395;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UZ84NE6eHS0P+kUbcSWEbvYAi0L3z1iClyO7JQPD/Jc=;
 b=qCAfbImmBE8Et0mV2OyAjUTTcKdPZrgOVL+MdLgB9FaZMgufFtRA/VqwueOxrHcLZ+CQgj
 v/Ty5/juwcWhHhBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 606331390E;
 Thu, 13 Apr 2023 19:16:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id m1cwFhNVOGRMRAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 13 Apr 2023 19:16:35 +0000
Message-ID: <fccc494f-0e52-5fdf-0e40-acc29177c73c@suse.de>
Date: Thu, 13 Apr 2023 21:16:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2] drm/fbdev-generic: prohibit potential out-of-bounds
 access
To: Sui Jingfeng <15330273260@189.cn>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sui Jingfeng <suijingfeng@loongson.cn>, Li Yi <liyi@loongson.cn>,
 Javier Martinez Canillas <javierm@redhat.com>, Helge Deller <deller@gmx.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20230413180622.1014016-1-15330273260@189.cn>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230413180622.1014016-1-15330273260@189.cn>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------kw7iFhKw13vJ7UmbMcAblKY4"
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
Cc: loongson-kernel@lists.loongnix.cn, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------kw7iFhKw13vJ7UmbMcAblKY4
Content-Type: multipart/mixed; boundary="------------6vEJ0gbTbdJmFYokKbgtqE9W";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sui Jingfeng <15330273260@189.cn>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sui Jingfeng <suijingfeng@loongson.cn>, Li Yi <liyi@loongson.cn>,
 Javier Martinez Canillas <javierm@redhat.com>, Helge Deller <deller@gmx.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Cc: linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, loongson-kernel@lists.loongnix.cn
Message-ID: <fccc494f-0e52-5fdf-0e40-acc29177c73c@suse.de>
Subject: Re: [PATCH v2] drm/fbdev-generic: prohibit potential out-of-bounds
 access
References: <20230413180622.1014016-1-15330273260@189.cn>
In-Reply-To: <20230413180622.1014016-1-15330273260@189.cn>

--------------6vEJ0gbTbdJmFYokKbgtqE9W
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCnRoYW5rcyBmb3IgdGhlIHBhdGNoLiBUaGlzIGlzIGVmZmVjdGl2ZWx5IGEgcmV2
ZXJ0IG9mIGNvbW1pdCANCjhmYmM5YWY1NWRlMCAoImRybS9mYmRldi1nZW5lcmljOiBTZXQg
c2NyZWVuIHNpemUgdG8gc2l6ZSBvZiBHRU0gDQpidWZmZXIiKS4gUGxlYXNlIGFkZCBhIEZp
eGVzIHRhZy4NCg0KQW0gMTMuMDQuMjMgdW0gMjA6MDYgc2NocmllYiBTdWkgSmluZ2Zlbmc6
DQo+IEZyb206IFN1aSBKaW5nZmVuZyA8c3VpamluZ2ZlbmdAbG9vbmdzb24uY24+DQo+IA0K
PiBUaGUgY3JhenkgZmJkZXYgdGVzdCBvZiBJR1QgbWF5IHdyaXRlIGFmdGVyIEVPRiwgd2hp
Y2ggbGVhZCB0byBvdXQtb2YtYm91bmQNCg0KUGxlYXNlIGRyb3AgJ2NyYXp5Jy4gOikNCg0K
PiBhY2Nlc3MgZm9yIHRoZSBkcm0gZHJpdmVycyB1c2luZyBmYmRldi1nZW5lcmljLiBGb3Ig
ZXhhbXBsZSwgcnVuIGZiZGV2IHRlc3QNCj4gb24gYSB4ODYtNjQrYXN0MjQwMCBwbGF0Zm9y
bSB3aXRoIDE2ODB4MTA1MCByZXNvbHV0aW9uIHdpbGwgY2F1c2UgdGhlIGxpbnV4DQo+IGtl
cm5lbCBoYW5nIHdpdGggZm9sbG93aW5nIGNhbGwgdHJhY2U6DQo+IA0KPiAgICBPb3BzOiAw
MDAwIFsjMV0gUFJFRU1QVCBTTVAgUFRJDQo+ICAgIFtJR1RdIGZiZGV2OiBzdGFydGluZyBz
dWJ0ZXN0IGVvZg0KPiAgICBXb3JrcXVldWU6IGV2ZW50cyBkcm1fZmJfaGVscGVyX2RhbWFn
ZV93b3JrIFtkcm1fa21zX2hlbHBlcl0NCj4gICAgW0lHVF0gZmJkZXY6IHN0YXJ0aW5nIHN1
YnRlc3QgbnVsbHB0cg0KPiANCj4gICAgUklQOiAwMDEwOm1lbWNweV9lcm1zKzB4YS8weDIw
DQo+ICAgIFJTUDogMDAxODpmZmZmYTE3ZDQwMTY3ZDk4IEVGTEFHUzogMDAwMTAyNDYNCj4g
ICAgUkFYOiBmZmZmYTE3ZDRlYjdmYTgwIFJCWDogZmZmZmExN2Q0MGUwYWE4MCBSQ1g6IDAw
MDAwMDAwMDAwMDE0YzANCj4gICAgUkRYOiAwMDAwMDAwMDAwMDAxYTQwIFJTSTogZmZmZmEx
N2Q0MGUwYjAwMCBSREk6IGZmZmZhMTdkNGViODAwMDANCj4gICAgUkJQOiBmZmZmYTE3ZDQw
MTY3ZTIwIFIwODogMDAwMDAwMDAwMDAwMDAwMCBSMDk6IGZmZmY4OTUyMmVjZmY4YzANCj4g
ICAgUjEwOiBmZmZmYTE3ZDRlNGM1MDAwIFIxMTogMDAwMDAwMDAwMDAwMDAwMCBSMTI6IGZm
ZmZhMTdkNGViN2ZhODANCj4gICAgUjEzOiAwMDAwMDAwMDAwMDAxYTQwIFIxNDogMDAwMDAw
MDAwMDAwMDQxYSBSMTU6IGZmZmZhMTdkNDAxNjdlMzANCj4gICAgRlM6ICAwMDAwMDAwMDAw
MDAwMDAwKDAwMDApIEdTOmZmZmY4OTUyNTczODAwMDAoMDAwMCkga25sR1M6MDAwMDAwMDAw
MDAwMDAwMA0KPiAgICBDUzogIDAwMTAgRFM6IDAwMDAgRVM6IDAwMDAgQ1IwOiAwMDAwMDAw
MDgwMDUwMDMzDQo+ICAgIENSMjogZmZmZmExN2Q0MGUwYjAwMCBDUjM6IDAwMDAwMDAxZWFl
Y2EwMDYgQ1I0OiAwMDAwMDAwMDAwMTcwNmUwDQo+ICAgIENhbGwgVHJhY2U6DQo+ICAgICA8
VEFTSz4NCj4gICAgID8gZHJtX2ZiZGV2X2dlbmVyaWNfaGVscGVyX2ZiX2RpcnR5KzB4MjA3
LzB4MzMwIFtkcm1fa21zX2hlbHBlcl0NCj4gICAgIGRybV9mYl9oZWxwZXJfZGFtYWdlX3dv
cmsrMHg4Zi8weDE3MCBbZHJtX2ttc19oZWxwZXJdDQo+ICAgICBwcm9jZXNzX29uZV93b3Jr
KzB4MjFmLzB4NDMwDQo+ICAgICB3b3JrZXJfdGhyZWFkKzB4NGUvMHgzYzANCj4gICAgID8g
X19wZnhfd29ya2VyX3RocmVhZCsweDEwLzB4MTANCj4gICAgIGt0aHJlYWQrMHhmNC8weDEy
MA0KPiAgICAgPyBfX3BmeF9rdGhyZWFkKzB4MTAvMHgxMA0KPiAgICAgcmV0X2Zyb21fZm9y
aysweDJjLzB4NTANCj4gICAgIDwvVEFTSz4NCj4gICAgQ1IyOiBmZmZmYTE3ZDQwZTBiMDAw
DQo+ICAgIC0tLVsgZW5kIHRyYWNlIDAwMDAwMDAwMDAwMDAwMDAgXS0tLQ0KPiANCj4gVGhl
IGluZGlyZWN0IHJlYXNvbiBpcyBkcm1fZmJfaGVscGVyX21lbW9yeV9yYW5nZV90b19jbGlw
KCkgZ2VuZXJhdGUgZGFtYWdlDQo+IHJlY3RhbmdsZXMgd2hpY2ggcGFydGlhbGx5IG9yIGNv
bXBsZXRlbHkgZ28gb3V0IG9mIHRoZSBhY3RpdmUgZGlzcGxheSBhcmVhLg0KPiBUaGUgc2Vj
b25kIG9mIGFyZ3VtZW50ICdvZmYnIGlzIHBhc3NpbmcgZnJvbSB0aGUgdXNlci1zcGFjZSwg
dGhpcyB3aWxsIGxlYWQNCj4gdG8gdGhlIG91dC1vZi1ib3VuZCBpZiBpdCBpcyBsYXJnZSB0
aGFuIChmYl9oZWlnaHQgKyAxKSAqIGZiX3BpdGNoZXM7IHdoaWxlDQo+IERJVl9ST1VORF9V
UCgpIG1heSBhbHNvIGNvbnRyb2J1dGUgdG8gZXJyb3IgYnkgMS4NCj4gDQo+IFRoaXMgcGF0
Y2ggd2lsbCBhZGQgY29kZSB0byByZXN0cmljdCB0aGUgZGFtYWdlIHJlY3QgY29tcHV0ZWQg
Z28gYmV5b25kIG9mDQo+IHRoZSBsYXN0IGxpbmUgb2YgdGhlIGZyYW1lYnVmZmVyLg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogU3VpIEppbmdmZW5nIDxzdWlqaW5nZmVuZ0Bsb29uZ3Nvbi5j
bj4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYyAgICAgfCAx
NiArKysrKysrKysrKystLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9mYmRldl9nZW5l
cmljLmMgfCAgMiArLQ0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwg
NSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJt
X2ZiX2hlbHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYw0KPiBpbmRl
eCA2NDQ1ODk4MmJlNDAuLjZiYjFiOGIyN2Q3YSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2RybV9mYl9oZWxwZXIuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Zi
X2hlbHBlci5jDQo+IEBAIC02NDEsMTkgKzY0MSwyNyBAQCBzdGF0aWMgdm9pZCBkcm1fZmJf
aGVscGVyX2RhbWFnZShzdHJ1Y3QgZHJtX2ZiX2hlbHBlciAqaGVscGVyLCB1MzIgeCwgdTMy
IHksDQo+ICAgc3RhdGljIHZvaWQgZHJtX2ZiX2hlbHBlcl9tZW1vcnlfcmFuZ2VfdG9fY2xp
cChzdHJ1Y3QgZmJfaW5mbyAqaW5mbywgb2ZmX3Qgb2ZmLCBzaXplX3QgbGVuLA0KPiAgIAkJ
CQkJICAgICAgIHN0cnVjdCBkcm1fcmVjdCAqY2xpcCkNCj4gICB7DQo+ICsJdTMyIGxpbmVf
bGVuZ3RoID0gaW5mby0+Zml4LmxpbmVfbGVuZ3RoOw0KPiArCXUzMiBmYl9oZWlnaHQgPSBp
bmZvLT52YXIueXJlczsNCj4gICAJb2ZmX3QgZW5kID0gb2ZmICsgbGVuOw0KPiAgIAl1MzIg
eDEgPSAwOw0KPiAtCXUzMiB5MSA9IG9mZiAvIGluZm8tPmZpeC5saW5lX2xlbmd0aDsNCj4g
Kwl1MzIgeTEgPSBvZmYgLyBsaW5lX2xlbmd0aDsNCj4gICAJdTMyIHgyID0gaW5mby0+dmFy
LnhyZXM7DQo+IC0JdTMyIHkyID0gRElWX1JPVU5EX1VQKGVuZCwgaW5mby0+Zml4LmxpbmVf
bGVuZ3RoKTsNCj4gKwl1MzIgeTIgPSBESVZfUk9VTkRfVVAoZW5kLCBsaW5lX2xlbmd0aCk7
DQo+ICsNCj4gKwkvKiBEb24ndCBhbGxvdyBhbnkgb2YgdGhlbSBiZXlvbmQgdGhlIGJvdHRv
bSBib3VuZCBvZiBkaXNwbGF5IGFyZWEgKi8NCj4gKwlpZiAoeTEgPiBmYl9oZWlnaHQpDQo+
ICsJCXkxID0gZmJfaGVpZ2h0Ow0KPiArCWlmICh5MiA+IGZiX2hlaWdodCkNCj4gKwkJeTIg
PSBmYl9oZWlnaHQ7DQo+ICAgDQo+ICAgCWlmICgoeTIgLSB5MSkgPT0gMSkgew0KPiAgIAkJ
LyoNCj4gICAJCSAqIFdlJ3ZlIG9ubHkgd3JpdHRlbiB0byBhIHNpbmdsZSBzY2FubGluZS4g
VHJ5IHRvIHJlZHVjZQ0KPiAgIAkJICogdGhlIG51bWJlciBvZiBob3Jpem9udGFsIHBpeGVs
cyB0aGF0IG5lZWQgYW4gdXBkYXRlLg0KPiAgIAkJICovDQo+IC0JCW9mZl90IGJpdF9vZmYg
PSAob2ZmICUgaW5mby0+Zml4LmxpbmVfbGVuZ3RoKSAqIDg7DQo+IC0JCW9mZl90IGJpdF9l
bmQgPSAoZW5kICUgaW5mby0+Zml4LmxpbmVfbGVuZ3RoKSAqIDg7DQo+ICsJCW9mZl90IGJp
dF9vZmYgPSAob2ZmICUgbGluZV9sZW5ndGgpICogODsNCj4gKwkJb2ZmX3QgYml0X2VuZCA9
IChlbmQgJSBsaW5lX2xlbmd0aCkgKiA4Ow0KDQpQbGVhc2Ugc2NyYXRjaCBhbGwgdGhlc2Ug
Y2hhbmdlcy4gVGhlIGN1cnJlbnQgY29kZSBzaG91bGQgd29yayBhcyANCmludGVuZGVkLiBP
bmx5IHRoZSBnZW5lcmljIGZiZGV2IGVtdWxhdGlvbiB1c2VzIHRoaXMgY29kZSBhbmQgaXQg
c2hvdWxkIA0KcmVhbGx5IGJlIG1vdmVkIHRoZXJlIGF0IHNvbWUgcG9pbnQuDQoNCj4gICAN
Cj4gICAJCXgxID0gYml0X29mZiAvIGluZm8tPnZhci5iaXRzX3Blcl9waXhlbDsNCj4gICAJ
CXgyID0gRElWX1JPVU5EX1VQKGJpdF9lbmQsIGluZm8tPnZhci5iaXRzX3Blcl9waXhlbCk7
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiZGV2X2dlbmVyaWMuYyBi
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJkZXZfZ2VuZXJpYy5jDQo+IGluZGV4IDhlNTE0OGJm
NDBiYi4uYjA1N2NmYmJhOTM4IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJt
X2ZiZGV2X2dlbmVyaWMuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiZGV2X2dl
bmVyaWMuYw0KPiBAQCAtOTQsNyArOTQsNyBAQCBzdGF0aWMgaW50IGRybV9mYmRldl9nZW5l
cmljX2hlbHBlcl9mYl9wcm9iZShzdHJ1Y3QgZHJtX2ZiX2hlbHBlciAqZmJfaGVscGVyLA0K
PiAgIAlmYl9oZWxwZXItPmJ1ZmZlciA9IGJ1ZmZlcjsNCj4gICAJZmJfaGVscGVyLT5mYiA9
IGJ1ZmZlci0+ZmI7DQo+ICAgDQo+IC0Jc2NyZWVuX3NpemUgPSBidWZmZXItPmdlbS0+c2l6
ZTsNCj4gKwlzY3JlZW5fc2l6ZSA9IHNpemVzLT5zdXJmYWNlX2hlaWdodCAqIGJ1ZmZlci0+
ZmItPnBpdGNoZXNbMF07DQoNCkkgZ3Vlc3Mgd2Ugc2ltcGx5IGdvIGJhY2sgdG8gdGhpcyBs
aW5lLiBJJ2QgUi1iIGEgcGF0Y2ggdGhhdCBkb2VzIA0KZXhhY3RseSB0aGlzLg0KDQpCdXQg
c29tZSBleHBsYW5hdGlvbiBpcyBpbiBvcmRlci4gTWF5YmUgeW91IGNhbiBhZGQgdGhpcyBh
cyBhIGNvbW1lbnQgdG8gDQp0aGUgY29tcHV0YXRpb24sIGFzIGl0J3Mgbm90IG9idmlvdXM6
DQoNClRoZSB2YWx1ZSBvZiBzY3JlZW5fc2l6ZSBzaG91bGQgYWN0dWFsbHkgYmUgdGhlIHNp
emUgb2YgdGhlIGdlbSBidWZmZXIuIA0KSW4gYSBwaHlzaWNhbCBmcmFtZWJ1ZmZlciAoaS5l
LiwgdmlkZW8gbWVtb3J5KSwgdGhlIHNpemUgd291bGQgYmUgYSANCm11bHRpcGxlIG9mIHRo
ZSBwYWdlIHNpemUsIGJ1dCBub3QgbmVjZXNzYXJpbHkgYSBtdWx0aXBsZSBvZiB0aGUgc2Ny
ZWVuIA0KcmVzb2x1dGlvbi4gVGhlcmUgYXJlIGFsc28gcGFuIGZiZGV2J3Mgb3BlcmF0aW9u
cywgYW5kIHdlIGNvdWxkIHBvc3NpYmx5IA0KdXNlIERSTSBidWZmZXJzIHRoYXQgYXJlIG5v
dCBtdWx0aXBsZXMgb2YgdGhlIHNjcmVlbiB3aWR0aC4gQnV0IHRoZSANCnVwZGF0ZSBjb2Rl
IHJlcXVpcmVzIHRoZSB1c2Ugb2YgZHJtX2ZyYW1lYnVmZmVyX2Z1bmNzLmRpcnR5LCB3aGlj
aCB0YWtlcyANCmEgY2xpcHBpbmcgcmVjdGFuZ2xlIGFuZCB0aGVyZWZvcmUgZG9lc24ndCB3
b3JrIHdlbGwgd2l0aCB0aGVzZSBvZGQgDQp2YWx1ZXMgZm9yIHNjcmVlbl9zaXplLg0KDQpC
ZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+ICAgCXNjcmVlbl9idWZmZXIgPSB2emFsbG9jKHNj
cmVlbl9zaXplKTsNCj4gICAJaWYgKCFzY3JlZW5fYnVmZmVyKSB7DQo+ICAgCQlyZXQgPSAt
RU5PTUVNOw0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2
ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRz
dHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5i
ZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------6vEJ0gbTbdJmFYokKbgtqE9W--

--------------kw7iFhKw13vJ7UmbMcAblKY4
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQ4VRIFAwAAAAAACgkQlh/E3EQov+D5
fhAAtlkvm3QifdYSU3GGDiC4377tsnVWUM7Pw/L9a2NQSFYF8SlXpV4cnW3+0Cdz/q47h0bGmI/+
LfZqD44wd0JT+K4VEmlEgGulfSQPQU0F23ZZq2a2bTlCSqBS9gvSQI9mLZ8SgT6hoIKTrA9ja2La
hJrba9LNkiwmLVICbT1BC9sZpBfPvGM6Umh5g43GLy6OOh9zSBu7XK3cBL1NhHpO9/ci7PmVPVQt
XA89IFh/M3WJxF2ZewI2n9UFWEsvbRhQdOE5YmAAYh8Ghp+YXa1wUaNL7V0MCZJt6QDwj5kyX1lW
vbwrRLBWJNR8W2OHx/XCqdxusXxVRK+2ILj+0atgvEzPwvjH241ZxrtsVI0iEnyM9dFGUnDv0XGH
DVYz5njRxpykJ4yhyIczoKN4MloZiqqWuopMD+Yz8TEONXHl5EXvBIwPP9uC+Z9SaQNIUDO8Qa6E
TVhV1M8+xQrRaNioYFMqRDmyaIBYqQKBXcKZA8YhGcT4d416Oyn6Tc7LQJTS8Y1G2AdSkzsiXSvA
U0fQFvYJHM/cEMDi/dxKPO5UqFh19EiDP65cW4NOYdHXKTAYswPyVL6J12A5dwfPOvtsaWU7aGrF
TNV9jQpiNttosyn0GBX8vkaZSZszGVXKRXVxzsAlfjqcYQbLrgRk9T7v8UAGyR0P4R9m4TizI96X
UWo=
=8CUH
-----END PGP SIGNATURE-----

--------------kw7iFhKw13vJ7UmbMcAblKY4--
