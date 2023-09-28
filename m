Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 732B07B1644
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 10:45:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55A9610E0ED;
	Thu, 28 Sep 2023 08:45:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E36310E0ED
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 08:45:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1413C1F45A;
 Thu, 28 Sep 2023 08:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1695890712; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=mJJePIUjgwoVlbfC3Gq2ikxYJSFCYErdPYUQ1KJhkX0=;
 b=p6iiAa4cXWsrG02uuHIaGHxYLi3sX+PuuXpO6eFY3CTexgbOvej827Ioj783IP520U0vYj
 vQB/ZcObWYUuLNBMqGML9vqlZXkoJtCnCm3U8Z5vmDLhCNx7Fll9Z3LPR1Qd4RAbAlrIEH
 3JQWDy7RsJnjAEaq4cfvu8nWLPzsjXQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1695890712;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=mJJePIUjgwoVlbfC3Gq2ikxYJSFCYErdPYUQ1KJhkX0=;
 b=04f3Uel3WkpxHoG4z15+IH1XV1pGT0GCztXPWxpYEenBOzf0T7zbHHAeuDLVznFYkEvRwV
 Oe324WqzLuyi+7AQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DC384138E9;
 Thu, 28 Sep 2023 08:45:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 8sa+NBc9FWU9VQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 28 Sep 2023 08:45:11 +0000
Message-ID: <552d5945-6156-4a48-8e09-798438efeb7b@suse.de>
Date: Thu, 28 Sep 2023 10:45:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] drm/format-helper: Export
 drm_fb_xrgb8888_to_rgb565_line
Content-Language: en-US
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 daniel@ffwll.ch, javierm@redhat.com, bluescreen_avenger@verizon.net
References: <20230927172849.193996-1-jfalempe@redhat.com>
 <20230927172849.193996-2-jfalempe@redhat.com>
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
In-Reply-To: <20230927172849.193996-2-jfalempe@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------uohgOyH6HydLG9gcRU2XFvDh"
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
Cc: gpiccoli@igalia.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------uohgOyH6HydLG9gcRU2XFvDh
Content-Type: multipart/mixed; boundary="------------9cUFQrRl9v6Yp80NsxtgSFOI";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 daniel@ffwll.ch, javierm@redhat.com, bluescreen_avenger@verizon.net
Cc: gpiccoli@igalia.com
Message-ID: <552d5945-6156-4a48-8e09-798438efeb7b@suse.de>
Subject: Re: [PATCH v3 1/3] drm/format-helper: Export
 drm_fb_xrgb8888_to_rgb565_line
References: <20230927172849.193996-1-jfalempe@redhat.com>
 <20230927172849.193996-2-jfalempe@redhat.com>
In-Reply-To: <20230927172849.193996-2-jfalempe@redhat.com>

