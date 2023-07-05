Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B617480E1
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 11:31:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B18B10E342;
	Wed,  5 Jul 2023 09:31:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0BCA10E342
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 09:31:03 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1ABB91F45F;
 Wed,  5 Jul 2023 09:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1688549462; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HeQ9LrOsUqD3OfU4ER59I3xZk1hPMMUrraU0zrp5Y3A=;
 b=sCY6UPBbYkE1ahBT2tBnaF+77UvB/jcLQlUnbhW0LRGYRLiLsxRXnikik9P3DUdAW7hjXn
 zbnoPoHPd5Gej3lFfz8yttiHF7ynYdQncVYgOmqpIvehDuNiLpmwiFwZGT2QsVUdNT+h9g
 L726gJQcxgYxt6CLPQK114CEbHUokE8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1688549462;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HeQ9LrOsUqD3OfU4ER59I3xZk1hPMMUrraU0zrp5Y3A=;
 b=09qc8dyBIwXQES9jckAhyXcGIroUVbISyMJtJ+bMW5qVGEQwDuvszsaDKTF90Kw997CuTX
 OK/Jtpsz4tY7QRAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CAD4D134F3;
 Wed,  5 Jul 2023 09:31:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id xwpYMFU4pWTebwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 05 Jul 2023 09:31:01 +0000
Message-ID: <a69f00d6-d6f9-377a-a4a6-fc6cc4bd6b7f@suse.de>
Date: Wed, 5 Jul 2023 11:31:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 06/10] drm/exynos: Set fbdev flags
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
References: <20230704160133.20261-1-tzimmermann@suse.de>
 <20230704160133.20261-7-tzimmermann@suse.de>
 <87r0pmrbdn.fsf@minerva.mail-host-address-is-not-set>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <87r0pmrbdn.fsf@minerva.mail-host-address-is-not-set>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------k2xZtFHuB0pXMYmAMvNEPTse"
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
Cc: linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 dri-devel@lists.freedesktop.org, Kyungmin Park <kyungmin.park@samsung.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------k2xZtFHuB0pXMYmAMvNEPTse
Content-Type: multipart/mixed; boundary="------------cvi7XoyWpU0Tv4fWnrYmCDD0";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-fbdev@vger.kernel.org, Inki Dae <inki.dae@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>
Message-ID: <a69f00d6-d6f9-377a-a4a6-fc6cc4bd6b7f@suse.de>
Subject: Re: [PATCH 06/10] drm/exynos: Set fbdev flags
References: <20230704160133.20261-1-tzimmermann@suse.de>
 <20230704160133.20261-7-tzimmermann@suse.de>
 <87r0pmrbdn.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87r0pmrbdn.fsf@minerva.mail-host-address-is-not-set>

