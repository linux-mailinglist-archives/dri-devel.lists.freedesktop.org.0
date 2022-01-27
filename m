Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 250C149E4AF
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 15:33:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD04310E7F7;
	Thu, 27 Jan 2022 14:33:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F7C810E7F7;
 Thu, 27 Jan 2022 14:33:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3B634218E0;
 Thu, 27 Jan 2022 14:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1643293993; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gfVtGjzgCMvnnZDpcehQwVBibFUoPCCrxlGLDylV22w=;
 b=dC04/vapA8F85tjb/mNCwjyzo3DyippRN4nkXG6xjV5P6EGAsO40VUhCedqDqd1d8xvSKx
 rYC36SFRAAwSr3Kd+e7J/e0WsQPZyUYW3iO9El2ZVNtesE+c+tibK9+fqiXFksEqFUsRwD
 CMVRqmKnfoRcnpknafL27OOEFc/bmYc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1643293993;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gfVtGjzgCMvnnZDpcehQwVBibFUoPCCrxlGLDylV22w=;
 b=ebxuPTuYo9Bt98YIKmZBtt7q7LUYCkPESe35YpFr38dKRv4Q1jgMqV+avZf6hpqPBxYO3o
 facYijkXbJpPCsDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 110F413BFC;
 Thu, 27 Jan 2022 14:33:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ZzLAAimt8mFyRAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 27 Jan 2022 14:33:13 +0000
Message-ID: <b7a3fe1d-3b85-cb7e-19cf-1611ff4f3c9e@suse.de>
Date: Thu, 27 Jan 2022 15:33:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 02/19] dma-buf-map: Add helper to initialize second map
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220126203702.1784589-1-lucas.demarchi@intel.com>
 <20220126203702.1784589-3-lucas.demarchi@intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220126203702.1784589-3-lucas.demarchi@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------EPku7XflatQ6Ovr3WRaAV1zC"
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
Cc: linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------EPku7XflatQ6Ovr3WRaAV1zC
Content-Type: multipart/mixed; boundary="------------vGcauGD8tAgNdR80NZ29NGhd";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 intel-gfx@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
Message-ID: <b7a3fe1d-3b85-cb7e-19cf-1611ff4f3c9e@suse.de>
Subject: Re: [PATCH 02/19] dma-buf-map: Add helper to initialize second map
References: <20220126203702.1784589-1-lucas.demarchi@intel.com>
 <20220126203702.1784589-3-lucas.demarchi@intel.com>
In-Reply-To: <20220126203702.1784589-3-lucas.demarchi@intel.com>

