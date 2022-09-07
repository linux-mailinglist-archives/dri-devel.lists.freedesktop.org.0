Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E21395AFD9B
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 09:34:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 307EB10E3CA;
	Wed,  7 Sep 2022 07:34:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DA4C10E3CA
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 07:34:08 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D706033AF0;
 Wed,  7 Sep 2022 07:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662536046; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qrgqRLKYqzJy/2FZojSUcL2Jcc7L3jihwjPqjEwMUeI=;
 b=mfZsiae/A5spmWgfD/SGHmUdbqeUVjGAIMDqfDaWpl8bcnkLc+D+sxyMcI/AH6wtieoRdr
 SegfLVtDCoFLO/YY6pZ/zX43nczWK2uEbzaL/JkT/da6O3MwIYeUEur0zsinnj1grpObgD
 76rvLCkmRzEwHmujlzV64O7biMrvLH8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662536046;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qrgqRLKYqzJy/2FZojSUcL2Jcc7L3jihwjPqjEwMUeI=;
 b=W/il+N90dpDKCgw70hJTc4Odl3/FLXcwYFSWpqVa68xrr1Y0X/MLtTUjeHRH0bsbgfR7pr
 P24JjLqINQXUsqCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BEBFC13A66;
 Wed,  7 Sep 2022 07:34:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id DX19LW5JGGPofAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 07 Sep 2022 07:34:06 +0000
Message-ID: <c07b50fa-1741-0be8-a811-30208a92f521@suse.de>
Date: Wed, 7 Sep 2022 09:34:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2 11/11] drm/udl: Sync pending URBs at the end of suspend
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
References: <20220906073951.2085-1-tiwai@suse.de>
 <20220906073951.2085-12-tiwai@suse.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220906073951.2085-12-tiwai@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------xAzix0aZwShacW15M00GqG08"
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------xAzix0aZwShacW15M00GqG08
Content-Type: multipart/mixed; boundary="------------U2x83S9QmW0V2D7a7GHadken";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <c07b50fa-1741-0be8-a811-30208a92f521@suse.de>
Subject: Re: [PATCH v2 11/11] drm/udl: Sync pending URBs at the end of suspend
References: <20220906073951.2085-1-tiwai@suse.de>
 <20220906073951.2085-12-tiwai@suse.de>
In-Reply-To: <20220906073951.2085-12-tiwai@suse.de>

