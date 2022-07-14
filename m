Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC05057477D
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jul 2022 10:45:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00220A384E;
	Thu, 14 Jul 2022 08:45:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 153D6A384D;
 Thu, 14 Jul 2022 08:45:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B950D1FA06;
 Thu, 14 Jul 2022 08:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1657788329; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rugZ8ySnr6mFhywsSBPTFqn8wDpYTav3UIZ/DivaS5c=;
 b=qli9gZkYfb07FkdRQGUis8xL7a24bWv+G43Ho+wO83Knsf6JKF//4mOiV0sg5XF5bV6vjY
 Om26ugom6f6ifdXSyIKB0sTi/bWOoTictixMqDiH1j8iDaGHHLhUX3TdQ6IVOcthZiRFKH
 UqV1gzo0dC8KrXAjzvL+MJDytl0MoUA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1657788329;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rugZ8ySnr6mFhywsSBPTFqn8wDpYTav3UIZ/DivaS5c=;
 b=4wqdzpdk4UnLRbnTR/c8s+x9jfgY60CU/VdhF9dNTBgxkIkP+ot1MLZJPxqZu1yYpqShFU
 Qh81N8sbL6TUvMAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9969F13A61;
 Thu, 14 Jul 2022 08:45:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id St2WJKnXz2JoFwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 14 Jul 2022 08:45:29 +0000
Message-ID: <a56afc27-3556-38ea-0d10-f7069091967e@suse.de>
Date: Thu, 14 Jul 2022 10:45:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/3] Revert "drm/amdgpu: move internal vram_mgr function
 into the C file"
Content-Language: en-US
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20220708093047.492662-1-Arunpravin.PaneerSelvam@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220708093047.492662-1-Arunpravin.PaneerSelvam@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------w1ycO0ztOby17H0ncPsozGMT"
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
Cc: alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------w1ycO0ztOby17H0ncPsozGMT
Content-Type: multipart/mixed; boundary="------------n0uFXJkPUsYRbg0qLVLI0203";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: alexander.deucher@amd.com, christian.koenig@amd.com
Message-ID: <a56afc27-3556-38ea-0d10-f7069091967e@suse.de>
Subject: Re: [PATCH 1/3] Revert "drm/amdgpu: move internal vram_mgr function
 into the C file"
References: <20220708093047.492662-1-Arunpravin.PaneerSelvam@amd.com>
In-Reply-To: <20220708093047.492662-1-Arunpravin.PaneerSelvam@amd.com>

