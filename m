Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5B24A5AF9
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 12:14:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9645D10E54C;
	Tue,  1 Feb 2022 11:14:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B0AF10E52D;
 Tue,  1 Feb 2022 11:14:24 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 0301B1F383;
 Tue,  1 Feb 2022 11:14:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1643714063; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fyhub5pJjbzJ9hW6AekqBFx89+VSMUbNCCyeZ9gBOFM=;
 b=Reuu0AgrFlQtNdQ43Q/LugDEl25L/iYMS/qRSeffL/Cpg5q9peKidxsdxxK0m03VOA/tSY
 t490V1kw4zePhZBSBiAxW8Dwklihr7viw0z1uNaYCiXmtPQRTmBgBgyes9+NyTcqbonicf
 HBwNx8iXbOdZM+SrWLDAsnnBx1VQyT0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1643714063;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fyhub5pJjbzJ9hW6AekqBFx89+VSMUbNCCyeZ9gBOFM=;
 b=LzTtofUEzsoA4weF0ax+EXpMRDh4aPaevRs34gs9alyspKrs6cGGLAIuxLzr0AaFFnvFae
 kFQiuLmDuS5UvgAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BE16013D62;
 Tue,  1 Feb 2022 11:14:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Tv9VLQ4W+WHsKAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 01 Feb 2022 11:14:22 +0000
Message-ID: <dc12d8f2-2450-7124-7041-df7cba58e48b@suse.de>
Date: Tue, 1 Feb 2022 12:14:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PULL] drm-misc-next
Content-Language: en-US
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Dave Airlie <airlied@gmail.com>
References: <456a23c6-7324-7543-0c45-751f30ef83f7@linux.intel.com>
 <CAPM=9twqNAQ0+O40SPJOZk=RHkBo5sdHUSWdbaga25Xh8gLs3A@mail.gmail.com>
 <5f628861-1969-f313-f931-cf8608ef6acf@linux.intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <5f628861-1969-f313-f931-cf8608ef6acf@linux.intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------L0DchXqKu2QsZfJKGIhgLCev"
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "DRM maintainer tools announcements, discussion,
 and development" <dim-tools@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------L0DchXqKu2QsZfJKGIhgLCev
Content-Type: multipart/mixed; boundary="------------FhS0MPw8w6yDBD81jXULRyy8";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Dave Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Maxime Ripard <mripard@kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 "DRM maintainer tools announcements, discussion, and development"
 <dim-tools@lists.freedesktop.org>
Message-ID: <dc12d8f2-2450-7124-7041-df7cba58e48b@suse.de>
Subject: Re: [PULL] drm-misc-next
References: <456a23c6-7324-7543-0c45-751f30ef83f7@linux.intel.com>
 <CAPM=9twqNAQ0+O40SPJOZk=RHkBo5sdHUSWdbaga25Xh8gLs3A@mail.gmail.com>
 <5f628861-1969-f313-f931-cf8608ef6acf@linux.intel.com>
In-Reply-To: <5f628861-1969-f313-f931-cf8608ef6acf@linux.intel.com>

