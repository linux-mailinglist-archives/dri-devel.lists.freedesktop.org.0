Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A30F96E8ADC
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 09:04:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C463E10E238;
	Thu, 20 Apr 2023 07:04:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B89CB10E238
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 07:04:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 12FF71FDCC;
 Thu, 20 Apr 2023 07:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1681974265; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rJq6wsgCKz5pVSPBUmEKMaXVMNtog8omhuDiSGxsNj8=;
 b=pcHpE6yGKRUVISVAPT9/M5oQ3BRAjzi7WNH3zTQFlmrNNrCa0JubSYPUKIjA4SUSL4tzLu
 whIESZYpXz51B6b+7UVZLDQfTXGIO5A78xMC3e1IT5jC9E51Bkb4mSWjSd+H7zKj8NHlzK
 yq/M3P6X7fdzagOIt14fmk085PFWvaM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1681974265;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rJq6wsgCKz5pVSPBUmEKMaXVMNtog8omhuDiSGxsNj8=;
 b=IweASWpf82Av5YHc+fE8ZwQP6NyilKSjzLtSwW91XQ36KxOQGte0g70ZgmmCm0u04Bjacz
 HzsArWqj1JnyksDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B7DD413584;
 Thu, 20 Apr 2023 07:04:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id VTKeK/jjQGR1PQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 20 Apr 2023 07:04:24 +0000
Message-ID: <8ec3734b-4bc2-ad8f-fc17-3002f22d1fc9@suse.de>
Date: Thu, 20 Apr 2023 09:04:24 +0200
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
 boundary="------------CcZGJpiQTkqPQLdLXiIao66z"
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
--------------CcZGJpiQTkqPQLdLXiIao66z
Content-Type: multipart/mixed; boundary="------------Wx0KxaUhc0NryMxn8TtY5xQ6";
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
Message-ID: <8ec3734b-4bc2-ad8f-fc17-3002f22d1fc9@suse.de>
Subject: Re: [PATCH v5] drm/fbdev-generic: prohibit potential out-of-bounds
 access
References: <20230420030500.1578756-1-suijingfeng@loongson.cn>
In-Reply-To: <20230420030500.1578756-1-suijingfeng@loongson.cn>

