Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C25B6CFC0E
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 08:57:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D862310ECE1;
	Thu, 30 Mar 2023 06:57:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BBEB10ECE1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 06:57:39 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CC6BA1FE83;
 Thu, 30 Mar 2023 06:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680159457; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G5+Kxzby0puIM/dbqQzWO4Oxt4Qe5WmInQNRv2RB9ic=;
 b=Z+vzjjqlspIlyVPpOod3FpO2QL/ATvuJwyWNh7f3ERQwlWGIWg3sFvBH5TOlCfeniEZAXq
 F+b4tVZVpHyyXlbqeJZvaT9q2oYDPfh/4v0h4m81moPPLI1vUKe+Hh0dTir7satNnbMZWp
 Zr2obZbaYzht75Kr0NI5M+xM69jC0UE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680159457;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G5+Kxzby0puIM/dbqQzWO4Oxt4Qe5WmInQNRv2RB9ic=;
 b=ky7CIrrNIqSt7LCSntL4FalRROGKMo0aUIETCTYtr/MXqS9I2aAmy++PYEOOFC/OGrGFHF
 xIO9ifT0yL7VDUBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A38CA1348E;
 Thu, 30 Mar 2023 06:57:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id QqG/JuEyJWQIaAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 30 Mar 2023 06:57:37 +0000
Message-ID: <f42d8ab8-c765-2517-7d25-6ce1dea320e8@suse.de>
Date: Thu, 30 Mar 2023 08:57:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] drm/fbdev-generic: optimize out a redundant assignment
 clause
To: Lucas De Marchi <lucas.demarchi@intel.com>
References: <20230325074636.136833-1-15330273260@189.cn>
 <a3370ae7-8c78-8170-f9c3-7f616a1fa382@suse.de>
 <20230330041726.w7boceq7ljymvfq2@ldmartin-desk2>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230330041726.w7boceq7ljymvfq2@ldmartin-desk2>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------fiFo8dMfyylfmukWFxdSWGG8"
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
Cc: suijingfeng <suijingfeng@loongson.cn>, David Airlie <airlied@linux.ie>,
 liyi <liyi@loongson.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sui Jingfeng <15330273260@189.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------fiFo8dMfyylfmukWFxdSWGG8
Content-Type: multipart/mixed; boundary="------------0Pi7nZHVZaJ5cmqdYGatFk7a";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: suijingfeng <suijingfeng@loongson.cn>, David Airlie <airlied@linux.ie>,
 liyi <liyi@loongson.cn>, linux-kernel@vger.kernel.org,
 Sui Jingfeng <15330273260@189.cn>, dri-devel@lists.freedesktop.org
Message-ID: <f42d8ab8-c765-2517-7d25-6ce1dea320e8@suse.de>
Subject: Re: [PATCH] drm/fbdev-generic: optimize out a redundant assignment
 clause
References: <20230325074636.136833-1-15330273260@189.cn>
 <a3370ae7-8c78-8170-f9c3-7f616a1fa382@suse.de>
 <20230330041726.w7boceq7ljymvfq2@ldmartin-desk2>
In-Reply-To: <20230330041726.w7boceq7ljymvfq2@ldmartin-desk2>

