Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA405FB643
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 17:02:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E3DC10E087;
	Tue, 11 Oct 2022 15:02:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE08010E087
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Oct 2022 15:02:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7D5BE21E25;
 Tue, 11 Oct 2022 15:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1665500520; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tIObQI87ODYfkOTzFVXmAYrM/0zLsZEeiDdeh3vdD0s=;
 b=e2GiKmmEOkLY+IrQG88WkAHke4BuJQw/Pp+O5SIQZidz/v9ATf7nW2bHCpzr/gZCYwWSCZ
 8GE0tvxMxi2G5DPS/UwgN429NaVvUErmZVyYiNtBS46M/qzJO8I+iyiumoWGaSslUdXBsO
 WnNsVzhKC500m/ua9l8Ig3xPT93DfI8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1665500520;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tIObQI87ODYfkOTzFVXmAYrM/0zLsZEeiDdeh3vdD0s=;
 b=2Rxq21b9+jjedRE+5e5G4D5FnvCgENcP36GpwsAT4K6vXhPZYlDfbAdzehDfkA2990Dy7H
 6oreAn6VJPppxkAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 41DF5139ED;
 Tue, 11 Oct 2022 15:02:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id bEtNCmiFRWNgSgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 11 Oct 2022 15:02:00 +0000
Message-ID: <3326af6f-5ca5-e349-1641-5987e6800fea@suse.de>
Date: Tue, 11 Oct 2022 17:01:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 3/3] drm/crtc-helper: Add a drm_crtc_helper_atomic_check()
 helper
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20221010170203.274949-1-javierm@redhat.com>
 <20221010170203.274949-4-javierm@redhat.com>
 <f6a49350-74d0-4923-7c80-8e6233dc135b@suse.de>
 <bbbd1ebb-f0cc-91d6-2959-28919a2e8893@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <bbbd1ebb-f0cc-91d6-2959-28919a2e8893@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------VWTHTjX9hU0euSeG9r6eO66P"
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
--------------VWTHTjX9hU0euSeG9r6eO66P
Content-Type: multipart/mixed; boundary="------------bEkoHkR43JVEIQDmPkD0Euw2";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Message-ID: <3326af6f-5ca5-e349-1641-5987e6800fea@suse.de>
Subject: Re: [PATCH 3/3] drm/crtc-helper: Add a drm_crtc_helper_atomic_check()
 helper
References: <20221010170203.274949-1-javierm@redhat.com>
 <20221010170203.274949-4-javierm@redhat.com>
 <f6a49350-74d0-4923-7c80-8e6233dc135b@suse.de>
 <bbbd1ebb-f0cc-91d6-2959-28919a2e8893@redhat.com>
In-Reply-To: <bbbd1ebb-f0cc-91d6-2959-28919a2e8893@redhat.com>

