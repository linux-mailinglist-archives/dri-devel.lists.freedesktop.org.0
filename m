Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1D04A9FF7
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 20:23:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A2B710E7E8;
	Fri,  4 Feb 2022 19:23:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8145410E7E8;
 Fri,  4 Feb 2022 19:23:02 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1A5A91F382;
 Fri,  4 Feb 2022 19:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644002581; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n6NsqfMisGLmq3ChHAsTHj29Bw+1dPCqsjdAC+Zntrc=;
 b=MppsJXXsjazckv/Ik8rzrz+8ur8ST7w8urvfSooojxGJ0TqNQsKrDDZ8KrFrPrcMyn1N+C
 PvjwwGelZ6f1kgSjUZ/IQgzQ4EfLMCN7vPTO9lPyP91WghRfokBpV1ddQ5w2gs4RxoTfCo
 aoDCS1/2ngOeLvEfCOjyBURYiOjCVyE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644002581;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=n6NsqfMisGLmq3ChHAsTHj29Bw+1dPCqsjdAC+Zntrc=;
 b=mtJW38IKUjTayiAUJLhM1Y91BXZJkUx+DMPybqtWMQCVtfDqgRDLc27xt+ei+TZodlJZ6z
 lzRDrFlOIxvzpQCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C5B5413ADE;
 Fri,  4 Feb 2022 19:23:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id VGGELhR9/WHDCAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 04 Feb 2022 19:23:00 +0000
Message-ID: <1f665285-fcaf-1990-2204-16a46c699f43@suse.de>
Date: Fri, 4 Feb 2022 20:23:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 09/19] drm/i915/guc: Convert engine record to iosys_map
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20220204174436.830121-1-lucas.demarchi@intel.com>
 <20220204174436.830121-10-lucas.demarchi@intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220204174436.830121-10-lucas.demarchi@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------IcujE9w5GWpKFoRtH8239YR0"
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
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------IcujE9w5GWpKFoRtH8239YR0
Content-Type: multipart/mixed; boundary="------------8lvZGpN84d6DFN0txZMijSXH";
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
 Sumit Semwal <sumit.semwal@linaro.org>, Daniel Vetter <daniel@ffwll.ch>
Message-ID: <1f665285-fcaf-1990-2204-16a46c699f43@suse.de>
Subject: Re: [PATCH 09/19] drm/i915/guc: Convert engine record to iosys_map
References: <20220204174436.830121-1-lucas.demarchi@intel.com>
 <20220204174436.830121-10-lucas.demarchi@intel.com>
In-Reply-To: <20220204174436.830121-10-lucas.demarchi@intel.com>

