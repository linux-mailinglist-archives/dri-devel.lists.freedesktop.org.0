Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59717753D55
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 16:28:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5A7710E8A7;
	Fri, 14 Jul 2023 14:28:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C46210E8A8
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 14:28:39 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B8BBB1F750;
 Fri, 14 Jul 2023 14:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1689344917; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GX+y/IXH9qUlg6eCZ9WKNdQJ9QE0Oa5d6KrMmtfVsNA=;
 b=rcq7LVdlG2VRUhqWtQ9nO+6eGdxUsvwe5KFwHSSYCq0zSDd5Uz2+11JHBZkPwikivWj8gR
 eTmvk8oMkWrYslC/jeuDXWyrRRQFvT98cK4Ded37aDxU6hx2Gbl3isIYBovecMlQuU8d1V
 YV5yM/Y79p6xwZgnGtBwMBYSDLSprvc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1689344917;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GX+y/IXH9qUlg6eCZ9WKNdQJ9QE0Oa5d6KrMmtfVsNA=;
 b=/O+ERX5Rr6ypfZPt9NCUm4y0cIa+1IwTl0JPyi4qMZtJapzAYOy/hhYYq7rsMoJQwZDt7N
 oL8OBvi8t2d+oyDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 909B713A15;
 Fri, 14 Jul 2023 14:28:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ob86IpVbsWRHHgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 14 Jul 2023 14:28:37 +0000
Message-ID: <ae92e39e-4087-ba36-2708-31dede0274e1@suse.de>
Date: Fri, 14 Jul 2023 16:28:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [RFC PATCH 3/3] drm/file: drop DRM_MINOR_CONTROL
Content-Language: en-US
To: Simon Ser <contact@emersion.fr>, dri-devel@lists.freedesktop.org
References: <20230714104557.518457-1-contact@emersion.fr>
 <20230714104557.518457-3-contact@emersion.fr>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230714104557.518457-3-contact@emersion.fr>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------cvH9BQjtVA0hLEYcF0vC8RxE"
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>,
 James Zhu <James.Zhu@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------cvH9BQjtVA0hLEYcF0vC8RxE
Content-Type: multipart/mixed; boundary="------------meoxqtZyCDQ1w1pKchZsG0Im";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Simon Ser <contact@emersion.fr>, dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, =?UTF-8?B?TWFyZWsgT2zFocOhaw==?=
 <marek.olsak@amd.com>, James Zhu <James.Zhu@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <ae92e39e-4087-ba36-2708-31dede0274e1@suse.de>
Subject: Re: [RFC PATCH 3/3] drm/file: drop DRM_MINOR_CONTROL
References: <20230714104557.518457-1-contact@emersion.fr>
 <20230714104557.518457-3-contact@emersion.fr>
In-Reply-To: <20230714104557.518457-3-contact@emersion.fr>

