Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 671EB65F0A5
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 16:59:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EE1410E74E;
	Thu,  5 Jan 2023 15:59:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 828AD10E74E
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 15:59:16 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0D18A2097C;
 Thu,  5 Jan 2023 15:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1672934355; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=txfOZvjFkGC15abIIH2NuXxsVqcnsP8n5in9ZncCa44=;
 b=ojSiVAsZ5U908KPW1L8IRU9WGnCBmWxNrVIL/bXoLQEGGT8F7o2fU9XIj/Bb9JQA6gWkLs
 qO/5+rh+L8bnAdA8l7TR49H3uKtRbITFUMb9WKTnYGj+tDDGYt2UinOrUT1Rv3gTSmKkik
 3OyodRwfnDiIFnAYc1MrNncKFR8ji4Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1672934355;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=txfOZvjFkGC15abIIH2NuXxsVqcnsP8n5in9ZncCa44=;
 b=l7RghaXJ/JSSKq/DPWEET2eeVt4cWQnSobWG7CCJKZpFAywN3aYhFQuougPYhigHXqWoLs
 zLBeG/J6aRCbNPDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CA6C713338;
 Thu,  5 Jan 2023 15:59:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ChwzMNLztmO/OQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 05 Jan 2023 15:59:14 +0000
Message-ID: <7a557b92-a243-9a34-0baf-78a7a47ba7e1@suse.de>
Date: Thu, 5 Jan 2023 16:59:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] drm/gem: Check for valid formats
Content-Language: en-US
To: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>,
 Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230103125322.855089-1-mcanal@igalia.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230103125322.855089-1-mcanal@igalia.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------l8GLNue7XzbGA2EPI2cAbdi1"
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
Cc: Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------l8GLNue7XzbGA2EPI2cAbdi1
Content-Type: multipart/mixed; boundary="------------pOW7rgEspH0oUabKnup3dnnw";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>,
 Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Melissa Wen <mwen@igalia.com>, =?UTF-8?Q?Andr=c3=a9_Almeida?=
 <andrealmeid@igalia.com>, dri-devel@lists.freedesktop.org
Message-ID: <7a557b92-a243-9a34-0baf-78a7a47ba7e1@suse.de>
Subject: Re: [PATCH] drm/gem: Check for valid formats
References: <20230103125322.855089-1-mcanal@igalia.com>
In-Reply-To: <20230103125322.855089-1-mcanal@igalia.com>

