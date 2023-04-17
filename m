Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C29BF6E40E4
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 09:29:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F082810E395;
	Mon, 17 Apr 2023 07:29:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B77F10E395
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 07:29:10 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 08F5621A45;
 Mon, 17 Apr 2023 07:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1681716548; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0xqHn1dCfMh1+GXLdAG5Gax3cSAiQr3JRqBhpXjekXc=;
 b=xUEbntQaMdm8Gpt8GA5HyeERalPEetMcM7Qo9xGcLSkY02+oogOSMQ9629Coe3R+iBCLPS
 FOwAgR6fJi4PW9yKcXfERY4RpYdE7jgPoz0hyz6zYCxIw7mCEU9foueASK8T2tbiBdbLfi
 72mfRTe0gxnqhAewUtn9S4DiqM7Gy5U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1681716548;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0xqHn1dCfMh1+GXLdAG5Gax3cSAiQr3JRqBhpXjekXc=;
 b=zIDPRGN9MjC9AHBK0SD3XOUfPXbRRWObhxNU2PBKGs3lpuVML+dSiDip8oC5mxcp8gMUBf
 o0MCCi1Sm6eloFCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B3F4A1390E;
 Mon, 17 Apr 2023 07:29:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yDThKkP1PGTvIAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 17 Apr 2023 07:29:07 +0000
Message-ID: <fab85750-dcb7-0eeb-cabc-8fcfcc84b11c@suse.de>
Date: Mon, 17 Apr 2023 09:29:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2] drm/fbdev-generic: prohibit potential out-of-bounds
 access
Content-Language: en-US
To: Sui Jingfeng <15330273260@189.cn>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sui Jingfeng <suijingfeng@loongson.cn>, Li Yi <liyi@loongson.cn>,
 Javier Martinez Canillas <javierm@redhat.com>, Helge Deller <deller@gmx.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20230413180622.1014016-1-15330273260@189.cn>
 <fccc494f-0e52-5fdf-0e40-acc29177c73c@suse.de>
 <32a1510e-d38a-ffb6-8e8d-026f8b3aa17a@189.cn>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <32a1510e-d38a-ffb6-8e8d-026f8b3aa17a@189.cn>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ywyb9De5l6XIHl5WkBGju9hZ"
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
--------------ywyb9De5l6XIHl5WkBGju9hZ
Content-Type: multipart/mixed; boundary="------------8RAWCqA9UJc0OPo1CDhbS7fe";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sui Jingfeng <15330273260@189.cn>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sui Jingfeng <suijingfeng@loongson.cn>, Li Yi <liyi@loongson.cn>,
 Javier Martinez Canillas <javierm@redhat.com>, Helge Deller <deller@gmx.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Cc: linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, loongson-kernel@lists.loongnix.cn
Message-ID: <fab85750-dcb7-0eeb-cabc-8fcfcc84b11c@suse.de>
Subject: Re: [PATCH v2] drm/fbdev-generic: prohibit potential out-of-bounds
 access
References: <20230413180622.1014016-1-15330273260@189.cn>
 <fccc494f-0e52-5fdf-0e40-acc29177c73c@suse.de>
 <32a1510e-d38a-ffb6-8e8d-026f8b3aa17a@189.cn>
In-Reply-To: <32a1510e-d38a-ffb6-8e8d-026f8b3aa17a@189.cn>

