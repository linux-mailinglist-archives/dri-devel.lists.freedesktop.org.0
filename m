Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E729F576F17
	for <lists+dri-devel@lfdr.de>; Sat, 16 Jul 2022 16:40:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39E6110FDBD;
	Sat, 16 Jul 2022 14:36:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78EA110E11A
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Jul 2022 15:36:35 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 4F50B34E6B;
 Fri, 15 Jul 2022 15:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1657899393; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v9qnekPg9nBwwL9bgfq6OxuUEbyEXfAsl+2UsAfBrNo=;
 b=I8jT2IPrdFRH8sT4sQz7HM0JL7cp/jdJfxAyj9GiWE5dLmscc7kTlhTKbq9z+YGz3fPi2e
 bbHcFHbesfPxaEEIZjKI3xK8ddy3m8dUuVLZlQZ4fHN6GfgPIdW+0rGrAmGrQnnXK+yt8h
 7KsAdpJ50pmTHbm9wcus+MKxGJUWhFg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1657899393;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v9qnekPg9nBwwL9bgfq6OxuUEbyEXfAsl+2UsAfBrNo=;
 b=7hOGo42TR/75CZSH5o7Ka671Pr7n/jJDup276ImS9Xb720vq178axJgseuWFMCX3QGVcGN
 ICCBlSz/5F8ZqKDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 35DB913AC3;
 Fri, 15 Jul 2022 15:36:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id i0FaDIGJ0WJLXgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 15 Jul 2022 15:36:33 +0000
Message-ID: <e71431ef-bcb9-012a-ff0d-4ef350cd232e@suse.de>
Date: Fri, 15 Jul 2022 17:36:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] drm/ttm: fix locking in vmap/vunmap TTM GEM helpers
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20220715111533.467012-1-christian.koenig@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220715111533.467012-1-christian.koenig@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------gYtKRIHtrESCeC3B9EduffjW"
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dmitry.osipenko@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------gYtKRIHtrESCeC3B9EduffjW
Content-Type: multipart/mixed; boundary="------------CAY7m4dgPUupGE3pu9e5Fzl6";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org
Cc: dmitry.osipenko@collabora.com, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>
Message-ID: <e71431ef-bcb9-012a-ff0d-4ef350cd232e@suse.de>
Subject: Re: [PATCH 1/2] drm/ttm: fix locking in vmap/vunmap TTM GEM helpers
References: <20220715111533.467012-1-christian.koenig@amd.com>
In-Reply-To: <20220715111533.467012-1-christian.koenig@amd.com>

