Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EF773825F
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 13:48:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8E5E10E0D6;
	Wed, 21 Jun 2023 11:48:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 621FA10E0D6
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 11:48:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7ED4E1FDF3;
 Wed, 21 Jun 2023 11:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1687348108; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JdjBXWBi6Zw1mo2VtmIDsb+PwNxzkipI3Wq5ybdXmVs=;
 b=w+4ir04SpiLzobkjW/EcBNKaVEWKktSB8vIEoHuECefbWf2aDxAmg6iKxh4mLcH0/zk9Ah
 fx0dNwKQbfx2j97cXoMJvRhpfG1MV4bjfxwj4S7MohNbXkFZ6GKyqXhhNqSEW+DGt3k1HK
 uDmqOglTP5+yFcU3PpRl1FViTAqb+mM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1687348108;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JdjBXWBi6Zw1mo2VtmIDsb+PwNxzkipI3Wq5ybdXmVs=;
 b=ifaiSNTs0M60RTW2b8KFpL4fhExUEUY2tIjBXXuyz6W112ORlVrQIQSCPB7gGqC/HP5xLY
 JfN6Zu/g82eilzAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4EF47133E6;
 Wed, 21 Jun 2023 11:48:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 2uwIEYzjkmR2NgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 21 Jun 2023 11:48:28 +0000
Message-ID: <d070ea6c-908d-a35a-ca85-6011b2395fd2@suse.de>
Date: Wed, 21 Jun 2023 13:48:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [08/14] drm/ast: Set up release action right after enabling MMIO
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sui Jingfeng <suijingfeng@loongson.cn>, airlied@redhat.com,
 jfalempe@redhat.com, daniel@ffwll.ch, jammy_huang@aspeedtech.com
References: <20230616140739.32042-9-tzimmermann@suse.de>
 <aa7fc787-2b30-ae1d-ea05-47fc41bb3831@loongson.cn>
 <9099ae09-9b32-804b-c676-3538cb2a6358@suse.de>
In-Reply-To: <9099ae09-9b32-804b-c676-3538cb2a6358@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------rM1pLgDRFlzzBCOIBl14w873"
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
--------------rM1pLgDRFlzzBCOIBl14w873
Content-Type: multipart/mixed; boundary="------------l0VWzpMZFRcE0t7E4iCPaPaE";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sui Jingfeng <suijingfeng@loongson.cn>, airlied@redhat.com,
 jfalempe@redhat.com, daniel@ffwll.ch, jammy_huang@aspeedtech.com
Cc: dri-devel@lists.freedesktop.org
Message-ID: <d070ea6c-908d-a35a-ca85-6011b2395fd2@suse.de>
Subject: Re: [08/14] drm/ast: Set up release action right after enabling MMIO
References: <20230616140739.32042-9-tzimmermann@suse.de>
 <aa7fc787-2b30-ae1d-ea05-47fc41bb3831@loongson.cn>
 <9099ae09-9b32-804b-c676-3538cb2a6358@suse.de>
In-Reply-To: <9099ae09-9b32-804b-c676-3538cb2a6358@suse.de>

