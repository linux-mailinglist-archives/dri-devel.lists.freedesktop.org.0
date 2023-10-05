Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4587B9B70
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 09:43:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0454D10E0AD;
	Thu,  5 Oct 2023 07:42:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38D4110E0AD
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Oct 2023 07:42:54 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8E69C1F8BE;
 Thu,  5 Oct 2023 07:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1696491772; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=LxCtBMIwWAzi7K68ixTpLYejYNuqOJYwTorwvVo6AuI=;
 b=GyRaoicJhkHR+m2fuwnTQP7F7zK16USGAOmEj+qm4gIoQoSETguwzygm0FI1m0B5TSKej9
 kqkzoI7DnqKoEIpJz6DNw+kw6CFxVCZfVCPFLintuKObPUDwMv0MfpIwKBrAER+kH9Hqly
 pXyxTF+gCviSqRaEBr+1eYpmysn86sk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1696491772;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=LxCtBMIwWAzi7K68ixTpLYejYNuqOJYwTorwvVo6AuI=;
 b=JNLIWpcjj5B1CMFMXa7fr+bR/WQJ3TMi2WeKBS2sRZs/NmhMPa/PEkpKnti4v9KeORvbun
 xH2rxCKFgn072gDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9F27A139C2;
 Thu,  5 Oct 2023 07:42:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CKfsI/toHmWgQwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 05 Oct 2023 07:42:51 +0000
Message-ID: <4e6f1351-b318-48d8-bdc0-1c826ef0ac7a@suse.de>
Date: Thu, 5 Oct 2023 09:42:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] BUG: KFENCE: memory corruption in
 drm_gem_put_pages+0x186/0x250
To: Oleksandr Natalenko <oleksandr@natalenko.name>,
 linux-kernel@vger.kernel.org
References: <13360591.uLZWGnKmhe@natalenko.name>
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
In-Reply-To: <13360591.uLZWGnKmhe@natalenko.name>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------nIDgfdRDnb00RBmTrfmXTFDW"
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
Cc: Linux Regressions <regressions@lists.linux.dev>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Maxime Ripard <mripard@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------nIDgfdRDnb00RBmTrfmXTFDW
Content-Type: multipart/mixed; boundary="------------0gzhTxJl8xnoE4DkLrOmTERk";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Oleksandr Natalenko <oleksandr@natalenko.name>,
 linux-kernel@vger.kernel.org
Cc: Linux Regressions <regressions@lists.linux.dev>,
 Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Message-ID: <4e6f1351-b318-48d8-bdc0-1c826ef0ac7a@suse.de>
Subject: Re: [REGRESSION] BUG: KFENCE: memory corruption in
 drm_gem_put_pages+0x186/0x250
References: <13360591.uLZWGnKmhe@natalenko.name>
In-Reply-To: <13360591.uLZWGnKmhe@natalenko.name>