--------------n0uFXJkPUsYRbg0qLVLI0203
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDguMDcuMjIgdW0gMTE6MzAgc2NocmllYiBBcnVucHJhdmluIFBhbmVlciBT
ZWx2YW06DQo+IFRoaXMgcmV2ZXJ0cyBjb21taXQgNzA4ZDE5ZDlmMzYyNzY2MTQ3Y2FiNzll
Y2NhZTYwOTEyYzZkMzA2OC4NCg0KVGhpcyBjb21taXQgaXMgb25seSBwcmVzZW50IGluIGRy
bS1taXNjLW5leHQuIFNob3VsZCB0aGUgcmV2ZXJ0IGJlIA0KY2hlcnJ5LXBpY2tlZCBpbnRv
IGRybS1taXNjLW5leHQtZml4ZXM/DQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+
IFRoaXMgaXMgcGFydCBvZiBhIHJldmVydCBvZiB0aGUgZm9sbG93aW5nIGNvbW1pdHM6DQo+
IGNvbW1pdCA3MDhkMTlkOWYzNjIgKCJkcm0vYW1kZ3B1OiBtb3ZlIGludGVybmFsIHZyYW1f
bWdyIGZ1bmN0aW9uIGludG8gdGhlIEMgZmlsZSIpDQo+IGNvbW1pdCA1ZTNmMWU3NzI5ZWMg
KCJkcm0vYW1kZ3B1OiBmaXggc3RhcnQgY2FsY3VsYXRpb24gaW4gYW1kZ3B1X3ZyYW1fbWdy
X25ldyIpDQo+IGNvbW1pdCBjOWNhZDkzN2MwYzUgKCJkcm0vYW1kZ3B1OiBhZGQgZHJtIGJ1
ZGR5IHN1cHBvcnQgdG8gYW1kZ3B1IikNCj4gDQo+IFtXSFldDQo+IEZldyB1c2VycyByZXBv
cnRlZCBnYXJiYWdlZCBncmFwaGljcyBhcyBzb29uIGFzIHggc3RhcnRzLA0KPiByZXZlcnRp
bmcgdW50aWwgdGhpcyBjYW4gYmUgcmVzb2x2ZWQuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBB
cnVucHJhdmluIFBhbmVlciBTZWx2YW0gPEFydW5wcmF2aW4uUGFuZWVyU2VsdmFtQGFtZC5j
b20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92cmFt
X21nci5jIHwgMjkgLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfdnJhbV9tZ3IuaCB8IDI3ICsrKysrKysrKysrKysrKysrKw0K
PiAgIDIgZmlsZXMgY2hhbmdlZCwgMjcgaW5zZXJ0aW9ucygrKSwgMjkgZGVsZXRpb25zKC0p
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3ZyYW1fbWdyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdnJhbV9t
Z3IuYw0KPiBpbmRleCA3YTVlOGE3YjRhMWIuLjUxZDlkM2E0NDU2YyAxMDA2NDQNCj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZyYW1fbWdyLmMNCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZyYW1fbWdyLmMNCj4gQEAg
LTUwLDM1ICs1MCw2IEBAIHRvX2FtZGdwdV9kZXZpY2Uoc3RydWN0IGFtZGdwdV92cmFtX21n
ciAqbWdyKQ0KPiAgIAlyZXR1cm4gY29udGFpbmVyX29mKG1nciwgc3RydWN0IGFtZGdwdV9k
ZXZpY2UsIG1tYW4udnJhbV9tZ3IpOw0KPiAgIH0NCj4gICANCj4gLXN0YXRpYyBpbmxpbmUg
c3RydWN0IGRybV9idWRkeV9ibG9jayAqDQo+IC1hbWRncHVfdnJhbV9tZ3JfZmlyc3RfYmxv
Y2soc3RydWN0IGxpc3RfaGVhZCAqbGlzdCkNCj4gLXsNCj4gLQlyZXR1cm4gbGlzdF9maXJz
dF9lbnRyeV9vcl9udWxsKGxpc3QsIHN0cnVjdCBkcm1fYnVkZHlfYmxvY2ssIGxpbmspOw0K
PiAtfQ0KPiAtDQo+IC1zdGF0aWMgaW5saW5lIGJvb2wgYW1kZ3B1X2lzX3ZyYW1fbWdyX2Js
b2Nrc19jb250aWd1b3VzKHN0cnVjdCBsaXN0X2hlYWQgKmhlYWQpDQo+IC17DQo+IC0Jc3Ry
dWN0IGRybV9idWRkeV9ibG9jayAqYmxvY2s7DQo+IC0JdTY0IHN0YXJ0LCBzaXplOw0KPiAt
DQo+IC0JYmxvY2sgPSBhbWRncHVfdnJhbV9tZ3JfZmlyc3RfYmxvY2soaGVhZCk7DQo+IC0J
aWYgKCFibG9jaykNCj4gLQkJcmV0dXJuIGZhbHNlOw0KPiAtDQo+IC0Jd2hpbGUgKGhlYWQg
IT0gYmxvY2stPmxpbmsubmV4dCkgew0KPiAtCQlzdGFydCA9IGFtZGdwdV92cmFtX21ncl9i
bG9ja19zdGFydChibG9jayk7DQo+IC0JCXNpemUgPSBhbWRncHVfdnJhbV9tZ3JfYmxvY2tf
c2l6ZShibG9jayk7DQo+IC0NCj4gLQkJYmxvY2sgPSBsaXN0X2VudHJ5KGJsb2NrLT5saW5r
Lm5leHQsIHN0cnVjdCBkcm1fYnVkZHlfYmxvY2ssIGxpbmspOw0KPiAtCQlpZiAoc3RhcnQg
KyBzaXplICE9IGFtZGdwdV92cmFtX21ncl9ibG9ja19zdGFydChibG9jaykpDQo+IC0JCQly
ZXR1cm4gZmFsc2U7DQo+IC0JfQ0KPiAtDQo+IC0JcmV0dXJuIHRydWU7DQo+IC19DQo+IC0N
Cj4gLQ0KPiAtDQo+ICAgLyoqDQo+ICAgICogRE9DOiBtZW1faW5mb192cmFtX3RvdGFsDQo+
ICAgICoNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV92cmFtX21nci5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZyYW1f
bWdyLmgNCj4gaW5kZXggNGIyNjdiZjFjNWRiLi45YTJkYjg3MTg2YzcgMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92cmFtX21nci5oDQo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92cmFtX21nci5oDQo+IEBA
IC01Myw2ICs1MywzMyBAQCBzdGF0aWMgaW5saW5lIHU2NCBhbWRncHVfdnJhbV9tZ3JfYmxv
Y2tfc2l6ZShzdHJ1Y3QgZHJtX2J1ZGR5X2Jsb2NrICpibG9jaykNCj4gICAJcmV0dXJuIFBB
R0VfU0laRSA8PCBkcm1fYnVkZHlfYmxvY2tfb3JkZXIoYmxvY2spOw0KPiAgIH0NCj4gICAN
Cj4gK3N0YXRpYyBpbmxpbmUgc3RydWN0IGRybV9idWRkeV9ibG9jayAqDQo+ICthbWRncHVf
dnJhbV9tZ3JfZmlyc3RfYmxvY2soc3RydWN0IGxpc3RfaGVhZCAqbGlzdCkNCj4gK3sNCj4g
KwlyZXR1cm4gbGlzdF9maXJzdF9lbnRyeV9vcl9udWxsKGxpc3QsIHN0cnVjdCBkcm1fYnVk
ZHlfYmxvY2ssIGxpbmspOw0KPiArfQ0KPiArDQo+ICtzdGF0aWMgaW5saW5lIGJvb2wgYW1k
Z3B1X2lzX3ZyYW1fbWdyX2Jsb2Nrc19jb250aWd1b3VzKHN0cnVjdCBsaXN0X2hlYWQgKmhl
YWQpDQo+ICt7DQo+ICsJc3RydWN0IGRybV9idWRkeV9ibG9jayAqYmxvY2s7DQo+ICsJdTY0
IHN0YXJ0LCBzaXplOw0KPiArDQo+ICsJYmxvY2sgPSBhbWRncHVfdnJhbV9tZ3JfZmlyc3Rf
YmxvY2soaGVhZCk7DQo+ICsJaWYgKCFibG9jaykNCj4gKwkJcmV0dXJuIGZhbHNlOw0KPiAr
DQo+ICsJd2hpbGUgKGhlYWQgIT0gYmxvY2stPmxpbmsubmV4dCkgew0KPiArCQlzdGFydCA9
IGFtZGdwdV92cmFtX21ncl9ibG9ja19zdGFydChibG9jayk7DQo+ICsJCXNpemUgPSBhbWRn
cHVfdnJhbV9tZ3JfYmxvY2tfc2l6ZShibG9jayk7DQo+ICsNCj4gKwkJYmxvY2sgPSBsaXN0
X2VudHJ5KGJsb2NrLT5saW5rLm5leHQsIHN0cnVjdCBkcm1fYnVkZHlfYmxvY2ssIGxpbmsp
Ow0KPiArCQlpZiAoc3RhcnQgKyBzaXplICE9IGFtZGdwdV92cmFtX21ncl9ibG9ja19zdGFy
dChibG9jaykpDQo+ICsJCQlyZXR1cm4gZmFsc2U7DQo+ICsJfQ0KPiArDQo+ICsJcmV0dXJu
IHRydWU7DQo+ICt9DQo+ICsNCj4gICBzdGF0aWMgaW5saW5lIHN0cnVjdCBhbWRncHVfdnJh
bV9tZ3JfcmVzb3VyY2UgKg0KPiAgIHRvX2FtZGdwdV92cmFtX21ncl9yZXNvdXJjZShzdHJ1
Y3QgdHRtX3Jlc291cmNlICpyZXMpDQo+ICAgew0KDQotLSANClRob21hcyBaaW1tZXJtYW5u
DQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBH
ZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0K
KEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rl
dg0K

