Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 38FA86EA596
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 10:09:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33B8810E298;
	Fri, 21 Apr 2023 08:09:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8424510E298
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 08:09:50 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D1FCE1FDDC;
 Fri, 21 Apr 2023 08:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1682064587; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/6yA1BklfOx1KaBiy30XD+miJyeXRDcj/ncVy77RAas=;
 b=ucRAmiDxVMNotaXZt71Y9N7Mq5Z77yaIyHH7Zq9CTsl4xCGWNaIRRmKhTWBNpFiEIX8icU
 s7YGmwFIRfmWzU2UeDfT+oQd/CoShBTFevNMmlg8g3qIzYkuX2wrSHqbA/YeSrdSC7Ynlg
 hjJTyPO5fssUtnDNH/J15YGGnfGfkTk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1682064587;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/6yA1BklfOx1KaBiy30XD+miJyeXRDcj/ncVy77RAas=;
 b=tJbpZfVqEzkUF/oAb/dZN5om1IZZ3qcTB2d/OKIMt6pSeRhxTCu0Fhjb4Y6YiHzuQjqjXe
 ofulgpUj/M2pBtDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7FDA71390E;
 Fri, 21 Apr 2023 08:09:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oNwlHstEQmSWJgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 21 Apr 2023 08:09:47 +0000
Message-ID: <4e4f98d9-ad82-4234-4123-e362aac979e6@suse.de>
Date: Fri, 21 Apr 2023 10:09:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v5] drm/fbdev-generic: prohibit potential out-of-bounds
 access
Content-Language: en-US
To: Sui Jingfeng <suijingfeng@loongson.cn>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Li Yi <liyi@loongson.cn>,
 Helge Deller <deller@gmx.de>, Lucas De Marchi <lucas.demarchi@intel.com>
References: <20230420030500.1578756-1-suijingfeng@loongson.cn>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230420030500.1578756-1-suijingfeng@loongson.cn>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------20aCYj0a2J0scgA0B0DBh0WY"
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
--------------20aCYj0a2J0scgA0B0DBh0WY
Content-Type: multipart/mixed; boundary="------------mPUv1XMltaBv0kOsv1WmAtrw";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sui Jingfeng <suijingfeng@loongson.cn>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Li Yi <liyi@loongson.cn>,
 Helge Deller <deller@gmx.de>, Lucas De Marchi <lucas.demarchi@intel.com>
Cc: loongson-kernel@lists.loongnix.cn, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <4e4f98d9-ad82-4234-4123-e362aac979e6@suse.de>
Subject: Re: [PATCH v5] drm/fbdev-generic: prohibit potential out-of-bounds
 access
References: <20230420030500.1578756-1-suijingfeng@loongson.cn>
In-Reply-To: <20230420030500.1578756-1-suijingfeng@loongson.cn>

