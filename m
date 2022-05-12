Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E212552468C
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 09:11:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7E7F10ED7F;
	Thu, 12 May 2022 07:11:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9116210ED64;
 Thu, 12 May 2022 07:11:29 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 208BF218CE;
 Thu, 12 May 2022 07:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1652339488; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Alzshpl205idQoQ6PhCFMgtKn9gTfUtzVsAVfrg0Ww8=;
 b=rekDtlQ/B9IOZ/UONnhTyRY6Tlic3fXrcCS5jIu2R8mmlY5wtAL0onjED2Ejhye2rxVSzL
 5OGn4BmHp8OxD6sp5aIMDws4aTQlRZvDEKOrCq8mKOpGDd0Uk07aUVfYg7thzVTL0nGHGy
 57ANjN8JTXLCn4jcL3Yw34Bwy/9zcZc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1652339488;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Alzshpl205idQoQ6PhCFMgtKn9gTfUtzVsAVfrg0Ww8=;
 b=AlAq8Y3EumZ1CTdVPkJT3yqLPqhg6R+DsNxwB6ZI6fY7cU/eX6375KR8lJEd3gJd+JAddn
 s1ldNTvtexoi/dAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E091B13A97;
 Thu, 12 May 2022 07:11:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id UKnqNR+zfGK4XwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 12 May 2022 07:11:27 +0000
Message-ID: <55aa43cf-af3c-57a9-e0ea-6842faa398d9@suse.de>
Date: Thu, 12 May 2022 09:11:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] drm/amdgpu: Add 'modeset' module parameter
Content-Language: en-US
To: Lyude Paul <lyude@redhat.com>, amd-gfx@lists.freedesktop.org
References: <20220511181935.810735-1-lyude@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220511181935.810735-1-lyude@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------FZwWpDiFwmiT5DnsNYDROntA"
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Solomon Chiu <solomon.chiu@amd.com>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------FZwWpDiFwmiT5DnsNYDROntA
Content-Type: multipart/mixed; boundary="------------G7mzNB08qr3M6k8RramPpjV0";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Lyude Paul <lyude@redhat.com>, amd-gfx@lists.freedesktop.org
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Solomon Chiu <solomon.chiu@amd.com>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <55aa43cf-af3c-57a9-e0ea-6842faa398d9@suse.de>
Subject: Re: [PATCH] drm/amdgpu: Add 'modeset' module parameter
References: <20220511181935.810735-1-lyude@redhat.com>
In-Reply-To: <20220511181935.810735-1-lyude@redhat.com>

