Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C210B734CE1
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 09:59:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1828F10E19E;
	Mon, 19 Jun 2023 07:59:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F85510E19E
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 07:59:15 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 8A86D1F38A;
 Mon, 19 Jun 2023 07:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1687161552; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dbIGMUHZ278Tp8slKchKKMJCMLyvA3pNUrUUkxX2YKE=;
 b=IQPcf3QewCiFH7vH8+Cj8RkRTmi+qtQok0SBRDI+MN5pn0ktludj32KCXBpqneorJ0hA/V
 cKJX0jtIxJrpCB8WcmwWvT0MtISqmGqjYQS5bT+Id4JGx1AAGzxeKhBOqldBjTJd4i9X0N
 FWwUh38CasnEUhxvXP1RtTZbwMEvO1c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1687161552;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dbIGMUHZ278Tp8slKchKKMJCMLyvA3pNUrUUkxX2YKE=;
 b=XEIPw3Y2uROOlw3pB9qT3KI4TpZVwYAjVPGt7mSjgAOG7NEwW1lbPAzmRyjhuqIZ8mxgMH
 rGkD4YHMczrPAjBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 65296139C2;
 Mon, 19 Jun 2023 07:59:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id AnC0F9AKkGQlCAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 19 Jun 2023 07:59:12 +0000
Message-ID: <8be5e2e9-92a7-1bbe-e768-78d38eda5854@suse.de>
Date: Mon, 19 Jun 2023 09:59:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [06/14] drm/ast: Set PCI config before accessing I/O registers
Content-Language: en-US
To: Sui Jingfeng <suijingfeng@loongson.cn>, airlied@redhat.com,
 jfalempe@redhat.com, daniel@ffwll.ch, jammy_huang@aspeedtech.com
References: <20230616140739.32042-7-tzimmermann@suse.de>
 <0eec8603-bdd3-a060-b9cf-f44dfd449581@loongson.cn>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <0eec8603-bdd3-a060-b9cf-f44dfd449581@loongson.cn>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------2RCcH1cz66FZWcbP3U9lWL0A"
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
--------------2RCcH1cz66FZWcbP3U9lWL0A
Content-Type: multipart/mixed; boundary="------------Mt5dHChhS8PPadl9YSrI4j1S";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sui Jingfeng <suijingfeng@loongson.cn>, airlied@redhat.com,
 jfalempe@redhat.com, daniel@ffwll.ch, jammy_huang@aspeedtech.com
Cc: dri-devel@lists.freedesktop.org
Message-ID: <8be5e2e9-92a7-1bbe-e768-78d38eda5854@suse.de>
Subject: Re: [06/14] drm/ast: Set PCI config before accessing I/O registers
References: <20230616140739.32042-7-tzimmermann@suse.de>
 <0eec8603-bdd3-a060-b9cf-f44dfd449581@loongson.cn>
In-Reply-To: <0eec8603-bdd3-a060-b9cf-f44dfd449581@loongson.cn>

