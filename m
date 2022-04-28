Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCCC512ED0
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 10:42:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25A6610E90B;
	Thu, 28 Apr 2022 08:42:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BD6C10EA27
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Apr 2022 08:42:25 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1994E1F88A;
 Thu, 28 Apr 2022 08:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1651135344; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QKyt3hzwOwKKk+NZpkV1st+qYwiK8MEXnBg8P2xnW8o=;
 b=YyMFFQWJm/gFrFDoVKWr4lPpvvjHZ0AoHdymIIILQ2XigKVbXXV/3gRCEouj1ZvLA9+M/X
 0pg6Wo6lgaPqfH3IZ40a+yrgyPG4psO8b1BmjGsnLsrjeFQkCgGIjED6xnC4m0vz7b6Tq2
 VDRXLgBvLUUcOJOS7/nwsRxKpd1A6t0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1651135344;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QKyt3hzwOwKKk+NZpkV1st+qYwiK8MEXnBg8P2xnW8o=;
 b=b4WTeFAw6WfKJdbQndobrlWHHG3AiYNmUO+78YP1CtMrHvebSiC6kituXqvNTLmqcq3I9z
 Y9eOFZRQsZo7htAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E2DE313491;
 Thu, 28 Apr 2022 08:42:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Uv9tNm9TamIaNQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 28 Apr 2022 08:42:23 +0000
Message-ID: <c2ce3927-44ac-45cb-9ced-cfd3f9a184a6@suse.de>
Date: Thu, 28 Apr 2022 10:42:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v3] drm/display: Select DP helper for DRM_DP_AUX_CHARDEV
 and DRM_DP_CEC
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>
References: <20220428082244.390859-1-javierm@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220428082244.390859-1-javierm@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------sokI09Ycnnugt1q0yepDUP8e"
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------sokI09Ycnnugt1q0yepDUP8e
Content-Type: multipart/mixed; boundary="------------n80VA0nqnQm7LsbIbIjcfTHz";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Message-ID: <c2ce3927-44ac-45cb-9ced-cfd3f9a184a6@suse.de>
Subject: Re: [PATCH v3] drm/display: Select DP helper for DRM_DP_AUX_CHARDEV
 and DRM_DP_CEC
References: <20220428082244.390859-1-javierm@redhat.com>
In-Reply-To: <20220428082244.390859-1-javierm@redhat.com>

