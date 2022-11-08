Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CF76217CB
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 16:14:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BADC210E47C;
	Tue,  8 Nov 2022 15:14:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16F5710E2AC
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 15:14:18 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C97151F8C9;
 Tue,  8 Nov 2022 15:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1667920456; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SFa+L+j40KudfIfhWwP2nFQZft2sCH1QUD4wO2XHhaA=;
 b=T9FQlq8YEpPSx8vGrV6hhbTYxtVvFQsivt/Q0F5jx927qla5wElWBRBCYEXgB7Q3T4gRPG
 SWtko/RwP91tNWtj7P4IfdialYPbozCiViG6+WB3GHLgS9fHblhypISYwyVpoI9I6Ss5+M
 GxrMA9VBLjRF1qnz5Xha7LidNKO8ORY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1667920456;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SFa+L+j40KudfIfhWwP2nFQZft2sCH1QUD4wO2XHhaA=;
 b=zwqOfG4VJyludN+tA8eAdRqz7H2fswigM3C01nMXUXEWa/f35sHJevad95zpuonacuGnqL
 2qOXJqPntj95PQBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A184413398;
 Tue,  8 Nov 2022 15:14:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0CZ5JkhyamOMTwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 08 Nov 2022 15:14:16 +0000
Message-ID: <8d3c73b8-98ed-60fe-3b5a-ce17a4691561@suse.de>
Date: Tue, 8 Nov 2022 16:14:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH] drm/fb-helper: Fix missing kerneldoc include
Content-Language: en-US
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20221107190928.1212116-1-daniel.vetter@ffwll.ch>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20221107190928.1212116-1-daniel.vetter@ffwll.ch>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------TkHJOD0e3Hkb3px8pJslWFpI"
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Javier Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------TkHJOD0e3Hkb3px8pJslWFpI
Content-Type: multipart/mixed; boundary="------------kFvzERMJLlgaxU0W4iKZuu2N";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Message-ID: <8d3c73b8-98ed-60fe-3b5a-ce17a4691561@suse.de>
Subject: Re: [PATCH] drm/fb-helper: Fix missing kerneldoc include
References: <20221107190928.1212116-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20221107190928.1212116-1-daniel.vetter@ffwll.ch>

--------------kFvzERMJLlgaxU0W4iKZuu2N
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