--------------9cUFQrRl9v6Yp80NsxtgSFOI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjcuMDkuMjMgdW0gMTk6MjIgc2NocmllYiBKb2NlbHluIEZhbGVtcGU6DQo+
IGRybV9wYW5pYyB3aWxsIG5lZWQgdGhlIGxvdy1sZXZlbCBkcm1fZmJfeHh4eF9saW5lIGZ1
bmN0aW9ucy4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEpvY2VseW4gRmFsZW1wZSA8amZhbGVt
cGVAcmVkaGF0LmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9mb3JtYXRf
aGVscGVyLmMgfCAzICsrLQ0KPiAgIGluY2x1ZGUvZHJtL2RybV9mb3JtYXRfaGVscGVyLmgg
ICAgIHwgMiArKw0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9mb3Jt
YXRfaGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Zvcm1hdF9oZWxwZXIuYw0KPiBp
bmRleCBmOTNhNGVmY2VlOTAuLmUyZDNiYzI3MDdlYSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2RybV9mb3JtYXRfaGVscGVyLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L2RybV9mb3JtYXRfaGVscGVyLmMNCj4gQEAgLTMyMCw3ICszMjAsNyBAQCB2b2lkIGRybV9m
Yl94cmdiODg4OF90b19yZ2IzMzIoc3RydWN0IGlvc3lzX21hcCAqZHN0LCBjb25zdCB1bnNp
Z25lZCBpbnQgKmRzdF9waQ0KPiAgIH0NCj4gICBFWFBPUlRfU1lNQk9MKGRybV9mYl94cmdi
ODg4OF90b19yZ2IzMzIpOw0KPiAgIA0KPiAtc3RhdGljIHZvaWQgZHJtX2ZiX3hyZ2I4ODg4
X3RvX3JnYjU2NV9saW5lKHZvaWQgKmRidWYsIGNvbnN0IHZvaWQgKnNidWYsIHVuc2lnbmVk
IGludCBwaXhlbHMpDQo+ICt2b2lkIGRybV9mYl94cmdiODg4OF90b19yZ2I1NjVfbGluZSh2
b2lkICpkYnVmLCBjb25zdCB2b2lkICpzYnVmLCB1bnNpZ25lZCBpbnQgcGl4ZWxzKQ0KDQpU
aGlzIGZ1bmN0aW9uIG5vdyByZXF1aXJlcyBkb2N1bWVudGF0aW9uLiBZb3UgY2FuIGNvcHkt
cGFzdGUgdGhlIGRvY3Mgb2YgDQpvbmUgb2YgdGhlIG90aGVyIGhlbHBlcnMgYW5kIGFkYXB0
IGl0Lg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+ICAgew0KPiAgIAlfX2xlMTYgKmRi
dWYxNiA9IGRidWY7DQo+ICAgCWNvbnN0IF9fbGUzMiAqc2J1ZjMyID0gc2J1ZjsNCj4gQEAg
LTMzNiw2ICszMzYsNyBAQCBzdGF0aWMgdm9pZCBkcm1fZmJfeHJnYjg4ODhfdG9fcmdiNTY1
X2xpbmUodm9pZCAqZGJ1ZiwgY29uc3Qgdm9pZCAqc2J1ZiwgdW5zaWduZQ0KPiAgIAkJZGJ1
ZjE2W3hdID0gY3B1X3RvX2xlMTYodmFsMTYpOw0KPiAgIAl9DQo+ICAgfQ0KPiArRVhQT1JU
X1NZTUJPTChkcm1fZmJfeHJnYjg4ODhfdG9fcmdiNTY1X2xpbmUpOw0KPiAgIA0KPiAgIC8q
IFRPRE86IGltcGxlbWVudCB0aGlzIGhlbHBlciBhcyBjb252ZXJzaW9uIHRvIFJHQjU2NXxC
SUdfRU5ESUFOICovDQo+ICAgc3RhdGljIHZvaWQgZHJtX2ZiX3hyZ2I4ODg4X3RvX3JnYjU2
NV9zd2FiX2xpbmUodm9pZCAqZGJ1ZiwgY29uc3Qgdm9pZCAqc2J1ZiwNCj4gZGlmZiAtLWdp
dCBhL2luY2x1ZGUvZHJtL2RybV9mb3JtYXRfaGVscGVyLmggYi9pbmNsdWRlL2RybS9kcm1f
Zm9ybWF0X2hlbHBlci5oDQo+IGluZGV4IDI5MWRlYjA5NDc1Yi4uY2E0YWM0ZmYwODAxIDEw
MDY0NA0KPiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fZm9ybWF0X2hlbHBlci5oDQo+ICsrKyBi
L2luY2x1ZGUvZHJtL2RybV9mb3JtYXRfaGVscGVyLmgNCj4gQEAgLTY3LDQgKzY3LDYgQEAg
c2l6ZV90IGRybV9mYl9idWlsZF9mb3VyY2NfbGlzdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2
LA0KPiAgIAkJCQljb25zdCB1MzIgKm5hdGl2ZV9mb3VyY2NzLCBzaXplX3QgbmF0aXZlX25m
b3VyY2NzLA0KPiAgIAkJCQl1MzIgKmZvdXJjY3Nfb3V0LCBzaXplX3QgbmZvdXJjY3Nfb3V0
KTsNCj4gICANCj4gKw0KPiArdm9pZCBkcm1fZmJfeHJnYjg4ODhfdG9fcmdiNTY1X2xpbmUo
dm9pZCAqZGJ1ZiwgY29uc3Qgdm9pZCAqc2J1ZiwgdW5zaWduZWQgaW50IHBpeGVscyk7DQo+
ICAgI2VuZGlmIC8qIF9fTElOVVhfRFJNX0ZPUk1BVF9IRUxQRVJfSCAqLw0KDQotLSANClRo
b21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3
YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCkZyYW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEg
TnVlcm5iZXJnLCBHZXJtYW55DQpHRjogSXZvIFRvdGV2LCBBbmRyZXcgTXllcnMsIEFuZHJl
dyBNY0RvbmFsZCwgQm91ZGllbiBNb2VybWFuDQpIUkIgMzY4MDkgKEFHIE51ZXJuYmVyZykN
Cg==

--------------9cUFQrRl9v6Yp80NsxtgSFOI--

--------------uohgOyH6HydLG9gcRU2XFvDh
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmUVPRcFAwAAAAAACgkQlh/E3EQov+Bj
CQ/9FacjSmVrdPsCtVOWwlLfSPbgFpkA/DRBsNp1Wj/F1qg4wDlCORkR/a5ROymuD3A4VejCY18p
J7SA92mP6fKa7djdcxjlsREYYHvwDB3xN0Brx41BYNvG+PH3u9uMLTVjKhHkJ6P4P+j/Z/m4TUOc
TokjaThtpgghA9XZlv3TlFWlmogtc7AiZvE/vZbvdvR0sPsgENS9axUjF3Orvmcz63F+dAyHZJ49
891ZoI1YtdFcn3achzYNRy7YZkMO+OGnM6TLl0+s8vCjGe8Lds2/tOGS4Q2FHEtTMWm+V8M1gUud
Byho4HeaKkBh5Y0EKooKe90lIvuhd1PXwNRkQ70vij2GNqhFfjd7Q1sR9wmFH1x1rH+aXyuwU9DS
qg5y6Uz/CNLA9TNu1/W44ZURsmwYrrKZE44RmktuiGkt+H3+69oMZR/jVzzwpIOwWV1fvdV+RpcN
F0RZjugzZglejF1kmYikiggcaHs8IOAjOm+4qlUth0ZAgSqPczYYp7Fa4WekNoEWuQyX7RdzPSOY
6Q4Y6rqud+KboA0VzO+HCfCr0LqRNPKOVAMyff4EGvxw1Aj7j22SQ7dNHGcT+vT4rpxWBY58ifu0
kUO2QdJAKE6h1TufiW42dMGru+G5/tF213qTclNY5JCw5bPKBIq3XSjaOsvmo5WeN5JjlEUmECe1
c2c=
=ucGK
-----END PGP SIGNATURE-----

--------------uohgOyH6HydLG9gcRU2XFvDh--
