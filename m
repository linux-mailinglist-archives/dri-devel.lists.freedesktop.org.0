Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E80B4A9FD6
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 20:15:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8FE310E520;
	Fri,  4 Feb 2022 19:15:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66C7110E520;
 Fri,  4 Feb 2022 19:15:15 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id EF0921F382;
 Fri,  4 Feb 2022 19:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644002113; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FBKXWHR6b5nXvL/toHyOGRrAUAZgKlhQ/zYqXm6S3JI=;
 b=Kt4mL4azAhb/wuiPw9KfiWAhDjTiqS6P1LKildokgfDxXJZDqjX9A7pxCyjRzwje4G89/j
 mtw7MxIg2cez5EIiP/HNDQ1gOFdg9tjkItJOyL0iL62K1xJsIJ0d4bsOn4DnBBL3qpSy0J
 BeKx0yriMTsd4oxU1ZjU8gf+e5h9c4s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644002113;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FBKXWHR6b5nXvL/toHyOGRrAUAZgKlhQ/zYqXm6S3JI=;
 b=2ZyVrAeewZLEDTnIqq8g38nkNd1FDft+8jPqLtrXBCtjUlex56qVvAj837X3tBfTT9INll
 aJcf+rzywNMV9RDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8B5D713ADE;
 Fri,  4 Feb 2022 19:15:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id yLNxIEF7/WE5BgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 04 Feb 2022 19:15:13 +0000
Message-ID: <ebe6c396-efae-81a8-6c66-f5266ce4e20c@suse.de>
Date: Fri, 4 Feb 2022 20:15:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 04/19] drm/i915/gt: Add helper for shmem copy to iosys_map
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20220204174436.830121-1-lucas.demarchi@intel.com>
 <20220204174436.830121-5-lucas.demarchi@intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220204174436.830121-5-lucas.demarchi@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------rGniNOzacUQ0MHqNwoJIDw0N"
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------rGniNOzacUQ0MHqNwoJIDw0N
Content-Type: multipart/mixed; boundary="------------gQpv65UBWYKbWr9aCT0LHwKm";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: John Harrison <John.C.Harrison@Intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Matthew Auld <matthew.auld@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <ebe6c396-efae-81a8-6c66-f5266ce4e20c@suse.de>
Subject: Re: [PATCH 04/19] drm/i915/gt: Add helper for shmem copy to iosys_map
References: <20220204174436.830121-1-lucas.demarchi@intel.com>
 <20220204174436.830121-5-lucas.demarchi@intel.com>
In-Reply-To: <20220204174436.830121-5-lucas.demarchi@intel.com>

