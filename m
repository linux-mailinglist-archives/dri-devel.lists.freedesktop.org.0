Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDBF691BFF
	for <lists+dri-devel@lfdr.de>; Fri, 10 Feb 2023 10:55:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18C1D10ECC0;
	Fri, 10 Feb 2023 09:55:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41A1510ECC0
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 09:54:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E39ED673AF;
 Fri, 10 Feb 2023 09:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1676022897; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7ZPgtDl4rWfqVY+o/iEeMatcKTIBdgyPN1m50QOyxTM=;
 b=wi0c4ijDC3dIzVxvJiSj++qEUKvlVyMCVEda89rKEOZl/rSN3JcAUZfg9IExiqaX83w47U
 pA/8TGtjhwXw2RqwvK2aG78Qdd9h/IkVRDe+S9nISukRGs7ji1uVXbw9h9HwroBml6r3DT
 QKEiAPSOKT/bWlLtCM2ykny0QNvwYGk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1676022897;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7ZPgtDl4rWfqVY+o/iEeMatcKTIBdgyPN1m50QOyxTM=;
 b=5oLeJW4GK+nz8TDN/D/qJCqMMgyml5HcLsh79/f/J/tr70OMqNXTrPe3Ic/ids+VnQamaM
 fAKMF/pksUCJ91Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C244B13206;
 Fri, 10 Feb 2023 09:54:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Xix3LnEU5mNFOAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 10 Feb 2023 09:54:57 +0000
Message-ID: <2188f4df-6d32-cff6-e8a1-9a5c7d0f04e3@suse.de>
Date: Fri, 10 Feb 2023 10:54:56 +0100
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
 boundary="------------Ibt237fH7FEJUuqMn0tvt1hJ"
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
--------------Ibt237fH7FEJUuqMn0tvt1hJ
Content-Type: multipart/mixed; boundary="------------WqUytrHUwZMLfJCUyXA0Dnmr";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Takashi Iwai <tiwai@suse.de>, Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Patrik Jakobsson <pjakobsson@suse.de>
Message-ID: <2188f4df-6d32-cff6-e8a1-9a5c7d0f04e3@suse.de>
Subject: Re: [PATCH v2] fbdev: Fix invalid page access after closing deferred
 I/O devices
References: <20230129082856.22113-1-tiwai@suse.de>
In-Reply-To: <20230129082856.22113-1-tiwai@suse.de>

