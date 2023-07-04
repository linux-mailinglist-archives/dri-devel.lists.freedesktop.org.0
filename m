Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6817473F0
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 16:19:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD0B310E174;
	Tue,  4 Jul 2023 14:19:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A5E410E174
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 14:19:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1DBD11FDBE;
 Tue,  4 Jul 2023 14:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1688480366; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wtrK/tz4klsSzH0niLmPtspJHTBvv4T/OtDkmUOmY2o=;
 b=nMVDGaxBRs/dmqXX/zusPKay4qhRZCvxZXAU16dafQ3eQBOSdBcKKnZ3NjdAkYXAgWTlcH
 DRSgNdFs5cQs2+7kLCAGOscIkNjI4MuenoXXa6IJEfIl2jWIHpag2mSDa9duZ2F7Rkoa/0
 IW3PKTHP1EvqOcaTIUktBVLLk48LgJY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1688480366;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wtrK/tz4klsSzH0niLmPtspJHTBvv4T/OtDkmUOmY2o=;
 b=QdJ/Lk6Vt2D5aauG8gO89YfT+9zoL1BznHMJfvaHASZtTz5BGNyPtOhHAApEQmp5sJP2+x
 1H4Tife3g0rE8zDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F11311346D;
 Tue,  4 Jul 2023 14:19:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 7EPOOW0qpGSwdQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 04 Jul 2023 14:19:25 +0000
Message-ID: <2422ef03-a309-2789-04ec-a8c4559f5024@suse.de>
Date: Tue, 4 Jul 2023 16:19:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] drm/ast: Fix default resolution when no monitor is
 connected on DP
To: Jocelyn Falempe <jfalempe@redhat.com>, airlied@redhat.com,
 kuohsiang_chou@aspeedtech.com, jammy_huang@aspeedtech.com
References: <20230623094639.434293-1-jfalempe@redhat.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230623094639.434293-1-jfalempe@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------nKSPui68IKIVe02YU1T84z0y"
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------nKSPui68IKIVe02YU1T84z0y
Content-Type: multipart/mixed; boundary="------------8fkNY3JE3hm5E7xOXFkjsu4z";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jocelyn Falempe <jfalempe@redhat.com>, airlied@redhat.com,
 kuohsiang_chou@aspeedtech.com, jammy_huang@aspeedtech.com
Cc: dri-devel@lists.freedesktop.org
Message-ID: <2422ef03-a309-2789-04ec-a8c4559f5024@suse.de>
Subject: Re: [PATCH] drm/ast: Fix default resolution when no monitor is
 connected on DP
References: <20230623094639.434293-1-jfalempe@redhat.com>
In-Reply-To: <20230623094639.434293-1-jfalempe@redhat.com>

