Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B11260C4FE
	for <lists+dri-devel@lfdr.de>; Tue, 25 Oct 2022 09:25:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A5CE10E186;
	Tue, 25 Oct 2022 07:25:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CB4810E18E;
 Tue, 25 Oct 2022 07:25:10 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D8CBB1FD4D;
 Tue, 25 Oct 2022 07:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1666682708; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c1zBcQjlKqmAqONNyJStB2TFUvYljW90mDr6TmD2Gnc=;
 b=f/GPpnciZhe/471afUnYxMiSXV1JEB4ZxIKgD4Imf6V86kY01ygFX84Fmg0IGfAM/UOEh6
 DFQ3S9143G4BczdSnZzEVAnOX98Wx6OvCDjjSIhcJCKxEENFSkRLEnXURBaQULGEslLHNk
 dyAtzWvZDOidtIVxjuA6Oeo62zJJW08=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1666682708;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c1zBcQjlKqmAqONNyJStB2TFUvYljW90mDr6TmD2Gnc=;
 b=GgbBBh3gZf2vjn4j1/kmRf7k87CRUqYHLD2rTbxIbwr1NX7rq0qbD8X1GjPdW2y4Jsf/Gh
 qFd5oJZbYhM9H4CQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B856C13A64;
 Tue, 25 Oct 2022 07:25:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id XGTmK1SPV2MwfAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 25 Oct 2022 07:25:08 +0000
Message-ID: <ede1abed-d45f-6fb6-cf40-edbffece5eac@suse.de>
Date: Tue, 25 Oct 2022 09:25:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH] drm/amdgpu: don't call drm_fb_helper_lastclose in
 lastclose()
To: Alex Deucher <alexdeucher@gmail.com>
References: <20221020143603.563929-1-alexander.deucher@amd.com>
 <DM6PR12MB26194FC4A9B18912448DA8CEE42E9@DM6PR12MB2619.namprd12.prod.outlook.com>
 <e494d819-f960-f2bd-913e-83ee820ac399@suse.de>
 <CADnq5_P7r71zETyJRZ+KVKFS+C56NAZaht5stVE=uZQ6tP6fdg@mail.gmail.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CADnq5_P7r71zETyJRZ+KVKFS+C56NAZaht5stVE=uZQ6tP6fdg@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------77oQOgQwTOSLvMCTI7ygFwWj"
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Quan,
 Evan" <Evan.Quan@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------77oQOgQwTOSLvMCTI7ygFwWj
Content-Type: multipart/mixed; boundary="------------x6lyFpijeyUbKYEiuBYsA8VI";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Alex Deucher <alexdeucher@gmail.com>
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Quan, Evan" <Evan.Quan@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Message-ID: <ede1abed-d45f-6fb6-cf40-edbffece5eac@suse.de>
Subject: Re: [PATCH] drm/amdgpu: don't call drm_fb_helper_lastclose in
 lastclose()
References: <20221020143603.563929-1-alexander.deucher@amd.com>
 <DM6PR12MB26194FC4A9B18912448DA8CEE42E9@DM6PR12MB2619.namprd12.prod.outlook.com>
 <e494d819-f960-f2bd-913e-83ee820ac399@suse.de>
 <CADnq5_P7r71zETyJRZ+KVKFS+C56NAZaht5stVE=uZQ6tP6fdg@mail.gmail.com>
In-Reply-To: <CADnq5_P7r71zETyJRZ+KVKFS+C56NAZaht5stVE=uZQ6tP6fdg@mail.gmail.com>