--------------meoxqtZyCDQ1w1pKchZsG0Im
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgU2ltb24NCg0KQW0gMTQuMDcuMjMgdW0gMTI6NDYgc2NocmllYiBTaW1vbiBTZXI6DQo+
IFRoaXMgZW50cnkgc2hvdWxkIG5ldmVyIGJlIHVzZWQgYnkgdGhlIGtlcm5lbC4gUmVjb3Jk
IHRoZSBoaXN0b3JpY2FsDQo+IGNvbnRleHQgaW4gYSBjb21tZW50Lg0KPiANCj4gU2lnbmVk
LW9mZi1ieTogU2ltb24gU2VyIDxjb250YWN0QGVtZXJzaW9uLmZyPg0KPiBDYzogQ2hyaXN0
aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPg0KPiBDYzogSmFtZXMgWmh1
IDxKYW1lcy5aaHVAYW1kLmNvbT4NCj4gQ2M6IE1hcmVrIE9sxaHDoWsgPG1hcmVrLm9sc2Fr
QGFtZC5jb20+DQo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNo
Pg0KPiAtLS0NCj4gICBpbmNsdWRlL2RybS9kcm1fZmlsZS5oIHwgNCArKystDQo+ICAgMSBm
aWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9maWxlLmggYi9pbmNsdWRlL2RybS9kcm1fZmls
ZS5oDQo+IGluZGV4IDAxMDIzOTM5MmFkZi4uYTIzY2MyZjYxNjNmIDEwMDY0NA0KPiAtLS0g
YS9pbmNsdWRlL2RybS9kcm1fZmlsZS5oDQo+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9maWxl
LmgNCj4gQEAgLTUzLDEyICs1MywxNCBAQCBzdHJ1Y3QgZmlsZTsNCj4gICAvKiBOb3RlIHRo
YXQgdGhlIHZhbHVlcyBvZiB0aGlzIGVudW0gYXJlIEFCSSAoaXQgZGV0ZXJtaW5lcw0KPiAg
ICAqIC9kZXYvZHJpL3JlbmRlckQqIG51bWJlcnMpLg0KPiAgICAqDQo+ICsgKiBUaGVyZSB1
c2VkIHRvIGJlIGEgRFJNX01JTk9SX0NPTlRST0wgPSAxIGVudHJ5LCBidXQgc3VjaCBub2Rl
cyB3ZXJlIG5ldmVyDQo+ICsgKiBleHBvc2VkLiBTdGlsbCwgc29tZSB1c2VyLXNwYWNlIGhh
cyBsb2dpYyB0byBoYW5kbGUgdGhlbS4NCj4gKyAqDQo+ICAgICogU2V0dGluZyBEUk1fTUlO
T1JfQUNDRUwgdG8gMzIgZ2l2ZXMgZW5vdWdoIHNwYWNlIGZvciBtb3JlIGRybSBtaW5vcnMg
dG8NCj4gICAgKiBiZSBpbXBsZW1lbnRlZCBiZWZvcmUgd2UgaGl0IGFueSBmdXR1cmUNCj4g
ICAgKi8NCj4gICBlbnVtIGRybV9taW5vcl90eXBlIHsNCj4gICAJRFJNX01JTk9SX1BSSU1B
UlkgPSAwLA0KPiAtCURSTV9NSU5PUl9DT05UUk9MID0gMSwNCg0KTWF5YmUgcmF0aGVyIGxl
YXZlIHRoaXMgbGluZSBpbiBhbmQgY29tbWVudCBpdCB3aXRoICIvLyBvYnNvbGV0ZSIuIA0K
T3RoZXJ3aXNlIHNvbWVvbmUgbWlnaHQgYWNjaWRlbnRhbGx5IHVzZSAxIGZvciBzb21ldGhp
bmcuDQoNCkluIGFueSBjYXNlDQoNClJldmlld2VkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8
dHppbW1lcm1hbm5Ac3VzZS5kZT4NCg0KZm9yIHRoZSB3aG9sZSBzZXJpZXMuDQoNCkJlc3Qg
cmVnYXJkcw0KVGhvbWFzDQoNCj4gICAJRFJNX01JTk9SX1JFTkRFUiA9IDIsDQo+ICAgCURS
TV9NSU5PUl9BQ0NFTCA9IDMyLA0KPiAgIH07DQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4N
CkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdl
cm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1h
bnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxkLCBCb3Vk
aWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------meoxqtZyCDQ1w1pKchZsG0Im--

--------------cvH9BQjtVA0hLEYcF0vC8RxE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSxW5QFAwAAAAAACgkQlh/E3EQov+Cz
rRAAjVzoHF1BKc6fnY7xA4Y4frGgzxpPGj9Lk7UAYL6lNCRwZOwY9hP+OujCm23pZKuSIM9s6hHl
F8j0bRofoFTqqTduX6ZcqIhPbsf94afPqBTymevub+18TXG2MIGtMGDzcjILelq9im/gMT0LM3ad
ztfsK3kC2AdV5d11kVI8z7ItbRGBM1llxOpkOgn4JOgnjVhBQ4dd11/QlS1NN19GWE7ZXyBa0rkz
6+Z48fVIdMiD1679C9TKsxOg1j1d+TmkKf0gZhYgW3nDNV4RF641ZpI4gckXQnDuIB97IE9uht4z
9H+/t0lzg4x3XQQZSaO8VnFei20LKadMYU88qm4L5Zuq+1R25m2/PHoRwREv5j4CKFevewYJp7fD
8kzld9KcHgHzWYidnTWT4Zh1MULRKvFeNUFCHHrmove677m119R7qwhSI1CYZWchiNxGGiNaUH9r
SGA7P8VWyvscKMHZPcq7Y8Ona+Tl3yVBj2Ifi2xyzYPoVTkOYns2PGu8JCbdTDr4PjCoeAxsqVXv
nxfh16AdaJjpUmfEynqa1wFRutfSlcl/5DSULUSyPrlfh3bxayccDV12/fUVci9Fr62hIU1Lzlxp
ceVtOD2dmTqXVeCymUYa3MOtN6G5fu0jJWTDegX5t8mk9XzcTQNmdFr7mp2Y1k+wS+jzNcsgsIw4
9Gs=
=OvUo
-----END PGP SIGNATURE-----

--------------cvH9BQjtVA0hLEYcF0vC8RxE--
