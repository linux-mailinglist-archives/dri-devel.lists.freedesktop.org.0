Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DCB065AF23
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 11:01:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84E3810E2DC;
	Mon,  2 Jan 2023 10:01:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4C5C10E2DC
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 10:00:58 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 76D4220B3E;
 Mon,  2 Jan 2023 10:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1672653657; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0DHzXC2mV+CDwI3BJ6sDYedkebTtJRTUe92SnTCBROs=;
 b=y3gtQUQsBWZejX1H6L9fcNxoUblV4ptU/eV/xDw8jPQ+iDP+FdnhkII0skH5AY2Xgk0QLD
 pNjRXnOI+XrQYKvmvTBkQk0maUfPR3HGi3BORHB347P+hQvz0FpOoMBcCd0XKD8ujwCsfA
 McJKmtn4Cb+qVki3ubMxLN2mspNmhMM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1672653657;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0DHzXC2mV+CDwI3BJ6sDYedkebTtJRTUe92SnTCBROs=;
 b=10M3x9wLUxPjQeCTgH0gQ0VbFvyCRs3+KCR9YuLD5SHdLpqlfHzVwx55v1Uo401zX42jCL
 OZUFEDT51e4jzWAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3A3B6139C8;
 Mon,  2 Jan 2023 10:00:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 7uT0DFmrsmMRSwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 02 Jan 2023 10:00:57 +0000
Message-ID: <046b293b-67ae-1cc5-a848-6857572c1f0e@suse.de>
Date: Mon, 2 Jan 2023 11:00:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 07/13] drm/format-helper: Add conversion from XRGB8888
 to ARGB8888
Content-Language: en-US
To: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>, daniel@ffwll.ch,
 airlied@gmail.com, javierm@redhat.com, jose.exposito89@gmail.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
References: <20221220161145.27568-1-tzimmermann@suse.de>
 <20221220161145.27568-8-tzimmermann@suse.de>
 <78e534b4-4c82-c528-80e6-88f1d833a88b@igalia.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <78e534b4-4c82-c528-80e6-88f1d833a88b@igalia.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------uMoCuUoduvjcwl1Mg0aDKKW0"
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
--------------uMoCuUoduvjcwl1Mg0aDKKW0
Content-Type: multipart/mixed; boundary="------------T2C7lJGa0nGKeAsMeQ8UaIas";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>, daniel@ffwll.ch,
 airlied@gmail.com, javierm@redhat.com, jose.exposito89@gmail.com,
 mripard@kernel.org, maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org
Message-ID: <046b293b-67ae-1cc5-a848-6857572c1f0e@suse.de>
Subject: Re: [PATCH v2 07/13] drm/format-helper: Add conversion from XRGB8888
 to ARGB8888
References: <20221220161145.27568-1-tzimmermann@suse.de>
 <20221220161145.27568-8-tzimmermann@suse.de>
 <78e534b4-4c82-c528-80e6-88f1d833a88b@igalia.com>
In-Reply-To: <78e534b4-4c82-c528-80e6-88f1d833a88b@igalia.com>