--------------mPUv1XMltaBv0kOsv1WmAtrw
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjAuMDQuMjMgdW0gMDU6MDUgc2NocmllYiBTdWkgSmluZ2Zlbmc6DQo+IFRo
ZSBmYmRldiB0ZXN0IG9mIElHVCBtYXkgd3JpdGUgYWZ0ZXIgRU9GLCB3aGljaCBsZWFkIHRv
IG91dC1vZi1ib3VuZA0KPiBhY2Nlc3MgZm9yIGRybSBkcml2ZXJzIGhpcmUgZmJkZXYtZ2Vu
ZXJpYy4gRm9yIGV4YW1wbGUsIHJ1biBmYmRldiB0ZXN0DQo+IG9uIGEgeDg2K2FzdDI0MDAg
cGxhdGZvcm0sIHdpdGggMTY4MHgxMDUwIHJlc29sdXRpb24sIHdpbGwgY2F1c2UgdGhlDQo+
IGxpbnV4IGtlcm5lbCBoYW5nIHdpdGggdGhlIGZvbGxvd2luZyBjYWxsIHRyYWNlOg0KDQpJ
J3ZlIG1lcmdlZCB0aGlzIHBhdGNoIGludG8gZHJtLW1pc2MtZml4ZXMuIFRoYW5rcyBmb3Ig
dGhlIGZpeC4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gICAgT29wczogMDAw
MCBbIzFdIFBSRUVNUFQgU01QIFBUSQ0KPiAgICBbSUdUXSBmYmRldjogc3RhcnRpbmcgc3Vi
dGVzdCBlb2YNCj4gICAgV29ya3F1ZXVlOiBldmVudHMgZHJtX2ZiX2hlbHBlcl9kYW1hZ2Vf
d29yayBbZHJtX2ttc19oZWxwZXJdDQo+ICAgIFtJR1RdIGZiZGV2OiBzdGFydGluZyBzdWJ0
ZXN0IG51bGxwdHINCj4gDQo+ICAgIFJJUDogMDAxMDptZW1jcHlfZXJtcysweGEvMHgyMA0K
PiAgICBSU1A6IDAwMTg6ZmZmZmExN2Q0MDE2N2Q5OCBFRkxBR1M6IDAwMDEwMjQ2DQo+ICAg
IFJBWDogZmZmZmExN2Q0ZWI3ZmE4MCBSQlg6IGZmZmZhMTdkNDBlMGFhODAgUkNYOiAwMDAw
MDAwMDAwMDAxNGMwDQo+ICAgIFJEWDogMDAwMDAwMDAwMDAwMWE0MCBSU0k6IGZmZmZhMTdk
NDBlMGIwMDAgUkRJOiBmZmZmYTE3ZDRlYjgwMDAwDQo+ICAgIFJCUDogZmZmZmExN2Q0MDE2
N2UyMCBSMDg6IDAwMDAwMDAwMDAwMDAwMDAgUjA5OiBmZmZmODk1MjJlY2ZmOGMwDQo+ICAg
IFIxMDogZmZmZmExN2Q0ZTRjNTAwMCBSMTE6IDAwMDAwMDAwMDAwMDAwMDAgUjEyOiBmZmZm
YTE3ZDRlYjdmYTgwDQo+ICAgIFIxMzogMDAwMDAwMDAwMDAwMWE0MCBSMTQ6IDAwMDAwMDAw
MDAwMDA0MWEgUjE1OiBmZmZmYTE3ZDQwMTY3ZTMwDQo+ICAgIEZTOiAgMDAwMDAwMDAwMDAw
MDAwMCgwMDAwKSBHUzpmZmZmODk1MjU3MzgwMDAwKDAwMDApIGtubEdTOjAwMDAwMDAwMDAw
MDAwMDANCj4gICAgQ1M6ICAwMDEwIERTOiAwMDAwIEVTOiAwMDAwIENSMDogMDAwMDAwMDA4
MDA1MDAzMw0KPiAgICBDUjI6IGZmZmZhMTdkNDBlMGIwMDAgQ1IzOiAwMDAwMDAwMWVhZWNh
MDA2IENSNDogMDAwMDAwMDAwMDE3MDZlMA0KPiAgICBDYWxsIFRyYWNlOg0KPiAgICAgPFRB
U0s+DQo+ICAgICA/IGRybV9mYmRldl9nZW5lcmljX2hlbHBlcl9mYl9kaXJ0eSsweDIwNy8w
eDMzMCBbZHJtX2ttc19oZWxwZXJdDQo+ICAgICBkcm1fZmJfaGVscGVyX2RhbWFnZV93b3Jr
KzB4OGYvMHgxNzAgW2RybV9rbXNfaGVscGVyXQ0KPiAgICAgcHJvY2Vzc19vbmVfd29yaysw
eDIxZi8weDQzMA0KPiAgICAgd29ya2VyX3RocmVhZCsweDRlLzB4M2MwDQo+ICAgICA/IF9f
cGZ4X3dvcmtlcl90aHJlYWQrMHgxMC8weDEwDQo+ICAgICBrdGhyZWFkKzB4ZjQvMHgxMjAN
Cj4gICAgID8gX19wZnhfa3RocmVhZCsweDEwLzB4MTANCj4gICAgIHJldF9mcm9tX2Zvcmsr
MHgyYy8weDUwDQo+ICAgICA8L1RBU0s+DQo+ICAgIENSMjogZmZmZmExN2Q0MGUwYjAwMA0K
PiAgICAtLS1bIGVuZCB0cmFjZSAwMDAwMDAwMDAwMDAwMDAwIF0tLS0NCj4gDQo+IFRoZSBp
cyBiZWNhdXNlIGRhbWFnZSByZWN0YW5nbGVzIGNvbXB1dGVkIGJ5DQo+IGRybV9mYl9oZWxw
ZXJfbWVtb3J5X3JhbmdlX3RvX2NsaXAoKSBmdW5jdGlvbiBkb2VzIG5vdCBndWFyYW50ZWVk
IHRvIGJlDQo+IGJvdW5kIGluIHRoZSBzY3JlZW4ncyBhY3RpdmUgZGlzcGxheSBhcmVhLiBQ
b3NzaWJsZSByZWFzb25zIGFyZToNCj4gDQo+IDEpIEJ1ZmZlcnMgYXJlIGFsbG9jYXRlZCBp
biB0aGUgZ3JhbnVsYXJpdHkgb2YgcGFnZSBzaXplLCBmb3IgbW1hcCBzeXN0ZW0NCj4gICAg
IGNhbGwgc3VwcG9ydC4gVGhlIHNoYWRvdyBzY3JlZW4gYnVmZmVyIGNvbnN1bWVkIGJ5IGZi
ZGV2IGVtdWxhdGlvbiBtYXkNCj4gICAgIGFsc28gY2hvb3NlZCBiZSBwYWdlIHNpemUgYWxp
Z25lZC4NCj4gDQo+IDIpIFRoZSBESVZfUk9VTkRfVVAoKSB1c2VkIGluIGRybV9mYl9oZWxw
ZXJfbWVtb3J5X3JhbmdlX3RvX2NsaXAoKQ0KPiAgICAgd2lsbCBpbnRyb2R1Y2Ugb2ZmLWJ5
LW9uZSBlcnJvci4NCj4gDQo+IEZvciBleGFtcGxlLCBvbiBhIDE2S0IgcGFnZSBzaXplIHN5
c3RlbSwgaW4gb3JkZXIgdG8gc3RvcmUgYSAxOTIweDEwODANCj4gWFJHQiBmcmFtZWJ1ZmZl
ciwgd2UgbmVlZCBhbGxvY2F0ZSA1MDcgcGFnZXMuIFVuZm9ydHVuYXRlbHksIHRoZSBzaXpl
DQo+IDE5MjAqMTA4MCo0IGNhbiBub3QgYmUgZGl2aWRlZCBleGFjdGx5IGJ5IDE2S0IuDQo+
IA0KPiAgIDE5MjAgKiAxMDgwICogNCA9IDgyOTQ0MDAgYnl0ZXMNCj4gICA1MDYgKiAxNiAq
IDEwMjQgPSA4MjkwMzA0IGJ5dGVzDQo+ICAgNTA3ICogMTYgKiAxMDI0ID0gODMwNjY4OCBi
eXRlcw0KPiANCj4gICBsaW5lX2xlbmd0aCA9IDE5MjAqNCA9IDc2ODAgYnl0ZXMNCj4gDQo+
ICAgNTA3ICogMTYgKiAxMDI0IC8gNzY4MCA9IDEwODEuNg0KPiANCj4gICBvZmYgLyBsaW5l
X2xlbmd0aCA9IDUwNyAqIDE2ICogMTAyNCAvIDc2ODAgPSAxMDgxDQo+ICAgRElWX1JPVU5E
X1VQKDUwNyAqIDE2ICogMTAyNCwgNzY4MCkgd2lsbCB5ZWlsZCAxMDgyDQo+IA0KPiBtZW1j
cHlfdG9pbygpIHR5cGljYWxseSBpc3N1ZSB0aGUgY29weSBsaW5lIGJ5IGxpbmUsIHdoZW4g
Y29weSB0aGUgbGFzdA0KPiBsaW5lLCBvdXQtb2YtYm91bmQgYWNjZXNzIHdpbGwgYmUgaGFw
cGVuLiBCZWNhdXNlOg0KPiANCj4gICAxMDgyICogbGluZV9sZW5ndGggPSAxMDgyICogNzY4
MCA9IDgzMDk3NjAsIGFuZCA4MzA5NzYwID4gODMwNjY4OA0KPiANCj4gTm90ZSB0aGF0IHVz
ZXJzcGFjZSBtYXkgc3RpbCB3cml0ZSB0byB0aGUgaW52aXNpYWJsZSBhcmVhIGlmIGEgbGFy
Z2VyDQo+IGJ1ZmZlciB0aGFuIHdpZHRoIHggc3RyaWRlIGlzIGV4cG9zZWQuIEJ1dCBpdCBp
cyBub3QgYSBiaWcgaXNzdWUgYXMNCj4gbG9uZyBhcyB0aGVyZSBzdGlsbCBoYXZlIG1lbW9y
eSByZXNvbHZlIHRoZSBhY2Nlc3MgaWYgbm90IGRyYWZ0aW5nIHNvDQo+IGZhci4NCj4gDQo+
ICAgLSBBbHNvIGxpbWl0IHRoZSB5MSAoRGFuaWVsKQ0KPiAgIC0ga2VlcCBmaXggcGF0Y2gg
aXQgdG8gbWluaW1hbCAoRGFuaWVsKQ0KPiAgIC0gc2NyZWVuX3NpemUgaXMgcGFnZSBzaXpl
IGFsaWduZWQgYmVjYXVzZSBvZiBpdCBuZWVkIG1tYXAgKFRob21hcykNCj4gICAtIEFkZGlu
ZyBmaXhlcyB0YWcgKFRob21hcykNCj4gDQo+IEZpeGVzOiBhYTE1YzY3N2NjMzQgKCJkcm0v
ZmItaGVscGVyOiBGaXggdmVydGljYWwgZGFtYWdlIGNsaXBwaW5nIikNCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IFN1aSBKaW5nZmVuZyA8c3VpamluZ2ZlbmdAbG9vbmdzb24uY24+DQo+IFJl
dmlld2VkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4g
VGVzdGVkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJl
Pg0KPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9kcmktZGV2ZWwvYWQ0NGRmMjkt
MzI0MS0wZDllLWU3MDgtYjAzMzhiZjNjNjIzQDE4OS5jbi8NCj4gLS0tDQo+ICAgZHJpdmVy
cy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYyB8IDE2ICsrKysrKysrKysrKy0tLS0NCj4gICAx
IGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gDQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jIGIvZHJpdmVy
cy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYw0KPiBpbmRleCA2NDQ1ODk4MmJlNDAuLjZiYjFi
OGIyN2Q3YSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIu
Yw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jDQo+IEBAIC02NDEs
MTkgKzY0MSwyNyBAQCBzdGF0aWMgdm9pZCBkcm1fZmJfaGVscGVyX2RhbWFnZShzdHJ1Y3Qg
ZHJtX2ZiX2hlbHBlciAqaGVscGVyLCB1MzIgeCwgdTMyIHksDQo+ICAgc3RhdGljIHZvaWQg
ZHJtX2ZiX2hlbHBlcl9tZW1vcnlfcmFuZ2VfdG9fY2xpcChzdHJ1Y3QgZmJfaW5mbyAqaW5m
bywgb2ZmX3Qgb2ZmLCBzaXplX3QgbGVuLA0KPiAgIAkJCQkJICAgICAgIHN0cnVjdCBkcm1f
cmVjdCAqY2xpcCkNCj4gICB7DQo+ICsJdTMyIGxpbmVfbGVuZ3RoID0gaW5mby0+Zml4Lmxp
bmVfbGVuZ3RoOw0KPiArCXUzMiBmYl9oZWlnaHQgPSBpbmZvLT52YXIueXJlczsNCj4gICAJ
b2ZmX3QgZW5kID0gb2ZmICsgbGVuOw0KPiAgIAl1MzIgeDEgPSAwOw0KPiAtCXUzMiB5MSA9
IG9mZiAvIGluZm8tPmZpeC5saW5lX2xlbmd0aDsNCj4gKwl1MzIgeTEgPSBvZmYgLyBsaW5l
X2xlbmd0aDsNCj4gICAJdTMyIHgyID0gaW5mby0+dmFyLnhyZXM7DQo+IC0JdTMyIHkyID0g
RElWX1JPVU5EX1VQKGVuZCwgaW5mby0+Zml4LmxpbmVfbGVuZ3RoKTsNCj4gKwl1MzIgeTIg
PSBESVZfUk9VTkRfVVAoZW5kLCBsaW5lX2xlbmd0aCk7DQo+ICsNCj4gKwkvKiBEb24ndCBh
bGxvdyBhbnkgb2YgdGhlbSBiZXlvbmQgdGhlIGJvdHRvbSBib3VuZCBvZiBkaXNwbGF5IGFy
ZWEgKi8NCj4gKwlpZiAoeTEgPiBmYl9oZWlnaHQpDQo+ICsJCXkxID0gZmJfaGVpZ2h0Ow0K
PiArCWlmICh5MiA+IGZiX2hlaWdodCkNCj4gKwkJeTIgPSBmYl9oZWlnaHQ7DQo+ICAgDQo+
ICAgCWlmICgoeTIgLSB5MSkgPT0gMSkgew0KPiAgIAkJLyoNCj4gICAJCSAqIFdlJ3ZlIG9u
bHkgd3JpdHRlbiB0byBhIHNpbmdsZSBzY2FubGluZS4gVHJ5IHRvIHJlZHVjZQ0KPiAgIAkJ
ICogdGhlIG51bWJlciBvZiBob3Jpem9udGFsIHBpeGVscyB0aGF0IG5lZWQgYW4gdXBkYXRl
Lg0KPiAgIAkJICovDQo+IC0JCW9mZl90IGJpdF9vZmYgPSAob2ZmICUgaW5mby0+Zml4Lmxp
bmVfbGVuZ3RoKSAqIDg7DQo+IC0JCW9mZl90IGJpdF9lbmQgPSAoZW5kICUgaW5mby0+Zml4
LmxpbmVfbGVuZ3RoKSAqIDg7DQo+ICsJCW9mZl90IGJpdF9vZmYgPSAob2ZmICUgbGluZV9s
ZW5ndGgpICogODsNCj4gKwkJb2ZmX3QgYml0X2VuZCA9IChlbmQgJSBsaW5lX2xlbmd0aCkg
KiA4Ow0KPiAgIA0KPiAgIAkJeDEgPSBiaXRfb2ZmIC8gaW5mby0+dmFyLmJpdHNfcGVyX3Bp
eGVsOw0KPiAgIAkJeDIgPSBESVZfUk9VTkRfVVAoYml0X2VuZCwgaW5mby0+dmFyLmJpdHNf
cGVyX3BpeGVsKTsNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVy
IERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFu
a2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3Rl
diwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJC
IDM2ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------mPUv1XMltaBv0kOsv1WmAtrw--

