Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D045575B8
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 10:42:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCC1411A3A5;
	Thu, 23 Jun 2022 08:42:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 331FC11A3A5
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 08:42:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D70CD21DAB;
 Thu, 23 Jun 2022 08:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1655973769; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sD3bTgg438R/xlPh35R/pRi8nACfuVU2+pQ/XzpwbpE=;
 b=yOLt126VjwmgVhVtMJvQXIfxMSX3pTDHUj7eZiO5LikO24ep+OKG5uvJ4V3HvSLa5nPeG+
 JrZrdbeHH5RgrOLNBLlLA5XgsJGFOCxt5qJiBajjGpnuLepfcDFpSe7Ia8GHht7Lah0yzg
 k/WhDVbmHjBEuSgZRTtxDSGOThqfboQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1655973769;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sD3bTgg438R/xlPh35R/pRi8nACfuVU2+pQ/XzpwbpE=;
 b=ENyeTl/Jo1Vi+HvfHE/2AhjgCXvcI37V1VlY55RmaH8FvXHIJTvj1HEyYAheiD1Dqtmg5c
 ChKL5hVQjn1sN7Bw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AFEB013461;
 Thu, 23 Jun 2022 08:42:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gIYAKokntGLuDQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 23 Jun 2022 08:42:49 +0000
Message-ID: <4988ab02-dbdb-e452-7106-771c2a1ebbca@suse.de>
Date: Thu, 23 Jun 2022 10:42:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: DMA-buf and uncached system memory
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linux-media <linux-media@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linaro-mm-sig@lists.linaro.org,
 lkml <linux-kernel@vger.kernel.org>
References: <91ff0bbb-ea3a-2663-3453-dea96ccd6dd8@amd.com>
 <58e11013-01ab-8a2c-732e-860ae83a3df6@suse.de>
 <dbf87831-1b14-d18f-f8ca-b5fe1f850190@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <dbf87831-1b14-d18f-f8ca-b5fe1f850190@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------OFTYXzYkyT04oFpF7yLvli0j"
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
Cc: "Sharma, Shashank" <Shashank.Sharma@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------OFTYXzYkyT04oFpF7yLvli0j
Content-Type: multipart/mixed; boundary="------------myyGSpB720BVRwpnx5jni6sb";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linux-media <linux-media@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, linaro-mm-sig@lists.linaro.org,
 lkml <linux-kernel@vger.kernel.org>
Cc: "Sharma, Shashank" <Shashank.Sharma@amd.com>
Message-ID: <4988ab02-dbdb-e452-7106-771c2a1ebbca@suse.de>
Subject: Re: DMA-buf and uncached system memory
References: <91ff0bbb-ea3a-2663-3453-dea96ccd6dd8@amd.com>
 <58e11013-01ab-8a2c-732e-860ae83a3df6@suse.de>
 <dbf87831-1b14-d18f-f8ca-b5fe1f850190@amd.com>
In-Reply-To: <dbf87831-1b14-d18f-f8ca-b5fe1f850190@amd.com>