--------------FhS0MPw8w6yDBD81jXULRyy8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDEuMDIuMjIgdW0gMDk6MTcgc2NocmllYiBNYWFydGVuIExhbmtob3JzdDoN
Cj4gT3AgMDEtMDItMjAyMiBvbSAwNzozOCBzY2hyZWVmIERhdmUgQWlybGllOg0KPj4gT24g
VGh1LCAyNyBKYW4gMjAyMiBhdCAyMTo1NywgTWFhcnRlbiBMYW5raG9yc3QNCj4+IDxtYWFy
dGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+IHdyb3RlOg0KPj4+IEhpIERhdmUgJiBE
YW5pZWwsDQo+Pj4NCj4+PiBGaXJzdCBwdWxsIGZvciB2NS4xOA0KPj4gSSB3YXMgdHJ5aW5n
IHRvIGJlIGFsbCBlZmZpY2llbnQgYW5kIGdldCB0aGlzIHB1bGxlZCBpbiB0aW1lIGZvciBv
bmNlLg0KPj4NCj4+DQo+PiBIb3dldmVyIGl0IGJyb2tlIGJ1aWxkaW5nIG9uIG15IGFybSB0
ZXN0IGJ1aWxkLg0KPj4NCj4+IFRoZSBuZXcgRFAgaGVscGVyIEtjb25maWcgaXMgd3Jvbmcg
c29tZXdoZXJlLg0KPj4NCj4+IEkndmUgYXR0YWNoZWQgdGhlIC5jb25maWcsIGJ1dCBpdCBh
cHBlYXJzIEkgZ2V0IERSTV9EUF9IRUxQRVIgc2V0IHRvIE0NCj4+IGJ1dCBBTkFMT0dJWF9E
UCBzZXQgdG8gWSBhbmQgaXQgZmFpbHMgdG8gbGluayBiZWNhdXNlIHRoZSBkcCBoZWxwZXIN
Cj4+IHNob3VsZCBiZSBZLg0KPj4NCj4+IFJlZ2FyZHMsDQo+PiBEYXZlLg0KPiBCZWxvdyBz
aG91bGQgbGlrZWx5IGZpeCBpdD8NCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vZXh5bm9zL0tjb25maWcgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL0tjb25maWcNCj4g
aW5kZXggNmEyNTFlM2FhNzc5Li5mMjdjZmQyYTk3MjYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9leHlub3MvS2NvbmZpZw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZXh5
bm9zL0tjb25maWcNCj4gQEAgLTY2LDYgKzY2LDcgQEAgY29uZmlnIERSTV9FWFlOT1NfRFAN
Cj4gICAJYm9vbCAiRXh5bm9zIHNwZWNpZmljIGV4dGVuc2lvbnMgZm9yIEFuYWxvZ2l4IERQ
IGRyaXZlciINCj4gICAJZGVwZW5kcyBvbiBEUk1fRVhZTk9TX0ZJTUQgfHwgRFJNX0VYWU5P
UzdfREVDT04NCj4gICAJc2VsZWN0IERSTV9BTkFMT0dJWF9EUA0KPiArCXNlbGVjdCBEUk1f
RFBfSEVMUEVSDQo+ICAgCWRlZmF1bHQgRFJNX0VYWU5PUw0KPiAgIAlzZWxlY3QgRFJNX1BB
TkVMDQo+ICAgCWhlbHANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hp
cC9LY29uZmlnIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL0tjb25maWcNCj4gaW5kZXgg
ZDU5ZGNhNWVmYjUyLi5mYTVjZmRhNGU5MGUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9yb2NrY2hpcC9LY29uZmlnDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yb2NrY2hp
cC9LY29uZmlnDQo+IEBAIC04LDYgKzgsNyBAQCBjb25maWcgRFJNX1JPQ0tDSElQDQo+ICAg
CXNlbGVjdCBEUk1fUEFORUwNCj4gICAJc2VsZWN0IFZJREVPTU9ERV9IRUxQRVJTDQo+ICAg
CXNlbGVjdCBEUk1fQU5BTE9HSVhfRFAgaWYgUk9DS0NISVBfQU5BTE9HSVhfRFANCj4gKwlz
ZWxlY3QgRFJNX0RQX0hFTFBFUiBpZiBST0NLQ0hJUF9BTkFMT0dJWF9EUA0KPiAgIAlzZWxl
Y3QgRFJNX0RXX0hETUkgaWYgUk9DS0NISVBfRFdfSERNSQ0KPiAgIAlzZWxlY3QgRFJNX0RX
X01JUElfRFNJIGlmIFJPQ0tDSElQX0RXX01JUElfRFNJDQo+ICAgCXNlbGVjdCBHRU5FUklD
X1BIWSBpZiBST0NLQ0hJUF9EV19NSVBJX0RTSQ0KDQpUaGFua3MgYSBsb3QuIFRoaXMgZml4
ZXMgdGhlIGJ1aWxkIGZvciBtZS4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCg0K
LS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VT
RSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQw
OSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2No
w6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------FhS0MPw8w6yDBD81jXULRyy8--

--------------L0DchXqKu2QsZfJKGIhgLCev
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmH5Fg4FAwAAAAAACgkQlh/E3EQov+Dk
aA/+MNSC5f871wsvNk9qKOzG47GUCz8kP9VDM2wQXzGvxl2XBcQudTnyVOosnDuXGgSrhQs2owRw
oCXuEYsrTF4hV8xEb4BQLutzDSapcR6U5h+K8Ax1fQdV+pBVoHuTJmZTiXuyCWM768j7i1FudmWp
CnDiAkjbSywASZrmrs7zrq3Rj07lqeVxYJb+Tt+UkaAUTaTU3oPnrsG2n3jvk2I9J7O+1k7ly3TO
s7bVztw6hGfqKIo+fuR5B8PAftMZgD1CCIFjuAnbKjZ923PtXCeV3kHnGD345L5ZYSp8NO7JFuko
a+3rWSCYrK4UpJVN9Kz6mD2tsvD0HjnnCMSEGq3tufByrFikvImKta0LITQHFl7oJh+wsQn1a3gW
GEvw2d49xo7pdqS5/ZsS7tACoIAmzHRWoGpFBx4+mUsyU+le/ZgTrjyC1yQePayED4/3ti7Q8AWZ
kl/q2F3fXMUkwZztheg53PA2Rnd4MUJg1Scv4hTM/XvmwZYqf0j/3Ymx46W/4iGGwTFv0IfUqJ1B
X9sKY9QDZy6fTWAPTm9HJT20Wb/tmkPuxMLyCkXbqxOU5bfcY1C9BQc7eni4n0p2It6MIAevARen
KtPwWFZX7lW7VKMFugapGbtJxBmCWuYokj47HEqaxyYkpUSf7p50iMrc6q7l+VUOf/N15SVwcU/e
eKU=
=SXfM
-----END PGP SIGNATURE-----

--------------L0DchXqKu2QsZfJKGIhgLCev--
