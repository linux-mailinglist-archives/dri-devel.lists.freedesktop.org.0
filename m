Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8174325F2
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 20:06:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF2466EE4D;
	Mon, 18 Oct 2021 18:06:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E24646EA90
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 18:06:18 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 38CC821964;
 Mon, 18 Oct 2021 18:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1634580377; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k3tXtcrOOk1/1GSr2iHx/guAlnUXQkKatzVDAr9ETbE=;
 b=vaeTpOzgqDC893a+IwyqZxtN+f6OxoIGAtDLWGU9cLNfcljID7/+zE1BpOdI2iV0xuoLBH
 0usXCtAH2nz/ZSoaKs9fD6g/zNEr4251sHHyQVpZaSm0AonZqbqm8KdjFWC0B0vWxNMkE7
 zXVQyquBjiCOzRpX/o/56naTnY5yAQ8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1634580377;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k3tXtcrOOk1/1GSr2iHx/guAlnUXQkKatzVDAr9ETbE=;
 b=WGa7Pfi5btFfapgPPMCpAyw5i/xNnQFStjOsZxWe+iwO6EXDczxt+ddrmr4NdnQ8GeNRu6
 2LqHy2Gu0r0Yz5Aw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E8FFC140D7;
 Mon, 18 Oct 2021 18:06:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kBJhN5i3bWHFYQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 18 Oct 2021 18:06:16 +0000
Message-ID: <9dbd2c55-2c29-eb12-94d0-dbd5110c302e@suse.de>
Date: Mon, 18 Oct 2021 20:06:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 5/6] drm: vkms: Prepare `vkms_wb_encoder_atomic_check` to
 accept multiple formats
Content-Language: en-US
To: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>,
 rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com
Cc: hamohammed.sa@gmail.com, daniel@ffwll.ch, airlied@linux.ie,
 contact@emersion.fr, leandro.ribeiro@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lkcamp@lists.libreplanetbr.org
References: <20211005201637.58563-1-igormtorrente@gmail.com>
 <20211005201637.58563-6-igormtorrente@gmail.com>
 <5507450a-eb69-b24c-9f43-a1780dafbfa9@suse.de>
 <e9cbdad7-416a-65fe-eb50-1cbb42a01e7b@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <e9cbdad7-416a-65fe-eb50-1cbb42a01e7b@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------pN50UmLDJDaiRIt9ToxFfOeU"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------pN50UmLDJDaiRIt9ToxFfOeU
Content-Type: multipart/mixed; boundary="------------B7zP4m6oNKaDCLdxeNHJnKyf";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Igor Matheus Andrade Torrente <igormtorrente@gmail.com>,
 rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com
Cc: hamohammed.sa@gmail.com, daniel@ffwll.ch, airlied@linux.ie,
 contact@emersion.fr, leandro.ribeiro@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lkcamp@lists.libreplanetbr.org
Message-ID: <9dbd2c55-2c29-eb12-94d0-dbd5110c302e@suse.de>
Subject: Re: [PATCH 5/6] drm: vkms: Prepare `vkms_wb_encoder_atomic_check` to
 accept multiple formats
References: <20211005201637.58563-1-igormtorrente@gmail.com>
 <20211005201637.58563-6-igormtorrente@gmail.com>
 <5507450a-eb69-b24c-9f43-a1780dafbfa9@suse.de>
 <e9cbdad7-416a-65fe-eb50-1cbb42a01e7b@gmail.com>
In-Reply-To: <e9cbdad7-416a-65fe-eb50-1cbb42a01e7b@gmail.com>

