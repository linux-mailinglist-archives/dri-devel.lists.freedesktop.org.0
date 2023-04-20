Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 455D86E8AE3
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 09:07:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06BE710EB7B;
	Thu, 20 Apr 2023 07:07:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAD2610EB7B
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 07:07:06 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DAF62219F5;
 Thu, 20 Apr 2023 07:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1681974424; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0LYF0gq++4hjDDulV/LEMyeEM9H8FznYYtcqgmuPuuE=;
 b=bd2azx7sjLd95PiPtbq/sgQDxJuwtVFx3im5SCHb1j0IJMU1QGmAGVxinUfHz5YoS7Tu8k
 UYAD5ACRLsSX7ot0Gg5YX9QithHmDgdm+amNZJItUldM7sSfwX3nvLWw4xv2FhH6MYMjlp
 VqW15z4qR2p+SceOyUwJtsihY+9P4Z4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1681974424;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0LYF0gq++4hjDDulV/LEMyeEM9H8FznYYtcqgmuPuuE=;
 b=cv6YaYaSXJfo267cxz3kp52Pq9KEXnMxrAC2Cf1nMzjIEAKHZVn/mFNxmBqpvOo4tuGnWI
 TWaIZ3xCex7kdXBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 98FEC13584;
 Thu, 20 Apr 2023 07:07:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CQqEJJjkQGRkPwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 20 Apr 2023 07:07:04 +0000
Message-ID: <12c8efaa-7266-5436-dc53-009a0d23b53f@suse.de>
Date: Thu, 20 Apr 2023 09:07:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v5] drm/fbdev-generic: prohibit potential out-of-bounds
 access
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sui Jingfeng <suijingfeng@loongson.cn>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Li Yi <liyi@loongson.cn>,
 Helge Deller <deller@gmx.de>, Lucas De Marchi <lucas.demarchi@intel.com>
References: <20230420030500.1578756-1-suijingfeng@loongson.cn>
 <8ec3734b-4bc2-ad8f-fc17-3002f22d1fc9@suse.de>
In-Reply-To: <8ec3734b-4bc2-ad8f-fc17-3002f22d1fc9@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------qZc0sIYZ4xZV7VgM2KS0nnnL"
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
--------------qZc0sIYZ4xZV7VgM2KS0nnnL
Content-Type: multipart/mixed; boundary="------------u8fQV0OpEjrwcmKHfH8PZkDH";
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
Message-ID: <12c8efaa-7266-5436-dc53-009a0d23b53f@suse.de>
Subject: Re: [PATCH v5] drm/fbdev-generic: prohibit potential out-of-bounds
 access
References: <20230420030500.1578756-1-suijingfeng@loongson.cn>
 <8ec3734b-4bc2-ad8f-fc17-3002f22d1fc9@suse.de>
In-Reply-To: <8ec3734b-4bc2-ad8f-fc17-3002f22d1fc9@suse.de>

