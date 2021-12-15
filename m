Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE54475B8D
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 16:13:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B09A10EB41;
	Wed, 15 Dec 2021 15:13:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E26710EB41
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 15:13:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2A7EF212CB;
 Wed, 15 Dec 2021 15:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1639581200; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KNdWYnKUfDxRjp5zSsA1Qvi7vON846H9arOA9Xd0UzM=;
 b=1XXx/fS90VWJQ2uxPDXtn+yWRqLxwjEjtbtsh+fjsz6zaSE148KwhIBNfxK4lNQDy7nHjc
 PGZDhBC7O1fT8YJEfNljd5gE0xBnxeswu1de/CkjymT0WZY9plY/4LjsDvxYHG2CAAqlhQ
 S3HzhA2ko3wIQ00Nn1bZN77HR2XxSvo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1639581200;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KNdWYnKUfDxRjp5zSsA1Qvi7vON846H9arOA9Xd0UzM=;
 b=w72KA2YuXM01Js6pn2+u1ABcj8LItw8ZDDkm05pAfL7uyF5rLKv3bKzoDqiyG0cFVqtOr9
 oQ/7UGcUcgKdDQAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E0EC41330B;
 Wed, 15 Dec 2021 15:13:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id MapKNQ8GumF8fgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 15 Dec 2021 15:13:19 +0000
Message-ID: <ecbe0476-2fda-d5d8-d6f1-073b4ab9a180@suse.de>
Date: Wed, 15 Dec 2021 16:13:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v4 3/3] drm/vc4: plane: Add support for YUV color
 encodings and ranges
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20211215091739.135042-1-maxime@cerno.tech>
 <20211215091739.135042-4-maxime@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20211215091739.135042-4-maxime@cerno.tech>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------G0SRIHiK8i37o8rwbQ67Wxpe"
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>, dri-devel@lists.freedesktop.org,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------G0SRIHiK8i37o8rwbQ67Wxpe
Content-Type: multipart/mixed; boundary="------------PryQuC80nHc2cYhNX3XQa2OZ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, Dom Cobley <dom@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Message-ID: <ecbe0476-2fda-d5d8-d6f1-073b4ab9a180@suse.de>
Subject: Re: [PATCH v4 3/3] drm/vc4: plane: Add support for YUV color
 encodings and ranges
References: <20211215091739.135042-1-maxime@cerno.tech>
 <20211215091739.135042-4-maxime@cerno.tech>
In-Reply-To: <20211215091739.135042-4-maxime@cerno.tech>

