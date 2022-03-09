Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 296424D2ADC
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 09:47:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13D1910E513;
	Wed,  9 Mar 2022 08:47:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 703BB10E3DD
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 08:47:54 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0D9691F380;
 Wed,  9 Mar 2022 08:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1646815673; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4ElTW9pniYoJP00RxKAU8MC6TdS30Hp5dXv21boBf54=;
 b=W9hVKf7bhoDdG9hELp13DMZCaKqcymyfWD8r0IHm7ykolWw4ftwWnGr9JDd2wGK26zDTiC
 dVoGwFpCF44dBzwQ1HW5bCj2mQ0KjztV6kHoKjCNK0UMvcSH58pEr5qXXlolKDT0HPHK3F
 CTy2EvTudqkwfTIQcBsQ4WYSILA4cO4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1646815673;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4ElTW9pniYoJP00RxKAU8MC6TdS30Hp5dXv21boBf54=;
 b=0Cs1hbWuqQzQug55TnKrTbGtnsb2zTP6M1oYORwdvldsaOVDDoMFHzDzn3si2DvSJfwDOC
 dq0zdohMFnSS1wAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D13FE13B71;
 Wed,  9 Mar 2022 08:47:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gW/6MbhpKGLNDwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 09 Mar 2022 08:47:52 +0000
Message-ID: <22b9e772-8823-0af1-037a-621844e7c810@suse.de>
Date: Wed, 9 Mar 2022 09:47:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 8/9] drm/gem-shmem: Implement fbdev dumb buffer and mmap
 helpers
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 deller@gmx.de
References: <20220303205839.28484-1-tzimmermann@suse.de>
 <20220303205839.28484-9-tzimmermann@suse.de>
 <265aba53-ff78-e1ab-8596-e2226dff23f0@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <265aba53-ff78-e1ab-8596-e2226dff23f0@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------bzHGrlHXINkAn0VIC18a7rLV"
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
--------------bzHGrlHXINkAn0VIC18a7rLV
Content-Type: multipart/mixed; boundary="------------RvrPgLBprbxNo0I0gdGs4wk7";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 deller@gmx.de
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Message-ID: <22b9e772-8823-0af1-037a-621844e7c810@suse.de>
Subject: Re: [PATCH 8/9] drm/gem-shmem: Implement fbdev dumb buffer and mmap
 helpers
References: <20220303205839.28484-1-tzimmermann@suse.de>
 <20220303205839.28484-9-tzimmermann@suse.de>
 <265aba53-ff78-e1ab-8596-e2226dff23f0@redhat.com>
In-Reply-To: <265aba53-ff78-e1ab-8596-e2226dff23f0@redhat.com>

