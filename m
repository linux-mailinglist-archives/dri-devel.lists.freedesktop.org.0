Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 086F76E46DE
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 13:54:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31E1F10E463;
	Mon, 17 Apr 2023 11:54:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78E0A10E463
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 11:54:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C548C21A4A;
 Mon, 17 Apr 2023 11:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1681732452; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=seBtqa2MvCsisDOd9YNWm0x+EnP+1UCUGTeC9Mmglgg=;
 b=QIYE6cimxpfTa/cKx33ptlCRtu9C9r0pPHGIlpGsz/kSRyRmN/nIjTtSIhiRD/pL2AJJ1a
 x+s1K1RT0STJJI9sAnscXb/4wh1gViP2zfLTr1fAAvXT+62TfYlHvPqwTI5BVsgpiTtPHL
 ePeFTt8bzPRbEaIMx3l8cSSZ6Sas8TI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1681732452;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=seBtqa2MvCsisDOd9YNWm0x+EnP+1UCUGTeC9Mmglgg=;
 b=ZEWbTTVF8cC4Af9+C9wdoJA39zBfyrWKPnh6QY/hMbUf07+tTJ22e5INxO5dkXt+P+JRhh
 T8bI5ueQnu8KeTCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8819A13319;
 Mon, 17 Apr 2023 11:54:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CwBVIGQzPWTONwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 17 Apr 2023 11:54:12 +0000
Message-ID: <1a46142f-b7bc-d11f-1ad2-7433aafd0976@suse.de>
Date: Mon, 17 Apr 2023 13:54:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3] drm/fbdev-generic: prohibit potential out-of-bounds
 access
Content-Language: en-US
To: Sui Jingfeng <suijingfeng@loongson.cn>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Li Yi <liyi@loongson.cn>,
 Helge Deller <deller@gmx.de>, Lucas De Marchi <lucas.demarchi@intel.com>
References: <20230417113219.1354078-1-suijingfeng@loongson.cn>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230417113219.1354078-1-suijingfeng@loongson.cn>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------APO00WSf8RVAKDBuCNqXIP9l"
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
--------------APO00WSf8RVAKDBuCNqXIP9l
Content-Type: multipart/mixed; boundary="------------w289ehKlxbP1df468BandQ6F";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sui Jingfeng <suijingfeng@loongson.cn>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Li Yi <liyi@loongson.cn>,
 Helge Deller <deller@gmx.de>, Lucas De Marchi <lucas.demarchi@intel.com>
Cc: loongson-kernel@lists.loongnix.cn, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <1a46142f-b7bc-d11f-1ad2-7433aafd0976@suse.de>
Subject: Re: [PATCH v3] drm/fbdev-generic: prohibit potential out-of-bounds
 access
References: <20230417113219.1354078-1-suijingfeng@loongson.cn>
In-Reply-To: <20230417113219.1354078-1-suijingfeng@loongson.cn>