--------------x6lyFpijeyUbKYEiuBYsA8VI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjQuMTAuMjIgdW0gMTg6NDggc2NocmllYiBBbGV4IERldWNoZXI6DQo+IE9u
IE1vbiwgT2N0IDI0LCAyMDIyIGF0IDM6MzMgQU0gVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1t
ZXJtYW5uQHN1c2UuZGU+IHdyb3RlOg0KPj4NCj4+IEhpDQo+Pg0KPj4gQW0gMjQuMTAuMjIg
dW0gMDg6MjAgc2NocmllYiBRdWFuLCBFdmFuOg0KPj4+IFtBTUQgT2ZmaWNpYWwgVXNlIE9u
bHkgLSBHZW5lcmFsXQ0KPj4+DQo+Pj4gUmV2aWV3ZWQtYnk6IEV2YW4gUXVhbiA8ZXZhbi5x
dWFuQGFtZC5jb20+DQo+Pj4NCj4+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4+
Pj4gRnJvbTogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zz4gT24gQmVoYWxmIE9mIEFsZXgNCj4+Pj4gRGV1Y2hlcg0KPj4+PiBTZW50OiBUaHVyc2Rh
eSwgT2N0b2JlciAyMCwgMjAyMiAxMDozNiBQTQ0KPj4+PiBUbzogYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmc7IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4+Pj4g
Q2M6IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT47IFRo
b21hcw0KPj4+PiBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPj4+PiBTdWJq
ZWN0OiBbUEFUQ0hdIGRybS9hbWRncHU6IGRvbid0IGNhbGwgZHJtX2ZiX2hlbHBlcl9sYXN0
Y2xvc2UgaW4NCj4+Pj4gbGFzdGNsb3NlKCkNCj4+Pj4NCj4+Pj4gSXQncyB1c2VkIHRvIHJl
c3RvcmUgdGhlIGZiZGV2IGNvbnNvbGUsIGJ1dCBhcyBhbWRncHUgdXNlcw0KPj4+PiBnZW5l
cmljIGZiZGV2IGVtdWxhdGlvbiwgdGhlIGNvbnNvbGUgaXMgYmVpbmcgcmVzdG9yZWQgYnkg
dGhlDQo+Pj4+IERSTSBjbGllbnQgaGVscGVycyBhbHJlYWR5LiBTZWUgdGhlIGNhbGwgdG8g
ZHJtX2NsaWVudF9kZXZfcmVzdG9yZSgpDQo+Pj4+IGluIGRybV9sYXN0Y2xvc2UoKS4NCj4+
Pj4NCj4+Pj4gRml4ZXM6IDA4NzQ1MWYzNzJiZjc2ICgiZHJtL2FtZGdwdTogdXNlIGdlbmVy
aWMgZmIgaGVscGVycyBpbnN0ZWFkIG9mDQo+Pj4+IHNldHRpbmcgdXAgQU1EIG93bidzLiIp
DQo+Pj4+IENjOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4+
Pj4gU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQu
Y29tPg0KPj4+PiAtLS0NCj4+Pj4gICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X2ttcy5jIHwgMSAtDQo+Pj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0p
DQo+Pj4+DQo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfa21zLmMNCj4+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
a21zLmMNCj4+Pj4gaW5kZXggZmUyM2UwOWVlYzk4Li40NzRiOWY0MGY3OTIgMTAwNjQ0DQo+
Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9rbXMuYw0KPj4+
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfa21zLmMNCj4+Pj4g
QEAgLTExMDYsNyArMTEwNiw2IEBAIGludCBhbWRncHVfaW5mb19pb2N0bChzdHJ1Y3QgZHJt
X2RldmljZSAqZGV2LA0KPj4+PiB2b2lkICpkYXRhLCBzdHJ1Y3QgZHJtX2ZpbGUgKmZpbHAp
DQo+Pj4+ICAgICAqLw0KPj4+PiAgICB2b2lkIGFtZGdwdV9kcml2ZXJfbGFzdGNsb3NlX2tt
cyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQ0KPj4+PiAgICB7DQo+Pj4+IC0gICAgZHJtX2Zi
X2hlbHBlcl9sYXN0Y2xvc2UoZGV2KTsNCj4+Pj4gICAgICAgdmdhX3N3aXRjaGVyb29fcHJv
Y2Vzc19kZWxheWVkX3N3aXRjaCgpOw0KPj4+PiAgICB9DQo+Pg0KPj4gV2l0aG91dCB0aGUg
Y2FsbCB0byBkcm1fZmJfaGVscGVyX2xhc3RjbG9zZSgpLCB0aGUgY29uc29sZSBlbXVsYXRp
b24NCj4+IHdpbGwgYmUgcmVzdG9yZWQgYnkgZHJtX2NsaWVudF9kZXZfcmVzdG9yZSgpIGZy
b20gZHJtX2xhc3RjbG9zZSgpLiBbMV0NCj4+IEl0IG1lYW5zIHRoYXQgaXQncyBub3cgY2hh
bmdpbmcgb3JkZXIgd2l0aCB0aGUgY2FsbCB0bw0KPj4gdmdhX3N3aXRjaGVyb29fcHJvY2Vz
c19kZWxheV9zd2l0Y2goKS4gQ2FuIHRoaXMgYmVjb21lIGEgcHJvYmxlbT8NCj4+DQo+PiBJ
IGxvb2tlZCBhdCB0aGUgb3RoZXIgY2FsbGVycyBvZiB0aGF0IGZ1bmN0aW9uLiBNb3N0IHJl
c3RvcmUgdGhlIGNvbnNvbGUNCj4+IGJlZm9yZSBkb2luZyB0aGUgc3dpdGNoZXJvby4gTm91
dmVhdSBkb2Vzbid0IHNlZW0gdG8gY2FyZSBhYm91dCB0aGUNCj4+IGNvbnNvbGUgYXQgYWxs
Lg0KPiANCj4gSSBkb24ndCBrbm93IG9mZiBoYW5kLiAgSSBzdXBwb3NlIGlmIHRoZSBzd2l0
Y2ggcG93ZXJlZCBkb3duIHRoZSBHUFUNCj4gYW5kIHRoZW4gd2UgdHJpZWQgdG8gcmVzdG9y
ZSBpdCdzIGNvbnNvbGUgc3RhdGUgdGhhdCB3b3VsZCBiZSBhDQo+IHByb2JsZW0sIGJ1dCBp
dCBsb29rcyBsaWtlIHZnYV9zd2l0Y2h0b19zdGFnZTIoKSBqdXN0IHBvd2VycyBkb3duIHRo
ZQ0KPiBHUFUgd2l0aG91dCBnb2luZyB0aHJvdWdoIHN1c3BlbmQgc28gSSdtIG5vdCBzdXJl
IGlmIHRoaXMgYWN0dWFsbHkNCj4gd29ya2VkIGNvcnJlY3RseT8gIFdoYXQgYXJlIHRoZSBw
b3RlbnRpYWwgcHJvYmxlbXMgd2l0aCBjYWxsaW5nDQo+IGRybV9mYl9oZWxwZXJfbGFzdGNs
b3NlIHR3aWNlPw0KDQpJdCBzaG91bGQgZG8gZmJkZXYgY29uc29sZSBtb2Rlc2V0dGluZyB0
d2ljZTsgc28gbm8gcHJvYmxlbS4NCg0KQUZBSVUgY2FsbGluZyB2Z2Egc3dpdGNoZXJvbyBk
b2VzIG5vdGhpbmcgZm9yIGRldmljZXMgd2l0aG91dCBzdXBwb3J0LiANClNvIGxldCdzIGNh
bGwgdmdhX3N3aXRjaGVyb29fcHJvY2Vzc19kZWxheWVkX3N3aXRjaCgpIGF0IHRoZSB2ZXJ5
IGVuZCBvZiANCmRybV9sYXN0Y2xvc2UoKSBhbmQgcmVtb3ZlIHRoZSBhbWRncHUgY2FsbGJh
Y2sgZW50aXJlbHkuIFsxXSAgVGhpcyANCnNob3VsZCBub3QgYmUgYSBwcm9ibGVtIGFuZCBp
Ziwgd2UgY2FuIHJlZmFjdG9yIHRoZSB3aG9sZSBmdW5jdGlvbi4NCg0KQmVzdCByZWdhcmRz
DQpUaG9tYXMNCg0KWzFdIA0KaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvbGF0
ZXN0L3NvdXJjZS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZpbGUuYyNMNDY4DQoNCj4gDQo+IEFs
ZXgNCj4gDQo+Pg0KPj4gQmVzdCByZWdhcmRzDQo+PiBUaG9tYXMNCj4+DQo+PiBbMV0NCj4+
IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjAuMy9zb3VyY2UvZHJpdmVy
cy9ncHUvZHJtL2RybV9maWxlLmMjTDQ2Nw0KPj4NCj4+Pj4NCj4+Pj4gLS0NCj4+Pj4gMi4z
Ny4zDQo+Pg0KPj4gLS0NCj4+IFRob21hcyBaaW1tZXJtYW5uDQo+PiBHcmFwaGljcyBEcml2
ZXIgRGV2ZWxvcGVyDQo+PiBTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgN
Cj4+IE1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KPj4gKEhSQiAz
NjgwOSwgQUcgTsO8cm5iZXJnKQ0KPj4gR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K
DQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpT
VVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkw
NDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2Vz
Y2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------x6lyFpijeyUbKYEiuBYsA8VI--