--------------0Pi7nZHVZaJ5cmqdYGatFk7a
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMzAuMDMuMjMgdW0gMDY6MTcgc2NocmllYiBMdWNhcyBEZSBNYXJjaGk6DQo+
IE9uIFdlZCwgTWFyIDI5LCAyMDIzIGF0IDExOjA0OjE3QU0gKzAyMDAsIFRob21hcyBaaW1t
ZXJtYW5uIHdyb3RlOg0KPj4gKGNjJ2luZyBMdWNhcykNCj4+DQo+PiBIaQ0KPj4NCj4+IEFt
IDI1LjAzLjIzIHVtIDA4OjQ2IHNjaHJpZWIgU3VpIEppbmdmZW5nOg0KPj4+IMKgVGhlIGFz
c2lnbm1lbnQgYWxyZWFkeSBkb25lIGluIGRybV9jbGllbnRfYnVmZmVyX3ZtYXAoKSwNCj4+
PiDCoGp1c3QgdHJpdmFsIGNsZWFuLCBubyBmdW5jdGlvbmFsIGNoYW5nZS4NCj4+Pg0KPj4+
IFNpZ25lZC1vZmYtYnk6IFN1aSBKaW5nZmVuZyA8MTUzMzAyNzMyNjBAMTg5LmNuPg0KPj4+
IC0tLQ0KPj4+IMKgZHJpdmVycy9ncHUvZHJtL2RybV9mYmRldl9nZW5lcmljLmMgfCA1ICsr
LS0tDQo+Pj4gwqAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQ0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJkZXZf
Z2VuZXJpYy5jIA0KPj4+IGIvZHJpdmVycy9ncHUvZHJtL2RybV9mYmRldl9nZW5lcmljLmMN
Cj4+PiBpbmRleCA0ZDYzMjVlOTE1NjUuLjFkYTQ4ZTcxYzdmMSAxMDA2NDQNCj4+PiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiZGV2X2dlbmVyaWMuYw0KPj4+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9kcm1fZmJkZXZfZ2VuZXJpYy5jDQo+Pj4gQEAgLTI4Miw3ICsyODIsNyBA
QCBzdGF0aWMgaW50IGRybV9mYmRldl9kYW1hZ2VfYmxpdChzdHJ1Y3QgDQo+Pj4gZHJtX2Zi
X2hlbHBlciAqZmJfaGVscGVyLA0KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgc3RydWN0IGRybV9jbGlwX3JlY3QgKmNsaXApDQo+Pj4gwqB7DQo+Pj4gwqDCoMKg
wqAgc3RydWN0IGRybV9jbGllbnRfYnVmZmVyICpidWZmZXIgPSBmYl9oZWxwZXItPmJ1ZmZl
cjsNCj4+PiAtwqDCoMKgIHN0cnVjdCBpb3N5c19tYXAgbWFwLCBkc3Q7DQo+Pj4gK8KgwqDC
oCBzdHJ1Y3QgaW9zeXNfbWFwIG1hcDsNCj4+PiDCoMKgwqDCoCBpbnQgcmV0Ow0KPj4+IMKg
wqDCoMKgIC8qDQo+Pj4gQEAgLTMwMiw4ICszMDIsNyBAQCBzdGF0aWMgaW50IGRybV9mYmRl
dl9kYW1hZ2VfYmxpdChzdHJ1Y3QgDQo+Pj4gZHJtX2ZiX2hlbHBlciAqZmJfaGVscGVyLA0K
Pj4+IMKgwqDCoMKgIGlmIChyZXQpDQo+Pj4gwqDCoMKgwqDCoMKgwqDCoCBnb3RvIG91dDsN
Cj4+PiAtwqDCoMKgIGRzdCA9IG1hcDsNCj4+PiAtwqDCoMKgIGRybV9mYmRldl9kYW1hZ2Vf
YmxpdF9yZWFsKGZiX2hlbHBlciwgY2xpcCwgJmRzdCk7DQo+Pj4gK8KgwqDCoCBkcm1fZmJk
ZXZfZGFtYWdlX2JsaXRfcmVhbChmYl9oZWxwZXIsIGNsaXAsICZtYXApOw0KPj4NCj4+IEkg
c2VlIHdoYXQgeW91J3JlIGRvaW5nIGFuZCBpdCdzIHByb2JhYmx5IGNvcnJlY3QgaW4gdGhp
cyBjYXNlLg0KPj4NCj4+IEJ1dCB0aGVyZSdzIGEgbGFyZ2VyIGlzc3VlIHdpdGggdGhpcyBp
b3N5cyBpbnRlcmZhY2VzLiBTb21ldGltZXMgdGhlIA0KPj4gYWRkcmVzcyBoYXMgdG8gYmUg
bW9kaWZpZWQgKHNlZSBjYWxscyBvZiBpb3N5c19tYXBfaW5jcigpKS4gVGhhdCBjYW4gDQo+
PiBwcmV2ZW50IGluY29ycmVjdCB1c2VzIG9mIHRoZSBtYXBwaW5nIGluIG90aGVyIHBsYWNl
cywgZXNwZWNpYWxseSBpbiANCj4+IHVubWFwIGNvZGUuDQo+IA0KPiB1c2luZyBhIGluaXRp
YWxpemVyIGZvciB0aGUgY2FzZXMgaXQncyBuZWVkZWQgSU1PIHdvdWxkIG1ha2UgdGhlc2Ug
a2luZA0KPiBvZiBwcm9ibGVtcyBnbyBhd2F5LCBiZWNhdXNlIHRoZW4gdGhlIGludGVudCBp
cyBleHBsaWNpdA0KPiANCj4+DQo+PiBJIHRoaW5rIGl0IHdvdWxkIG1ha2Ugc2Vuc2UgdG8g
Y29uc2lkZXIgYSBzZXBhcmF0ZSBzdHJ1Y3R1cmUgZm9yIHRoZSANCj4+IEkvTyBsb2NhdGlv
bi4gVGhlIGJ1ZmZlciBhcyBhIHdob2xlIHdvdWxkIHN0aWxsIGJlIHJlcHJlc2VudGVkIGJ5
IA0KPj4gc3RydWN0IGlvc3lzX21hcC7CoCBBbmQgdGhhdCBuZXcgc3RydWN0dXJlLCBsZXQn
cyBjYWxsIGl0IHN0cnVjdCANCj4+IGlvc3lzX3B0ciwgd291bGQgcG9pbnQgdG8gYW4gYWN0
dWFsIGxvY2F0aW9uIHdpdGhpbiB0aGUgYnVmZmVyJ3MNCj4gDQo+IHNvdW5kcyBmaW5lIHRv
IG1lLCBidXQgSSdkIGhhdmUgdG8gdGFrZSBhIGRlZXBlciBsb29rIGxhdGVyIChvciB3aGVu
DQo+IHNvbWVvbmUgd3JpdGVzIHRoZSBwYXRjaCkuwqAgSXQgc2VlbXMgd2UnZCByZXBsaWNh
dGUgYWxtb3N0IHRoZSBlbnRpcmUNCj4gQVBJIHRvIGp1c3QgYWNjb21vZGF0ZSB0aGUgMiBz
dHJ1Y3RzLsKgIEFuZCB0aGUgZGlmZmVyZW50IHR5cGVzIHdpbGwgbGVhZA0KPiB0byBjb25m
dXNpb24gd2hlbiBvbmUgb3IgdGhlIG90aGVyIHNob3VsZCBiZSB1c2VkDQoNCkkgdGhpbmsg
d2UgY2FuIHNwbGl0IHRoZSBjdXJyZW50IGludGVyZmFjZSBvbnRvIHR3byBjYXRlZ29yaWVz
OiBtYXBwaW5nIA0KYW5kIEkvTy4gVGhlIGZvcm1lciB3b3VsZCB1c2UgaW9zeXNfbWFwIGFu
ZCB0aGUgbGF0dGVyIHdvdWxkIHVzZSANCmlvc3lzX3B0ci4gQW5kIHdlJ2QgbmVlZCBhIGhl
bHBlciB0aGF0IHR1cm5zIGdldHMgYSBwdHIgZm9yIGEgZ2l2ZW4gbWFwLg0KDQpJZiBJIGZp
bmQgdGhlIHRpbmUsIEknbGwgcHJvYmFibHkgdHlwZSB1cCBhIHBhdGNoLg0KDQpCZXN0IHJl
Z2FyZHMNClRob21hcw0KDQo+IA0KPiB0aGFua3MNCj4gTHVjYXMgRGUgTWFyY2hpDQo+IA0K
Pj4gbWVtb3J5IHJhbmdlLiBBIGZldyBsb2NhdGlvbnMgYW5kIGhlbHBlcnMgd291bGQgbmVl
ZCBjaGFuZ2VzLCBidXQgDQo+PiB0aGVyZSBhcmUgbm90IHNvIG1hbnkgY2FsbGVycyB0aGF0
IGl0J3MgYW4gaXNzdWUuwqAgVGhpcyB3b3VsZCBhbHNvIA0KPj4gYWxsb3cgZm9yIGEgZmV3
IGRlYnVnZ2luZyB0ZXN0cyB0aGF0IGVuc3VyZSB0aGF0IGlvc3lzX3B0ciBhbHdheXMgDQo+
PiBvcGVyYXRlcyB3aXRoaW4gdGhlIGJvdW5kcyBvZiBhbiBpb3N5c19tYXAuDQo+Pg0KPj4g
SSd2ZSBsb25nIGNvbnNpZGVyZWQgdGhpcyBpZGVhLCBidXQgdGhlcmUgd2FzIG5vIHByZXNz
dXJlIHRvIHdvcmsgb24gDQo+PiBpdC4gTWF5YmUgbm93Lg0KPj4NCj4+IEJlc3QgcmVnYXJk
cw0KPj4gVGhvbWFzDQo+Pg0KPj4+IMKgwqDCoMKgIGRybV9jbGllbnRfYnVmZmVyX3Z1bm1h
cChidWZmZXIpOw0KPj4NCj4+IC0tIA0KPj4gVGhvbWFzIFppbW1lcm1hbm4NCj4+IEdyYXBo
aWNzIERyaXZlciBEZXZlbG9wZXINCj4+IFNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1h
bnkgR21iSA0KPj4gTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQo+
PiAoSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQo+PiBHZXNjaMOkZnRzZsO8aHJlcjogSXZv
IFRvdGV2DQo+IA0KPiANCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNz
IERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21i
SA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5
LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------0Pi7nZHVZaJ5cmqdYGatFk7a--

