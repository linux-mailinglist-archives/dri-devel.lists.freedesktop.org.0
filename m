Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF12E73B332
	for <lists+dri-devel@lfdr.de>; Fri, 23 Jun 2023 11:03:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8155610E0E3;
	Fri, 23 Jun 2023 09:02:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 210AD10E0E3
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Jun 2023 09:02:55 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5B6791F38D;
 Fri, 23 Jun 2023 09:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1687510973; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zmPjA9xDCRWuBNRM+pd6N3XM1bLOyewiz/EFn0VgFb0=;
 b=d83InJEnYzd7Lndd9lvxwQxv62ZCQYABsQoaEdq+pPzwMkudeF09v/3TvJc+WCElUcDKW+
 h/nKzjFaudTBxOgaNiWF/oB1ySxEMzOOXKPs+cggaB/v6H/z5+8eQz43wW3+rmWLX1C6lb
 l+VJoRJxPov/M/jRBbfKMQFN3Pu+YXM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1687510973;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zmPjA9xDCRWuBNRM+pd6N3XM1bLOyewiz/EFn0VgFb0=;
 b=yfcu9CHX5c6y6K2SxzNHeBpLHVMWkSaoO6prUdi7//oqJagF2G9N3EqCGXvmJ1kzNFijBe
 SDf8rECYTwITcVCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 372BC1331F;
 Fri, 23 Jun 2023 09:02:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id xZ6VDL1flWSsXQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 23 Jun 2023 09:02:53 +0000
Message-ID: <a675a203-9ec1-3e66-9ae2-5abf6d2690af@suse.de>
Date: Fri, 23 Jun 2023 11:02:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 06/14] drm/ast: Set PCI config before accessing I/O
 registers
Content-Language: en-US
To: Sui Jingfeng <suijingfeng@loongson.cn>, airlied@redhat.com,
 jfalempe@redhat.com, daniel@ffwll.ch, jammy_huang@aspeedtech.com
References: <20230621130032.3568-1-tzimmermann@suse.de>
 <20230621130032.3568-7-tzimmermann@suse.de>
 <ac2955ec-0a09-1c44-23a7-e29b952f463d@loongson.cn>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <ac2955ec-0a09-1c44-23a7-e29b952f463d@loongson.cn>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ZfsaolX1mND1Wz5Riiq76Hm2"
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
--------------ZfsaolX1mND1Wz5Riiq76Hm2
Content-Type: multipart/mixed; boundary="------------vPPTQ6UZavQpSoFbFgCPr4Ub";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sui Jingfeng <suijingfeng@loongson.cn>, airlied@redhat.com,
 jfalempe@redhat.com, daniel@ffwll.ch, jammy_huang@aspeedtech.com
Cc: dri-devel@lists.freedesktop.org
Message-ID: <a675a203-9ec1-3e66-9ae2-5abf6d2690af@suse.de>
Subject: Re: [PATCH v2 06/14] drm/ast: Set PCI config before accessing I/O
 registers
References: <20230621130032.3568-1-tzimmermann@suse.de>
 <20230621130032.3568-7-tzimmermann@suse.de>
 <ac2955ec-0a09-1c44-23a7-e29b952f463d@loongson.cn>
In-Reply-To: <ac2955ec-0a09-1c44-23a7-e29b952f463d@loongson.cn>