--------------T2C7lJGa0nGKeAsMeQ8UaIas
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjEuMTIuMjIgdW0gMjE6MDcgc2NocmllYiBNYcOtcmEgQ2FuYWw6DQo+IE9u
IDEyLzIwLzIyIDEzOjExLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4+IEFkZCBkZWRp
Y2F0ZWQgaGVscGVyIHRvIGNvbnZlcnQgZnJvbSBYUkdCODg4OCB0byBBUkdCODg4OC4gU2V0
cw0KPj4gYWxsIGFscGhhIGJpdHMgdG8gbWFrZSBwaXhlbHMgZnVsbHkgb3BhcXVlLg0KPj4N
Cj4+IHYyOg0KPj4gCSogdXNlIGNwdWJ1Zl90b19sZTMyKCkNCj4+IAkqIHR5cGUgZml4ZXMN
Cj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5A
c3VzZS5kZT4NCj4+IFJldmlld2VkLWJ5OiBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXMgPGph
dmllcm1AcmVkaGF0LmNvbT4NCj4+IC0tLQ0KPj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX2Zv
cm1hdF9oZWxwZXIuYyAgICAgICAgICAgfCA1MyArKysrKysrKysrKysrKystDQo+PiAgIC4u
Li9ncHUvZHJtL3Rlc3RzL2RybV9mb3JtYXRfaGVscGVyX3Rlc3QuYyAgICB8IDYzICsrKysr
KysrKysrKysrKysrKysNCj4+ICAgaW5jbHVkZS9kcm0vZHJtX2Zvcm1hdF9oZWxwZXIuaCAg
ICAgICAgICAgICAgIHwgIDMgKw0KPj4gICAzIGZpbGVzIGNoYW5nZWQsIDExNyBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPj4NCj4gDQo+IFsuLi5dDQo+IA0KPj4gICANCj4+
ICtzdGF0aWMgdm9pZCBkcm1fdGVzdF9mYl94cmdiODg4OF90b19hcmdiODg4OChzdHJ1Y3Qg
a3VuaXQgKnRlc3QpDQo+PiArew0KPj4gKwljb25zdCBzdHJ1Y3QgY29udmVydF94cmdiODg4
OF9jYXNlICpwYXJhbXMgPSB0ZXN0LT5wYXJhbV92YWx1ZTsNCj4+ICsJY29uc3Qgc3RydWN0
IGNvbnZlcnRfdG9fYXJnYjg4ODhfcmVzdWx0ICpyZXN1bHQgPSAmcGFyYW1zLT5hcmdiODg4
OF9yZXN1bHQ7DQo+PiArCXNpemVfdCBkc3Rfc2l6ZTsNCj4+ICsJdTMyICpidWYgPSBOVUxM
Ow0KPj4gKwlfX2xlMzIgKnhyZ2I4ODg4ID0gTlVMTDsNCj4+ICsJc3RydWN0IGlvc3lzX21h
cCBkc3QsIHNyYzsNCj4+ICsNCj4+ICsJc3RydWN0IGRybV9mcmFtZWJ1ZmZlciBmYiA9IHsN
Cj4+ICsJCS5mb3JtYXQgPSBkcm1fZm9ybWF0X2luZm8oRFJNX0ZPUk1BVF9YUkdCODg4OCks
DQo+PiArCQkucGl0Y2hlcyA9IHsgcGFyYW1zLT5waXRjaCwgMCwgMCB9LA0KPj4gKwl9Ow0K
Pj4gKw0KPj4gKwlkc3Rfc2l6ZSA9IGNvbnZlcnNpb25fYnVmX3NpemUoRFJNX0ZPUk1BVF9B
UkdCODg4OCwNCj4+ICsJCQkJICAgICAgIHJlc3VsdC0+ZHN0X3BpdGNoLCAmcGFyYW1zLT5j
bGlwKTsNCj4+ICsJS1VOSVRfQVNTRVJUX0dUKHRlc3QsIGRzdF9zaXplLCAwKTsNCj4+ICsN
Cj4+ICsJYnVmID0ga3VuaXRfa3phbGxvYyh0ZXN0LCBkc3Rfc2l6ZSwgR0ZQX0tFUk5FTCk7
DQo+PiArCUtVTklUX0FTU0VSVF9OT1RfRVJSX09SX05VTEwodGVzdCwgYnVmKTsNCj4+ICsJ
aW9zeXNfbWFwX3NldF92YWRkcigmZHN0LCBidWYpOw0KPj4gKw0KPj4gKwl4cmdiODg4OCA9
IGNwdWJ1Zl90b19sZTMyKHRlc3QsIHBhcmFtcy0+eHJnYjg4ODgsIFRFU1RfQlVGX1NJWkUp
Ow0KPj4gKwlLVU5JVF9BU1NFUlRfTk9UX0VSUl9PUl9OVUxMKHRlc3QsIHhyZ2I4ODg4KTsN
Cj4+ICsJaW9zeXNfbWFwX3NldF92YWRkcigmc3JjLCB4cmdiODg4OCk7DQo+PiArDQo+PiAr
CWRybV9mYl94cmdiODg4OF90b19hcmdiODg4OCgmZHN0LCAmcmVzdWx0LT5kc3RfcGl0Y2gs
ICZzcmMsICZmYiwgJnBhcmFtcy0+Y2xpcCk7DQo+PiArCWJ1ZiA9IGxlMzJidWZfdG9fY3B1
KHRlc3QsIChfX2ZvcmNlIGNvbnN0IF9fbGUzMiAqKWJ1ZiwgZHN0X3NpemUgLyBzaXplb2Yo
dTMyKSk7DQo+PiArCUtVTklUX0VYUEVDVF9FUSh0ZXN0LCBtZW1jbXAoYnVmLCByZXN1bHQt
PmV4cGVjdGVkLCBkc3Rfc2l6ZSksIDApOw0KPiANCj4gRm9yIHRoaXMgdGVzdCBhbmQgdGhl
IHRlc3RzIGZyb20gcGF0Y2hlcyAwOC8xMyBhbmQgMDkvMTMsIGl0IHdvdWxkIGJlDQo+IG5p
Y2UgdG8gdXNlIHRoZSBLVU5JVF9FWFBFQ1RfTUVNRVEgbWFjcm8gaW5zdGVhZCBvZiB0aGUg
S1VOSVRfRVhQRUNUX0VRLA0KPiBhcyBjYW4gYmUgc2VlbiBpbiBbMV0uIEkgZ3Vlc3MgZHJt
LW1pc2MtbmV4dCB3YXMgbm90IHJlYmFzZWQgeWV0IHRvDQo+IHN1cHBvcnQgS1VOSVRfRVhQ
RUNUX01FTUVRLCBhcyBpdCB3YXMgaW50cm9kdWNlZCBpbiB0aGUgY3VycmVudCBtZXJnZQ0K
PiB3aW5kb3csIGJ1dCBpdCBpcyBnb29kIHRvIGtlZXAgdGhpcyBpbiBtaW5kLg0KDQpJIHNl
ZS4gSSdsbCB0cnkgdG8gZ2V0IGl0IGJhY2ttZXJnZWQgaW50byBkcm0tbWlzYy1uZXh0IHNv
b24uIFRoYW5rcyBmb3IgDQpyZXZpZXdpbmcuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoN
Cj4gDQo+IFsxXQ0KPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2Vy
bmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvY29tbWl0Lz9pZD1hNTJhNTQ1MWY0M2JiNzY3
NDNjNTFkZDQ2Nzg4MDA4ODM3MjQzZjI5DQo+IA0KPiBCZXN0IFJlZ2FyZHMsDQo+IC0gTWHD
rXJhIENhbmFsDQo+IA0KPj4gK30NCj4+ICsNCj4+ICAgc3RhdGljIHZvaWQgZHJtX3Rlc3Rf
ZmJfeHJnYjg4ODhfdG9feHJnYjIxMDEwMTAoc3RydWN0IGt1bml0ICp0ZXN0KQ0KPj4gICB7
DQo+PiAgIAljb25zdCBzdHJ1Y3QgY29udmVydF94cmdiODg4OF9jYXNlICpwYXJhbXMgPSB0
ZXN0LT5wYXJhbV92YWx1ZTsNCj4+IEBAIC00ODQsNiArNTQ2LDcgQEAgc3RhdGljIHN0cnVj
dCBrdW5pdF9jYXNlIGRybV9mb3JtYXRfaGVscGVyX3Rlc3RfY2FzZXNbXSA9IHsNCj4+ICAg
CUtVTklUX0NBU0VfUEFSQU0oZHJtX3Rlc3RfZmJfeHJnYjg4ODhfdG9fcmdiMzMyLCBjb252
ZXJ0X3hyZ2I4ODg4X2dlbl9wYXJhbXMpLA0KPj4gICAJS1VOSVRfQ0FTRV9QQVJBTShkcm1f
dGVzdF9mYl94cmdiODg4OF90b19yZ2I1NjUsIGNvbnZlcnRfeHJnYjg4ODhfZ2VuX3BhcmFt
cyksDQo+PiAgIAlLVU5JVF9DQVNFX1BBUkFNKGRybV90ZXN0X2ZiX3hyZ2I4ODg4X3RvX3Jn
Yjg4OCwgY29udmVydF94cmdiODg4OF9nZW5fcGFyYW1zKSwNCj4+ICsJS1VOSVRfQ0FTRV9Q
QVJBTShkcm1fdGVzdF9mYl94cmdiODg4OF90b19hcmdiODg4OCwgY29udmVydF94cmdiODg4
OF9nZW5fcGFyYW1zKSwNCj4+ICAgCUtVTklUX0NBU0VfUEFSQU0oZHJtX3Rlc3RfZmJfeHJn
Yjg4ODhfdG9feHJnYjIxMDEwMTAsIGNvbnZlcnRfeHJnYjg4ODhfZ2VuX3BhcmFtcyksDQo+
PiAgIAl7fQ0KPj4gICB9Ow0KPj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9mb3Jt
YXRfaGVscGVyLmggYi9pbmNsdWRlL2RybS9kcm1fZm9ybWF0X2hlbHBlci5oDQo+PiBpbmRl
eCBlYjVjOThjZjgyYjguLjNjZTgxMjlkZmU0MyAxMDA2NDQNCj4+IC0tLSBhL2luY2x1ZGUv
ZHJtL2RybV9mb3JtYXRfaGVscGVyLmgNCj4+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9mb3Jt
YXRfaGVscGVyLmgNCj4+IEBAIC0zMyw2ICszMyw5IEBAIHZvaWQgZHJtX2ZiX3hyZ2I4ODg4
X3RvX3JnYjU2NShzdHJ1Y3QgaW9zeXNfbWFwICpkc3QsIGNvbnN0IHVuc2lnbmVkIGludCAq
ZHN0X3BpDQo+PiAgIHZvaWQgZHJtX2ZiX3hyZ2I4ODg4X3RvX3JnYjg4OChzdHJ1Y3QgaW9z
eXNfbWFwICpkc3QsIGNvbnN0IHVuc2lnbmVkIGludCAqZHN0X3BpdGNoLA0KPj4gICAJCQkg
ICAgICAgY29uc3Qgc3RydWN0IGlvc3lzX21hcCAqc3JjLCBjb25zdCBzdHJ1Y3QgZHJtX2Zy
YW1lYnVmZmVyICpmYiwNCj4+ICAgCQkJICAgICAgIGNvbnN0IHN0cnVjdCBkcm1fcmVjdCAq
Y2xpcCk7DQo+PiArdm9pZCBkcm1fZmJfeHJnYjg4ODhfdG9fYXJnYjg4ODgoc3RydWN0IGlv
c3lzX21hcCAqZHN0LCBjb25zdCB1bnNpZ25lZCBpbnQgKmRzdF9waXRjaCwNCj4+ICsJCQkJ
IGNvbnN0IHN0cnVjdCBpb3N5c19tYXAgKnNyYywgY29uc3Qgc3RydWN0IGRybV9mcmFtZWJ1
ZmZlciAqZmIsDQo+PiArCQkJCSBjb25zdCBzdHJ1Y3QgZHJtX3JlY3QgKmNsaXApOw0KPj4g
ICB2b2lkIGRybV9mYl94cmdiODg4OF90b194cmdiMjEwMTAxMChzdHJ1Y3QgaW9zeXNfbWFw
ICpkc3QsIGNvbnN0IHVuc2lnbmVkIGludCAqZHN0X3BpdGNoLA0KPj4gICAJCQkJICAgIGNv
bnN0IHN0cnVjdCBpb3N5c19tYXAgKnNyYywgY29uc3Qgc3RydWN0IGRybV9mcmFtZWJ1ZmZl
ciAqZmIsDQo+PiAgIAkJCQkgICAgY29uc3Qgc3RydWN0IGRybV9yZWN0ICpjbGlwKTsNCg0K
LS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VT
RSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQw
OSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2No
w6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------T2C7lJGa0nGKeAsMeQ8UaIas--

