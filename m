Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0782E7AD273
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 09:56:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 268B310E215;
	Mon, 25 Sep 2023 07:56:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C2F510E1CE;
 Mon, 25 Sep 2023 07:56:23 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DD54221846;
 Mon, 25 Sep 2023 07:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1695628581; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=6SNHYuSMfSoXQy5Z3XhTDbcs28+yMHqvRCflRAyCbh4=;
 b=LI8pL0asuaq/Jmz2ZbXVxwRktB/cUa0gScnRXuTmalYwFQyG+oRxXAMbjtAss5nP/HutoC
 SsH5b/apIlnt9zUScTUnAazqsy8RhUEms/b5kUVPMFCEEWI1jp/WUHsA7fHYJuVrXr2cjv
 JdeWqPfkdS2gwSi+f3OEpncg2qr3EL8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1695628581;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=6SNHYuSMfSoXQy5Z3XhTDbcs28+yMHqvRCflRAyCbh4=;
 b=HObIrFItgbmnQ7sLH0rJk/86eU9gkzKa0LwJlW03QJUFA5C3yomtxf3eHV8OiWqXkYL0ij
 fJneX5N8BxR5kGBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9AD1113A67;
 Mon, 25 Sep 2023 07:56:21 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gprpJCU9EWUmSwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 25 Sep 2023 07:56:21 +0000
Message-ID: <dfada165-fccd-43eb-89e9-91e05ff970f2@suse.de>
Date: Mon, 25 Sep 2023 09:56:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] drm/i915: Convert fbdev to DRM client
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com,
 ville.syrjala@linux.intel.com, imre.deak@intel.com,
 tejas.upadhyay@intel.com, javierm@redhat.com, airlied@gmail.com,
 daniel@ffwll.ch
References: <20230925073315.11627-1-tzimmermann@suse.de>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <20230925073315.11627-1-tzimmermann@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------qz6FN9O0vD81QqO09y9RiMCv"
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------qz6FN9O0vD81QqO09y9RiMCv
Content-Type: multipart/mixed; boundary="------------h4PMOlsh0T6BOyDge2W6iljg";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com,
 ville.syrjala@linux.intel.com, imre.deak@intel.com,
 tejas.upadhyay@intel.com, javierm@redhat.com, airlied@gmail.com,
 daniel@ffwll.ch
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Message-ID: <dfada165-fccd-43eb-89e9-91e05ff970f2@suse.de>
Subject: Re: [PATCH 0/7] drm/i915: Convert fbdev to DRM client
References: <20230925073315.11627-1-tzimmermann@suse.de>
In-Reply-To: <20230925073315.11627-1-tzimmermann@suse.de>

--------------h4PMOlsh0T6BOyDge2W6iljg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