--------------Wx0KxaUhc0NryMxn8TtY5xQ6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGksDQoNCnRoaXMgcGF0Y2ggbG9va3MgdG8gbWUgZ29vZCBhbmQgSSdkIGxpa2UgdG8gbWVy
Z2UgaXQsIGlmIG5vIG9uZSBvYmplY3RzLg0KDQpJbiB0aGUgbmVhciBmdXR1cmUsIGFmdGVy
IGk5MTUgaGFzIHN3aXRjaGVkIHRvIHN0cnVjdCBkcm1fY2xpZW50LCBJIA0KaW50ZW5kIHRv
IG1vdmUgRFJNJ3MgZGVmZXJyZWQtSS9PIGhlbHBlcnMgaW50byBmYmRldi1nZW5lcmljIGFu
ZCBpOTE1LiANClRob3NlIGFyZSB0aGUgdHdvIHVzZXJzLCBidXQgdGhleSBhcmUgZmFpcmx5
IGRpZmZlcmVudC4gVGhleSBjYW4gdGhlbiANCmJvdGggaGF2ZSBzb21ldGhpbmcgdGFpbG9y
ZWQgdG93YXJkcyB0aGVpciBuZWVkcy4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KQW0g
MjAuMDQuMjMgdW0gMDU6MDUgc2NocmllYiBTdWkgSmluZ2Zlbmc6DQo+IFRoZSBmYmRldiB0
ZXN0IG9mIElHVCBtYXkgd3JpdGUgYWZ0ZXIgRU9GLCB3aGljaCBsZWFkIHRvIG91dC1vZi1i
b3VuZA0KPiBhY2Nlc3MgZm9yIGRybSBkcml2ZXJzIGhpcmUgZmJkZXYtZ2VuZXJpYy4gRm9y
IGV4YW1wbGUsIHJ1biBmYmRldiB0ZXN0DQo+IG9uIGEgeDg2K2FzdDI0MDAgcGxhdGZvcm0s
IHdpdGggMTY4MHgxMDUwIHJlc29sdXRpb24sIHdpbGwgY2F1c2UgdGhlDQo+IGxpbnV4IGtl
cm5lbCBoYW5nIHdpdGggdGhlIGZvbGxvd2luZyBjYWxsIHRyYWNlOg0KPiANCj4gICAgT29w
czogMDAwMCBbIzFdIFBSRUVNUFQgU01QIFBUSQ0KPiAgICBbSUdUXSBmYmRldjogc3RhcnRp
bmcgc3VidGVzdCBlb2YNCj4gICAgV29ya3F1ZXVlOiBldmVudHMgZHJtX2ZiX2hlbHBlcl9k
YW1hZ2Vfd29yayBbZHJtX2ttc19oZWxwZXJdDQo+ICAgIFtJR1RdIGZiZGV2OiBzdGFydGlu
ZyBzdWJ0ZXN0IG51bGxwdHINCj4gDQo+ICAgIFJJUDogMDAxMDptZW1jcHlfZXJtcysweGEv
MHgyMA0KPiAgICBSU1A6IDAwMTg6ZmZmZmExN2Q0MDE2N2Q5OCBFRkxBR1M6IDAwMDEwMjQ2
DQo+ICAgIFJBWDogZmZmZmExN2Q0ZWI3ZmE4MCBSQlg6IGZmZmZhMTdkNDBlMGFhODAgUkNY
OiAwMDAwMDAwMDAwMDAxNGMwDQo+ICAgIFJEWDogMDAwMDAwMDAwMDAwMWE0MCBSU0k6IGZm
ZmZhMTdkNDBlMGIwMDAgUkRJOiBmZmZmYTE3ZDRlYjgwMDAwDQo+ICAgIFJCUDogZmZmZmEx
N2Q0MDE2N2UyMCBSMDg6IDAwMDAwMDAwMDAwMDAwMDAgUjA5OiBmZmZmODk1MjJlY2ZmOGMw
DQo+ICAgIFIxMDogZmZmZmExN2Q0ZTRjNTAwMCBSMTE6IDAwMDAwMDAwMDAwMDAwMDAgUjEy
OiBmZmZmYTE3ZDRlYjdmYTgwDQo+ICAgIFIxMzogMDAwMDAwMDAwMDAwMWE0MCBSMTQ6IDAw
MDAwMDAwMDAwMDA0MWEgUjE1OiBmZmZmYTE3ZDQwMTY3ZTMwDQo+ICAgIEZTOiAgMDAwMDAw
MDAwMDAwMDAwMCgwMDAwKSBHUzpmZmZmODk1MjU3MzgwMDAwKDAwMDApIGtubEdTOjAwMDAw
MDAwMDAwMDAwMDANCj4gICAgQ1M6ICAwMDEwIERTOiAwMDAwIEVTOiAwMDAwIENSMDogMDAw
MDAwMDA4MDA1MDAzMw0KPiAgICBDUjI6IGZmZmZhMTdkNDBlMGIwMDAgQ1IzOiAwMDAwMDAw
MWVhZWNhMDA2IENSNDogMDAwMDAwMDAwMDE3MDZlMA0KPiAgICBDYWxsIFRyYWNlOg0KPiAg
ICAgPFRBU0s+DQo+ICAgICA/IGRybV9mYmRldl9nZW5lcmljX2hlbHBlcl9mYl9kaXJ0eSsw
eDIwNy8weDMzMCBbZHJtX2ttc19oZWxwZXJdDQo+ICAgICBkcm1fZmJfaGVscGVyX2RhbWFn
ZV93b3JrKzB4OGYvMHgxNzAgW2RybV9rbXNfaGVscGVyXQ0KPiAgICAgcHJvY2Vzc19vbmVf
d29yaysweDIxZi8weDQzMA0KPiAgICAgd29ya2VyX3RocmVhZCsweDRlLzB4M2MwDQo+ICAg
ICA/IF9fcGZ4X3dvcmtlcl90aHJlYWQrMHgxMC8weDEwDQo+ICAgICBrdGhyZWFkKzB4ZjQv
MHgxMjANCj4gICAgID8gX19wZnhfa3RocmVhZCsweDEwLzB4MTANCj4gICAgIHJldF9mcm9t
X2ZvcmsrMHgyYy8weDUwDQo+ICAgICA8L1RBU0s+DQo+ICAgIENSMjogZmZmZmExN2Q0MGUw
YjAwMA0KPiAgICAtLS1bIGVuZCB0cmFjZSAwMDAwMDAwMDAwMDAwMDAwIF0tLS0NCj4gDQo+
IFRoZSBpcyBiZWNhdXNlIGRhbWFnZSByZWN0YW5nbGVzIGNvbXB1dGVkIGJ5DQo+IGRybV9m
Yl9oZWxwZXJfbWVtb3J5X3JhbmdlX3RvX2NsaXAoKSBmdW5jdGlvbiBkb2VzIG5vdCBndWFy
YW50ZWVkIHRvIGJlDQo+IGJvdW5kIGluIHRoZSBzY3JlZW4ncyBhY3RpdmUgZGlzcGxheSBh
cmVhLiBQb3NzaWJsZSByZWFzb25zIGFyZToNCj4gDQo+IDEpIEJ1ZmZlcnMgYXJlIGFsbG9j
YXRlZCBpbiB0aGUgZ3JhbnVsYXJpdHkgb2YgcGFnZSBzaXplLCBmb3IgbW1hcCBzeXN0ZW0N
Cj4gICAgIGNhbGwgc3VwcG9ydC4gVGhlIHNoYWRvdyBzY3JlZW4gYnVmZmVyIGNvbnN1bWVk
IGJ5IGZiZGV2IGVtdWxhdGlvbiBtYXkNCj4gICAgIGFsc28gY2hvb3NlZCBiZSBwYWdlIHNp
emUgYWxpZ25lZC4NCj4gDQo+IDIpIFRoZSBESVZfUk9VTkRfVVAoKSB1c2VkIGluIGRybV9m
Yl9oZWxwZXJfbWVtb3J5X3JhbmdlX3RvX2NsaXAoKQ0KPiAgICAgd2lsbCBpbnRyb2R1Y2Ug
b2ZmLWJ5LW9uZSBlcnJvci4NCj4gDQo+IEZvciBleGFtcGxlLCBvbiBhIDE2S0IgcGFnZSBz
aXplIHN5c3RlbSwgaW4gb3JkZXIgdG8gc3RvcmUgYSAxOTIweDEwODANCj4gWFJHQiBmcmFt
ZWJ1ZmZlciwgd2UgbmVlZCBhbGxvY2F0ZSA1MDcgcGFnZXMuIFVuZm9ydHVuYXRlbHksIHRo
ZSBzaXplDQo+IDE5MjAqMTA4MCo0IGNhbiBub3QgYmUgZGl2aWRlZCBleGFjdGx5IGJ5IDE2
S0IuDQo+IA0KPiAgIDE5MjAgKiAxMDgwICogNCA9IDgyOTQ0MDAgYnl0ZXMNCj4gICA1MDYg
KiAxNiAqIDEwMjQgPSA4MjkwMzA0IGJ5dGVzDQo+ICAgNTA3ICogMTYgKiAxMDI0ID0gODMw
NjY4OCBieXRlcw0KPiANCj4gICBsaW5lX2xlbmd0aCA9IDE5MjAqNCA9IDc2ODAgYnl0ZXMN
Cj4gDQo+ICAgNTA3ICogMTYgKiAxMDI0IC8gNzY4MCA9IDEwODEuNg0KPiANCj4gICBvZmYg
LyBsaW5lX2xlbmd0aCA9IDUwNyAqIDE2ICogMTAyNCAvIDc2ODAgPSAxMDgxDQo+ICAgRElW
X1JPVU5EX1VQKDUwNyAqIDE2ICogMTAyNCwgNzY4MCkgd2lsbCB5ZWlsZCAxMDgyDQo+IA0K
PiBtZW1jcHlfdG9pbygpIHR5cGljYWxseSBpc3N1ZSB0aGUgY29weSBsaW5lIGJ5IGxpbmUs
IHdoZW4gY29weSB0aGUgbGFzdA0KPiBsaW5lLCBvdXQtb2YtYm91bmQgYWNjZXNzIHdpbGwg
YmUgaGFwcGVuLiBCZWNhdXNlOg0KPiANCj4gICAxMDgyICogbGluZV9sZW5ndGggPSAxMDgy
ICogNzY4MCA9IDgzMDk3NjAsIGFuZCA4MzA5NzYwID4gODMwNjY4OA0KPiANCj4gTm90ZSB0
aGF0IHVzZXJzcGFjZSBtYXkgc3RpbCB3cml0ZSB0byB0aGUgaW52aXNpYWJsZSBhcmVhIGlm
IGEgbGFyZ2VyDQo+IGJ1ZmZlciB0aGFuIHdpZHRoIHggc3RyaWRlIGlzIGV4cG9zZWQuIEJ1
dCBpdCBpcyBub3QgYSBiaWcgaXNzdWUgYXMNCj4gbG9uZyBhcyB0aGVyZSBzdGlsbCBoYXZl
IG1lbW9yeSByZXNvbHZlIHRoZSBhY2Nlc3MgaWYgbm90IGRyYWZ0aW5nIHNvDQo+IGZhci4N
Cj4gDQo+ICAgLSBBbHNvIGxpbWl0IHRoZSB5MSAoRGFuaWVsKQ0KPiAgIC0ga2VlcCBmaXgg
cGF0Y2ggaXQgdG8gbWluaW1hbCAoRGFuaWVsKQ0KPiAgIC0gc2NyZWVuX3NpemUgaXMgcGFn
ZSBzaXplIGFsaWduZWQgYmVjYXVzZSBvZiBpdCBuZWVkIG1tYXAgKFRob21hcykNCj4gICAt
IEFkZGluZyBmaXhlcyB0YWcgKFRob21hcykNCj4gDQo+IEZpeGVzOiBhYTE1YzY3N2NjMzQg
KCJkcm0vZmItaGVscGVyOiBGaXggdmVydGljYWwgZGFtYWdlIGNsaXBwaW5nIikNCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IFN1aSBKaW5nZmVuZyA8c3VpamluZ2ZlbmdAbG9vbmdzb24uY24+
DQo+IFJldmlld2VkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5k
ZT4NCj4gVGVzdGVkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xp
ZGVyLmJlPg0KPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9kcmktZGV2ZWwvYWQ0
NGRmMjktMzI0MS0wZDllLWU3MDgtYjAzMzhiZjNjNjIzQDE4OS5jbi8NCj4gLS0tDQo+ICAg
ZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYyB8IDE2ICsrKysrKysrKysrKy0tLS0N
Cj4gICAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkN
Cj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYw0KPiBpbmRleCA2NDQ1ODk4MmJlNDAu
LjZiYjFiOGIyN2Q3YSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9o
ZWxwZXIuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jDQo+IEBA
IC02NDEsMTkgKzY0MSwyNyBAQCBzdGF0aWMgdm9pZCBkcm1fZmJfaGVscGVyX2RhbWFnZShz
dHJ1Y3QgZHJtX2ZiX2hlbHBlciAqaGVscGVyLCB1MzIgeCwgdTMyIHksDQo+ICAgc3RhdGlj
IHZvaWQgZHJtX2ZiX2hlbHBlcl9tZW1vcnlfcmFuZ2VfdG9fY2xpcChzdHJ1Y3QgZmJfaW5m
byAqaW5mbywgb2ZmX3Qgb2ZmLCBzaXplX3QgbGVuLA0KPiAgIAkJCQkJICAgICAgIHN0cnVj
dCBkcm1fcmVjdCAqY2xpcCkNCj4gICB7DQo+ICsJdTMyIGxpbmVfbGVuZ3RoID0gaW5mby0+
Zml4LmxpbmVfbGVuZ3RoOw0KPiArCXUzMiBmYl9oZWlnaHQgPSBpbmZvLT52YXIueXJlczsN
Cj4gICAJb2ZmX3QgZW5kID0gb2ZmICsgbGVuOw0KPiAgIAl1MzIgeDEgPSAwOw0KPiAtCXUz
MiB5MSA9IG9mZiAvIGluZm8tPmZpeC5saW5lX2xlbmd0aDsNCj4gKwl1MzIgeTEgPSBvZmYg
LyBsaW5lX2xlbmd0aDsNCj4gICAJdTMyIHgyID0gaW5mby0+dmFyLnhyZXM7DQo+IC0JdTMy
IHkyID0gRElWX1JPVU5EX1VQKGVuZCwgaW5mby0+Zml4LmxpbmVfbGVuZ3RoKTsNCj4gKwl1
MzIgeTIgPSBESVZfUk9VTkRfVVAoZW5kLCBsaW5lX2xlbmd0aCk7DQo+ICsNCj4gKwkvKiBE
b24ndCBhbGxvdyBhbnkgb2YgdGhlbSBiZXlvbmQgdGhlIGJvdHRvbSBib3VuZCBvZiBkaXNw
bGF5IGFyZWEgKi8NCj4gKwlpZiAoeTEgPiBmYl9oZWlnaHQpDQo+ICsJCXkxID0gZmJfaGVp
Z2h0Ow0KPiArCWlmICh5MiA+IGZiX2hlaWdodCkNCj4gKwkJeTIgPSBmYl9oZWlnaHQ7DQo+
ICAgDQo+ICAgCWlmICgoeTIgLSB5MSkgPT0gMSkgew0KPiAgIAkJLyoNCj4gICAJCSAqIFdl
J3ZlIG9ubHkgd3JpdHRlbiB0byBhIHNpbmdsZSBzY2FubGluZS4gVHJ5IHRvIHJlZHVjZQ0K
PiAgIAkJICogdGhlIG51bWJlciBvZiBob3Jpem9udGFsIHBpeGVscyB0aGF0IG5lZWQgYW4g
dXBkYXRlLg0KPiAgIAkJICovDQo+IC0JCW9mZl90IGJpdF9vZmYgPSAob2ZmICUgaW5mby0+
Zml4LmxpbmVfbGVuZ3RoKSAqIDg7DQo+IC0JCW9mZl90IGJpdF9lbmQgPSAoZW5kICUgaW5m
by0+Zml4LmxpbmVfbGVuZ3RoKSAqIDg7DQo+ICsJCW9mZl90IGJpdF9vZmYgPSAob2ZmICUg
bGluZV9sZW5ndGgpICogODsNCj4gKwkJb2ZmX3QgYml0X2VuZCA9IChlbmQgJSBsaW5lX2xl
bmd0aCkgKiA4Ow0KPiAgIA0KPiAgIAkJeDEgPSBiaXRfb2ZmIC8gaW5mby0+dmFyLmJpdHNf
cGVyX3BpeGVsOw0KPiAgIAkJeDIgPSBESVZfUk9VTkRfVVAoYml0X2VuZCwgaW5mby0+dmFy
LmJpdHNfcGVyX3BpeGVsKTsNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3Mg
RHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJI
DQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2
byBUb3RldiwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1h
bg0KSFJCIDM2ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------Wx0KxaUhc0NryMxn8TtY5xQ6--