--------------uMoCuUoduvjcwl1Mg0aDKKW0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmOyq1gFAwAAAAAACgkQlh/E3EQov+BJ
+RAAido+H9coNOgzyyUnqNyt8eV9cqvKkYqTF1Fs3heJd1Dh9YDcSpkiImBrC8r3PHp5fAGjKpgL
BPrCfbtJT80QFc9YJiPGsxQhHnAxO3VYo0Ie10KBot2K2PbSobUvNLfBtT2qci2kkPdTD4eBxCiT
E2mI5YAO9JVSc/j743ViTLyIQBZYR/bcQO4RFrQrUy09A6a6VQ3d9wPHiE0i/rWFucDyxxGBYpLH
D2zshXtpsv6Vwnk39pJvPUmaJODQ2S0XQx7pK7CeY9LLzdMMRCMSGVCkedsWPjsd2uOlZKnc6X0Y
WsoTbOCWBj1I5NB2XXWvz/dJsxImvb0lg9Jd0W277A5Japhq9Yr4bMqv+0x/CEGTcbJXCmQx0E1g
x1t5zMX4wLAK9Bd1FFfm8c8vrfn0W32P0tI5G2GEs35n8bQIMkrwi2hmJGCmOYoDSKPrl7WpHYf1
fnPJde/gAS3gayFnHoF6Kg5zi8+uq3gMEZOOW/Bn3gtuthO+D7hqcpV+wiStRBXrWVhBZpWgMBrH
nqYD8VUadVuIskqN7NPKrHDDom6YAFWiQyq/YeY/LwWs4OQmXGGurdQIgXMZyX8XPbzXPhjwU+C1
lCauiwi/o91t7nm2oWRv3Jfxui19xGQFCqpXSKuivjAh20510xDOe39vIGhmrB+XqJ5IrPhjgf7L
s6o=
=Anaf
-----END PGP SIGNATURE-----

--------------uMoCuUoduvjcwl1Mg0aDKKW0--