--------------pOW7rgEspH0oUabKnup3dnnw
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDMuMDEuMjMgdW0gMTM6NTMgc2NocmllYiBNYcOtcmEgQ2FuYWw6DQo+IEN1
cnJlbnRseSwgZHJtX2dlbV9mYl9jcmVhdGUoKSBkb2Vzbid0IGNoZWNrIGlmIHRoZSBwaXhl
bCBmb3JtYXQgaXMNCj4gc3VwcG9ydGVkLCB3aGljaCBjYW4gbGVhZCB0byB0aGUgYWNjZXB0
YW5jZSBvZiBpbnZhbGlkIHBpeGVsIGZvcm1hdHMNCj4gZS5nLiB0aGUgYWNjZXB0YW5jZSBv
ZiBpbnZhbGlkIG1vZGlmaWVycy4gVGhlcmVmb3JlLCBhZGQgYSBjaGVjayBmb3INCj4gdmFs
aWQgZm9ybWF0cyBvbiBkcm1fZ2VtX2ZiX2NyZWF0ZSgpLg0KPiANCj4gTW9yZW92ZXIsIG5v
dGUgdGhhdCB0aGlzIGNoZWNrIGlzIG9ubHkgdmFsaWQgZm9yIGF0b21pYyBkcml2ZXJzLA0K
PiBiZWNhdXNlLCBmb3Igbm9uLWF0b21pYyBkcml2ZXJzLCBjaGVja2luZyBkcm1fYW55X3Bs
YW5lX2hhc19mb3JtYXQoKSBpcw0KPiBub3QgcG9zc2libGUgc2luY2UgdGhlIGZvcm1hdCBs
aXN0IGZvciB0aGUgcHJpbWFyeSBwbGFuZSBpcyBmYWtlLCBhbmQNCj4gd2UnZCB0aGVyZWZv
ciByZWplY3QgdmFsaWQgZm9ybWF0cy4NCj4gDQo+IFN1Z2dlc3RlZC1ieTogVGhvbWFzIFpp
bW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+IFNpZ25lZC1vZmYtYnk6IE1hw61y
YSBDYW5hbCA8bWNhbmFsQGlnYWxpYS5jb20+DQo+IC0tLQ0KPiAgIERvY3VtZW50YXRpb24v
Z3B1L3RvZG8ucnN0ICAgICAgICAgICAgICAgICAgIHwgNyArKy0tLS0tDQo+ICAgZHJpdmVy
cy9ncHUvZHJtL2RybV9nZW1fZnJhbWVidWZmZXJfaGVscGVyLmMgfCA5ICsrKysrKysrKw0K
PiAgIDIgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkN
Cj4gDQo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdCBiL0RvY3Vt
ZW50YXRpb24vZ3B1L3RvZG8ucnN0DQo+IGluZGV4IDFmOGE1ZWJlMTg4ZS4uNjhiZGFmYTAy
ODRmIDEwMDY0NA0KPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdA0KPiArKysg
Yi9Eb2N1bWVudGF0aW9uL2dwdS90b2RvLnJzdA0KPiBAQCAtMjc2LDExICsyNzYsOCBAQCBW
YXJpb3VzIGhvbGQtdXBzOg0KPiAgIC0gTmVlZCB0byBzd2l0Y2ggdG8gZHJtX2ZiZGV2X2dl
bmVyaWNfc2V0dXAoKSwgb3RoZXJ3aXNlIGEgbG90IG9mIHRoZSBjdXN0b20gZmINCj4gICAg
IHNldHVwIGNvZGUgY2FuJ3QgYmUgZGVsZXRlZC4NCj4gICANCj4gLS0gTWFueSBkcml2ZXJz
IHdyYXAgZHJtX2dlbV9mYl9jcmVhdGUoKSBvbmx5IHRvIGNoZWNrIGZvciB2YWxpZCBmb3Jt
YXRzLiBGb3INCj4gLSAgYXRvbWljIGRyaXZlcnMgd2UgY291bGQgY2hlY2sgZm9yIHZhbGlk
IGZvcm1hdHMgYnkgY2FsbGluZw0KPiAtICBkcm1fcGxhbmVfY2hlY2tfcGl4ZWxfZm9ybWF0
KCkgYWdhaW5zdCBhbGwgcGxhbmVzLCBhbmQgcGFzcyBpZiBhbnkgcGxhbmUNCj4gLSAgc3Vw
cG9ydHMgdGhlIGZvcm1hdC4gRm9yIG5vbi1hdG9taWMgdGhhdCdzIG5vdCBwb3NzaWJsZSBz
aW5jZSBsaWtlIHRoZSBmb3JtYXQNCj4gLSAgbGlzdCBmb3IgdGhlIHByaW1hcnkgcGxhbmUg
aXMgZmFrZSBhbmQgd2UnZCB0aGVyZWZvciByZWplY3QgdmFsaWQgZm9ybWF0cy4NCj4gKy0g
TmVlZCB0byBzd2l0Y2ggdG8gZHJtX2dlbV9mYl9jcmVhdGUoKSwgYXMgbm93IGRybV9nZW1f
ZmJfY3JlYXRlKCkgY2hlY2tzIGZvcg0KPiArICB2YWxpZCBmb3JtYXRzIGZvciBhdG9taWMg
ZHJpdmVycy4NCj4gICANCj4gICAtIE1hbnkgZHJpdmVycyBzdWJjbGFzcyBkcm1fZnJhbWVi
dWZmZXIsIHdlJ2QgbmVlZCBhIGVtYmVkZGluZyBjb21wYXRpYmxlDQo+ICAgICB2ZXJzaW9u
IG9mIHRoZSB2YXJpb3MgZHJtX2dlbV9mYl9jcmVhdGUgZnVuY3Rpb25zLiBNYXliZSBjYWxs
ZWQNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX2ZyYW1lYnVmZmVy
X2hlbHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fZnJhbWVidWZmZXJfaGVscGVy
LmMNCj4gaW5kZXggZTkzNTMzYjg2MDM3Li5iOGE2MTVhMTM4Y2QgMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX2ZyYW1lYnVmZmVyX2hlbHBlci5jDQo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX2ZyYW1lYnVmZmVyX2hlbHBlci5jDQo+IEBAIC05
LDYgKzksNyBAQA0KPiAgICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4NCj4gICANCj4gICAj
aW5jbHVkZSA8ZHJtL2RybV9kYW1hZ2VfaGVscGVyLmg+DQo+ICsjaW5jbHVkZSA8ZHJtL2Ry
bV9kcnYuaD4NCj4gICAjaW5jbHVkZSA8ZHJtL2RybV9mb3VyY2MuaD4NCj4gICAjaW5jbHVk
ZSA8ZHJtL2RybV9mcmFtZWJ1ZmZlci5oPg0KPiAgICNpbmNsdWRlIDxkcm0vZHJtX2dlbS5o
Pg0KPiBAQCAtMTY0LDYgKzE2NSwxNCBAQCBpbnQgZHJtX2dlbV9mYl9pbml0X3dpdGhfZnVu
Y3Moc3RydWN0IGRybV9kZXZpY2UgKmRldiwNCj4gICAJCXJldHVybiAtRUlOVkFMOw0KPiAg
IAl9DQo+ICAgDQo+ICsJaWYgKGRybV9kcnZfdXNlc19hdG9taWNfbW9kZXNldChkZXYpICYm
DQo+ICsJICAgICFkcm1fYW55X3BsYW5lX2hhc19mb3JtYXQoZGV2LCBtb2RlX2NtZC0+cGl4
ZWxfZm9ybWF0LA0KPiArCQkJCSAgICAgIG1vZGVfY21kLT5tb2RpZmllclswXSkpIHsNCj4g
KwkJZHJtX2RiZyhkZXYsICJVbnN1cHBvcnRlZCBwaXhlbCBmb3JtYXQgJXA0Y2MgLyBtb2Rp
ZmllciAweCVsbHhcbiIsDQo+ICsJCQkmbW9kZV9jbWQtPnBpeGVsX2Zvcm1hdCwgbW9kZV9j
bWQtPm1vZGlmaWVyWzBdKTsNCg0KR2l2ZW4gRGFuaWVsJ3MgY29tbWVudCBvbiBtb2RpZmll
clswXSwgcGxlYXNlIGNoYW5nZSB0aGlzIGNvbW1lbnQgdG8gDQpkcm1fZGJnX2ttcygpIGFu
ZCB5b3UgY2FuDQoNClJldmlld2VkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1h
bm5Ac3VzZS5kZT4NCg0KdG8gdGhpcyBwYXRjaC4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMN
Cg0KPiArCQlyZXR1cm4gLUVJTlZBTDsNCj4gKwl9DQo+ICsNCj4gICAJZm9yIChpID0gMDsg
aSA8IGluZm8tPm51bV9wbGFuZXM7IGkrKykgew0KPiAgIAkJdW5zaWduZWQgaW50IHdpZHRo
ID0gbW9kZV9jbWQtPndpZHRoIC8gKGkgPyBpbmZvLT5oc3ViIDogMSk7DQo+ICAgCQl1bnNp
Z25lZCBpbnQgaGVpZ2h0ID0gbW9kZV9jbWQtPmhlaWdodCAvIChpID8gaW5mby0+dnN1YiA6
IDEpOw0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxv
cGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIu
IDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJn
KQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------pOW7rgEspH0oUabKnup3dnnw--