--------------n80VA0nqnQm7LsbIbIjcfTHz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjguMDQuMjIgdW0gMTA6MjIgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IFRoZSBEUk1fRFBfQVVYX0NIQVJERVYgYW5kIERSTV9EUF9DRUMgS2NvbmZp
ZyBzeW1ib2xzIGVuYWJsZSBjb2RlIHRoYXQgdXNlDQo+IERQIGhlbHBlciBmdW5jdGlvbnMs
IHRoYXQgYXJlIG9ubHkgcHJlc2VudCBpZiBDT05GSUdfRFJNX0RJU1BMQVlfRFBfSEVMUEVS
DQo+IGlzIGFsc28gZW5hYmxlZC4NCj4gDQo+IEJ1dCB0aGVzZSBkb24ndCBzZWxlY3QgdGhl
IERSTV9ESVNQTEFZX0RQX0hFTFBFUiBzeW1ib2wsIG1lYW5pbmcgdGhhdCBpdA0KPiBpcyBw
b3NzaWJsZSB0byBlbmFibGUgYW55IG9mIHRoZW0gd2l0aG91dCBDT05GSUdfRFJNX0RJU1BM
QVlfRFBfSEVMUEVSLg0KPiANCj4gVGhhdCB3aWxsIGxlYWQgdG8gdGhlIGZvbGxvd2luZyBs
aW5raW5nIGVycm9ycyB3aXRoIHRoZSBtZW50aW9uZWQgY29uZmlnOg0KPiANCj4gICAgTEQg
ICAgICB2bWxpbnV4Lm8NCj4gICAgTU9EUE9TVCB2bWxpbnV4LnN5bXZlcnMNCj4gICAgTU9E
SU5GTyBtb2R1bGVzLmJ1aWx0aW4ubW9kaW5mbw0KPiAgICBHRU4gICAgIG1vZHVsZXMuYnVp
bHRpbg0KPiAgICBMRCAgICAgIC50bXBfdm1saW51eC5rYWxsc3ltczENCj4gICAgS1NZTVMg
ICAudG1wX3ZtbGludXgua2FsbHN5bXMxLlMNCj4gICAgQVMgICAgICAudG1wX3ZtbGludXgu
a2FsbHN5bXMxLlMNCj4gICAgTEQgICAgICAudG1wX3ZtbGludXgua2FsbHN5bXMyDQo+ICAg
IEtTWU1TICAgLnRtcF92bWxpbnV4LmthbGxzeW1zMi5TDQo+ICAgIEFTICAgICAgLnRtcF92
bWxpbnV4LmthbGxzeW1zMi5TDQo+ICAgIExEICAgICAgdm1saW51eA0KPiAgICBTWVNNQVAg
IFN5c3RlbS5tYXANCj4gICAgU09SVFRBQiB2bWxpbnV4DQo+ICAgIE9CSkNPUFkgYXJjaC9h
cm02NC9ib290L0ltYWdlDQo+ICAgIE1PRFBPU1QgbW9kdWxlcy1vbmx5LnN5bXZlcnMNCj4g
RVJST1I6IG1vZHBvc3Q6ICJkcm1fZHBfZHBjZF93cml0ZSIgW2RyaXZlcnMvZ3B1L2RybS9k
aXNwbGF5L2RybV9kaXNwbGF5X2hlbHBlci5rb10gdW5kZWZpbmVkIQ0KPiBFUlJPUjogbW9k
cG9zdDogImRybV9kcF9yZWFkX2Rlc2MiIFtkcml2ZXJzL2dwdS9kcm0vZGlzcGxheS9kcm1f
ZGlzcGxheV9oZWxwZXIua29dIHVuZGVmaW5lZCENCj4gRVJST1I6IG1vZHBvc3Q6ICJkcm1f
ZHBfZHBjZF9yZWFkIiBbZHJpdmVycy9ncHUvZHJtL2Rpc3BsYXkvZHJtX2Rpc3BsYXlfaGVs
cGVyLmtvXSB1bmRlZmluZWQhDQo+IG1ha2VbMV06ICoqKiBbc2NyaXB0cy9NYWtlZmlsZS5t
b2Rwb3N0OjEzNDogbW9kdWxlcy1vbmx5LnN5bXZlcnNdIEVycm9yIDENCj4gbWFrZVsxXTog
KioqIERlbGV0aW5nIGZpbGUgJ21vZHVsZXMtb25seS5zeW12ZXJzJw0KPiBtYWtlOiAqKiog
W01ha2VmaWxlOjE3NDk6IG1vZHVsZXNdIEVycm9yIDINCj4gDQo+IEJlc2lkZXMgbWFraW5n
IHRoZXNlIHN5bWJvbHMgdG8gc2VsZWN0IENPTkZJR19EUk1fRElTUExBWV9EUF9IRUxQRVIs
IG1ha2UNCj4gdGhlbSB0byBkZXBlbmQgb24gRFJNX0RJU1BMQVlfSEVMUEVSLCBzaW5jZSBj
YW4ndCBiZSBlbmFibGVkIHdpdGhvdXQgaXQuDQo+IA0KPiBOb3RlOiBJdCBzZWVtcyB0aGlz
IGhhcyBiZWVuIGFuIGlzc3VlIGZvciBhIGxvbmcgdGltZSBidXQgd2FzIG1hZGUgZWFzaWVy
DQo+IHRvIHJlcHJvZHVjZSBhZnRlciB0aGUgY29tbWl0IDFlMGY2NjQyMGIxMyAoImRybS9k
aXNwbGF5OiBJbnRyb2R1Y2UgYSBEUk0NCj4gZGlzcGxheS1oZWxwZXIgbW9kdWxlIikuIEFk
ZGluZyBhIEZpeGVzOiB0YWcganVzdCB0byBtYWtlIHN1cmUgdGhhdCB0aGlzDQo+IGZpeCB3
aWxsIGJlIHBpY2tlZCBmb3Igc3RhYmxlIG9uY2UgdGhlIG1lbnRpb25lZCBjaGFuZ2UgYWxz
byBsYW5kcyB0aGVyZS4NCj4gDQo+IEZpeGVzOiAxZTBmNjY0MjBiMTMgKCJkcm0vZGlzcGxh
eTogSW50cm9kdWNlIGEgRFJNIGRpc3BsYXktaGVscGVyIG1vZHVsZSIpDQo+IFNpZ25lZC1v
ZmYtYnk6IEphdmllciBNYXJ0aW5leiBDYW5pbGxhcyA8amF2aWVybUByZWRoYXQuY29tPg0K
PiAtLS0NCj4gDQo+IENoYW5nZXMgaW4gdjM6DQo+IC0gQWxzbyBtYWtlIERSTV9EUF9BVVhf
Q0hBUkRFViBhbmQgRFJNX0RQX0NFQyBkZXBlbmQgb24gRFJNX0RJU1BMQVlfSEVMUEVSDQo+
ICAgIChUaG9tYXMgWmltbWVybWFubikuDQo+IA0KPiBDaGFuZ2VzIGluIHYyOg0KPiAtIEV4
cGxhaW4gYmV0dGVyIHRoZSBpc3N1ZSBpbiB0aGUgY2hhbmdlIGRlc2NyaXB0aW9uLg0KPiAt
IE9ubHkgc2VsZWN0IERSTV9ESVNQTEFZX0RQX0hFTFBFUiBhbmQgbm90IERSTV9ESVNQTEFZ
X0hFTFBFUi4NCj4gDQo+ICAgZHJpdmVycy9ncHUvZHJtL2Rpc3BsYXkvS2NvbmZpZyB8IDYg
KysrKy0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZGlzcGxheS9LY29u
ZmlnIGIvZHJpdmVycy9ncHUvZHJtL2Rpc3BsYXkvS2NvbmZpZw0KPiBpbmRleCBmODRmMWIw
Y2QyM2YuLjFiNmU2YWYzNzU0NiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Rp
c3BsYXkvS2NvbmZpZw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZGlzcGxheS9LY29uZmln
DQo+IEBAIC0zMSw3ICszMSw4IEBAIGNvbmZpZyBEUk1fRElTUExBWV9IRE1JX0hFTFBFUg0K
PiAgIA0KPiAgIGNvbmZpZyBEUk1fRFBfQVVYX0NIQVJERVYNCj4gICAJYm9vbCAiRFJNIERQ
IEFVWCBJbnRlcmZhY2UiDQo+IC0JZGVwZW5kcyBvbiBEUk0NCj4gKwlkZXBlbmRzIG9uIERS
TSAmJiBEUk1fRElTUExBWV9IRUxQRVINCj4gKwlzZWxlY3QgRFJNX0RJU1BMQVlfRFBfSEVM
UEVSDQoNCkknZCBiZSBPSyB3aXRoIHRoYXQsIGJ1dCBJJ20gc3RpbGwgd29uZGVyaW5nIHdo
eSB5b3UncmUgbm90IG1ha2luZyBpdCANCmRlcGVuZCBvbiBEUk1fRElTUExBWV9EUF9IRUxQ
RVIuICBJZiBhIGNvbmZpZyBvbmx5IGVuYWJsZXMgSERNSSAod2l0aG91dCANCkRQKSwgdGhl
c2Ugb3B0aW9ucyB3b3VsZCBzdGlsbCBzaG93IHVwLg0KDQoNCj4gICAJaGVscA0KPiAgIAkg
IENob29zZSB0aGlzIG9wdGlvbiB0byBlbmFibGUgYSAvZGV2L2RybV9kcF9hdXhOIG5vZGUg
dGhhdCBhbGxvd3MgdG8NCj4gICAJICByZWFkIGFuZCB3cml0ZSB2YWx1ZXMgdG8gYXJiaXRy
YXJ5IERQQ0QgcmVnaXN0ZXJzIG9uIHRoZSBEUCBhdXgNCj4gQEAgLTM5LDcgKzQwLDggQEAg
Y29uZmlnIERSTV9EUF9BVVhfQ0hBUkRFVg0KPiAgIA0KPiAgIGNvbmZpZyBEUk1fRFBfQ0VD
DQo+ICAgCWJvb2wgIkVuYWJsZSBEaXNwbGF5UG9ydCBDRUMtVHVubmVsaW5nLW92ZXItQVVY
IEhETUkgc3VwcG9ydCINCj4gLQlkZXBlbmRzIG9uIERSTQ0KPiArCWRlcGVuZHMgb24gRFJN
ICYmIERSTV9ESVNQTEFZX0hFTFBFUg0KPiArCXNlbGVjdCBEUk1fRElTUExBWV9EUF9IRUxQ
RVINCg0KU2FtZSBoZXJlLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+ICAgCXNlbGVj
dCBDRUNfQ09SRQ0KPiAgIAloZWxwDQo+ICAgCSAgQ2hvb3NlIHRoaXMgb3B0aW9uIGlmIHlv
dSB3YW50IHRvIGVuYWJsZSBIRE1JIENFQyBzdXBwb3J0IGZvcg0KDQotLSANClRob21hcyBa
aW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNv
bHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywg
R2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6
IEl2byBUb3Rldg0K