--------------RvrPgLBprbxNo0I0gdGs4wk7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDguMDMuMjIgdW0gMjA6Mjkgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IE9uIDMvMy8yMiAyMTo1OCwgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6DQo+
PiBJbXBsZW1lbnQgc3RydWN0IGRybV9kcml2ZXIuZHVtYl9jcmVhdGVfZmJkZXYgZm9yIEdF
TSBTSE1FTS4gVGhlDQo+PiBjcmVhdGVkIGJ1ZmZlciBvYmplY3QgcmV0dXJuZWQgYnkgdGhp
cyBmdW5jdGlvbiBpbXBsZW1lbnRzIGRlZmVycmVkDQo+PiBJL08gZm9yIGl0cyBtbWFwIG9w
ZXJhdGlvbi4NCj4+DQo+PiBBZGQgdGhpcyBmZWF0dXJlIHRvIGEgbnVtYmVyIG9mIGRyaXZl
cnMgdGhhdCB1c2UgR0VNIFNITUVNIGhlbHBlcnMNCj4+IGFzIHNoYWRvdyBwbGFuZXMgb3Zl
ciB0aGVpciByZWd1bGFyIHZpZGVvIG1lbW9yeS4gVGhlIG5ldyBtYWNybw0KPj4gRFJNX0dF
TV9TSE1FTV9EUklWRVJfT1BTX1dJVEhfU0hBRE9XX1BMQU5FUyBzZXRzIHRoZSByZWd1bGFy
IEdFTQ0KPj4gZnVuY3Rpb25zIGFuZCBkdW1iX2NyZWF0ZV9mYmRldiBpbiBzdHJ1Y3QgZHJt
X2RyaXZlci4gRmJkZXYgZW11bGF0aW9uDQo+PiBvbiB0aGVzZSBkcml2ZXJzIHdpbGwgbm93
IG1tYXAgdGhlIEdFTSBTSE1FTSBwYWdlcyBkaXJlY3RseSB3aXRoDQo+PiBkZWZlcnJlZCBJ
L08gd2l0aG91dCBhbiBpbnRlcm1lZGlhdGUgc2hhZG93IGJ1ZmZlci4NCj4+DQo+PiBTaWdu
ZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4+
IC0tLQ0KPiANCj4gW3NuaXBdDQo+IA0KPj4gQEAgLTQ5LDggKzUwLDIwIEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgZHJtX2dlbV9vYmplY3RfZnVuY3MgZHJtX2dlbV9zaG1lbV9mdW5jcyA9
IHsNCj4+ICAgCS52bV9vcHMgPSAmZHJtX2dlbV9zaG1lbV92bV9vcHMsDQo+PiAgIH07DQo+
PiAgIA0KPj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2dlbV9vYmplY3RfZnVuY3MgZHJt
X2dlbV9zaG1lbV9mdW5jc19mYmRldiA9IHsNCj4+ICsJLmZyZWUgPSBkcm1fZ2VtX3NobWVt
X29iamVjdF9mcmVlLA0KPj4gKwkucHJpbnRfaW5mbyA9IGRybV9nZW1fc2htZW1fb2JqZWN0
X3ByaW50X2luZm8sDQo+PiArCS5waW4gPSBkcm1fZ2VtX3NobWVtX29iamVjdF9waW4sDQo+
PiArCS51bnBpbiA9IGRybV9nZW1fc2htZW1fb2JqZWN0X3VucGluLA0KPj4gKwkuZ2V0X3Nn
X3RhYmxlID0gZHJtX2dlbV9zaG1lbV9vYmplY3RfZ2V0X3NnX3RhYmxlLA0KPj4gKwkudm1h
cCA9IGRybV9nZW1fc2htZW1fb2JqZWN0X3ZtYXAsDQo+PiArCS52dW5tYXAgPSBkcm1fZ2Vt
X3NobWVtX29iamVjdF92dW5tYXAsDQo+PiArCS5tbWFwID0gZHJtX2dlbV9zaG1lbV9vYmpl
Y3RfbW1hcF9mYmRldiwNCj4+ICsJLnZtX29wcyA9ICZkcm1fZ2VtX3NobWVtX3ZtX29wc19m
YmRldiwNCj4gDQo+IFRoZSBkcm1fZ2VtX3NobWVtX2Z1bmNzX2ZiZGV2IGlzIHRoZSBzYW1l
IHRoYW4gZHJtX2dlbV9zaG1lbV9mdW5jcyBidXQNCj4gLm1tYXAgYW5kIC52bV9vcHMgY2Fs
bGJhY2tzLiBNYXliZSBhZGRpbmcgYSBtYWNybyB0byBkZWNsYXJlIHRoZXNlIHR3bw0KPiBz
dHJ1Y3QgZHJtX2dlbV9vYmplY3RfZnVuY3MgY291bGQgbWFrZSBlYXNpZXIgdG8gbWFpbnRh
aW4gaXQgbG9uZyB0ZXJtID8NCg0KSSBzZWUgeW91IHBvaW50LCBidXQgSSdtIHVuZGVjaWRl
ZCBhYm91dCB0aGlzLiBTdWNoIG1hY3JvcyBhbHNvIGFkZCBzb21lIA0KYW1vdW50IG9mIG9i
ZnVzY2F0aW9uLiBJJ20gbm90IHN1cmUgaWYgaXQncyB3b3J0aCBpdCBmb3IgYW4gaW50ZXJu
YWwgDQpjb25zdGFudC4gQW5kIHNpbmNlIHRoZSBmYmRldiBidWZmZXIgaXMgbmV2ZXIgZXhw
b3J0ZWQsIHdlIGNvdWxkIHJlbW92ZSANCnNvbWUgb2YgdGhlIGNhbGxiYWNrcy4gQUZBSUNU
IHdlIG5ldmVyIGNhbGwgcGluLCB1bnBpbiBvciBnZXRfc2dfdGFibGUuDQoNCkJlc3QgcmVn
YXJkcw0KVGhvbWFzDQoNCj4gDQo+PiArfTsNCj4+ICsNCj4+ICAgc3RhdGljIHN0cnVjdCBk
cm1fZ2VtX3NobWVtX29iamVjdCAqDQo+PiAtX19kcm1fZ2VtX3NobWVtX2NyZWF0ZShzdHJ1
Y3QgZHJtX2RldmljZSAqZGV2LCBzaXplX3Qgc2l6ZSwgYm9vbCBwcml2YXRlKQ0KPj4gK19f
ZHJtX2dlbV9zaG1lbV9jcmVhdGUoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgc2l6ZV90IHNp
emUsIGJvb2wgcHJpdmF0ZSwgYm9vbCBmYmRldikNCj4+ICAgew0KPj4gICAJc3RydWN0IGRy
bV9nZW1fc2htZW1fb2JqZWN0ICpzaG1lbTsNCj4+ICAgCXN0cnVjdCBkcm1fZ2VtX29iamVj
dCAqb2JqOw0KPj4gQEAgLTcwLDggKzgzLDEyIEBAIF9fZHJtX2dlbV9zaG1lbV9jcmVhdGUo
c3RydWN0IGRybV9kZXZpY2UgKmRldiwgc2l6ZV90IHNpemUsIGJvb2wgcHJpdmF0ZSkNCj4+
ICAgCQlvYmogPSAmc2htZW0tPmJhc2U7DQo+PiAgIAl9DQo+PiAgIA0KPj4gLQlpZiAoIW9i
ai0+ZnVuY3MpDQo+PiAtCQlvYmotPmZ1bmNzID0gJmRybV9nZW1fc2htZW1fZnVuY3M7DQo+
PiArCWlmICghb2JqLT5mdW5jcykgew0KPj4gKwkJaWYgKGZiZGV2KQ0KPiANCj4gU2FtZSBx
dWVzdGlvbiB0aGFuIGluIHBhdGNoICM2LCBtYXliZQ0KPiANCj4gICAgICAgICAgICAgICAg
ICBpZiAoZGVmaW5lZChDT05GSUdfRFJNX0ZCREVWX0VNVUxBVElPTikgJiYgZmJkZXYpID8N
Cj4gDQo+IFtzbmlwXQ0KPiANCj4+ICsgKi8NCj4+ICtpbnQgZHJtX2dlbV9zaG1lbV9kdW1i
X2NyZWF0ZV9mYmRldihzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGUsIHN0cnVjdCBkcm1fZGV2aWNl
ICpkZXYsDQo+PiArCQkJCSAgICBzdHJ1Y3QgZHJtX21vZGVfY3JlYXRlX2R1bWIgKmFyZ3Mp
DQo+PiArew0KPj4gKyNpZiBkZWZpbmVkKENPTkZJR19EUk1fRkJERVZfRU1VTEFUSU9OKQ0K
Pj4gKwlyZXR1cm4gX19kcm1fZ2VtX3NobWVtX2R1bWJfY3JlYXRlKGZpbGUsIGRldiwgdHJ1
ZSwgYXJncyk7DQo+PiArI2Vsc2UNCj4+ICsJcmV0dXJuIC1FTk9TWVM7DQo+PiArI2VuZGlm
DQo+PiArfQ0KPiANCj4gSSBiZWxpZXZlIHRoZSBjb3JyZWN0IGVycm5vIGNvZGUgaGVyZSBz
aG91bGQgYmUgLUVOT1RTVVBQLg0KPiANCj4gW3NuaXBdDQo+IA0KPj4gKwkvKiBXZSBkb24n
dCB1c2Ugdm1mLT5wZ29mZiBzaW5jZSB0aGF0IGhhcyB0aGUgZmFrZSBvZmZzZXQgKi8NCj4+
ICsJcGFnZV9vZmZzZXQgPSAodm1mLT5hZGRyZXNzIC0gdm1hLT52bV9zdGFydCkgPj4gUEFH
RV9TSElGVDsNCj4gDQo+IEkgc2VlIHRoaXMgKHZtZi0+YWRkcmVzcyAtIHZtYS0+dm1fc3Rh
cnQpIGNhbGN1bGF0aW9uIGluIG1hbnkgcGxhY2VzIG9mDQo+IHRoaXMgc2VyaWVzLiBNYXli
ZSB3ZSBjb3VsZCBhZGQgYSBtYWNybyB0byBjYWxjdWxhdGUgdGhlIG9mZnNldCBpbnN0ZWFk
ID8NCj4gDQo+IFJldmlld2VkLWJ5OiBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXMgPGphdmll
cm1AcmVkaGF0LmNvbT4NCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNz
IERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21i
SA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5
LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------RvrPgLBprbxNo0I0gdGs4wk7--