--------------l0VWzpMZFRcE0t7E4iCPaPaE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDE5LjA2LjIzIHVtIDEwOjIyIHNjaHJpZWIgVGhvbWFzIFppbW1lcm1hbm46DQo+
IA0KPiANCj4gQW0gMTkuMDYuMjMgdW0gMDM6NTcgc2NocmllYiBTdWkgSmluZ2Zlbmc6DQo+
PiBIaSwNCj4+DQo+Pg0KPj4gVGVzdGVkIHdpdGggYXN0MjQwMA0KPj4NCj4+DQo+PiBPbiAy
MDIzLzYvMTYgMjE6NTIsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4+IEFzdCBzZXRz
IHVwIGEgbWFuYWdlZCByZWxlYXNlIG9mIHRoZSBNTUlPIGFjY2VzcyBmbGFncy4gTW92ZSB0
aGlzDQo+Pj4gY29kZSBuZXh0IHRvIHRoZSBNTUlPIGFjY2VzcyBjb2RlLCBzbyB0aGF0IGl0
IHJ1bnMgaWYgb3RoZXIgZXJyb3JzDQo+Pj4gb2NjdXIgZHVyaW5nIHRoZSBkZXZpY2UgaW5p
dGlhbGl6YXRpb24uDQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFu
biA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4+DQo+PiBUZXN0ZWQtYnk6IFN1aSBKaW5nZmVu
ZyA8c3VpamluZ2ZlbmdAbG9vbmdzb24uY24+DQo+IA0KPiBXaGljaCBtb2RlbCBkbyB5b3Ug
dGVzdCBvbj8NCg0KT2gsIHlvdSBtZW50aW9uZWQgdGhlIEFTVDI0MDAuDQoNCj4gDQo+Pg0K
Pj4gUmV2aWV3ZWQtYnk6IFN1aSBKaW5nZmVuZyA8c3VpamluZ2ZlbmdAbG9vbmdzb24uY24+
DQo+Pg0KPj4+IC0tLQ0KPj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21haW4uYyB8
IDM4ICsrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0NCj4+PiDCoCAxIGZpbGUg
Y2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgMTkgZGVsZXRpb25zKC0pDQo+Pj4NCj4+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbWFpbi5jIA0KPj4+IGIvZHJp
dmVycy9ncHUvZHJtL2FzdC9hc3RfbWFpbi5jDQo+Pj4gaW5kZXggMzI5NTg3NmMwOWIzNS4u
NmZmNGI4MzdlNjRkNyAxMDA2NDQNCj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXN0L2Fz
dF9tYWluLmMNCj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tYWluLmMNCj4+
PiBAQCAtNzEsMTEgKzcxLDI1IEBAIHN0YXRpYyB2b2lkIGFzdF9lbmFibGVfdmdhKHN0cnVj
dCBkcm1fZGV2aWNlICpkZXYpDQo+Pj4gwqDCoMKgwqDCoCBhc3RfaW9fd3JpdGU4KGFzdCwg
QVNUX0lPX01JU0NfUE9SVF9XUklURSwgMHgwMSk7DQo+Pj4gwqAgfQ0KPj4+IC1zdGF0aWMg
dm9pZCBhc3RfZW5hYmxlX21taW8oc3RydWN0IGRybV9kZXZpY2UgKmRldikNCj4+PiArLyoN
Cj4+PiArICogUnVuIHRoaXMgZnVuY3Rpb24gYXMgcGFydCBvZiB0aGUgSFcgZGV2aWNlIGNs
ZWFudXA7IG5vdA0KPj4+ICsgKiB3aGVuIHRoZSBEUk0gZGV2aWNlIGdldHMgcmVsZWFzZWQu
DQo+Pj4gKyAqLw0KPj4NCj4+DQo+Pj4gK3N0YXRpYyB2b2lkIGFzdF9lbmFibGVfbW1pb19y
ZWxlYXNlKHZvaWQgKmRhdGEpDQo+Pj4gwqAgew0KPj4+IC3CoMKgwqAgc3RydWN0IGFzdF9k
ZXZpY2UgKmFzdCA9IHRvX2FzdF9kZXZpY2UoZGV2KTsNCj4+PiArwqDCoMKgIHN0cnVjdCBh
c3RfZGV2aWNlICphc3QgPSBkYXRhOw0KPj4+ICsNCj4+PiArwqDCoMKgIC8qIGVuYWJsZSBz
dGFuZGFyZCBWR0EgZGVjb2RlICovDQo+Pj4gK8KgwqDCoCBhc3Rfc2V0X2luZGV4X3JlZyhh
c3QsIEFTVF9JT19DUlRDX1BPUlQsIDB4YTEsIDB4MDQpOw0KPj4+ICt9DQo+Pj4gKw0KPj4+
ICtzdGF0aWMgaW50IGFzdF9lbmFibGVfbW1pbyhzdHJ1Y3QgYXN0X2RldmljZSAqYXN0KQ0K
Pj4+ICt7DQo+Pj4gK8KgwqDCoCBzdHJ1Y3QgZHJtX2RldmljZSAqZGV2ID0gJmFzdC0+YmFz
ZTsNCj4+PiDCoMKgwqDCoMKgIGFzdF9zZXRfaW5kZXhfcmVnKGFzdCwgQVNUX0lPX0NSVENf
UE9SVCwgMHhhMSwgMHgwNik7DQo+Pj4gKw0KPj4+ICvCoMKgwqAgcmV0dXJuIGRldm1fYWRk
X2FjdGlvbl9vcl9yZXNldChkZXYtPmRldiwgDQo+Pj4gYXN0X2VuYWJsZV9tbWlvX3JlbGVh
c2UsIGFzdCk7DQo+Pj4gwqAgfQ0KPj4+IMKgIHN0YXRpYyB2b2lkIGFzdF9vcGVuX2tleShz
dHJ1Y3QgYXN0X2RldmljZSAqYXN0KQ0KPj4+IEBAIC0zOTIsMTggKzQwNiw2IEBAIHN0YXRp
YyBpbnQgYXN0X2dldF9kcmFtX2luZm8oc3RydWN0IGRybV9kZXZpY2UgDQo+Pj4gKmRldikN
Cj4+PiDCoMKgwqDCoMKgIHJldHVybiAwOw0KPj4+IMKgIH0NCj4+PiAtLyoNCj4+PiAtICog
UnVuIHRoaXMgZnVuY3Rpb24gYXMgcGFydCBvZiB0aGUgSFcgZGV2aWNlIGNsZWFudXA7IG5v
dA0KPj4+IC0gKiB3aGVuIHRoZSBEUk0gZGV2aWNlIGdldHMgcmVsZWFzZWQuDQo+Pj4gLSAq
Lw0KPj4+IC1zdGF0aWMgdm9pZCBhc3RfZGV2aWNlX3JlbGVhc2Uodm9pZCAqZGF0YSkNCj4+
PiAtew0KPj4+IC3CoMKgwqAgc3RydWN0IGFzdF9kZXZpY2UgKmFzdCA9IGRhdGE7DQo+Pj4g
LQ0KPj4+IC3CoMKgwqAgLyogZW5hYmxlIHN0YW5kYXJkIFZHQSBkZWNvZGUgKi8NCj4+PiAt
wqDCoMKgIGFzdF9zZXRfaW5kZXhfcmVnKGFzdCwgQVNUX0lPX0NSVENfUE9SVCwgMHhhMSwg
MHgwNCk7DQo+Pj4gLX0NCj4+PiAtDQo+Pj4gwqAgc3RydWN0IGFzdF9kZXZpY2UgKmFzdF9k
ZXZpY2VfY3JlYXRlKGNvbnN0IHN0cnVjdCBkcm1fZHJpdmVyICpkcnYsDQo+Pj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IHBjaV9kZXYg
KnBkZXYsDQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgdW5zaWduZWQgbG9uZyBmbGFncykNCj4+PiBAQCAtNDY1LDcgKzQ2Nyw5IEBAIHN0cnVj
dCBhc3RfZGV2aWNlICphc3RfZGV2aWNlX2NyZWF0ZShjb25zdCBzdHJ1Y3QgDQo+Pj4gZHJt
X2RyaXZlciAqZHJ2LA0KPj4+IMKgwqDCoMKgwqAgLyogRW5hYmxlIGV4dGVuZGVkIHJlZ2lz
dGVyIGFjY2VzcyAqLw0KPj4+IMKgwqDCoMKgwqAgYXN0X29wZW5fa2V5KGFzdCk7DQo+Pj4g
LcKgwqDCoCBhc3RfZW5hYmxlX21taW8oZGV2KTsNCj4+PiArwqDCoMKgIHJldCA9IGFzdF9l
bmFibGVfbW1pbyhhc3QpOw0KPj4+ICvCoMKgwqAgaWYgKHJldCkNCj4+PiArwqDCoMKgwqDC
oMKgwqAgcmV0dXJuIEVSUl9QVFIocmV0KTsNCj4+PiDCoMKgwqDCoMKgIC8qIEZpbmQgb3V0
IHdoZXRoZXIgUDJBIHdvcmtzIG9yIHdoZXRoZXIgdG8gdXNlIGRldmljZS10cmVlICovDQo+
Pj4gwqDCoMKgwqDCoCBhc3RfZGV0ZWN0X2NvbmZpZ19tb2RlKGRldiwgJnNjdV9yZXYpOw0K
Pj4+IEBAIC00OTgsOSArNTAyLDUgQEAgc3RydWN0IGFzdF9kZXZpY2UgKmFzdF9kZXZpY2Vf
Y3JlYXRlKGNvbnN0IHN0cnVjdCANCj4+PiBkcm1fZHJpdmVyICpkcnYsDQo+Pj4gwqDCoMKg
wqDCoCBpZiAocmV0KQ0KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gRVJSX1BUUihy
ZXQpOw0KPj4+IC3CoMKgwqAgcmV0ID0gZGV2bV9hZGRfYWN0aW9uX29yX3Jlc2V0KGRldi0+
ZGV2LCBhc3RfZGV2aWNlX3JlbGVhc2UsIGFzdCk7DQo+Pj4gLcKgwqDCoCBpZiAocmV0KQ0K
Pj4+IC3CoMKgwqDCoMKgwqDCoCByZXR1cm4gRVJSX1BUUihyZXQpOw0KPj4+IC0NCj4+PiDC
oMKgwqDCoMKgIHJldHVybiBhc3Q7DQo+Pj4gwqAgfQ0KPj4NCj4gDQoNCi0tIA0KVGhvbWFz
IFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUg
U29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVy
bmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3IE1j
RG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------l0VWzpMZFRcE0t7E4iCPaPaE--

