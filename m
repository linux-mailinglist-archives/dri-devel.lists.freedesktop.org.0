Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E117B6163FD
	for <lists+dri-devel@lfdr.de>; Wed,  2 Nov 2022 14:43:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC68E10E492;
	Wed,  2 Nov 2022 13:43:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBF6B10E484
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Nov 2022 13:43:24 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 50F03336C4;
 Wed,  2 Nov 2022 13:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1667396602; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s1NAQMWHMOPSlgsRIgzyJQ56hB7yUlrOTumO8zCz+uA=;
 b=CJvQTsahcWjuwHiGjyzhlMF6ceQgRKOLA7pJ6mGTRfGVtLXJ/sMsqB/3GtQ4Pok4dDS9He
 Dr1r/r5VkN0LGbGzjjnfz29Q22oNaDTpBp4hau3coDUpvf9wx7yq8YHiaSCss5Ys/Wn4Gb
 9d5EA543y73xMkCw+ImmSH/UfllsLtQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1667396602;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s1NAQMWHMOPSlgsRIgzyJQ56hB7yUlrOTumO8zCz+uA=;
 b=HN6nbWN+Gh3D4kz+rjOKQsnRN6hIJKcIaTtbjtt2iyfs6Xhi7H6m+mgXcP7gtC8TLNVKZ8
 jhBv/tDlv9lKU8DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2170E139D3;
 Wed,  2 Nov 2022 13:43:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ZNoNB/pzYmP5QAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 02 Nov 2022 13:43:22 +0000
Message-ID: <45a1e8dd-89c6-7109-4917-9282cb92287f@suse.de>
Date: Wed, 2 Nov 2022 14:43:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2 2/2] drm/ofdrm: Cast error pointers to void __iomem *
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>,
 alexander.stein@ew.tq-group.com, airlied@gmail.com, daniel@ffwll.ch
References: <20221028122229.21780-1-tzimmermann@suse.de>
 <20221028122229.21780-3-tzimmermann@suse.de>
 <ffb09945-5f45-027c-a1b8-cbc56302cc4a@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <ffb09945-5f45-027c-a1b8-cbc56302cc4a@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------449ywNOTp1Uf8VIo99E320fy"
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
Cc: kernel test robot <lkp@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------449ywNOTp1Uf8VIo99E320fy
Content-Type: multipart/mixed; boundary="------------kCCWyHWByahW0YPJVrOMe8zM";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 alexander.stein@ew.tq-group.com, airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, kernel test robot <lkp@intel.com>
Message-ID: <45a1e8dd-89c6-7109-4917-9282cb92287f@suse.de>
Subject: Re: [PATCH v2 2/2] drm/ofdrm: Cast error pointers to void __iomem *
References: <20221028122229.21780-1-tzimmermann@suse.de>
 <20221028122229.21780-3-tzimmermann@suse.de>
 <ffb09945-5f45-027c-a1b8-cbc56302cc4a@redhat.com>
In-Reply-To: <ffb09945-5f45-027c-a1b8-cbc56302cc4a@redhat.com>

