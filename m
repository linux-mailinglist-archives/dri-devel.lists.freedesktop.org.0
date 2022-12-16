Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E6364EBA9
	for <lists+dri-devel@lfdr.de>; Fri, 16 Dec 2022 13:56:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 217CA10E094;
	Fri, 16 Dec 2022 12:56:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE32310E094;
 Fri, 16 Dec 2022 12:56:10 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7357D5CE81;
 Fri, 16 Dec 2022 12:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1671195369; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ilJVFLsxKaeipGCoe35ncTDgKRzVEBqvBE90fXQaIqU=;
 b=S5/Z/6l4ppYgmEQ9feqL9mhWn3YfVk3FFcmNYZLKN2pmM18jbUSyy7MPIrOx3XwXuZKtyX
 PHFoowhx12B2DWXCBpgWUzBcTTLgYpEBlfr3340IJU4PaqpUvMlaXg7AAZyl6SSwgYXBeu
 SliEd9z6IYFHeFKQD+A+MwIs/ZE7+o8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1671195369;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ilJVFLsxKaeipGCoe35ncTDgKRzVEBqvBE90fXQaIqU=;
 b=YO3feOXOYTwLG7ReTVSlVIflOgGf3V21DlZ+qIJrLcBVEKGkho1d84cdbUPvBWBoFvI0BP
 e1wuSQ2gONXlFYDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 59512138FD;
 Fri, 16 Dec 2022 12:56:09 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 7Pa0FOlqnGMGOgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 16 Dec 2022 12:56:09 +0000
Message-ID: <0e57d62e-ff98-6335-7338-c5f27f861864@suse.de>
Date: Fri, 16 Dec 2022 13:56:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH V2] drm/plane-helper: Add the missing declaration of
 drm_atomic_state
Content-Language: en-US
To: Ma Jun <majun@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, daniel.vetter@ffwll.ch
References: <20221216030526.1335609-1-majun@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20221216030526.1335609-1-majun@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------GdTXntuRAJ08Pcr62x1ImZXH"
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
--------------GdTXntuRAJ08Pcr62x1ImZXH
Content-Type: multipart/mixed; boundary="------------PkdoOAXEwSIF675gFBNRFbWZ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Ma Jun <majun@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, daniel.vetter@ffwll.ch
Message-ID: <0e57d62e-ff98-6335-7338-c5f27f861864@suse.de>
Subject: Re: [PATCH V2] drm/plane-helper: Add the missing declaration of
 drm_atomic_state
References: <20221216030526.1335609-1-majun@amd.com>
In-Reply-To: <20221216030526.1335609-1-majun@amd.com>

--------------PkdoOAXEwSIF675gFBNRFbWZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTYuMTIuMjIgdW0gMDQ6MDUgc2NocmllYiBNYSBKdW46DQo+IEFkZCB0aGUg
bWlzc2luZyBkZWNsYXJhdGlvbiBvZiBzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSB0byBmaXgg
dGhlDQo+IGNvbXBpbGUgZXJyb3IgYmVsb3c6DQo+IA0KPiBlcnJvcjogJ3N0cnVjdCBkcm1f
YXRvbWljX3N0YXRlJyBkZWNsYXJlZCBpbnNpZGUgcGFyYW1ldGVyDQo+IGxpc3Qgd2lsbCBu
b3QgYmUgdmlzaWJsZSBvdXRzaWRlIG9mIHRoaXMgZGVmaW5pdGlvbiBvciBkZWNsYXJhdGlv
biBbLVdlcnJvcl0NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1hIEp1biA8bWFqdW5AYW1kLmNv
bT4NCg0KVGhhbmtzLiBJIGFkZGVkIGEgRml4ZXMgdGFnIGFuZCBtZXJnZWQgdGhlIHBhdGNo
IGludG8gZHJtLW1pc2MtZml4ZXMuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gLS0t
DQo+ICAgaW5jbHVkZS9kcm0vZHJtX3BsYW5lX2hlbHBlci5oIHwgMSArDQo+ICAgMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9k
cm0vZHJtX3BsYW5lX2hlbHBlci5oIGIvaW5jbHVkZS9kcm0vZHJtX3BsYW5lX2hlbHBlci5o
DQo+IGluZGV4IGIwMGFkMzZjZjViNi4uOTAxNTZlMTNhYzExIDEwMDY0NA0KPiAtLS0gYS9p
bmNsdWRlL2RybS9kcm1fcGxhbmVfaGVscGVyLmgNCj4gKysrIGIvaW5jbHVkZS9kcm0vZHJt
X3BsYW5lX2hlbHBlci5oDQo+IEBAIC0yNiw2ICsyNiw3IEBADQo+ICAgDQo+ICAgI2luY2x1
ZGUgPGxpbnV4L3R5cGVzLmg+DQo+ICAgDQo+ICtzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZTsN
Cj4gICBzdHJ1Y3QgZHJtX2NydGM7DQo+ICAgc3RydWN0IGRybV9mcmFtZWJ1ZmZlcjsNCj4g
ICBzdHJ1Y3QgZHJtX21vZGVzZXRfYWNxdWlyZV9jdHg7DQoNCi0tIA0KVGhvbWFzIFppbW1l
cm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRp
b25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJt
YW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZv
IFRvdGV2DQo=

--------------PkdoOAXEwSIF675gFBNRFbWZ--

--------------GdTXntuRAJ08Pcr62x1ImZXH
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmOcaugFAwAAAAAACgkQlh/E3EQov+Br
jQ/+NmIaEwYvR5NlBH4+mf05csxJJTkF0ziRlnx/yJ6S3yVmgPcqAtOZYvXjixEXX/X6ycbAPWkf
zlmB+AZ8/1SoLEedbJCKB9+dwAmsFa6tx9hH4r2akWkEpeVAFv284tRTHpxDBBgV6N2YppMaPU74
VD8BeMBEGKRrsLtlOt69hwvvoYB+K5LdkjLrNirGJ4Kqg24Rr6HQLy9P/LkPjZke69Vx8gmvIgv8
OmdcwCJRiaIxzGVUUkq0Rk2+lAEl62YPiYv7m2GsfFiEDUcOqqZDubDHqLcGHGxH7AbPG6Bn5XM7
uGMRUqWZDoKpFvGvjd0WNH0SoG1QMinusfp6tIu7C42Uzt9Mi8zX3yBhZPCPrA43UxjunJzK7Tot
joWGJUZIIVajefVbiqtMCvpEPcRYqK0KLwWB/2Wal57NBY99MFSIgZm0LUoOu5asVmhJNQzvMqhZ
JFdoJH+7BqYuYlMTMJWDW2dXBfBLdK741JNW8z1MIp7o9WhCXdMW/3oNVg7QXaGuDTIKOKB45dxm
XRSqzmwQva6SgRgA30k04QhDQOkFzeWFLKLgsnnWwA+3hMYRqixqmaA+vwIQVJeqBdVYafx4Hy2F
ldLbKQC7JbmLOMoDc7Mmo6WjZrvxXqazizv06TZQulTcMbx/BSoOHCgtY6oCRp+VypkYQIWXk++W
rAk=
=zXct
-----END PGP SIGNATURE-----

--------------GdTXntuRAJ08Pcr62x1ImZXH--