--------------Mt5dHChhS8PPadl9YSrI4j1S
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTcuMDYuMjMgdW0gMTA6MDEgc2NocmllYiBTdWkgSmluZ2Zlbmc6DQo+IA0K
PiBPbiAyMDIzLzYvMTYgMjE6NTIsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4gQWNj
ZXNzIHRvIEkvTyByZWdpc3RlcnMgaXMgcmVxdWlyZWQgdG8gZGV0ZWN0IGFuZCBzZXQgdXAg
dGhlDQo+PiBkZXZpY2UuIEVuYWJsZSB0aGUgcnNwIFBDSSBjb25maWcgYml0cyBiZWZvcmUu
IFdoaWxlIGF0IGl0LA0KPj4gY29udmVydCB0aGUgbWFnaWMgbnVtYmVyIHRvIG1hY3JvIGNv
bnN0YW50cy4NCj4+DQo+PiBFbmFibGluZyB0aGUgUENJIGNvbmZpZyBiaXRzIHdhcyBkb25l
IGFmdGVyIHRyeWluZyB0byBkZXRlY3QNCj4+IHRoZSBkZXZpY2UuIEl0IHdhcyBwcm9iYWJs
eSB0b28gbGF0ZSBhdCB0aGlzIHBvaW50Lg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFRob21h
cyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPj4gLS0tDQo+PiDCoCBkcml2
ZXJzL2dwdS9kcm0vYXN0L2FzdF9kcnYuaMKgIHzCoCAyICsrDQo+PiDCoCBkcml2ZXJzL2dw
dS9kcm0vYXN0L2FzdF9tYWluLmMgfCAyMiArKysrKysrKysrKysrKysrKysrKysrDQo+PiDC
oCBkcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9wb3N0LmMgfMKgIDYgLS0tLS0tDQo+PiDCoCAz
IGZpbGVzIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pDQo+Pg0K
Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X2Rydi5oIA0KPj4gYi9k
cml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9kcnYuaA0KPj4gaW5kZXggMDE0MTcwNWJlYWVlOS4u
NTU1YTA4NTA5NTdmMyAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0
X2Rydi5oDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9kcnYuaA0KPj4gQEAg
LTUyLDYgKzUyLDggQEANCj4+IMKgICNkZWZpbmUgUENJX0NISVBfQVNUMjAwMCAweDIwMDAN
Cj4+IMKgICNkZWZpbmUgUENJX0NISVBfQVNUMjEwMCAweDIwMTANCj4+ICsjZGVmaW5lIEFT
VF9QQ0lfT1BUSU9OX01FTV9BQ0NFU1NfRU5BQkxFwqDCoMKgIEJJVCgxKQ0KPj4gKyNkZWZp
bmUgQVNUX1BDSV9PUFRJT05fSU9fQUNDRVNTX0VOQUJMRcKgwqDCoMKgwqDCoMKgIEJJVCgw
KQ0KPj4gwqAgZW51bSBhc3RfY2hpcCB7DQo+PiDCoMKgwqDCoMKgIEFTVDIwMDAsDQo+PiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbWFpbi5jIA0KPj4gYi9kcml2
ZXJzL2dwdS9kcm0vYXN0L2FzdF9tYWluLmMNCj4+IGluZGV4IGM2OTg3ZTA0NDY2MTguLmZl
MDU0NzM5YjQ5NGEgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9t
YWluLmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21haW4uYw0KPj4gQEAg
LTM1LDYgKzM1LDI0IEBADQo+PiDCoCAjaW5jbHVkZSAiYXN0X2Rydi5oIg0KPj4gK3N0YXRp
YyBpbnQgYXN0X2luaXRfcGNpX2NvbmZpZyhzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4+ICt7
DQo+PiArwqDCoMKgIGludCBlcnI7DQo+PiArwqDCoMKgIHUzMiBwY2lzMDQ7DQo+PiArDQo+
PiArwqDCoMKgIGVyciA9IHBjaV9yZWFkX2NvbmZpZ19kd29yZChwZGV2LCAweDA0LCAmcGNp
czA0KTsNCj4gDQo+IFRoZSB0aGlyZCBhcmd1bWVudCBvZiBwY2lfcmVhZF9jb25maWdfZHdv
cmQoKSBmdW5jdGlvbiBzaG91bGQgYmUgJ3UxNiAqJyANCj4gdHlwZTsNCg0KTm8sIGEgZHdv
cmQgaXMgYSAzMi1iaXQgaW50ZWdlci4NCg0KPiANCj4gDQo+PiArwqDCoMKgIGlmIChlcnIp
DQo+PiArwqDCoMKgwqDCoMKgwqAgZ290byBvdXQ7DQo+PiArDQo+PiArwqDCoMKgIHBjaXMw
NCB8PSBBU1RfUENJX09QVElPTl9NRU1fQUNDRVNTX0VOQUJMRSB8DQo+PiArwqDCoMKgwqDC
oMKgwqDCoMKgIEFTVF9QQ0lfT1BUSU9OX0lPX0FDQ0VTU19FTkFCTEU7DQo+PiArDQo+PiAr
wqDCoMKgIGVyciA9IHBjaV93cml0ZV9jb25maWdfZHdvcmQocGRldiwgMHgwNCwgcGNpczA0
KTsNCj4+ICsNCj4+ICtvdXQ6DQo+PiArwqDCoMKgIHJldHVybiBwY2liaW9zX2Vycl90b19l
cnJubyhlcnIpOw0KPj4gK30NCj4gDQo+IA0KPiBzdGF0aWMgdm9pZCBhc3RfZW5hYmxlX21l
bV9pbyhzdHJ1Y3QgcGNpX2RldiAqcGRldikNCj4gew0KPiAgwqDCoCDCoHUxNiBjbWQ7DQo+
IA0KPiAgwqDCoCDCoHBjaV9yZWFkX2NvbmZpZ193b3JkKHBkZXYsIFBDSV9DT01NQU5ELCAm
Y21kKTsNCj4gDQo+ICDCoMKgIMKgY21kIHw9IFBDSV9DT01NQU5EX01FTU9SWSB8IFBDSV9D
T01NQU5EX0lPOw0KPiANCj4gIMKgwqAgwqBwY2lfd3JpdGVfY29uZmlnX3dvcmQocGRldiwg
UENJX0NPTU1BTkQsICZjbWQpOw0KPiB9DQo+IA0KPj4gwqAgc3RhdGljIHZvaWQgYXN0X2Rl
dGVjdF9jb25maWdfbW9kZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB1MzIgDQo+PiAqc2N1
X3JldikNCj4+IMKgIHsNCj4+IMKgwqDCoMKgwqAgc3RydWN0IGRldmljZV9ub2RlICpucCA9
IGRldi0+ZGV2LT5vZl9ub2RlOw0KPj4gQEAgLTM5OSw2ICs0MTcsMTAgQEAgc3RydWN0IGFz
dF9kZXZpY2UgKmFzdF9kZXZpY2VfY3JlYXRlKGNvbnN0IHN0cnVjdCANCj4+IGRybV9kcml2
ZXIgKmRydiwNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBFUlJfUFRS
KC1FSU8pOw0KPj4gwqDCoMKgwqDCoCB9DQo+PiArwqDCoMKgIHJldCA9IGFzdF9pbml0X3Bj
aV9jb25maWcocGRldik7DQo+PiArwqDCoMKgIGlmIChyZXQpDQo+PiArwqDCoMKgwqDCoMKg
wqAgcmV0dXJuIEVSUl9QVFIocmV0KTsNCj4+ICsNCj4+IMKgwqDCoMKgwqAgaWYgKCFhc3Rf
aXNfdmdhX2VuYWJsZWQoZGV2KSkgew0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGRybV9pbmZv
KGRldiwgIlZHQSBub3QgZW5hYmxlZCBvbiBlbnRyeSwgcmVxdWVzdGluZyBjaGlwIA0KPj4g
UE9TVFxuIik7DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgbmVlZF9wb3N0ID0gdHJ1ZTsNCj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9wb3N0LmMgDQo+PiBiL2Ry
aXZlcnMvZ3B1L2RybS9hc3QvYXN0X3Bvc3QuYw0KPj4gaW5kZXggYWEzZjJjYjAwZjgyYy4u
MmRhNWJkYjRiYWM0NSAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0
X3Bvc3QuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfcG9zdC5jDQo+PiBA
QCAtMzYxLDEyICszNjEsNiBAQCBzdGF0aWMgdm9pZCBhc3RfaW5pdF9kcmFtX3JlZyhzdHJ1
Y3QgZHJtX2RldmljZSANCj4+ICpkZXYpDQo+PiDCoCB2b2lkIGFzdF9wb3N0X2dwdShzdHJ1
Y3QgZHJtX2RldmljZSAqZGV2KQ0KPj4gwqAgew0KPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgYXN0
X2RldmljZSAqYXN0ID0gdG9fYXN0X2RldmljZShkZXYpOw0KPj4gLcKgwqDCoCBzdHJ1Y3Qg
cGNpX2RldiAqcGRldiA9IHRvX3BjaV9kZXYoZGV2LT5kZXYpOw0KPj4gLcKgwqDCoCB1MzIg
cmVnOw0KPj4gLQ0KPj4gLcKgwqDCoCBwY2lfcmVhZF9jb25maWdfZHdvcmQocGRldiwgMHgw
NCwgJnJlZyk7DQo+PiAtwqDCoMKgIHJlZyB8PSAweDM7DQo+PiAtwqDCoMKgIHBjaV93cml0
ZV9jb25maWdfZHdvcmQocGRldiwgMHgwNCwgcmVnKTsNCj4+IMKgwqDCoMKgwqAgYXN0X2Vu
YWJsZV92Z2EoZGV2KTsNCj4+IMKgwqDCoMKgwqAgYXN0X29wZW5fa2V5KGFzdCk7DQo+IA0K
DQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpT
VVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCkZyYW5rZW5zdHJhc3NlIDE0
NiwgOTA0NjEgTnVlcm5iZXJnLCBHZXJtYW55DQpHRjogSXZvIFRvdGV2LCBBbmRyZXcgTXll
cnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGllbiBNb2VybWFuDQpIUkIgMzY4MDkgKEFHIE51
ZXJuYmVyZykNCg==