--------------8RAWCqA9UJc0OPo1CDhbS7fe
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTQuMDQuMjMgdW0gMTI6NTggc2NocmllYiBTdWkgSmluZ2Zlbmc6DQo+IEhp
LA0KPiANCj4gT24gMjAyMy80LzE0IDAzOjE2LCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToN
Cj4+IEhpLA0KPj4NCj4+IHRoYW5rcyBmb3IgdGhlIHBhdGNoLiBUaGlzIGlzIGVmZmVjdGl2
ZWx5IGEgcmV2ZXJ0IG9mIGNvbW1pdCANCj4+IDhmYmM5YWY1NWRlMCAoImRybS9mYmRldi1n
ZW5lcmljOiBTZXQgc2NyZWVuIHNpemUgdG8gc2l6ZSBvZiBHRU0gDQo+PiBidWZmZXIiKS4g
UGxlYXNlIGFkZCBhIEZpeGVzIHRhZy4NCj4+DQo+PiBBbSAxMy4wNC4yMyB1bSAyMDowNiBz
Y2hyaWViIFN1aSBKaW5nZmVuZzoNCj4+PiBGcm9tOiBTdWkgSmluZ2ZlbmcgPHN1aWppbmdm
ZW5nQGxvb25nc29uLmNuPg0KPj4+DQo+Pj4gVGhlIGNyYXp5IGZiZGV2IHRlc3Qgb2YgSUdU
IG1heSB3cml0ZSBhZnRlciBFT0YsIHdoaWNoIGxlYWQgdG8gDQo+Pj4gb3V0LW9mLWJvdW5k
DQo+Pg0KPj4gUGxlYXNlIGRyb3AgJ2NyYXp5Jy4gOikNCj4gDQo+IFRoaXMgaXMgT0suDQo+
IA0KPiBCeSB1c2luZyB0aGUgd29ybGQgJ2NyYXp5JywNCj4gDQo+IEkgbWVhbnQgdGhhdCB0
aGUgdGVzdCBpcyB2ZXJ5IGdvb2QgYW5kIG1heWJlIGl0IGlzIHdyaXR0ZW4gYnkgDQo+IHBy
b2Zlc3Npb25hbMKgIHBlb3BsZXMNCj4gDQo+IHdpdGggdGhlIGd1aWRhbmNlIGJ5wqAgZXhw
ZXJpZW5jZWTCoCBlbmdpbmVlci4gU28gdGhhdCBldmVuIHRoZSBjb3JuZXIgZ2V0IA0KPiB0
ZXN0ZWQuDQo+IA0KPiANCj4+DQo+Pj4gYWNjZXNzIGZvciB0aGUgZHJtIGRyaXZlcnMgdXNp
bmcgZmJkZXYtZ2VuZXJpYy4gRm9yIGV4YW1wbGUsIHJ1biANCj4+PiBmYmRldiB0ZXN0DQo+
Pj4gb24gYSB4ODYtNjQrYXN0MjQwMCBwbGF0Zm9ybSB3aXRoIDE2ODB4MTA1MCByZXNvbHV0
aW9uIHdpbGwgY2F1c2UgdGhlIA0KPj4+IGxpbnV4DQo+Pj4ga2VybmVsIGhhbmcgd2l0aCBm
b2xsb3dpbmcgY2FsbCB0cmFjZToNCj4+Pg0KPj4+IMKgwqAgT29wczogMDAwMCBbIzFdIFBS
RUVNUFQgU01QIFBUSQ0KPj4+IMKgwqAgW0lHVF0gZmJkZXY6IHN0YXJ0aW5nIHN1YnRlc3Qg
ZW9mDQo+Pj4gwqDCoCBXb3JrcXVldWU6IGV2ZW50cyBkcm1fZmJfaGVscGVyX2RhbWFnZV93
b3JrIFtkcm1fa21zX2hlbHBlcl0NCj4+PiDCoMKgIFtJR1RdIGZiZGV2OiBzdGFydGluZyBz
dWJ0ZXN0IG51bGxwdHINCj4+Pg0KPj4+IMKgwqAgUklQOiAwMDEwOm1lbWNweV9lcm1zKzB4
YS8weDIwDQo+Pj4gwqDCoCBSU1A6IDAwMTg6ZmZmZmExN2Q0MDE2N2Q5OCBFRkxBR1M6IDAw
MDEwMjQ2DQo+Pj4gwqDCoCBSQVg6IGZmZmZhMTdkNGViN2ZhODAgUkJYOiBmZmZmYTE3ZDQw
ZTBhYTgwIFJDWDogMDAwMDAwMDAwMDAwMTRjMA0KPj4+IMKgwqAgUkRYOiAwMDAwMDAwMDAw
MDAxYTQwIFJTSTogZmZmZmExN2Q0MGUwYjAwMCBSREk6IGZmZmZhMTdkNGViODAwMDANCj4+
PiDCoMKgIFJCUDogZmZmZmExN2Q0MDE2N2UyMCBSMDg6IDAwMDAwMDAwMDAwMDAwMDAgUjA5
OiBmZmZmODk1MjJlY2ZmOGMwDQo+Pj4gwqDCoCBSMTA6IGZmZmZhMTdkNGU0YzUwMDAgUjEx
OiAwMDAwMDAwMDAwMDAwMDAwIFIxMjogZmZmZmExN2Q0ZWI3ZmE4MA0KPj4+IMKgwqAgUjEz
OiAwMDAwMDAwMDAwMDAxYTQwIFIxNDogMDAwMDAwMDAwMDAwMDQxYSBSMTU6IGZmZmZhMTdk
NDAxNjdlMzANCj4+PiDCoMKgIEZTOsKgIDAwMDAwMDAwMDAwMDAwMDAoMDAwMCkgR1M6ZmZm
Zjg5NTI1NzM4MDAwMCgwMDAwKSANCj4+PiBrbmxHUzowMDAwMDAwMDAwMDAwMDAwDQo+Pj4g
wqDCoCBDUzrCoCAwMDEwIERTOiAwMDAwIEVTOiAwMDAwIENSMDogMDAwMDAwMDA4MDA1MDAz
Mw0KPj4+IMKgwqAgQ1IyOiBmZmZmYTE3ZDQwZTBiMDAwIENSMzogMDAwMDAwMDFlYWVjYTAw
NiBDUjQ6IDAwMDAwMDAwMDAxNzA2ZTANCj4+PiDCoMKgIENhbGwgVHJhY2U6DQo+Pj4gwqDC
oMKgIDxUQVNLPg0KPj4+IMKgwqDCoCA/IGRybV9mYmRldl9nZW5lcmljX2hlbHBlcl9mYl9k
aXJ0eSsweDIwNy8weDMzMCBbZHJtX2ttc19oZWxwZXJdDQo+Pj4gwqDCoMKgIGRybV9mYl9o
ZWxwZXJfZGFtYWdlX3dvcmsrMHg4Zi8weDE3MCBbZHJtX2ttc19oZWxwZXJdDQo+Pj4gwqDC
oMKgIHByb2Nlc3Nfb25lX3dvcmsrMHgyMWYvMHg0MzANCj4+PiDCoMKgwqAgd29ya2VyX3Ro
cmVhZCsweDRlLzB4M2MwDQo+Pj4gwqDCoMKgID8gX19wZnhfd29ya2VyX3RocmVhZCsweDEw
LzB4MTANCj4+PiDCoMKgwqAga3RocmVhZCsweGY0LzB4MTIwDQo+Pj4gwqDCoMKgID8gX19w
Znhfa3RocmVhZCsweDEwLzB4MTANCj4+PiDCoMKgwqAgcmV0X2Zyb21fZm9yaysweDJjLzB4
NTANCj4+PiDCoMKgwqAgPC9UQVNLPg0KPj4+IMKgwqAgQ1IyOiBmZmZmYTE3ZDQwZTBiMDAw
DQo+Pj4gwqDCoCAtLS1bIGVuZCB0cmFjZSAwMDAwMDAwMDAwMDAwMDAwIF0tLS0NCj4+Pg0K
Pj4+IFRoZSBpbmRpcmVjdCByZWFzb24gaXMgZHJtX2ZiX2hlbHBlcl9tZW1vcnlfcmFuZ2Vf
dG9fY2xpcCgpIGdlbmVyYXRlIA0KPj4+IGRhbWFnZQ0KPj4+IHJlY3RhbmdsZXMgd2hpY2gg
cGFydGlhbGx5IG9yIGNvbXBsZXRlbHkgZ28gb3V0IG9mIHRoZSBhY3RpdmUgZGlzcGxheSAN
Cj4+PiBhcmVhLg0KPj4+IFRoZSBzZWNvbmQgb2YgYXJndW1lbnQgJ29mZicgaXMgcGFzc2lu
ZyBmcm9tIHRoZSB1c2VyLXNwYWNlLCB0aGlzIA0KPj4+IHdpbGwgbGVhZA0KPj4+IHRvIHRo
ZSBvdXQtb2YtYm91bmQgaWYgaXQgaXMgbGFyZ2UgdGhhbiAoZmJfaGVpZ2h0ICsgMSkgKiBm
Yl9waXRjaGVzOyANCj4+PiB3aGlsZQ0KPj4+IERJVl9ST1VORF9VUCgpIG1heSBhbHNvIGNv
bnRyb2J1dGUgdG8gZXJyb3IgYnkgMS4NCj4+Pg0KPj4+IFRoaXMgcGF0Y2ggd2lsbCBhZGQg
Y29kZSB0byByZXN0cmljdCB0aGUgZGFtYWdlIHJlY3QgY29tcHV0ZWQgZ28gDQo+Pj4gYmV5
b25kIG9mDQo+Pj4gdGhlIGxhc3QgbGluZSBvZiB0aGUgZnJhbWVidWZmZXIuDQo+Pj4NCj4+
PiBTaWduZWQtb2ZmLWJ5OiBTdWkgSmluZ2ZlbmcgPHN1aWppbmdmZW5nQGxvb25nc29uLmNu
Pg0KPj4+IC0tLQ0KPj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmPCoMKg
wqDCoCB8IDE2ICsrKysrKysrKysrKy0tLS0NCj4+PiDCoCBkcml2ZXJzL2dwdS9kcm0vZHJt
X2ZiZGV2X2dlbmVyaWMuYyB8wqAgMiArLQ0KPj4+IMKgIDIgZmlsZXMgY2hhbmdlZCwgMTMg
aW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4+Pg0KPj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jIA0KPj4+IGIvZHJpdmVycy9ncHUvZHJt
L2RybV9mYl9oZWxwZXIuYw0KPj4+IGluZGV4IDY0NDU4OTgyYmU0MC4uNmJiMWI4YjI3ZDdh
IDEwMDY0NA0KPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMNCj4+
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jDQo+Pj4gQEAgLTY0MSwx
OSArNjQxLDI3IEBAIHN0YXRpYyB2b2lkIGRybV9mYl9oZWxwZXJfZGFtYWdlKHN0cnVjdCAN
Cj4+PiBkcm1fZmJfaGVscGVyICpoZWxwZXIsIHUzMiB4LCB1MzIgeSwNCj4+PiDCoCBzdGF0
aWMgdm9pZCBkcm1fZmJfaGVscGVyX21lbW9yeV9yYW5nZV90b19jbGlwKHN0cnVjdCBmYl9p
bmZvIA0KPj4+ICppbmZvLCBvZmZfdCBvZmYsIHNpemVfdCBsZW4sDQo+Pj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0
IGRybV9yZWN0ICpjbGlwKQ0KPj4+IMKgIHsNCj4+PiArwqDCoMKgIHUzMiBsaW5lX2xlbmd0
aCA9IGluZm8tPmZpeC5saW5lX2xlbmd0aDsNCj4+PiArwqDCoMKgIHUzMiBmYl9oZWlnaHQg
PSBpbmZvLT52YXIueXJlczsNCj4+PiDCoMKgwqDCoMKgIG9mZl90IGVuZCA9IG9mZiArIGxl
bjsNCj4+PiDCoMKgwqDCoMKgIHUzMiB4MSA9IDA7DQo+Pj4gLcKgwqDCoCB1MzIgeTEgPSBv
ZmYgLyBpbmZvLT5maXgubGluZV9sZW5ndGg7DQo+Pj4gK8KgwqDCoCB1MzIgeTEgPSBvZmYg
LyBsaW5lX2xlbmd0aDsNCj4+PiDCoMKgwqDCoMKgIHUzMiB4MiA9IGluZm8tPnZhci54cmVz
Ow0KPj4+IC3CoMKgwqAgdTMyIHkyID0gRElWX1JPVU5EX1VQKGVuZCwgaW5mby0+Zml4Lmxp
bmVfbGVuZ3RoKTsNCj4+PiArwqDCoMKgIHUzMiB5MiA9IERJVl9ST1VORF9VUChlbmQsIGxp
bmVfbGVuZ3RoKTsNCj4+PiArDQo+Pj4gK8KgwqDCoCAvKiBEb24ndCBhbGxvdyBhbnkgb2Yg
dGhlbSBiZXlvbmQgdGhlIGJvdHRvbSBib3VuZCBvZiBkaXNwbGF5IA0KPj4+IGFyZWEgKi8N
Cj4+PiArwqDCoMKgIGlmICh5MSA+IGZiX2hlaWdodCkNCj4+PiArwqDCoMKgwqDCoMKgwqAg
eTEgPSBmYl9oZWlnaHQ7DQo+Pj4gK8KgwqDCoCBpZiAoeTIgPiBmYl9oZWlnaHQpDQo+Pj4g
K8KgwqDCoMKgwqDCoMKgIHkyID0gZmJfaGVpZ2h0Ow0KPj4+IMKgIMKgwqDCoMKgwqAgaWYg
KCh5MiAtIHkxKSA9PSAxKSB7DQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIC8qDQo+Pj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqAgKiBXZSd2ZSBvbmx5IHdyaXR0ZW4gdG8gYSBzaW5nbGUgc2Nh
bmxpbmUuIFRyeSB0byByZWR1Y2UNCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIHRoZSBu
dW1iZXIgb2YgaG9yaXpvbnRhbCBwaXhlbHMgdGhhdCBuZWVkIGFuIHVwZGF0ZS4NCj4+PiDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAqLw0KPj4+IC3CoMKgwqDCoMKgwqDCoCBvZmZfdCBiaXRf
b2ZmID0gKG9mZiAlIGluZm8tPmZpeC5saW5lX2xlbmd0aCkgKiA4Ow0KPj4+IC3CoMKgwqDC
oMKgwqDCoCBvZmZfdCBiaXRfZW5kID0gKGVuZCAlIGluZm8tPmZpeC5saW5lX2xlbmd0aCkg
KiA4Ow0KPj4+ICvCoMKgwqDCoMKgwqDCoCBvZmZfdCBiaXRfb2ZmID0gKG9mZiAlIGxpbmVf
bGVuZ3RoKSAqIDg7DQo+Pj4gK8KgwqDCoMKgwqDCoMKgIG9mZl90IGJpdF9lbmQgPSAoZW5k
ICUgbGluZV9sZW5ndGgpICogODsNCj4+DQo+PiBQbGVhc2Ugc2NyYXRjaCBhbGwgdGhlc2Ug
Y2hhbmdlcy4gVGhlIGN1cnJlbnQgY29kZSBzaG91bGQgd29yayBhcyANCj4+IGludGVuZGVk
LiBPbmx5IHRoZSBnZW5lcmljIGZiZGV2IGVtdWxhdGlvbiB1c2VzIHRoaXMgY29kZSBhbmQg
aXQgDQo+PiBzaG91bGQgcmVhbGx5IGJlIG1vdmVkIHRoZXJlIGF0IHNvbWUgcG9pbnQuDQo+
IA0KPiANCj4gQXJlIHlvdSBtZWFudMKgIHRoYXQgd2Ugc2hvdWxkIHJlbW92ZSBhbGwgdGhl
c2UgY2hhbmdlcyBpbiANCj4gZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYyA/DQoN
CkFzIERhbmllbCBtZW50aW9uZWQsIHRoZXJlJ3MgdGhlIGRpc2N1c3Npb24gaW4gdGhlIG90
aGVyIHRocmVhZC4gSSBkb24ndCANCndhbnQgdG8gcmVvcGVuIGl0IGhlcmUuIEp1c3QgdG8g
c3VtbWFyaXplOiBJJ20gbm90IGNvbnZpbmNlZCB0aGF0IHRoaXMgDQpzaG91bGQgYmUgRFJN
IGNvZGUgYmVjYXVzZSBpdCBjYW4gYmUgc2hhcmVkIHdpdGggb3RoZXIgZmJkZXYgZHJpdmVy
cy4NCg0KWy4uLl0NCg0KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Zi
ZGV2X2dlbmVyaWMuYyANCj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJkZXZfZ2VuZXJp
Yy5jDQo+Pj4gaW5kZXggOGU1MTQ4YmY0MGJiLi5iMDU3Y2ZiYmE5MzggMTAwNjQ0DQo+Pj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9mYmRldl9nZW5lcmljLmMNCj4+PiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX2ZiZGV2X2dlbmVyaWMuYw0KPj4+IEBAIC05NCw3ICs5NCw3
IEBAIHN0YXRpYyBpbnQgZHJtX2ZiZGV2X2dlbmVyaWNfaGVscGVyX2ZiX3Byb2JlKHN0cnVj
dCANCj4+PiBkcm1fZmJfaGVscGVyICpmYl9oZWxwZXIsDQo+Pj4gwqDCoMKgwqDCoCBmYl9o
ZWxwZXItPmJ1ZmZlciA9IGJ1ZmZlcjsNCj4+PiDCoMKgwqDCoMKgIGZiX2hlbHBlci0+ZmIg
PSBidWZmZXItPmZiOw0KPj4+IMKgIC3CoMKgwqAgc2NyZWVuX3NpemUgPSBidWZmZXItPmdl
bS0+c2l6ZTsNCj4+PiArwqDCoMKgIHNjcmVlbl9zaXplID0gc2l6ZXMtPnN1cmZhY2VfaGVp
Z2h0ICogYnVmZmVyLT5mYi0+cGl0Y2hlc1swXTsNCg0KVGhpcyBoYXMgYmVlbiBib3RoZXJp
bmcgbWUgb3ZlciB0aGUgd2Vla2VuZC4gQW5kIEkgdGhpbmsgaXQncyBiZWNhdXNlIA0Kd2hh
dCB3ZSB3YW50IHRoZSBzY3JlZW5fc2l6ZSB0byBiZSBoZWlndGggKiBwaXRjaCwgIGJ1dCB0
aGUgbW1hcCdlZCANCm1lbW9yeSBpcyBzdGlsbCBhdCBwYWdlIGdyYW51bGFyaXR5LiBUaGVy
ZWZvcmUuLi4NCg0KWy4uLl0NCj4+DQo+Pj4gwqDCoMKgwqDCoCBzY3JlZW5fYnVmZmVyID0g
dnphbGxvYyhzY3JlZW5fc2l6ZSk7DQoNCi4uLiB0aGlzIGxpbmUgc2hvdWxkIGV4cGxpY2l0
bHkgYWxsb2NhdGUgbXVsdGlwbGVzIG9mIHBhZ2VzLiBTb21ldGhpbmcgbGlrZQ0KDQogICAg
IC8qIGFsbG9jYXRlIHBhZ2Utc2l6ZSBtdWx0aXBsZXMgZm9yIG1tYXAgKi8NCiAgICAgdnph
bGxvYyhQQUdFX0FMSUdOKHNjcmVlbl9zaXplKSkNCg0KSXQgaGFzIG5vdCBiZWVuIGEgYnVn
IHNvIGZhciBiZWNhdXNlIHZ6YWxsb2MoKSBhbHdheXMgcmV0dXJucyBmdWxsIHBhZ2VzIA0K
SUlSQy4gSXQncyBzdGlsbCB3b3J0aCBmaXhpbmcuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFz
DQoNCg0KPj4+IMKgwqDCoMKgwqAgaWYgKCFzY3JlZW5fYnVmZmVyKSB7DQo+Pj4gwqDCoMKg
wqDCoMKgwqDCoMKgIHJldCA9IC1FTk9NRU07DQo+Pg0KDQotLSANClRob21hcyBaaW1tZXJt
YW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9u
cyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFu
eQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBU
b3Rldg0K

