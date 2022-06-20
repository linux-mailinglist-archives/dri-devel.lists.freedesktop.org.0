Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 375AE551672
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 12:59:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A115113433;
	Mon, 20 Jun 2022 10:59:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5382113432
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 10:59:47 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 266A7210E3;
 Mon, 20 Jun 2022 10:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1655722786; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ML3lVoPUabZFJbaoWLJsUTCRGRAyueoDTwM919Fs5nY=;
 b=htHWPbiL0ctFMTY0ZFVXi1NMJPCVfb0EW6wNg6mERQ5GKJkT6bR2U480WbmoOdI49nx+w2
 NJzo8KWnXN563GWlH0lFmx9l5Lk8eDTIs6RTaiLFvy4XqaFBN9XMIIeZbfuwVcDuVryKOb
 vzhuQPa4Rh+DyHMIbDuI3JsB00pWogM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1655722786;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ML3lVoPUabZFJbaoWLJsUTCRGRAyueoDTwM919Fs5nY=;
 b=KQSL4gEgTuuxfqC39BsMc3EpPPVFFR9QBB/IRju9WQ3UpMLtF7XN7ze9Im6E92ztWOaW6s
 Rvc/wqpYCsFx17BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E5DCE13638;
 Mon, 20 Jun 2022 10:59:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KXWoNiFTsGLFcgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 20 Jun 2022 10:59:45 +0000
Message-ID: <8b3db460-2c5c-2959-fef0-024031c78c80@suse.de>
Date: Mon, 20 Jun 2022 12:59:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 32/64] drm/vc4: dsi: Fix the driver structure lifetime
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20220610092924.754942-1-maxime@cerno.tech>
 <20220610092924.754942-33-maxime@cerno.tech>
 <f20aec33-93e9-d90d-2ae0-4c8c8bde70e7@suse.de>
In-Reply-To: <f20aec33-93e9-d90d-2ae0-4c8c8bde70e7@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------zDIczh4Pr58hKk1uK807FTWg"
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
--------------zDIczh4Pr58hKk1uK807FTWg
Content-Type: multipart/mixed; boundary="------------IJpzcdXGIDauqnkK2vPRcR03";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org
Message-ID: <8b3db460-2c5c-2959-fef0-024031c78c80@suse.de>
Subject: Re: [PATCH 32/64] drm/vc4: dsi: Fix the driver structure lifetime
References: <20220610092924.754942-1-maxime@cerno.tech>
 <20220610092924.754942-33-maxime@cerno.tech>
 <f20aec33-93e9-d90d-2ae0-4c8c8bde70e7@suse.de>
In-Reply-To: <f20aec33-93e9-d90d-2ae0-4c8c8bde70e7@suse.de>