--------------gQpv65UBWYKbWr9aCT0LHwKm
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDQuMDIuMjIgdW0gMTg6NDQgc2NocmllYiBMdWNhcyBEZSBNYXJjaGk6DQo+
IEFkZCBhIHZhcmlhbnQgb2Ygc2htZW1fcmVhZCgpIHRoYXQgdGFrZXMgYSBpb3N5c19tYXAg
cG9pbnRlciByYXRoZXINCj4gdGhhbiBhIHBsYWluIHBvaW50ZXIgYXMgYXJndW1lbnQuIEl0
J3MgbW9zdGx5IGEgY29weSBfX3NobWVtX3J3KCkgYnV0DQo+IGFkYXB0aW5nIHRoZSBhcGkg
YW5kIHJlbW92aW5nIHRoZSB3cml0ZSBzdXBwb3J0IHNpbmNlIHRoZXJlJ3MgY3VycmVudGx5
DQo+IG9ubHkgbmVlZCB0byB1c2UgaW9zeXNfbWFwIGFzIGRlc3RpbmF0aW9uLg0KPiANCj4g
UmV3b3JraW5nIF9fc2htZW1fcncoKSB0byBzaGFyZSB0aGUgaW1wbGVtZW50YXRpb24gd2Fz
IHRlbXB0aW5nLCBidXQNCj4gZmluZGluZyBhIGdvb2QgYmFsYW5jZSBiZXR3ZWVuIHJldXNl
IGFuZCBjbGFyaXR5IHB1c2hlZCB0b3dhcmRzIGEgbGl0dGxlDQo+IGNvZGUgZHVwbGljYXRp
b24uIFNpbmNlIHRoZSBmdW5jdGlvbiBpcyBzbWFsbCwganVzdCBhZGQgdGhlIHNpbWlsYXIN
Cj4gZnVuY3Rpb24gd2l0aCBhIGNvcHkvcGFzdGUvYWRhcHQgYXBwcm9hY2guDQo+IA0KPiBD
YzogTWF0dCBSb3BlciA8bWF0dGhldy5kLnJvcGVyQGludGVsLmNvbT4NCj4gQ2M6IEpvb25h
cyBMYWh0aW5lbiA8am9vbmFzLmxhaHRpbmVuQGxpbnV4LmludGVsLmNvbT4NCj4gQ2M6IFR2
cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBsaW51eC5pbnRlbC5jb20+DQo+IENjOiBE
YXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+DQo+IENjOiBEYW5pZWwgVmV0dGVyIDxk
YW5pZWxAZmZ3bGwuY2g+DQo+IENjOiBNYXR0aGV3IEF1bGQgPG1hdHRoZXcuYXVsZEBpbnRl
bC5jb20+DQo+IENjOiBUaG9tYXMgSGVsbHN0csO2bSA8dGhvbWFzLmhlbGxzdHJvbUBsaW51
eC5pbnRlbC5jb20+DQo+IENjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9y
c3RAbGludXguaW50ZWwuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBMdWNhcyBEZSBNYXJjaGkg
PGx1Y2FzLmRlbWFyY2hpQGludGVsLmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJt
L2k5MTUvZ3Qvc2htZW1fdXRpbHMuYyB8IDMzICsrKysrKysrKysrKysrKysrKysrKysrKysr
Kw0KPiAgIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3NobWVtX3V0aWxzLmggfCAgMyArKysN
Cj4gICAyIGZpbGVzIGNoYW5nZWQsIDM2IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9zaG1lbV91dGlscy5jIGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ3Qvc2htZW1fdXRpbHMuYw0KPiBpbmRleCAwNjgzYjI3YTM4OTAuLjc2
NGFkZWZkYjRiZSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Qvc2ht
ZW1fdXRpbHMuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9zaG1lbV91dGls
cy5jDQo+IEBAIC0zLDYgKzMsNyBAQA0KPiAgICAqIENvcHlyaWdodCDCqSAyMDIwIEludGVs
IENvcnBvcmF0aW9uDQo+ICAgICovDQo+ICAgDQo+ICsjaW5jbHVkZSA8bGludXgvaW9zeXMt
bWFwLmg+DQo+ICAgI2luY2x1ZGUgPGxpbnV4L21tLmg+DQo+ICAgI2luY2x1ZGUgPGxpbnV4
L3BhZ2VtYXAuaD4NCj4gICAjaW5jbHVkZSA8bGludXgvc2htZW1fZnMuaD4NCj4gQEAgLTEy
Myw2ICsxMjQsMzggQEAgc3RhdGljIGludCBfX3NobWVtX3J3KHN0cnVjdCBmaWxlICpmaWxl
LCBsb2ZmX3Qgb2ZmLA0KPiAgIAlyZXR1cm4gMDsNCj4gICB9DQo+ICAgDQoNCkhlcmUncyBh
IGdvb2QgZXhhbXBsZSBvZiBob3cgdG8gYXZvaWQgaW9zeXNfbWFwX2luY3IoKSBhbmQgdXNl
IHRoZSANCm1lbWNweSBvZmZzZXQ6DQoNCj4gK2ludCBzaG1lbV9yZWFkX3RvX2lvc3lzX21h
cChzdHJ1Y3QgZmlsZSAqZmlsZSwgbG9mZl90IG9mZiwNCj4gKwkJCSAgICBzdHJ1Y3QgaW9z
eXNfbWFwICptYXAsIHNpemVfdCBsZW4pDQo+ICt7DQo+ICsJc3RydWN0IGlvc3lzX21hcCBt
YXBfaXRlciA9ICptYXA7DQoNClJhdGhlciByZXBsYWNlIG1hcF9pdGVyIHdpdGggc29tZXRo
aW5nIGxpa2UNCg0KICAgdW5zaWduZWQgbG9uZyBtYXBfb2ZmID0gMDsNCg0KPiArCXVuc2ln
bmVkIGxvbmcgcGZuOw0KPiArDQo+ICsJZm9yIChwZm4gPSBvZmYgPj4gUEFHRV9TSElGVDsg
bGVuOyBwZm4rKykgew0KPiArCQl1bnNpZ25lZCBpbnQgdGhpcyA9DQo+ICsJCQltaW5fdChz
aXplX3QsIFBBR0VfU0laRSAtIG9mZnNldF9pbl9wYWdlKG9mZiksIGxlbik7DQo+ICsJCXN0
cnVjdCBwYWdlICpwYWdlOw0KPiArCQl2b2lkICp2YWRkcjsNCj4gKw0KPiArCQlwYWdlID0g
c2htZW1fcmVhZF9tYXBwaW5nX3BhZ2VfZ2ZwKGZpbGUtPmZfbWFwcGluZywgcGZuLA0KPiAr
CQkJCQkJICAgR0ZQX0tFUk5FTCk7DQo+ICsJCWlmIChJU19FUlIocGFnZSkpDQo+ICsJCQly
ZXR1cm4gUFRSX0VSUihwYWdlKTsNCj4gKw0KPiArCQl2YWRkciA9IGttYXAocGFnZSk7DQo+
ICsJCWlvc3lzX21hcF9tZW1jcHlfdG8oJm1hcF9pdGVyLCAwLCB2YWRkciArIG9mZnNldF9p
bl9wYWdlKG9mZiksDQo+ICsJCQkJICAgIHRoaXMpOw0KDQpVc2UgbWFwX29mZiB0byBpbmRl
eCBpbnRvIG1hcCBkaXJlY3RseS4NCg0KPiArCQltYXJrX3BhZ2VfYWNjZXNzZWQocGFnZSk7
DQo+ICsJCWt1bm1hcChwYWdlKTsNCj4gKwkJcHV0X3BhZ2UocGFnZSk7DQo+ICsNCj4gKwkJ
bGVuIC09IHRoaXM7DQo+ICsJCWlvc3lzX21hcF9pbmNyKCZtYXBfaXRlciwgdGhpcyk7DQoN
ClJhcGxhY2UgaW9zeXNfbWFwX2luY3IoKSB3aXRoIG1hcF9vZmYgKz0gdGhpczsNCg0KPiAr
CQlvZmYgPSAwOw0KDQpNYXliZSBvZmYgKz0gdGhpcyA/DQoNCkkgdGhpbmsgdGhpcyBwYXR0
ZXJuIHNob3VsZCBiZSBhcHBsaWVkIHRvIGFsbCBzaW1pbGFyIGNvZGUuIEFzIHlvdSANCmFs
cmVhZHkgbm90ZWQsIGlvc3lzX21hcF9pbmNyKCkgaXMgcHJvYmxlbWF0aWMuDQoNCkJlc3Qg
cmVnYXJkcw0KVGhvbWFzDQoNCj4gKwl9DQo+ICsNCj4gKwlyZXR1cm4gMDsNCj4gK30NCj4g
Kw0KPiAgIGludCBzaG1lbV9yZWFkKHN0cnVjdCBmaWxlICpmaWxlLCBsb2ZmX3Qgb2ZmLCB2
b2lkICpkc3QsIHNpemVfdCBsZW4pDQo+ICAgew0KPiAgIAlyZXR1cm4gX19zaG1lbV9ydyhm
aWxlLCBvZmYsIGRzdCwgbGVuLCBmYWxzZSk7DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9ndC9zaG1lbV91dGlscy5oIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Qv
c2htZW1fdXRpbHMuaA0KPiBpbmRleCBjMTY2OTE3MGMzNTEuLmUxNzg0OTk5ZmFlZSAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Qvc2htZW1fdXRpbHMuaA0KPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9zaG1lbV91dGlscy5oDQo+IEBAIC04LDYg
KzgsNyBAQA0KPiAgIA0KPiAgICNpbmNsdWRlIDxsaW51eC90eXBlcy5oPg0KPiAgIA0KPiAr
c3RydWN0IGlvc3lzX21hcDsNCj4gICBzdHJ1Y3QgZHJtX2k5MTVfZ2VtX29iamVjdDsNCj4g
ICBzdHJ1Y3QgZmlsZTsNCj4gICANCj4gQEAgLTE3LDYgKzE4LDggQEAgc3RydWN0IGZpbGUg
KnNobWVtX2NyZWF0ZV9mcm9tX29iamVjdChzdHJ1Y3QgZHJtX2k5MTVfZ2VtX29iamVjdCAq
b2JqKTsNCj4gICB2b2lkICpzaG1lbV9waW5fbWFwKHN0cnVjdCBmaWxlICpmaWxlKTsNCj4g
ICB2b2lkIHNobWVtX3VucGluX21hcChzdHJ1Y3QgZmlsZSAqZmlsZSwgdm9pZCAqcHRyKTsN
Cj4gICANCj4gK2ludCBzaG1lbV9yZWFkX3RvX2lvc3lzX21hcChzdHJ1Y3QgZmlsZSAqZmls
ZSwgbG9mZl90IG9mZiwNCj4gKwkJCSAgICBzdHJ1Y3QgaW9zeXNfbWFwICptYXAsIHNpemVf
dCBsZW4pOw0KPiAgIGludCBzaG1lbV9yZWFkKHN0cnVjdCBmaWxlICpmaWxlLCBsb2ZmX3Qg
b2ZmLCB2b2lkICpkc3QsIHNpemVfdCBsZW4pOw0KPiAgIGludCBzaG1lbV93cml0ZShzdHJ1
Y3QgZmlsZSAqZmlsZSwgbG9mZl90IG9mZiwgdm9pZCAqc3JjLCBzaXplX3QgbGVuKTsNCj4g
ICANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Bl
cg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1
LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykN
Ckdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------gQpv65UBWYKbWr9aCT0LHwKm--

