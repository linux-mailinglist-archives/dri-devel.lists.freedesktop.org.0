Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B075F51A2A5
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 16:53:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB7E110ECF8;
	Wed,  4 May 2022 14:53:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9199910ECF8
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 14:53:33 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 36BEC1F745;
 Wed,  4 May 2022 14:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1651676012; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ryrfhi8ihAoArmiDGpFdAkmPMkFf9gvMlRtXEfi1WiQ=;
 b=oC8mpRfm2o/4qCvqkgSXtQTLctrHpySltQyWCEdusvvZ5vGQxG8CViIidyVBeqvM5T7W+R
 lYC8VBYbFV4PHc/3Q1AcN2lbJydRQilWn8AIuQm1zkf57sfWNgdULYkmd4QKVOd8jjpYFB
 ME2TrpLGHY8Ag75uYkuNXGfDWl97oAo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1651676012;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ryrfhi8ihAoArmiDGpFdAkmPMkFf9gvMlRtXEfi1WiQ=;
 b=AshW05Bp+O9KF7+Rx+OeQG6AZ8DZ1R8LGNDdN+l8GcwhTyrhz+rro9frq7F3byQbVakGP2
 ovdbncx3FkBWbJDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1BF39131BD;
 Wed,  4 May 2022 14:53:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id JXrYBWyTcmI1IQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 04 May 2022 14:53:32 +0000
Message-ID: <b6bc4699-dcb5-f4e7-da58-658d5fbc6ca1@suse.de>
Date: Wed, 4 May 2022 16:53:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 3/3] mgag200: Warn once if trying to set start address
 on broken hardware.
Content-Language: en-US
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 lyude@redhat.com
References: <20220504134026.283417-1-jfalempe@redhat.com>
 <20220504134026.283417-4-jfalempe@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220504134026.283417-4-jfalempe@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Z7UtvxGC8cR2kSh8u2mwPD0L"
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
Cc: michel@daenzer.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Z7UtvxGC8cR2kSh8u2mwPD0L
Content-Type: multipart/mixed; boundary="------------nrMP8xdOIrpmT3Um009RbjPz";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 lyude@redhat.com
Cc: michel@daenzer.net
Message-ID: <b6bc4699-dcb5-f4e7-da58-658d5fbc6ca1@suse.de>
Subject: Re: [PATCH v2 3/3] mgag200: Warn once if trying to set start address
 on broken hardware.
References: <20220504134026.283417-1-jfalempe@redhat.com>
 <20220504134026.283417-4-jfalempe@redhat.com>
In-Reply-To: <20220504134026.283417-4-jfalempe@redhat.com>