--------------n0uFXJkPUsYRbg0qLVLI0203--

--------------w1ycO0ztOby17H0ncPsozGMT
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmLP16kFAwAAAAAACgkQlh/E3EQov+BQ
DA//cBOhC+ptb8jfwDQaHoKmb8ZrARwCmRu/d2b3w4M2EFagNYrd9+ZFjLlwTNbkh/eNDsR5w+Wv
9RNW+UjGDaxrSTxzROl9WSiSmvJT8xMWeRPJgIXPevs76A0xfk1wdpuaWD4LphLr+MiJlOuxawtX
ycA05YdcZRUuTjCnLPCiPbpW9SqPgS5Wx/CM7yrmZvhhJbxx17+rWCKL9Iee140OXqQI95ycVpyj
Rljgb02UvB2Q7bbxuHWT7x7qCNknCKPKd9z8/59bQSe9SZ2rekUopGOuB2jNzbq43C76bOWjCTIF
uQJaqyu3OpjBkyvRC4Po5KOAxg/h9kimAaQTtyGvBTouGo9b03SOwNhK6BBdBlQyqjk2bYolkYt2
brBzR8sm7kc4uolJe2SsKjpQ7jsjWD1lV5JvZwXUEzJ6R5KQ/C/99/aphH6C6dY2vX/mRq9rWV/T
wc0p3P9m1xFVna0XLN5Rj6bj7/wv/3ze+0BJPlV/riRCxW+tOTHTlg4csSIOkk8F3C74MiuU3H93
NDeud+AvK+a7DZHqGXJF7+acIHPwHAn25zwM48M8B+VayUnXroL3kswcVOvyWlvRvMAL3rdppnkP
k0lJw8W6eHJMbwqbqen59i+Mxo8cXA2+0Kg1d0rNTq4w7jmOeMG+nwJzca3hkSHpZnXMWzyOi+ZX
PJE=
=TF7i
-----END PGP SIGNATURE-----

--------------w1ycO0ztOby17H0ncPsozGMT--