--------------u8fQV0OpEjrwcmKHfH8PZkDH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjAuMDQuMjMgdW0gMDk6MDQgc2NocmllYiBUaG9tYXMgWmltbWVybWFubjoN
Cj4gSGksDQo+IA0KPiB0aGlzIHBhdGNoIGxvb2tzIHRvIG1lIGdvb2QgYW5kIEknZCBsaWtl
IHRvIG1lcmdlIGl0LCBpZiBubyBvbmUgb2JqZWN0cy4NCg0KUmVyZWFkaW5nIGl0LCBJIG1p
Z2h0IGhhdmUgYmVlbiB0b28gZWFnZXIuIFdoYXQgaGFwcGVuZWQgdG8gdGhlIHNldHRpbmcg
DQpvZiBzY3JlZW5fc2l6ZSA9IGJ1ZmZlci0+Z2VtLT5zaXplID8gIEl0IGlzIG5vdCByZWxl
dmFudD8NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gSW4gdGhlIG5lYXIgZnV0
dXJlLCBhZnRlciBpOTE1IGhhcyBzd2l0Y2hlZCB0byBzdHJ1Y3QgZHJtX2NsaWVudCwgSSAN
Cj4gaW50ZW5kIHRvIG1vdmUgRFJNJ3MgZGVmZXJyZWQtSS9PIGhlbHBlcnMgaW50byBmYmRl
di1nZW5lcmljIGFuZCBpOTE1LiANCj4gVGhvc2UgYXJlIHRoZSB0d28gdXNlcnMsIGJ1dCB0
aGV5IGFyZSBmYWlybHkgZGlmZmVyZW50LiBUaGV5IGNhbiB0aGVuIA0KPiBib3RoIGhhdmUg
c29tZXRoaW5nIHRhaWxvcmVkIHRvd2FyZHMgdGhlaXIgbmVlZHMuDQo+IA0KPiBCZXN0IHJl
Z2FyZHMNCj4gVGhvbWFzDQo+IA0KPiBBbSAyMC4wNC4yMyB1bSAwNTowNSBzY2hyaWViIFN1
aSBKaW5nZmVuZzoNCj4+IFRoZSBmYmRldiB0ZXN0IG9mIElHVCBtYXkgd3JpdGUgYWZ0ZXIg
RU9GLCB3aGljaCBsZWFkIHRvIG91dC1vZi1ib3VuZA0KPj4gYWNjZXNzIGZvciBkcm0gZHJp
dmVycyBoaXJlIGZiZGV2LWdlbmVyaWMuIEZvciBleGFtcGxlLCBydW4gZmJkZXYgdGVzdA0K
Pj4gb24gYSB4ODYrYXN0MjQwMCBwbGF0Zm9ybSwgd2l0aCAxNjgweDEwNTAgcmVzb2x1dGlv
biwgd2lsbCBjYXVzZSB0aGUNCj4+IGxpbnV4IGtlcm5lbCBoYW5nIHdpdGggdGhlIGZvbGxv
d2luZyBjYWxsIHRyYWNlOg0KPj4NCj4+IMKgwqAgT29wczogMDAwMCBbIzFdIFBSRUVNUFQg
U01QIFBUSQ0KPj4gwqDCoCBbSUdUXSBmYmRldjogc3RhcnRpbmcgc3VidGVzdCBlb2YNCj4+
IMKgwqAgV29ya3F1ZXVlOiBldmVudHMgZHJtX2ZiX2hlbHBlcl9kYW1hZ2Vfd29yayBbZHJt
X2ttc19oZWxwZXJdDQo+PiDCoMKgIFtJR1RdIGZiZGV2OiBzdGFydGluZyBzdWJ0ZXN0IG51
bGxwdHINCj4+DQo+PiDCoMKgIFJJUDogMDAxMDptZW1jcHlfZXJtcysweGEvMHgyMA0KPj4g
wqDCoCBSU1A6IDAwMTg6ZmZmZmExN2Q0MDE2N2Q5OCBFRkxBR1M6IDAwMDEwMjQ2DQo+PiDC
oMKgIFJBWDogZmZmZmExN2Q0ZWI3ZmE4MCBSQlg6IGZmZmZhMTdkNDBlMGFhODAgUkNYOiAw
MDAwMDAwMDAwMDAxNGMwDQo+PiDCoMKgIFJEWDogMDAwMDAwMDAwMDAwMWE0MCBSU0k6IGZm
ZmZhMTdkNDBlMGIwMDAgUkRJOiBmZmZmYTE3ZDRlYjgwMDAwDQo+PiDCoMKgIFJCUDogZmZm
ZmExN2Q0MDE2N2UyMCBSMDg6IDAwMDAwMDAwMDAwMDAwMDAgUjA5OiBmZmZmODk1MjJlY2Zm
OGMwDQo+PiDCoMKgIFIxMDogZmZmZmExN2Q0ZTRjNTAwMCBSMTE6IDAwMDAwMDAwMDAwMDAw
MDAgUjEyOiBmZmZmYTE3ZDRlYjdmYTgwDQo+PiDCoMKgIFIxMzogMDAwMDAwMDAwMDAwMWE0
MCBSMTQ6IDAwMDAwMDAwMDAwMDA0MWEgUjE1OiBmZmZmYTE3ZDQwMTY3ZTMwDQo+PiDCoMKg
IEZTOsKgIDAwMDAwMDAwMDAwMDAwMDAoMDAwMCkgR1M6ZmZmZjg5NTI1NzM4MDAwMCgwMDAw
KSANCj4+IGtubEdTOjAwMDAwMDAwMDAwMDAwMDANCj4+IMKgwqAgQ1M6wqAgMDAxMCBEUzog
MDAwMCBFUzogMDAwMCBDUjA6IDAwMDAwMDAwODAwNTAwMzMNCj4+IMKgwqAgQ1IyOiBmZmZm
YTE3ZDQwZTBiMDAwIENSMzogMDAwMDAwMDFlYWVjYTAwNiBDUjQ6IDAwMDAwMDAwMDAxNzA2
ZTANCj4+IMKgwqAgQ2FsbCBUcmFjZToNCj4+IMKgwqDCoCA8VEFTSz4NCj4+IMKgwqDCoCA/
IGRybV9mYmRldl9nZW5lcmljX2hlbHBlcl9mYl9kaXJ0eSsweDIwNy8weDMzMCBbZHJtX2tt
c19oZWxwZXJdDQo+PiDCoMKgwqAgZHJtX2ZiX2hlbHBlcl9kYW1hZ2Vfd29yaysweDhmLzB4
MTcwIFtkcm1fa21zX2hlbHBlcl0NCj4+IMKgwqDCoCBwcm9jZXNzX29uZV93b3JrKzB4MjFm
LzB4NDMwDQo+PiDCoMKgwqAgd29ya2VyX3RocmVhZCsweDRlLzB4M2MwDQo+PiDCoMKgwqAg
PyBfX3BmeF93b3JrZXJfdGhyZWFkKzB4MTAvMHgxMA0KPj4gwqDCoMKgIGt0aHJlYWQrMHhm
NC8weDEyMA0KPj4gwqDCoMKgID8gX19wZnhfa3RocmVhZCsweDEwLzB4MTANCj4+IMKgwqDC
oCByZXRfZnJvbV9mb3JrKzB4MmMvMHg1MA0KPj4gwqDCoMKgIDwvVEFTSz4NCj4+IMKgwqAg
Q1IyOiBmZmZmYTE3ZDQwZTBiMDAwDQo+PiDCoMKgIC0tLVsgZW5kIHRyYWNlIDAwMDAwMDAw
MDAwMDAwMDAgXS0tLQ0KPj4NCj4+IFRoZSBpcyBiZWNhdXNlIGRhbWFnZSByZWN0YW5nbGVz
IGNvbXB1dGVkIGJ5DQo+PiBkcm1fZmJfaGVscGVyX21lbW9yeV9yYW5nZV90b19jbGlwKCkg
ZnVuY3Rpb24gZG9lcyBub3QgZ3VhcmFudGVlZCB0byBiZQ0KPj4gYm91bmQgaW4gdGhlIHNj
cmVlbidzIGFjdGl2ZSBkaXNwbGF5IGFyZWEuIFBvc3NpYmxlIHJlYXNvbnMgYXJlOg0KPj4N
Cj4+IDEpIEJ1ZmZlcnMgYXJlIGFsbG9jYXRlZCBpbiB0aGUgZ3JhbnVsYXJpdHkgb2YgcGFn
ZSBzaXplLCBmb3IgbW1hcCBzeXN0ZW0NCj4+IMKgwqDCoCBjYWxsIHN1cHBvcnQuIFRoZSBz
aGFkb3cgc2NyZWVuIGJ1ZmZlciBjb25zdW1lZCBieSBmYmRldiBlbXVsYXRpb24gDQo+PiBt
YXkNCj4+IMKgwqDCoCBhbHNvIGNob29zZWQgYmUgcGFnZSBzaXplIGFsaWduZWQuDQo+Pg0K
Pj4gMikgVGhlIERJVl9ST1VORF9VUCgpIHVzZWQgaW4gZHJtX2ZiX2hlbHBlcl9tZW1vcnlf
cmFuZ2VfdG9fY2xpcCgpDQo+PiDCoMKgwqAgd2lsbCBpbnRyb2R1Y2Ugb2ZmLWJ5LW9uZSBl
cnJvci4NCj4+DQo+PiBGb3IgZXhhbXBsZSwgb24gYSAxNktCIHBhZ2Ugc2l6ZSBzeXN0ZW0s
IGluIG9yZGVyIHRvIHN0b3JlIGEgMTkyMHgxMDgwDQo+PiBYUkdCIGZyYW1lYnVmZmVyLCB3
ZSBuZWVkIGFsbG9jYXRlIDUwNyBwYWdlcy4gVW5mb3J0dW5hdGVseSwgdGhlIHNpemUNCj4+
IDE5MjAqMTA4MCo0IGNhbiBub3QgYmUgZGl2aWRlZCBleGFjdGx5IGJ5IDE2S0IuDQo+Pg0K
Pj4gwqAgMTkyMCAqIDEwODAgKiA0ID0gODI5NDQwMCBieXRlcw0KPj4gwqAgNTA2ICogMTYg
KiAxMDI0ID0gODI5MDMwNCBieXRlcw0KPj4gwqAgNTA3ICogMTYgKiAxMDI0ID0gODMwNjY4
OCBieXRlcw0KPj4NCj4+IMKgIGxpbmVfbGVuZ3RoID0gMTkyMCo0ID0gNzY4MCBieXRlcw0K
Pj4NCj4+IMKgIDUwNyAqIDE2ICogMTAyNCAvIDc2ODAgPSAxMDgxLjYNCj4+DQo+PiDCoCBv
ZmYgLyBsaW5lX2xlbmd0aCA9IDUwNyAqIDE2ICogMTAyNCAvIDc2ODAgPSAxMDgxDQo+PiDC
oCBESVZfUk9VTkRfVVAoNTA3ICogMTYgKiAxMDI0LCA3NjgwKSB3aWxsIHllaWxkIDEwODIN
Cj4+DQo+PiBtZW1jcHlfdG9pbygpIHR5cGljYWxseSBpc3N1ZSB0aGUgY29weSBsaW5lIGJ5
IGxpbmUsIHdoZW4gY29weSB0aGUgbGFzdA0KPj4gbGluZSwgb3V0LW9mLWJvdW5kIGFjY2Vz
cyB3aWxsIGJlIGhhcHBlbi4gQmVjYXVzZToNCj4+DQo+PiDCoCAxMDgyICogbGluZV9sZW5n
dGggPSAxMDgyICogNzY4MCA9IDgzMDk3NjAsIGFuZCA4MzA5NzYwID4gODMwNjY4OA0KPj4N
Cj4+IE5vdGUgdGhhdCB1c2Vyc3BhY2UgbWF5IHN0aWwgd3JpdGUgdG8gdGhlIGludmlzaWFi
bGUgYXJlYSBpZiBhIGxhcmdlcg0KPj4gYnVmZmVyIHRoYW4gd2lkdGggeCBzdHJpZGUgaXMg
ZXhwb3NlZC4gQnV0IGl0IGlzIG5vdCBhIGJpZyBpc3N1ZSBhcw0KPj4gbG9uZyBhcyB0aGVy
ZSBzdGlsbCBoYXZlIG1lbW9yeSByZXNvbHZlIHRoZSBhY2Nlc3MgaWYgbm90IGRyYWZ0aW5n
IHNvDQo+PiBmYXIuDQo+Pg0KPj4gwqAgLSBBbHNvIGxpbWl0IHRoZSB5MSAoRGFuaWVsKQ0K
Pj4gwqAgLSBrZWVwIGZpeCBwYXRjaCBpdCB0byBtaW5pbWFsIChEYW5pZWwpDQo+PiDCoCAt
IHNjcmVlbl9zaXplIGlzIHBhZ2Ugc2l6ZSBhbGlnbmVkIGJlY2F1c2Ugb2YgaXQgbmVlZCBt
bWFwIChUaG9tYXMpDQo+PiDCoCAtIEFkZGluZyBmaXhlcyB0YWcgKFRob21hcykNCj4+DQo+
PiBGaXhlczogYWExNWM2NzdjYzM0ICgiZHJtL2ZiLWhlbHBlcjogRml4IHZlcnRpY2FsIGRh
bWFnZSBjbGlwcGluZyIpDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogU3VpIEppbmdmZW5nIDxz
dWlqaW5nZmVuZ0Bsb29uZ3Nvbi5jbj4NCj4+IFJldmlld2VkLWJ5OiBUaG9tYXMgWmltbWVy
bWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4+IFRlc3RlZC1ieTogR2VlcnQgVXl0dGVy
aG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4NCj4+IExpbms6IA0KPj4gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvZHJpLWRldmVsL2FkNDRkZjI5LTMyNDEtMGQ5ZS1lNzA4LWIw
MzM4YmYzYzYyM0AxODkuY24vDQo+PiAtLS0NCj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9kcm1f
ZmJfaGVscGVyLmMgfCAxNiArKysrKysrKysrKystLS0tDQo+PiDCoCAxIGZpbGUgY2hhbmdl
ZCwgMTIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYyANCj4+IGIvZHJpdmVycy9ncHUv
ZHJtL2RybV9mYl9oZWxwZXIuYw0KPj4gaW5kZXggNjQ0NTg5ODJiZTQwLi42YmIxYjhiMjdk
N2EgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jDQo+
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jDQo+PiBAQCAtNjQxLDE5
ICs2NDEsMjcgQEAgc3RhdGljIHZvaWQgZHJtX2ZiX2hlbHBlcl9kYW1hZ2Uoc3RydWN0IA0K
Pj4gZHJtX2ZiX2hlbHBlciAqaGVscGVyLCB1MzIgeCwgdTMyIHksDQo+PiDCoCBzdGF0aWMg
dm9pZCBkcm1fZmJfaGVscGVyX21lbW9yeV9yYW5nZV90b19jbGlwKHN0cnVjdCBmYl9pbmZv
ICppbmZvLCANCj4+IG9mZl90IG9mZiwgc2l6ZV90IGxlbiwNCj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBkcm1f
cmVjdCAqY2xpcCkNCj4+IMKgIHsNCj4+ICvCoMKgwqAgdTMyIGxpbmVfbGVuZ3RoID0gaW5m
by0+Zml4LmxpbmVfbGVuZ3RoOw0KPj4gK8KgwqDCoCB1MzIgZmJfaGVpZ2h0ID0gaW5mby0+
dmFyLnlyZXM7DQo+PiDCoMKgwqDCoMKgIG9mZl90IGVuZCA9IG9mZiArIGxlbjsNCj4+IMKg
wqDCoMKgwqAgdTMyIHgxID0gMDsNCj4+IC3CoMKgwqAgdTMyIHkxID0gb2ZmIC8gaW5mby0+
Zml4LmxpbmVfbGVuZ3RoOw0KPj4gK8KgwqDCoCB1MzIgeTEgPSBvZmYgLyBsaW5lX2xlbmd0
aDsNCj4+IMKgwqDCoMKgwqAgdTMyIHgyID0gaW5mby0+dmFyLnhyZXM7DQo+PiAtwqDCoMKg
IHUzMiB5MiA9IERJVl9ST1VORF9VUChlbmQsIGluZm8tPmZpeC5saW5lX2xlbmd0aCk7DQo+
PiArwqDCoMKgIHUzMiB5MiA9IERJVl9ST1VORF9VUChlbmQsIGxpbmVfbGVuZ3RoKTsNCj4+
ICsNCj4+ICvCoMKgwqAgLyogRG9uJ3QgYWxsb3cgYW55IG9mIHRoZW0gYmV5b25kIHRoZSBi
b3R0b20gYm91bmQgb2YgZGlzcGxheSANCj4+IGFyZWEgKi8NCj4+ICvCoMKgwqAgaWYgKHkx
ID4gZmJfaGVpZ2h0KQ0KPj4gK8KgwqDCoMKgwqDCoMKgIHkxID0gZmJfaGVpZ2h0Ow0KPj4g
K8KgwqDCoCBpZiAoeTIgPiBmYl9oZWlnaHQpDQo+PiArwqDCoMKgwqDCoMKgwqAgeTIgPSBm
Yl9oZWlnaHQ7DQo+PiDCoMKgwqDCoMKgIGlmICgoeTIgLSB5MSkgPT0gMSkgew0KPj4gwqDC
oMKgwqDCoMKgwqDCoMKgIC8qDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIFdlJ3ZlIG9u
bHkgd3JpdHRlbiB0byBhIHNpbmdsZSBzY2FubGluZS4gVHJ5IHRvIHJlZHVjZQ0KPj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqAgKiB0aGUgbnVtYmVyIG9mIGhvcml6b250YWwgcGl4ZWxzIHRo
YXQgbmVlZCBhbiB1cGRhdGUuDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqLw0KPj4gLcKg
wqDCoMKgwqDCoMKgIG9mZl90IGJpdF9vZmYgPSAob2ZmICUgaW5mby0+Zml4LmxpbmVfbGVu
Z3RoKSAqIDg7DQo+PiAtwqDCoMKgwqDCoMKgwqAgb2ZmX3QgYml0X2VuZCA9IChlbmQgJSBp
bmZvLT5maXgubGluZV9sZW5ndGgpICogODsNCj4+ICvCoMKgwqDCoMKgwqDCoCBvZmZfdCBi
aXRfb2ZmID0gKG9mZiAlIGxpbmVfbGVuZ3RoKSAqIDg7DQo+PiArwqDCoMKgwqDCoMKgwqAg
b2ZmX3QgYml0X2VuZCA9IChlbmQgJSBsaW5lX2xlbmd0aCkgKiA4Ow0KPj4gwqDCoMKgwqDC
oMKgwqDCoMKgIHgxID0gYml0X29mZiAvIGluZm8tPnZhci5iaXRzX3Blcl9waXhlbDsNCj4+
IMKgwqDCoMKgwqDCoMKgwqDCoCB4MiA9IERJVl9ST1VORF9VUChiaXRfZW5kLCBpbmZvLT52
YXIuYml0c19wZXJfcGl4ZWwpOw0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3Jh
cGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFu
eSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0K
R0Y6IEl2byBUb3RldiwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4g
TW9lcm1hbg0KSFJCIDM2ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------u8fQV0OpEjrwcmKHfH8PZkDH--

