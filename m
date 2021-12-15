Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 624E7475B1E
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 15:56:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB11E10E6E4;
	Wed, 15 Dec 2021 14:56:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B57B210E749
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 14:56:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 55EC1212C4;
 Wed, 15 Dec 2021 14:56:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1639580173; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G+NmoIzkZuO4G0g6yPchBpuxaynpXkLFkBnRHBKa+Ok=;
 b=eSuAyy9/xg2ZgqlmtnkmRX5MFEb8SNZpEEuN1U4SGc3ojIzLfkwGkMFfjfNRueMeVDq3w2
 rb5Mu2h10LFiEStgAXVqAzFtzeSNfoo79xkQbettMGK4hRfA3hAdbd2H+ISYW74qZ80sVF
 hvJoxEnxLyb7C2Ih+IB6HHCs6Vi9wYg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1639580173;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G+NmoIzkZuO4G0g6yPchBpuxaynpXkLFkBnRHBKa+Ok=;
 b=lKV2xYu5HGmUf01OXSQOQu2T2zMkhPVg8Xd5XmaVL7aZacDs5v5z6vgswr/vg+mGFvNfDu
 Kj+xG8OZDHIr59Cw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 231E814012;
 Wed, 15 Dec 2021 14:56:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id DmvSBg0CumGUdgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 15 Dec 2021 14:56:13 +0000
Message-ID: <651a182b-8438-0162-3349-ef7b1c9188ae@suse.de>
Date: Wed, 15 Dec 2021 15:56:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v4 1/3] drm/fourcc: Add packed 10bit YUV 4:2:0 format
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20211215091739.135042-1-maxime@cerno.tech>
 <20211215091739.135042-2-maxime@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20211215091739.135042-2-maxime@cerno.tech>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------v6HaPkdnQ97D3jPrO2Ebrn87"
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
Cc: dri-devel@lists.freedesktop.org, Dom Cobley <dom@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------v6HaPkdnQ97D3jPrO2Ebrn87
Content-Type: multipart/mixed; boundary="------------T0PyqYAT1an9lONvyYTbHN87";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>, dri-devel@lists.freedesktop.org
Message-ID: <651a182b-8438-0162-3349-ef7b1c9188ae@suse.de>
Subject: Re: [PATCH v4 1/3] drm/fourcc: Add packed 10bit YUV 4:2:0 format
References: <20211215091739.135042-1-maxime@cerno.tech>
 <20211215091739.135042-2-maxime@cerno.tech>
In-Reply-To: <20211215091739.135042-2-maxime@cerno.tech>

