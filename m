Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68AA2665CA0
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 14:34:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3447D10E744;
	Wed, 11 Jan 2023 13:34:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 545FA10E749;
 Wed, 11 Jan 2023 13:34:03 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 82136490A;
 Wed, 11 Jan 2023 13:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673444041; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PQfggEzGnvBFeEXWLzjrgSpzQCF+2CjSg9PArVQ0M0w=;
 b=yybNIva1uk5HIOnoeUO/Uelc+4KrelGuK/vjSaYSGL6Ugn7cfnqig0cDcve3VGBfT0RtCp
 5Hro+3T5YHP7xA9TPEIyyO1W8RLPY/Hl4JBwBtPu2og5d+X3D+UA9um6lTRXSNJh7u/Xxl
 7ZtBS0vH2kZLX0uZ0ztahTZ/MfRTBxI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673444041;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PQfggEzGnvBFeEXWLzjrgSpzQCF+2CjSg9PArVQ0M0w=;
 b=rpIIFwSx44H2ghSdyc9Hm/+VwbYAgK1W+ZtPbi5bjOKejsfyrvJ+mRYkL8EHhHvraWb85t
 LIemRSW0Mf5uu2BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 216EB1358A;
 Wed, 11 Jan 2023 13:34:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id brXfBsm6vmMjbwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 11 Jan 2023 13:34:01 +0000
Message-ID: <4e3adb3a-cc08-83fd-68c8-021b16fdc700@suse.de>
Date: Wed, 11 Jan 2023 14:34:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 07/10] drm/amdgpu: Do not include <drm/drm_fb_helper.h>
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 alexander.deucher@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 patrik.r.jakobsson@gmail.com, thierry.reding@gmail.com, sam@ravnborg.org,
 f.fainelli@gmail.com, james.qian.wang@arm.com, liviu.dudau@arm.com
References: <20230111130206.29974-1-tzimmermann@suse.de>
 <20230111130206.29974-8-tzimmermann@suse.de>
 <d92c4dfc-065f-f062-2b0e-0ce9db879d70@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <d92c4dfc-065f-f062-2b0e-0ce9db879d70@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------5xPe7YrKgCBS7By3m63rydwt"
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
Cc: linux-arm-kernel@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------5xPe7YrKgCBS7By3m63rydwt
Content-Type: multipart/mixed; boundary="------------0Z9PQeVWhMxn992GDhJUC3DR";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 alexander.deucher@amd.com, airlied@gmail.com, daniel@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 patrik.r.jakobsson@gmail.com, thierry.reding@gmail.com, sam@ravnborg.org,
 f.fainelli@gmail.com, james.qian.wang@arm.com, liviu.dudau@arm.com
Cc: dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 amd-gfx@lists.freedesktop.org
Message-ID: <4e3adb3a-cc08-83fd-68c8-021b16fdc700@suse.de>
Subject: Re: [PATCH v2 07/10] drm/amdgpu: Do not include <drm/drm_fb_helper.h>
References: <20230111130206.29974-1-tzimmermann@suse.de>
 <20230111130206.29974-8-tzimmermann@suse.de>
 <d92c4dfc-065f-f062-2b0e-0ce9db879d70@amd.com>
In-Reply-To: <d92c4dfc-065f-f062-2b0e-0ce9db879d70@amd.com>