--------------WqUytrHUwZMLfJCUyXA0Dnmr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDI5LjAxLjIzIHVtIDA5OjI4IHNjaHJpZWIgVGFrYXNoaSBJd2FpOg0KPiBXaGVu
IGEgZmJkZXYgd2l0aCBkZWZlcnJlZCBJL08gaXMgb25jZSBvcGVuZWQgYW5kIGNsb3NlZCwg
dGhlIGRpcnR5DQo+IHBhZ2VzIHN0aWxsIHJlbWFpbiBxdWV1ZWQgaW4gdGhlIHBhZ2VyZWYg
bGlzdCwgYW5kIGV2ZW50dWFsbHkgbGF0ZXINCj4gdGhvc2UgbWF5IGJlIHByb2Nlc3NlZCBp
biB0aGUgZGVsYXllZCB3b3JrLiAgVGhpcyBtYXkgbGVhZCB0byBhDQo+IGNvcnJ1cHRpb24g
b2YgcGFnZXMsIGhpdHRpbmcgYW4gT29wcy4NCj4gDQo+IFRoaXMgcGF0Y2ggbWFrZXMgc3Vy
ZSB0byBjYW5jZWwgdGhlIGRlbGF5ZWQgd29yayBhbmQgY2xlYW4gdXAgdGhlDQo+IHBhZ2Vy
ZWYgbGlzdCBhdCBjbG9zaW5nIHRoZSBkZXZpY2UgZm9yIGFkZHJlc3NpbmcgdGhlIGJ1Zy4g
IEEgcGFydCBvZg0KPiB0aGUgY2xlYW51cCBjb2RlIGlzIGZhY3RvcmVkIG91dCBhcyBhIG5l
dyBoZWxwZXIgZnVuY3Rpb24gdGhhdCBpcw0KPiBjYWxsZWQgZnJvbSB0aGUgY29tbW9uIGZi
X3JlbGVhc2UoKS4NCj4gDQo+IFJldmlld2VkLWJ5OiBQYXRyaWsgSmFrb2Jzc29uIDxwYXRy
aWsuci5qYWtvYnNzb25AZ21haWwuY29tPg0KPiBDYzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5v
cmc+DQo+IFNpZ25lZC1vZmYtYnk6IFRha2FzaGkgSXdhaSA8dGl3YWlAc3VzZS5kZT4NCg0K
UmV2aWV3ZWQtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0K
DQo+IC0tLQ0KPiB2MS0+djI6IEZpeCBidWlsZCBlcnJvciB3aXRob3V0IENPTkZJR19GQl9E
RUZFUlJFRF9JTw0KPiANCj4gICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJfZGVmaW8u
YyB8IDEwICsrKysrKysrKy0NCj4gICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJtZW0u
YyAgICB8ICA0ICsrKysNCj4gICBpbmNsdWRlL2xpbnV4L2ZiLmggICAgICAgICAgICAgICAg
ICB8ICAxICsNCj4gICAzIGZpbGVzIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUv
ZmJfZGVmaW8uYyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYl9kZWZpby5jDQo+IGlu
ZGV4IGM3MzAyNTNhYjg1Yy4uNTgzY2JjZjA5NDQ2IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L3ZpZGVvL2ZiZGV2L2NvcmUvZmJfZGVmaW8uYw0KPiArKysgYi9kcml2ZXJzL3ZpZGVvL2Zi
ZGV2L2NvcmUvZmJfZGVmaW8uYw0KPiBAQCAtMzEzLDcgKzMxMyw3IEBAIHZvaWQgZmJfZGVm
ZXJyZWRfaW9fb3BlbihzdHJ1Y3QgZmJfaW5mbyAqaW5mbywNCj4gICB9DQo+ICAgRVhQT1JU
X1NZTUJPTF9HUEwoZmJfZGVmZXJyZWRfaW9fb3Blbik7DQo+ICAgDQo+IC12b2lkIGZiX2Rl
ZmVycmVkX2lvX2NsZWFudXAoc3RydWN0IGZiX2luZm8gKmluZm8pDQo+ICt2b2lkIGZiX2Rl
ZmVycmVkX2lvX3JlbGVhc2Uoc3RydWN0IGZiX2luZm8gKmluZm8pDQo+ICAgew0KPiAgIAlz
dHJ1Y3QgZmJfZGVmZXJyZWRfaW8gKmZiZGVmaW8gPSBpbmZvLT5mYmRlZmlvOw0KPiAgIAlz
dHJ1Y3QgcGFnZSAqcGFnZTsNCj4gQEAgLTMyNyw2ICszMjcsMTQgQEAgdm9pZCBmYl9kZWZl
cnJlZF9pb19jbGVhbnVwKHN0cnVjdCBmYl9pbmZvICppbmZvKQ0KPiAgIAkJcGFnZSA9IGZi
X2RlZmVycmVkX2lvX3BhZ2UoaW5mbywgaSk7DQo+ICAgCQlwYWdlLT5tYXBwaW5nID0gTlVM
TDsNCj4gICAJfQ0KPiArfQ0KPiArRVhQT1JUX1NZTUJPTF9HUEwoZmJfZGVmZXJyZWRfaW9f
cmVsZWFzZSk7DQo+ICsNCj4gK3ZvaWQgZmJfZGVmZXJyZWRfaW9fY2xlYW51cChzdHJ1Y3Qg
ZmJfaW5mbyAqaW5mbykNCj4gK3sNCj4gKwlzdHJ1Y3QgZmJfZGVmZXJyZWRfaW8gKmZiZGVm
aW8gPSBpbmZvLT5mYmRlZmlvOw0KPiArDQo+ICsJZmJfZGVmZXJyZWRfaW9fcmVsZWFzZShp
bmZvKTsNCj4gICANCj4gICAJa3ZmcmVlKGluZm8tPnBhZ2VyZWZzKTsNCj4gICAJbXV0ZXhf
ZGVzdHJveSgmZmJkZWZpby0+bG9jayk7DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVv
L2ZiZGV2L2NvcmUvZmJtZW0uYyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYm1lbS5j
DQo+IGluZGV4IDNhNmM4NDU4ZWI4ZC4uYWIzNTQ1YTAwYWJjIDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJtZW0uYw0KPiArKysgYi9kcml2ZXJzL3ZpZGVv
L2ZiZGV2L2NvcmUvZmJtZW0uYw0KPiBAQCAtMTQ1NCw2ICsxNDU0LDEwIEBAIF9fcmVsZWFz
ZXMoJmluZm8tPmxvY2spDQo+ICAgCXN0cnVjdCBmYl9pbmZvICogY29uc3QgaW5mbyA9IGZp
bGUtPnByaXZhdGVfZGF0YTsNCj4gICANCj4gICAJbG9ja19mYl9pbmZvKGluZm8pOw0KPiAr
I2lmIElTX0VOQUJMRUQoQ09ORklHX0ZCX0RFRkVSUkVEX0lPKQ0KPiArCWlmIChpbmZvLT5m
YmRlZmlvKQ0KPiArCQlmYl9kZWZlcnJlZF9pb19yZWxlYXNlKGluZm8pOw0KPiArI2VuZGlm
DQo+ICAgCWlmIChpbmZvLT5mYm9wcy0+ZmJfcmVsZWFzZSkNCj4gICAJCWluZm8tPmZib3Bz
LT5mYl9yZWxlYXNlKGluZm8sMSk7DQo+ICAgCW1vZHVsZV9wdXQoaW5mby0+ZmJvcHMtPm93
bmVyKTsNCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvZmIuaCBiL2luY2x1ZGUvbGlu
dXgvZmIuaA0KPiBpbmRleCA5NmI5NjMyM2U5Y2IuLjczZWIxZjg1ZWE4ZSAxMDA2NDQNCj4g
LS0tIGEvaW5jbHVkZS9saW51eC9mYi5oDQo+ICsrKyBiL2luY2x1ZGUvbGludXgvZmIuaA0K
PiBAQCAtNjYyLDYgKzY2Miw3IEBAIGV4dGVybiBpbnQgIGZiX2RlZmVycmVkX2lvX2luaXQo
c3RydWN0IGZiX2luZm8gKmluZm8pOw0KPiAgIGV4dGVybiB2b2lkIGZiX2RlZmVycmVkX2lv
X29wZW4oc3RydWN0IGZiX2luZm8gKmluZm8sDQo+ICAgCQkJCXN0cnVjdCBpbm9kZSAqaW5v
ZGUsDQo+ICAgCQkJCXN0cnVjdCBmaWxlICpmaWxlKTsNCj4gK2V4dGVybiB2b2lkIGZiX2Rl
ZmVycmVkX2lvX3JlbGVhc2Uoc3RydWN0IGZiX2luZm8gKmluZm8pOw0KPiAgIGV4dGVybiB2
b2lkIGZiX2RlZmVycmVkX2lvX2NsZWFudXAoc3RydWN0IGZiX2luZm8gKmluZm8pOw0KPiAg
IGV4dGVybiBpbnQgZmJfZGVmZXJyZWRfaW9fZnN5bmMoc3RydWN0IGZpbGUgKmZpbGUsIGxv
ZmZfdCBzdGFydCwNCj4gICAJCQkJbG9mZl90IGVuZCwgaW50IGRhdGFzeW5jKTsNCg0KLS0g
DQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBT
b2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBO
w7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6Rm
dHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------WqUytrHUwZMLfJCUyXA0Dnmr--

