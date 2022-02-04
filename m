Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2D94AA035
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 20:38:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56C8110EA8F;
	Fri,  4 Feb 2022 19:38:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4145A10EA8F;
 Fri,  4 Feb 2022 19:38:22 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D50E71F37D;
 Fri,  4 Feb 2022 19:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644003500; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2Bj7Crn6RlY1c0S6KTbNxoV/A3V3gu/HAKD3zqn/Tw8=;
 b=Dh6mKxgdnlCtuINYqCNX8hB6sfZKaaPx35FPBANzs7w5eRJbKGBub9M3WWSgWOv+DEBglv
 C17Ubbtxjebu5STSvwoRGKj2EXa05HhqgEWxqSI2dYuOB62+4u7YRJkLwb6fi3i1R100WZ
 F2/KV9mqXFns1C/RnHP8yfYcgG2iR+k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644003500;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2Bj7Crn6RlY1c0S6KTbNxoV/A3V3gu/HAKD3zqn/Tw8=;
 b=9tounWJ5W/tTNZksYOuofzVGqF/wQ61zJGMmo9Oa4li748XcMW6XM7zLzPsTKvqRKgw1uC
 R/DxVwxE9XgvFaAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A6BFF13A91;
 Fri,  4 Feb 2022 19:38:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id zsx3JqyA/WEFDgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 04 Feb 2022 19:38:20 +0000
Message-ID: <c8442395-6cbd-8546-8ff6-64ebf9a479df@suse.de>
Date: Fri, 4 Feb 2022 20:38:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH 1/3] drm: Extract amdgpu_sa.c as a generic
 suballocation helper
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <20220204174809.3366967-1-maarten.lankhorst@linux.intel.com>
 <20220204174809.3366967-2-maarten.lankhorst@linux.intel.com>
 <28be9b4b-dbe1-28fa-e013-570c45a5c705@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <28be9b4b-dbe1-28fa-e013-570c45a5c705@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------psVhXGzqbAqbHPfLlbqOxOMC"
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
Cc: Alex Deucher <alexander.deucher@amd.com>, intel-gfx@lists.freedesktop.org,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------psVhXGzqbAqbHPfLlbqOxOMC
Content-Type: multipart/mixed; boundary="------------mAZ8hn9hSOpb48Mjm0mWsPjd";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 intel-gfx@lists.freedesktop.org, "Pan, Xinhui" <Xinhui.Pan@amd.com>
Message-ID: <c8442395-6cbd-8546-8ff6-64ebf9a479df@suse.de>
Subject: Re: [RFC PATCH 1/3] drm: Extract amdgpu_sa.c as a generic
 suballocation helper
References: <20220204174809.3366967-1-maarten.lankhorst@linux.intel.com>
 <20220204174809.3366967-2-maarten.lankhorst@linux.intel.com>
 <28be9b4b-dbe1-28fa-e013-570c45a5c705@amd.com>
In-Reply-To: <28be9b4b-dbe1-28fa-e013-570c45a5c705@amd.com>