--------------0gzhTxJl8xnoE4DkLrOmTERk
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDEuMTAuMjMgdW0gMTg6MzIgc2NocmllYiBPbGVrc2FuZHIgTmF0YWxlbmtv
Og0KPiBIZWxsby4NCj4gDQo+IEkndmUgZ290IGEgVk0gZnJvbSBhIGNsb3VkIHByb3ZpZGVy
LCBhbmQgc2luY2UgdjYuNSBJIG9ic2VydmUgdGhlIGZvbGxvd2luZyBrZmVuY2Ugc3BsYXQg
aW4gZG1lc2cgZHVyaW5nIGJvb3Q6DQo+IA0KPiBgYGANCj4gQlVHOiBLRkVOQ0U6IG1lbW9y
eSBjb3JydXB0aW9uIGluIGRybV9nZW1fcHV0X3BhZ2VzKzB4MTg2LzB4MjUwDQo+IA0KPiBD
b3JydXB0ZWQgbWVtb3J5IGF0IDB4MDAwMDAwMDBlMTczYTI5NCBbICEgISAhICEgISAhICEg
ISAhICEgISAhICEgISAhICEgXSAoaW4ga2ZlbmNlLSMxMDgpOg0KPiAgIGRybV9nZW1fcHV0
X3BhZ2VzKzB4MTg2LzB4MjUwDQo+ICAgZHJtX2dlbV9zaG1lbV9wdXRfcGFnZXNfbG9ja2Vk
KzB4NDMvMHhjMA0KPiAgIGRybV9nZW1fc2htZW1fb2JqZWN0X3Z1bm1hcCsweDgzLzB4ZTAN
Cj4gICBkcm1fZ2VtX3Z1bm1hcF91bmxvY2tlZCsweDQ2LzB4YjANCj4gICBkcm1fZmJkZXZf
Z2VuZXJpY19oZWxwZXJfZmJfZGlydHkrMHgxZGMvMHgzMTANCj4gICBkcm1fZmJfaGVscGVy
X2RhbWFnZV93b3JrKzB4OTYvMHgxNzANCj4gICBwcm9jZXNzX29uZV93b3JrKzB4MjU0LzB4
NDcwDQo+ICAgd29ya2VyX3RocmVhZCsweDU1LzB4NGYwDQo+ICAga3RocmVhZCsweGU4LzB4
MTIwDQo+ICAgcmV0X2Zyb21fZm9yaysweDM0LzB4NTANCj4gICByZXRfZnJvbV9mb3JrX2Fz
bSsweDFiLzB4MzANCj4gDQo+IGtmZW5jZS0jMTA4OiAweDAwMDAwMDAwY2RhMzQzYWYtMHgw
MDAwMDAwMGFlYzJjMDk1LCBzaXplPTMwNzIsIGNhY2hlPWttYWxsb2MtNGsNCj4gDQo+IGFs
bG9jYXRlZCBieSB0YXNrIDUxIG9uIGNwdSAwIGF0IDE0LjY2ODY2N3M6DQo+ICAgZHJtX2dl
bV9nZXRfcGFnZXMrMHg5NC8weDJiMA0KPiAgIGRybV9nZW1fc2htZW1fZ2V0X3BhZ2VzKzB4
NWQvMHgxMTANCj4gICBkcm1fZ2VtX3NobWVtX29iamVjdF92bWFwKzB4YzQvMHgxZTANCj4g
ICBkcm1fZ2VtX3ZtYXBfdW5sb2NrZWQrMHgzYy8weDcwDQo+ICAgZHJtX2NsaWVudF9idWZm
ZXJfdm1hcCsweDIzLzB4NTANCj4gICBkcm1fZmJkZXZfZ2VuZXJpY19oZWxwZXJfZmJfZGly
dHkrMHhhZS8weDMxMA0KPiAgIGRybV9mYl9oZWxwZXJfZGFtYWdlX3dvcmsrMHg5Ni8weDE3
MA0KPiAgIHByb2Nlc3Nfb25lX3dvcmsrMHgyNTQvMHg0NzANCj4gICB3b3JrZXJfdGhyZWFk
KzB4NTUvMHg0ZjANCj4gICBrdGhyZWFkKzB4ZTgvMHgxMjANCj4gICByZXRfZnJvbV9mb3Jr
KzB4MzQvMHg1MA0KPiAgIHJldF9mcm9tX2ZvcmtfYXNtKzB4MWIvMHgzMA0KPiANCj4gZnJl
ZWQgYnkgdGFzayA1MSBvbiBjcHUgMCBhdCAxNC42Njg2OTdzOg0KPiAgIGRybV9nZW1fcHV0
X3BhZ2VzKzB4MTg2LzB4MjUwDQo+ICAgZHJtX2dlbV9zaG1lbV9wdXRfcGFnZXNfbG9ja2Vk
KzB4NDMvMHhjMA0KPiAgIGRybV9nZW1fc2htZW1fb2JqZWN0X3Z1bm1hcCsweDgzLzB4ZTAN
Cj4gICBkcm1fZ2VtX3Z1bm1hcF91bmxvY2tlZCsweDQ2LzB4YjANCj4gICBkcm1fZmJkZXZf
Z2VuZXJpY19oZWxwZXJfZmJfZGlydHkrMHgxZGMvMHgzMTANCj4gICBkcm1fZmJfaGVscGVy
X2RhbWFnZV93b3JrKzB4OTYvMHgxNzANCj4gICBwcm9jZXNzX29uZV93b3JrKzB4MjU0LzB4
NDcwDQo+ICAgd29ya2VyX3RocmVhZCsweDU1LzB4NGYwDQo+ICAga3RocmVhZCsweGU4LzB4
MTIwDQo+ICAgcmV0X2Zyb21fZm9yaysweDM0LzB4NTANCj4gICByZXRfZnJvbV9mb3JrX2Fz
bSsweDFiLzB4MzANCj4gDQo+IENQVTogMCBQSUQ6IDUxIENvbW06IGt3b3JrZXIvMDoyIE5v
dCB0YWludGVkIDYuNS4wLXBmNCAjMSA4YjU1N2E0MTczMTE0ZDg2ZWVmNzI0MGY3YTA4MDA4
MGNmYzQ2MTdlDQo+IEhhcmR3YXJlIG5hbWU6IFJlZCBIYXQgS1ZNLCBCSU9TIDEuMTEuMC0y
LmVsNyAwNC8wMS8yMDE0DQo+IFdvcmtxdWV1ZTogZXZlbnRzIGRybV9mYl9oZWxwZXJfZGFt
YWdlX3dvcmsNCj4gYGBgDQo+IA0KPiBUaGlzIHJlcGVhdHMgYSBjb3VwbGUgb2YgdGltZXMg
YW5kIHRoZW4gc3RvcHMuDQo+IA0KPiBDdXJyZW50bHksIEknbSBydW5uaW5nIHY2LjUuNS4g
U28gZmFyLCB0aGVyZSdzIG5vIGltcGFjdCBvbiBob3cgVk0gZnVuY3Rpb25zIGZvciBtZS4N
Cj4gDQo+IFRoZSBWR0EgYWRhcHRlciBpcyBhcyBmb2xsb3dzOiAwMDowMi4wIFZHQSBjb21w
YXRpYmxlIGNvbnRyb2xsZXI6IENpcnJ1cyBMb2dpYyBHRCA1NDQ2DQoNClRoZXJlJ3Mgbm90
aGluZyBzcGVjaWFsIGFib3V0IHRoZSBjaXJydXMgZHJpdmVyLiBDYW4geW91IHBsZWFzZSBw
cm92aWRlIA0KdGhlIGZ1bGwgb3V0cHV0IG9mICdsc3BjaSAtdicgPw0KDQpXb3VsZCB5b3Ug
YmUgYWJsZSB0byBiaXNlY3QgdGhpcyBidWc/DQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoN
Cj4gDQo+IFBsZWFzZSBjaGVjay4NCj4gDQo+IFRoYW5rcy4NCj4gDQoNCi0tIA0KVGhvbWFz
IFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUg
U29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVy
bmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3IE1j
RG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------0gzhTxJl8xnoE4DkLrOmTERk--