--------------8RAWCqA9UJc0OPo1CDhbS7fe--

--------------ywyb9De5l6XIHl5WkBGju9hZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQ89UMFAwAAAAAACgkQlh/E3EQov+Dn
2Q//cwLM15MyEdlXLp07HysGwUgUnAtWxNIfy7v83qO30ZfcAk3HxYlqmG6CEasR99j+O5O3xMWc
jX1DQqlrMzs31RwvIfRFGEL/3zdXsyn5MbKXwe6Xr+UUo0IFLIDPpEvfX5xb0hs/+l2yafm16FoJ
OoFKeH9VTZ+ny6NpzqLai/kabog78G2oy782fNi2e6SMsq+2eTd1vmBfOyA2il6GyVgXfPIJtq7t
7P/y74+TEjhC9iI6ZCUAXC+CoH3myxHdeih31+Y1WMSvEJRoBzxEsUohP8t+Di/Vt0NRQKgyjv7O
9tKqYlKOrwvW9z1jQ/8SCeOxaiKz6EfBrlWRbmRBl/E7C4MnzIzeZZdl3dVPzxLVg8PgwuELFHp7
PB06gMx7FH1XdGs9/ZEg8gdArvxPgkSATmNWgWo1o98tyMsRwOfpWk5EysJNaGToPkl59TCnMJ64
DEp6u8ecJNGq9dlZOMHLnK3zLw9EbM9S2pcIzRuCDWuUHS5F4lCF/iQ56DqXpHY/ReBhKKgueCIr
z8mUlkBKLvoqaZRhMv73uIBx9nOZVLrJ923Ldt/4ZSgnL/Q3yKwcb6oTFklR42qqDN6MOyJ1w+ie
PqPlan3Kxft79rOgqblhU89DwrC6Fbf3h5aMZFB2sn+66+sGf5mlO/T470jNpNhEwOl3bPITRwrK
pGM=
=TiM1
-----END PGP SIGNATURE-----

--------------ywyb9De5l6XIHl5WkBGju9hZ--