--------------rGniNOzacUQ0MHqNwoJIDw0N
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmH9e0AFAwAAAAAACgkQlh/E3EQov+Cf
5hAAnQm011yKWcHTrFiWS6HNoMdpDRlFZAR3o1t4k5eOAK1Y41st+9k0cLI+1Mbf2/6whQqKHmoZ
4Q5aj+nDXkHkNflqms87O9jNiu/J953NximLGdOEsyeZG/zfFxNtlXxM+gmxVs1vEw/U9+sYK86v
FV7LKmCRawPOMHs4y4kFqJ/DEK71zYMMDqRzyHX0LOJ8tPjS7sTTu0huF3JDD9ZjBxlySe2Sh8Oe
dqF+JZ1WcjsIuULLtn/bOGnkcl/HoK77S6ZutdLQNch+SoRvvUGoDdUQ+4XUC8bI0kMnXCVrlW1M
eEPYcKMIbigknBjs0HM19j5wXB2Cy8nKeVxqtmxyUevvTF9h0eIAS5oY6L9WX5AKrFGrrIndGUgN
aFJ2REBHTNIkfutlpL0eqCwPjTtKIUdhXRJOORhnucTHZ+3LDHZHCTpFx6jGO+pGrXCaaH9LbOwo
NG7TmMlFIgRj2GljsMMAs9n3gPorjG4rmP3GKZTukCIpcKmaVDo1nux5IVvON2n54cNG8Tb3EV64
t41NkaK5KrUtwiCAYUlxg9S5mAKn1jgUaujXb/HbFKgEn3gF8PNKOKqmuWR27j45wEUXxcDyn+fD
4UTd/FTJr/PhpkwD2acl2+7qEthZqtkOX1rtlPd57hsYPCmsK8gnocNRC3NcYR4ihbKVWiHFNoqH
pMI=
=vY0j
-----END PGP SIGNATURE-----

--------------rGniNOzacUQ0MHqNwoJIDw0N--
