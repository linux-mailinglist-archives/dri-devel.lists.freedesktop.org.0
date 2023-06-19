Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E2D734D57
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 10:16:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AA7210E19F;
	Mon, 19 Jun 2023 08:16:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9982E10E19F
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 08:16:11 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3D08D1F38A;
 Mon, 19 Jun 2023 08:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1687162570; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tdb2FlhNh74JkCWXsT14dFg/M2gGPU7uLn6j5fPdBb0=;
 b=aKAPJRTvUeQRtxSHhB5M2u7lL6RTTA6RfiqCL9TfNnd9bYwHYOtwCciL5WKwX79I4N1Psi
 EJloNZMLillujLaJY+bVd9p+HUzz6/e+7TsGeiOF06JLgm0zsmUoCEYUe4dU4zRiMVNcwq
 vi5slF8aIy+fuO8BQr87/+9tFSk54hk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1687162570;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tdb2FlhNh74JkCWXsT14dFg/M2gGPU7uLn6j5fPdBb0=;
 b=UHgRib5meFqr3jfbdys8a0T06XVLJcScBjoAw9+7wr4zVUxxGVxocAru5SkH5V786dnU8M
 nnxP+X1ZigVQ/FDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1B4A3139C2;
 Mon, 19 Jun 2023 08:16:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 5W1/BcoOkGQmEQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 19 Jun 2023 08:16:10 +0000
Message-ID: <50cd6b99-1946-2c28-97fb-6c03ef63183d@suse.de>
Date: Mon, 19 Jun 2023 10:16:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [06/14] drm/ast: Set PCI config before accessing I/O registers
Content-Language: en-US
To: Sui Jingfeng <suijingfeng@loongson.cn>, airlied@redhat.com,
 jfalempe@redhat.com, daniel@ffwll.ch, jammy_huang@aspeedtech.com
References: <20230616140739.32042-7-tzimmermann@suse.de>
 <4c56ceea-a0d7-bff6-de47-2603a8966c4a@loongson.cn>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <4c56ceea-a0d7-bff6-de47-2603a8966c4a@loongson.cn>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------PDWuOejtsUiTxrnjoV1Gjeqt"
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
--------------PDWuOejtsUiTxrnjoV1Gjeqt
Content-Type: multipart/mixed; boundary="------------1N0Nl3aG2ZM9khja6IdwkLdM";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sui Jingfeng <suijingfeng@loongson.cn>, airlied@redhat.com,
 jfalempe@redhat.com, daniel@ffwll.ch, jammy_huang@aspeedtech.com
Cc: dri-devel@lists.freedesktop.org
Message-ID: <50cd6b99-1946-2c28-97fb-6c03ef63183d@suse.de>
Subject: Re: [06/14] drm/ast: Set PCI config before accessing I/O registers
References: <20230616140739.32042-7-tzimmermann@suse.de>
 <4c56ceea-a0d7-bff6-de47-2603a8966c4a@loongson.cn>
In-Reply-To: <4c56ceea-a0d7-bff6-de47-2603a8966c4a@loongson.cn>