--------------vGcauGD8tAgNdR80NZ29NGhd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDI2LjAxLjIyIHVtIDIxOjM2IHNjaHJpZWIgTHVjYXMgRGUgTWFyY2hpOg0KPiBX
aGVuIGRtYV9idWZfbWFwIHN0cnVjdCBpcyBwYXNzZWQgYXJvdW5kLCBpdCdzIHVzZWZ1bCB0
byBiZSBhYmxlIHRvDQo+IGluaXRpYWxpemUgYSBzZWNvbmQgbWFwIHRoYXQgdGFrZXMgY2Fy
ZSBvZiByZWFkaW5nL3dyaXRpbmcgdG8gYW4gb2Zmc2V0DQo+IG9mIHRoZSBvcmlnaW5hbCBt
YXAuDQo+IA0KPiBBZGQgYSBoZWxwZXIgdGhhdCBjb3BpZXMgdGhlIHN0cnVjdCBhbmQgYWRk
IHRoZSBvZmZzZXQgdG8gdGhlIHByb3Blcg0KPiBhZGRyZXNzLg0KPiANCj4gQ2M6IFN1bWl0
IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+DQo+IENjOiBDaHJpc3RpYW4gS8O2
bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+DQo+IENjOiBsaW51eC1tZWRpYUB2Z2Vy
Lmtlcm5lbC5vcmcNCj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4g
Q2M6IGxpbmFyby1tbS1zaWdAbGlzdHMubGluYXJvLm9yZw0KPiBDYzogbGludXgta2VybmVs
QHZnZXIua2VybmVsLm9yZw0KPiBTaWduZWQtb2ZmLWJ5OiBMdWNhcyBEZSBNYXJjaGkgPGx1
Y2FzLmRlbWFyY2hpQGludGVsLmNvbT4NCj4gLS0tDQo+ICAgaW5jbHVkZS9saW51eC9kbWEt
YnVmLW1hcC5oIHwgMjkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gICAxIGZp
bGUgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2luY2x1
ZGUvbGludXgvZG1hLWJ1Zi1tYXAuaCBiL2luY2x1ZGUvbGludXgvZG1hLWJ1Zi1tYXAuaA0K
PiBpbmRleCA2NWU5MjdkOWNlMzMuLjM1MTRhODU5ZjYyOCAxMDA2NDQNCj4gLS0tIGEvaW5j
bHVkZS9saW51eC9kbWEtYnVmLW1hcC5oDQo+ICsrKyBiL2luY2x1ZGUvbGludXgvZG1hLWJ1
Zi1tYXAuaA0KPiBAQCAtMTMxLDYgKzEzMSwzNSBAQCBzdHJ1Y3QgZG1hX2J1Zl9tYXAgew0K
PiAgIAkJLmlzX2lvbWVtID0gZmFsc2UsIFwNCj4gICAJfQ0KPiAgIA0KPiArLyoqDQo+ICsg
KiBETUFfQlVGX01BUF9JTklUX09GRlNFVCAtIEluaXRpYWxpemVzIHN0cnVjdCBkbWFfYnVm
X21hcCBmcm9tIGFub3RoZXIgZG1hX2J1Zl9tYXANCj4gKyAqIEBtYXBfOglUaGUgZG1hLWJ1
ZiBtYXBwaW5nIHN0cnVjdHVyZSB0byBjb3B5IGZyb20NCj4gKyAqIEBvZmZzZXQ6CU9mZnNl
dCB0byBhZGQgdG8gdGhlIG90aGVyIG1hcHBpbmcNCj4gKyAqDQo+ICsgKiBJbml0aWFsaXpl
cyBhIG5ldyBkbWFfYnVmX3N0cnVjdCBiYXNlZCBvbiBhbm90aGVyLiBUaGlzIGlzIHRoZSBl
cXVpdmFsZW50IG9mIGRvaW5nOg0KPiArICoNCj4gKyAqIC4uIGNvZGUtYmxvY2s6IGMNCj4g
KyAqDQo+ICsgKglkbWFfYnVmX21hcCBtYXAgPSBvdGhlcl9tYXA7DQo+ICsgKglkbWFfYnVm
X21hcF9pbmNyKCZtYXAsICZvZmZzZXQpOw0KPiArICoNCj4gKyAqIEV4YW1wbGUgdXNhZ2U6
DQo+ICsgKg0KPiArICogLi4gY29kZS1ibG9jazogYw0KPiArICoNCj4gKyAqCXZvaWQgZm9v
KHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRtYV9idWZfbWFwICpiYXNlX21hcCkNCj4g
KyAqCXsNCj4gKyAqCQkuLi4NCj4gKyAqCQlzdHJ1Y3QgZG1hX2J1Zl9tYXAgPSBETUFfQlVG
X01BUF9JTklUX09GRlNFVChiYXNlX21hcCwgRklFTERfT0ZGU0VUKTsNCj4gKyAqCQkuLi4N
Cj4gKyAqCX0NCj4gKyAqLw0KPiArI2RlZmluZSBETUFfQlVGX01BUF9JTklUX09GRlNFVCht
YXBfLCBvZmZzZXRfKQkoc3RydWN0IGRtYV9idWZfbWFwKQlcDQo+ICsJewkJCQkJCQkJXA0K
PiArCQkudmFkZHIgPSAobWFwXyktPnZhZGRyICsgKG9mZnNldF8pLAkJCVwNCj4gKwkJLmlz
X2lvbWVtID0gKG1hcF8pLT5pc19pb21lbSwJCQkJXA0KPiArCX0NCj4gKw0KDQpJdCdzIGls
bGVnYWwgdG8gYWNjZXNzIC52YWRkciAgd2l0aCByYXcgcG9pbnRlci4gQWx3YXlzIHVzZSBh
IA0KZG1hX2J1Zl9tZW1jcHlfKCkgaW50ZXJmYWNlLiBTbyB3aHkgd291bGQgeW91IG5lZWQg
dGhpcyBtYWNybyB3aGVuIHlvdSANCmhhdmUgZG1hX2J1Zl9tZW1jcHlfKigpIHdpdGggYW4g
b2Zmc2V0IHBhcmFtZXRlcj8NCg0KSSd2ZSBhbHNvIGJlZW4gdmVyeSBjYXJlZnVsIHRvIGRp
c3Rpbmd1aXNoIGJldHdlZW4gLnZhZGRyIGFuZCANCi52YWRkcl9pb21lbSwgZXZlbiBpbiBw
bGFjZXMgd2hlcmUgSSB3b3VsZG4ndCBoYXZlIHRvLiBUaGlzIG1hY3JvIGJyZWFrcyANCnRo
ZSBhc3N1bXB0aW9uLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+ICAgLyoqDQo+ICAg
ICogZG1hX2J1Zl9tYXBfc2V0X3ZhZGRyIC0gU2V0cyBhIGRtYS1idWYgbWFwcGluZyBzdHJ1
Y3R1cmUgdG8gYW4gYWRkcmVzcyBpbiBzeXN0ZW0gbWVtb3J5DQo+ICAgICogQG1hcDoJVGhl
IGRtYS1idWYgbWFwcGluZyBzdHJ1Y3R1cmUNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0K
R3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2Vy
bWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihI
UkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYN
Cg==

