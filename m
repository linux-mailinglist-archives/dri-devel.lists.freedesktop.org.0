Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6AE64D7E2
	for <lists+dri-devel@lfdr.de>; Thu, 15 Dec 2022 09:40:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85C4010E4F5;
	Thu, 15 Dec 2022 08:40:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F4A310E4F5;
 Thu, 15 Dec 2022 08:40:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E832E20E38;
 Thu, 15 Dec 2022 08:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1671093623; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f9WJlltzoXRXZxomHvaijoRw7lg9ZwUgw7+AZGULK1E=;
 b=kG9CzCAplsxusSf7jb2viYA2riGM7FWCNcm2OPKTYcdoKIgulN295dJILvgsZWyxeqB8RD
 JjPZxoZs/I7y3es4WnVwerm696jzFobc6rjuxOggiJ+nn0zZc9M4y3vE0QqGWNRoKJk1WL
 xi/dt6wwW3YLKyVF0UwWCWfeIJke/bg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1671093623;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f9WJlltzoXRXZxomHvaijoRw7lg9ZwUgw7+AZGULK1E=;
 b=OPYWwwEqCfDJlfJMnR8L5NkI6dxYTGdU7f6DoUHOJuwAEP45PUIMJPeKqBWiI0VftiXjN4
 BNQiNbK9BY5mgsBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CB61713434;
 Thu, 15 Dec 2022 08:40:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id XyexMHfdmmOHFQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 15 Dec 2022 08:40:23 +0000
Message-ID: <5960ab10-4929-1e0e-32a3-2c60bbbca37b@suse.de>
Date: Thu, 15 Dec 2022 09:40:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RESEND PATCH] drm/plane-helper: Add the missing declaration of
 drm_atomic_state
To: Ma Jun <majun@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, daniel.vetter@ffwll.ch
References: <20221215030146.1142523-1-majun@amd.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20221215030146.1142523-1-majun@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Tf28TPnqh7HfCvXYDp8mu0yY"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Tf28TPnqh7HfCvXYDp8mu0yY
Content-Type: multipart/mixed; boundary="------------cfymQAWC75nWySo0fwp7A00S";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Ma Jun <majun@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, daniel.vetter@ffwll.ch
Message-ID: <5960ab10-4929-1e0e-32a3-2c60bbbca37b@suse.de>
Subject: Re: [RESEND PATCH] drm/plane-helper: Add the missing declaration of
 drm_atomic_state
References: <20221215030146.1142523-1-majun@amd.com>
In-Reply-To: <20221215030146.1142523-1-majun@amd.com>

--------------cfymQAWC75nWySo0fwp7A00S
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTUuMTIuMjIgdW0gMDQ6MDEgc2NocmllYiBNYSBKdW46DQo+IEFkZCB0aGUg
bWlzc2luZyBkZWNsYXJhdGlvbiBvZiBzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSB0byBmaXgg
dGhlDQo+IGNvbXBpbGUgZXJyb3IgYmVsb3c6DQo+IA0KPiBlcnJvcjogJ3N0cnVjdCBkcm1f
YXRvbWljX3N0YXRlJyBkZWNsYXJlZCBpbnNpZGUgcGFyYW1ldGVyDQo+IGxpc3Qgd2lsbCBu
b3QgYmUgdmlzaWJsZSBvdXRzaWRlIG9mIHRoaXMgZGVmaW5pdGlvbiBvciBkZWNsYXJhdGlv
biBbLVdlcnJvcl0NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1hIEp1biA8bWFqdW5AYW1kLmNv
bT4NCj4gLS0tDQo+ICAgaW5jbHVkZS9kcm0vZHJtX3BsYW5lX2hlbHBlci5oIHwgMSArDQo+
ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9kcm0vZHJtX3BsYW5lX2hlbHBlci5oIGIvaW5jbHVkZS9kcm0vZHJtX3BsYW5l
X2hlbHBlci5oDQo+IGluZGV4IGIwMGFkMzZjZjViNi4uNTMwZjg4MTc2ZGI0IDEwMDY0NA0K
PiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fcGxhbmVfaGVscGVyLmgNCj4gKysrIGIvaW5jbHVk
ZS9kcm0vZHJtX3BsYW5lX2hlbHBlci5oDQo+IEBAIC0zMCw2ICszMCw3IEBAIHN0cnVjdCBk
cm1fY3J0YzsNCj4gICBzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyOw0KPiAgIHN0cnVjdCBkcm1f
bW9kZXNldF9hY3F1aXJlX2N0eDsNCj4gICBzdHJ1Y3QgZHJtX3BsYW5lOw0KPiArc3RydWN0
IGRybV9hdG9taWNfc3RhdGU7DQoNClRoYW5rcyBmb3IgdGhlIHBhdGNoLiBQbGVhc2Ugc29y
dCB0aGUgZm9yd2FyZCBkZWNsYXJhdGlvbnMgYWxwaGFiZXRpY2FsbHkuDQoNCkJlc3QgcmVn
YXJkcw0KVGhvbWFzDQoNCj4gICANCj4gICBpbnQgZHJtX3BsYW5lX2hlbHBlcl91cGRhdGVf
cHJpbWFyeShzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwgc3RydWN0IGRybV9jcnRjICpjcnRj
LA0KPiAgIAkJCQkgICAgc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIsDQoNCi0tIA0KVGhv
bWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdh
cmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5i
ZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8
aHJlcjogSXZvIFRvdGV2DQo=

--------------cfymQAWC75nWySo0fwp7A00S--

--------------Tf28TPnqh7HfCvXYDp8mu0yY
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmOa3XcFAwAAAAAACgkQlh/E3EQov+DI
Lg//aO3JdmEJgD3e+cSRIX7Ukqrt2FS1eQz8+kAbGBvWDSTWJpz23jxTgeuYs04HLF3EDddaTAD2
vwD/N6CxC/fUXMMrg6gY7nKPn5cGh4GN7oimtf/UOJeoriM0G/sNEYwzUt+mI0FVtJz/MSvlIB/4
+JMd23gcge/AHrIk54Zd5jzY3PUvAuNIZ3v767oSp8OaJqQKSH/1qgrDfzyAhfYZ9gbFIBAmQcZF
Lu74l9Wwy6F04ixUdFL1COzKRX0GBQWpncjsxTEFo+OdxvsFzcKUqmfhLNkVyTyX2CyOiJ2kkc3h
KcQh7iqQ0PmTqJNGms6Q/LPjiGSU7kDLS57EGjbxUAL9Kz3NvJjBLvuEoyNiERV2fGcQZr+BKF5P
ZtNFoKOk2R3MdEOGzDIGVl9tIUTbG6NAlWAX1wIVdWGQr94lcamblJTo4nzXQgFFvDrw6up+essU
+uoQOyrrznnEgIHB0xapKGHv6JXVPAtc8qPLEQIKKH9TE5DUoxjaP0+5ubpN3A9PYez4vUo/uD5y
UlwPYcwbc9Pt1xoorNelDLFK/iqyMwMYqpwacuo5/d6UeK2P7MwoGNolLW25YiN2fXW7SsaW4i9b
zXqwYYMBm+mWWA4MU3RsW7eXSiIx5RvHPhJiyNGfbCW+M+VvJhkalJayLF6c3hOjJ7Di5fNMklZd
/Eg=
=nWTz
-----END PGP SIGNATURE-----

--------------Tf28TPnqh7HfCvXYDp8mu0yY--