--------------nrMP8xdOIrpmT3Um009RbjPz
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDQuMDUuMjIgdW0gMTU6NDAgc2NocmllYiBKb2NlbHluIEZhbGVtcGU6DQo+
IFNvbWUgTUdBMjAwIGhhcmR3YXJlIGFyZSBicm9rZW4sIGFuZCBjYW4ndCB1c2UgYSBzdGFy
dCBhZGRyZXNzID4gMA0KDQpJJ20gbm90IGEgbmF0aXZlIHNwZWFrZXIsIGJ1dCAnaXMgYnJv
a2VuJyAod2l0aG91dCBjb21tYSkgd291bGQgc291bmQgDQpiZXR0ZXIgdG8gbWUuIFRoZSBw
ZXJpb2QgYXQgdGhlIGVuZCBvZiB0aGUgc2VudGVuY2UgaXMgbWlzc2luZy4NCg0KQmVzdCBy
ZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gdjI6IFdhcm4gaWYgc3RhcnRhZGRyIGlzIG5vdCAw
LCBhbmQgaHcgZG9lc24ndCBzdXBwb3J0IGl0Lg0KPiAgICAoaW5zdGVhZCBvZiByZW1vdmlu
ZyBNR0FHMjAwX0ZMQUdfSFdfQlVHX05PX1NUQVJUQUREKQ0KPiANCj4gU2lnbmVkLW9mZi1i
eTogSm9jZWx5biBGYWxlbXBlIDxqZmFsZW1wZUByZWRoYXQuY29tPg0KPiAtLS0NCj4gICBk
cml2ZXJzL2dwdS9kcm0vbWdhZzIwMC9tZ2FnMjAwX21vZGUuYyB8IDMgKysrDQo+ICAgMSBm
aWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbW9kZS5jIGIvZHJpdmVycy9ncHUvZHJtL21n
YWcyMDAvbWdhZzIwMF9tb2RlLmMNCj4gaW5kZXggMmJjMzgwYTg1OTk2Li5kMmNmMjZiM2Nl
ZTAgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbW9k
ZS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbW9kZS5jDQo+
IEBAIC0yMjMsNiArMjIzLDkgQEAgc3RhdGljIHZvaWQgbWdhZzIwMF9zZXRfc3RhcnRhZGQo
c3RydWN0IG1nYV9kZXZpY2UgKm1kZXYsDQo+ICAgDQo+ICAgCXN0YXJ0YWRkID0gb2Zmc2V0
IC8gODsNCj4gICANCj4gKwlpZiAoc3RhcnRhZGQgPiAwKQ0KPiArCQlkcm1fV0FSTl9PTl9P
TkNFKGRldiwgbWRldi0+ZmxhZ3MgJiBNR0FHMjAwX0ZMQUdfSFdfQlVHX05PX1NUQVJUQURE
KTsNCj4gKw0KPiAgIAkvKg0KPiAgIAkgKiBDYW4ndCBzdG9yZSBhZGRyZXNzZXMgYW55IGhp
Z2hlciB0aGFuIHRoYXQsIGJ1dCB3ZSBhbHNvDQo+ICAgCSAqIGRvbid0IGhhdmUgbW9yZSB0
aGFuIDE2IE1pQiBvZiBtZW1vcnksIHNvIGl0IHNob3VsZCBiZSBmaW5lLg0KDQotLSANClRo
b21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3
YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJu
YmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bD
vGhyZXI6IEl2byBUb3Rldg0K

--------------nrMP8xdOIrpmT3Um009RbjPz--

--------------Z7UtvxGC8cR2kSh8u2mwPD0L
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJyk2sFAwAAAAAACgkQlh/E3EQov+Aj
vxAAluGqJ7TAWLTsGtmyMifBNiG3+9xwiLBqH4U8hRxoMGfg6rx+x7yFDze8ZIxtxN4PzEwPtoed
11Q3YSRmfVVZzZ1WwWU9nHmBjvj1LDFMIOw+0OduB50fgGIq6RraYU5TQjSevd/ryes3QT8Jb9YA
iI7KcEMe0ANsBBujIbPVq0Xbxs4XiYvItDts+xqUS1a7Wx4cM5JozkOdk95ybWiCHTf+9fi0VLZo
w4n3iNwTlpmv7+3hnuffAl259sP1I+aKs9OBu0gPahgyb5/aoAyXy5qf3SeSL0Y+0uY9F2sQ06oZ
N1V/D5EkocrwfCynVIlblb3ZMql022HTxL8yngcfoON9EZpK77lRR6l04oBkDp29VNDYaVX1q+M6
aDdl/X/m1bCCqHS/lZWGzv3tQ5zprrVWQiHka6pWx9J+IdgnrUD3H7+emrfKnCFVsIb7+zSfaKPa
A+Ql7aveK4BEPsilxH4YCUPQTOthELCZRpw3ZW+VSMzjgMHMHVhSvyWEUbVupu7lRD8Wz/t4i9ky
6WlT+p8ow6e80AZjvRUZvDAc/fobaZn2xE/QyWHA3m41rhawgnpGE909gpyCckMPvTr6hO3B7346
e2qOaoWjBaprJOA5h2Qm8HMReDJhp9+0pZkUjjqEyYkq7Javf3BYpaz4nnxC56NSzod+6+1y/8s0
7TQ=
=EzgO
-----END PGP SIGNATURE-----

--------------Z7UtvxGC8cR2kSh8u2mwPD0L--