VGhhbmtzLiBNZXJnZWQgd2l0aCBmaXhlcyBmb3IgdGhlIGZvbGxvd2luZyB3YXJuaW5ncy4N
Cg0KNjZiYTExNTBjMDdlIChIRUFEIC0+IGRybS1taXNjLW5leHQpIGRybS9mYi1oZWxwZXI6
IEZpeCBtaXNzaW5nIA0Ka2VybmVsZG9jIGluY2x1ZGUNCi06NjogRVJST1I6R0lUX0NPTU1J
VF9JRDogUGxlYXNlIHVzZSBnaXQgY29tbWl0IGRlc2NyaXB0aW9uIHN0eWxlIA0KJ2NvbW1p
dCA8MTIrIGNoYXJzIG9mIHNoYTE+ICgiPHRpdGxlIGxpbmU+IiknIC0gaWU6ICdjb21taXQg
OGFiNTlkYTI2YmMwIA0KKCJkcm0vZmItaGVscGVyOiBNb3ZlIGdlbmVyaWMgZmJkZXYgZW11
bGF0aW9uIGludG8gc2VwYXJhdGUgc291cmNlIGZpbGUiKScNCiM2Og0KVGhpcyB3YXMgbG9z
dCBpbiB0aGUgY29kZSBtb3ZlbWVudCBkb25lIGluIDhhYjU5ZGEyNmJjMA0KDQotOjMwOiBX
QVJOSU5HOkZST01fU0lHTl9PRkZfTUlTTUFUQ0g6IEZyb206L1NpZ25lZC1vZmYtYnk6IGVt
YWlsIGFkZHJlc3MgDQptaXNtYXRjaDogJ0Zyb206IERhbmllbCBWZXR0ZXIgPGRhbmllbC52
ZXR0ZXJAZmZ3bGwuY2g+JyAhPSANCidTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxk
YW5pZWwudmV0dGVyQGludGVsLmNvbT4nDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCkFt
IDA3LjExLjIyIHVtIDIwOjA5IHNjaHJpZWIgRGFuaWVsIFZldHRlcjoNCj4gVGhpcyB3YXMg
bG9zdCBpbiB0aGUgY29kZSBtb3ZlbWVudCBkb25lIGluIDhhYjU5ZGEyNmJjMA0KPiAoImRy
bS9mYi1oZWxwZXI6IE1vdmUgZ2VuZXJpYyBmYmRldiBlbXVsYXRpb24gaW50byBzZXBhcmF0
ZSBzb3VyY2UNCj4gZmlsZSIpLg0KPiANCj4gRml4ZXM6IDhhYjU5ZGEyNmJjMCAoImRybS9m
Yi1oZWxwZXI6IE1vdmUgZ2VuZXJpYyBmYmRldiBlbXVsYXRpb24gaW50byBzZXBhcmF0ZSBz
b3VyY2UgZmlsZSIpDQo+IENjOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3Vz
ZS5kZT4NCj4gQ2M6IEphdmllciBNYXJ0aW5leiBDYW5pbGxhcyA8amF2aWVybUByZWRoYXQu
Y29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGlu
dGVsLmNvbT4NCj4gLS0tDQo+ICAgRG9jdW1lbnRhdGlvbi9ncHUvZHJtLWttcy1oZWxwZXJz
LnJzdCB8IDMgKysrDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZ3B1L2RybS1rbXMtaGVscGVycy5yc3Qg
Yi9Eb2N1bWVudGF0aW9uL2dwdS9kcm0ta21zLWhlbHBlcnMucnN0DQo+IGluZGV4IGRiYzg1
ZmQ3YTk3MS4uYTQ4NjBmZmQ2ZTg2IDEwMDY0NA0KPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2dw
dS9kcm0ta21zLWhlbHBlcnMucnN0DQo+ICsrKyBiL0RvY3VtZW50YXRpb24vZ3B1L2RybS1r
bXMtaGVscGVycy5yc3QNCj4gQEAgLTExNiw2ICsxMTYsOSBAQCBmYmRldiBIZWxwZXIgRnVu
Y3Rpb25zIFJlZmVyZW5jZQ0KPiAgIC4uIGtlcm5lbC1kb2M6OiBkcml2ZXJzL2dwdS9kcm0v
ZHJtX2ZiX2hlbHBlci5jDQo+ICAgICAgOmV4cG9ydDoNCj4gICANCj4gKy4uIGtlcm5lbC1k
b2M6OiBkcml2ZXJzL2dwdS9kcm0vZHJtX2ZiZGV2X2dlbmVyaWMuYw0KPiArICAgOmV4cG9y
dDoNCj4gKw0KPiAgIGZvcm1hdCBIZWxwZXIgRnVuY3Rpb25zIFJlZmVyZW5jZQ0KPiAgID09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPiAgIA0KDQotLSANClRob21hcyBa
aW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNv
bHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywg
R2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6
IEl2byBUb3Rldg0K

--------------kFvzERMJLlgaxU0W4iKZuu2N--

--------------TkHJOD0e3Hkb3px8pJslWFpI
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmNqckgFAwAAAAAACgkQlh/E3EQov+BH
OxAAnoXIufr/qf8fyUzKrDiTORHHYSRgayXsX0IN+XOHxneOLWmYF7l6mNZfT3ZLXiby1C8kGp+K
hCrm+sBjMgfG5Rdm54jq6TxmJ7WChw4gzVRRiVzWxZS3eQuOxQyqr57LYjkhkq0XrmXipPa9qdno
o2QeWKNBhYvwMBwEuQARLGlRX9IzA6HSSfqFnq433/k2JvLVSuYUB9Ly7kP9lwNRsMgiUHLYXWkJ
suQeg6uzGcHVs3DYb0qZYmGHwZynEmnRgfECrSwSLXFA++tM2PsO1LpWyPefV/w1o9o8ofl/x819
3fFk4rOighyZG+5hSDRwnXoNLjBt0whibWMBN6SCYsR0t32TR8JSAKLk9F8dc1Ka0h9/JB4+ZDxj
gvwR/djoRm37TxSTrMACj1nv2kZDn/N1OdTVS+UXD9FXYQdHuSjafFLXgFPQxJYQbcRIVm4SjtGR
q6bLXxCD+0uHlLjhQIoy3OsrjudIE2J09JIh4w6O3G+gQxo6PdLlW21DHcj17KwAhaVtSCRbAKkn
vvuom7X9y9PtL55hc/M6gaRrIVmT7DeEVPTloRoZrp/YultbkshGNXmN9M7KNNOaX/Rl0VXeDJKD
odPWQn6z4joAcbskSxwNhwNvKOvIuY6TBP5hB8zCyKUQU1/bp/WHJJ+tSE19wOU92f5XQDsx3QGY
AKo=
=OkdL
-----END PGP SIGNATURE-----

--------------TkHJOD0e3Hkb3px8pJslWFpI--