--------------IJpzcdXGIDauqnkK2vPRcR03
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDIwLjA2LjIyIHVtIDEyOjU1IHNjaHJpZWIgVGhvbWFzIFppbW1lcm1hbm46DQo+
IA0KPiANCj4gQW0gMTAuMDYuMjIgdW0gMTE6Mjggc2NocmllYiBNYXhpbWUgUmlwYXJkOg0K
Pj4gVGhlIHZjNF9kc2kgc3RydWN0dXJlIGlzIGN1cnJlbnRseSBhbGxvY2F0ZWQgdGhyb3Vn
aCBhIGRldmljZS1tYW5hZ2VkDQo+PiBhbGxvY2F0aW9uLiBUaGlzIGNhbiBsZWFkIHRvIHVz
ZS1hZnRlci1mcmVlIGlzc3VlcyBob3dldmVyIGluIHRoZSANCj4+IHVuYmluZGluZw0KPj4g
cGF0aCBzaW5jZSB0aGUgRFJNIGVudGl0aWVzIHdpbGwgc3RpY2sgYXJvdW5kLCBidXQgdGhl
IHVuZGVybHlpbmcgDQo+PiBzdHJ1Y3R1cmUNCj4+IGhhcyBiZWVuIGZyZWVkLg0KPj4NCj4+
IEhvd2V2ZXIsIHdlIGNhbid0IGp1c3QgZml4IGl0IGJ5IHVzaW5nIGEgRFJNLW1hbmFnZWQg
YWxsb2NhdGlvbiBsaWtlIA0KPj4gd2UgZGlkDQo+PiBmb3IgdGhlIG90aGVyIGRyaXZlcnMg
c2luY2UgdGhlIERTSSBjYXNlIGlzIGEgYml0IG1vcmUgaW50cmljYXRlLg0KPj4NCj4+IElu
ZGVlZCwgdGhlIHN0cnVjdHVyZSB3aWxsIGJlIGFsbG9jYXRlZCBhdCBwcm9iZSB0aW1lLCB3
aGVuIHdlIGRvbid0IA0KPj4gaGF2ZSBhDQo+PiBEUk0gZGV2aWNlIHlldCwgdG8gYmUgYWJs
ZSB0byByZWdpc3RlciB0aGUgRFNJIGJ1cyBkcml2ZXIuIFdlIHdpbGwgdGhlbg0KPj4gcmV1
c2UgaXQgYXQgYmluZCB0aW1lIHRvIHJlZ2lzdGVyIG91ciBLTVMgZW50aXRpZXMgaW4gdGhl
IGZyYW1ld29yay4NCj4+DQo+PiBJbiBvcmRlciB0byB3b3JrIGFyb3VuZCBib3RoIGNvbnN0
cmFpbnRzLCB3ZSBjYW4gdXNlIGEga3JlZiB0byB0cmFjayB0aGUNCj4+IHVzZXJzIG9mIHRo
ZSBzdHJ1Y3R1cmUgKERTSSBob3N0LCBhbmQgS01TKSwgYW5kIHRoZW4gcHV0IG91ciBzdHJ1
Y3R1cmUgDQo+PiB3aGVuDQo+PiB0aGUgRFNJIGhvc3Qgd2lsbCBoYXZlIGJlZW4gdW5yZWdp
c3RlcmVkLCBhbmQgdGhyb3VnaCBhIERSTS1tYW5hZ2VkIA0KPj4gYWN0aW9uDQo+PiB0aGF0
IHdpbGwgZXhlY3V0ZSBvbmNlIHdlIHdvbid0IG5lZWQgdGhlIEtNUyBlbnRpdGllcyBhbnlt
b3JlLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IE1heGltZSBSaXBhcmQgPG1heGltZUBjZXJu
by50ZWNoPg0KPj4gLS0tDQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9kc2kuYyB8
IDI5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKystDQo+PiDCoCAxIGZpbGUgY2hhbmdl
ZCwgMjggaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPj4NCj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9kc2kuYyANCj4+IGIvZHJpdmVycy9ncHUvZHJt
L3ZjNC92YzRfZHNpLmMNCj4+IGluZGV4IDEwNTMzYTJhNDFiMy4uMjgyNTM3ZjI3YjhlIDEw
MDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfZHNpLmMNCj4+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2RzaS5jDQo+PiBAQCAtNTEwLDYgKzUxMCw4IEBA
IHN0cnVjdCB2YzRfZHNpIHsNCj4+IMKgwqDCoMKgwqAgc3RydWN0IHZjNF9lbmNvZGVyIGVu
Y29kZXI7DQo+PiDCoMKgwqDCoMKgIHN0cnVjdCBtaXBpX2RzaV9ob3N0IGRzaV9ob3N0Ow0K
Pj4gK8KgwqDCoCBzdHJ1Y3Qga3JlZiBrcmVmOw0KPj4gKw0KPj4gwqDCoMKgwqDCoCBzdHJ1
Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2Ow0KPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgZHJtX2Jy
aWRnZSAqYnJpZGdlOw0KPj4gQEAgLTE0NzksNiArMTQ4MSwxNSBAQCB2YzRfZHNpX2luaXRf
cGh5X2Nsb2NrcyhzdHJ1Y3QgdmM0X2RzaSAqZHNpKQ0KPj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBkc2ktPmNsa19vbmVjZWxsKTsNCj4+IMKg
IH0NCj4+ICtzdGF0aWMgdm9pZCB2YzRfZHNpX3JlbGVhc2Uoc3RydWN0IGtyZWYgKmtyZWYp
Ow0KPj4gKw0KPj4gK3N0YXRpYyB2b2lkIHZjNF9kc2lfcHV0KHN0cnVjdCBkcm1fZGV2aWNl
ICpkcm0sIHZvaWQgKnB0cikNCj4+ICt7DQo+PiArwqDCoMKgIHN0cnVjdCB2YzRfZHNpICpk
c2kgPSBwdHI7DQo+PiArDQo+PiArwqDCoMKgIGtyZWZfcHV0KCZkc2ktPmtyZWYsICZ2YzRf
ZHNpX3JlbGVhc2UpOw0KPj4gK30NCj4+ICsNCj4+IMKgIHN0YXRpYyBpbnQgdmM0X2RzaV9i
aW5kKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldmljZSAqbWFzdGVyLCANCj4+IHZv
aWQgKmRhdGEpDQo+PiDCoCB7DQo+PiDCoMKgwqDCoMKgIHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKnBkZXYgPSB0b19wbGF0Zm9ybV9kZXZpY2UoZGV2KTsNCj4+IEBAIC0xNDg4LDYgKzE0
OTksMTIgQEAgc3RhdGljIGludCB2YzRfZHNpX2JpbmQoc3RydWN0IGRldmljZSAqZGV2LCAN
Cj4+IHN0cnVjdCBkZXZpY2UgKm1hc3Rlciwgdm9pZCAqZGF0YSkNCj4+IMKgwqDCoMKgwqAg
ZG1hX2NhcF9tYXNrX3QgZG1hX21hc2s7DQo+PiDCoMKgwqDCoMKgIGludCByZXQ7DQo+PiAr
wqDCoMKgIGtyZWZfZ2V0KCZkc2ktPmtyZWYpOw0KPj4gKw0KPj4gK8KgwqDCoCByZXQgPSBk
cm1tX2FkZF9hY3Rpb25fb3JfcmVzZXQoZHJtLCB2YzRfZHNpX3B1dCwgZHNpKTsNCj4+ICvC
oMKgwqAgaWYgKHJldCkNCj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gcmV0Ow0KPj4gKw0K
Pj4gwqDCoMKgwqDCoCBkc2ktPnZhcmlhbnQgPSBvZl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEo
ZGV2KTsNCj4+IMKgwqDCoMKgwqAgSU5JVF9MSVNUX0hFQUQoJmRzaS0+YnJpZGdlX2NoYWlu
KTsNCj4+IEBAIC0xNjQyLDE2ICsxNjU5LDI1IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgY29t
cG9uZW50X29wcyB2YzRfZHNpX29wcyA9IHsNCj4+IMKgwqDCoMKgwqAgLnVuYmluZCA9IHZj
NF9kc2lfdW5iaW5kLA0KPj4gwqAgfTsNCj4+ICtzdGF0aWMgdm9pZCB2YzRfZHNpX3JlbGVh
c2Uoc3RydWN0IGtyZWYgKmtyZWYpDQo+PiArew0KPj4gK8KgwqDCoCBzdHJ1Y3QgdmM0X2Rz
aSAqZHNpID0NCj4+ICvCoMKgwqDCoMKgwqDCoCBjb250YWluZXJfb2Yoa3JlZiwgc3RydWN0
IHZjNF9kc2ksIGtyZWYpOw0KPj4gKw0KPj4gK8KgwqDCoCBrZnJlZShkc2kpOw0KPj4gK30N
Cj4+ICsNCj4+IMKgIHN0YXRpYyBpbnQgdmM0X2RzaV9kZXZfcHJvYmUoc3RydWN0IHBsYXRm
b3JtX2RldmljZSAqcGRldikNCj4+IMKgIHsNCj4+IMKgwqDCoMKgwqAgc3RydWN0IGRldmlj
ZSAqZGV2ID0gJnBkZXYtPmRldjsNCj4+IMKgwqDCoMKgwqAgc3RydWN0IHZjNF9kc2kgKmRz
aTsNCj4+IC3CoMKgwqAgZHNpID0gZGV2bV9remFsbG9jKGRldiwgc2l6ZW9mKCpkc2kpLCBH
RlBfS0VSTkVMKTsNCj4+ICvCoMKgwqAgZHNpID0ga3phbGxvYyhzaXplb2YoKmRzaSksIEdG
UF9LRVJORUwpOw0KPj4gwqDCoMKgwqDCoCBpZiAoIWRzaSkNCj4+IMKgwqDCoMKgwqDCoMKg
wqDCoCByZXR1cm4gLUVOT01FTTsNCj4+IMKgwqDCoMKgwqAgZGV2X3NldF9kcnZkYXRhKGRl
diwgZHNpKTsNCj4+ICvCoMKgwqAga3JlZl9pbml0KCZkc2ktPmtyZWYpOw0KPj4gwqDCoMKg
wqDCoCBkc2ktPnBkZXYgPSBwZGV2Ow0KPj4gwqDCoMKgwqDCoCBkc2ktPmRzaV9ob3N0Lm9w
cyA9ICZ2YzRfZHNpX2hvc3Rfb3BzOw0KPj4gwqDCoMKgwqDCoCBkc2ktPmRzaV9ob3N0LmRl
diA9IGRldjsNCj4+IEBAIC0xNjY2LDYgKzE2OTIsNyBAQCBzdGF0aWMgaW50IHZjNF9kc2lf
ZGV2X3JlbW92ZShzdHJ1Y3QgDQo+PiBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+PiDCoMKg
wqDCoMKgIHN0cnVjdCB2YzRfZHNpICpkc2kgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsNCj4+
IMKgwqDCoMKgwqAgbWlwaV9kc2lfaG9zdF91bnJlZ2lzdGVyKCZkc2ktPmRzaV9ob3N0KTsN
Cj4+ICvCoMKgwqAga3JlZl9wdXQoJmRzaS0+a3JlZiwgJnZjNF9kc2lfcmVsZWFzZSk7DQo+
IA0KPiBNYXliZSB2YzRfZHNpX3B1dCgpID8NCg0KTm8sIHdhaXQuIFRoYXQncyB0aGUgcmVs
ZWFzZSBmdW5jdGlvbi4NCg0KSXQncyBjb25mdXNpbmcuIEknZCByZW5hbWUgdmM0X2RzaV9w
dXQoKSB0byB2YzRfZHNpX3JlbGVhc2VfYWN0aW9uKCkgYW5kIA0Kd3JhcCB0aG9zZSBrcmVm
X2dldC9rcmVmX3B1dCBjYWxscyBpbiBzbWFsbCBoZWxwZXJzIG5hbWVkIA0KdmM0X2RzaV9n
ZXQvdmM0X2RzaV9wdXQuIFRoYXQncyBtb3JlIGFsaWduZWQgdG8gdGhlIHVzdWFsIG5hbWlu
ZyANCmNvbnZlbnRpb25zLCBJJ2Qgc2F5Lg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+
IA0KPj4gwqDCoMKgwqDCoCByZXR1cm4gMDsNCj4+IMKgIH0NCj4gDQoNCi0tIA0KVGhvbWFz
IFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUg
U29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJn
LCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJl
cjogSXZvIFRvdGV2DQo=