--------------CcZGJpiQTkqPQLdLXiIao66z
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmRA4/gFAwAAAAAACgkQlh/E3EQov+Dw
aBAAgfCgImtTMNXuLRDul1wX+gKnA4X5IurqFEVqyvzDGTanzsmuCxFFTF+KfWpzmvwTCrIoVqk3
Ha1kR++u+47N2sdjHg/e3FqvjNtbcV9JpLf+ig3YIe/g7pQRa74ZfxHQtJZeyL2OcDIN30UsVe6p
E84zO2GKcOEY/geyituk6rOMhvTb5vKsLrjgl8dCRAF7Qs9c+GRxFY3PqhrVKhaHZt1n+5wZGZF9
kAeXlaFnL4VWHhluI907sNNR8J1/g92lIL9C0Ci2kHKcArI4MHS/5jLQhnxPXxMgL/un1bRXlESG
HONoUWwQv3E8X7VI24cVYzFyFkxy3q6kHSuTTC2an/WLQI5xYhe7JPXxiaBcvCbLwnKMzbhfTDu9
wI75F09ap+r6x2uq2wn+K9vU5o7G884n62cOK2syT7AfyJqBpnqcHdgnk3UUMXLw0dR49jLG8phz
Nwv+GqbgSyxcWALZa97OJ2M7s4ZxajEccZ7HH2h+JjOtgD1WWq6+avCeAKk6XPxTxGULXjZcWnyd
gdM4E8ubMKfFR4dO4+aqoeRnt1Kpgg8dwqOe59/8MyRG7qBYu2J9X/EYy8tIeilKRCrTpy+DY4SA
GsAegPheVT2I+yePPx2DoM6cZJ3xo/G7y2/b4fbriCdWwjs1UMHdho3Dzf0FYkDqzZdx3Ys0eonJ
bTY=
=zDZp
-----END PGP SIGNATURE-----

--------------CcZGJpiQTkqPQLdLXiIao66z--