--------------8fkNY3JE3hm5E7xOXFkjsu4z
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgSm9jZWx5bg0KDQpBbSAyMy4wNi4yMyB1bSAxMTo0NiBzY2hyaWViIEpvY2VseW4gRmFs
ZW1wZToNCj4gU2luY2UgY29tbWl0IGZhZTdkMTg2NDAzZSAoImRybS9wcm9iZS1oZWxwZXI6
IERlZmF1bHQgdG8gNjQweDQ4MCBpZiBubw0KPiAgIEVESUQgb24gRFAiKQ0KPiBUaGUgZGVm
YXVsdCByZXNvbHV0aW9uIGlzIG5vdyA2NDB4NDgwIHdoZW4gbm8gbW9uaXRvciBpcyBjb25u
ZWN0ZWQuDQo+IEJ1dCBBc3BlZWQgZ3JhcGhpY3MgaXMgbW9zdGx5IHVzZWQgaW4gc2VydmVy
cywgd2hlcmUgbm8gbW9uaXRvcg0KPiBpcyBhdHRhY2hlZC4gVGhpcyBhbHNvIGFmZmVjdHMg
dGhlICJyZW1vdGUiIHJlc29sdXRpb24gdG8gNjQweDQ4MCwgd2hpY2ggaXMNCj4gaW5jb252
ZW5pZW50LCBhbmQgYnJlYWtzIHRoZSBhbmFjb25kYSBpbnN0YWxsZXIuDQoNCkJ5ICJyZW1v
dGUgcmVzb2x1dGlvbiIsIHlvdSBtZWFuIHRoZSBkaXNwbGF5IG1vZGUgdGhhdCB0aGUgQk1D
IHVzZXM/DQoNCj4gU28gd2hlbiBubyBFRElEIGlzIHByZXNlbnQsIHNldCAxMDI0eDc2OCBh
cyBwcmVmZXJyZWQgcmVzb2x1dGlvbi4NCj4gDQo+IEZpeGVzOiBmYWU3ZDE4NjQwM2UgKCJk
cm0vcHJvYmUtaGVscGVyOiBEZWZhdWx0IHRvIDY0MHg0ODAgaWYgbm8gRURJRCBvbiBEUCIp
DQoNClRoaXMgY29tbWl0IHNheXMgdGhhdCA2NDB4NDgwIGlzIHRoZSBkZXNpZ25hdGVkIGZh
aWxzYWZlIG1vZGUgaWYgbm8gRURJRCANCmlzIGF2YWlsYWJsZS4gVGhlcmVmb3JlLCBJIHRo
aW5rIHdlIHNob3VsZCBub3Qgb3ZlcnJpZGUgaXQgDQp1bmNvbmRpdGlvbmFsbHkuIFRoZSBh
c3QgZHJpdmVyIGlzIG5vIHNwZWNpYWwgaW4gdGhhdCBjYXNlLg0KDQpCdXQgSSBzZWUgd2h5
IHlvdSdyZSBkb2luZyB0aGlzIGNoYW5nZS4gSSB0aGluayBhbnkgc29sdXRpb24gc2hvdWxk
IGJlIA0KaW1wbGVtZW50ZWQgaW4gZHJtX2hlbHBlcl9wcm9iZV9zaW5nbGVfY29ubmVjdG9y
X21vZGVzKCkuDQoNCkJ1dCBiZWZvcmUgd2Ugc29sdmUgdGhpcyBpbiB0aGUga2VybmVsLCBp
cyBpdCBwb3NzaWJsZSB0byBkZWxlZ2F0ZSB0aGlzIA0KdG8gdXNlcnNwYWNlPyBJZiBubyBF
RElEIGhhcyBiZWVuIGdpdmVuLCB1c2Vyc3BhY2UgY291bGQgdHJ5IGEgDQpub24tZmFpbHNh
ZmUgZGlzcGxheSBtb2RlLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IFNpZ25lZC1v
ZmYtYnk6IEpvY2VseW4gRmFsZW1wZSA8amZhbGVtcGVAcmVkaGF0LmNvbT4NCj4gLS0tDQo+
ICAgZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9kZS5jIHwgMjYgKysrKysrKysrKysrKysr
KysrKysrKysrLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXN0L2Fz
dF9tb2RlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tb2RlLmMNCj4gaW5kZXggMzYz
NzQ4MjhmNmM4Li44ZjdiN2NjMDIxYzcgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hc3QvYXN0X21vZGUuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tb2Rl
LmMNCj4gQEAgLTE1ODksOSArMTU4OSwzMSBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9j
b25uZWN0b3JfaGVscGVyX2Z1bmNzIGFzdF9kcDUwMV9jb25uZWN0b3JfaGVscGVyX2Z1bmNz
DQo+ICAgCS5nZXRfbW9kZXMgPSBhc3RfZHA1MDFfY29ubmVjdG9yX2hlbHBlcl9nZXRfbW9k
ZXMsDQo+ICAgfTsNCj4gICANCj4gK3N0YXRpYyBpbnQgYXN0X2RwX3Byb2JlX3NpbmdsZV9j
b25uZWN0b3JfbW9kZXMoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciwNCj4gKwkJ
CQkJICAgICAgIHVpbnQzMl90IG1heFgsIHVpbnQzMl90IG1heFkpDQo+ICt7DQo+ICsJaW50
IHJldDsNCj4gKwlzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZTsNCj4gKw0KPiArCXJl
dCA9IGRybV9oZWxwZXJfcHJvYmVfc2luZ2xlX2Nvbm5lY3Rvcl9tb2Rlcyhjb25uZWN0b3Is
IG1heFgsIG1heFkpOw0KPiArCS8qDQo+ICsJICogV2hlbiBubyBtb25pdG9yIGFyZSBkZXRl
Y3RlZCwgRFAgbm93IGRlZmF1bHQgdG8gNjQweDQ4MA0KPiArCSAqIEFzIGFzcGVlZCBpcyBt
b3N0bHkgdXNlZCBpbiByZW1vdGUgc2VydmVyLCBhbmQgRFAgbW9uaXRvcnMgYXJlDQo+ICsJ
ICogcmFyZWx5IGF0dGFjaGVkLCBpdCdzIGJldHRlciB0byBkZWZhdWx0IHRvIDEwMjR4NzY4
DQo+ICsJICovDQo+ICsJaWYgKCFjb25uZWN0b3ItPmVkaWRfYmxvYl9wdHIpIHsNCj4gKwkJ
bGlzdF9mb3JfZWFjaF9lbnRyeShtb2RlLCAmY29ubmVjdG9yLT5tb2RlcywgaGVhZCkgew0K
PiArCQkJaWYgKG1vZGUtPmhkaXNwbGF5ID09IDEwMjQgJiYgbW9kZS0+dmRpc3BsYXkgPT0g
NzY4KQ0KPiArCQkJCW1vZGUtPnR5cGUgfD0gRFJNX01PREVfVFlQRV9QUkVGRVJSRUQ7DQo+
ICsJCQlkcm1fbW9kZV9zb3J0KCZjb25uZWN0b3ItPm1vZGVzKTsNCj4gKwkJfQ0KPiArCX0N
Cj4gKwlyZXR1cm4gcmV0Ow0KPiArfQ0KPiArDQo+ICAgc3RhdGljIGNvbnN0IHN0cnVjdCBk
cm1fY29ubmVjdG9yX2Z1bmNzIGFzdF9kcDUwMV9jb25uZWN0b3JfZnVuY3MgPSB7DQo+ICAg
CS5yZXNldCA9IGRybV9hdG9taWNfaGVscGVyX2Nvbm5lY3Rvcl9yZXNldCwNCj4gLQkuZmls
bF9tb2RlcyA9IGRybV9oZWxwZXJfcHJvYmVfc2luZ2xlX2Nvbm5lY3Rvcl9tb2RlcywNCj4g
KwkuZmlsbF9tb2RlcyA9IGFzdF9kcF9wcm9iZV9zaW5nbGVfY29ubmVjdG9yX21vZGVzLA0K
PiAgIAkuZGVzdHJveSA9IGRybV9jb25uZWN0b3JfY2xlYW51cCwNCj4gICAJLmF0b21pY19k
dXBsaWNhdGVfc3RhdGUgPSBkcm1fYXRvbWljX2hlbHBlcl9jb25uZWN0b3JfZHVwbGljYXRl
X3N0YXRlLA0KPiAgIAkuYXRvbWljX2Rlc3Ryb3lfc3RhdGUgPSBkcm1fYXRvbWljX2hlbHBl
cl9jb25uZWN0b3JfZGVzdHJveV9zdGF0ZSwNCj4gQEAgLTE2NzgsNyArMTcwMCw3IEBAIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9oZWxwZXJfZnVuY3MgYXN0X2FzdGRw
X2Nvbm5lY3Rvcl9oZWxwZXJfZnVuY3MNCj4gICANCj4gICBzdGF0aWMgY29uc3Qgc3RydWN0
IGRybV9jb25uZWN0b3JfZnVuY3MgYXN0X2FzdGRwX2Nvbm5lY3Rvcl9mdW5jcyA9IHsNCj4g
ICAJLnJlc2V0ID0gZHJtX2F0b21pY19oZWxwZXJfY29ubmVjdG9yX3Jlc2V0LA0KPiAtCS5m
aWxsX21vZGVzID0gZHJtX2hlbHBlcl9wcm9iZV9zaW5nbGVfY29ubmVjdG9yX21vZGVzLA0K
PiArCS5maWxsX21vZGVzID0gYXN0X2RwX3Byb2JlX3NpbmdsZV9jb25uZWN0b3JfbW9kZXMs
DQo+ICAgCS5kZXN0cm95ID0gZHJtX2Nvbm5lY3Rvcl9jbGVhbnVwLA0KPiAgIAkuYXRvbWlj
X2R1cGxpY2F0ZV9zdGF0ZSA9IGRybV9hdG9taWNfaGVscGVyX2Nvbm5lY3Rvcl9kdXBsaWNh
dGVfc3RhdGUsDQo+ICAgCS5hdG9taWNfZGVzdHJveV9zdGF0ZSA9IGRybV9hdG9taWNfaGVs
cGVyX2Nvbm5lY3Rvcl9kZXN0cm95X3N0YXRlLA0KPiANCj4gYmFzZS1jb21taXQ6IDBhZGVj
MjI3MDJkNDk3Mzg1ZGJkYzUyYWJiMTY1ZjM3OWEwMGVmYmENCg0KLS0gDQpUaG9tYXMgWmlt
bWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1
dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVy
ZywgR2VybWFueQ0KR0Y6IEl2byBUb3RldiwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25h
bGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------8fkNY3JE3hm5E7xOXFkjsu4z--