--------------U2x83S9QmW0V2D7a7GHadken
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDYuMDkuMjIgdW0gMDk6Mzkgc2NocmllYiBUYWthc2hpIEl3YWk6DQo+IEl0
J3MgYmV0dGVyIHRvIHBlcmZvcm0gdGhlIHN5bmMgYXQgdGhlIHZlcnkgbGFzdCBvZiB0aGUg
c3VzcGVuZA0KPiBpbnN0ZWFkIG9mIHRoZSBwaXBlLWRpc2FibGUgZnVuY3Rpb24sIHNvIHRo
YXQgd2UgY2FuIGNhdGNoIGFsbCBwZW5kaW5nDQo+IFVSQnMgKGlmIGFueSkuDQo+IA0KPiBX
aGlsZSB3ZSdyZSBhdCBpdCwgZHJvcCB0aGUgZXJyb3IgY29kZSBmcm9tIHVkbF9zeW5jX3Bl
bmRpbmdfdXJiKCkNCj4gc2luY2Ugd2UgYmFzaWNhbGx5IGlnbm9yZSBpdDsgaW5zdGVhZCwg
Z2l2ZSBhIGNsZWFyIGVycm9yIG1lc3NhZ2UNCj4gaW5kaWNhdGluZyBhIHByb2JsZW0uDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBUYWthc2hpIEl3YWkgPHRpd2FpQHN1c2UuZGU+DQoNCkFj
a2VkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCg0KPiAt
LS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9kcnYuYyAgICAgfCA4ICsrKysrKyst
DQo+ICAgZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfZHJ2LmggICAgIHwgMiArLQ0KPiAgIGRy
aXZlcnMvZ3B1L2RybS91ZGwvdWRsX21haW4uYyAgICB8IDYgKystLS0tDQo+ICAgZHJpdmVy
cy9ncHUvZHJtL3VkbC91ZGxfbW9kZXNldC5jIHwgMiAtLQ0KPiAgIDQgZmlsZXMgY2hhbmdl
ZCwgMTAgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS91ZGwv
dWRsX2Rydi5jDQo+IGluZGV4IDBiYTg4ZTU0NzJhOS4uOTFlZmZkY2VmYjZkIDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9kcnYuYw0KPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vdWRsL3VkbF9kcnYuYw0KPiBAQCAtMjEsOCArMjEsMTQgQEAgc3RhdGljIGlu
dCB1ZGxfdXNiX3N1c3BlbmQoc3RydWN0IHVzYl9pbnRlcmZhY2UgKmludGVyZmFjZSwNCj4g
ICAJCQkgICBwbV9tZXNzYWdlX3QgbWVzc2FnZSkNCj4gICB7DQo+ICAgCXN0cnVjdCBkcm1f
ZGV2aWNlICpkZXYgPSB1c2JfZ2V0X2ludGZkYXRhKGludGVyZmFjZSk7DQo+ICsJaW50IHJl
dDsNCj4gICANCj4gLQlyZXR1cm4gZHJtX21vZGVfY29uZmlnX2hlbHBlcl9zdXNwZW5kKGRl
dik7DQo+ICsJcmV0ID0gZHJtX21vZGVfY29uZmlnX2hlbHBlcl9zdXNwZW5kKGRldik7DQo+
ICsJaWYgKHJldCkNCj4gKwkJcmV0dXJuIHJldDsNCj4gKw0KPiArCXVkbF9zeW5jX3BlbmRp
bmdfdXJicyhkZXYpOw0KPiArCXJldHVybiAwOw0KPiAgIH0NCj4gICANCj4gICBzdGF0aWMg
aW50IHVkbF91c2JfcmVzdW1lKHN0cnVjdCB1c2JfaW50ZXJmYWNlICppbnRlcmZhY2UpDQo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9kcnYuaCBiL2RyaXZlcnMv
Z3B1L2RybS91ZGwvdWRsX2Rydi5oDQo+IGluZGV4IGQ5NDM2ODRiNWJiYi4uYjRjYzdjYzU2
OGM3IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9kcnYuaA0KPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9kcnYuaA0KPiBAQCAtNzcsNyArNzcsNyBA
QCBzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqdWRsX2Nvbm5lY3Rvcl9pbml0KHN0cnVjdCBkcm1f
ZGV2aWNlICpkZXYpOw0KPiAgIHN0cnVjdCB1cmIgKnVkbF9nZXRfdXJiKHN0cnVjdCBkcm1f
ZGV2aWNlICpkZXYpOw0KPiAgIA0KPiAgIGludCB1ZGxfc3VibWl0X3VyYihzdHJ1Y3QgZHJt
X2RldmljZSAqZGV2LCBzdHJ1Y3QgdXJiICp1cmIsIHNpemVfdCBsZW4pOw0KPiAtaW50IHVk
bF9zeW5jX3BlbmRpbmdfdXJicyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KTsNCj4gK3ZvaWQg
dWRsX3N5bmNfcGVuZGluZ191cmJzKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpOw0KPiAgIHZv
aWQgdWRsX3VyYl9jb21wbGV0aW9uKHN0cnVjdCB1cmIgKnVyYik7DQo+ICAgDQo+ICAgaW50
IHVkbF9pbml0KHN0cnVjdCB1ZGxfZGV2aWNlICp1ZGwpOw0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3VkbC91ZGxfbWFpbi5jIGIvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxf
bWFpbi5jDQo+IGluZGV4IDgwOGE1YWI1ZTE0ZS4uNDQyMDgwZmExMDYxIDEwMDY0NA0KPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9tYWluLmMNCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL3VkbC91ZGxfbWFpbi5jDQo+IEBAIC0yOTAsMTAgKzI5MCw5IEBAIGludCB1ZGxf
c3VibWl0X3VyYihzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBzdHJ1Y3QgdXJiICp1cmIsIHNp
emVfdCBsZW4pDQo+ICAgfQ0KPiAgIA0KPiAgIC8qIHdhaXQgdW50aWwgYWxsIHBlbmRpbmcg
VVJCcyBoYXZlIGJlZW4gcHJvY2Vzc2VkICovDQo+IC1pbnQgdWRsX3N5bmNfcGVuZGluZ191
cmJzKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpDQo+ICt2b2lkIHVkbF9zeW5jX3BlbmRpbmdf
dXJicyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQ0KPiAgIHsNCj4gICAJc3RydWN0IHVkbF9k
ZXZpY2UgKnVkbCA9IHRvX3VkbChkZXYpOw0KPiAtCWludCByZXQgPSAwOw0KPiAgIA0KPiAg
IAlzcGluX2xvY2tfaXJxKCZ1ZGwtPnVyYnMubG9jayk7DQo+ICAgCS8qIDIgc2Vjb25kcyBh
cyBhIHNhbmUgdGltZW91dCAqLw0KPiBAQCAtMzAxLDkgKzMwMCw4IEBAIGludCB1ZGxfc3lu
Y19wZW5kaW5nX3VyYnMoc3RydWN0IGRybV9kZXZpY2UgKmRldikNCj4gICAJCQkJCSB1ZGwt
PnVyYnMuYXZhaWxhYmxlID09IHVkbC0+dXJicy5jb3VudCwNCj4gICAJCQkJCSB1ZGwtPnVy
YnMubG9jaywNCj4gICAJCQkJCSBtc2Vjc190b19qaWZmaWVzKDIwMDApKSkNCj4gLQkJcmV0
ID0gLUVUSU1FRE9VVDsNCj4gKwkJZHJtX2VycihkZXYsICJUaW1lb3V0IGZvciBzeW5jaW5n
IHBlbmRpbmcgVVJCc1xuIik7DQo+ICAgCXNwaW5fdW5sb2NrX2lycSgmdWRsLT51cmJzLmxv
Y2spOw0KPiAtCXJldHVybiByZXQ7DQo+ICAgfQ0KPiAgIA0KPiAgIGludCB1ZGxfaW5pdChz
dHJ1Y3QgdWRsX2RldmljZSAqdWRsKQ0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3VkbC91ZGxfbW9kZXNldC5jIGIvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfbW9kZXNldC5j
DQo+IGluZGV4IDk4OTZjMTZjNzRmNS4uYzUwNmZmZjhmMGM0IDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9tb2Rlc2V0LmMNCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3VkbC91ZGxfbW9kZXNldC5jDQo+IEBAIC0zODMsOCArMzgzLDYgQEAgdWRsX3NpbXBs
ZV9kaXNwbGF5X3BpcGVfZGlzYWJsZShzdHJ1Y3QgZHJtX3NpbXBsZV9kaXNwbGF5X3BpcGUg
KnBpcGUpDQo+ICAgCWJ1ZiA9IHVkbF9kdW1teV9yZW5kZXIoYnVmKTsNCj4gICANCj4gICAJ
dWRsX3N1Ym1pdF91cmIoZGV2LCB1cmIsIGJ1ZiAtIChjaGFyICopdXJiLT50cmFuc2Zlcl9i
dWZmZXIpOw0KPiAtDQo+IC0JdWRsX3N5bmNfcGVuZGluZ191cmJzKGRldik7DQo+ICAgfQ0K
PiAgIA0KPiAgIHN0YXRpYyB2b2lkDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBo
aWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkg
R21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2
ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------U2x83S9QmW0V2D7a7GHadken--

