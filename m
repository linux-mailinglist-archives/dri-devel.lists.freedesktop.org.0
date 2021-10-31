Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D65AC441005
	for <lists+dri-devel@lfdr.de>; Sun, 31 Oct 2021 19:09:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B7D89B12;
	Sun, 31 Oct 2021 18:09:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86E0A89B12
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Oct 2021 18:09:43 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A955D1F770;
 Sun, 31 Oct 2021 18:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1635703780; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zTqvJIRVz+IJNaKULRHWkBFfeKqgj42o1KcagqhmWY4=;
 b=PejakCDq5Xx0sBmwKQ/Ew7Q9IYRGWEOD+T/TAZSqa1kcQ9DwLLBV932bDz4vwMkXB0O/OO
 Kmku1mh+bykrW1Kb0gYrhXar/58G4dd7kCQ1uW9t6lil9s8MDcKTYGaBkLFKVZI+qeMmpZ
 aOCOf3q27YOYgJu/QoqnW48CEfYncdc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1635703780;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zTqvJIRVz+IJNaKULRHWkBFfeKqgj42o1KcagqhmWY4=;
 b=2cbT/0Zz5sO/ILj6A/0jCWqa/JudYD+Gd64+CRV5W2cpppUXpcK99L+GBBKsKp+M49LmOS
 h/I7+zbSJEa6M8Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6D1C91323E;
 Sun, 31 Oct 2021 18:09:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EiQSGeTbfmHXVAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Sun, 31 Oct 2021 18:09:40 +0000
Message-ID: <6e69f9bb-5a1e-7b79-38e8-d2860e5ee615@suse.de>
Date: Sun, 31 Oct 2021 19:09:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] drm/rockchip: use generic fbdev setup
Content-Language: en-US
To: John Keeping <john@metanate.com>
Cc: dri-devel@lists.freedesktop.org, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20211029115014.264084-1-john@metanate.com>
 <ab7ace79-0148-1efa-ec17-6994bb35fd2f@suse.de> <YX01C6l93I2YPgku@donbot>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <YX01C6l93I2YPgku@donbot>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------qv0emOEtdJF4vygXj03v61OU"
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
--------------qv0emOEtdJF4vygXj03v61OU
Content-Type: multipart/mixed; boundary="------------0glOOvkbn2FeyB0F4Gj3rKnM";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: John Keeping <john@metanate.com>
Cc: dri-devel@lists.freedesktop.org, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=c3=bcbner?= <heiko@sntech.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Message-ID: <6e69f9bb-5a1e-7b79-38e8-d2860e5ee615@suse.de>
Subject: Re: [PATCH] drm/rockchip: use generic fbdev setup
References: <20211029115014.264084-1-john@metanate.com>
 <ab7ace79-0148-1efa-ec17-6994bb35fd2f@suse.de> <YX01C6l93I2YPgku@donbot>
In-Reply-To: <YX01C6l93I2YPgku@donbot>