--------------bEkoHkR43JVEIQDmPkD0Euw2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTEuMTAuMjIgdW0gMTU6MjYgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IE9uIDEwLzExLzIyIDE1OjIxLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToN
Cj4+IEhpDQo+Pg0KPj4gQW0gMTAuMTAuMjIgdW0gMTk6MDIgc2NocmllYiBKYXZpZXIgTWFy
dGluZXogQ2FuaWxsYXM6DQo+Pj4gUHJvdmlkZXMgYSBkZWZhdWx0IENSVEMgc3RhdGUgY2hl
Y2sgaGFuZGxlciBmb3IgQ1JUQ3MgdGhhdCBvbmx5IGhhdmUgb25lDQo+Pj4gcHJpbWFyeSBw
bGFuZSBhdHRhY2hlZC4NCj4+Pg0KPj4+IFRoZXJlIGFyZSBzb21lIGRyaXZlcnMgdGhhdCBk
dXBsaWNhdGUgdGhpcyBsb2dpYyBpbiB0aGVpciBoZWxwZXJzLCBzdWNoIGFzDQo+Pj4gc2lt
cGxlZHJtIGFuZCBzc2QxMzB4LiBGYWN0b3Igb3V0IHRoaXMgY29tbW9uIGNvZGUgaW50byBh
IENSVEMgaGVscGVyIGFuZA0KPj4+IG1ha2UgZHJpdmVycyB1c2UgaXQuDQo+Pj4NCj4+PiBT
aWduZWQtb2ZmLWJ5OiBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXMgPGphdmllcm1AcmVkaGF0
LmNvbT4NCj4+DQo+PiBSZXZpZXdlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJt
YW5uQHN1c2UuZGU+DQo+Pg0KPj4gVGhlcmUgcmVhbGx5IGlzbid0IG11Y2ggaGVyZSBmb3Ig
bm93LiBJIHN1c3BlY3QgdGhhdCB0aGVyZSBhcmUgbW9yZQ0KPj4gZHJpdmVycyB0aGF0IGNv
dWxkIHVzZSB0aGlzIGhlbHBlci4gSWYgeW91IG1lcmdlIHRoaXMgYmVmb3JlIG9mZHJtLCBJ
J2xsDQo+PiByZWJhc2Ugb2Zkcm0gb24gdG9wLg0KPj4NCj4gDQo+IFN1cmUuIEkgcHJvYmFi
bHkgd29uJ3QgcG9zdCBhIHYyIHVudGlsIHRvbW9ycm93IGFuZCBJIGJlbGlldmUgb2Zkcm0g
aXMNCj4gcmVhZHkgdG8gYmUgbWVyZ2VkLCBzbyBJJ2xsIGp1c3QgcmViYXNlIHRoaXMgc2Vy
aWVzIG9uIHRvcCBvZiB0aGF0IG9uY2UNCj4ganVzdCBwdXNoIGl0Lg0KDQpJIGp1c3QgcmVh
bGl6ZWQgdGhhdCB0aGlzIGZ1bmN0aW9uIGluIG9mZHJtIGhhcyBhZGRpdGlvbmFsIGNvZGUg
Zm9yIA0KY29sb3IgbWFuYWdlbWVudC4gVGhlcmUgd29uJ3QgYmUgYW55dGhpbmcgdG8gY29u
dmVydC4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4+IFBsZWFzZSBhbHNvIHNl
ZSBteSBjb21tZW50IGJlbG93Lg0KPj4NCj4+DQo+IA0KPiBbLi4uXQ0KPiANCj4+PiArLyoq
DQo+Pj4gKyAqIGRybV9jcnRjX2hlbHBlcl9hdG9taWNfY2hlY2soKSAtIEhlbHBlciB0byBj
aGVjayBDUlRDIGF0b21pYy1zdGF0ZQ0KPj4+ICsgKiBAY3J0YzogQ1JUQyB0byBjaGVjaw0K
Pj4+ICsgKiBAc3RhdGU6IGF0b21pYyBzdGF0ZSBvYmplY3QNCj4+PiArICoNCj4+PiArICog
UHJvdmlkZXMgYSBkZWZhdWx0IENSVEMtc3RhdGUgY2hlY2sgaGFuZGxlciBmb3IgQ1JUQ3Mg
dGhhdCBvbmx5IGhhdmUNCj4+PiArICogb25lIHByaW1hcnkgcGxhbmUgYXR0YWNoZWQgdG8g
aXQuDQo+Pj4gKyAqDQo+Pj4gKyAqIFRoaXMgaXMgb2Z0ZW4gdGhlIGNhc2UgZm9yIHRoZSBD
UlRDIG9mIHNpbXBsZSBmcmFtZWJ1ZmZlcnMuDQo+Pg0KPj4gSSdkIGFkZCBhIHJlZmVyZW5j
ZSB0byBkcm1fcGxhbmVfaGVscGVyX2F0b21pY19jaGVjaygpIHRvIHRoaXMNCj4+IHBhcmFn
cmFwaC4gTGlrZQ0KPj4NCj4+ICAgICBTZWUgZHJtX3BsYW5lX2hlbHBlcl9hdG9taWNfY2hl
Y2soKSBmb3IgdGhlIHJlc3BlY3RpdmUgcGxhbmUgaGVscGVycy4NCj4+DQo+PiBBbmQgYWxz
byByZWZlcmVuY2UgYmFjayBmcm9tIHRoZSBwbGFuZS1jaGVjayBoZWxwZXIgdG8gdGhlIENS
VEMtY2hlY2sNCj4+IGhlbHBlci4NCj4+DQo+IA0KPiBHb29kIGlkZWEsIEknbGwgZG8gdGhh
dC4gVGhhbmtzIGZvciB5b3VyIHJldmlldy4NCj4gICANCj4+IEJlc3QgcmVnYXJkcw0KPj4g
VGhvbWFzDQo+Pg0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJp
dmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpN
YXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFH
IE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------bEkoHkR43JVEIQDmPkD0Euw2--

--------------VWTHTjX9hU0euSeG9r6eO66P
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmNFhWcFAwAAAAAACgkQlh/E3EQov+A+
wBAAqA9rOyoFJtmzOcmcD35zAmPQean1vkqoTj/jIfvP9D0mtDFOyPZsJkiEtJ+7epuug0uQ4BJd
QE9X/InfoXJn9IrU0fQWc2qW6cHrLjMPTPvgfKrGPLy6L+B1UqSBbZV54bTWVAaNG0flr+tyAB9I
c2sw1rQ8Yp7E1yW+/rK8Lj80l2mJVHWryyN7R+7Hc5sOlce142ZNJ60JdESN7HyCOrTe92az2ciU
JvMpDl7jvU2mIAAQb9Q8w2K/W9p6x+dDbO3FYHlYOioWqL468PgowK5EGiR+eSUVCdzXA78ptWv3
Oy0j7xhJExA9H94t8f19PZtx4bJSxUlZ3pg7hmM2G0ovRsnY8x7jpl1B0+KS/xStRLHsZxEccrlM
FGMEvPTXlJBwZmBWR6HoUwIMlDTeVWK7tXifcw3HP6M0Sg33B9VWOJJLm5Qb0M0i2UrBYzYu2RcA
F0V/2kvc91GKR9rrjpDMoQ3EoRjM1zG2u5UOrj5Qs4NbQOZE4Pk0uasnLyCqNkahYzCfLLJX68LS
UUIUvg+rh8M2Pi1qxxgNYujWSvoReIVrrChyBpFv+I5i4ovKj9ccM/mxRF8F9VaB4jMYELJIAJWx
aT157+TzdBmWepmZubM7U3Jm1sVWZVdI1+tAT41U79KCd9p8/WISwoFvKDH3EGaDEVfmxYdv/buy
hlw=
=nRdf
-----END PGP SIGNATURE-----

--------------VWTHTjX9hU0euSeG9r6eO66P--