VGhpcyBpcyB2ZXJzaW9uIDMgb2YgdGhlIHBhdGNoc2V0Lg0KDQpBbSAyNS4wOS4yMyB1bSAw
OToyNiBzY2hyaWViIFRob21hcyBaaW1tZXJtYW5uOg0KPiBDb252ZXJ0IGk5MTUncyBmYmRl
diBjb2RlIHRvIHN0cnVjdCBkcm1fY2xpZW50LiBSZXBsYWNlcyB0aGUgY3VycmVudA0KPiBh
ZC1ob2MgaW50ZWdyYXRpb24uIFRoZSBjb252ZXJzaW9uIGluY2x1ZGVzIGEgbnVtYmVyIG9m
IGNsZWFudXBzLiBUaGUNCj4gcGF0Y2hzZXQgYWxzbyBlbmFibGVzIHVubG9hZGluZyBvZiBk
cml2ZXIgbW9kdWxlcyB3aXRoIGluLWtlcm5lbCBEUk0NCj4gY2xpZW50czsgYSBmZWF0dXJl
IHJlcXVpcmVkIGJ5IGk5MTUuDQo+IA0KPiBBcyB3aXRoIHRoZSBvdGhlciBkcml2ZXJzJyBm
YmRldiBlbXVsYXRpb24sIGZiZGV2IGluIGk5MTUgaXMgbm93DQo+IGFuIGluLWtlcm5lbCBE
Uk0gY2xpZW50IHRoYXQgcnVucyBhZnRlciB0aGUgRFJNIGRldmljZSBoYXMgYmVlbg0KPiBy
ZWdpc3RlcmVkLiBUaGlzIGFsbG93cyB0byByZW1vdmUgdGhlIGFzeW5jaHJvbm91cyBpbml0
aWFsaXphdGlvbi4NCj4gDQo+IGk5MTUgaXMgdGhlIGxhc3QgZHJpdmVyIHdpdGggYW4gZmJk
ZXYgZW11bGF0aW9uIHRoYXQgaXMgbm90IGJ1aWxkDQo+IHVwb24gc3RydWN0IGRybV9jbGll
bnQuIE9uY2UgcmV2aWV3ZWQsIHRoZSBwYXRjaGVzIHdvdWxkIGlkZWFsbHkgZ28NCj4gaW50
byBkcm0tbWlzYy1uZXh0LCBzbyB0aGF0IHRoZSBvbGQgZmJkZXYgaGVscGVyIGNvZGUgY2Fu
IGJlIHJlbW92ZWQuDQo+IFdlIGNhbiBhbHNvIGF0dGVtcHQgdG8gYWRkIGFkZGl0aW9uYWwg
aW4ta2VybmVsIGNsaWVudHMuIEEgRFJNLWJhc2VkDQo+IGRtZXNnIGxvZyBvciBhIGJvb3Rz
cGxhc2ggYXJlIGNvbW1vbmx5IG1lbnRpb25lZC4gRFJNIGNhbiB0aGVuIHN3aXRjaA0KPiBl
YXNpbHkgYW1vbmcgdGhlIGV4aXN0aW5nIGNsaWVudHMgaWYvd2hlbiByZXF1aXJlZC4NCj4g
DQo+IHYzOg0KPiAJKiBzdXBwb3J0IG1vZHVsZSB1bmxvYWRpbmcgKEphbmksIENJIGJvdCkN
Cj4gCSogYXMgYmVmb3JlLCBzaWxlbnRseSBpZ25vcmUgZGV2aWNlcyB3aXRob3V0IGRpc3Bs
YXlzIChDSSAgYm90KQ0KPiB2MjoNCj4gCSogZml4IGVycm9yIGhhbmRsaW5nIChKYW5pKQ0K
PiAJKiBmaXggbm9uLWZiZGV2IGJ1aWxkcw0KPiAJKiB2YXJpb3VzIG1pbm9yIGZpeGVzIGFu
ZCBjbGVhbnVwcw0KPiANCj4gVGhvbWFzIFppbW1lcm1hbm4gKDcpOg0KPiAgICBkcm0vaTkx
NTogVW5yZWdpc3RlciBpbi1rZXJuZWwgY2xpZW50cw0KPiAgICBkcm0vY2xpZW50OiBEbyBu
b3QgYWNxdWlyZSBtb2R1bGUgcmVmZXJlbmNlDQo+ICAgIGRybS9jbGllbnQ6IEV4cG9ydCBk
cm1fY2xpZW50X2Rldl91bnJlZ2lzdGVyKCkNCj4gICAgZHJtL2k5MTU6IE1vdmUgZmJkZXYg
ZnVuY3Rpb25zDQo+ICAgIGRybS9pOTE1OiBJbml0aWFsaXplIGZiZGV2IERSTSBjbGllbnQg
d2l0aCBjYWxsYmFjayBmdW5jdGlvbnMNCj4gICAgZHJtL2k5MTU6IEltcGxlbWVudCBmYmRl
diBjbGllbnQgY2FsbGJhY2tzDQo+ICAgIGRybS9pOTE1OiBJbXBsZW1lbnQgZmJkZXYgZW11
bGF0aW9uIGFzIGluLWtlcm5lbCBjbGllbnQNCj4gDQo+ICAgZHJpdmVycy9ncHUvZHJtL2Ry
bV9jbGllbnQuYyAgICAgICAgICAgICAgICAgIHwgIDI1ICstDQo+ICAgZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMgIHwgICAxIC0NCj4gICAuLi4vZHJt
L2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5X2RyaXZlci5jICAgfCAgMTkgLS0NCj4gICBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2ZiZGV2LmMgICAgfCAyNTAgKysr
KysrKysrKy0tLS0tLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRl
bF9mYmRldi5oICAgIHwgIDI5ICstDQo+ICAgZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9k
cml2ZXIuYyAgICAgICAgICAgIHwgIDI3ICstDQo+ICAgNiBmaWxlcyBjaGFuZ2VkLCAxNTYg
aW5zZXJ0aW9ucygrKSwgMTk1IGRlbGV0aW9ucygtKQ0KPiANCg0KLS0gDQpUaG9tYXMgWmlt
bWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1
dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVy
ZywgR2VybWFueQ0KR0Y6IEl2byBUb3RldiwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25h
bGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------h4PMOlsh0T6BOyDge2W6iljg--

--------------qz6FN9O0vD81QqO09y9RiMCv
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmURPSUFAwAAAAAACgkQlh/E3EQov+Ch
OQ/+OLN/xGIgOQwpHKolK7lD270+1FjXcRvGcyOZatv7cvvIcV9gn7YnKE1iBDTNVGli5GqDdtFw
ITeeHGcHLTD7/buN59uNULLFSP14sGgv1w0SF/kwfxOGnxsbCvg85Z7M36VypnBaz5VxeSXfWSwB
rDwKtw+KU84R4+b3uFpIpb1+xNk9PjNqQfk3mXOqjl/q/mOFELbAZQJKf8V9rn47ZYKXQAbEO533
BvdFBb/dhat2gZxB2DG8GlSFMaTzGAfHcJ7uo2icUhrLxvao523AGEFGV+G/GG+x/4/77srbRHMv
EKY+/f2hl3+HJIAs+Ju4uiL4dsPwijbhiJsJY6WZ+xV9tmFIOnMJWavpDOwCLKUYm/jeImFtuH0V
c9xcC44qbS9/iCebNIs+j9bOGCEbyVLiX5C9/E1D8BNCCxPQtHCehgoOBo+k5S7N/C838ZmP3XHT
gAL58hxLHNolfySTS7FBbnpgVJtgGEaVv6MO9eG102bEXTYheIGwBjwMyLzWktMlfbmII6/Q++2S
Y+yeU+g8Rbc61YxFWUJnlFClMn471ikANIac9V90oV56b6ANFjvOcxwsvh/6egCCW46jcw3qOhaK
zTejrsK9CSGk4bDf+gQCScu0hr689EY/kZ5l0k2rHs+q9MqOqQZnmObjecL1gRNmS4/WdD4+C3eb
4Bk=
=UXNu
-----END PGP SIGNATURE-----

--------------qz6FN9O0vD81QqO09y9RiMCv--