--------------0glOOvkbn2FeyB0F4Gj3rKnM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMzAuMTAuMjEgdW0gMTQ6MDUgc2NocmllYiBKb2huIEtlZXBpbmc6DQo+IEhp
IFRob21hcywNCj4gDQo+IE9uIEZyaSwgT2N0IDI5LCAyMDIxIGF0IDA5OjAwOjA4UE0gKzAy
MDAsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4gQW0gMjkuMTAuMjEgdW0gMTM6NTAg
c2NocmllYiBKb2huIEtlZXBpbmc6DQo+Pj4gVGhlIFJvY2tjaGlwIGZiZGV2IGNvZGUgZG9l
cyBub3QgYWRkIGFueXRoaW5nIGNvbXBhcmVkIHRvDQo+Pj4gZHJtX2ZiZGV2X2dlbmVyaWNf
c2V0dXAoKTsgdGhlIG9uZSBjdXN0b20gZnVuY3Rpb24gZm9yIC5mYl9tbWFwIGRvZXMgdGhl
DQo+Pj4gc2FtZSB0aGluZyBhcyBnZW1fcHJpbWVfbW1hcCB3aGljaCBpcyBjYWxsZWQgYnkg
dGhlIGhlbHBlci4NCj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IEpvaG4gS2VlcGluZyA8am9o
bkBtZXRhbmF0ZS5jb20+DQo+Pj4gLS0tDQo+Pj4gICAgZHJpdmVycy9ncHUvZHJtL3JvY2tj
aGlwL01ha2VmaWxlICAgICAgICAgICAgIHwgICAxIC0NCj4+PiAgICBkcml2ZXJzL2dwdS9k
cm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX2Rydi5jICAgfCAgMTAgKy0NCj4+PiAgICBkcml2
ZXJzL2dwdS9kcm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX2Rydi5oICAgfCAgIDIgLQ0KPj4+
ICAgIGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fZmJkZXYuYyB8IDE2
NCAtLS0tLS0tLS0tLS0tLS0tLS0NCj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vcm9ja2NoaXAv
cm9ja2NoaXBfZHJtX2ZiZGV2LmggfCAgMjQgLS0tDQo+Pj4gICAgNSBmaWxlcyBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDE5OSBkZWxldGlvbnMoLSkNCj4+PiAgICBkZWxldGUgbW9k
ZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL3JvY2tjaGlwX2RybV9mYmRldi5j
DQo+Pj4gICAgZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9y
b2NrY2hpcF9kcm1fZmJkZXYuaA0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9yb2NrY2hpcC9NYWtlZmlsZSBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9NYWtl
ZmlsZQ0KPj4+IGluZGV4IDE3YTllN2ViMjEzMC4uMWE1NmY2OTY1NThjIDEwMDY0NA0KPj4+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9NYWtlZmlsZQ0KPj4+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9yb2NrY2hpcC9NYWtlZmlsZQ0KPj4+IEBAIC01LDcgKzUsNiBAQA0K
Pj4+ICAgIHJvY2tjaGlwZHJtLXkgOj0gcm9ja2NoaXBfZHJtX2Rydi5vIHJvY2tjaGlwX2Ry
bV9mYi5vIFwNCj4+PiAgICAJCXJvY2tjaGlwX2RybV9nZW0ubyByb2NrY2hpcF9kcm1fdm9w
Lm8gcm9ja2NoaXBfdm9wX3JlZy5vDQo+Pj4gLXJvY2tjaGlwZHJtLSQoQ09ORklHX0RSTV9G
QkRFVl9FTVVMQVRJT04pICs9IHJvY2tjaGlwX2RybV9mYmRldi5vDQo+Pj4gICAgcm9ja2No
aXBkcm0tJChDT05GSUdfUk9DS0NISVBfQU5BTE9HSVhfRFApICs9IGFuYWxvZ2l4X2RwLXJv
Y2tjaGlwLm8NCj4+PiAgICByb2NrY2hpcGRybS0kKENPTkZJR19ST0NLQ0hJUF9DRE5fRFAp
ICs9IGNkbi1kcC1jb3JlLm8gY2RuLWRwLXJlZy5vDQo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9yb2NrY2hpcC9yb2NrY2hpcF9kcm1fZHJ2LmMgYi9kcml2ZXJzL2dwdS9k
cm0vcm9ja2NoaXAvcm9ja2NoaXBfZHJtX2Rydi5jDQo+Pj4gaW5kZXggNjljNjk5NDU5ZGNl
Li4yMGQ4MWFlNjk4MjggMTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JvY2tj
aGlwL3JvY2tjaGlwX2RybV9kcnYuYw0KPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yb2Nr
Y2hpcC9yb2NrY2hpcF9kcm1fZHJ2LmMNCj4+PiBAQCAtMjYsNyArMjYsNiBAQA0KPj4+ICAg
ICNpbmNsdWRlICJyb2NrY2hpcF9kcm1fZHJ2LmgiDQo+Pj4gICAgI2luY2x1ZGUgInJvY2tj
aGlwX2RybV9mYi5oIg0KPj4+IC0jaW5jbHVkZSAicm9ja2NoaXBfZHJtX2ZiZGV2LmgiDQo+
Pj4gICAgI2luY2x1ZGUgInJvY2tjaGlwX2RybV9nZW0uaCINCj4+PiAgICAjZGVmaW5lIERS
SVZFUl9OQU1FCSJyb2NrY2hpcCINCj4+PiBAQCAtMTU5LDEwICsxNTgsNiBAQCBzdGF0aWMg
aW50IHJvY2tjaGlwX2RybV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldikNCj4+PiAgICAJZHJt
X21vZGVfY29uZmlnX3Jlc2V0KGRybV9kZXYpOw0KPj4+IC0JcmV0ID0gcm9ja2NoaXBfZHJt
X2ZiZGV2X2luaXQoZHJtX2Rldik7DQo+Pj4gLQlpZiAocmV0KQ0KPj4+IC0JCWdvdG8gZXJy
X3VuYmluZF9hbGw7DQo+Pj4gLQ0KPj4+ICAgIAkvKiBpbml0IGttcyBwb2xsIGZvciBoYW5k
bGluZyBocGQgKi8NCj4+PiAgICAJZHJtX2ttc19oZWxwZXJfcG9sbF9pbml0KGRybV9kZXYp
Ow0KPj4+IEBAIC0xNzAsMTAgKzE2NSwxMSBAQCBzdGF0aWMgaW50IHJvY2tjaGlwX2RybV9i
aW5kKHN0cnVjdCBkZXZpY2UgKmRldikNCj4+PiAgICAJaWYgKHJldCkNCj4+PiAgICAJCWdv
dG8gZXJyX2ttc19oZWxwZXJfcG9sbF9maW5pOw0KPj4+ICsJZHJtX2ZiZGV2X2dlbmVyaWNf
c2V0dXAoZHJtX2RldiwgMzIpOw0KPj4NCj4+IFBsZWFzZSBwYXNzIDAgZm9yIHRoZSBmaW5h
bCBhcmd1bWVudC4gVGhlIGZiZGV2IGhlbHBlcnMgcGljayAzMiBieSBkZWZhdWx0Lg0KPj4g
TWF5YmUgbGVhdmUgYSBjb21tZW50IGlmIHlvdSByZXF1aXJlIDMyIGhlcmUuDQo+IA0KPiBJ
IHdhbnRlZCB0byBtaW5pbWlzZSB0aGUgY2hhbmdlcyBpbnRyb2R1Y2VkIGhlcmUgLSBwYXNz
aW5nIDMyIG1hdGNoZXMNCj4gdGhlIHZhbHVlIHBhc3NlZCB0byBkcm1fZmJfaGVscGVyX2lu
aXRpYWxfY29uZmlnKCkgaW4gdGhlIGRlbGV0ZWQgY29kZQ0KPiBmcm9tIHJvY2tjaGlwX2Ry
bV9mYmRldi5jLg0KDQpJbiB0aGF0IGNhc2UNCg0KQWNrZWQtYnk6IFRob21hcyBaaW1tZXJt
YW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KDQo+IA0KPiBXaGF0IGRvIHlvdSB0aGluayBh
Ym91dCBjaGFuZ2luZyB0aGlzIHRvIDAgaW4gYSBmb2xsb3ctdXAgcGF0Y2g/DQo+IA0KDQpZ
ZXMuIElmIHBvc3NpYmxlLCBwbGVhc2UgcHJvdmlkZSBhIGZvbGxvdy11cCBwYXRjaCBmb3Ig
dGhpcyBhbmQgc2V0IA0KbW9kZWNvbmZpZy5wcmVmZXJlZF9kZXB0aCB0byAyNC4NCg0KQmVz
dCByZWdhcmRzDQpUaG9tYXMNCg0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGlj
cyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdt
YkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgw
OSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEZlbGl4IEltZW5kw7ZyZmZl
cg0K