--------------Mt5dHChhS8PPadl9YSrI4j1S--

--------------2RCcH1cz66FZWcbP3U9lWL0A
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSQCs8FAwAAAAAACgkQlh/E3EQov+DF
9w/9GukQsc64otVp1UhiLdAFABqrjBukc34rHTklCnmMX//R4hTfCd9mI1fCRaLvbMbl4Db/IUCh
L/3/XgeVqA2ASILI1+NzKiOzS7r6eOsGoC1WSm6QB3Hx6UfnF9ZKlpseKhFQ5t5xCbubRHJATrc3
SPRXGne4KoVIT4eCOI0boJPqAOhUD5ewWMrG29p4MPZrJCC5ZK8PH6nHPunGcwMNDOAyH3+fi8ok
eowS0zx/JUza79Iq8JrGBD/qWLB9dK/NvcQoQ3SdsugvRrkUAGXdcaMGD7Jgb0QB4RGX0LugRveX
dh/FhVsbH8Lz+MvYaPDCh0jUJjFMX3mY+MxSMKT15S7YaqPOXTtfQDpHu4dYLVXcIWx3BXSBrSmz
8biXzs6DExQ5uLnlfylDORLqRdK+AvnScdVSA2EAbCZqaHt9xdeVY/khKrPcHeaN/85yFrLYKugj
k25bNc+wor4tZbKA4DsxWcibuGEQPnLJJILbaeQglfFvL1HWyzrqr6rOegBnAHTKpUX0OUTQpC8T
XdtQrTMLT7w4MHW4Pu+PqaXNyq4e95ZSVfwIYUj16SiOlSiPW2AEFulMrGWJYKE+GThy4wkTb4TR
RZ2iWWa6f4YXiXSTO2r8Qw6KEiYCNZVPre5HGYCRl6n1GOmUV8L42peJ/o8RPRV6REVhqma8R3dq
lp4=
=Nb8n
-----END PGP SIGNATURE-----

--------------2RCcH1cz66FZWcbP3U9lWL0A--
