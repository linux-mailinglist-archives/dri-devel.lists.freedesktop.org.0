Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 104C969AF49
	for <lists+dri-devel@lfdr.de>; Fri, 17 Feb 2023 16:16:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6338010E10D;
	Fri, 17 Feb 2023 15:16:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 476E910E10D
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Feb 2023 15:16:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EEA1620224;
 Fri, 17 Feb 2023 15:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1676646995; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=P6H4lMhCRpkIG/vzS08oqW/0Q9cmg7hMMaxPgpucUNI=;
 b=Elq2cHiafw3mCcMIvg/RzFiy7tIJn9xvvA5sZNlqsW2yILT0aTHr3s84Y71lmoGeXA7yqR
 xX/RdzmV7/Cau/erG+SltxYYVUa9l8McYhUXeqU1rfTnpnvQORixNr4lWWu/nZLvZ+gLrl
 ZTgLIbOIscHByZCAU+zBmfl6OQm9nBY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1676646995;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=P6H4lMhCRpkIG/vzS08oqW/0Q9cmg7hMMaxPgpucUNI=;
 b=PxSCgwojh+SxBriHEHp3I2kWawNMwi7lzxlfIkyY9hC5uyfAI9AQKZDel9QziY79VACE2c
 wCrehEM9oOg+NfBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C59B0138E3;
 Fri, 17 Feb 2023 15:16:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id o/lIL1Oa72N3MwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 17 Feb 2023 15:16:35 +0000
Message-ID: <b60c1a7d-8d3f-ca75-edb4-da7c375204d8@suse.de>
Date: Fri, 17 Feb 2023 16:16:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 6/6] drm/tidss: Implement struct
 drm_plane_helper_funcs.atomic_enable
Content-Language: en-US
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, airlied@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, jyri.sarha@iki.fi
References: <20230209154107.30680-1-tzimmermann@suse.de>
 <20230209154107.30680-7-tzimmermann@suse.de>
 <548d8a1b-4820-4825-7700-94c583530056@ideasonboard.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <548d8a1b-4820-4825-7700-94c583530056@ideasonboard.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------1xz0sfMD2shsNJuVyRIrZJEo"
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------1xz0sfMD2shsNJuVyRIrZJEo
Content-Type: multipart/mixed; boundary="------------Xzk5lBsJBZ7Ot3hMiXMN11sl";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, airlied@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, jyri.sarha@iki.fi
Cc: dri-devel@lists.freedesktop.org
Message-ID: <b60c1a7d-8d3f-ca75-edb4-da7c375204d8@suse.de>
Subject: Re: [PATCH 6/6] drm/tidss: Implement struct
 drm_plane_helper_funcs.atomic_enable
References: <20230209154107.30680-1-tzimmermann@suse.de>
 <20230209154107.30680-7-tzimmermann@suse.de>
 <548d8a1b-4820-4825-7700-94c583530056@ideasonboard.com>
In-Reply-To: <548d8a1b-4820-4825-7700-94c583530056@ideasonboard.com>