--------------CAY7m4dgPUupGE3pu9e5Fzl6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTUuMDcuMjIgdW0gMTM6MTUgc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOg0K
PiBJJ3ZlIHN0dW1ibGVkIG92ZXIgdGhpcyB3aGlsZSByZXZpZXdpbmcgcGF0Y2hlcyBmb3Ig
RE1BLWJ1ZiBhbmQgaXQgbG9va3MNCj4gbGlrZSB3ZSBjb21wbGV0ZWx5IG1lc3NlZCB0aGUg
bG9ja2luZyB1cCBoZXJlLg0KPiANCj4gSW4gZ2VuZXJhbCBtb3N0IFRUTSBmdW5jdGlvbiBz
aG91bGQgb25seSBiZSBjYWxsZWQgd2hpbGUgaG9sZGluZyB0aGUNCj4gYXBwcm9wcmlhdGUg
Qk8gcmVzdiBsb2NrLiBXaXRob3V0IHRoaXMgd2UgY291bGQgYnJlYWsgdGhlIGludGVybmFs
DQo+IGJ1ZmZlciBvYmplY3Qgc3RhdGUgaGVyZS4NCg0KSSByZW1lbWJlciB0aGF0IEkgdHJp
ZWQgdG8gZml4IHRoaXMgYmVmb3JlIGFuZCB5b3UgbWVudGlvbmVkIHRoYXQgaXQncyANCm5v
dCBhbGxvd2VkIHRvIGhvbGQgdGhpcyBsb2NrIGhlcmUuIEl0IHdvdWxkIHBvc3NpYmx5IGRl
YWRsb2NrIHdpdGggDQpleHBvcnRlZCBidWZmZXJzLiBEaWQgdGhpcyBjaGFuZ2Ugd2l0aCBE
bWl0cnkncyByZXdvcmsgb2YgdGhlIGxvY2tpbmcgDQpzZW1hbnRpY3M/DQoNCkJlc3QgcmVn
YXJkcw0KVGhvbWFzDQoNCj4gDQo+IE9ubHkgY29tcGlsZSB0ZXN0ZWQhDQo+IA0KPiBTaWdu
ZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+
DQo+IEZpeGVzOiA0MzY3NjYwNWY4OTAgZHJtL3R0bTogQWRkIHZtYXAvdnVubWFwIHRvIFRU
TSBhbmQgVFRNIEdFTSBoZWxwZXJzDQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1f
Z2VtX3R0bV9oZWxwZXIuYyB8IDkgKysrKysrKystDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDgg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9kcm1fZ2VtX3R0bV9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1f
Z2VtX3R0bV9oZWxwZXIuYw0KPiBpbmRleCBkNTk2MmEzNGMwMWQuLmU1ZmM4NzU5OTBjNCAx
MDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdHRtX2hlbHBlci5jDQo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3R0bV9oZWxwZXIuYw0KPiBAQCAtNjQs
OCArNjQsMTMgQEAgaW50IGRybV9nZW1fdHRtX3ZtYXAoc3RydWN0IGRybV9nZW1fb2JqZWN0
ICpnZW0sDQo+ICAgCQkgICAgIHN0cnVjdCBpb3N5c19tYXAgKm1hcCkNCj4gICB7DQo+ICAg
CXN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8gPSBkcm1fZ2VtX3R0bV9vZl9nZW0oZ2Vt
KTsNCj4gKwlpbnQgcmV0Ow0KPiArDQo+ICsJZG1hX3Jlc3ZfbG9jayhnZW0tPnJlc3YsIE5V
TEwpOw0KPiArCXJldCA9IHR0bV9ib192bWFwKGJvLCBtYXApOw0KPiArCWRtYV9yZXN2X3Vu
bG9jayhnZW0tPnJlc3YpOw0KPiAgIA0KPiAtCXJldHVybiB0dG1fYm9fdm1hcChibywgbWFw
KTsNCj4gKwlyZXR1cm4gcmV0Ow0KPiAgIH0NCj4gICBFWFBPUlRfU1lNQk9MKGRybV9nZW1f
dHRtX3ZtYXApOw0KPiAgIA0KPiBAQCAtODIsNyArODcsOSBAQCB2b2lkIGRybV9nZW1fdHRt
X3Z1bm1hcChzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKmdlbSwNCj4gICB7DQo+ICAgCXN0cnVj
dCB0dG1fYnVmZmVyX29iamVjdCAqYm8gPSBkcm1fZ2VtX3R0bV9vZl9nZW0oZ2VtKTsNCj4g
ICANCj4gKwlkbWFfcmVzdl9sb2NrKGdlbS0+cmVzdiwgTlVMTCk7DQo+ICAgCXR0bV9ib192
dW5tYXAoYm8sIG1hcCk7DQo+ICsJZG1hX3Jlc3ZfdW5sb2NrKGdlbS0+cmVzdik7DQo+ICAg
fQ0KPiAgIEVYUE9SVF9TWU1CT0woZHJtX2dlbV90dG1fdnVubWFwKTsNCj4gICANCg0KLS0g
DQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBT
b2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBO
w7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6Rm
dHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------CAY7m4dgPUupGE3pu9e5Fzl6--

--------------gYtKRIHtrESCeC3B9EduffjW
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmLRiYAFAwAAAAAACgkQlh/E3EQov+Db
IhAAwYd9Hog35GB9ksGKkVtn44Z3XQLQAPTmYRjtSFb5JHCFI0ztC6XxFkRHOGjgbcjbZHCLr7Tq
3ZxEZFWIsN6I5ZRzAj9ZzCLHzWt6OrPNJQZFSe54o+3d0CzVSYmvl42Vy5UAaV1mSYC23jHwplpj
D6gHwxtFb7iYuYdOEtAk7b9McoEj8t/fOBCA0QEyN/H+f3BcfGR2vFUAzPE1t4rDLyqsY+DWJ9uo
uVif5BKC6Xao25/X3ArssBVLiyPYy27V5Q1tFmuwIIO07Y3zgDefMLK2nrPOr8nwu5FQSDtcwUTT
nh0r06fFH5J0vmjLU7pSXRE8N+6US/VL/5xUxaIsne/upuHjkmkf5250Jsy4k3qtso98K/u+lfMa
MuQWh6XvrLBxqMLTLQGttMeW9KpnSaxqkXZvPrgtaqHexjekCCCHDut0WYCeKXC9neTWpiFfi06r
USyBDOIN2u3qkuqr52tH9T2zFSkU3n5PKVgpVY822fSqp+8+JHVB9rWzukE/kEYYuTcRaehdqnZg
xoWlLgx4QurjIBP63nSghNgTyE8TXbpuSKT7MpeV1t1RELvrYffZRf/67XupqcoXXKA7cZHmxjUD
JCYwwJW9GaZDeEtElsA5NcYDjkbjv3Hi0nkaGckB0Cjh/VflFCoQUmG1zNl/ZQFSGSV2VM4tXQrN
bH4=
=uOnL
-----END PGP SIGNATURE-----

--------------gYtKRIHtrESCeC3B9EduffjW--