--------------vGcauGD8tAgNdR80NZ29NGhd--

--------------EPku7XflatQ6Ovr3WRaAV1zC
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmHyrSgFAwAAAAAACgkQlh/E3EQov+Cc
6g//TK4JmsLDsBBuI7FCdzbCPrs+sPOpBPxZP5UxyowIUXqfpfsjmjQTaDgOD8KSCQLmb+UH4+yh
rhOob5lWlLbaOu341xPk6TleHIbu8lVCC+7HATCxJ4Llp1ViT3Z4H1qgAc59GSPbVEpxJWG0t52b
/lL0651M4oR5TKZXEzoX6t9Of+VXga/wo0wdE0kzdWv0SBpiAnNI6YqlNAVFsW7A8jyKwIKPbD0D
uxTp0D5pVsYf+80oNM4IHstjIPQqIaNUXlqIzvIx4eoppkDCgEFxuectj7NK9mConk5RQguQWiHZ
rzr9/P/pRz9vgacplYjjnkuO4DOZGFNady9JvH+pgIQ2XFsmkNgcNf2UrVN2+bJm2MdLQ0UReKiA
ypqqkYcyuLTtOGgggs90hEalFsIw4CqNxu4HE3sF7gq0OcRxk0AmpZC9FcJh+Fj0JIcjv4vZmfQY
CWOIHB47aRaHZyr2XDL0+ibjbNTf6kcqhItWNWmq34TKL1SW36WN865+2ETmwARRffF+wVLYVAIw
QgLs/cVIW2DtCM1Cxr9yttdJ9LU7Lz4YiW1rA7/7GzSzuuSxa4SVz9yWVAjjJy3ljG3uKZBPGrYI
ylNA03ps9v32zBqsjT6m9BFGLFBAxmhlr/0YOJfBTt0Mh2VVcn2NI+NJuGw19GtYXs0Ky6g4x50M
Pkc=
=ejto
-----END PGP SIGNATURE-----

--------------EPku7XflatQ6Ovr3WRaAV1zC--