--------------G7mzNB08qr3M6k8RramPpjV0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTEuMDUuMjIgdW0gMjA6MTkgc2NocmllYiBMeXVkZSBQYXVsOg0KPiBNYW55
IERSTSBkcml2ZXJzIGZlYXR1cmUgYSAnbW9kZXNldCcgYXJndW1lbnQsIHdoaWNoIGNhbiBi
ZSB1c2VkIHRvDQo+IGVuYWJsZS9kaXNhYmxlIHRoZSBlbnRpcmUgZHJpdmVyIChhcyBvcHBv
c2VkIHRvIHBhc3Npbmcgbm9tb2Rlc2V0IHRvIHRoZQ0KPiBrZXJuZWwsIHdoaWNoIHdvdWxk
IGRpc2FibGUgbW9kZXNldHRpbmcgZ2xvYmFsbHkgYW5kIG1ha2UgaXQgZGlmZmljdWx0IHRv
DQo+IGxvYWQgYW1kZ3B1IGFmdGVyd2FyZHMpLiBBcHBhcmVudGx5IGFtZGdwdSBpcyBhY3R1
YWxseSBtaXNzaW5nIHRoaXMNCj4gaG93ZXZlciwgc28gbGV0J3MgYWRkIGl0IQ0KDQpXZSBo
YXZlIHJlY2VudGx5IGNvbnNvbGlkYXRlZCB0aGUgaGFuZGxpbmcgb2YgdGhlIG1vZGVzZXQg
cGFyYW1ldGVyIGluIA0KdGhlIG1hY3JvIGRybV9tb2R1bGVfcGNpX2RyaXZlcl9pZl9tb2Rl
c2V0KCksIFsxXSAgd2hpY2ggaGFzIGEgDQpkZXByZWNhdGlvbiB3YXJuaW5nIGluIHRoZSBk
b2NzLiBPbmx5IGEgZmV3IG9sZGVyIGRyaXZlcnMgdXNlIG1vZGVzZXQgDQphbmQgd2UgZG9u
J3Qgd2FudCB0byB1c2UgaXQgZnVydGhlci4NCg0KQmV0dGVyIGFsdGVybmF0aXZlcyBhcmUg
bm9tb2Rlc2V0IG9yIGluaXRjYWxsX2JsYWNrbGlzdD1hbWRncHVfaW5pdC4NCg0KQmVzdCBy
ZWdhcmRzDQpUaG9tYXMNCg0KWzFdIA0KaHR0cHM6Ly9jZ2l0LmZyZWVkZXNrdG9wLm9yZy9k
cm0vZHJtLXRpcC90cmVlL2luY2x1ZGUvZHJtL2RybV9tb2R1bGUuaCNuNzkNCg0KPiANCj4g
S2VlcCBpbiBtaW5kIHRoYXQgdGhpcyBjdXJyZW50bHkganVzdCBsZXRzIG9uZSBlbmFibGUg
b3IgZGlzYWJsZSBhbWRncHUsIEkNCj4gaGF2ZW4ndCBib3RoZXJlZCBhZGRpbmcgYSBoZWFk
bGVzcyBtb2RlIGxpa2Ugbm91dmVhdSBoYXMgLSBob3dldmVyIEknbSBzdXJlDQo+IHNvbWVv
bmUgZWxzZSBjYW4gYWRkIHRoaXMgaWYgbmVlZGVkLg0KPiANCj4gU2lnbmVkLW9mZi1ieTog
THl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2Rydi5jIHwgMTQgKysrKysrKysrKysrKysNCj4gICAx
IGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9kcnYuYw0KPiBpbmRleCBlYmQzN2ZiMTljZGIuLjI0ZTZm
YjQ1MTdjYyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2Rydi5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9k
cnYuYw0KPiBAQCAtODcyLDYgKzg3MiwxNSBAQCBNT0RVTEVfUEFSTV9ERVNDKHNtdV9wcHRh
YmxlX2lkLA0KPiAgIAkic3BlY2lmeSBwcHRhYmxlIGlkIHRvIGJlIHVzZWQgKC0xID0gYXV0
byhkZWZhdWx0KSB2YWx1ZSwgMCA9IHVzZSBwcHRhYmxlIGZyb20gdmJpb3MsID4gMCA9IHNv
ZnQgcHB0YWJsZSBpZCkiKTsNCj4gICBtb2R1bGVfcGFyYW1fbmFtZWQoc211X3BwdGFibGVf
aWQsIGFtZGdwdV9zbXVfcHB0YWJsZV9pZCwgaW50LCAwNDQ0KTsNCj4gICANCj4gKy8qKg0K
PiArICogRE9DOiBtb2Rlc2V0IChpbnQpDQo+ICsgKiBVc2VkIHRvIGVuYWJsZS9kaXNhYmxl
IG1vZGVzZXR0aW5nIGZvciBhbWRncHUgZXhjbHVzaXZlbHkuDQo+ICsgKi8NCj4gK2Jvb2wg
YW1kZ3B1X2VuYWJsZV9tb2Rlc2V0ID0gdHJ1ZTsNCj4gK01PRFVMRV9QQVJNX0RFU0MobW9k
ZXNldCwNCj4gKwkJICJFbmFibGUgb3IgZGlzYWJsZSBkaXNwbGF5IGRyaXZlciAoMSA9IG9u
IChkZWZhdWx0KSwgMCA9IG9mZiIpOw0KPiArbW9kdWxlX3BhcmFtX25hbWVkKG1vZGVzZXQs
IGFtZGdwdV9lbmFibGVfbW9kZXNldCwgYm9vbCwgMDQ0NCk7DQo+ICsNCj4gICAvKiBUaGVz
ZSBkZXZpY2VzIGFyZSBub3Qgc3VwcG9ydGVkIGJ5IGFtZGdwdS4NCj4gICAgKiBUaGV5IGFy
ZSBzdXBwb3J0ZWQgYnkgdGhlIG1hY2g2NCwgcjEyOCwgcmFkZW9uIGRyaXZlcnMNCj4gICAg
Ki8NCj4gQEAgLTIwMDMsNiArMjAxMiwxMSBAQCBzdGF0aWMgaW50IGFtZGdwdV9wY2lfcHJv
YmUoc3RydWN0IHBjaV9kZXYgKnBkZXYsDQo+ICAgCWJvb2wgaXNfZndfZmI7DQo+ICAgCXJl
c291cmNlX3NpemVfdCBiYXNlLCBzaXplOw0KPiAgIA0KPiArCWlmICghYW1kZ3B1X2VuYWJs
ZV9tb2Rlc2V0KSB7DQo+ICsJCURSTV9JTkZPKCJtb2Rlc2V0PTAgcGFzc2VkIHRvIGFtZGdw
dSwgZHJpdmVyIHdpbGwgbm90IGJlIGVuYWJsZWRcbiIpOw0KPiArCQlyZXR1cm4gLUVOT0RF
VjsNCj4gKwl9DQo+ICsNCj4gICAJLyogc2tpcCBkZXZpY2VzIHdoaWNoIGFyZSBvd25lZCBi
eSByYWRlb24gKi8NCj4gICAJZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJWkUoYW1kZ3B1X3Vu
c3VwcG9ydGVkX3BjaWlkbGlzdCk7IGkrKykgew0KPiAgIAkJaWYgKGFtZGdwdV91bnN1cHBv
cnRlZF9wY2lpZGxpc3RbaV0gPT0gcGRldi0+ZGV2aWNlKQ0KDQotLSANClRob21hcyBaaW1t
ZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0
aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2Vy
bWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2
byBUb3Rldg0K

