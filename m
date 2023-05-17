Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64783706FDD
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 19:47:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAD5410E20C;
	Wed, 17 May 2023 17:47:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2D3210E20C;
 Wed, 17 May 2023 17:47:10 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7615D1F45E;
 Wed, 17 May 2023 17:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1684345629; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fHNjowhaLLoZBpC4ZFfH2zgzuYacBgeKEoV3uszVXAE=;
 b=ZeZ/+AM8vRg+Av5nl6gjm5QJytA5nWzUChwgD+OgAEPU4Gzk6fhvo7NvO5w8Sdl+G8frm2
 A93OYWg69fDTDDcPx/mWrfVZ8BINL7JYlZTaI/QpVQNJV3CNf1MT/9xJjkPal3T9ewXs/k
 GgjMN0X7Jjiuusthf1vaivNUH0UZwNM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1684345629;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fHNjowhaLLoZBpC4ZFfH2zgzuYacBgeKEoV3uszVXAE=;
 b=tIldufLd7k/U4jPsLoMr9eWqmR39u+KzF66GyJACSFaMc9aOItbLyw/KRkeQO4Y3TJvXf4
 1U15VMqsAWTNeJCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4298E13358;
 Wed, 17 May 2023 17:47:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id RpH5Dh0TZWSoRAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 17 May 2023 17:47:09 +0000
Message-ID: <a214e84a-7613-621f-20d1-64b93a38cb40@suse.de>
Date: Wed, 17 May 2023 19:47:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v5 1/7] drm: fix drmm_mutex_init()
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
References: <20230517152244.348171-1-matthew.auld@intel.com>
 <20230517160523.GA607652@linux.intel.com>
 <dcaf0964-3264-6a35-469d-75ff520d5f6b@intel.com>
 <79df281c4b74ef7de401b6f93ea65301377a5319.camel@linux.intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <79df281c4b74ef7de401b6f93ea65301377a5319.camel@linux.intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------BSXR0lbEAPmyHapLKcVAzCrJ"
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jocelyn Falempe <jfalempe@redhat.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------BSXR0lbEAPmyHapLKcVAzCrJ
Content-Type: multipart/mixed; boundary="------------D1PnTth0qkp3AWvlPHiPtCX4";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
Cc: Jocelyn Falempe <jfalempe@redhat.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>
Message-ID: <a214e84a-7613-621f-20d1-64b93a38cb40@suse.de>
Subject: Re: [PATCH v5 1/7] drm: fix drmm_mutex_init()
References: <20230517152244.348171-1-matthew.auld@intel.com>
 <20230517160523.GA607652@linux.intel.com>
 <dcaf0964-3264-6a35-469d-75ff520d5f6b@intel.com>
 <79df281c4b74ef7de401b6f93ea65301377a5319.camel@linux.intel.com>
In-Reply-To: <79df281c4b74ef7de401b6f93ea65301377a5319.camel@linux.intel.com>