--------------fiFo8dMfyylfmukWFxdSWGG8
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQlMuAFAwAAAAAACgkQlh/E3EQov+Dl
mQ//YD3vlvxHTZTdL524MRFo5PEImEmK7jRpLsb3mkPWG+Bv9LUh9qeN4ljw7nbbwHzdv3gcyD4K
BA56T7HsqzWFA1M1vMg3LXIjXHGjK1F7WeEbLJRo1DJjTzyM3pB/eLE+UjiezUN2QNoIzMTFuH8I
X3Fa0IpmfuHjo/IQaSF1mGCCjm2oGGv8nc0uQd8s9o6Q4m/00wbldHT4mBn27ocw3iAZb0p0Zhji
5azUJQCC5ZeEIUJhN3G2twATjDedRqAm+WMD9uJT4De+Ezg4gadAoxfcz27+mAZwhYvAtN/YiYrb
IcRvAAg7f1pjrYmDPd4odAiMjymW3vt35SroCVHZzu5f5BrTh2l8ulqm42Up5cdR8IPc+hoX29GS
31FjezQUmVCMv2TmGJHvtFkRzZPjyLoS+TSwCL4fZHh6eGU1ahSUrNLFqNgqNhos/gEZPm9KQ7XY
fQvbScIMSUVgMOwC4ckkfgAMHpRKO+jrFAW01NBlDUSFXo1WiZthjp61bQv/iQcreZjjcztBa9Ln
pVeP1NQDd2oZWbnhvi3Tlkqf2xLmusY11zDyjEPXMhl3IH8MxOsd8Z4XxHPCvkTV6qoEpGYKp3go
rGd+Wy/8bYE40M/u4cjmAMyEmQtEhI3GuDD+u/q/xTVN3bTeO7/Qq+yQSO+2b+uJ6h2riTPjKX7T
olI=
=gRsq
-----END PGP SIGNATURE-----

--------------fiFo8dMfyylfmukWFxdSWGG8--