--------------PryQuC80nHc2cYhNX3XQa2OZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTUuMTIuMjEgdW0gMTA6MTcgc2NocmllYiBNYXhpbWUgUmlwYXJkOg0KPiBG
cm9tOiBEYXZlIFN0ZXZlbnNvbiA8ZGF2ZS5zdGV2ZW5zb25AcmFzcGJlcnJ5cGkuY29tPg0K
PiANCj4gVGhlIEJUNjAxL0JUNzA5IGNvbG9yIGVuY29kaW5nIGFuZCBsaW1pdGVkIHZzIGZ1
bGwNCj4gcmFuZ2UgcHJvcGVydGllcyB3ZXJlIG5vdCBiZWluZyBleHBvc2VkLCBkZWZhdWx0
aW5nDQo+IGFsd2F5cyB0byBCVDYwMSBsaW1pdGVkIHJhbmdlLg0KPiANCj4gRXhwb3NlIHRo
ZSBwYXJhbWV0ZXJzIGFuZCBzZXQgdGhlIHJlZ2lzdGVycyBhcHByb3ByaWF0ZWx5Lg0KPiAN
Cj4gU2lnbmVkLW9mZi1ieTogRGF2ZSBTdGV2ZW5zb24gPGRhdmUuc3RldmVuc29uQHJhc3Bi
ZXJyeXBpLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogTWF4aW1lIFJpcGFyZCA8bWF4aW1lQGNl
cm5vLnRlY2g+DQoNCkFja2VkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5A
c3VzZS5kZT4NCg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9wbGFuZS5j
IHwgNzEgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tDQo+ICAgZHJpdmVycy9n
cHUvZHJtL3ZjNC92YzRfcmVncy5oICB8IDE5ICsrKysrKy0tLQ0KPiAgIDIgZmlsZXMgY2hh
bmdlZCwgODIgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9wbGFuZS5jIGIvZHJpdmVycy9ncHUvZHJt
L3ZjNC92YzRfcGxhbmUuYw0KPiBpbmRleCAwMjJjZDEyZjU2MWUuLjkyMGE5ZWVmZTQyNiAx
MDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfcGxhbmUuYw0KPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9wbGFuZS5jDQo+IEBAIC02MjMsNiArNjIzLDUx
IEBAIHN0YXRpYyBpbnQgdmM0X3BsYW5lX2FsbG9jYXRlX2xibShzdHJ1Y3QgZHJtX3BsYW5l
X3N0YXRlICpzdGF0ZSkNCj4gICAJcmV0dXJuIDA7DQo+ICAgfQ0KPiAgIA0KPiArLyoNCj4g
KyAqIFRoZSBjb2xvcnNwYWNlIGNvbnZlcnNpb24gbWF0cmljZXMgYXJlIGhlbGQgaW4gMyBl
bnRyaWVzIGluIHRoZSBkbGlzdC4NCj4gKyAqIENyZWF0ZSBhbiBhcnJheSBvZiB0aGVtLCB3
aXRoIGVudHJpZXMgZm9yIGVhY2ggZnVsbCBhbmQgbGltaXRlZCBtb2RlLCBhbmQNCj4gKyAq
IGVhY2ggc3VwcG9ydGVkIGNvbG9yc3BhY2UuDQo+ICsgKi8NCj4gK3N0YXRpYyBjb25zdCB1
MzIgY29sb3JzcGFjZV9jb2VmZnNbMl1bRFJNX0NPTE9SX0VOQ09ESU5HX01BWF1bM10gPSB7
DQo+ICsJew0KPiArCQkvKiBMaW1pdGVkIHJhbmdlICovDQo+ICsJCXsNCj4gKwkJCS8qIEJU
NjAxICovDQo+ICsJCQlTQ0FMRVJfQ1NDMF9JVFJfUl82MDFfNSwNCj4gKwkJCVNDQUxFUl9D
U0MxX0lUUl9SXzYwMV81LA0KPiArCQkJU0NBTEVSX0NTQzJfSVRSX1JfNjAxXzUsDQo+ICsJ
CX0sIHsNCj4gKwkJCS8qIEJUNzA5ICovDQo+ICsJCQlTQ0FMRVJfQ1NDMF9JVFJfUl83MDlf
MywNCj4gKwkJCVNDQUxFUl9DU0MxX0lUUl9SXzcwOV8zLA0KPiArCQkJU0NBTEVSX0NTQzJf
SVRSX1JfNzA5XzMsDQo+ICsJCX0sIHsNCj4gKwkJCS8qIEJUMjAyMCAqLw0KPiArCQkJU0NB
TEVSX0NTQzBfSVRSX1JfMjAyMCwNCj4gKwkJCVNDQUxFUl9DU0MxX0lUUl9SXzIwMjAsDQo+
ICsJCQlTQ0FMRVJfQ1NDMl9JVFJfUl8yMDIwLA0KPiArCQl9DQo+ICsJfSwgew0KPiArCQkv
KiBGdWxsIHJhbmdlICovDQo+ICsJCXsNCj4gKwkJCS8qIEpGSUYgKi8NCj4gKwkJCVNDQUxF
Ul9DU0MwX0pQRUdfSkZJRiwNCj4gKwkJCVNDQUxFUl9DU0MxX0pQRUdfSkZJRiwNCj4gKwkJ
CVNDQUxFUl9DU0MyX0pQRUdfSkZJRiwNCj4gKwkJfSwgew0KPiArCQkJLyogQlQ3MDkgKi8N
Cj4gKwkJCVNDQUxFUl9DU0MwX0lUUl9SXzcwOV8zX0ZSLA0KPiArCQkJU0NBTEVSX0NTQzFf
SVRSX1JfNzA5XzNfRlIsDQo+ICsJCQlTQ0FMRVJfQ1NDMl9JVFJfUl83MDlfM19GUiwNCj4g
KwkJfSwgew0KPiArCQkJLyogQlQyMDIwICovDQo+ICsJCQlTQ0FMRVJfQ1NDMF9JVFJfUl8y
MDIwX0ZSLA0KPiArCQkJU0NBTEVSX0NTQzFfSVRSX1JfMjAyMF9GUiwNCj4gKwkJCVNDQUxF
Ul9DU0MyX0lUUl9SXzIwMjBfRlIsDQo+ICsJCX0NCj4gKwl9DQo+ICt9Ow0KPiArDQo+ICAg
LyogV3JpdGVzIG91dCBhIGZ1bGwgZGlzcGxheSBsaXN0IGZvciBhbiBhY3RpdmUgcGxhbmUg
dG8gdGhlIHBsYW5lJ3MNCj4gICAgKiBwcml2YXRlIGRsaXN0IHN0YXRlLg0KPiAgICAqLw0K
PiBAQCAtMTAxNyw5ICsxMDYyLDIwIEBAIHN0YXRpYyBpbnQgdmM0X3BsYW5lX21vZGVfc2V0
KHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lLA0KPiAgIA0KPiAgIAkvKiBDb2xvcnNwYWNlIGNv
bnZlcnNpb24gd29yZHMgKi8NCj4gICAJaWYgKHZjNF9zdGF0ZS0+aXNfeXV2KSB7DQo+IC0J
CXZjNF9kbGlzdF93cml0ZSh2YzRfc3RhdGUsIFNDQUxFUl9DU0MwX0lUUl9SXzYwMV81KTsN
Cj4gLQkJdmM0X2RsaXN0X3dyaXRlKHZjNF9zdGF0ZSwgU0NBTEVSX0NTQzFfSVRSX1JfNjAx
XzUpOw0KPiAtCQl2YzRfZGxpc3Rfd3JpdGUodmM0X3N0YXRlLCBTQ0FMRVJfQ1NDMl9JVFJf
Ul82MDFfNSk7DQo+ICsJCWVudW0gZHJtX2NvbG9yX2VuY29kaW5nIGNvbG9yX2VuY29kaW5n
ID0gc3RhdGUtPmNvbG9yX2VuY29kaW5nOw0KPiArCQllbnVtIGRybV9jb2xvcl9yYW5nZSBj
b2xvcl9yYW5nZSA9IHN0YXRlLT5jb2xvcl9yYW5nZTsNCj4gKwkJY29uc3QgdTMyICpjY207
DQo+ICsNCj4gKwkJaWYgKGNvbG9yX2VuY29kaW5nID49IERSTV9DT0xPUl9FTkNPRElOR19N
QVgpDQo+ICsJCQljb2xvcl9lbmNvZGluZyA9IERSTV9DT0xPUl9ZQ0JDUl9CVDYwMTsNCj4g
KwkJaWYgKGNvbG9yX3JhbmdlID49IERSTV9DT0xPUl9SQU5HRV9NQVgpDQo+ICsJCQljb2xv
cl9yYW5nZSA9IERSTV9DT0xPUl9ZQ0JDUl9MSU1JVEVEX1JBTkdFOw0KPiArDQo+ICsJCWNj
bSA9IGNvbG9yc3BhY2VfY29lZmZzW2NvbG9yX3JhbmdlXVtjb2xvcl9lbmNvZGluZ107DQo+
ICsNCj4gKwkJdmM0X2RsaXN0X3dyaXRlKHZjNF9zdGF0ZSwgY2NtWzBdKTsNCj4gKwkJdmM0
X2RsaXN0X3dyaXRlKHZjNF9zdGF0ZSwgY2NtWzFdKTsNCj4gKwkJdmM0X2RsaXN0X3dyaXRl
KHZjNF9zdGF0ZSwgY2NtWzJdKTsNCj4gICAJfQ0KPiAgIA0KPiAgIAl2YzRfc3RhdGUtPmxi
bV9vZmZzZXQgPSAwOw0KPiBAQCAtMTQ0OCw2ICsxNTA0LDE1IEBAIHN0cnVjdCBkcm1fcGxh
bmUgKnZjNF9wbGFuZV9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsDQo+ICAgCQkJCQkg
ICBEUk1fTU9ERV9SRUZMRUNUX1ggfA0KPiAgIAkJCQkJICAgRFJNX01PREVfUkVGTEVDVF9Z
KTsNCj4gICANCj4gKwlkcm1fcGxhbmVfY3JlYXRlX2NvbG9yX3Byb3BlcnRpZXMocGxhbmUs
DQo+ICsJCQkJCSAgQklUKERSTV9DT0xPUl9ZQ0JDUl9CVDYwMSkgfA0KPiArCQkJCQkgIEJJ
VChEUk1fQ09MT1JfWUNCQ1JfQlQ3MDkpIHwNCj4gKwkJCQkJICBCSVQoRFJNX0NPTE9SX1lD
QkNSX0JUMjAyMCksDQo+ICsJCQkJCSAgQklUKERSTV9DT0xPUl9ZQ0JDUl9MSU1JVEVEX1JB
TkdFKSB8DQo+ICsJCQkJCSAgQklUKERSTV9DT0xPUl9ZQ0JDUl9GVUxMX1JBTkdFKSwNCj4g
KwkJCQkJICBEUk1fQ09MT1JfWUNCQ1JfQlQ3MDksDQo+ICsJCQkJCSAgRFJNX0NPTE9SX1lD
QkNSX0xJTUlURURfUkFOR0UpOw0KPiArDQo+ICAgCXJldHVybiBwbGFuZTsNCj4gICB9DQo+
ICAgDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9yZWdzLmggYi9k
cml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9yZWdzLmgNCj4gaW5kZXggNDg5ZjkyMWVmNDRkLi43
NTM4Yjg0YTZkY2EgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X3Jl
Z3MuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9yZWdzLmgNCj4gQEAgLTk3
NSw3ICs5NzUsMTAgQEAgZW51bSBodnNfcGl4ZWxfZm9ybWF0IHsNCj4gICAjZGVmaW5lIFND
QUxFUl9DU0MwX0NPRUZfQ1JfT0ZTX1NISUZUCQkwDQo+ICAgI2RlZmluZSBTQ0FMRVJfQ1ND
MF9JVFJfUl82MDFfNQkJCTB4MDBmMDAwMDANCj4gICAjZGVmaW5lIFNDQUxFUl9DU0MwX0lU
Ul9SXzcwOV8zCQkJMHgwMGYwMDAwMA0KPiArI2RlZmluZSBTQ0FMRVJfQ1NDMF9JVFJfUl8y
MDIwCQkJMHgwMGYwMDAwMA0KPiAgICNkZWZpbmUgU0NBTEVSX0NTQzBfSlBFR19KRklGCQkJ
MHgwMDAwMDAwMA0KPiArI2RlZmluZSBTQ0FMRVJfQ1NDMF9JVFJfUl83MDlfM19GUgkJMHgw
MDAwMDAwMA0KPiArI2RlZmluZSBTQ0FMRVJfQ1NDMF9JVFJfUl8yMDIwX0ZSCQkweDAwMDAw
MDAwDQo+ICAgDQo+ICAgLyogUzIuOCBjb250cmlidXRpb24gb2YgQ2IgdG8gR3JlZW4gKi8N
Cj4gICAjZGVmaW5lIFNDQUxFUl9DU0MxX0NPRUZfQ0JfR1JOX01BU0sJCVZDNF9NQVNLKDMx
LCAyMikNCj4gQEAgLTk5MCw4ICs5OTMsMTEgQEAgZW51bSBodnNfcGl4ZWxfZm9ybWF0IHsN
Cj4gICAjZGVmaW5lIFNDQUxFUl9DU0MxX0NPRUZfQ1JfQkxVX01BU0sJCVZDNF9NQVNLKDEs
IDApDQo+ICAgI2RlZmluZSBTQ0FMRVJfQ1NDMV9DT0VGX0NSX0JMVV9TSElGVAkJMA0KPiAg
ICNkZWZpbmUgU0NBTEVSX0NTQzFfSVRSX1JfNjAxXzUJCQkweGU3MzMwNGE4DQo+IC0jZGVm
aW5lIFNDQUxFUl9DU0MxX0lUUl9SXzcwOV8zCQkJMHhmMmI3ODRhOA0KPiAtI2RlZmluZSBT
Q0FMRVJfQ1NDMV9KUEVHX0pGSUYJCQkweGVhMzRhNDAwDQo+ICsjZGVmaW5lIFNDQUxFUl9D
U0MxX0lUUl9SXzcwOV8zCQkJMHhmMjc3ODRhOA0KPiArI2RlZmluZSBTQ0FMRVJfQ1NDMV9J
VFJfUl8yMDIwCQkJMHhmNDM1OTRhOA0KPiArI2RlZmluZSBTQ0FMRVJfQ1NDMV9KUEVHX0pG
SUYJCQkweGVhMzQ5NDAwDQo+ICsjZGVmaW5lIFNDQUxFUl9DU0MxX0lUUl9SXzcwOV8zX0ZS
CQkweGY0Mzg4NDAwDQo+ICsjZGVmaW5lIFNDQUxFUl9DU0MxX0lUUl9SXzIwMjBfRlIJCTB4
ZjViNmQ0MDANCj4gICANCj4gICAvKiBTMi44IGNvbnRyaWJ1dGlvbiBvZiBDYiB0byBSZWQg
Ki8NCj4gICAjZGVmaW5lIFNDQUxFUl9DU0MyX0NPRUZfQ0JfUkVEX01BU0sJCVZDNF9NQVNL
KDI5LCAyMCkNCj4gQEAgLTEwMDIsOSArMTAwOCwxMiBAQCBlbnVtIGh2c19waXhlbF9mb3Jt
YXQgew0KPiAgIC8qIFMyLjggY29udHJpYnV0aW9uIG9mIENiIHRvIEJsdWUgKi8NCj4gICAj
ZGVmaW5lIFNDQUxFUl9DU0MyX0NPRUZfQ0JfQkxVX01BU0sJCVZDNF9NQVNLKDE5LCAxMCkN
Cj4gICAjZGVmaW5lIFNDQUxFUl9DU0MyX0NPRUZfQ0JfQkxVX1NISUZUCQkxMA0KPiAtI2Rl
ZmluZSBTQ0FMRVJfQ1NDMl9JVFJfUl82MDFfNQkJCTB4MDAwNjYyMDQNCj4gLSNkZWZpbmUg
U0NBTEVSX0NTQzJfSVRSX1JfNzA5XzMJCQkweDAwMDcyYTFjDQo+IC0jZGVmaW5lIFNDQUxF
Ul9DU0MyX0pQRUdfSkZJRgkJCTB4MDAwNTk5YzUNCj4gKyNkZWZpbmUgU0NBTEVSX0NTQzJf
SVRSX1JfNjAxXzUJCQkweDAwMDY2NjA0DQo+ICsjZGVmaW5lIFNDQUxFUl9DU0MyX0lUUl9S
XzcwOV8zCQkJMHgwMDA3MmUxZA0KPiArI2RlZmluZSBTQ0FMRVJfQ1NDMl9JVFJfUl8yMDIw
CQkJMHgwMDA2YjYyNA0KPiArI2RlZmluZSBTQ0FMRVJfQ1NDMl9KUEVHX0pGSUYJCQkweDAw
MDU5ZGM2DQo+ICsjZGVmaW5lIFNDQUxFUl9DU0MyX0lUUl9SXzcwOV8zX0ZSCQkweDAwMDY0
ZGRiDQo+ICsjZGVmaW5lIFNDQUxFUl9DU0MyX0lUUl9SXzIwMjBfRlIJCTB4MDAwNWU1ZTIN
Cj4gICANCj4gICAjZGVmaW5lIFNDQUxFUl9UUFowX1ZFUlRfUkVDQUxDCQkJQklUKDMxKQ0K
PiAgICNkZWZpbmUgU0NBTEVSX1RQWjBfU0NBTEVfTUFTSwkJCVZDNF9NQVNLKDI4LCA4KQ0K
PiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Bl
cg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1
LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykN
Ckdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------PryQuC80nHc2cYhNX3XQa2OZ--