--------------qZc0sIYZ4xZV7VgM2KS0nnnL
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmRA5JgFAwAAAAAACgkQlh/E3EQov+A7
vg/9FE/rsmvLBtysot3w1M+Z/g2p+lsUPQMf0iSEvdhhx/xfar/3+NiGExVaxYpCZVUqvWcfvoMv
/tM2/hAlolmlkYSsb8FsqwHzMbO7F/MtFxZgVu5aFS2XC/mduHo5KpN/TpNaFUtEUWAC/NuPaPMp
SxZNk1VzjP6fHxTsWNCv0ECMPbQ+SgDvZKqkQAmPl5GYel/ufOK3euTUdpuU/bkWGCKJFZwn1JFV
P5DRUSyi2LP4Ln5dy8ZaRdVb7tXfXBgSNcCpcJZ6kEJXUDGEoCXTb0hEtPEah/PoL1bbFJ5x+VLR
isxvev76iOUOtlWkn5pKEhVvrCcCjnMCZrny2ZVbQADhkuLKY+MrWyc5N0BkHhli7SKuoARprLVQ
Ka1PnTyw49PobxxwJGFzKBKdxFE/wZw3raNrC9qRRdBefzeTu/J/0dahnBjs4RR8qBvR2V7tE9+s
TJNo4wXX3s6BCzedQqYX+6PjGLoqst1k51gWPOODLE1YsvNzlUzNIyHejV5kPP/YJgTXtuSkebY1
nzmFY4n3R9jpaLc8Ctr5V0vWIsibnQS49mUB307jQGvgEu5R5vhoUAwizs+2YXNIhA/qD9wpJsnu
6uIyJe+jAAYkhLevxQ3FbI8KC26OeHgEiVgsNL2lBJrEUVrRZ0veM68au2Kyd/giv2F4ocH3yw0G
71A=
=7B5i
-----END PGP SIGNATURE-----

--------------qZc0sIYZ4xZV7VgM2KS0nnnL--