--------------G7mzNB08qr3M6k8RramPpjV0--

--------------FZwWpDiFwmiT5DnsNYDROntA
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJ8sx8FAwAAAAAACgkQlh/E3EQov+DG
QQ//STXF3Nwv+I5ztWXkBl2yfm1R1sdEPuRdBF4jIzz5Rk99SmkdwqNKOeNtipslkDEvO2xT9gZI
gahSaQnm1nMwaRBu6Aof8pCOK2ZucchYp1ZsH8v7xdJ1Qv/6WvuJanHMZUdAm4Sc8fMjTz446eiQ
b0M2w0ryFmmxcNUWZtvGNEw2dUyt17Bq86Y+9QcD5cWP1vLpePpiu4/0QXh4IsmIYiReKZPD2UAy
y+eEZ1OfZjEWidad4Uo0J/4GVD1bTy2TgPXWjdRXSQgnf4NgTmuB141n5GoYFKjwBfWqXQHjHl/h
8o29EQ7uM5eXFpbKi1esDY0Mt1nTQkKlKXH1Dw7mceGrQTnD03xnLm3V0dlWsjlQ4CnvvJfFDw3v
lOWDoyZ+HpZas6j8FvblSKS9KD4YnWOH9RvAxFQYFIFtXIcGt5PTfhQ2zrWT1QmpTEbvYaqEqRvp
o+vTNdJ7KW6luhdvmuFE+mFcoS//vUJWvofUeS+2cP8LbmT/0Yygc4zKHIyCRiYsaukUOtVMvJ4j
jKocckU/YHGXUSvpnJ5sXcnTXtCrB98X++CuYkEDO+Ub+lxYW5VXgnEpNxmTXsB33h3Bs+TJl3vl
GPEbOms4ATOeAGjgoDiN+VekCAl72B9rJJ98bM/2gbpxSQF50uRkM20j3tPSsEGhCkmnEa+XnN6u
hAA=
=pFEA
-----END PGP SIGNATURE-----

--------------FZwWpDiFwmiT5DnsNYDROntA--
