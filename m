Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1D0691C9A
	for <lists+dri-devel@lfdr.de>; Fri, 10 Feb 2023 11:19:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 738B810E13D;
	Fri, 10 Feb 2023 10:19:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0127610E13D
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 10:19:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B563566FA8;
 Fri, 10 Feb 2023 10:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1676024384; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mAHsfS8Z/2efxR8PefWnPogRnQUFENeqNVgqi+x+j4A=;
 b=NJ3Rr8ov+B41f4O0+y0owjAWKxFlynb6YXvC1W7/faV4DJ/QW6tpFniP3/VGPUbeKoLdLN
 xXI11JLtvqxXHdHNJzhZMC+6adQQf7M6cZCFSCovQBmnsq7+tdxGdc5I0s0Rm/KfrUdcLY
 /gf0esJQNzFFIbFFQEEYt8zGwwQgDeI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1676024384;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mAHsfS8Z/2efxR8PefWnPogRnQUFENeqNVgqi+x+j4A=;
 b=t6Fu/UVQPXy1WZjjpIEvkVRuxvKqMs1Aisi6v+jrbfwnnKJ9OnAeLKsHji3UgBvApzNaMU
 k4w2N00w+MiA5eAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9113F13206;
 Fri, 10 Feb 2023 10:19:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gitzIkAa5mNARQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 10 Feb 2023 10:19:44 +0000
Message-ID: <29d6430d-a975-bfbe-510e-ec1448b7174f@suse.de>
Date: Fri, 10 Feb 2023 11:19:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2] fbdev: Fix invalid page access after closing deferred
 I/O devices
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>, Helge Deller <deller@gmx.de>
References: <20230129082856.22113-1-tiwai@suse.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230129082856.22113-1-tiwai@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------gV6wR6wW4v5xsxaPPGWJjiHD"
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Patrik Jakobsson <pjakobsson@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------gV6wR6wW4v5xsxaPPGWJjiHD
Content-Type: multipart/mixed; boundary="------------nUv5mLHMcmVuy8ZfxOZr4zep";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Takashi Iwai <tiwai@suse.de>, Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Patrik Jakobsson <pjakobsson@suse.de>
Message-ID: <29d6430d-a975-bfbe-510e-ec1448b7174f@suse.de>
Subject: Re: [PATCH v2] fbdev: Fix invalid page access after closing deferred
 I/O devices
References: <20230129082856.22113-1-tiwai@suse.de>
In-Reply-To: <20230129082856.22113-1-tiwai@suse.de>

--------------nUv5mLHMcmVuy8ZfxOZr4zep
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