--------------B7zP4m6oNKaDCLdxeNHJnKyf
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTguMTAuMjEgdW0gMTk6NDEgc2NocmllYiBJZ29yIE1hdGhldXMgQW5kcmFk
ZSBUb3JyZW50ZToNCj4gSGVsbG8sDQo+IA0KPiBPbiAxMC8xOC8yMSA3OjE0IEFNLCBUaG9t
YXMgWmltbWVybWFubiB3cm90ZToNCj4+IEhpDQo+Pg0KPj4gQW0gMDUuMTAuMjEgdW0gMjI6
MTYgc2NocmllYiBJZ29yIE1hdGhldXMgQW5kcmFkZSBUb3JyZW50ZToNCj4+PiBDdXJyZW50
bHksIHRoZSB2a21zIGF0b21pYyBjaGVjayBvbmx5IGdvZXMgdGhyb3VnaCB0aGUgZmlyc3Qg
cG9zaXRpb24gb2YNCj4+PiB0aGUgYHZrbXNfd2JfZm9ybWF0c2AgdmVjdG9yLg0KPj4+DQo+
Pj4gVGhpcyBjaGFuZ2UgcHJlcGFyZXMgdGhlIGF0b21pY19jaGVjayB0byBjaGVjayB0aGUg
ZW50aXJlIHZlY3Rvci4NCj4+Pg0KPj4+IFNpZ25lZC1vZmYtYnk6IElnb3IgTWF0aGV1cyBB
bmRyYWRlIFRvcnJlbnRlIDxpZ29ybXRvcnJlbnRlQGdtYWlsLmNvbT4NCj4+PiAtLS0NCj4+
PiDCoCBkcml2ZXJzL2dwdS9kcm0vdmttcy92a21zX3dyaXRlYmFjay5jIHwgMTEgKysrKysr
KysrKy0NCj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQ0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92a21zL3Zr
bXNfd3JpdGViYWNrLmMgDQo+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vdmttcy92a21zX3dyaXRl
YmFjay5jDQo+Pj4gaW5kZXggNWEzZTEyZjEwNWRjLi41Njk3OGY0OTkyMDMgMTAwNjQ0DQo+
Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZrbXMvdmttc193cml0ZWJhY2suYw0KPj4+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS92a21zL3ZrbXNfd3JpdGViYWNrLmMNCj4+PiBAQCAtMzAs
NiArMzAsOCBAQCBzdGF0aWMgaW50IHZrbXNfd2JfZW5jb2Rlcl9hdG9taWNfY2hlY2soc3Ry
dWN0IA0KPj4+IGRybV9lbmNvZGVyICplbmNvZGVyLA0KPj4+IMKgIHsNCj4+PiDCoMKgwqDC
oMKgIHN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiOw0KPj4+IMKgwqDCoMKgwqAgY29uc3Qg
c3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUgPSAmY3J0Y19zdGF0ZS0+bW9kZTsNCj4+
PiArwqDCoMKgIGJvb2wgZm9ybWF0X3N1cHBvcnRlZCA9IGZhbHNlOw0KPj4+ICvCoMKgwqAg
aW50IGk7DQo+Pj4gwqDCoMKgwqDCoCBpZiAoIWNvbm5fc3RhdGUtPndyaXRlYmFja19qb2Ig
fHwgIWNvbm5fc3RhdGUtPndyaXRlYmFja19qb2ItPmZiKQ0KPj4+IMKgwqDCoMKgwqDCoMKg
wqDCoCByZXR1cm4gMDsNCj4+PiBAQCAtNDEsNyArNDMsMTQgQEAgc3RhdGljIGludCB2a21z
X3diX2VuY29kZXJfYXRvbWljX2NoZWNrKHN0cnVjdCANCj4+PiBkcm1fZW5jb2RlciAqZW5j
b2RlciwNCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FSU5WQUw7DQo+Pj4gwqDC
oMKgwqDCoCB9DQo+Pj4gLcKgwqDCoCBpZiAoZmItPmZvcm1hdC0+Zm9ybWF0ICE9IHZrbXNf
d2JfZm9ybWF0c1swXSkgew0KPj4+ICvCoMKgwqAgZm9yIChpID0gMDsgaSA8IEFSUkFZX1NJ
WkUodmttc193Yl9mb3JtYXRzKTsgaSsrKSB7DQo+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmIChm
Yi0+Zm9ybWF0LT5mb3JtYXQgPT0gdmttc193Yl9mb3JtYXRzW2ldKSB7DQo+Pj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgZm9ybWF0X3N1cHBvcnRlZCA9IHRydWU7DQo+Pj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgYnJlYWs7DQo+Pj4gK8KgwqDCoMKgwqDCoMKgIH0NCj4+PiAr
wqDCoMKgIH0NCj4+DQo+PiBBdCBhIG1pbmltdW0sIHRoaXMgbG9vcCBzaG91bGQgYmUgaW4g
YSBoZWxwZXIgZnVuY3Rpb24uIEJ1dCBtb3JlIA0KPj4gZ2VuZXJhbGx5LCBJJ20gc3VycHJp
c2VkIHRoYXQgdGhpcyBpc24ndCBhbHJlYWR5IGNvdmVyZWQgYnkgdGhlIERSTSdzIA0KPj4g
YXRvbWljIGhlbHBlcnMuDQo+IA0KPiBPaywgSSBjYW4gd3JhcCBpdCBpbiBhIG5ldyBmdW5j
dGlvbi4NCj4gDQo+IEFGQUlLIHRoZSBEUk0gZG9lc24ndCBjb3ZlciBpdC4gQnV0IEkgbWF5
IGJlIHdyb25nLi4uDQoNCkkgY291bGRuJ3QgZmluZCBhbnl0aGluZyBlaXRoZXIuDQoNCk90
aGVyIGRyaXZlcnMgZG8gc2ltaWxhciBmb3JtYXQgYW5kIGZyYW1idWZmZXIgY2hlY2tzLiBT
byBJIGd1ZXNzIGEgDQpoZWxwZXIgY291bGQgYmUgaW1wbGVtZW50ZWQuIEFsbCBwbGFuZSdz
IGFyZSBzdXBwb3NlZCB0byBjYWxsIA0KZHJtX2F0b21pY19oZWxwZXJfY2hlY2tfcGxhbmVf
c3RhdGUoKSBpbiB0aGVpciBhdG9taWNfY2hlY2soKSBjb2RlLiBZb3UgDQpjb3VsZCBhZGQg
YSBzaW1pbGFyIGhlbHBlciwgc2F5IA0KZHJtX2F0b21pY19oZWxwZXJfY2hlY2tfd3JpdGVi
YWNrX2VuY29kZXJfc3RhdGUoKSwgdGhhdCB0ZXN0cyBmb3IgdGhlIA0KZm9ybWF0IGFuZCBt
YXliZSBvdGhlciB0aGluZ3MgYXMgd2VsbC4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0K
PiANCj4+DQo+PiBCZXN0IHJlZ2FyZHMNCj4+IFRob21hcw0KPj4NCj4+PiArDQo+Pj4gK8Kg
wqDCoCBpZiAoIWZvcm1hdF9zdXBwb3J0ZWQpIHsNCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAg
RFJNX0RFQlVHX0tNUygiSW52YWxpZCBwaXhlbCBmb3JtYXQgJXA0Y2NcbiIsDQo+Pj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgJmZiLT5mb3JtYXQtPmZvcm1h
dCk7DQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRUlOVkFMOw0KPj4+DQo+Pg0K
DQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpT
VVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkw
NDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2Vz
Y2jDpGZ0c2bDvGhyZXI6IEZlbGl4IEltZW5kw7ZyZmZlcg0K