--------------0glOOvkbn2FeyB0F4Gj3rKnM--

--------------qv0emOEtdJF4vygXj03v61OU
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmF+2+MFAwAAAAAACgkQlh/E3EQov+DH
eA/+NrOz2Db7B97Bma1+KljnCw5VmiU5/TQeM0bCXL8lxCbwTACpu2UWrNab0Knb0wlIA+LtGnHh
yghYGwZEpqpcXYn83H/GeZih9U/CtevVM3uXPTxSAHg/AZYKt0AGNRHkGO/rZ6jZgkDTBJKJCTgH
V9tyCXiOzjcakCUCqLQmvIQ6pfdP7golKJ1YBWqZ5BKXRQaDk5116Om9NUrNojqBQ9X8vTS7rZaZ
goX9RgqYq/f9hc4KtIdo8ULiYab4qpuABfzcaLVGK1+sfPwB6RBB7zcdGLhehucctImoNLhGj/28
TX6DLqhV6tSdsJGXSdITKswxx2e5CKdOZrdJcS+A5j8BhO3xLQqHwRiTtLmNnWBxt0Z1MZlGUAF3
h0y/Uhh9NUuB5wOjqOf3jvesEVHU7/nXc3k5G1PGU0H6ERP1sypEYlzITPkOLSbLR62JATAFpgxS
Ci31qfQ8dNEOYjg700kDF+IsF0mRcm5mCVHYUNSWcDxnurZmvWZWJTM2GuLx1okT12HyD7AP2I3b
6m1AO+0dFrgjrv4lyuS6+iB4nwGl4xmSuWgAAEQtPCmF2sIAcCO4CsHe0MZDVUHnQo3H4Gj8OdL0
+3osN8v3FvDzbWyeqI/HiVXyaS0wUNtd/x5kq13LuopnvOoQGtOOLdwkjD1k/VmiJpZSzl/zheg5
0C4=
=XT9P
-----END PGP SIGNATURE-----

--------------qv0emOEtdJF4vygXj03v61OU--