--------------D1PnTth0qkp3AWvlPHiPtCX4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTcuMDUuMjMgdW0gMTk6MDMgc2NocmllYiBUaG9tYXMgSGVsbHN0csO2bToN
Cj4gT24gV2VkLCAyMDIzLTA1LTE3IGF0IDE3OjI5ICswMTAwLCBNYXR0aGV3IEF1bGQgd3Jv
dGU6DQo+PiBPbiAxNy8wNS8yMDIzIDE3OjA1LCBTdGFuaXNsYXcgR3J1c3prYSB3cm90ZToN
Cj4+PiBPbiBXZWQsIE1heSAxNywgMjAyMyBhdCAwNDoyMjozOFBNICswMTAwLCBNYXR0aGV3
IEF1bGQgd3JvdGU6DQo+Pj4+IEluIG11dGV4X2luaXQoKSBsb2NrZGVwIHNlZW1zIHRvIGlk
ZW50aWZ5IGEgbG9jayBieSBkZWZpbmluZyBhDQo+Pj4+IHN0YXRpYw0KPj4+PiBrZXkgZm9y
IGVhY2ggbG9jayBjbGFzcy4gSG93ZXZlciBpZiB3ZSB3cmFwIHRoZSB3aG9sZSB0aGluZyBp
biBhDQo+Pj4+IGZ1bmN0aW9uIHRoZSBzdGF0aWMga2V5IHdpbGwgYmUgdGhlIHNhbWUgZm9y
IGV2ZXJ5dGhpbmcgY2FsbGluZw0KPj4+PiB0aGF0DQo+Pj4+IGZ1bmN0aW9uLCB3aGljaCBs
b29rcyB0byBiZSB0aGUgY2FzZSBmb3IgZHJtbV9tdXRleF9pbml0KCkuIFRoaXMNCj4+Pj4g
dGhlbg0KPj4+PiByZXN1bHRzIGluIGltcG9zc2libGUgbG9ja2RlcCBzcGxhdHMgc2luY2Ug
bG9ja2RlcCB0aGlua3MNCj4+Pj4gY29tcGxldGVseQ0KPj4+PiB1bnJlbGF0ZWQgbG9ja3Mg
YXJlIHRoZSBzYW1lIGxvY2sgY2xhc3MuIFRoZSBvdGhlciBpc3N1ZSBpcyB0aGF0DQo+Pj4+
IHdoZW4NCj4+Pj4gbG9va2luZyBhdCBzcGxhdHMgd2UgbG9zZSB0aGUgYWN0dWFsIGxvY2sg
bmFtZSwgd2hlcmUgaW5zdGVhZCBvZg0KPj4+PiBzZWVpbmcNCj4+Pj4gc29tZXRoaW5nIGxp
a2UgeGUtPm1lbV9hY2Nlc3MubG9jayBmb3IgdGhlIG5hbWUsIHdlIGp1c3Qgc2VlDQo+Pj4+
IHNvbWV0aGluZw0KPj4+PiBnZW5lcmljIGxpa2UgbG9jayM4Lg0KPj4+Pg0KPj4+PiBBdHRl
bXB0IHRvIGZpeCB0aGlzIGJ5IGNvbnZlcnRpbmcgZHJtbV9tdXRleF9pbml0KCkgaW50byBh
IG1hY3JvLA0KPj4+PiB3aGljaA0KPj4+PiBzaG91bGQgZW5zdXJlIHRoYXQgbXV0ZXhfaW5p
dCgpIGJlaGF2ZXMgYXMgZXhwZWN0ZWQuDQo+Pj4NCj4+PiBOaWNlIGNhdGNoIDotKSB3ZSBv
YnNlcnZlZCBsb2NrZGVwIGRlYWRsb2NrIGZhbHNlIGFsYXJtcyB0b28sIGJ1dCBJDQo+Pj4g
Y291bGQNCj4+PiBub3Qgc3BvdCBpdCBvdXQgYW5kIHdlcmUgYWRkaW5nIGxvY2tkZXBfc2V0
X2NsYXNzKGtleSkgdG8gYXZvaWQNCj4+PiB0aG9zZS4NCj4+Pg0KPj4+DQo+Pj4+ICtzdGF0
aWMgaW5saW5lIHZvaWQgX19kcm1tX211dGV4X3JlbGVhc2Uoc3RydWN0IGRybV9kZXZpY2Ug
KmRldiwNCj4+Pj4gdm9pZCAqcmVzKQ0KPj4+DQo+Pj4gQ2FuIHRoaXMgYmUgaW5saW5lIGlm
IHVzZWQgaW4gZHJtbV9hZGRfYWN0aW9uX29yX3Jlc2V0KCkgPw0KPj4NCj4+IEkgdGhpbmsg
c28uIERpZCBJIG1pc3Npbmcgc29tZXRoaW5nIGhlcmU/IEl0IGF0IGxlYXN0IGJ1aWxkcyBm
b3IgbWUuDQo+IA0KPiBJIHRoaW5rIGluIGVhY2ggZmlsZSB0aGF0IGNvbnRhaW5zIGEgZHJt
bV9tdXRleF9pbml0KCksIHRoZSBjb2RlIHdpbGwNCj4gbmVlZCBhIHBvaW50ZXIgdG8gdGhl
IGZ1bmN0aW9uIF9fZHJtbV9tdXRleF9yZWxlYXNlKCkgYW5kIHRoZSBjb21waWxlcg0KPiB3
aWxsIHRoZXJlZm9yZSBuZWVkIHRvIGVtaXQgYSBub24taW5saW5lZCBzdGF0aWMgdmVyc2lv
biBvZiB0aGUNCj4gZnVuY3Rpb24gaW4gdGhhdCBmaWxlLiBOb3Qgc3VyZSBpZiB0aGF0J3Mg
YSBwcm9ibGVtLCB0aG91Z2guIElmIHNvDQo+IGNvdWxkIG1ha2UgaXQgZXh0ZXJuPw0KDQpJ
J2QgcHJlZmVyIHRvIGV4cG9ydCBfX2RybW1fbXV0ZXhfcmVsZWFzZSgpIGZyb20gdGhlIG1v
ZHVsZSBvdmVyIHRoZSANCmN1cnJlbnQgc3RhdGljIGlubGluZS4NCg0KQmVzdCByZWdhcmRz
DQpUaG9tYXMNCg0KPiANCj4gL1Rob21hcw0KPiANCj4gDQo+IA0KPj4NCj4+Pg0KPj4+DQo+
Pj4+ICt7DQo+Pj4+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCBtdXRleCAqbG9jayA9IHJlczsN
Cj4+Pj4gKw0KPj4+PiArwqDCoMKgwqDCoMKgwqBtdXRleF9kZXN0cm95KGxvY2spOw0KPj4+
PiArfQ0KPj4+PiArDQo+Pj4+ICsvKioNCj4+Pj4gKyAqIGRybW1fbXV0ZXhfaW5pdCAtICZk
cm1fZGV2aWNlLW1hbmFnZWQgbXV0ZXhfaW5pdCgpDQo+Pj4+ICsgKiBAZGV2OiBEUk0gZGV2
aWNlDQo+Pj4+ICsgKiBAbG9jazogbG9jayB0byBiZSBpbml0aWFsaXplZA0KPj4+PiArICoN
Cj4+Pj4gKyAqIFJldHVybnM6DQo+Pj4+ICsgKiAwIG9uIHN1Y2Nlc3MsIG9yIGEgbmVnYXRp
dmUgZXJybm8gY29kZSBvdGhlcndpc2UuDQo+Pj4+ICsgKg0KPj4+PiArICogVGhpcyBpcyBh
ICZkcm1fZGV2aWNlLW1hbmFnZWQgdmVyc2lvbiBvZiBtdXRleF9pbml0KCkuIFRoZQ0KPj4+
PiBpbml0aWFsaXplZA0KPj4+PiArICogbG9jayBpcyBhdXRvbWF0aWNhbGx5IGRlc3Ryb3ll
ZCBvbiB0aGUgZmluYWwgZHJtX2Rldl9wdXQoKS4NCj4+Pj4gKyAqLw0KPj4+PiArI2RlZmlu
ZSBkcm1tX211dGV4X2luaXQoZGV2LCBsb2NrKQ0KPj4+PiAoe8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgXA0KPj4+PiArwqDCoMKgwqDCoMKgwqBtdXRleF9pbml0KGxvY2spOw0KPj4+PiAg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcDQo+Pj4+ICvCoMKgwqDCoMKgwqDCoGRybW1fYWRk
X2FjdGlvbl9vcl9yZXNldChkZXYsIF9fZHJtbV9tdXRleF9yZWxlYXNlLA0KPj4+PiBsb2Nr
KTvCoMKgwqDCoMKgwqDCoMKgwqDCoCBcDQo+Pj4+ICt9KQ0KPj4+PiAgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBcDQo+Pj4NCj4+PiBSZWdhcmRzDQo+Pj4gU3RhbmlzbGF3DQo+Pj4NCj4+
Pg0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVs
b3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vuc3Ry
YXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3RldiwgQW5k
cmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5
IChBRyBOdWVybmJlcmcpDQo=

