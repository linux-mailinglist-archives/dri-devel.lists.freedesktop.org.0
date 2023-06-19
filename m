Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A0F734D8C
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jun 2023 10:24:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16B3610E1B0;
	Mon, 19 Jun 2023 08:24:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20F0F10E1B0
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jun 2023 08:24:55 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B98AC2188D;
 Mon, 19 Jun 2023 08:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1687163093; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cujz/0NqamGDFUKkPxAdpaW17ovnaFXbZMnUnndJJBk=;
 b=y5np/M44Bpwi9jbITXHdcFpCedYA6R2XRBeAsrvjzp4kHkWK5tw/V8V3/6y9TCRcbUPUdW
 ZPSuOZ5a84Jpk6kiFA+NZQ9EJ7G481BrLUjqNqlIdYLH/omBDRfKeY4SIhR1Mf5lBhxH7W
 tapGqczmpxx8AowJMHodIViW8j7e2Hw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1687163093;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cujz/0NqamGDFUKkPxAdpaW17ovnaFXbZMnUnndJJBk=;
 b=h9JGGtl2OPqPymcG1pO42tR8xi8ipmpfiLTHaJWhy8dqEM/ULyyUDytsGjKCorpn0Viv4Q
 6Gd9H5yE1x2CNdCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9732A139C2;
 Mon, 19 Jun 2023 08:24:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Q1/EI9UQkGR2FAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 19 Jun 2023 08:24:53 +0000
Message-ID: <4c5d1d18-39c0-6c1c-2281-e4b36c8ab1c7@suse.de>
Date: Mon, 19 Jun 2023 10:24:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [06/14] drm/ast: Set PCI config before accessing I/O registers
Content-Language: en-US
To: Sui Jingfeng <suijingfeng@loongson.cn>, airlied@redhat.com,
 jfalempe@redhat.com, daniel@ffwll.ch, jammy_huang@aspeedtech.com
References: <20230616140739.32042-7-tzimmermann@suse.de>
 <0eec8603-bdd3-a060-b9cf-f44dfd449581@loongson.cn>
 <8be5e2e9-92a7-1bbe-e768-78d38eda5854@suse.de>
 <411abb62-6c80-b42f-54ce-895b863499f9@loongson.cn>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <411abb62-6c80-b42f-54ce-895b863499f9@loongson.cn>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------4vqOOTtIa9vndE5Ayfvh3gki"
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
--------------4vqOOTtIa9vndE5Ayfvh3gki
Content-Type: multipart/mixed; boundary="------------GYKPrq5YWrghg0ntUWuIhOcy";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sui Jingfeng <suijingfeng@loongson.cn>, airlied@redhat.com,
 jfalempe@redhat.com, daniel@ffwll.ch, jammy_huang@aspeedtech.com
Cc: dri-devel@lists.freedesktop.org
Message-ID: <4c5d1d18-39c0-6c1c-2281-e4b36c8ab1c7@suse.de>
Subject: Re: [06/14] drm/ast: Set PCI config before accessing I/O registers
References: <20230616140739.32042-7-tzimmermann@suse.de>
 <0eec8603-bdd3-a060-b9cf-f44dfd449581@loongson.cn>
 <8be5e2e9-92a7-1bbe-e768-78d38eda5854@suse.de>
 <411abb62-6c80-b42f-54ce-895b863499f9@loongson.cn>
In-Reply-To: <411abb62-6c80-b42f-54ce-895b863499f9@loongson.cn>