--------------8lvZGpN84d6DFN0txZMijSXH
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDQuMDIuMjIgdW0gMTg6NDQgc2NocmllYiBMdWNhcyBEZSBNYXJjaGk6DQo+
IFVzZSBpb3N5c19tYXAgdG8gcmVhZCBmaWVsZHMgZnJvbSB0aGUgZG1hX2Jsb2Igc28gYWNj
ZXNzIHRvIElPIGFuZA0KPiBzeXN0ZW0gbWVtb3J5IGlzIGFic3RyYWN0ZWQgYXdheS4NCj4g
DQo+IENjOiBNYXR0IFJvcGVyIDxtYXR0aGV3LmQucm9wZXJAaW50ZWwuY29tPg0KPiBDYzog
VGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5oZWxsc3Ryb21AbGludXguaW50ZWwuY29tPg0K
PiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPg0KPiBDYzogSm9obiBIYXJy
aXNvbiA8Sm9obi5DLkhhcnJpc29uQEludGVsLmNvbT4NCj4gQ2M6IE1hdHRoZXcgQnJvc3Qg
PG1hdHRoZXcuYnJvc3RAaW50ZWwuY29tPg0KPiBDYzogRGFuaWVsZSBDZXJhb2xvIFNwdXJp
byA8ZGFuaWVsZS5jZXJhb2xvc3B1cmlvQGludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTog
THVjYXMgRGUgTWFyY2hpIDxsdWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+DQo+IC0tLQ0KPiAg
IGRyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX2d1Y19hZHMuYyAgICAgIHwgMTQg
KysrKysrLS0tLS0tLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRlbF9n
dWNfYWRzLmggICAgICB8ICAzICsrLQ0KPiAgIC4uLi9ncHUvZHJtL2k5MTUvZ3QvdWMvaW50
ZWxfZ3VjX3N1Ym1pc3Npb24uYyAgIHwgMTcgKysrKysrKysrKy0tLS0tLS0NCj4gICAzIGZp
bGVzIGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQ0KPiANCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX2d1Y19hZHMu
YyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX2d1Y19hZHMuYw0KPiBpbmRl
eCA2MzExYjlkYTg3ZTQuLjFkMjFhMmQ0NTdlMCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ3QvdWMvaW50ZWxfZ3VjX2Fkcy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS9pOTE1L2d0L3VjL2ludGVsX2d1Y19hZHMuYw0KPiBAQCAtNjk4LDE4ICs2OTgsMTYg
QEAgdm9pZCBpbnRlbF9ndWNfYWRzX3Jlc2V0KHN0cnVjdCBpbnRlbF9ndWMgKmd1YykNCj4g
ICANCj4gICB1MzIgaW50ZWxfZ3VjX2VuZ2luZV91c2FnZV9vZmZzZXQoc3RydWN0IGludGVs
X2d1YyAqZ3VjKQ0KPiAgIHsNCj4gLQlzdHJ1Y3QgX19ndWNfYWRzX2Jsb2IgKmJsb2IgPSBn
dWMtPmFkc19ibG9iOw0KPiAtCXUzMiBiYXNlID0gaW50ZWxfZ3VjX2dndHRfb2Zmc2V0KGd1
YywgZ3VjLT5hZHNfdm1hKTsNCj4gLQl1MzIgb2Zmc2V0ID0gYmFzZSArIHB0cl9vZmZzZXQo
YmxvYiwgZW5naW5lX3VzYWdlKTsNCj4gLQ0KPiAtCXJldHVybiBvZmZzZXQ7DQo+ICsJcmV0
dXJuIGludGVsX2d1Y19nZ3R0X29mZnNldChndWMsIGd1Yy0+YWRzX3ZtYSkgKw0KPiArCQlv
ZmZzZXRvZihzdHJ1Y3QgX19ndWNfYWRzX2Jsb2IsIGVuZ2luZV91c2FnZSk7DQo+ICAgfQ0K
PiAgIA0KPiAtc3RydWN0IGd1Y19lbmdpbmVfdXNhZ2VfcmVjb3JkICppbnRlbF9ndWNfZW5n
aW5lX3VzYWdlKHN0cnVjdCBpbnRlbF9lbmdpbmVfY3MgKmVuZ2luZSkNCj4gK3N0cnVjdCBp
b3N5c19tYXAgaW50ZWxfZ3VjX2VuZ2luZV91c2FnZV9yZWNvcmRfbWFwKHN0cnVjdCBpbnRl
bF9lbmdpbmVfY3MgKmVuZ2luZSkNCj4gICB7DQo+ICAgCXN0cnVjdCBpbnRlbF9ndWMgKmd1
YyA9ICZlbmdpbmUtPmd0LT51Yy5ndWM7DQo+IC0Jc3RydWN0IF9fZ3VjX2Fkc19ibG9iICpi
bG9iID0gZ3VjLT5hZHNfYmxvYjsNCj4gICAJdTggZ3VjX2NsYXNzID0gZW5naW5lX2NsYXNz
X3RvX2d1Y19jbGFzcyhlbmdpbmUtPmNsYXNzKTsNCj4gKwlzaXplX3Qgb2Zmc2V0ID0gb2Zm
c2V0b2Yoc3RydWN0IF9fZ3VjX2Fkc19ibG9iLA0KPiArCQkJCSBlbmdpbmVfdXNhZ2UuZW5n
aW5lc1tndWNfY2xhc3NdW2lsb2cyKGVuZ2luZS0+bG9naWNhbF9tYXNrKV0pOw0KPiAgIA0K
PiAtCXJldHVybiAmYmxvYi0+ZW5naW5lX3VzYWdlLmVuZ2luZXNbZ3VjX2NsYXNzXVtpbG9n
MihlbmdpbmUtPmxvZ2ljYWxfbWFzayldOw0KPiArCXJldHVybiBJT1NZU19NQVBfSU5JVF9P
RkZTRVQoJmd1Yy0+YWRzX21hcCwgb2Zmc2V0KTsNCg0KSGVyZSdzIG9uZSBvZiB0aGUgZmV3
IGNhc2VzIHdoZXJlIHlvdSBjYW4gbGVnaXRpbWF0ZWx5IG1ha2UgYSBjb3B5IG9mIGFuIA0K
aW9zeXNfbWFwIGJ1ZmZlciBhbmQgY2FsbCBpb3N5c19tYXBfaW5jcigpIG9uIGl0LiBTYXZl
cyB5b3UgdGhlIA0KSU9TWVNfTUFQX0lOSVRfT0ZGU0VUKCkuDQoNCkJlc3QgcmVnYXJkcw0K
VGhvbWFzDQoNCj4gICB9DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9n
dC91Yy9pbnRlbF9ndWNfYWRzLmggYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRl
bF9ndWNfYWRzLmgNCj4gaW5kZXggZTc0YzExMGZhY2ZmLi4xYzY0ZjRkNmVhMjEgMTAwNjQ0
DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVsX2d1Y19hZHMuaA0K
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC91Yy9pbnRlbF9ndWNfYWRzLmgNCj4g
QEAgLTcsNiArNyw3IEBADQo+ICAgI2RlZmluZSBfSU5URUxfR1VDX0FEU19IXw0KPiAgIA0K
PiAgICNpbmNsdWRlIDxsaW51eC90eXBlcy5oPg0KPiArI2luY2x1ZGUgPGxpbnV4L2lvc3lz
LW1hcC5oPg0KPiAgIA0KPiAgIHN0cnVjdCBpbnRlbF9ndWM7DQo+ICAgc3RydWN0IGRybV9w
cmludGVyOw0KPiBAQCAtMTgsNyArMTksNyBAQCB2b2lkIGludGVsX2d1Y19hZHNfaW5pdF9s
YXRlKHN0cnVjdCBpbnRlbF9ndWMgKmd1Yyk7DQo+ICAgdm9pZCBpbnRlbF9ndWNfYWRzX3Jl
c2V0KHN0cnVjdCBpbnRlbF9ndWMgKmd1Yyk7DQo+ICAgdm9pZCBpbnRlbF9ndWNfYWRzX3By
aW50X3BvbGljeV9pbmZvKHN0cnVjdCBpbnRlbF9ndWMgKmd1YywNCj4gICAJCQkJICAgICBz
dHJ1Y3QgZHJtX3ByaW50ZXIgKnApOw0KPiAtc3RydWN0IGd1Y19lbmdpbmVfdXNhZ2VfcmVj
b3JkICppbnRlbF9ndWNfZW5naW5lX3VzYWdlKHN0cnVjdCBpbnRlbF9lbmdpbmVfY3MgKmVu
Z2luZSk7DQo+ICtzdHJ1Y3QgaW9zeXNfbWFwIGludGVsX2d1Y19lbmdpbmVfdXNhZ2VfcmVj
b3JkX21hcChzdHJ1Y3QgaW50ZWxfZW5naW5lX2NzICplbmdpbmUpOw0KPiAgIHUzMiBpbnRl
bF9ndWNfZW5naW5lX3VzYWdlX29mZnNldChzdHJ1Y3QgaW50ZWxfZ3VjICpndWMpOw0KPiAg
IA0KPiAgICNlbmRpZg0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Qv
dWMvaW50ZWxfZ3VjX3N1Ym1pc3Npb24uYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3Vj
L2ludGVsX2d1Y19zdWJtaXNzaW9uLmMNCj4gaW5kZXggYjNhNDI5YTkyYzBkLi42ZDM0ODQy
ZjY4YjQgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2d0L3VjL2ludGVs
X2d1Y19zdWJtaXNzaW9uLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3QvdWMv
aW50ZWxfZ3VjX3N1Ym1pc3Npb24uYw0KPiBAQCAtMTEzOSw2ICsxMTM5LDkgQEAgX19leHRl
bmRfbGFzdF9zd2l0Y2goc3RydWN0IGludGVsX2d1YyAqZ3VjLCB1NjQgKnByZXZfc3RhcnQs
IHUzMiBuZXdfc3RhcnQpDQo+ICAgCSpwcmV2X3N0YXJ0ID0gKCh1NjQpZ3Rfc3RhbXBfaGkg
PDwgMzIpIHwgbmV3X3N0YXJ0Ow0KPiAgIH0NCj4gICANCj4gKyNkZWZpbmUgcmVjb3JkX3Jl
YWQobWFwXywgZmllbGRfKSBcDQo+ICsJaW9zeXNfbWFwX3JkX2ZpZWxkKG1hcF8sIHN0cnVj
dCBndWNfZW5naW5lX3VzYWdlX3JlY29yZCwgZmllbGRfKQ0KPiArDQo+ICAgLyoNCj4gICAg
KiBHdUMgdXBkYXRlcyBzaGFyZWQgbWVtb3J5IGFuZCBLTUQgcmVhZHMgaXQuIFNpbmNlIHRo
aXMgaXMgbm90IHN5bmNocm9uaXplZCwNCj4gICAgKiB3ZSBydW4gaW50byBhIHJhY2Ugd2hl
cmUgdGhlIHZhbHVlIHJlYWQgaXMgaW5jb25zaXN0ZW50LiBTb21ldGltZXMgdGhlDQo+IEBA
IC0xMTUzLDE3ICsxMTU2LDE3IEBAIF9fZXh0ZW5kX2xhc3Rfc3dpdGNoKHN0cnVjdCBpbnRl
bF9ndWMgKmd1YywgdTY0ICpwcmV2X3N0YXJ0LCB1MzIgbmV3X3N0YXJ0KQ0KPiAgIHN0YXRp
YyB2b2lkIF9fZ2V0X2VuZ2luZV91c2FnZV9yZWNvcmQoc3RydWN0IGludGVsX2VuZ2luZV9j
cyAqZW5naW5lLA0KPiAgIAkJCQkgICAgICB1MzIgKmxhc3RfaW4sIHUzMiAqaWQsIHUzMiAq
dG90YWwpDQo+ICAgew0KPiAtCXN0cnVjdCBndWNfZW5naW5lX3VzYWdlX3JlY29yZCAqcmVj
ID0gaW50ZWxfZ3VjX2VuZ2luZV91c2FnZShlbmdpbmUpOw0KPiArCXN0cnVjdCBpb3N5c19t
YXAgcmVjX21hcCA9IGludGVsX2d1Y19lbmdpbmVfdXNhZ2VfcmVjb3JkX21hcChlbmdpbmUp
Ow0KPiAgIAlpbnQgaSA9IDA7DQo+ICAgDQo+ICAgCWRvIHsNCj4gLQkJKmxhc3RfaW4gPSBS
RUFEX09OQ0UocmVjLT5sYXN0X3N3aXRjaF9pbl9zdGFtcCk7DQo+IC0JCSppZCA9IFJFQURf
T05DRShyZWMtPmN1cnJlbnRfY29udGV4dF9pbmRleCk7DQo+IC0JCSp0b3RhbCA9IFJFQURf
T05DRShyZWMtPnRvdGFsX3J1bnRpbWUpOw0KPiArCQkqbGFzdF9pbiA9IHJlY29yZF9yZWFk
KCZyZWNfbWFwLCBsYXN0X3N3aXRjaF9pbl9zdGFtcCk7DQo+ICsJCSppZCA9IHJlY29yZF9y
ZWFkKCZyZWNfbWFwLCBjdXJyZW50X2NvbnRleHRfaW5kZXgpOw0KPiArCQkqdG90YWwgPSBy
ZWNvcmRfcmVhZCgmcmVjX21hcCwgdG90YWxfcnVudGltZSk7DQo+ICAgDQo+IC0JCWlmIChS
RUFEX09OQ0UocmVjLT5sYXN0X3N3aXRjaF9pbl9zdGFtcCkgPT0gKmxhc3RfaW4gJiYNCj4g
LQkJICAgIFJFQURfT05DRShyZWMtPmN1cnJlbnRfY29udGV4dF9pbmRleCkgPT0gKmlkICYm
DQo+IC0JCSAgICBSRUFEX09OQ0UocmVjLT50b3RhbF9ydW50aW1lKSA9PSAqdG90YWwpDQo+
ICsJCWlmIChyZWNvcmRfcmVhZCgmcmVjX21hcCwgbGFzdF9zd2l0Y2hfaW5fc3RhbXApID09
ICpsYXN0X2luICYmDQo+ICsJCSAgICByZWNvcmRfcmVhZCgmcmVjX21hcCwgY3VycmVudF9j
b250ZXh0X2luZGV4KSA9PSAqaWQgJiYNCj4gKwkJICAgIHJlY29yZF9yZWFkKCZyZWNfbWFw
LCB0b3RhbF9ydW50aW1lKSA9PSAqdG90YWwpDQo+ICAgCQkJYnJlYWs7DQo+ICAgCX0gd2hp
bGUgKCsraSA8IDYpOw0KPiAgIH0NCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhp
Y3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBH
bWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4
MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------8lvZGpN84d6DFN0txZMijSXH--