--------------Xzk5lBsJBZ7Ot3hMiXMN11sl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTcuMDIuMjMgdW0gMTU6NDIgc2NocmllYiBUb21pIFZhbGtlaW5lbjoNCj4g
T24gMDkvMDIvMjAyMyAxNzo0MSwgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6DQo+PiBFbmFi
bGUgdGhlIHByaW1hcnkgcGxhbmUgZm9yIHRpZHNzIGhhcmR3YXJlIHZpYSBhdG9taWNfZW5h
YmxlLg0KPj4gQXRvbWljIGhlbHBlcnMgaW52b2tlIHRoaXMgY2FsbGJhY2sgb25seSB3aGVu
IHRoZSBwbGFuZSBiZWNvbWVzDQo+PiBhY3RpdmUuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTog
VGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+PiAtLS0NCj4+IMKg
IGRyaXZlcnMvZ3B1L2RybS90aWRzcy90aWRzc19wbGFuZS5jIHwgMTEgKysrKysrKysrKysN
Cj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspDQo+Pg0KPj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90aWRzcy90aWRzc19wbGFuZS5jIA0KPj4gYi9kcml2
ZXJzL2dwdS9kcm0vdGlkc3MvdGlkc3NfcGxhbmUuYw0KPj4gaW5kZXggMGIxMjQwNWVkYjQ3
Li42YmRkNmU0YTk1NWEgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdGlkc3Mv
dGlkc3NfcGxhbmUuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3RpZHNzL3RpZHNzX3Bs
YW5lLmMNCj4+IEBAIC0xMjQsNiArMTI0LDE2IEBAIHN0YXRpYyB2b2lkIHRpZHNzX3BsYW5l
X2F0b21pY191cGRhdGUoc3RydWN0IA0KPj4gZHJtX3BsYW5lICpwbGFuZSwNCj4+IMKgwqDC
oMKgwqAgaHdfdmlkZW9wb3J0ID0gdG9fdGlkc3NfY3J0YyhuZXdfc3RhdGUtPmNydGMpLT5o
d192aWRlb3BvcnQ7DQo+PiDCoMKgwqDCoMKgIGRpc3BjX3BsYW5lX3NldHVwKHRpZHNzLT5k
aXNwYywgdHBsYW5lLT5od19wbGFuZV9pZCwgbmV3X3N0YXRlLCANCj4+IGh3X3ZpZGVvcG9y
dCk7DQo+PiArfQ0KPj4gKw0KPj4gK3N0YXRpYyB2b2lkIHRpZHNzX3BsYW5lX2F0b21pY19l
bmFibGUoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsDQo+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0
ZSkNCj4+ICt7DQo+PiArwqDCoMKgIHN0cnVjdCBkcm1fZGV2aWNlICpkZGV2ID0gcGxhbmUt
PmRldjsNCj4+ICvCoMKgwqAgc3RydWN0IHRpZHNzX2RldmljZSAqdGlkc3MgPSB0b190aWRz
cyhkZGV2KTsNCj4+ICvCoMKgwqAgc3RydWN0IHRpZHNzX3BsYW5lICp0cGxhbmUgPSB0b190
aWRzc19wbGFuZShwbGFuZSk7DQo+PiArDQo+PiArwqDCoMKgIGRldl9kYmcoZGRldi0+ZGV2
LCAiJXNcbiIsIF9fZnVuY19fKTsNCj4+IMKgwqDCoMKgwqAgZGlzcGNfcGxhbmVfZW5hYmxl
KHRpZHNzLT5kaXNwYywgdHBsYW5lLT5od19wbGFuZV9pZCwgdHJ1ZSk7DQo+PiDCoCB9DQo+
PiBAQCAtMTUxLDYgKzE2MSw3IEBAIHN0YXRpYyB2b2lkIGRybV9wbGFuZV9kZXN0cm95KHN0
cnVjdCBkcm1fcGxhbmUgDQo+PiAqcGxhbmUpDQo+PiDCoCBzdGF0aWMgY29uc3Qgc3RydWN0
IGRybV9wbGFuZV9oZWxwZXJfZnVuY3MgdGlkc3NfcGxhbmVfaGVscGVyX2Z1bmNzID0gew0K
Pj4gwqDCoMKgwqDCoCAuYXRvbWljX2NoZWNrID0gdGlkc3NfcGxhbmVfYXRvbWljX2NoZWNr
LA0KPj4gwqDCoMKgwqDCoCAuYXRvbWljX3VwZGF0ZSA9IHRpZHNzX3BsYW5lX2F0b21pY191
cGRhdGUsDQo+PiArwqDCoMKgIC5hdG9taWNfZW5hYmxlID0gdGlkc3NfcGxhbmVfYXRvbWlj
X2VuYWJsZSwNCj4+IMKgwqDCoMKgwqAgLmF0b21pY19kaXNhYmxlID0gdGlkc3NfcGxhbmVf
YXRvbWljX2Rpc2FibGUsDQo+PiDCoCB9Ow0KPiANCj4gSSBoYXZlbid0IHRlc3RlZCB0aGlz
LCBidXQgbG9va3MgZmluZSB0byBtZS4NCj4gDQo+IFJldmlld2VkLWJ5OiBUb21pIFZhbGtl
aW5lbiA8dG9taS52YWxrZWluZW5AaWRlYXNvbmJvYXJkLmNvbT4NCj4gDQo+IE9uZSB0aG91
Z2h0LCB0aG91Z2gsIGlzIHRoYXQgd2Ugc3RpbGwgZG8gZGlzcGNfcGxhbmVfZW5hYmxlKGZh
bHNlKSBpbiANCj4gdGlkc3NfcGxhbmVfYXRvbWljX3VwZGF0ZSgpIHdoZW4gdGhlIHBsYW5l
IGlzIG5vdCB2aXNpYmxlLiBOb3QgYSANCj4gcHJvYmxlbSwgYnV0IGl0IHdvdWxkIGJlIG5p
Y2UgdG8gb25seSBlbmFibGUvZGlzYWJsZSB0aGUgcGxhbmUgaW5zaWRlIA0KPiBhdG9taWNf
ZW5hYmxlL2Rpc2FibGUuDQo+IA0KPiBPciBtYXliZSBpbiBjYXNlcyBsaWtlIHRoaXMgdGhl
IGRyaXZlciBzaG91bGQgb25seSB1c2UgYXRvbWljX3VwZGF0ZSwgDQo+IGFuZCBkbyBhbGwg
dGhlIGVuYWJsaW5nIGFuZCBkaXNhYmxpbmcgdGhlcmUuLi4NCg0KSSBhZ3JlZS4gRHJpdmVy
cyB0aGF0IGhhdmUgY29tcGxleCBlbmFibGUvZGlzYWJsZSBzZW1hbnRpY3Mgc2hvdWxkIA0K
cHJvYmFibHkgaGFuZGxlIGV2ZXJ5dGhpbmcgaW4gYXRvbWljX3VwZGF0ZS4NCg0KRW5hYmxp
bmcvZGlzYWJsaW5nIGlzIGN1cnJlbnRseSBjb25uZWN0ZWQgdG8gdGhlIHBsYW5lJ3MgZnJh
bWVidWZmZXIuIEFzIA0KeW91IHNhaWQsIGl0IHdvdWxkIGJlIG5pY2UgaWYgdGhpcyBjb3Vs
ZCBiZSB0aWVkIHRvIHZpc2liaWxpdHkgaW5zdGVhZC4gDQpUaGUgcGF0Y2ggd291bGQgYmUg
dHJpdmlhbCwgYnV0IHNvbWUgZHJpdmVycyBtaWdodCBub3QgbGlrZSB0aGUgY2hhbmdlLiAN
CkkgZ3Vlc3Mgd2UgY291bGQgZG8gYW4gUkZDIHBhdGNoIGFuZCBnYXRoZXIgb3BpbmlvbnMu
DQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+ICDCoFRvbWkNCj4gDQoNCi0tIA0K
VGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29m
dHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8
cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRz
ZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------Xzk5lBsJBZ7Ot3hMiXMN11sl--