--------------77oQOgQwTOSLvMCTI7ygFwWj
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmNXj1MFAwAAAAAACgkQlh/E3EQov+AU
iA//UPHlzRS1HScXqliH4rRY3M+yNSR3Yn4f2OnGGeRgjeKPe9IkGoVfFxkoqkX7v7XZ4WbZBAFH
eTdcccCJcn8a1X8qk54bcDn6PUCcxpLcFTdy6tTSyL40k5CFC7KBGXXR4/KbhZ17ikV2yik6Ir2r
Gi7gaZ1KNlNKyDCi7MZRRB74BMMXTus5N/uH5YhQHa9MLsZ2i20xWyt9xH+UtuHqzENMmWKp7shf
kqqb+Az7e0jgJbWmgsOs+jFh93LwXyWB3kgKhRar6rsHOVBl5WdacnVpjI7xP+iy3Nad17iwktdJ
dUapmGad05XQuLJTFFJDCv8/LkyvkrmuqXxl2JUURZ/6t7qGSWH6E4hwIwdNXuQcxT0Bp6DakwH6
7NYhO7qPXoiuVgJM5JT2QzL3n2c5NmJp/egOWXYOqndvDWsIglw2wi86TssRuevI1gm5LHmSsQVM
FFxNy9Gb9wj6Hn7UQ8A+86tJrDy6sghY17g2AWllnpx/WhcZjxAAgrh2xARZKozTB6l7ebDvA8c4
vWl0/kZ+wRB9AB31Jb5xdN6/T3aoEKIveDxfD9EtSrj5BEg8EtQrUn8Rjm/lit64wwY4PY3rY7oK
6JahxQuzzlQzRvAAIUFE3sU94duhDaH+Bew67OSUFrQuZ6W0hNMaqKPrTdoh+pFbUevCfbbxU8Yc
nYc=
=Sdr2
-----END PGP SIGNATURE-----

--------------77oQOgQwTOSLvMCTI7ygFwWj--