--------------rM1pLgDRFlzzBCOIBl14w873
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSS44oFAwAAAAAACgkQlh/E3EQov+Ca
eBAAiVqgnW3u0VY7US8e/4cHugKsxCRRGJZeu+Mh13micRC0AExFvc2SjQQ0EgBrct4GXoiSQUZ1
O9pyME1DmCM3owoJFGiizDkdjuvI8dWUU3MlLfLFRhwLa9Mzq718ibyy+bcSsOo8+IVziXiBqdsa
+BffKK6uN/cnkHuIVwijXqJHXo3uSZur7ZDIUbbaqVqDq82nOpyf9ogdstOMbQuc0s7RdymuT26Y
QPidJVgaoagswUF39vIV2lQLE282mctdeQBG6kHyHbDVZhx420ABmtQv11Bgc9GrVr7Ig608ofIL
G7RBCRalNuYSQIIQvKDq3upQKJlGEw1Ob6mo6zH+uXli7DWO1JeoxPbyWED3BzJ7mQ5k1KL478di
BcJMv5Vyum5+8k1KhV/9Hdt9SIqlD/JISZ7iaVWXjHI0w6lI7Bz+0+ExTGa9/z6rLcY5Y8C+SGFI
MrKRjnEHzKTSoWAFzsbuUp2T3xmFBj86Thso72VHEOo6IpeQ7NhAVmEMUfmnhmuceloLKICyN+rN
Ex2YbTxRUl0audfglBQFKmya5dakHtZIDhfBpGvyobnm6gvP1U3EUKRgc0LLhGFk6pbUoweBcydW
Gwxobedwa0MZ2Z/A8ZJ8yu8wS/YCDO1f/UnthJwXiqCN9MNyst0/fyhjJ9FEPcBo8hwTnZuV4I/C
6ME=
=MEw6
-----END PGP SIGNATURE-----

--------------rM1pLgDRFlzzBCOIBl14w873--