--------------1N0Nl3aG2ZM9khja6IdwkLdM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTcuMDYuMjMgdW0gMDk6NTQgc2NocmllYiBTdWkgSmluZ2Zlbmc6DQo+IEhp
DQo+IA0KPiBPbiAyMDIzLzYvMTYgMjE6NTIsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0K
Pj4gQWNjZXNzIHRvIEkvTyByZWdpc3RlcnMgaXMgcmVxdWlyZWQgdG8gZGV0ZWN0IGFuZCBz
ZXQgdXAgdGhlDQo+PiBkZXZpY2UuIEVuYWJsZSB0aGUgcnNwIFBDSSBjb25maWcgYml0cyBi
ZWZvcmUuIFdoaWxlIGF0IGl0LA0KPj4gY29udmVydCB0aGUgbWFnaWMgbnVtYmVyIHRvIG1h
Y3JvIGNvbnN0YW50cy4NCj4+DQo+PiBFbmFibGluZyB0aGUgUENJIGNvbmZpZyBiaXRzIHdh
cyBkb25lIGFmdGVyIHRyeWluZyB0byBkZXRlY3QNCj4+IHRoZSBkZXZpY2UuDQo+IA0KPiBP
dGhlcndpc2UgdGhlIGRldmljZSBjYW4gbm90IGJlIGNvbmZpZ3VyZWQswqAgaXRzIGRvbid0
IGV2ZW4gcmVjZWl2ZSANCj4gd3JpdGUgYW5kIHJlYWQgYWNjZXNzIGFueW1vcmUuDQoNCkkg
ZG9uJ3QgdW5kZXJzdGFuZC4gVGhlIFBDSSBjb25maWcgcmVnIG5lZWRzIHRvIGJlIHNldCwg
c28gdGhhdCBJL08gDQpzcGFjZXMgYXJlIGF2YWlsYWJsZSBmb3IgZGV0ZWN0aW5nIHRoZSBj
aGlwIHR5cGUuDQoNCj4gDQo+PiBJdCB3YXMgcHJvYmFibHkgdG9vIGxhdGUgYXQgdGhpcyBw
b2ludC4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1l
cm1hbm5Ac3VzZS5kZT4NCj4+IC0tLQ0KPj4gwqAgZHJpdmVycy9ncHUvZHJtL2FzdC9hc3Rf
ZHJ2LmjCoCB8wqAgMiArKw0KPj4gwqAgZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbWFpbi5j
IHwgMjIgKysrKysrKysrKysrKysrKysrKysrKw0KPj4gwqAgZHJpdmVycy9ncHUvZHJtL2Fz
dC9hc3RfcG9zdC5jIHzCoCA2IC0tLS0tLQ0KPj4gwqAgMyBmaWxlcyBjaGFuZ2VkLCAyNCBp
bnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYXN0L2FzdF9kcnYuaCANCj4+IGIvZHJpdmVycy9ncHUvZHJtL2FzdC9h
c3RfZHJ2LmgNCj4+IGluZGV4IDAxNDE3MDViZWFlZTkuLjU1NWEwODUwOTU3ZjMgMTAwNjQ0
DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9kcnYuaA0KPj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FzdC9hc3RfZHJ2LmgNCj4+IEBAIC01Miw2ICs1Miw4IEBADQo+PiDC
oCAjZGVmaW5lIFBDSV9DSElQX0FTVDIwMDAgMHgyMDAwDQo+PiDCoCAjZGVmaW5lIFBDSV9D
SElQX0FTVDIxMDAgMHgyMDEwDQo+PiArI2RlZmluZSBBU1RfUENJX09QVElPTl9NRU1fQUND
RVNTX0VOQUJMRcKgwqDCoCBCSVQoMSkNCj4+ICsjZGVmaW5lIEFTVF9QQ0lfT1BUSU9OX0lP
X0FDQ0VTU19FTkFCTEXCoMKgwqDCoMKgwqDCoCBCSVQoMCkNCj4gDQo+IFlvdSBjYW4gdXNl
IHRoZSBzcGFjZSByZXBsYWNlIHRoZSB0YWIgdG8ga2VlcCB0aGUgJ0JJVCgwKScgYW5kICdC
SVQoMSknIA0KPiBhbGlnbmVkLA0KPiANCj4gd2h5IHlvdSBuZWVkIGRlZmluZSB0aGlzIHR3
byBtYWNyb3MgeW91c2VsZiwNCj4gDQo+IHdoeSBub3QgdXNlIFBDSV9DT01NQU5EX01FTU9S
WSBhbmQgUENJX0NPTU1BTkRfSU8gPw0KDQpHb29kIHBvaW50LCBJJ2xsIHVzZSB0aG9zZS4g
SSB3YXNuJ3QgYXdhcmUgb2YgdGhlc2UgY29uc3RhbnRzLg0KDQo+IA0KPj4gwqAgZW51bSBh
c3RfY2hpcCB7DQo+PiDCoMKgwqDCoMKgIEFTVDIwMDAsDQo+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FzdC9hc3RfbWFpbi5jIA0KPj4gYi9kcml2ZXJzL2dwdS9kcm0vYXN0
L2FzdF9tYWluLmMNCj4+IGluZGV4IGM2OTg3ZTA0NDY2MTguLmZlMDU0NzM5YjQ5NGEgMTAw
NjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tYWluLmMNCj4+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21haW4uYw0KPj4gQEAgLTM1LDYgKzM1LDI0IEBA
DQo+PiDCoCAjaW5jbHVkZSAiYXN0X2Rydi5oIg0KPj4gK3N0YXRpYyBpbnQgYXN0X2luaXRf
cGNpX2NvbmZpZyhzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+ICt7DQo+PiArwqDCoMKgIGlu
dCBlcnI7DQo+PiArwqDCoMKgIHUzMiBwY2lzMDQ7DQo+PiArDQo+PiArwqDCoMKgIGVyciA9
IHBjaV9yZWFkX2NvbmZpZ19kd29yZChwZGV2LCAweDA0LCAmcGNpczA0KTsNCj4+ICvCoMKg
wqAgaWYgKGVycikNCj4+ICvCoMKgwqDCoMKgwqDCoCBnb3RvIG91dDsNCj4+ICsNCj4+ICvC
oMKgwqAgcGNpczA0IHw9IEFTVF9QQ0lfT1BUSU9OX01FTV9BQ0NFU1NfRU5BQkxFIHwNCj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqAgQVNUX1BDSV9PUFRJT05fSU9fQUNDRVNTX0VOQUJMRTsN
Cj4+ICsNCj4+ICvCoMKgwqAgZXJyID0gcGNpX3dyaXRlX2NvbmZpZ19kd29yZChwZGV2LCAw
eDA0LCBwY2lzMDQpOw0KPj4gKw0KPj4gK291dDoNCj4+ICvCoMKgwqAgcmV0dXJuIHBjaWJp
b3NfZXJyX3RvX2Vycm5vKGVycik7DQo+PiArfQ0KPj4gKw0KPiANCj4gc3RhdGljIHZvaWQg
YXN0X2VuYWJsZV9tZW1faW8oc3RydWN0IHBjaV9kZXYgKnBkZXYpDQo+IHsNCj4gIMKgwqAg
wqB1MTYgY21kOw0KPiANCj4gIMKgwqAgwqBwY2lfcmVhZF9jb25maWdfd29yZChwZGV2LCBQ
Q0lfQ09NTUFORCwgJmNtZCk7DQo+IA0KPiAgwqDCoCDCoGNtZCB8PSBQQ0lfQ09NTUFORF9N
RU1PUlkgfCBQQ0lfQ09NTUFORF9JTzsNCj4gDQo+ICDCoMKgIMKgZGV2X2RiZygmcGRldi0+
ZGV2LCAicGNpIGNvbW1hbmQ6ICV1IiwgY21kKTsNCj4gDQo+ICDCoMKgIMKgcGNpX3JlYWRf
Y29uZmlnX3dvcmQocGRldiwgUENJX0NPTU1BTkQsICZjbWQpOw0KPiB9DQoNCkFsdGhvdWdo
IGNvc21ldGljYWwsIEknbSBub3Qgc28gc3VwZXItaGFwcHkgYWJvdXQgdGhlIHNwZWNzIGRp
c2FncmVlaW5nIA0KaGVyZTogUENJIHRlbmRzIHRvIHRyZWF0IHN0YXR1cyBhbmQgY29tbWFu
ZCBhcyBzZXBhcmF0ZSAxNi1iaXQgcmVncywgDQp3aGlsZSB0aGUgQVNUIHNwZWMgdHJlYXRz
IGl0IGFzIG9uZSAzMi1iaXQgcmVnaXN0ZXIuIEknbGwgY29uc2lkZXIgDQpjaGFuZ2luZyB0
aGUgY29kZSB0byBmb2xsb3cgdGhlIFBDSSBzcGVjLg0KDQpCZXN0IHJlZ2FyZHMNClRob21h
cw0KDQo+IA0KPj4gwqAgc3RhdGljIHZvaWQgYXN0X2RldGVjdF9jb25maWdfbW9kZShzdHJ1
Y3QgZHJtX2RldmljZSAqZGV2LCB1MzIgDQo+PiAqc2N1X3JldikNCj4+IMKgIHsNCj4+IMKg
wqDCoMKgwqAgc3RydWN0IGRldmljZV9ub2RlICpucCA9IGRldi0+ZGV2LT5vZl9ub2RlOw0K
Pj4gQEAgLTM5OSw2ICs0MTcsMTAgQEAgc3RydWN0IGFzdF9kZXZpY2UgKmFzdF9kZXZpY2Vf
Y3JlYXRlKGNvbnN0IHN0cnVjdCANCj4+IGRybV9kcml2ZXIgKmRydiwNCj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBFUlJfUFRSKC1FSU8pOw0KPj4gwqDCoMKgwqDC
oCB9DQo+PiArwqDCoMKgIHJldCA9IGFzdF9pbml0X3BjaV9jb25maWcocGRldik7DQo+PiAr
wqDCoMKgIGlmIChyZXQpDQo+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIEVSUl9QVFIocmV0
KTsNCj4+ICsNCj4+IMKgwqDCoMKgwqAgaWYgKCFhc3RfaXNfdmdhX2VuYWJsZWQoZGV2KSkg
ew0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGRybV9pbmZvKGRldiwgIlZHQSBub3QgZW5hYmxl
ZCBvbiBlbnRyeSwgcmVxdWVzdGluZyBjaGlwIA0KPj4gUE9TVFxuIik7DQo+PiDCoMKgwqDC
oMKgwqDCoMKgwqAgbmVlZF9wb3N0ID0gdHJ1ZTsNCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYXN0L2FzdF9wb3N0LmMgDQo+PiBiL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0
X3Bvc3QuYw0KPj4gaW5kZXggYWEzZjJjYjAwZjgyYy4uMmRhNWJkYjRiYWM0NSAxMDA2NDQN
Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X3Bvc3QuYw0KPj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FzdC9hc3RfcG9zdC5jDQo+PiBAQCAtMzYxLDEyICszNjEsNiBAQCBz
dGF0aWMgdm9pZCBhc3RfaW5pdF9kcmFtX3JlZyhzdHJ1Y3QgZHJtX2RldmljZSANCj4+ICpk
ZXYpDQo+PiDCoCB2b2lkIGFzdF9wb3N0X2dwdShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQ0K
Pj4gwqAgew0KPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgYXN0X2RldmljZSAqYXN0ID0gdG9fYXN0
X2RldmljZShkZXYpOw0KPj4gLcKgwqDCoCBzdHJ1Y3QgcGNpX2RldiAqcGRldiA9IHRvX3Bj
aV9kZXYoZGV2LT5kZXYpOw0KPj4gLcKgwqDCoCB1MzIgcmVnOw0KPj4gLQ0KPj4gLcKgwqDC
oCBwY2lfcmVhZF9jb25maWdfZHdvcmQocGRldiwgMHgwNCwgJnJlZyk7DQo+PiAtwqDCoMKg
IHJlZyB8PSAweDM7DQo+PiAtwqDCoMKgIHBjaV93cml0ZV9jb25maWdfZHdvcmQocGRldiwg
MHgwNCwgcmVnKTsNCj4+IMKgwqDCoMKgwqAgYXN0X2VuYWJsZV92Z2EoZGV2KTsNCj4+IMKg
wqDCoMKgwqAgYXN0X29wZW5fa2V5KGFzdCk7DQo+IA0KDQotLSANClRob21hcyBaaW1tZXJt
YW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9u
cyBHZXJtYW55IEdtYkgNCkZyYW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJnLCBH
ZXJtYW55DQpHRjogSXZvIFRvdGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFsZCwg
Qm91ZGllbiBNb2VybWFuDQpIUkIgMzY4MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------1N0Nl3aG2ZM9khja6IdwkLdM--