--------------n80VA0nqnQm7LsbIbIjcfTHz--

--------------sokI09Ycnnugt1q0yepDUP8e
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJqU28FAwAAAAAACgkQlh/E3EQov+Dn
EBAAmv4y6RJTciNQYgXVi+eGypmEQ4q2s6tcEuhFtCtJZUJKxINMAk8xEvIKyEfBJjQLl9zAWmfW
9oQEf7ujFtjBOefwkf36rvYlF2YZY9x0m8Ok9OiudwCAAgyeovXxlbaEz7/Iezx8ZOAnXQh1xtne
uXkqfqN1pD2+uPmAymEELTU+04KGp8zZyElx+OWCSQ5BIegIZiUHspJJjKmn4dYx1k8nITZFYGUv
TiEMOBMrYz7aQnwGjYjuDK9Nesi4UokGR3ZNo7oCjUTwPRaG6jc/3+Qc9uWP5mdC8nkOLJDAH7kR
P7K7HXUbKsSpD2ehEl2n7031aRj8xWil755UOOGCQc0odSNP5jHVeih9ZK3yCFDuifJhomZDq+0Y
9QQdXVdS3U2mBb+sUe2V0C2sj6Wf9R6KpnFLqlj+HJ00nNVfEjs8peUexjArvfv3q+nJ8xiUP/2g
lmhgK3fTf29VZe4Tm8KZGOUwplx1isnuSZ6jA42/k0Kzw9r2teWO8JgfRIJGpS8KzqlAekNFCkc8
wrEX0c6/VFM2mNTO67O4UqyGKOpKXFvE8rgD4c+cjlZ0M+DUT8qdDi+t1SBykdKdDeRnLnOZ8Rpw
95ai6iE7a9B5BSP/NVkREJCXUwCI5rtlfw7jLs3dbOyNmHHCkAfJ5X+gLYeaKsOgT9CQRe4KMZV+
pi0=
=dkpi
-----END PGP SIGNATURE-----

--------------sokI09Ycnnugt1q0yepDUP8e--
