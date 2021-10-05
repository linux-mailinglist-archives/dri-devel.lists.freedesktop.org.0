Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 002BC421F0D
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 08:47:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8936F6E2DC;
	Tue,  5 Oct 2021 06:47:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 264926E2DC
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Oct 2021 06:47:15 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A1FFE222E2;
 Tue,  5 Oct 2021 06:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1633416433; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+hu0tR8lBYn9WH+wcRG4FyBIY4ea4HDt1SjNBpAD4Gs=;
 b=0HhWcFv/fktmx96///qz2dbqSemmIVyKiStwUtuNUi5EHR2B4nRHfySavSGX1N+vVzTo1B
 HDNcabIZz45QtazUpgz9pPHqIIel6xDRknxTyof8DZNE8zTRkZBPR6sBkRTWwnDZlnDBgC
 Y411m7WtGCq4xVqA3S3QLdh35H9TSMw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1633416433;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+hu0tR8lBYn9WH+wcRG4FyBIY4ea4HDt1SjNBpAD4Gs=;
 b=mwNVmIajDzdHGvlg7BhAsSWA4wg6Y/iRDOD6mZRR9cTWrmEtfVzpJ1YfOW1K5Uxap5gG5k
 Y4MPjFzU86Ddu1BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 79FB81342A;
 Tue,  5 Oct 2021 06:47:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2Pq0HPH0W2GLOAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 05 Oct 2021 06:47:13 +0000
Message-ID: <1cead398-2241-dc05-0518-7861c1e4515f@suse.de>
Date: Tue, 5 Oct 2021 08:47:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH] DRM: delete DRM IRQ legacy midlayer docs
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20211005025312.20913-1-rdunlap@infradead.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20211005025312.20913-1-rdunlap@infradead.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------DIjCGkAyd5DDzKcVeKdN9qYh"
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
--------------DIjCGkAyd5DDzKcVeKdN9qYh
Content-Type: multipart/mixed; boundary="------------KtZHZu2h0AuPS5749nMcYvt3";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Message-ID: <1cead398-2241-dc05-0518-7861c1e4515f@suse.de>
Subject: Re: [PATCH] DRM: delete DRM IRQ legacy midlayer docs
References: <20211005025312.20913-1-rdunlap@infradead.org>
In-Reply-To: <20211005025312.20913-1-rdunlap@infradead.org>

