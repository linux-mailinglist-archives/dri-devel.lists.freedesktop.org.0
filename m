Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FD16EF35C
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 13:22:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B6E410E948;
	Wed, 26 Apr 2023 11:22:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AAB010E947
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 11:22:52 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 941EC1FDCD;
 Wed, 26 Apr 2023 11:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1682508170; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ERLuamK+4YXmky25fPzXiBcMthT0Oi6yejziPTH+uqU=;
 b=qWVbrg5eKraD5h7wVEXKgV40mQWd+3e7GvIDaOqzNJQF49Htzw6fzD5g6kziOESOOlYnmE
 XmBxQqLQYzICKqVAAfcJDiXmg/virqfi2DLTO99x+BKhUvHRQMl/7tzKBJueFErlIDtt0e
 bRfr8ATgSqcwmaIeKNckk3NWe1D6yY0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1682508170;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ERLuamK+4YXmky25fPzXiBcMthT0Oi6yejziPTH+uqU=;
 b=LuXJrrUPOG2zSlD4kpU27KLHnMsA7zxL1YAFJeYTfvCJGLZi5KiJIXBCQT/1iNjZdgfuUs
 qZTzNkYomNC2pVAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 45802138F0;
 Wed, 26 Apr 2023 11:22:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id iUosEIoJSWRJeAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 26 Apr 2023 11:22:50 +0000
Message-ID: <0bbd0594-4ad6-4014-2c8b-3e26e762f793@suse.de>
Date: Wed, 26 Apr 2023 13:22:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 0/6] drm,fbdev: Use fbdev's I/O helpers
Content-Language: en-US
To: Sui Jingfeng <15330273260@189.cn>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch, javierm@redhat.com,
 deller@gmx.de, geert@linux-m68k.org, sudipm.mukherjee@gmail.com,
 teddy.wang@siliconmotion.com
References: <20230425142846.730-1-tzimmermann@suse.de>
 <3731fda4-14d6-b4ee-0036-0ea0dd2e9bc9@189.cn>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <3731fda4-14d6-b4ee-0036-0ea0dd2e9bc9@189.cn>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------EE2idRjypK0ZFMpl0Odt2N26"
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
--------------EE2idRjypK0ZFMpl0Odt2N26
Content-Type: multipart/mixed; boundary="------------om0Ofp9JQjpl2HGO0SxXZ8U3";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sui Jingfeng <15330273260@189.cn>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, daniel@ffwll.ch, javierm@redhat.com,
 deller@gmx.de, geert@linux-m68k.org, sudipm.mukherjee@gmail.com,
 teddy.wang@siliconmotion.com
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <0bbd0594-4ad6-4014-2c8b-3e26e762f793@suse.de>
Subject: Re: [PATCH 0/6] drm,fbdev: Use fbdev's I/O helpers
References: <20230425142846.730-1-tzimmermann@suse.de>
 <3731fda4-14d6-b4ee-0036-0ea0dd2e9bc9@189.cn>
In-Reply-To: <3731fda4-14d6-b4ee-0036-0ea0dd2e9bc9@189.cn>