--------------Ibt237fH7FEJUuqMn0tvt1hJ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPmFHAFAwAAAAAACgkQlh/E3EQov+Aa
FBAAw6hTnDg+BgaP+Srg60xEAu+Zo0bS6F/Hrbnk4djTQG6pSC88aMRfX9G/MTM3S1JG5bmFL+A2
DK0MEctvIbNnklAf+3bg35Nw6zfuwlshoRDp0Vw9uPHdaItyAJGpn0sCVb4eeWncTXvTTrVlIK40
pdDXJl9baHwzz/2wAzI1v9ulQNvb+zezFu2kIQkggxW9zNJWPkSFBs2f0WG5h7i5KAllPzQTj+px
QnXTMaBvxyZusgh2A2g2YbW1GnpFgUECyA9WhGOf1omtc8/D1sNWrFcm5mZ+x0h6rZjxRieChVz0
NFlv96rwRBPSMSENC/BL6vPfw1fC2tRH+KAWd7gm/RQM/5Oq1SpXXEk1ip6/QIq7TZoEeqE9pBzY
BhxGl7xMKEOkadElQ5kXbsCI7+bn3XU2cH1dfkZQmDJZlR8f1V3B1Us0KO3FRRK6gUk7ShUTOA2o
O3U4Ock/07AzlJ9CIFlE1GmPjQw3nGouLxiSJT871bkTd/ARa2gp1a5K+nA6FmCdQ8Z8XF5vh3nj
aece1bpCF/g5YWqZlHHo2usXobsC5CWWq9CbhC8b6VtoQgrT+qsi0DzhhHSwWoWPG3ZOwvCr3Vhe
Ytvf1IoU5pRPA38xFQWBYjhWbDE0FZw+SErXZsiGAn/qWlNtaGigjT6/MTZCaCC2KbiB0bFM5Ypk
Y2Y=
=kYos
-----END PGP SIGNATURE-----

--------------Ibt237fH7FEJUuqMn0tvt1hJ--