--------------GYKPrq5YWrghg0ntUWuIhOcy
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTkuMDYuMjMgdW0gMTA6MTkgc2NocmllYiBTdWkgSmluZ2Zlbmc6DQo+IEhp
LA0KPiANCj4gT24gMjAyMy82LzE5IDE1OjU5LCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToN
Cj4+IEhpDQo+Pg0KPj4gQW0gMTcuMDYuMjMgdW0gMTA6MDEgc2NocmllYiBTdWkgSmluZ2Zl
bmc6DQo+Pj4NCj4+PiBPbiAyMDIzLzYvMTYgMjE6NTIsIFRob21hcyBaaW1tZXJtYW5uIHdy
b3RlOg0KPj4+PiBBY2Nlc3MgdG8gSS9PIHJlZ2lzdGVycyBpcyByZXF1aXJlZCB0byBkZXRl
Y3QgYW5kIHNldCB1cCB0aGUNCj4+Pj4gZGV2aWNlLiBFbmFibGUgdGhlIHJzcCBQQ0kgY29u
ZmlnIGJpdHMgYmVmb3JlLiBXaGlsZSBhdCBpdCwNCj4+Pj4gY29udmVydCB0aGUgbWFnaWMg
bnVtYmVyIHRvIG1hY3JvIGNvbnN0YW50cy4NCj4+Pj4NCj4+Pj4gRW5hYmxpbmcgdGhlIFBD
SSBjb25maWcgYml0cyB3YXMgZG9uZSBhZnRlciB0cnlpbmcgdG8gZGV0ZWN0DQo+Pj4+IHRo
ZSBkZXZpY2UuIEl0IHdhcyBwcm9iYWJseSB0b28gbGF0ZSBhdCB0aGlzIHBvaW50Lg0KPj4+
Pg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5A
c3VzZS5kZT4NCj4+Pj4gLS0tDQo+Pj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X2Ry
di5owqAgfMKgIDIgKysNCj4+Pj4gwqAgZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbWFpbi5j
IHwgMjIgKysrKysrKysrKysrKysrKysrKysrKw0KPj4+PiDCoCBkcml2ZXJzL2dwdS9kcm0v
YXN0L2FzdF9wb3N0LmMgfMKgIDYgLS0tLS0tDQo+Pj4+IMKgIDMgZmlsZXMgY2hhbmdlZCwg
MjQgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCj4+Pj4NCj4+Pj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X2Rydi5oIA0KPj4+PiBiL2RyaXZlcnMvZ3B1
L2RybS9hc3QvYXN0X2Rydi5oDQo+Pj4+IGluZGV4IDAxNDE3MDViZWFlZTkuLjU1NWEwODUw
OTU3ZjMgMTAwNjQ0DQo+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X2Rydi5o
DQo+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X2Rydi5oDQo+Pj4+IEBAIC01
Miw2ICs1Miw4IEBADQo+Pj4+IMKgICNkZWZpbmUgUENJX0NISVBfQVNUMjAwMCAweDIwMDAN
Cj4+Pj4gwqAgI2RlZmluZSBQQ0lfQ0hJUF9BU1QyMTAwIDB4MjAxMA0KPj4+PiArI2RlZmlu
ZSBBU1RfUENJX09QVElPTl9NRU1fQUNDRVNTX0VOQUJMRcKgwqDCoCBCSVQoMSkNCj4+Pj4g
KyNkZWZpbmUgQVNUX1BDSV9PUFRJT05fSU9fQUNDRVNTX0VOQUJMRcKgwqDCoMKgwqDCoMKg
IEJJVCgwKQ0KPj4+PiDCoCBlbnVtIGFzdF9jaGlwIHsNCj4+Pj4gwqDCoMKgwqDCoCBBU1Qy
MDAwLA0KPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbWFpbi5j
IA0KPj4+PiBiL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21haW4uYw0KPj4+PiBpbmRleCBj
Njk4N2UwNDQ2NjE4Li5mZTA1NDczOWI0OTRhIDEwMDY0NA0KPj4+PiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYXN0L2FzdF9tYWluLmMNCj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Fz
dC9hc3RfbWFpbi5jDQo+Pj4+IEBAIC0zNSw2ICszNSwyNCBAQA0KPj4+PiDCoCAjaW5jbHVk
ZSAiYXN0X2Rydi5oIg0KPj4+PiArc3RhdGljIGludCBhc3RfaW5pdF9wY2lfY29uZmlnKHN0
cnVjdCBwY2lfZGV2ICpwZGV2KQ0KPj4+PiArew0KPj4+PiArwqDCoMKgIGludCBlcnI7DQo+
Pj4+ICvCoMKgwqAgdTMyIHBjaXMwNDsNCj4+Pj4gKw0KPj4+PiArwqDCoMKgIGVyciA9IHBj
aV9yZWFkX2NvbmZpZ19kd29yZChwZGV2LCAweDA0LCAmcGNpczA0KTsNCj4+Pg0KPj4+IFRo
ZSB0aGlyZCBhcmd1bWVudCBvZiBwY2lfcmVhZF9jb25maWdfZHdvcmQoKSBmdW5jdGlvbiBz
aG91bGQgYmUgJ3UxNiANCj4+PiAqJyB0eXBlOw0KPj4NCj4+IE5vLCBhIGR3b3JkIGlzIGEg
MzItYml0IGludGVnZXIuDQo+Pg0KPiBZZXMsIHlvdSBhcmUgcmlnaHQuDQo+IA0KPiAndTMy
JyBpcyBmb3IgdGhlIHBjaV9yZWFkX2NvbmZpZ19kd29yZCgpIGZ1bmN0aW9uLg0KPiANCj4g
SSdtIHJlY29tbWVuZCB5b3UgdG8gdXNlIHRoZSBwY2lfcmVhZF9jb25maWdfd29yZCgpIGZ1
bmN0aW9uLg0KPiANCj4gU29ycnkgZm9yIHRoZSBub2lzZS4NCg0KTm8gcHJvYmxlbSwgcGxl
YXNlIHNlZSBteSBvdGhlciByZXBseS4gVGhlIFBDSSBhbmQgYXN0IHNwZWNzIGRpc2FncmVl
IGEgDQpiaXQuIEknbSBjb25zaWRlcmluZyB0byBjaGFuZ2UgdGhpcyB0byB0aGUgMTYtYml0
IGFjY2Vzcy4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4+Pg0KPj4+DQo+Pj4+
ICvCoMKgwqAgaWYgKGVycikNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGdvdG8gb3V0Ow0KPj4+
PiArDQo+Pj4+ICvCoMKgwqAgcGNpczA0IHw9IEFTVF9QQ0lfT1BUSU9OX01FTV9BQ0NFU1Nf
RU5BQkxFIHwNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoCBBU1RfUENJX09QVElPTl9JT19B
Q0NFU1NfRU5BQkxFOw0KPj4+PiArDQo+Pj4+ICvCoMKgwqAgZXJyID0gcGNpX3dyaXRlX2Nv
bmZpZ19kd29yZChwZGV2LCAweDA0LCBwY2lzMDQpOw0KPj4+PiArDQo+Pj4+ICtvdXQ6DQo+
Pj4+ICvCoMKgwqAgcmV0dXJuIHBjaWJpb3NfZXJyX3RvX2Vycm5vKGVycik7DQo+Pj4+ICt9
DQo+Pj4NCj4+Pg0KPj4+IHN0YXRpYyB2b2lkIGFzdF9lbmFibGVfbWVtX2lvKHN0cnVjdCBw
Y2lfZGV2ICpwZGV2KQ0KPj4+IHsNCj4+PiDCoMKgwqAgwqB1MTYgY21kOw0KPj4+DQo+Pj4g
wqDCoMKgIMKgcGNpX3JlYWRfY29uZmlnX3dvcmQocGRldiwgUENJX0NPTU1BTkQsICZjbWQp
Ow0KPj4+DQo+Pj4gwqDCoMKgIMKgY21kIHw9IFBDSV9DT01NQU5EX01FTU9SWSB8IFBDSV9D
T01NQU5EX0lPOw0KPj4+DQo+Pj4gwqDCoMKgIMKgcGNpX3dyaXRlX2NvbmZpZ193b3JkKHBk
ZXYsIFBDSV9DT01NQU5ELCAmY21kKTsNCj4+PiB9DQo+Pj4NCj4+Pj4gwqAgc3RhdGljIHZv
aWQgYXN0X2RldGVjdF9jb25maWdfbW9kZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB1MzIg
DQo+Pj4+ICpzY3VfcmV2KQ0KPj4+PiDCoCB7DQo+Pj4+IMKgwqDCoMKgwqAgc3RydWN0IGRl
dmljZV9ub2RlICpucCA9IGRldi0+ZGV2LT5vZl9ub2RlOw0KPj4+PiBAQCAtMzk5LDYgKzQx
NywxMCBAQCBzdHJ1Y3QgYXN0X2RldmljZSAqYXN0X2RldmljZV9jcmVhdGUoY29uc3QgDQo+
Pj4+IHN0cnVjdCBkcm1fZHJpdmVyICpkcnYsDQo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHJldHVybiBFUlJfUFRSKC1FSU8pOw0KPj4+PiDCoMKgwqDCoMKgIH0NCj4+Pj4g
K8KgwqDCoCByZXQgPSBhc3RfaW5pdF9wY2lfY29uZmlnKHBkZXYpOw0KPj4+PiArwqDCoMKg
IGlmIChyZXQpDQo+Pj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gRVJSX1BUUihyZXQpOw0K
Pj4+PiArDQo+Pj4+IMKgwqDCoMKgwqAgaWYgKCFhc3RfaXNfdmdhX2VuYWJsZWQoZGV2KSkg
ew0KPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZHJtX2luZm8oZGV2LCAiVkdBIG5vdCBlbmFi
bGVkIG9uIGVudHJ5LCByZXF1ZXN0aW5nIGNoaXAgDQo+Pj4+IFBPU1RcbiIpOw0KPj4+PiDC
oMKgwqDCoMKgwqDCoMKgwqAgbmVlZF9wb3N0ID0gdHJ1ZTsNCj4+Pj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X3Bvc3QuYyANCj4+Pj4gYi9kcml2ZXJzL2dwdS9k
cm0vYXN0L2FzdF9wb3N0LmMNCj4+Pj4gaW5kZXggYWEzZjJjYjAwZjgyYy4uMmRhNWJkYjRi
YWM0NSAxMDA2NDQNCj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfcG9zdC5j
DQo+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X3Bvc3QuYw0KPj4+PiBAQCAt
MzYxLDEyICszNjEsNiBAQCBzdGF0aWMgdm9pZCBhc3RfaW5pdF9kcmFtX3JlZyhzdHJ1Y3Qg
ZHJtX2RldmljZSANCj4+Pj4gKmRldikNCj4+Pj4gwqAgdm9pZCBhc3RfcG9zdF9ncHUoc3Ry
dWN0IGRybV9kZXZpY2UgKmRldikNCj4+Pj4gwqAgew0KPj4+PiDCoMKgwqDCoMKgIHN0cnVj
dCBhc3RfZGV2aWNlICphc3QgPSB0b19hc3RfZGV2aWNlKGRldik7DQo+Pj4+IC3CoMKgwqAg
c3RydWN0IHBjaV9kZXYgKnBkZXYgPSB0b19wY2lfZGV2KGRldi0+ZGV2KTsNCj4+Pj4gLcKg
wqDCoCB1MzIgcmVnOw0KPj4+PiAtDQo+Pj4+IC3CoMKgwqAgcGNpX3JlYWRfY29uZmlnX2R3
b3JkKHBkZXYsIDB4MDQsICZyZWcpOw0KPj4+PiAtwqDCoMKgIHJlZyB8PSAweDM7DQo+Pj4+
IC3CoMKgwqAgcGNpX3dyaXRlX2NvbmZpZ19kd29yZChwZGV2LCAweDA0LCByZWcpOw0KPj4+
PiDCoMKgwqDCoMKgIGFzdF9lbmFibGVfdmdhKGRldik7DQo+Pj4+IMKgwqDCoMKgwqAgYXN0
X29wZW5fa2V5KGFzdCk7DQo+Pj4NCj4+DQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdy
YXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1h
bnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkN
CkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVu
IE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K