--------------om0Ofp9JQjpl2HGO0SxXZ8U3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDI2LjA0LjIzIHVtIDEyOjMzIHNjaHJpZWIgU3VpIEppbmdmZW5nOg0KPiBIaSwN
Cj4gDQo+IA0KPiBUaGUgd2hvbGUgcGF0Y2ggc2V0IGlzIHRlc3RlZCB3aXRoIGZiZGV2IG9m
IElHVCwgb24gTG9vbmdBcmNoIHdpdGgNCj4gZHJtL3JhZGVvbiBhbmQgZWZpZmIgZHJpdmVy
LiBUZXN0IHJlc3VsdHMgc2F5IFNVQ0NFU1MuDQoNClRoYW5rcyBhIGxvdC4NCg0KPiANCj4g
DQo+IE9uIDIwMjMvNC8yNSAyMjoyOCwgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6DQo+PiBN
YWtlIGZiZGV2J3MgYnVpbHQtaW4gaGVscGVycyBmb3IgcmVhZGluZyBhbmQgd3JpdGluZyBJ
L08gYW5kIHN5c3RlbQ0KPj4gbWVtb3J5IGF2YWlsYWJsZSB0byBEUk0uIFJlcGxhY2UgRFJN
J3MgaW50ZXJuYWwgaGVscGVycy4NCj4+DQo+PiBUaGUgZmlyc3QgcGF0Y2ggcmVzb2x2ZXMg
YSBidWcgdGhhdCdzIGJlZW4gaW4gdGhlIGZiZGV2IGNvZGUgZm9yDQo+PiBtb3JlIHRoYW4g
MTUgeWVhcnMuIE1ha2VzIHRoZSByZWFkL3dyaXRlIGhlbHBlcnMgd29yayBzdWNjZXNzZnVs
bHkNCj4+IHdpdGggdGhlIElHVCB0ZXN0cy4NCj4+DQo+PiBQYXRjaGVzIDIgdG8gNCBzdHJl
YW1saW5lIGZiZGV2J3MgZmlsZS1JL08gY29kZSBhbmQgcmVtb3ZlIGEgZmV3DQo+PiBkdXBs
aWNhdGUgY2hlY2tzLg0KPj4NCj4+IFBhdGNoIDUgbW92ZXMgdGhlIGRlZmF1bHQtSS9PIGNv
ZGUgaW50byB0aGUgbmV3IGhlbHBlcnMgZmJfY2ZiX3JlYWQoKQ0KPj4gYW5kIGZiX2NmYl93
cml0ZSgpOyBwYXRjaCA2IHVzZXMgdGhlbSBpbiBEUk0uIFRoaXMgYWxsb3dzIHVzIHRvIHJl
bW92ZQ0KPj4gcXVpdGUgYSBiaXQgb2YgY29kZSBmcm9tIERSTSdzIGludGVybmFsIGZiZGV2
IGhlbHBlcnMuDQo+Pg0KPj4gVGVzdGVkIHdpdGggaTkxNSBhbmQgc2ltcGxlZHJtLg0KPj4N
Cj4+IFRoZSBuZXh0IHN0ZXAgaGVyZSBpcyB0byByZW1vdmUgdGhlIGRybV9mYl9oZWxwZXJf
e2NmYixzeXN9XyooKQ0KPj4gZW50aXJlbHkuIFRoZXkgd2hlcmUgbW9zdGx5IGludHJvZHVj
ZWQgYmVjYXVzZSBmYmRldiBkb2Vzbid0IHByb3RlY3QNCj4+IGl0J3MgcHVibGljIGludGVy
ZmFjZXMgd2l0aCBhbiBDT05GSUdfRkIgcHJlcHJvY2Vzc29yIGd1YXJkcy4gQnV0IGFsbA0K
Pj4gb2YgRFJNIGRyaXZlcidzIGZiZGV2IGVtdWxhdGlvbiB3b24ndCBiZSBidWlsZCB3aXRo
b3V0IENPTkZJR19GQiwgc28NCj4+IHRoaXMgaXMgbm90IGFuIGlzc3VlIGluIHByYWN0aWNl
LiBSZW1vdmluZyB0aGUgRFJNIHdyYXBwZXJzIHdpbGwNCj4+IGZ1cnRoZXIgc2ltcGxpZnkg
dGhlIERSTSBjb2RlLg0KPj4NCj4+IFRob21hcyBaaW1tZXJtYW5uICg2KToNCj4+IMKgwqAg
ZmJkZXY6IFJldHVybiBudW1iZXIgb2YgYnl0ZXMgcmVhZCBvciB3cml0dGVuDQo+PiDCoMKg
IGZiZGV2OiBVc2Ugc2NyZWVuX2J1ZmZlciBpbiBmYl9zeXNfe3JlYWQsd3JpdGV9KCkNCj4+
IMKgwqAgZmJkZXY6IERvbid0IHJlLXZhbGlkYXRlIGluZm8tPnN0YXRlIGluIGZiX29wcyBp
bXBsZW1lbnRhdGlvbnMNCj4+IMKgwqAgZmJkZXY6IFZhbGlkYXRlIGluZm8tPnNjcmVlbl97
YmFzZSxidWZmZXJ9IGluIGZiX29wcyBpbXBsZW1lbnRhdGlvbnMNCj4+IMKgwqAgZmJkZXY6
IE1vdmUgQ0ZCIHJlYWQgYW5kIHdyaXRlIGNvZGUgaW50byBoZWxwZXIgZnVuY3Rpb25zDQo+
PiDCoMKgIGRybS9mYi1oZWxwZXI6IFVzZSBmYl97Y2ZiLHN5c31fe3JlYWQsIHdyaXRlfSgp
DQo+Pg0KPj4gwqAgZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuY8KgwqDCoMKgwqDC
oMKgIHwgMTc0ICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4+IMKgIGRyaXZlcnMvdmlk
ZW8vZmJkZXYvY29iYWx0X2xjZGZiLmPCoMKgwqDCoCB8wqDCoCA2ICsNCj4+IMKgIGRyaXZl
cnMvdmlkZW8vZmJkZXYvY29yZS9NYWtlZmlsZcKgwqDCoMKgwqAgfMKgwqAgMiArLQ0KPj4g
wqAgZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZiX2NmYl9mb3BzLmMgfCAxMjYgKysrKysr
KysrKysrKysrKysrDQo+PiDCoCBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJfc3lzX2Zv
cHMuYyB8wqAgMzYgKystLS0NCj4+IMKgIGRyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYm1l
bS5jwqDCoMKgwqDCoMKgIHwgMTExICstLS0tLS0tLS0tLS0tLS0NCj4+IMKgIGRyaXZlcnMv
dmlkZW8vZmJkZXYvc203MTJmYi5jwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAxMCArLQ0KPj4g
wqAgaW5jbHVkZS9saW51eC9mYi5owqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB8wqAgMTAgKysNCj4+IMKgIDggZmlsZXMgY2hhbmdlZCwgMTczIGluc2VydGlv
bnMoKyksIDMwMiBkZWxldGlvbnMoLSkNCj4+IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2
ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJfY2ZiX2ZvcHMuYw0KPj4NCg0KLS0gDQpUaG9tYXMg
WmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBT
b2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJu
YmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3RldiwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNE
b25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------om0Ofp9JQjpl2HGO0SxXZ8U3--