--------------D1PnTth0qkp3AWvlPHiPtCX4--

--------------BSXR0lbEAPmyHapLKcVAzCrJ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmRlExwFAwAAAAAACgkQlh/E3EQov+AX
IQ/9Epcu/DMNd3zfiZIBh9SVNyDV1hiAflZnhCODP63q6ra62ZhUDdSo232pHvYGLYI3g/kYK2F9
Le5+NUkO2kG8sFEMMAZwlg7O8orPXqYWS9K1JmU+bcWMakChO8U53B1dYHcN4Xb7Op9HCUYoGmsS
YP2qPLEB1HEEQ7bO+ytPlZPka5BuzubK8mVHRTv0+/NPvwY/fUlAp02IjbMZKZFDoGpoXdJcKmRB
gCEhTF/j4GlLMIxUHUuUfOtGWko8eUil4p5Zqv4O7UpsUpStglx+I7ag4LsVuX61Xw46/Kbgf/D2
4SQPooCm3ZqeNoJUWlXSldx25141zUBB+tRdKoWX81Hyi9GRUs36JRyF/2dDoPBGqTu1Woshvihd
rK+XxJ1/3gKg3nyMECbDD0JhIwmU7RH+aFiaylquRu5qXJ8ui3V56TklJ8hL/7JLb4RYFkK4c8bJ
Gghxv0R2qjhZLLwN35Uo0jKy4wZSHentXVgrQyhIYRpPUDLCU3rGkoC2x58BYpmYM+koTO6bhw0q
AruDwATm/GnqL+JQ/k70WUhOWN0vgRPfNjVAzSoGs/kdPCsvdsnWxCEzz9PiAmTyEFpImhLDyd1S
eawjAcV77LOcK3FF6YvsOGPuexP7Ianb2CJeX7L7WowxZqpCp8adkzwZw5vjin0QJT9uj3OtCCub
e0Q=
=uhZb
-----END PGP SIGNATURE-----

--------------BSXR0lbEAPmyHapLKcVAzCrJ--