--------------T0PyqYAT1an9lONvyYTbHN87
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTUuMTIuMjEgdW0gMTA6MTcgc2NocmllYiBNYXhpbWUgUmlwYXJkOg0KPiBG
cm9tOiBEYXZlIFN0ZXZlbnNvbiA8ZGF2ZS5zdGV2ZW5zb25AcmFzcGJlcnJ5cGkuY29tPg0K
PiANCj4gQWRkcyBhIGZvcm1hdCB0aGF0IGlzIDMgMTBiaXQgWVVWIDQ6MjowIHNhbXBsZXMg
cGFja2VkIGludG8NCj4gYSAzMmJpdCB3b3JkICh3aXRoIDIgc3BhcmUgYml0cykuDQo+IA0K
PiBTdXBwb3J0ZWQgb24gQnJvYWRjb20gQkNNMjcxMSBjaGlwcy4NCj4gDQo+IFNpZ25lZC1v
ZmYtYnk6IERhdmUgU3RldmVuc29uIDxkYXZlLnN0ZXZlbnNvbkByYXNwYmVycnlwaS5jb20+
DQo+IFNpZ25lZC1vZmYtYnk6IE1heGltZSBSaXBhcmQgPG1heGltZUBjZXJuby50ZWNoPg0K
PiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX2ZvdXJjYy5jICB8ICAzICsrKw0KPiAg
IGluY2x1ZGUvdWFwaS9kcm0vZHJtX2ZvdXJjYy5oIHwgMTEgKysrKysrKysrKysNCj4gICAy
IGZpbGVzIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vZHJtX2ZvdXJjYy5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9mb3Vy
Y2MuYw0KPiBpbmRleCAyNTgzN2IxZDY2MzkuLjA3NzQxYjY3ODc5OCAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2RybV9mb3VyY2MuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX2ZvdXJjYy5jDQo+IEBAIC0yNjksNiArMjY5LDkgQEAgY29uc3Qgc3RydWN0IGRy
bV9mb3JtYXRfaW5mbyAqX19kcm1fZm9ybWF0X2luZm8odTMyIGZvcm1hdCkNCj4gICAJCSAg
Lm51bV9wbGFuZXMgPSAzLCAuY2hhcl9wZXJfYmxvY2sgPSB7IDIsIDIsIDIgfSwNCj4gICAJ
CSAgLmJsb2NrX3cgPSB7IDEsIDEsIDEgfSwgLmJsb2NrX2ggPSB7IDEsIDEsIDEgfSwgLmhz
dWIgPSAwLA0KPiAgIAkJICAudnN1YiA9IDAsIC5pc195dXYgPSB0cnVlIH0sDQo+ICsJCXsg
LmZvcm1hdCA9IERSTV9GT1JNQVRfUDAzMCwgICAgICAgICAgICAuZGVwdGggPSAwLCAgLm51
bV9wbGFuZXMgPSAyLA0KPiArCQkgIC5jaGFyX3Blcl9ibG9jayA9IHsgNCwgOCwgMCB9LCAu
YmxvY2tfdyA9IHsgMywgMywgMCB9LCAuYmxvY2tfaCA9IHsgMSwgMSwgMCB9LA0KPiArCQkg
IC5oc3ViID0gMiwgLnZzdWIgPSAyLCAuaXNfeXV2ID0gdHJ1ZX0sDQo+ICAgCX07DQo+ICAg
DQo+ICAgCXVuc2lnbmVkIGludCBpOw0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2Ry
bS9kcm1fZm91cmNjLmggYi9pbmNsdWRlL3VhcGkvZHJtL2RybV9mb3VyY2MuaA0KPiBpbmRl
eCA3ZjY1MmM5Njg0NWIuLmZjMGMxNDU0ZDI3NSAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS91
YXBpL2RybS9kcm1fZm91cmNjLmgNCj4gKysrIGIvaW5jbHVkZS91YXBpL2RybS9kcm1fZm91
cmNjLmgNCj4gQEAgLTMxNCw2ICszMTQsMTMgQEAgZXh0ZXJuICJDIiB7DQo+ICAgICovDQo+
ICAgI2RlZmluZSBEUk1fRk9STUFUX1AwMTYJCWZvdXJjY19jb2RlKCdQJywgJzAnLCAnMScs
ICc2JykgLyogMngyIHN1YnNhbXBsZWQgQ3I6Q2IgcGxhbmUgMTYgYml0cyBwZXIgY2hhbm5l
bCAqLw0KPiAgIA0KPiArLyogMiBwbGFuZSBZQ2JDcjQyMC4NCj4gKyAqIDMgMTAgYml0IGNv
bXBvbmVudHMgYW5kIDIgcGFkZGluZyBiaXRzIHBhY2tlZCBpbnRvIDQgYnl0ZXMuDQo+ICsg
KiBpbmRleCAwID0gWSBwbGFuZSwgWzMxOjBdIHg6WTI6WTE6WTAgMjoxMDoxMDoxMCBsaXR0
bGUgZW5kaWFuDQo+ICsgKiBpbmRleCAxID0gQ3I6Q2IgcGxhbmUsIFs2MzowXSB4OkNyMjpD
YjI6Q3IxOng6Q2IxOkNyMDpDYjAgWzI6MTA6MTA6MTA6MjoxMDoxMDoxMF0gbGl0dGxlIGVu
ZGlhbg0KPiArICovDQo+ICsjZGVmaW5lIERSTV9GT1JNQVRfUDAzMAkJZm91cmNjX2NvZGUo
J1AnLCAnMCcsICczJywgJzAnKSAvKiAyeDIgc3Vic2FtcGxlZCBDcjpDYiBwbGFuZSAxMCBi
aXRzIHBlciBjaGFubmVsIHBhY2tlZCAqLw0KPiArDQoNCkFja2VkLWJ5OiBUaG9tYXMgWmlt
bWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCg0KQnV0IGhvdyBkbyB5b3Uga25vdyB3
aGljaCBjaGFyYWN0ZXJzIHRvIHVzZSBmb3IgdGhlIDRjYyBjb2RlPyBJcyB0aGVyZSBhIA0K
cmVnaXN0cnkgc29tZXdoZXJlPw0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+ICAgLyog
MyBwbGFuZSBub24tc3Vic2FtcGxlZCAoNDQ0KSBZQ2JDcg0KPiAgICAqIDE2IGJpdHMgcGVy
IGNvbXBvbmVudCwgYnV0IG9ubHkgMTAgYml0cyBhcmUgdXNlZCBhbmQgNiBiaXRzIGFyZSBw
YWRkZWQNCj4gICAgKiBpbmRleCAwOiBZIHBsYW5lLCBbMTU6MF0gWTp4IFsxMDo2XSBsaXR0
bGUgZW5kaWFuDQo+IEBAIC04NTQsNiArODYxLDEwIEBAIGRybV9mb3VyY2NfY2Fub25pY2Fs
aXplX252aWRpYV9mb3JtYXRfbW9kKF9fdTY0IG1vZGlmaWVyKQ0KPiAgICAqIGFuZCBVVi4g
IFNvbWUgU0FORC11c2luZyBoYXJkd2FyZSBzdG9yZXMgVVYgaW4gYSBzZXBhcmF0ZSB0aWxl
ZA0KPiAgICAqIGltYWdlIGZyb20gWSB0byByZWR1Y2UgdGhlIGNvbHVtbiBoZWlnaHQsIHdo
aWNoIGlzIG5vdCBzdXBwb3J0ZWQNCj4gICAgKiB3aXRoIHRoZXNlIG1vZGlmaWVycy4NCj4g
KyAqDQo+ICsgKiBUaGUgRFJNX0ZPUk1BVF9NT0RfQlJPQURDT01fU0FORDEyOF9DT0xfSEVJ
R0hUIG1vZGlmaWVyIGlzIGFsc28NCj4gKyAqIHN1cHBvcnRlZCBmb3IgRFJNX0ZPUk1BVF9Q
MDMwIHdoZXJlIHRoZSBjb2x1bW5zIHJlbWFpbiBhcyAxMjggYnl0ZXMNCj4gKyAqIHdpZGUs
IGJ1dCBhcyB0aGlzIGlzIGEgMTAgYnBwIGZvcm1hdCB0aGF0IHRyYW5zbGF0ZXMgdG8gOTYg
cGl4ZWxzLg0KPiAgICAqLw0KPiAgIA0KPiAgICNkZWZpbmUgRFJNX0ZPUk1BVF9NT0RfQlJP
QURDT01fU0FORDMyX0NPTF9IRUlHSFQodikgXA0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVy
bWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlv
bnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1h
bnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8g
VG90ZXYNCg==