--------------EE2idRjypK0ZFMpl0Odt2N26
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmRJCYkFAwAAAAAACgkQlh/E3EQov+CI
hxAAmWmFbsTOHgrGKRNERBs1qTJOv0oP5doMyf120tiPvsPq07xI4uHtAtx0aZXNvFOV/kDpnw3V
ootCTXkqtXwWppPxAz+OGjwgznjMzAiSimXp6BWKbFam3zPE5ADAjBmV+UaP9ptvQ1D6dnFnzhJF
DBfpiFshVVz6XeYsbhd8o9jDvsSZWdtCE+Yutry61M6HJ9kLcsXhF8rGY09T1OfRIfHwYCUCQhCI
WWZxiAH1b1T/5bnvBd1AQhJjj8Q2nqUKZ7e9HKSVDy+MoEnd5qtuAYBMpzm6TTOak9nR/DNK5qD/
2N8TE9uJxya1myhmqcoW6O+l3o5RleT+vdiOVpGIFkjqJssBcNWcZnvabnHX/BfaEsezvi5BK2yB
r/18ZJFfp+EdXVo/8taNkCuIkyc05lCKzyPERjIM0i1LjwJySMErJzMo1vhEmUEltq7zf+I6UQeD
47aY7RTIcX66GO0HvP1ueN9jnvdFtagz7nMnFv4i5TxgLDnJxDr8/8sTq4bK958mAklD/Jh1s9jI
XKi17bQUMCdE9ROucs+qIWAfxM2skhKrogkVObpyCejcvXvdaJDrMwGzURFeZkwix/LyWelSIzc/
5xDQFXywkPyXlSU5cxv4x6nyXKy2cvwMShANXkjPVfVetCZmW2GH+kWajilAjfFc2Dsdm02S+25L
moU=
=Jv3P
-----END PGP SIGNATURE-----

--------------EE2idRjypK0ZFMpl0Odt2N26--
