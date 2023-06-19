Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DBA734D7B
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 10:22:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0200E10E1AE;
	Mon, 19 Jun 2023 08:22:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFB4510E1B5
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 08:22:54 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7E86A21885;
 Mon, 19 Jun 2023 08:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1687162973; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tzemlShCyy74jHRarsDRInVA6n4hlA8gWP+raF4d7+E=;
 b=XljX22MY2wMD/ps5BYFO6vbRFFP/KEorx5aAVnaWDCz5a6cJRFlA+lvzEzgjhs8DSzYa3u
 lypsewxtWMxZd+NIRJjFiZUkeoXr/Uay3fdu6qFLyCkE3nDQXhKl9VMDUIwlumXrC7o/AK
 J5W1JvBUOUHV3It6dLBe5FLUHwpbWwo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1687162973;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tzemlShCyy74jHRarsDRInVA6n4hlA8gWP+raF4d7+E=;
 b=eTkY50R+gPc5QJcK7EGYQMQw/AUBdDJmKcAreQ/OHXN4Q1tsackw/VHbivcGweQ17T3ZPE
 kIyl7Zk2HP4yCiAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5A262139C2;
 Mon, 19 Jun 2023 08:22:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +GX0FF0QkGSuEwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 19 Jun 2023 08:22:53 +0000
Message-ID: <9099ae09-9b32-804b-c676-3538cb2a6358@suse.de>
Date: Mon, 19 Jun 2023 10:22:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [08/14] drm/ast: Set up release action right after enabling MMIO
Content-Language: en-US
To: Sui Jingfeng <suijingfeng@loongson.cn>, airlied@redhat.com,
 jfalempe@redhat.com, daniel@ffwll.ch, jammy_huang@aspeedtech.com
References: <20230616140739.32042-9-tzimmermann@suse.de>
 <aa7fc787-2b30-ae1d-ea05-47fc41bb3831@loongson.cn>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <aa7fc787-2b30-ae1d-ea05-47fc41bb3831@loongson.cn>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------o1aAv6Qwc9NDxOCwO6kfKqAO"
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
--------------o1aAv6Qwc9NDxOCwO6kfKqAO
Content-Type: multipart/mixed; boundary="------------22cl0tTQ00BFaHVACnFR2wtq";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sui Jingfeng <suijingfeng@loongson.cn>, airlied@redhat.com,
 jfalempe@redhat.com, daniel@ffwll.ch, jammy_huang@aspeedtech.com
Cc: dri-devel@lists.freedesktop.org
Message-ID: <9099ae09-9b32-804b-c676-3538cb2a6358@suse.de>
Subject: Re: [08/14] drm/ast: Set up release action right after enabling MMIO
References: <20230616140739.32042-9-tzimmermann@suse.de>
 <aa7fc787-2b30-ae1d-ea05-47fc41bb3831@loongson.cn>
In-Reply-To: <aa7fc787-2b30-ae1d-ea05-47fc41bb3831@loongson.cn>