--------------w289ehKlxbP1df468BandQ6F
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTcuMDQuMjMgdW0gMTM6MzIgc2NocmllYiBTdWkgSmluZ2Zlbmc6DQo+IFRo
ZSBmYmRldiB0ZXN0IG9mIElHVCBtYXkgd3JpdGUgYWZ0ZXIgRU9GLCB3aGljaCBsZWFkIHRv
IG91dC1vZi1ib3VuZA0KPiBhY2Nlc3MgZm9yIHRoZSBkcm0gZHJpdmVycyB1c2luZyBmYmRl
di1nZW5lcmljLiBGb3IgZXhhbXBsZSwgb24gYSB4ODYNCj4gKyBhc3BlZWQgYm1jIGNhcmQg
cGxhdGZvcm0sIHdpdGggYSAxNjgweDEwNTAgcmVzb2x1dGlvbiBkaXNwbGF5LCBydW5uaW5n
DQo+IGZiZGV2IHRlc3QgaWYgSUdUIHdpbGwgY2F1c2UgdGhlIGxpbnV4IGtlcm5lbCBoYW5n
IHdpdGggdGhlIGZvbGxvd2luZw0KPiBjYWxsIHRyYWNlOg0KPiANCj4gICAgT29wczogMDAw
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
PiAgICAtLS1bIGVuZCB0cmFjZSAwMDAwMDAwMDAwMDAwMDAwIF0tLS0NCj4gDQo+IFRoZSBk
aXJlY3QgcmVhc29uIGlzIHRoYXQgZGFtYWdlIHJlY3RhbmdlIGNvbXB1dGVkIGJ5DQo+IGRy
bV9mYl9oZWxwZXJfbWVtb3J5X3JhbmdlX3RvX2NsaXAoKSBkb2VzIG5vdCBndWFyYW50ZWVk
IHRvIGJlIGluLWJvdW5kLg0KPiBJdCBpcyBhbHJlYWR5IHJlc3VsdHMgaW4gd29ya2Fyb3Vu
ZCBjb2RlIHBvcHVsYXRlIHRvIGVsc2V3aGVyZS4gQW5vdGhlcg0KPiByZWFzb24gaXMgdGhh
dCBleHBvc2luZyBhIGxhcmdlciBidWZmZXIgc2l6ZSB0aGFuIHRoZSBhY3R1YWwgbmVlZGVk
IGhlbHANCj4gdG8gdHJpZ2dlciB0aGlzIGJ1ZyBpbnRyaW5zaWMgaW4gZHJtX2ZiX2hlbHBl
cl9tZW1vcnlfcmFuZ2VfdG9fY2xpcCgpLg0KPiANCj4gT3RoZXJzIGZiZGV2IGVtdWxhdGlv
biBzb2x1dGlvbnMgd3JpdGUgdG8gdGhlIEdFTSBidWZmZXIgZGlyZWN0bHksIHRoZXkNCj4g
d29uJ3QgcmVwcm9kdWNlIHRoaXMgYnVnIGJlY2F1c2UgdGhlIC5mYl9kaXJ0eSBmdW5jdGlv
biBjYWxsYmFjayBkbyBub3QNCj4gYmVpbmcgaG9va2VkLCBzbyBubyBjaGFuY2UgaXMgZ2l2
ZW4gdG8gZHJtX2ZiX2hlbHBlcl9tZW1vcnlfcmFuZ2VfdG9fY2xpcCgpDQo+IHRvIGdlbmVy
YXRlIGEgb3V0LW9mLWJvdW5kIHdoZW4gZHJtX2ZiX2hlbHBlcl9zeXNfd3JpdGUoKSBpcyBj
YWxsZWQuDQo+IA0KPiBUaGlzIHBhdGNoIGJyZWFrIHRoZSB0cmlnZ2VyIGNvbmRpdGlvbiBv
ZiB0aGlzIGJ1ZyBieSBzaHJpbmtpbmcgdGhlIHNoYWRvdw0KPiBidWZmZXIgc2l6ZSB0byBz
aXplcy0+c3VyZmFjZV9oZWlnaHQgKiBidWZmZXItPmZiLT5waXRjaGVzWzBdLg0KPiANCj4g
Rml4ZXM6ICc4ZmJjOWFmNTVkZTAgKCJkcm0vZmJkZXYtZ2VuZXJpYzogU2V0IHNjcmVlbiBz
aXplIHRvIHNpemUgb2YgR0VNDQo+IGJ1ZmZlciIpJw0KPiANCj4gU2lnbmVkLW9mZi1ieTog
U3VpIEppbmdmZW5nIDxzdWlqaW5nZmVuZ0Bsb29uZ3Nvbi5jbj4NCj4gLS0tDQo+ICAgZHJp
dmVycy9ncHUvZHJtL2RybV9mYmRldl9nZW5lcmljLmMgfCAyICstDQo+ICAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2RybV9mYmRldl9nZW5lcmljLmMgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX2ZiZGV2X2dlbmVyaWMuYw0KPiBpbmRleCA4ZTUxNDhiZjQwYmIuLmIwNTdjZmJi
YTkzOCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9mYmRldl9nZW5lcmlj
LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9mYmRldl9nZW5lcmljLmMNCj4gQEAg
LTk0LDcgKzk0LDcgQEAgc3RhdGljIGludCBkcm1fZmJkZXZfZ2VuZXJpY19oZWxwZXJfZmJf
cHJvYmUoc3RydWN0IGRybV9mYl9oZWxwZXIgKmZiX2hlbHBlciwNCj4gICAJZmJfaGVscGVy
LT5idWZmZXIgPSBidWZmZXI7DQo+ICAgCWZiX2hlbHBlci0+ZmIgPSBidWZmZXItPmZiOw0K
PiAgIA0KPiAtCXNjcmVlbl9zaXplID0gYnVmZmVyLT5nZW0tPnNpemU7DQo+ICsJc2NyZWVu
X3NpemUgPSBzaXplcy0+c3VyZmFjZV9oZWlnaHQgKiBidWZmZXItPmZiLT5waXRjaGVzWzBd
Ow0KUmV2aWV3ZWQtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRl
Pg0KDQpUaGFua3MgYSBsb3QgZm9yIHRoZSBidWdmaXguDQoNCkJlc3QgcmVnYXJkcw0KVGhv
bWFzDQoNCj4gICAJc2NyZWVuX2J1ZmZlciA9IHZ6YWxsb2Moc2NyZWVuX3NpemUpOw0KPiAg
IAlpZiAoIXNjcmVlbl9idWZmZXIpIHsNCj4gICAJCXJldCA9IC1FTk9NRU07DQoNCi0tIA0K
VGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29m
dHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8
cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRz
ZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------w289ehKlxbP1df468BandQ6F--