--------------KtZHZu2h0AuPS5749nMcYvt3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDUuMTAuMjEgdW0gMDQ6NTMgc2NocmllYiBSYW5keSBEdW5sYXA6DQo+IFJl
bW92ZSBkb2N1bWVudGF0aW9uIGFzc29jaWF0ZWQgd2l0aCB0aGUgcmVtb3ZhbCBvZiB0aGUg
RFJNIElSUSBsZWdhY3kNCj4gbWlkbGF5ZXIuDQo+IA0KPiBFbGltaW5hdGVzIHRoZXNlIGRv
Y3VtZW50YXRpb24gd2FybmluZ3M6DQo+IA0KPiAuLi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ly
cS5jOjE6IHdhcm5pbmc6ICdpcnEgaGVscGVycycgbm90IGZvdW5kDQo+IC4uL2RyaXZlcnMv
Z3B1L2RybS9kcm1faXJxLmM6MTogd2FybmluZzogbm8gc3RydWN0dXJlZCBjb21tZW50cyBm
b3VuZA0KPiANCj4gRml4ZXM6IGMxNzM2YjkwMDhjYiAoImRybTogSVJRIG1pZGxheWVyIGlz
IG5vdyBsZWdhY3kiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBSYW5keSBEdW5sYXAgPHJkdW5sYXBA
aW5mcmFkZWFkLm9yZz4NCj4gQ2M6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBz
dXNlLmRlPg0KPiBDYzogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPg0KPiBDYzog
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPiBDYzogSm9uYXRoYW4gQ29yYmV0
IDxjb3JiZXRAbHduLm5ldD4NCj4gQ2M6IGxpbnV4LWRvY0B2Z2VyLmtlcm5lbC5vcmcNCj4g
Q2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4NCj4gQ2M6IERhbmllbCBWZXR0
ZXIgPGRhbmllbEBmZndsbC5jaD4NCg0KQXBwbGllZCB0byBkcm0tbWlzYy1maXhlcy4gVGhh
bmtzIGZvciB0aGUgcGF0Y2guDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gLS0tDQo+
ICAgRG9jdW1lbnRhdGlvbi9ncHUvZHJtLWludGVybmFscy5yc3QgfCAgICA5IC0tLS0tLS0t
LQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA5IGRlbGV0aW9ucygtKQ0KPiANCj4gLS0tIGxueC01
MTUtcmM0Lm9yaWcvRG9jdW1lbnRhdGlvbi9ncHUvZHJtLWludGVybmFscy5yc3QNCj4gKysr
IGxueC01MTUtcmM0L0RvY3VtZW50YXRpb24vZ3B1L2RybS1pbnRlcm5hbHMucnN0DQo+IEBA
IC0xMTEsMTUgKzExMSw2IEBAIENvbXBvbmVudCBIZWxwZXIgVXNhZ2UNCj4gICAuLiBrZXJu
ZWwtZG9jOjogZHJpdmVycy9ncHUvZHJtL2RybV9kcnYuYw0KPiAgICAgIDpkb2M6IGNvbXBv
bmVudCBoZWxwZXIgdXNhZ2UgcmVjb21tZW5kYXRpb25zDQo+ICAgDQo+IC1JUlEgSGVscGVy
IExpYnJhcnkNCj4gLX5+fn5+fn5+fn5+fn5+fn5+fg0KPiAtDQo+IC0uLiBrZXJuZWwtZG9j
OjogZHJpdmVycy9ncHUvZHJtL2RybV9pcnEuYw0KPiAtICAgOmRvYzogaXJxIGhlbHBlcnMN
Cj4gLQ0KPiAtLi4ga2VybmVsLWRvYzo6IGRyaXZlcnMvZ3B1L2RybS9kcm1faXJxLmMNCj4g
LSAgIDpleHBvcnQ6DQo+IC0NCj4gICBNZW1vcnkgTWFuYWdlciBJbml0aWFsaXphdGlvbg0K
PiAgIH5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+DQo+ICAgDQo+IA0KDQotLSANClRo
b21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3
YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJu
YmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bD
vGhyZXI6IEZlbGl4IEltZW5kw7ZyZmZlcg0K

--------------KtZHZu2h0AuPS5749nMcYvt3--

--------------DIjCGkAyd5DDzKcVeKdN9qYh
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmFb9PAFAwAAAAAACgkQlh/E3EQov+A1
mBAAg5pJMbrPiLOCdtHi2//ggsKFS8SEBKe+5furHdayiC/TVdrXvN4Q/jFRKDpk2QMbQbDtMLvY
ngK4qfIMvAH6akaaewB8DFCMmzbOPiCPhPspPED3ccirycI9VPzzd3TdpB7c2dha/+Vr/rkTiuKa
5X2niXUFMEiJlqetHQMjZvzp38r+DRLWwMk05CL3omzlTA5WqJ6wHl6R+JrBdY7KtDsWbk+z8cO/
/4xdK4HXBCyvGBZJSGcyxFBCsT/+hRYCGP1oZBpWUbYihsrkLyAlOxdqujv+pD0MB4Qb754vjnz+
C9vdB/5tpW0oEkSl9h7fo7Y5QMUlwXB9Ge55f/hmN4FH/Vpm9I2539OJcAH46HnGewzwc0RhvDyD
Zv1/el5YfCsuYuow8XAKzno3qyLTnoLQ8UsogWv4DLxH6HaB1JwhJHMMZre0nAoFZkDbKnKvL7Cb
odcG7OKURuP9ZnzRz7J0Gck9YCkaO7B/c3GTQ8eIPmmGbkj4XmZ5s9JK99CFeqjdgF/OCCKB2q7I
cy6KU1jfnuNJY6aXhiVfWrg0XxIvPW+KvKJkFTOy5SBsMX0+ugXenNCxvV0285m9jOCWK8uU97+6
C5EBi/daDnFdpUflk4rECDkxzCrnkP9bFr/u9G70uxF1yBVK4iQ6KmxruPjHD4iR/73j2lNN7cfm
lAM=
=aN0i
-----END PGP SIGNATURE-----

--------------DIjCGkAyd5DDzKcVeKdN9qYh--