--------------22cl0tTQ00BFaHVACnFR2wtq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDE5LjA2LjIzIHVtIDAzOjU3IHNjaHJpZWIgU3VpIEppbmdmZW5nOg0KPiBIaSwN
Cj4gDQo+IA0KPiBUZXN0ZWQgd2l0aCBhc3QyNDAwDQo+IA0KPiANCj4gT24gMjAyMy82LzE2
IDIxOjUyLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4+IEFzdCBzZXRzIHVwIGEgbWFu
YWdlZCByZWxlYXNlIG9mIHRoZSBNTUlPIGFjY2VzcyBmbGFncy4gTW92ZSB0aGlzDQo+PiBj
b2RlIG5leHQgdG8gdGhlIE1NSU8gYWNjZXNzIGNvZGUsIHNvIHRoYXQgaXQgcnVucyBpZiBv
dGhlciBlcnJvcnMNCj4+IG9jY3VyIGR1cmluZyB0aGUgZGV2aWNlIGluaXRpYWxpemF0aW9u
Lg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFu
bkBzdXNlLmRlPg0KPiANCj4gVGVzdGVkLWJ5OiBTdWkgSmluZ2ZlbmcgPHN1aWppbmdmZW5n
QGxvb25nc29uLmNuPg0KDQpXaGljaCBtb2RlbCBkbyB5b3UgdGVzdCBvbj8NCg0KPiANCj4g
UmV2aWV3ZWQtYnk6IFN1aSBKaW5nZmVuZyA8c3VpamluZ2ZlbmdAbG9vbmdzb24uY24+DQo+
IA0KPj4gLS0tDQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tYWluLmMgfCAzOCAr
KysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tDQo+PiDCoCAxIGZpbGUgY2hhbmdl
ZCwgMTkgaW5zZXJ0aW9ucygrKSwgMTkgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21haW4uYyANCj4+IGIvZHJpdmVycy9ncHUv
ZHJtL2FzdC9hc3RfbWFpbi5jDQo+PiBpbmRleCAzMjk1ODc2YzA5YjM1Li42ZmY0YjgzN2U2
NGQ3IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbWFpbi5jDQo+
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tYWluLmMNCj4+IEBAIC03MSwxMSAr
NzEsMjUgQEAgc3RhdGljIHZvaWQgYXN0X2VuYWJsZV92Z2Eoc3RydWN0IGRybV9kZXZpY2Ug
KmRldikNCj4+IMKgwqDCoMKgwqAgYXN0X2lvX3dyaXRlOChhc3QsIEFTVF9JT19NSVNDX1BP
UlRfV1JJVEUsIDB4MDEpOw0KPj4gwqAgfQ0KPj4gLXN0YXRpYyB2b2lkIGFzdF9lbmFibGVf
bW1pbyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQ0KPj4gKy8qDQo+PiArICogUnVuIHRoaXMg
ZnVuY3Rpb24gYXMgcGFydCBvZiB0aGUgSFcgZGV2aWNlIGNsZWFudXA7IG5vdA0KPj4gKyAq
IHdoZW4gdGhlIERSTSBkZXZpY2UgZ2V0cyByZWxlYXNlZC4NCj4+ICsgKi8NCj4gDQo+IA0K
Pj4gK3N0YXRpYyB2b2lkIGFzdF9lbmFibGVfbW1pb19yZWxlYXNlKHZvaWQgKmRhdGEpDQo+
PiDCoCB7DQo+PiAtwqDCoMKgIHN0cnVjdCBhc3RfZGV2aWNlICphc3QgPSB0b19hc3RfZGV2
aWNlKGRldik7DQo+PiArwqDCoMKgIHN0cnVjdCBhc3RfZGV2aWNlICphc3QgPSBkYXRhOw0K
Pj4gKw0KPj4gK8KgwqDCoCAvKiBlbmFibGUgc3RhbmRhcmQgVkdBIGRlY29kZSAqLw0KPj4g
K8KgwqDCoCBhc3Rfc2V0X2luZGV4X3JlZyhhc3QsIEFTVF9JT19DUlRDX1BPUlQsIDB4YTEs
IDB4MDQpOw0KPj4gK30NCj4+ICsNCj4+ICtzdGF0aWMgaW50IGFzdF9lbmFibGVfbW1pbyhz
dHJ1Y3QgYXN0X2RldmljZSAqYXN0KQ0KPj4gK3sNCj4+ICvCoMKgwqAgc3RydWN0IGRybV9k
ZXZpY2UgKmRldiA9ICZhc3QtPmJhc2U7DQo+PiDCoMKgwqDCoMKgIGFzdF9zZXRfaW5kZXhf
cmVnKGFzdCwgQVNUX0lPX0NSVENfUE9SVCwgMHhhMSwgMHgwNik7DQo+PiArDQo+PiArwqDC
oMKgIHJldHVybiBkZXZtX2FkZF9hY3Rpb25fb3JfcmVzZXQoZGV2LT5kZXYsIA0KPj4gYXN0
X2VuYWJsZV9tbWlvX3JlbGVhc2UsIGFzdCk7DQo+PiDCoCB9DQo+PiDCoCBzdGF0aWMgdm9p
ZCBhc3Rfb3Blbl9rZXkoc3RydWN0IGFzdF9kZXZpY2UgKmFzdCkNCj4+IEBAIC0zOTIsMTgg
KzQwNiw2IEBAIHN0YXRpYyBpbnQgYXN0X2dldF9kcmFtX2luZm8oc3RydWN0IGRybV9kZXZp
Y2UgKmRldikNCj4+IMKgwqDCoMKgwqAgcmV0dXJuIDA7DQo+PiDCoCB9DQo+PiAtLyoNCj4+
IC0gKiBSdW4gdGhpcyBmdW5jdGlvbiBhcyBwYXJ0IG9mIHRoZSBIVyBkZXZpY2UgY2xlYW51
cDsgbm90DQo+PiAtICogd2hlbiB0aGUgRFJNIGRldmljZSBnZXRzIHJlbGVhc2VkLg0KPj4g
LSAqLw0KPj4gLXN0YXRpYyB2b2lkIGFzdF9kZXZpY2VfcmVsZWFzZSh2b2lkICpkYXRhKQ0K
Pj4gLXsNCj4+IC3CoMKgwqAgc3RydWN0IGFzdF9kZXZpY2UgKmFzdCA9IGRhdGE7DQo+PiAt
DQo+PiAtwqDCoMKgIC8qIGVuYWJsZSBzdGFuZGFyZCBWR0EgZGVjb2RlICovDQo+PiAtwqDC
oMKgIGFzdF9zZXRfaW5kZXhfcmVnKGFzdCwgQVNUX0lPX0NSVENfUE9SVCwgMHhhMSwgMHgw
NCk7DQo+PiAtfQ0KPj4gLQ0KPj4gwqAgc3RydWN0IGFzdF9kZXZpY2UgKmFzdF9kZXZpY2Vf
Y3JlYXRlKGNvbnN0IHN0cnVjdCBkcm1fZHJpdmVyICpkcnYsDQo+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgcGNpX2RldiAqcGRldiwN
Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVuc2ln
bmVkIGxvbmcgZmxhZ3MpDQo+PiBAQCAtNDY1LDcgKzQ2Nyw5IEBAIHN0cnVjdCBhc3RfZGV2
aWNlICphc3RfZGV2aWNlX2NyZWF0ZShjb25zdCBzdHJ1Y3QgDQo+PiBkcm1fZHJpdmVyICpk
cnYsDQo+PiDCoMKgwqDCoMKgIC8qIEVuYWJsZSBleHRlbmRlZCByZWdpc3RlciBhY2Nlc3Mg
Ki8NCj4+IMKgwqDCoMKgwqAgYXN0X29wZW5fa2V5KGFzdCk7DQo+PiAtwqDCoMKgIGFzdF9l
bmFibGVfbW1pbyhkZXYpOw0KPj4gK8KgwqDCoCByZXQgPSBhc3RfZW5hYmxlX21taW8oYXN0
KTsNCj4+ICvCoMKgwqAgaWYgKHJldCkNCj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gRVJS
X1BUUihyZXQpOw0KPj4gwqDCoMKgwqDCoCAvKiBGaW5kIG91dCB3aGV0aGVyIFAyQSB3b3Jr
cyBvciB3aGV0aGVyIHRvIHVzZSBkZXZpY2UtdHJlZSAqLw0KPj4gwqDCoMKgwqDCoCBhc3Rf
ZGV0ZWN0X2NvbmZpZ19tb2RlKGRldiwgJnNjdV9yZXYpOw0KPj4gQEAgLTQ5OCw5ICs1MDIs
NSBAQCBzdHJ1Y3QgYXN0X2RldmljZSAqYXN0X2RldmljZV9jcmVhdGUoY29uc3Qgc3RydWN0
IA0KPj4gZHJtX2RyaXZlciAqZHJ2LA0KPj4gwqDCoMKgwqDCoCBpZiAocmV0KQ0KPj4gwqDC
oMKgwqDCoMKgwqDCoMKgIHJldHVybiBFUlJfUFRSKHJldCk7DQo+PiAtwqDCoMKgIHJldCA9
IGRldm1fYWRkX2FjdGlvbl9vcl9yZXNldChkZXYtPmRldiwgYXN0X2RldmljZV9yZWxlYXNl
LCBhc3QpOw0KPj4gLcKgwqDCoCBpZiAocmV0KQ0KPj4gLcKgwqDCoMKgwqDCoMKgIHJldHVy
biBFUlJfUFRSKHJldCk7DQo+PiAtDQo+PiDCoMKgwqDCoMKgIHJldHVybiBhc3Q7DQo+PiDC
oCB9DQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2
ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCkZyYW5rZW5z
dHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJnLCBHZXJtYW55DQpHRjogSXZvIFRvdGV2LCBB
bmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGllbiBNb2VybWFuDQpIUkIgMzY4
MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------22cl0tTQ00BFaHVACnFR2wtq--