--------------PDWuOejtsUiTxrnjoV1Gjeqt
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSQDskFAwAAAAAACgkQlh/E3EQov+Dk
1Q/+LAi2kmuDRKp9QM2xPN8rsTerErtDzcu3Wp7a+JSkrjxzZYkK+tNsJwbSw9xXD5CcGN/yk/Tt
GFb8Ax1efS+mPBN3pOjMClVwHZpLC5QCSJfyfatCXcYr7DzcPUdyiK+3sVeYMZZDpYL8P4NDLcrf
Z3l4aqxk6apW9CI7Nc1OhU4TaIkH0mwAOH7zJyjj5GG+67gOZ3m+s/iAdZSu7xEjAbcgZ5ik8VGu
Sub9G8QNDseTfQ7MOCIkDjzt7ezHVbTaKXMHeoiex5Rk8wRZY3h2y6uHOvXwJF9ay0dVw6tEehec
UEua6bVFwfZIsJVSjaCJggnn633vOoVQA0StfQTkPHPkRFMP/G6+VQK6yijdwPsOqt6TRusq8ywd
WzzxtUvS6kbx4XPa7hRoMDdtxitC6gpHk34vqT4scHgN8RSiauTsfb2hJl4u+ZqAUMcMM//1Hgy8
V0SaDyl+l5KEMjfqCuNDgCPuh6s9ok6v2Tf500xDrAC4duERgdnwSO1LVGtG6MziNHSNxlCnvCCM
jbcjElPKevSLI71ZIx0uF+do1BiK0/B1ad26dKdHYKqil5j1mxusjmcgpm2hzzsmJHMk3FAEmeYa
D/jg6d7nVLH2qhPyaL2NedBQpRpOQ0G6RpruAUUnNHVl+3zepcZWRcOZYHz149F9XiS0xS6Xe+dc
7uU=
=31Ak
-----END PGP SIGNATURE-----

--------------PDWuOejtsUiTxrnjoV1Gjeqt--