QWRkZWQgdG8gZHJtLW1pc2MtZml4ZXMuDQoNCkFtIDI5LjAxLjIzIHVtIDA5OjI4IHNjaHJp
ZWIgVGFrYXNoaSBJd2FpOg0KPiBXaGVuIGEgZmJkZXYgd2l0aCBkZWZlcnJlZCBJL08gaXMg
b25jZSBvcGVuZWQgYW5kIGNsb3NlZCwgdGhlIGRpcnR5DQo+IHBhZ2VzIHN0aWxsIHJlbWFp
biBxdWV1ZWQgaW4gdGhlIHBhZ2VyZWYgbGlzdCwgYW5kIGV2ZW50dWFsbHkgbGF0ZXINCj4g
dGhvc2UgbWF5IGJlIHByb2Nlc3NlZCBpbiB0aGUgZGVsYXllZCB3b3JrLiAgVGhpcyBtYXkg
bGVhZCB0byBhDQo+IGNvcnJ1cHRpb24gb2YgcGFnZXMsIGhpdHRpbmcgYW4gT29wcy4NCj4g
DQo+IFRoaXMgcGF0Y2ggbWFrZXMgc3VyZSB0byBjYW5jZWwgdGhlIGRlbGF5ZWQgd29yayBh
bmQgY2xlYW4gdXAgdGhlDQo+IHBhZ2VyZWYgbGlzdCBhdCBjbG9zaW5nIHRoZSBkZXZpY2Ug
Zm9yIGFkZHJlc3NpbmcgdGhlIGJ1Zy4gIEEgcGFydCBvZg0KPiB0aGUgY2xlYW51cCBjb2Rl
IGlzIGZhY3RvcmVkIG91dCBhcyBhIG5ldyBoZWxwZXIgZnVuY3Rpb24gdGhhdCBpcw0KPiBj
YWxsZWQgZnJvbSB0aGUgY29tbW9uIGZiX3JlbGVhc2UoKS4NCj4gDQo+IFJldmlld2VkLWJ5
OiBQYXRyaWsgSmFrb2Jzc29uIDxwYXRyaWsuci5qYWtvYnNzb25AZ21haWwuY29tPg0KPiBD
YzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+DQo+IFNpZ25lZC1vZmYtYnk6IFRha2FzaGkg
SXdhaSA8dGl3YWlAc3VzZS5kZT4NCj4gLS0tDQo+IHYxLT52MjogRml4IGJ1aWxkIGVycm9y
IHdpdGhvdXQgQ09ORklHX0ZCX0RFRkVSUkVEX0lPDQo+IA0KPiAgIGRyaXZlcnMvdmlkZW8v
ZmJkZXYvY29yZS9mYl9kZWZpby5jIHwgMTAgKysrKysrKysrLQ0KPiAgIGRyaXZlcnMvdmlk
ZW8vZmJkZXYvY29yZS9mYm1lbS5jICAgIHwgIDQgKysrKw0KPiAgIGluY2x1ZGUvbGludXgv
ZmIuaCAgICAgICAgICAgICAgICAgIHwgIDEgKw0KPiAgIDMgZmlsZXMgY2hhbmdlZCwgMTQg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvdmlkZW8vZmJkZXYvY29yZS9mYl9kZWZpby5jIGIvZHJpdmVycy92aWRlby9mYmRldi9j
b3JlL2ZiX2RlZmlvLmMNCj4gaW5kZXggYzczMDI1M2FiODVjLi41ODNjYmNmMDk0NDYgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYl9kZWZpby5jDQo+ICsr
KyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYl9kZWZpby5jDQo+IEBAIC0zMTMsNyAr
MzEzLDcgQEAgdm9pZCBmYl9kZWZlcnJlZF9pb19vcGVuKHN0cnVjdCBmYl9pbmZvICppbmZv
LA0KPiAgIH0NCj4gICBFWFBPUlRfU1lNQk9MX0dQTChmYl9kZWZlcnJlZF9pb19vcGVuKTsN
Cj4gICANCj4gLXZvaWQgZmJfZGVmZXJyZWRfaW9fY2xlYW51cChzdHJ1Y3QgZmJfaW5mbyAq
aW5mbykNCj4gK3ZvaWQgZmJfZGVmZXJyZWRfaW9fcmVsZWFzZShzdHJ1Y3QgZmJfaW5mbyAq
aW5mbykNCj4gICB7DQo+ICAgCXN0cnVjdCBmYl9kZWZlcnJlZF9pbyAqZmJkZWZpbyA9IGlu
Zm8tPmZiZGVmaW87DQo+ICAgCXN0cnVjdCBwYWdlICpwYWdlOw0KPiBAQCAtMzI3LDYgKzMy
NywxNCBAQCB2b2lkIGZiX2RlZmVycmVkX2lvX2NsZWFudXAoc3RydWN0IGZiX2luZm8gKmlu
Zm8pDQo+ICAgCQlwYWdlID0gZmJfZGVmZXJyZWRfaW9fcGFnZShpbmZvLCBpKTsNCj4gICAJ
CXBhZ2UtPm1hcHBpbmcgPSBOVUxMOw0KPiAgIAl9DQo+ICt9DQo+ICtFWFBPUlRfU1lNQk9M
X0dQTChmYl9kZWZlcnJlZF9pb19yZWxlYXNlKTsNCj4gKw0KPiArdm9pZCBmYl9kZWZlcnJl
ZF9pb19jbGVhbnVwKHN0cnVjdCBmYl9pbmZvICppbmZvKQ0KPiArew0KPiArCXN0cnVjdCBm
Yl9kZWZlcnJlZF9pbyAqZmJkZWZpbyA9IGluZm8tPmZiZGVmaW87DQo+ICsNCj4gKwlmYl9k
ZWZlcnJlZF9pb19yZWxlYXNlKGluZm8pOw0KPiAgIA0KPiAgIAlrdmZyZWUoaW5mby0+cGFn
ZXJlZnMpOw0KPiAgIAltdXRleF9kZXN0cm95KCZmYmRlZmlvLT5sb2NrKTsNCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYm1lbS5jIGIvZHJpdmVycy92aWRl
by9mYmRldi9jb3JlL2ZibWVtLmMNCj4gaW5kZXggM2E2Yzg0NThlYjhkLi5hYjM1NDVhMDBh
YmMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYm1lbS5jDQo+
ICsrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYm1lbS5jDQo+IEBAIC0xNDU0LDYg
KzE0NTQsMTAgQEAgX19yZWxlYXNlcygmaW5mby0+bG9jaykNCj4gICAJc3RydWN0IGZiX2lu
Zm8gKiBjb25zdCBpbmZvID0gZmlsZS0+cHJpdmF0ZV9kYXRhOw0KPiAgIA0KPiAgIAlsb2Nr
X2ZiX2luZm8oaW5mbyk7DQo+ICsjaWYgSVNfRU5BQkxFRChDT05GSUdfRkJfREVGRVJSRURf
SU8pDQo+ICsJaWYgKGluZm8tPmZiZGVmaW8pDQo+ICsJCWZiX2RlZmVycmVkX2lvX3JlbGVh
c2UoaW5mbyk7DQo+ICsjZW5kaWYNCj4gICAJaWYgKGluZm8tPmZib3BzLT5mYl9yZWxlYXNl
KQ0KPiAgIAkJaW5mby0+ZmJvcHMtPmZiX3JlbGVhc2UoaW5mbywxKTsNCj4gICAJbW9kdWxl
X3B1dChpbmZvLT5mYm9wcy0+b3duZXIpOw0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51
eC9mYi5oIGIvaW5jbHVkZS9saW51eC9mYi5oDQo+IGluZGV4IDk2Yjk2MzIzZTljYi4uNzNl
YjFmODVlYThlIDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL2xpbnV4L2ZiLmgNCj4gKysrIGIv
aW5jbHVkZS9saW51eC9mYi5oDQo+IEBAIC02NjIsNiArNjYyLDcgQEAgZXh0ZXJuIGludCAg
ZmJfZGVmZXJyZWRfaW9faW5pdChzdHJ1Y3QgZmJfaW5mbyAqaW5mbyk7DQo+ICAgZXh0ZXJu
IHZvaWQgZmJfZGVmZXJyZWRfaW9fb3BlbihzdHJ1Y3QgZmJfaW5mbyAqaW5mbywNCj4gICAJ
CQkJc3RydWN0IGlub2RlICppbm9kZSwNCj4gICAJCQkJc3RydWN0IGZpbGUgKmZpbGUpOw0K
PiArZXh0ZXJuIHZvaWQgZmJfZGVmZXJyZWRfaW9fcmVsZWFzZShzdHJ1Y3QgZmJfaW5mbyAq
aW5mbyk7DQo+ICAgZXh0ZXJuIHZvaWQgZmJfZGVmZXJyZWRfaW9fY2xlYW51cChzdHJ1Y3Qg
ZmJfaW5mbyAqaW5mbyk7DQo+ICAgZXh0ZXJuIGludCBmYl9kZWZlcnJlZF9pb19mc3luYyhz
dHJ1Y3QgZmlsZSAqZmlsZSwgbG9mZl90IHN0YXJ0LA0KPiAgIAkJCQlsb2ZmX3QgZW5kLCBp
bnQgZGF0YXN5bmMpOw0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2
ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1h
eGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcg
TsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------nUv5mLHMcmVuy8ZfxOZr4zep--