--------------o1aAv6Qwc9NDxOCwO6kfKqAO
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSQEFwFAwAAAAAACgkQlh/E3EQov+BX
pw/+JRcIEsPJragb78bOmffz5INjVbOko6bxl358GjcjJ3pzMfo21JHaQVG9Nm9sMCPrULuuolDx
OxaUwravV8qnob0omxgpy0UsHzY4kD4opXNn0ciMpAkICDMAy7Cw4TNh2Q731GyRDvv+VLNTt8vX
g84ffoOkxFMF/cNwUj51qOPL0aHRZ8TpuGineNZt+eyHPkRtQAnYdzgsf7bq5TZWc/nvYjpOpBFW
H+La7qU7fJEprD+4e73+fqdHoMIHbqc6/KEDXVxIR4FuXW5Nn9jVK+MVpeiWkZfFIZXY2px3am8x
CB5Wfod+GHolqGtEKN9w34LtNmFWdoHDtMQndjYfj3j6M7AJgVqDqFJ0FMRlSgmgYagY1lyAgAdo
HYD0JyvHyf2K+AUESzSKZMmu5D/KKM/bp2e2Wu1T9+u08GTZvEjeZ8SrDsd9GBrALsJS34oL65hU
WFRTw03HDOPeD/8jXqBGM83wAnZzK7iUmATK5G6IumZ7XJNqgljwRngbPwtVOpSM3QBIQUd8+PlM
GVaPgSN5Q2Ierm5nlufuW5yLXF/7+aYgJQ+okik9QP74qIVUk8ZHcYiYbMv958MhDEKWBlfJK7EF
c0I2YI+aLt/K/Uey7+YponTJbNi0LWTPfVzkRpyz/gimd5LdYZ9q8h3Z2DUsRPcbl49wbfy8CKAF
N+8=
=xr3N
-----END PGP SIGNATURE-----

--------------o1aAv6Qwc9NDxOCwO6kfKqAO--