--------------IcujE9w5GWpKFoRtH8239YR0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmH9fRQFAwAAAAAACgkQlh/E3EQov+Bh
xBAAt3OXy3dw8aqu3X3rKEZNECcLTgoqTxJkcAd7QIMRHyLphKLpzDZQArNGCVFdKJQhNoENo+pn
7aAeWTH4WR6b6WemSNt5mwrmb7LYxJUOKtc3HnhCiRri0HMnMC4eJaBlO8XFGMV9iqwAvIxr2KH+
hzLYa/QbjvUw2H3HvuWbg79pujgykHBbKVc27WbrhJ4gGa+Qwlmc96u9K1+F2q/1m9qNNtG8SMVs
J69rfLTCVHZKmtASDKqWtFIiuhBVgyEPyQ17kVDUbjQdOeq+J/M63woSqXect3fjXJYAcMUIkOtO
mU2Cr+gjaWxmu3AtX/RgJ0QyQ4T3qSF75NBwlSu3WQwtGCkvccjKeWxGv7IR/dkCxgxIAEC+9ZaM
b1uhE3KYzhCY1MPmGIk9aJXOmxZfoxo73tri2LtE6Ms2nYj0cUePmrvEaQ5JJkxJI9YYkDpkP1MD
q3Zxh/WiYRpcf24rPk/X3c1+Itqwa8bomIZrZ6Zwpf0tVzbwujKgR/1lU3JeoGGTYLq3I+mmrToZ
yfJ40qLZWr36mjfJArVqCBu9ghYLhm2NRx9BIG8FdkCcetrQn4E/I6etyVrnp1uqRkoaZJ5PPWQs
SHDKgUb7hmcANDxK/z39o6L+1Sjf/qw2e4mmu5d4RHqQWjxD7+7AAtAt2nypYj8MBFX3ubwGaPLA
qmA=
=P69V
-----END PGP SIGNATURE-----

--------------IcujE9w5GWpKFoRtH8239YR0--