--------------vPPTQ6UZavQpSoFbFgCPr4Ub
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjIuMDYuMjMgdW0gMTc6NDIgc2NocmllYiBTdWkgSmluZ2Zlbmc6DQpbLi4u
XQ0KPj4gK8KgwqDCoCByZXQgPSBhc3RfaW5pdF9wY2lfY29uZmlnKHBkZXYpOw0KPj4gK8Kg
wqDCoCBpZiAocmV0KQ0KPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiBFUlJfUFRSKHJldCk7
DQo+PiArDQo+IA0KPiANCj4gSXMgdGhlIGNhbGxpbmcgdG8gYXN0X2luaXRfcGNpX2NvbmZp
ZygpIGFic29sdXRlIG5lY2Vzc2FyeSA/DQo+IA0KPiBJJ20gYXNraW5nIHRoaXMgcXVlc3Rp
b24gYmVjYXVzZQ0KPiANCj4gSSB0aGluayB0aGlzIGZ1bmN0aW9uIGlzIG5lZWRlZCB0byBi
ZSBydW4gb25seSB3aGVuIHRoZSBjaGlwIG5lZWQgUE9TVC4NCj4gDQo+IE9uIG5vcm1hbCBj
YXNlLCB3aGVuIHlvdSBjYWxsIHBjaW1fZW5hYmxlX2RldmljZSgpIGZ1bmN0aW9uLA0KPiAN
Cj4gdGhlIHBjaV9lbmFibGVfZGV2aWNlKCkgZnVuY3Rpb24gd2lsbCBkbyBzdWNoIHRoaW5n
IGZvciB5b3UuDQoNCllvdSdyZSByaWdodC4gV2UgY291bGQgcHJvYmFibHkgcmVtb3ZlIHRo
aXMgY29kZSBmcm9tIHRoZSBkcml2ZXIuIEkgDQpkb24ndCB3YW50IHRvIGRvIHRoaXMgaW4g
YSBwYXRjaHNldCB0aGF0IGlzIGFib3V0IHJlZmFjdG9yaW5nLiBNYXliZSBpbiANCmEgbGF0
ZXIgcGF0Y2guDQoNCj4gDQo+IA0KPiBgYGANCj4gDQo+IGludCBwY2lfZW5hYmxlX2Rldmlj
ZShzdHJ1Y3QgcGNpX2RldiAqZGV2KQ0KPiB7DQo+ICDCoMKgIMKgcmV0dXJuIHBjaV9lbmFi
bGVfZGV2aWNlX2ZsYWdzKGRldiwgSU9SRVNPVVJDRV9NRU0gfCBJT1JFU09VUkNFX0lPKTsN
Cj4gfQ0KPiANCj4gYGBgDQo+IA0KPj4gwqDCoMKgwqDCoCBpZiAoIWFzdF9pc192Z2FfZW5h
YmxlZChkZXYpKSB7DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZHJtX2luZm8oZGV2LCAiVkdB
IG5vdCBlbmFibGVkIG9uIGVudHJ5LCByZXF1ZXN0aW5nIGNoaXAgDQo+PiBQT1NUXG4iKTsN
Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBuZWVkX3Bvc3QgPSB0cnVlOw0KPj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X3Bvc3QuYyANCj4+IGIvZHJpdmVycy9ncHUv
ZHJtL2FzdC9hc3RfcG9zdC5jDQo+PiBpbmRleCBhYTNmMmNiMDBmODJjLi4yZGE1YmRiNGJh
YzQ1IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfcG9zdC5jDQo+
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9wb3N0LmMNCj4+IEBAIC0zNjEsMTIg
KzM2MSw2IEBAIHN0YXRpYyB2b2lkIGFzdF9pbml0X2RyYW1fcmVnKHN0cnVjdCBkcm1fZGV2
aWNlIA0KPj4gKmRldikNCj4+IMKgIHZvaWQgYXN0X3Bvc3RfZ3B1KHN0cnVjdCBkcm1fZGV2
aWNlICpkZXYpDQo+PiDCoCB7DQo+PiDCoMKgwqDCoMKgIHN0cnVjdCBhc3RfZGV2aWNlICph
c3QgPSB0b19hc3RfZGV2aWNlKGRldik7DQo+PiAtwqDCoMKgIHN0cnVjdCBwY2lfZGV2ICpw
ZGV2ID0gdG9fcGNpX2RldihkZXYtPmRldik7DQo+PiAtwqDCoMKgIHUzMiByZWc7DQo+PiAt
DQo+PiAtwqDCoMKgIHBjaV9yZWFkX2NvbmZpZ19kd29yZChwZGV2LCAweDA0LCAmcmVnKTsN
Cj4+IC3CoMKgwqAgcmVnIHw9IDB4MzsNCj4+IC3CoMKgwqAgcGNpX3dyaXRlX2NvbmZpZ19k
d29yZChwZGV2LCAweDA0LCByZWcpOw0KPiANCj4gWW91IGhhdmUgY2hhbmdlZCB0aGUgc2Vt
YW50aWNzIGFmdGVyIHRoaXMgcGF0Y2ggaXMgYXBwbGllZCAuDQo+IA0KPiBZZXMsIGl0IHN0
aWxsIHdvcmtzLg0KPiANCj4gQnV0IHdvdWxkIHlvdSBsaWtlIHRvIGV4cGxhaW4gc29tZXRo
aW5nIGFib3V0IHRoaXM/DQoNCkknbSBsb29raW5nIGF0IHRoZSBmdW5jdGlvbiwgYnV0IEkg
ZG9uJ3Qgc2VlIHRoZSBjaGFuZ2UgaW4gc2VtYW50aWNzLiBJIA0Kb25seSBtb3ZlZCB0aGUg
UENJIGNhbGxzIGFuZCBhZGRlZCBlcnJvciBkZXRlY3Rpb24uIFdoYXQgZG8geW91IG1lYW4/
DQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IFdlIHdhbnQgdG8gbGVhcm4gbW9y
ZSBrbm93bGVkZ2UgZnJvbSB5b3VyIHBhdGNoLg0KPiANCj4+IMKgwqDCoMKgwqAgYXN0X2Vu
YWJsZV92Z2EoZGV2KTsNCj4+IMKgwqDCoMKgwqAgYXN0X29wZW5fa2V5KGFzdCk7DQo+IA0K
DQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpT
VVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCkZyYW5rZW5zdHJhc3NlIDE0
NiwgOTA0NjEgTnVlcm5iZXJnLCBHZXJtYW55DQpHRjogSXZvIFRvdGV2LCBBbmRyZXcgTXll
cnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGllbiBNb2VybWFuDQpIUkIgMzY4MDkgKEFHIE51
ZXJuYmVyZykNCg==