--------------B7zP4m6oNKaDCLdxeNHJnKyf--

--------------pN50UmLDJDaiRIt9ToxFfOeU
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmFtt5gFAwAAAAAACgkQlh/E3EQov+Bj
ZBAAjjq1GPshLjg0wPWNUp68aqgYU87FiLyJ7IRa/URaGBieAfVeMMJJuj5xqz01JeZvPps7q6x4
+Dsg6osTtmJyHpyBv6Go6GcqtcGhrPjGvmN8RJFc1mXbpUkPm6RdZ43I+whl1ORe7sBudMYQHe9o
rrZAAlxHhMxhVJ1DgS3p1nzVKjRreSFpRTQIXwuFbp4pH1tZDiVkiJwmLkLyuZoO1JY14VN51NXW
C30660O11EjtmdQ0lvxxrUMPwY4208YIs8Hn85o2PV7O+SMlV7TFsZstmKem8isRmloB4bNneyuH
GCd7khPPhXHvxchrM+xJDLX8xOJzc1VVU8BYS/lwnplaAHIqKpVVScyQ+juvEckVPMkAkOLAIVcL
QIb7IQ0ZuRBtt2Y5AhRlkCUBUoQuEyyRTkcsQo03j4i3dJJRmX91sTJ0MPPgziBfbS6TYd1VMe1a
w1fhqmGYTX5wLWN0tXtZOPBTphnmRxCRLCoYpGhalOAaAwvBb632wP/LTgLidbcpyQWGCnyz0oay
Wppn+nvFh9P5M+EVPBGJdYrpCNy1K2mdvPvggkPyCoTAp5ezuBmJG2hzCwc0j+lFKbMv9tL1IFOy
JXdiMyWTrLiqzZqvKXs2+HOUm+BSNkJNEhdf8DMblWzud6wkHI26vYh1yZdGqpMDEdFjV5gH/yOS
VKI=
=NhYF
-----END PGP SIGNATURE-----

--------------pN50UmLDJDaiRIt9ToxFfOeU--