--------------xAzix0aZwShacW15M00GqG08
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMYSW4FAwAAAAAACgkQlh/E3EQov+Dd
XBAAlIRbxkQqU0nCslk4qFblynqSValitIE5CcRw+deDThnGrJoxsXSbLE/GQprMs7rbXgtqq+pJ
Z4y6mXb86fyGC+js89LB1EGGaIYAYxQgJ3nNKUfa9ooIQpG3W3cqK09NvuAoDmFlbcEU9t6dX1u9
/nBT407XEOuBhPx0LfRkkSkTNBe/Uq5Pgz2AUQ8wdhjB2FcIyvnAMsCAhJfPRZvKvp8l7a0bwP/J
kmwUHTnuMf7YwOgufbP8jiLLUDdMhbgj+9xB5xSCYKxlNHgaJjBFn6bHuLSRBir670DE45JzuXAd
pk30wezNrfIGuUVl4EV/33vTN/ITefgDXGt1j1/JDFF7E0bydseb+RYMEMrCeAjFP8RqRpFshygU
4V1ONCMirQGTykJNU/ybr4vQ4z3hkOjfai6xVb/8x8MEpRkDMO7wiJZT1lhVqj8NSa9q1CUfg8iO
Yr/lr/owMYxClJR1/hkK8TQg9zwm9GdVcoyqCDPJVrJ1I8TUPZjyD8+ImFbw13gTxBOrHKQoDHy9
BmXXJz8MG5tHQ7bxPku4XX6vrmoj6vy9h4AWZoe6kfd9jDaOhMQzWzJx63ATOOf7OhTBX9qrhJxq
HYA40BNEahYa3EGabFX+45P+K4Bq/XASo81Xm6mTS6xSrxRrrxST8URWbIL6iGVFGBrtgKosbmOZ
ccY=
=CcbM
-----END PGP SIGNATURE-----

--------------xAzix0aZwShacW15M00GqG08--