--------------20aCYj0a2J0scgA0B0DBh0WY
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmRCRMsFAwAAAAAACgkQlh/E3EQov+A0
Ig/9EL3K30lR6EmyeSIhR+6NfX4vtUIX5trgpeIei4xCDMPR93EQb+OsRM2S4cql5tj6TKl/WlKv
ui5LN2hIbp7EL/z2ct2enusR1Yz8+WDSeRUf7cQrnT/QS29rN7+m85mE5WBWfthL/FBH/YMfxFO+
ZTvF3Pxyt5V1fsd8w+SphRQjLe+nM3DPyCqcYcr9JDd1X6K/pzKd0X6IpUOF5zhOyWam2bbAhGG0
jPS4Ns22jQs9jcNpjHOKQ6/oZX3DbvugPxSLM0HPDO1gbHsJIpERc+38MkfQ8dNUN3J8t0SHftmY
Y/r3clVYi6VhiUBIMPfZKF8fxkC9ILzovhlFiJf5wnGjaqgATDT/fQPtqD8o3YAkAzcNSkJtRJ9N
A8Dsjvj5GyRvHzHIN9ao6LVoqDq6s/fiEqFUyvn19v4VLzG6csuSbNBSDvL10ZLPfJ4O946B9g9W
zOsz5me3Jcl7IINpvPmhY93VUXOkHbMpF7YL99x8AnPHUjniL8KILJwJVFP94C+FnpimV/OAxBsf
YU+AfJUuHn0JNpYTFciklJhGBOqn1y6XM2++p98IxVHWCJkcP48TK1B9L3P83sFhqsKo4xhAciDy
Y7xBXzb/eQJ1VPCNj+YiDzLDlElQF8ivUfdTeT+dwEJ1zoLc7wT2QOokhOzjVNdIqQajjWdaRHme
6cA=
=7Iiu
-----END PGP SIGNATURE-----

--------------20aCYj0a2J0scgA0B0DBh0WY--