--------------cvi7XoyWpU0Tv4fWnrYmCDD0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDUuMDcuMjMgdW0gMTA6NDkgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPiB3cml0
ZXM6DQo+IA0KPj4gU2V0IGZiZGV2IGRlZmF1bHQgZmxhZ3MgRkJORk9fREVGQVVMVCBhbmQg
bWFyayB0aGUgZnJhbWVidWZmZXIgd2l0aA0KPiANCj4gRkJJTkZPX0RFRkFVTFQsIG9yIGRp
ZCB5b3UgbWVhbmQgRkJJTkZPX0ZMQUdfREVGQVVMVCAodGhlIGZsYWcgeW91ciBwYXRjaA0K
PiBpcyBhY3R1YWxseSB1c2luZykgPw0KPiANCj4gSSBqdXN0IG5vdGljZWQgdGhhdCBhcmUg
dGhlIHNhbWUuLi4gYW5kIGluIHBhdGNoIDA0LzEwIHlvdSB1c2VkIHRoZSBmb3JtZXINCj4g
Zm9yIHRoZSB0ZWdyYSBkcml2ZXIsIGJ1dCBoZXJlIHlvdSBhcmUgdXNpbmcgdGhlIGxhdHRl
ci4gSXMgb24gcHVycG9zZSBvcg0KPiBqdXN0IGEgbWlzdGFrZSA/DQo+IA0KPj4gRkJJTkZP
X1ZJUlRGQi4gVGhlIGZyYW1lYnVmZmVyIHJhbmdlIGlzIGluIERNQS1hYmxlIG1lbW9yeSBh
bmQgc2hvdWxkDQo+PiBiZSBhY2Nlc3NlZCB3aXRoIHRoZSBDUFUncyByZWd1bGFyIG1lbW9y
eSBvcHMuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1t
ZXJtYW5uQHN1c2UuZGU+DQo+PiBDYzogSW5raSBEYWUgPGlua2kuZGFlQHNhbXN1bmcuY29t
Pg0KPj4gQ2M6IFNldW5nLVdvbyBLaW0gPHN3MDMxMi5raW1Ac2Ftc3VuZy5jb20+DQo+PiBD
YzogS3l1bmdtaW4gUGFyayA8a3l1bmdtaW4ucGFya0BzYW1zdW5nLmNvbT4NCj4+IENjOiBL
cnp5c3p0b2YgS296bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+DQo+
PiBDYzogQWxpbSBBa2h0YXIgPGFsaW0uYWtodGFyQHNhbXN1bmcuY29tPg0KPj4gLS0tDQo+
PiAgIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9mYmRldi5jIHwgMiArKw0K
Pj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+Pg0KPj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9mYmRldi5jIGIvZHJpdmVy
cy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2ZiZGV2LmMNCj4+IGluZGV4IDdjYTM0MjRi
NTljZS4uMjhkYzM5OGQ2ZTEwIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2V4
eW5vcy9leHlub3NfZHJtX2ZiZGV2LmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9leHlu
b3MvZXh5bm9zX2RybV9mYmRldi5jDQo+PiBAQCAtNzIsNiArNzIsNyBAQCBzdGF0aWMgaW50
IGV4eW5vc19kcm1fZmJkZXZfdXBkYXRlKHN0cnVjdCBkcm1fZmJfaGVscGVyICpoZWxwZXIs
DQo+PiAgIAkJcmV0dXJuIFBUUl9FUlIoZmJpKTsNCj4+ICAgCX0NCj4+ICAgDQo+PiArCWZi
aS0+ZmxhZ3MgPSBGQklORk9fRkxBR19ERUZBVUxUOw0KPiANCj4gVGhlICNkZWZpbmUgRkJJ
TkZPX0ZMQUdfREVGQVVMVAlGQklORk9fREVGQVVMVCBzZWVtcyB0byBiZSB0aGVyZSBzaW5j
ZSB0aGUNCj4gb3JpZ2luYWwgdjIuNi4xMi1yYzIgZ2l0IGltcG9ydCBpbiBjb21taXQgMWRh
MTc3ZTRjM2Y0LCBzbyBpcyBoYXJkIHRvIGtub3cNCj4gd2h5IHdhcyBpbnRyb2R1Y2VkLiBG
QklORk9fREVGQVVMVCBpcyBtb3JlIHVzZWQsIEkgd2lsbCBqdXN0IHN0aWNrIHRvIHRoYXQ6
DQoNClRoYW5rcyBmb3IgY29tbWVudGluZyBvbiB0aGlzIGlzc3VlLiBJIGRpZG4ndCBub3Rp
Y2UgdGhhdC4NCg0KSSB0aGluayBJJ2xsIGp1c3QgcmVtb3ZlIHRoZXNlIF9ERUZBVUxUIGFz
c2lnbm1lbnRzIGZyb20gdGhlIHBhdGNoc2V0Lg0KDQpBbmQgSSB0aGluayB3ZSBzaG91bGQg
bnVrZSB0aGVtIGVudGlyZWx5IGV2ZXJ5d2hlcmUuIFRoZSBfREVGQVVMVCB2YWx1ZXMgDQph
cmUganVzdCAwIGFmdGVyIGNvbW1pdCAzNzZiM2ZmNTRjOWExLiBTbyB0aGVyZSdzIG5vIHZh
bHVlIGluIGFzc2lnbmluZyANCnRoZW0gYXQgYWxsLg0KDQpCZXN0IHJlZ2FyZHMNClRob21h
cw0KDQo+IA0KPiAkIGdpdCBncmVwIEZCSU5GT19ERUZBVUxUIHwgd2MgLWwNCj4gOTINCj4g
DQo+ICQgZ2l0IGdyZXAgRkJJTkZPX0ZMQUdfREVGQVVMVCB8IHdjIC1sDQo+IDM4DQo+IA0K
PiBSZXZpZXdlZC1ieTogSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzIDxqYXZpZXJtQHJlZGhh
dC5jb20+DQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIg
RGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCkZyYW5r
ZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJnLCBHZXJtYW55DQpHRjogSXZvIFRvdGV2
LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGllbiBNb2VybWFuDQpIUkIg
MzY4MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------cvi7XoyWpU0Tv4fWnrYmCDD0--

--------------k2xZtFHuB0pXMYmAMvNEPTse
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSlOFUFAwAAAAAACgkQlh/E3EQov+BW
lxAAzgOQw1CrdfQHEfra1IrjGEU3AU+y7XfXHfYzZZ43dHUk8BnJLSqHoK5+GWrKD93kKBkhP8K0
wjnB20OYh2HbUbD9nQp1W1kqHUEERlraerX/C82CCnBTUC64JQ99TLHJP1SVYnZKTVSej59xjLso
oDgYzza2pSL1rm5fCq9BNjA4ayW9hYAGDEwMiuFxNV4VJmLDZRBpuJZ9N+CfWP5+5dOCbb9txtBr
kPeBUjXUTNqsohFlyVZ4c4y2CwoElhSwGecVsRYqU+17TyO1/0na9Xl6lsI+fn5laxL3EeNdzR3X
r9yW3QSyw9PrNRE27+rpm9tuH6WZ5TVC1hPHJ/cQkydhKnZtQ5ZPBbEliSCmsi5LNPFVet5vEWHp
0TWhBEaSqwTnsDjLxuh9xW+6OUvxLbYLR9mJxt019BVoiins1MWU9qCD2GIExt1NUGr3vKVTVtxI
ok21fg+pBPCuG3+1vKSGQ2WJa1ErZ0O2WrFPB1eetTWiN4ZBT/OsGeAi9eQETtNq1UIQo6lJNibW
qAe5T9xXAQmtFErjewBool2bUr4ZoCV4n2RBRh8gEzHih3PYThYwXheh1lwdYb3Q7R1Fdifv6O7Z
IL6sf5AdduZdXlmDj84JNnPr3JmWUvhgPlXO/7cjNYmSjxqFsqyLdTzrYSnhjhjjr/0hKlQrvPdM
YiM=
=GrQN
-----END PGP SIGNATURE-----

--------------k2xZtFHuB0pXMYmAMvNEPTse--