--------------mAZ8hn9hSOpb48Mjm0mWsPjd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDQuMDIuMjIgdW0gMTk6Mjkgc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOg0K
PiBPaCwgdGhhdCdzIG9uIG15IFRPRE8gbGlzdCBmb3IgeWVhcnMhDQo+IA0KPiBBbSAwNC4w
Mi4yMiB1bSAxODo0OCBzY2hyaWViIE1hYXJ0ZW4gTGFua2hvcnN0Og0KPj4gU3ViYWxsb2Nh
dGluZyBhIGJ1ZmZlciBvYmplY3QgaXMgc29tZXRoaW5nIHRoYXQgaXMgbm90IGRyaXZlcg0K
Pj4gZ2VuZXJpYywgYW5kIGlzIHVzZWZ1bCBmb3Igb3RoZXIgZHJpdmVycyBhcyB3ZWxsLg0K
Pj4NCj4+IFNpZ25lZC1vZmYtYnk6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmto
b3JzdEBsaW51eC5pbnRlbC5jb20+DQo+PiAtLS0NCj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9N
YWtlZmlsZcKgwqDCoMKgwqDCoCB8wqDCoCA0ICstDQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0v
ZHJtX3N1YmFsbG9jLmMgfCA0MjQgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
DQo+PiDCoCBpbmNsdWRlL2RybS9kcm1fc3ViYWxsb2MuaMKgwqDCoMKgIHzCoCA3OCArKysr
KysNCj4+IMKgIDMgZmlsZXMgY2hhbmdlZCwgNTA1IGluc2VydGlvbnMoKyksIDEgZGVsZXRp
b24oLSkNCj4+IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vZHJtX3N1
YmFsbG9jLmMNCj4+IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCBpbmNsdWRlL2RybS9kcm1fc3Vi
YWxsb2MuaA0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vTWFrZWZpbGUg
Yi9kcml2ZXJzL2dwdS9kcm0vTWFrZWZpbGUNCj4+IGluZGV4IDg2NzVjMmFmN2FlMS4uYjg0
OGJjZjg3OTBjIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL01ha2VmaWxlDQo+
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vTWFrZWZpbGUNCj4+IEBAIC01Nyw3ICs1Nyw5IEBA
IGRybV9rbXNfaGVscGVyLXkgOj0gZHJtX2JyaWRnZV9jb25uZWN0b3IubyANCj4+IGRybV9j
cnRjX2hlbHBlci5vIFwNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBkcm1fc2NkY19oZWxwZXIu
byBkcm1fZ2VtX2F0b21pY19oZWxwZXIubyBcDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZHJt
X2dlbV9mcmFtZWJ1ZmZlcl9oZWxwZXIubyBcDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZHJt
X2F0b21pY19zdGF0ZV9oZWxwZXIubyBkcm1fZGFtYWdlX2hlbHBlci5vIFwNCj4+IC3CoMKg
wqDCoMKgwqDCoCBkcm1fZm9ybWF0X2hlbHBlci5vIGRybV9zZWxmX3JlZnJlc2hfaGVscGVy
Lm8gZHJtX3JlY3Qubw0KPj4gK8KgwqDCoMKgwqDCoMKgIGRybV9mb3JtYXRfaGVscGVyLm8g
ZHJtX3NlbGZfcmVmcmVzaF9oZWxwZXIubyBkcm1fcmVjdC5vIFwNCj4+ICvCoMKgwqDCoMKg
wqDCoCBkcm1fc3ViYWxsb2Mubw0KPj4gKw0KPiANCj4gSSB0aGluayB3ZSBzaG91bGQgcHV0
IHRoYXQgaW50byBhIHNlcGFyYXRlIG1vZHVsZSBsaWtlIHdlIG5vdyBkbyB3aXRoIA0KPiBv
dGhlciBoZWxwZXJzIGFzIHdlbGwuDQoNClBsZWFzZS4gS01TIGhlbHBlcnMgYXJlIG5vdyBs
aWtlbHkgdG8gYmUgbGlua2VkIGludG8gdGhlIGtlcm5lbCBiaW5hcnkuIA0KSSd2ZSBhbHJl
YWR5IHNwZW50IHRpbWUgdG8gcmVkdWNlIHRoZSBzaXplIG9mIHRoZSBtb2R1bGUuDQoNCkJl
c3QgcmVnYXJkDQpUaG9tYXMNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3Mg
RHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJI
DQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDks
IEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------mAZ8hn9hSOpb48Mjm0mWsPjd--

--------------psVhXGzqbAqbHPfLlbqOxOMC
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmH9gKsFAwAAAAAACgkQlh/E3EQov+CE
UxAAoJ4BV7WXUFzptZE+dhNxNFunrjwiOf1rRaATwf5SAqzyMphecf0igNjSmY/0oQPY+E2SjT54
Wqb9QtCBmq1nWnM+HR65WFyrqs484poJb82EcRCq3szGpWGRWCShnwaeU4pDU8jDzI8aNL12gWVb
w2ay1aFMf1MAqU/G7VCEc+s/IJZj0QxdIWcR9Gb45L30a43l8qrFtZOCmeW0bk+96gpTZACWF+TZ
YWEXeX2xpscARX7TSkJexGj6tZcR0faOuRPfu57ZyJt6jyHIT0qlnH29ghFkGdwaRe3kW+JP+0sr
PUmAHcHDvEx9yChCwITMvM2Su2osEFdDyjBlGL/n+8lLahowJolcjGjo6/CP9nEOS6GwHE3bVpSw
81uOkG3FSkchbbKdHYOmS8ilp50GYvTDM5SnSIGHQiNwUplFiKfM4u2DnXW/oE3HXliKZ3kXbHEI
kAqW13fO4hfrhbWq2T7MVxvTuvLrM7aPCTe9wY7XlYG0ET3m6zIO17FOqjJLHimj5l2o9TkcTQIg
GUCmlzizKPVuWZJtrA5xe2fS9dgzH4GzNOMw+681s+PMX6BkL1HyNcH9a96vBJuVIll3UPRtzrFD
400HJlgcdWA5NfwhDtFGY2WOpb1PcOU1AgbPV7JJifdIc7C9R7H9Kqi317r2dqm9O9V9nDLLQvB7
n2I=
=f0mx
-----END PGP SIGNATURE-----

--------------psVhXGzqbAqbHPfLlbqOxOMC--