--------------IJpzcdXGIDauqnkK2vPRcR03--

--------------zDIczh4Pr58hKk1uK807FTWg
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmKwUyEFAwAAAAAACgkQlh/E3EQov+B+
zhAAukdLdPp8pPixUBX+GfWM6NomioHbsADvdlizO/PUErqb9t4+PiQoRtWxeC/Bqz6A3rLBdHHn
qmvfBVPpPJHwWHoi9dKy+tWtBsA3jqw8k+oI0/qMox/CQzLzQ03cijETeCloHv6Fk/mmNCKrumhx
bfYMCowtE3Z2GGGprX6cxhSRvphqU/SbXpNxxsxEJon/RkTwOlx57+OL2jn/M/dpgP5GF1JRV3Vr
NMYtSCI041l1yY3JcP2EDaErqqcrMXfpE5Mw13hb8Y9HrM/1+V2f+xmKbBtnfH/5gwDsh1bTeKFf
geb6neLyr2ijb6pOXJOB1agt8fz2eGaeZ5eqcpRTCU9K4+Qa4mEMIDxLyIKQsDJDW0QH/MZs8MwN
Lv4YMpEMOoi7n8kpxzJqRKiEO44FYtlhhDgMMys67m2BVUM/L+p8mPjuPx0wFaN5TN1mSh+Ksw+E
BkT5MA5KgVspZg2t40B6pyTitcJb+YrLry3aQhxfhjJibkTAcFUFyn9D+54YZLzabbtMxFFbegqH
NJ+Zwx029i5yI4DCaqm9qo4dIqH9Wad0pHkXfsl2QJZjAlb4V+MGZAz2OmrtOx4fkGVy6XnrgUCs
GNb8oGirkAMRIpgUt7ozPiDnigNC/pWym2GbBLO3UPO5tGwSWC599RpbRAmliUHZzNaHI2id3U3I
gV0=
=HnBS
-----END PGP SIGNATURE-----

--------------zDIczh4Pr58hKk1uK807FTWg--