--------------myyGSpB720BVRwpnx5jni6sb
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjMuMDYuMjIgdW0gMTA6MjYgc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOg0K
PiBBbSAyMy4wNi4yMiB1bSAxMDoxMyBzY2hyaWViIFRob21hcyBaaW1tZXJtYW5uOg0KPj4g
SGkgQ2hyaXN0aWFuDQo+Pg0KPj4gQW0gMTUuMDIuMjEgdW0gMDk6NTggc2NocmllYiBDaHJp
c3RpYW4gS8O2bmlnOg0KPj4+IEhpIGd1eXMsDQo+Pj4NCj4+PiB3ZSBhcmUgY3VycmVudGx5
IHdvcmtpbmcgYW4gRnJlZXN5bmMgYW5kIGRpcmVjdCBzY2FuIG91dCBmcm9tIHN5c3RlbSAN
Cj4+PiBtZW1vcnkgb24gQU1EIEFQVXMgaW4gQStBIGxhcHRvcHMuDQo+Pj4NCj4+PiBPbiBw
cm9ibGVtIHdlIHN0dW1ibGVkIG92ZXIgaXMgdGhhdCBvdXIgZGlzcGxheSBoYXJkd2FyZSBu
ZWVkcyB0byANCj4+PiBzY2FuIG91dCBmcm9tIHVuY2FjaGVkIHN5c3RlbSBtZW1vcnkgYW5k
IHdlIGN1cnJlbnRseSBkb24ndCBoYXZlIGEgDQo+Pj4gd2F5IHRvIGNvbW11bmljYXRlIHRo
YXQgdGhyb3VnaCBETUEtYnVmLg0KPj4+DQo+Pj4gRm9yIG91ciBzcGVjaWZpYyB1c2UgY2Fz
ZSBhdCBoYW5kIHdlIGFyZSBnb2luZyB0byBpbXBsZW1lbnQgc29tZXRoaW5nIA0KPj4+IGRy
aXZlciBzcGVjaWZpYywgYnV0IHRoZSBxdWVzdGlvbiBpcyBzaG91bGQgd2UgaGF2ZSBzb21l
dGhpbmcgbW9yZSANCj4+PiBnZW5lcmljIGZvciB0aGlzPw0KPj4NCj4+IEkgaGFkIGEgcGF0
Y2hzZXQgaGVyZSB0aGF0IGV4dGVuZHMgaW9zeXMtbWFwIChmb3JtZXIgZG1hLWJ1Zi1tYXAp
IHdpdGggDQo+PiBjYWNoaW5nIGluZm9ybWF0aW9uLiBJJ2xsIHBvc3QgYSBjb3B5Lg0KPiAN
Cj4gT2gsIG5pY2UuIEJ1dCB3aHkgb24gaW9zeXMtbWFwPyBXZSBuZWVkIHRoYXQgcGVyIERN
QS1idWYuDQoNCkl0J3MgcmV0dXJuZWQgdmlhIHRoZSBkbWEtYnVmJ3Mgdm1hcCBjYWxsIHdp
dGhpbiB0aGUgaW9zeXMtbWFwIA0Kc3RydWN0dXJlLiBJZiB0aGUgZG1hLWJ1ZiBtb3Zlcywg
dGhlIGZvbGxvd2luZyB2bWFwIGNhbGxzIGFsd2F5cyByZXR1cm4gDQp1cGRhdGVkIGNhY2hp
bmcgaW5mb3JtYXRpb24uIE1heWJlIGl0J3Mgbm90IHF1aXRlIHdoYXQgeW91IG5lZWQgZm9y
IA0KRnJlZXN5bmM/DQoNCkknbGwgdXNlIHRoaXMgZm9yIGZvcm1hdC1jb252ZXJzaW9uIGhl
bHBlcnMsIHdoaWNoIGRvIHNvbWUgb3B0aW1pemF0aW9ucyANCmZvciB1bmNhY2hlZCBtZW1v
cnkuDQoNCkFueXdheSwgSSBoYXZlIHRvIGxvb2sgZm9yIHRoYXQgcGF0Y2guLi4NCg0KQmVz
dCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gVGhhbmtzLA0KPiBDaHJpc3RpYW4uDQo+IA0K
Pj4NCj4+IFNvcnJ5IGZvciBiZWluZyBsYXRlIHRvIHJlcGx5Lg0KPj4NCj4+IEJlc3QgcmVn
YXJkcw0KPj4gVGhvbWFzDQo+Pg0KPj4+DQo+Pj4gQWZ0ZXIgYWxsIHRoZSBzeXN0ZW0gbWVt
b3J5IGFjY2VzcyBwYXR0ZXJuIGlzIGEgUENJZSBleHRlbnNpb24gYW5kIGFzIA0KPj4+IHN1
Y2ggc29tZXRoaW5nIGdlbmVyaWMuDQo+Pj4NCj4+PiBSZWdhcmRzLA0KPj4+IENocmlzdGlh
bi4NCj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xw0KPj4+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QNCj4+PiBkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnDQo+Pj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwNCj4+DQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5u
DQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBH
ZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0K
KEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rl
dg0K

--------------myyGSpB720BVRwpnx5jni6sb--

--------------OFTYXzYkyT04oFpF7yLvli0j
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmK0J4kFAwAAAAAACgkQlh/E3EQov+B7
YRAApxYE2c7ND8+f3+6Pb52FGy24VVNeAU84N4QiFMoEpWR+3aKnxm+vJ5ATwT/rgBltjQzuGi0P
4IEQeDvjSQfFEYcICM9RaI8LHgIZ0aLGNcETRI/hRDtmcoYuxI5bHG4ZlE8rMjgyDDsuv0wDr06P
PdrLMoIPTbTsQFHvVhJnJN6Ma5U1gr+5LHtl4v1aqNoKM4SB01gqARjjRuqCf6TjNK20OtiXrf6j
UTFDmV+nIGnaqVv1Vsnyo4LDuQG56Euqukj000STCSq7HJBFnR+XYpxUw+PUREZghbrh6nDSwxmP
seHg5qW7DT0nVaHv7J2AnecNKsUtdOfag0m+AtRcbIfTDtnUqetSmRcOgjYyqLQ09uWVQX62NGPA
l0SXUrC0/FeVmnr09gZPKBLMOYXkIW4bwYAUogUxjqtZNvCeS3obrQ+yA90KRK8t4G+S6WRUtadh
tOCU+8dSQ1wqVOd0YXbzFbC6B+NHMiZdKQc2w3PBOB5fUUE2TqWKffzX+GWKH2siDi0OZjm4mpxt
eca8KcyqeTesewXKr/Pvda2qhvivA0t9vzwnc/dyqrHVxarav/qEsXkKbdyOr8XpOEPnT8QjbqKU
XERka4C+OWYvfmHa329/3lgkaBMW9EFDguDb6nNcCEd/sToOJEJM+4mhs+WZGaoQaXK3XYIZkV8f
sQ0=
=Nj+f
-----END PGP SIGNATURE-----

--------------OFTYXzYkyT04oFpF7yLvli0j--