--------------l8GLNue7XzbGA2EPI2cAbdi1
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmO289IFAwAAAAAACgkQlh/E3EQov+D0
IA//b2aekRrVP0DbrMF2rxkfCNJs2PCSpEcWfS3M3p1m9FOMKiqyBHMOUk3ZoEKMdIlPcxAMOYwv
l/4GDSuxoA3Qez3GtFtL+w5ViLZxcLqP+3rhWdQ2EZ9nwDjBPxJ29aMCDpN/GjUpJzFA0K7DnrMJ
8Qk0gI4v8mIbLZwwOWRYvZ9USLPfTmSs/46mMD4zMnuW0yKiAwO1cT/KZvthsbHa5CkLWCxtlL6J
DPixtk0Lu8e5jXFtiUi5ec/Vd2jZMps6V0DzFVjJUgU4rYhlByd6Gy3O2c2TtcWMENy8pWRZOjbm
QKoHZjKEdE6ECMy/h49zbj+ZNRUJmTfL8VL2Iwe2gNRpejCStBp5tLIMM6lpMzPGjnnBqr1Sqitj
haJ+TecoYqQPSEBb6Q+nEVN3wbJ5wR/3mplDf2rgGSLsBDI1So42qnXVXfIzsn2/OmxdUQCI4rjR
UxWLcS1/kfZJ8H3To1xxA/cKfkQkLNw4wZJHMTW3pxukqj+72zsS+Mpf+JZUmy0Ce6Wn+FQcPfPO
XK/irI6A5h77DNNZ3V9gA/TBwKdK4AOD9RLD1jNXO4/GrXYN7EmdSCEOZKIutwEiHrCnp5ZyhDD/
s9QkztEzHGOUqTo9Zc2F4JCKMaS/NeSk9kOGyQJyaMGeJtba2G645OpDVKbyoIDPVrBudoieeDre
QzQ=
=GhZd
-----END PGP SIGNATURE-----

--------------l8GLNue7XzbGA2EPI2cAbdi1--