--------------0Z9PQeVWhMxn992GDhJUC3DR
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTEuMDEuMjMgdW0gMTQ6MjEgc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOg0K
PiBBbSAxMS4wMS4yMyB1bSAxNDowMiBzY2hyaWViIFRob21hcyBaaW1tZXJtYW5uOg0KPj4g
SW5jbHVkaW5nIDxkcm0vZHJtX2ZiX2hlbHBlci5oPiBpcyBub3QgcmVxdWlyZWQsIHNvIHJl
bW92ZSB0aGUgaW5jbHVkZQ0KPj4gc3RhdGVtZW50cy4gTm8gZnVuY3Rpb25hbCBjaGFuZ2Vz
Lg0KPiANCj4gUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2Vu
aWdAYW1kLmNvbT4gZm9yIHRoaXMgb25lIGFuZCANCj4gdGhlIHJhZGVvbiBwYXRjaGVzICM5
IGFuZCAjMTAgaW4gdGhpcyBzZXQuDQo+IA0KPiBEbyB5b3Ugd2FudCB0byBwdXNoIHRoZW0g
dG8gZHJtLW1pc2MtbmV4dCBiZWNhdXNlIG9mIHNvbWUgDQo+IGludGVyLWRlcGVuZGVuY2ll
cyBvciBzaG91bGQgSSBwaWNrIHRoZW0gdXAgdGhyb3VnaCBhbWQtc3RhZ2luZy1kcm0tbmV4
dD8NCg0KSSdkIGxpa2UgdG8gdGFrZSB0aGUgd2hvbGUgcGF0Y2hzZXQgdmlhIGRybS1taXNj
LW5leHQuIFRoZSBlYXJsaWVyIE9GIA0KYW5kIGJhY2tsaWdodCBpbmNsdWRlcyBhcmUgcmVx
dWlyZWQgZm9yIHNvbWUgb2YgdGhlIGxhdGVyIHJlbW92YWxzLiBCZXN0IA0KdG8ga2VlcCB0
aGlzIGluIG9uZSBwaWVjZS4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KDQo+IA0KPiBD
aHJpc3RpYW4uDQo+IA0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5u
IDx0emltbWVybWFubkBzdXNlLmRlPg0KPj4gLS0tDQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9kY2VfdjEwXzAuYyB8IDEgLQ0KPj4gwqAgZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvZGNlX3YxMV8wLmMgfCAxIC0NCj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2RjZV92Nl8wLmPCoCB8IDEgLQ0KPj4gwqAgZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvZGNlX3Y4XzAuY8KgIHwgMSAtDQo+PiDCoCA0IGZpbGVzIGNoYW5nZWQsIDQgZGVs
ZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2RjZV92MTBfMC5jIA0KPj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9kY2Vf
djEwXzAuYw0KPj4gaW5kZXggMjQ4ZjFhNGU5MTVmLi5hMjQ1MmZjMzA0YzUgMTAwNjQ0DQo+
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9kY2VfdjEwXzAuYw0KPj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZGNlX3YxMF8wLmMNCj4+IEBAIC0yMSw3
ICsyMSw2IEBADQo+PiDCoMKgICoNCj4+IMKgwqAgKi8NCj4+IC0jaW5jbHVkZSA8ZHJtL2Ry
bV9mYl9oZWxwZXIuaD4NCj4+IMKgICNpbmNsdWRlIDxkcm0vZHJtX2ZvdXJjYy5oPg0KPj4g
wqAgI2luY2x1ZGUgPGRybS9kcm1fdmJsYW5rLmg+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvZGNlX3YxMV8wLmMgDQo+PiBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2RjZV92MTFfMC5jDQo+PiBpbmRleCBjZDljMTkwNjBkODkuLjZhYzY4
MGM0YzZlMiAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Rj
ZV92MTFfMC5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9kY2VfdjEx
XzAuYw0KPj4gQEAgLTIxLDcgKzIxLDYgQEANCj4+IMKgwqAgKg0KPj4gwqDCoCAqLw0KPj4g
LSNpbmNsdWRlIDxkcm0vZHJtX2ZiX2hlbHBlci5oPg0KPj4gwqAgI2luY2x1ZGUgPGRybS9k
cm1fZm91cmNjLmg+DQo+PiDCoCAjaW5jbHVkZSA8ZHJtL2RybV92YmxhbmsuaD4NCj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9kY2VfdjZfMC5jIA0KPj4g
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9kY2VfdjZfMC5jDQo+PiBpbmRleCA3NjMy
M2RlZWNjNTguLjM1NGFlMDljYzlhMiAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2RjZV92Nl8wLmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQv
YW1kZ3B1L2RjZV92Nl8wLmMNCj4+IEBAIC0yMyw3ICsyMyw2IEBADQo+PiDCoCAjaW5jbHVk
ZSA8bGludXgvcGNpLmg+DQo+PiAtI2luY2x1ZGUgPGRybS9kcm1fZmJfaGVscGVyLmg+DQo+
PiDCoCAjaW5jbHVkZSA8ZHJtL2RybV9mb3VyY2MuaD4NCj4+IMKgICNpbmNsdWRlIDxkcm0v
ZHJtX3ZibGFuay5oPg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2RjZV92OF8wLmMgDQo+PiBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2RjZV92
OF8wLmMNCj4+IGluZGV4IDAxY2YzYWIxMTFjYi4uMzM5NzdiMGJhMTlkIDEwMDY0NA0KPj4g
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZGNlX3Y4XzAuYw0KPj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvZGNlX3Y4XzAuYw0KPj4gQEAgLTIxLDcgKzIx
LDYgQEANCj4+IMKgwqAgKg0KPj4gwqDCoCAqLw0KPj4gLSNpbmNsdWRlIDxkcm0vZHJtX2Zi
X2hlbHBlci5oPg0KPj4gwqAgI2luY2x1ZGUgPGRybS9kcm1fZm91cmNjLmg+DQo+PiDCoCAj
aW5jbHVkZSA8ZHJtL2RybV92YmxhbmsuaD4NCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1h
bm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25z
IEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55
DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRv
dGV2DQo=

--------------0Z9PQeVWhMxn992GDhJUC3DR--

--------------5xPe7YrKgCBS7By3m63rydwt
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmO+usgFAwAAAAAACgkQlh/E3EQov+BF
0w//cF9/YZkszQB+S5VKfNga78yvFB1pafwH9JUmr7nkfMRPQ7OyJBhwmevewOnJ/77J5pR4+A7K
W5yoM3VHOPsiJcDA5GJHA8oVKxRPZvBKBsNnnLntj5728DFZwNXLqefkcoFTWmSpLtU0UbeLyTYj
EwBojn7SAHsQ8GwyRQYczxNGWg1Izx/KmW7c7DXtWZ0zX5cKc85qGaxpHhJsKEjFO4S/fiar0luK
xvYF0Xec4O589T/sc5hSXb4kOaRjQYWFT4+t/dJsNYJC7GB/yorkgt4Z70Nq+mf6lgjTXtEpKdau
EXEuG7PG1r8udilhL2ngHAuwInaTF8TRm9uSZdYJWd6/h/3PPRNb4F0BM26OC0tnnIQ5bpk5wdJb
HOVSgr71uVleIFVUhMhILzveHf3QphU+5rWAs12CykiFqjYetaiAz+ZfoGQj7fW2+KBeIEq8rqMU
m+1r1DEygR/joRksarRHlmDL2n9qJHiHVQUXP2ODbZSDAeO1QcWf9RJjcYuKdo6uEEsmJXN6kpQB
eRhtSLh+D785Z5/hx5s+yuoVTTdmRlVgM7DngnPg5P1oo28yElNvCsTzlSif/aul1p/V1LoBLskH
P7D9CzmNlfqyxpf0CJu0U+doZP4TcH4cPxtRBM3RQ5osnxzv0Fw60Kl3fk0x3P+z7Uv4frsfuhjG
SBI=
=MvdK
-----END PGP SIGNATURE-----

--------------5xPe7YrKgCBS7By3m63rydwt--