--------------bzHGrlHXINkAn0VIC18a7rLV
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmIoabgFAwAAAAAACgkQlh/E3EQov+Ar
jhAAi9+llEWHbcIKPbYboHqNMajEACyY58zOY9hQJMRzuNZORh+eZfwTzktfwp8IsuFjR5/BqcDa
Gt1L7NoWnWKkaIQntBDq3GS2swhgmZFAmYa7kOaQOt+CJJLnttYzraoXkTXq+auOgON2F1Px2EsU
2es0lGBm3Gqw54VwP+n3Ufqbgk8vWvC2pZqugvA+Eym0QNLX92vxfl1K4ynUz7UWPQkrAuIrwzfn
dMCDRym6v1+EmNAIdvZZ5tNwn9tsYSAyQcUImcB6+sOR4kkn08Dy7kJd95MpK/NEY6dfXDFpzQNa
ocpmWDToNQwDcsxK9OPaVYRqgmg2iJdE4qRjW5khGNBS1RF7qWUPWtC4YXAhUxKrGJy4lFCNVhqN
iAqRGEZodYAKaQ4uBfM+4YiQ95iI0fgCrz1MRvlvyjuOYI62RZ+gcjbNDmzV/BxvC1Wi3D4ghhmk
xRgYtdbVJllz1bXLG5p8U/sN1xgo3QH6mO41p+vyo/oqTa53ZmCIUlObJRu71mKNGMkaVwwDkU5A
qoHWXW3RWW50NsVzkmx9ruZfJV7NWlAgTKeXTW4ttwEQSNnoRsngzG2G4LmUNLQRQaEl7OWy+1B7
8wiMAyPQ+xfniTTXgBPTfj7TgECZ/FdBPxKa5N8PH9ZhJcb0j1gpIYCxJnwKwyiu0XbRtqrF2Oy0
uGk=
=/uB6
-----END PGP SIGNATURE-----

--------------bzHGrlHXINkAn0VIC18a7rLV--