--------------APO00WSf8RVAKDBuCNqXIP9l
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQ9M2QFAwAAAAAACgkQlh/E3EQov+Ba
ug/+J3K85UkSdAkcKHawzQNvwpgdAsMi3SeFWz6+Wr7CVt9Vd3HwhO9cYIBKOPzvbMtcEA2LS1cB
u0KnxAbytpjQ8g7UhnN/AtfdKkagj8f8UxgtXQ40YYhjASsrbyXsMWoULio+zD8scx/jztIB6R7q
aJtwYKTpjc5mYI8fJmTt1Cj8w6L9UM8ZEiFajDH84RuwSaEQKfhgZcuxko3tM67rd2Ota4KT1wP2
z1VoERvX5CPvi/kF0X+pEGGR9TNbkcNAb2aNgSbVecj5qngxD66vVmcKqlKYxZCRz7l3R1R39wAP
lecK9xpNPOlmhn52/NnpRbeQG65we68/ndijBAABfChP+wzkCNO2WPvJYwMubwhZjIAP/G/ZlXE8
Y83kQ1teQLKfxZGZYp5ll80pDrg4TrUVnxKadVCqgZItxx0fRRC4qQbMq5e4wwbZ+Y/CoZfrOaNW
eCPtyeJM+G982mONSpnXRBV3GbP4qNVr0fzIEGsGzKZTmDoZfWhEGXRcrzRTXaFINntpbswhibau
HfGkIyQqNmWS4YlsREVflK+68fUUDoG809lr/OzR9AVtegmtFC8VPnNejLscFO1S+smSq8fy3QzL
DibvMhLcaLYDrhIAWz613tR7Hk2sa0U6hficLFj4YzotVhlSVUrhcRNSa/qgmBR1coLkJZEaTsJu
j60=
=rMEV
-----END PGP SIGNATURE-----

--------------APO00WSf8RVAKDBuCNqXIP9l--