--------------nIDgfdRDnb00RBmTrfmXTFDW
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmUeaPoFAwAAAAAACgkQlh/E3EQov+CL
IQ/+IGNdCy+OctfeaV/mVfbOvKymE7Eqt+6G0Iu5mIVCHmy4JzAwQ8WZfMn4RTRZ4uJJuCLWgzHA
xU6yIyM7T6439Q/PR/lEgdj8nQ6VpEKQ/QhFnQPsUli4hUZZWj5YK5W4wpxDObSzdi9ebk7/VZuH
WEmlGZ2EV/VrElYOsf1pG2U/K3BVpmjES5S4FfveLKZn265ndZGdX25r8DjXMYYgAm4QiGp776r6
Wfw1OkzqmB2ZUneegVvTxIUQzIHoZ3aO5RGw8XmvOXDjZBSLTeB9UF46TDVoAI6qVIgtiA1NKfB1
8Af7xEuFqbtKVoZENwV/Rsq6nJn7V94XiuJrX4rHLXOdonQV4r+VBuOkbj4LrFm+jHu6Fy1LM9zD
BsWBXe/km4vtcVpNUlP1iLDGFOVjt2oQhx8036M9c/W5gfT2w7n8r98W9V7idGrnQogEx+t4cs8f
FQyQqrQmOLuiz5SqA+QUhC82wiO7Tz2dz6Lq886WbXVTllFqdENSXVDsbMFww3d9To71U9whJa5O
N+2Q17gBNxnb2S2d9xDuKJlRtUvKQzOjPcJs/wp+ZtXe7p1UR4kWdB0DbrlFRmRl2LKtOLxLuwck
RAacQHjmVFKszTc3rGnS5DGYUh2Ssi6RX6WgDee4/jQFuIGiomj71zJagql9s3iEEwhBxDwsWNzF
fxQ=
=4T4t
-----END PGP SIGNATURE-----

--------------nIDgfdRDnb00RBmTrfmXTFDW--