--------------gV6wR6wW4v5xsxaPPGWJjiHD
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPmGkAFAwAAAAAACgkQlh/E3EQov+D+
dhAAiuoAuAa8p5hrwjyD46M6O75ooUqNfLCyawYwvYoYJNtF/REvXgFV0g0WIdSqV5LdW79xGabI
FYguB5e6//7TTfOONjikhrbkDQOo/hQUjJbe5AKISgNEzyirSmGAaDbHeK8NGyczSEIeVKhcG/nT
rX/hrlPAYpu0QdsUEZyfHKf0n1zGUMxVrQx4rTZi+jmTC/28+lXtOr0vT6KccBlMuhCpJSer2qu+
oruqVWSfPugTGjE/Pw06M1Yxvk3ewNwfDHDazCITP4JAw1OA0ktZWBwlDWnFwvyWFzNgv6h148yB
Qr/7SXH4RGe6U8PgWp5R13zScZ707kO5Ept1S1zHih2dti0bijZuD991qXo1Ujg7d9cqhFG2zpYi
x8zQIsIbR6UEXJSxpUxJnEJVv4pItATzah/vLr1j1uCDkrLIJjXCw5wuf+4X3AACf+x+KOOilSwH
JworjMZirVv/fBkhx51W30lhmCIsSVlMCc4/AbhpsJhfcNkpXW2D5ldHgKF0UGHr9OJUgxJFJBl4
S4+gLHYEG8GKOrn7Fa7JA8WtTdiPgttndMV9rN70I4pqLvIHuj0NfgJxJq1a+6yGD4PDDIFXxbY8
kAicNPS1RMfT8Mg3bobgbdIsTHYOENqM9g/c9Ic9cfZ9IKHHuX3D0m8mnutzfBhYY31zXy2CFFF1
Wvc=
=gmC4
-----END PGP SIGNATURE-----

--------------gV6wR6wW4v5xsxaPPGWJjiHD--