--------------G0SRIHiK8i37o8rwbQ67Wxpe
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmG6Bg8FAwAAAAAACgkQlh/E3EQov+Ai
uxAAsop062dQiM7nng8CpzlAffCXeci7PWdGaTTaOzyaU+pUaht/OpnrwZdXu0II7Ol4C3SWZts3
5GzIMJw8mJXO9ya2lYhhYu7jPsR0xp6g0e5bZ/WUj8X+t+0muyTI+ZsMLAU83vOxF3QGqQKrx4Cw
Qb3o9k33G6co/xESoTq+siZVV0DhGWhd/21IIau78ar/DQ58IU0WTmP29uJshUUJh/bRyk8/Yq7z
FDteJM9rVOPfhYludUZCNuEo/Balw3MKbLuUn69mofOC3hl7vWHeyprhAJBbf2tlK6xhcO4vuyic
JjwC9TsPx18HGgq378SUT8RijGALm2C8yARTyh8B4eXcmZ/+xVHx6PRTvXFNwjgjWXnk0DCf27fT
mmdVUGtQhAnCF89MzuZt+GWLT4YVJ764QvxUXqvForZH/26kR2k0yjp5WAldPt0fdxv+dww86l5n
mK+0LxhGQbb2Df3q4MWG5qA1yrHeuBc6wjIsxq7dFQUnBtPGdZ4Aan+ILEmPnOHSu0UULOo+6bwi
MPsyjnOF9Nr3kO+vj4qof5TLsy675EaRDTPh3QnBr0RA4YvlJCvnHiou0Jts03WBEKqUpIeSD7Ys
cWFoMzP+BFlobKS5l2unNGYjJ8UL1kqOLnT8aRFL9SJtJNqyBiEgLBfpaxWhX5X9Q5qz/cTG2xKF
pWk=
=DY8D
-----END PGP SIGNATURE-----

--------------G0SRIHiK8i37o8rwbQ67Wxpe--