--------------nKSPui68IKIVe02YU1T84z0y
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSkKm0FAwAAAAAACgkQlh/E3EQov+CG
UBAAh1qdFHatfkfUl+9KdiE6HVBXBZwGYMEEYJXQiD4bb49D08ZVNCP422B4kbOY1ZGkoDsQm8a2
d6F8yrjHzChoegr1PZ93xnwHRaXvLBJK3pGmzWghfzPw3Q8Y/tWp8vUZQR3XI9WTwvQ4i6HaN7mO
Asw2auDsZgFy+D+WytkseMdxKgNRSghnN9ay3ygo6xupXMtRXnamdfkiw0WQAQM114OLEx1VLT05
IezGnTDNnsJmPVvPBmSV5i8FpbxTkixI6UToxzwBXsF/b1Z1deDKMY6yDheQuXl7sXasBCS2O21m
yrLiVg0efbTwae5iQxSeDXNfhIZzSBIPiVxe8FHlWYknYyq6mtTQDEYkzJefcIIeIP0HqLMF7h+K
j/CnPYk9dtf37xCwVc6mforGi7TIX9ovPqqdjcAxWiCFQhyZXpCuPQg9RxSHZAPjBnrn5Gli60LE
nNXivOuy/e+ukvsHcUOQynpxvNqMwY5MxpJWgQ60i/xcpbG7NfJu5p5fitgavznQeApq2Ricvaci
1ULeRqmf8VTkbnEPFh1gY6Tfu9DZCCOb8ad01t5h4lFkH2qwSQAUwRayRpPc1T0kTFO1mprl1kzo
nn2U4C9mgtIa+NxzZBgo2WdwO/FgJgsl82Mnrk5iayiBFGVM9OS/CXCfyfmRCo56FakcRwJ3qQ4i
1JU=
=bzNZ
-----END PGP SIGNATURE-----

--------------nKSPui68IKIVe02YU1T84z0y--