--------------kCCWyHWByahW0YPJVrOMe8zM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDIuMTEuMjIgdW0gMTQ6MzYgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IEhlbGxvIFRob21hcywNCj4gDQo+IE9uIDEwLzI4LzIyIDE0OjIyLCBUaG9t
YXMgWmltbWVybWFubiB3cm90ZToNCj4+IENhc3QgZXJyb3IgcG9pbnRlcnMgd2hlbiByZXR1
cm5pbmcgdGhlbSBhcyB2b2lkIF9faW9tZW0gKi4gRml4ZXMNCj4+IGEgbnVtYmVyIG9mIFNw
YXJzZSB3YXJuaW5ncywgc3VjaCBhcyB0aGUgb25lcyBzaG93biBiZWxvdy4NCj4+DQo+PiAu
Li9kcml2ZXJzL2dwdS9kcm0vdGlueS9vZmRybS5jOjQzOTozMTogd2FybmluZzogaW5jb3Jy
ZWN0IHR5cGUgaW4gcmV0dXJuIGV4cHJlc3Npb24gKGRpZmZlcmVudCBhZGRyZXNzIHNwYWNl
cykNCj4+IC4uL2RyaXZlcnMvZ3B1L2RybS90aW55L29mZHJtLmM6NDM5OjMxOiAgICBleHBl
Y3RlZCB2b2lkIFtub2RlcmVmXSBfX2lvbWVtICoNCj4+IC4uL2RyaXZlcnMvZ3B1L2RybS90
aW55L29mZHJtLmM6NDM5OjMxOiAgICBnb3Qgdm9pZCAqDQo+PiAuLi9kcml2ZXJzL2dwdS9k
cm0vdGlueS9vZmRybS5jOjQ0MjozMTogd2FybmluZzogaW5jb3JyZWN0IHR5cGUgaW4gcmV0
dXJuIGV4cHJlc3Npb24gKGRpZmZlcmVudCBhZGRyZXNzIHNwYWNlcykNCj4+IC4uL2RyaXZl
cnMvZ3B1L2RybS90aW55L29mZHJtLmM6NDQyOjMxOiAgICBleHBlY3RlZCB2b2lkIFtub2Rl
cmVmXSBfX2lvbWVtICoNCj4+IC4uL2RyaXZlcnMvZ3B1L2RybS90aW55L29mZHJtLmM6NDQy
OjMxOiAgICBnb3Qgdm9pZCAqDQo+Pg0KPj4gU2VlIFsxXSBmb3IgdGhlIGJ1ZyByZXBvcnQu
DQo+Pg0KPj4gUmVwb3J0ZWQtYnk6IGtlcm5lbCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29t
Pg0KPj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1
c2UuZGU+DQo+PiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9kcmktZGV2ZWwvMjAy
MjEwMjAwMDE2LnlpUXpQSXkwLWxrcEBpbnRlbC5jb20vICMgWzFdDQo+PiAtLS0NCj4+ICAg
ZHJpdmVycy9ncHUvZHJtL3Rpbnkvb2Zkcm0uYyB8IDE2ICsrKysrKysrLS0tLS0tLS0NCj4+
ICAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkNCj4+
DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Rpbnkvb2Zkcm0uYyBiL2RyaXZl
cnMvZ3B1L2RybS90aW55L29mZHJtLmMNCj4+IGluZGV4IDQ0ZjEzYTJiMzcyYmUuLmYxYzMw
MTgyMGQ1NGIgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdGlueS9vZmRybS5j
DQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdGlueS9vZmRybS5jDQo+PiBAQCAtNDM4LDIx
ICs0MzgsMjEgQEAgc3RhdGljIHZvaWQgX19pb21lbSAqZ2V0X2NtYXBfYWRkcmVzc19vZihz
dHJ1Y3Qgb2Zkcm1fZGV2aWNlICpvZGV2LCBzdHJ1Y3QgZGV2aWMNCj4+ICAgCWlmICghYWRk
cl9wKQ0KPj4gICAJCWFkZHJfcCA9IG9mX2dldF9hZGRyZXNzKG9mX25vZGUsIGJhcl9ubywg
Jm1heF9zaXplLCAmZmxhZ3MpOw0KPj4gICAJaWYgKCFhZGRyX3ApDQo+PiAtCQlyZXR1cm4g
RVJSX1BUUigtRU5PREVWKTsNCj4+ICsJCXJldHVybiAodm9pZCBfX2lvbWVtICopRVJSX1BU
UigtRU5PREVWKTsNCj4+ICAgDQo+IA0KPiBUaGVyZSdzIGFuIElPTUVNX0VSUl9QVFIoKSBt
YWNybyBhbHJlYWR5IGZvciB0aGVzZSBjYXNlcy4gSWYgeW91IHVzZQ0KPiB0aGF0IGluc3Rl
YWQsIGZlZWwgZnJlZSB0byBhZGQgbXkgci1iIHdoZW4gcG9zdGluZyB2My4NCg0KVGhhbmtz
IGEgbG90LiBJIHdhcyBsb29raW5nIGZvciBzdWNoIGEgbWFjcm8gYW5kIGNvdWxkbid0IGZp
bmQgaXQuIFNvIA0KaXQncyBpbiBpby5oLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+
IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVy
DQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUs
IDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0K
R2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------kCCWyHWByahW0YPJVrOMe8zM--

--------------449ywNOTp1Uf8VIo99E320fy
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmNic/kFAwAAAAAACgkQlh/E3EQov+Cq
AA/+MALiclu7LiYBA10b2u/2nCmikcu4gPW8IjQhjK0kyPzeYK3A+oRE9sFJrwi6c7z/542xz1UO
CxrRDXd7z1SlstROtNBJI/XhSIL3GvJaFvoDqVz1A1mvxHp36mMicSychA4TpVFRy78zywkqhbhh
17Lq+SlmTFtIMwvtztNGeHP+9otsJ+520H/p1A09l7bZJDrR1d1cCvzE5dlHSQm02K41QxqIUPNZ
C9bS8Igr5wUOAMs1paSnmVVDKjAzjjITgO2BGaFX8dSbz/QDr3Q2+Euw3/w1qlPknPw2NuYpLFNf
RIyckPlKWnmAc8h1u3i9O5ilnysJ29GScsuvEYHKSgYoQkcXXr7dm8ffLMUjd6y2Bz4FQIA067Bv
dq/sjalpSz+e7Tp6K4aV5nxqGkg0SkmYKVkvL2j+h4uucmfYQtrN7ZHM3OAQ63eVBkxHDCrdrd2q
0S0Zl4NMfGFMEvQ7b+TAzo3i0ehHhJZLl3gHWFFaMT+xVDAB76B0t6Sjsedbd8TNt3UU/IGmAX1B
8U61KIc08IrGEf2tvKtx44qK2hKp77izo/9yNGZFmR31MIb8Wgs4auPK6mMS/p4AjO8aEPSdqEX6
hMaL4JpcDsbcZd1MfJWqyJVXaYRatf1IEjOK4mwFnememvtFj41Vy6Sg9xqrCxS6vKAqfy62TuUr
6SI=
=TJ0s
-----END PGP SIGNATURE-----

--------------449ywNOTp1Uf8VIo99E320fy--