--------------T0PyqYAT1an9lONvyYTbHN87--

--------------v6HaPkdnQ97D3jPrO2Ebrn87
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmG6AgwFAwAAAAAACgkQlh/E3EQov+Am
zA/+II2Ypxh4xk5GAPbAQp42LRRmIml8PfN2p+IiimMdu4zAo50u3uoEHxqq9MMxC4Zby5vW8JPT
w7sbcOebzhARjstClDpfnHRLCclrYugagMOAjKcN4+ivaqHcN+8B5sFrH11Lgf9rSvMmmLViJeHl
k8tpLVfikBOBnDxMjxdnaLw7/D5xd8KbalUFFawspE00ied1/Th3jxYj48I863l9nqdM5IaYBDH0
7rXUjXWz6kMmd58goRvza/myAk36KhvcQoV0vhbTMATVoC8ST4vGH8jQukFNBKwBMkimgG6M9jiM
Qih3iPmCUhEss+qVxVxJbKgXrG8Tizvl1yHc2XDpMSZ7f4PupkgNw+M3hSxq81J9TTvO5szkUwFs
baeiRtucyr7g3fpa3+nw71klfiVRS3kTe4KVkUk2grnBaeUvRxHFZKMuH0CToA1HrioCvtu/fWWl
YpFaJ6jPVWfKvDUMtMY67c6f+JLEkNmK2jAds6v1Tb7ZGDx4ywCqpIkjl4cyKNr3kqU2RbB7diRN
rn+Dum3zy28LKqcVdCKBO+y1sBFd6iYVHthNFf2F8ReFB59IZ3tqS3iHiFpnMduMFY19aibS2cv0
6QBh1O4VOymst0ChuVSofihen2LVTWmOPBoT6RZmidE5XQNeH3Ty2EUpUGHY01UWRj8P1JwxugdQ
8hI=
=mRXJ
-----END PGP SIGNATURE-----

--------------v6HaPkdnQ97D3jPrO2Ebrn87--