--------------vPPTQ6UZavQpSoFbFgCPr4Ub--

--------------ZfsaolX1mND1Wz5Riiq76Hm2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSVX7wFAwAAAAAACgkQlh/E3EQov+Bq
BA/+N9ic6567jPDi2iKRHVFhkRlJawN8Q5banMwbl0VdVRWW2osQfo6H8U+qeBZnLXppa4WveYFv
nvuMvfmU6TlRRo9pe5k4TGLWabRNgJIPk0dICqszGp9ww9QTt+lI6bFBOj/9CeTU0CAYqURAxt5v
MtsKV5Lhaph9CHsO03r4pezP0LazVSNrIMMENeQxgVkDT0on2mdJPHU53CBiPgyRITDoM+X+oc+X
zbyvd33w2UZc2DKEqdSTob3WoDLBpsFxb669UTQhb9CxgCqHRsLEtIdK2V/1YZMpFbR/tU9olr9+
Grbg6cB3QON8cOgUUZ9zmGPl5AMetlaI/Q1QggMam0CoalLayq1Ac76LdoQl1YrLyWz8gAqgN4Tx
qkBKP37trLaZ4HJukbLWVAHGJlSUOuivwlQJEeB4v3i6L607LsKPhkq0/jyMmr9CuZD7JJQmy6vu
RSo6lU1SjOQCJTpbqgAo3VJE9g86f/+NFFxhdPEoTVXUQd7m5z9v7IPJLlS50c2Us4dgtJfe6H8+
Fx7UIB4Mk7uGQyoF8FlgWYk3xzxK6LTEp58XFKiKJ9UhKei9CzNGjeZrrjtlI2AHsmYvF1yjPZ6g
YyMHP/Oco+f5Gv7XA1+kEckZLK9+lBpLsuYZ7pgd9pxbGZ0O2nWzpmbn77aEko5UGOFvnSRi6Og3
5YY=
=RKai
-----END PGP SIGNATURE-----

--------------ZfsaolX1mND1Wz5Riiq76Hm2--