--------------GYKPrq5YWrghg0ntUWuIhOcy--

--------------4vqOOTtIa9vndE5Ayfvh3gki
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSQENQFAwAAAAAACgkQlh/E3EQov+Dy
VQ/+Icow81fxy0jU54LyrrMY3y41BqKayaUtuojqIcY8ncsHOq9645nj+920IQtlSyoWAxAP+DlQ
GaQ9+xw68Jn4uGQC5QVI1rpdSashP8vUgrpRtOHn5tvizZr0IEWZ+uRWHGPGDtTRL83Fh6FLTfSX
1oRNTQ4yOQzo2Drp8DIJWSQLZCVXfk+7Q3ZFm8UV6sLFGmQQRZc0e/BoMB5INJejypsc9yipC0nH
+k7cBGAu3g9krjiP1kob1n5xRKsnrZrL58JfwISk+PQYzpJG2nzVQTmiW6mw1fi8tPV+ovBmjslt
tQUK3F5+hTSI8/ULT0eJkzyegnUxF32VcU6QgQdfMrvGbJKtYXGPywuf1cO0x1S8a0wfFbL6oTS2
8t11Xcu1SvNqf6LP7RbAjLoAn4fAG7KT3mm0UahBRpc3DQzygrv2UcnX8kA09Nolh6Ye2cUtyOBO
ThRuBchRA38ClKNnSqDepkuD/Rscubh2KKgaCutbYDZ5oFHZeIXffqJ4mpxN208TzohrTgmZ8QJC
taIM+elnrBBYN7dTbyaF8UQGsk+aZyDc6tOtxcWwnIiGuN34gHbHxfC/leIoKRZnNrHzKuILLi2F
9opMj5tnyqvzwDM59FmHptrOA/B98d0thoSDljttvhX21wOX+HUXnAmLoZ6JW6J09snja5H5+Dfh
c5o=
=ieZ5
-----END PGP SIGNATURE-----

--------------4vqOOTtIa9vndE5Ayfvh3gki--