--------------1xz0sfMD2shsNJuVyRIrZJEo
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPvmlMFAwAAAAAACgkQlh/E3EQov+Bc
dBAAmsJhOKDF6uD66Qyw/4qT+cVz23o6LmsCSaGtq4dAzaJdeE3RRpvqXr2BLjx3u/I1HTvEX1V8
CZbE6Xv0DKt/ZDSt/jkTZSk9BWx+d8JqsX83twMHBcyi1D2kCBFDX9tG3XBdy8ws4ai7poJQV/5M
DuAQiJkObc5PHiPRflwsXfK4/eDHnwNkcWgU9eVL7wlL5a2iUY0MEuNVLz7MlpDQzDbOBH1xr86r
Gd8jDtPkLI+VZndD3MoDBbEu9+ZybsolVuWcsihhPDybZRWsZLxgiM0+7Zzt0/poyPA7fuJnLScl
d95JW6V5ndMgbxnW4cqglwbp6SJsjLLAedmGs57fmRmBc3OEp7LrA6R+WFQsHkf6mNtSXp+rJVbF
ERSQnXHCTHmPzJ1W6iyppftGKRNw3hnSmCkPaBl8+zAEXVBDPYQWwxscf2D8lFY+ZkrgZa6bOaJV
ZKpQ0lt9vDsA8adtIlyrhmNL7dwCEKmF6hHtTQRK1nPkk3Yder3B83MXYptAan8gFJ8My4CM4D14
JPmiOcp4AOD2Kru8+6OEDeCg74VwiQ7zc45M2i/AemEjSXsmOSxK2pkosr24awHSCeEWYpqlb+Ci
GmRENICnze17g2+Jj/JNRpKbKovD8WBC0M6sgUd17OSRRVPRpHuESn63BOK0NMsjmRWJtv07TnX0
nkU=
=OlB5
-----END PGP SIGNATURE-----

--------------1xz0sfMD2shsNJuVyRIrZJEo--
