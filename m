Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF1C640613
	for <lists+dri-devel@lfdr.de>; Fri,  2 Dec 2022 12:50:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A558E10E0E3;
	Fri,  2 Dec 2022 11:50:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BAF510E0E3
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Dec 2022 11:50:40 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 78DD421C23;
 Fri,  2 Dec 2022 11:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1669981838; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4lLQ8rCftxe1uiexJU58/Bmp5PZ/x4JZykjDfyY4E5M=;
 b=QtXgifW2HJWxZ8No466/iIdhkLXQ3bWkkLBjSCkBjCha3lNt2JhAgHKnqjJUw6Ybxe0t3m
 20ZSiXiEAy6mm+yhtloHsTfqZ2o7OJKCAfVJgQ4abNQ7/LmDi2F+j1GXVC3OMuoGWxy2AT
 cFfZojKXqBhVFodNy+YV94GhVmtUyr0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1669981838;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4lLQ8rCftxe1uiexJU58/Bmp5PZ/x4JZykjDfyY4E5M=;
 b=Wuss4bmD/sVmcLP29AuFkraNBnVGq2KYksE1RdWq6TPlLGgrLu7hR+M4UcpMHfT5KKlnua
 kmPcqxM1KkgoYnDw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 3836D13644;
 Fri,  2 Dec 2022 11:50:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id m6hnDI7miWNPGQAAGKfGzw
 (envelope-from <tzimmermann@suse.de>); Fri, 02 Dec 2022 11:50:38 +0000
Message-ID: <7916346d-a3bb-3027-6598-ea6455b6a81b@suse.de>
Date: Fri, 2 Dec 2022 12:50:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 5/8] drm/mipi-dbi: Prepare framebuffer copy operation in
 pipe-update helpers
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 thierry.reding@gmail.com, sam@ravnborg.org, emma@anholt.net,
 david@lechnology.com, kamlesh.gurudasani@gmail.com, javierm@redhat.com
References: <20221121104532.8301-1-tzimmermann@suse.de>
 <20221121104532.8301-6-tzimmermann@suse.de>
 <4e1b19de-04b1-3fa5-6aaa-72a4ad694b64@tronnes.org>
 <9b42a348-bad0-2615-8690-b7973375af02@suse.de>
In-Reply-To: <9b42a348-bad0-2615-8690-b7973375af02@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------EfsmymUDKZjVLi7z0ya4ftcc"
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
--------------EfsmymUDKZjVLi7z0ya4ftcc
Content-Type: multipart/mixed; boundary="------------h6d0PIVo0EnidjlidrP702J7";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, daniel@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 thierry.reding@gmail.com, sam@ravnborg.org, emma@anholt.net,
 david@lechnology.com, kamlesh.gurudasani@gmail.com, javierm@redhat.com
Cc: dri-devel@lists.freedesktop.org
Message-ID: <7916346d-a3bb-3027-6598-ea6455b6a81b@suse.de>
Subject: Re: [PATCH 5/8] drm/mipi-dbi: Prepare framebuffer copy operation in
 pipe-update helpers
References: <20221121104532.8301-1-tzimmermann@suse.de>
 <20221121104532.8301-6-tzimmermann@suse.de>
 <4e1b19de-04b1-3fa5-6aaa-72a4ad694b64@tronnes.org>
 <9b42a348-bad0-2615-8690-b7973375af02@suse.de>
In-Reply-To: <9b42a348-bad0-2615-8690-b7973375af02@suse.de>

--------------h6d0PIVo0EnidjlidrP702J7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQo+Pg0KPj4gWW91IHVzZSBkcm1fZ2VtX2ZiX3ZtYXAoKSBpbiB0aGUgb3RoZXIgcGxhY2Vz
IGJ1dCBoZXJlIHlvdSBhY2Nlc3MgdGhlDQo+PiBvYmplY3QgZGlyZWN0bHkgKGFuZCBpbiB0
aGUgbmV4dCBodW5rKSwgYnV0IGFnYWluIG5vdCBzbyBpbXBvcnRhbnQgc2luY2UNCj4+IGl0
IGdvZXMgYXdheSBpbiBhIGxhdGVyIHBhdGNoLg0KPiANCj4gSSdsbCB1cGRhdGUgdGhpcyBw
YXRjaCB0byB1c2UgZHJtX2dlbV9mYl92bWFwKCkgY29uc2lzdGVudGx5Lg0KDQpBbmQgYWZ0
ZXIgbG9va2luZyBhdCB0aGUgaW1wYWN0IGFuZCBjaHVybiwgSSByYXRoZXIgZ28gd2l0aCB0
aGUgZXhpc3RpbmcgDQpjb2RlIHRoYXQgaW5pdGlhbGl6ZXMgZnJvbSB0aGUgR0VNIERNQSBv
YmplY3QuDQoNCk5vcmFsZiwgaXMgdGhlcmUgYSByZWFzb24gd2h5IG1vc3Qgb2YgTUlQSSBE
QkkgdXNlcyBETUEgaGVscGVycz8gSW4gDQp0ZXJtcyBvZiBmbGV4aWJpbGl0eSBhbmQgcmVz
b3VyY2UgY29uc3VtcHRpb24sIHdvdWxkbid0IFNITUVNIGhlbHBlcnMgYmUgDQphIGJldHRl
ciBmaXQ/DQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+Pg0KPj4gV2l0aCB0aGUg
Y29tbWVudHMgY29uc2lkZXJlZDoNCj4+DQo+PiBSZXZpZXdlZC1ieTogTm9yYWxmIFRyw7hu
bmVzIDxub3JhbGZAdHJvbm5lcy5vcmc+DQo+IA0KPiBUaGFua3MuDQo+IA0KPiBCZXN0IHJl
Z2FyZHMNCj4gVGhvbWFzDQo+IA0KPj4NCj4+PiDCoMKgwqDCoMKgIGlmIChkcm1fYXRvbWlj
X2hlbHBlcl9kYW1hZ2VfbWVyZ2VkKG9sZF9zdGF0ZSwgc3RhdGUsICZyZWN0KSkNCj4+PiAt
wqDCoMKgwqDCoMKgwqAgc3Q3NTg2X2ZiX2RpcnR5KHN0YXRlLT5mYiwgJnJlY3QpOw0KPj4+
ICvCoMKgwqDCoMKgwqDCoCBzdDc1ODZfZmJfZGlydHkoJnNyYywgZmIsICZyZWN0KTsNCj4+
PiDCoCB9DQo+Pj4gwqAgc3RhdGljIHZvaWQgc3Q3NTg2X3BpcGVfZW5hYmxlKHN0cnVjdCBk
cm1fc2ltcGxlX2Rpc3BsYXlfcGlwZSAqcGlwZSwNCj4+PiBAQCAtMTc2LDYgKzE4MSw4IEBA
IHN0YXRpYyB2b2lkIHN0NzU4Nl9waXBlX2VuYWJsZShzdHJ1Y3QgDQo+Pj4gZHJtX3NpbXBs
ZV9kaXNwbGF5X3BpcGUgKnBpcGUsDQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIC55MSA9IDAs
DQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIC55MiA9IGZiLT5oZWlnaHQsDQo+Pj4gwqDCoMKg
wqDCoCB9Ow0KPj4+ICvCoMKgwqAgc3RydWN0IGRybV9nZW1fZG1hX29iamVjdCAqZG1hX29i
ajsNCj4+PiArwqDCoMKgIHN0cnVjdCBpb3N5c19tYXAgc3JjOw0KPj4+IMKgwqDCoMKgwqAg
aW50IGlkeCwgcmV0Ow0KPj4+IMKgwqDCoMKgwqAgdTggYWRkcl9tb2RlOw0KPj4+IEBAIC0y
MzUsNyArMjQyLDEwIEBAIHN0YXRpYyB2b2lkIHN0NzU4Nl9waXBlX2VuYWJsZShzdHJ1Y3Qg
DQo+Pj4gZHJtX3NpbXBsZV9kaXNwbGF5X3BpcGUgKnBpcGUsDQo+Pj4gwqDCoMKgwqDCoCBt
c2xlZXAoMTAwKTsNCj4+PiAtwqDCoMKgIHN0NzU4Nl9mYl9kaXJ0eShmYiwgJnJlY3QpOw0K
Pj4+ICvCoMKgwqAgZG1hX29iaiA9IGRybV9mYl9kbWFfZ2V0X2dlbV9vYmooZmIsIDApOw0K
Pj4+ICvCoMKgwqAgaW9zeXNfbWFwX3NldF92YWRkcigmc3JjLCBkbWFfb2JqLT52YWRkcik7
DQo+Pj4gKw0KPj4+ICvCoMKgwqAgc3Q3NTg2X2ZiX2RpcnR5KCZzcmMsIGZiLCAmcmVjdCk7
DQo+Pj4gwqDCoMKgwqDCoCBtaXBpX2RiaV9jb21tYW5kKGRiaSwgTUlQSV9EQ1NfU0VUX0RJ
U1BMQVlfT04pOw0KPj4+IMKgIG91dF9leGl0Og0KPj4+IGRpZmYgLS1naXQgYS9pbmNsdWRl
L2RybS9kcm1fbWlwaV9kYmkuaCBiL2luY2x1ZGUvZHJtL2RybV9taXBpX2RiaS5oDQo+Pj4g
aW5kZXggOGM0ZWE3OTU2ZDYxZC4uMzZhYzg0OTU1NjZiMCAxMDA2NDQNCj4+PiAtLS0gYS9p
bmNsdWRlL2RybS9kcm1fbWlwaV9kYmkuaA0KPj4+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9t
aXBpX2RiaS5oDQo+Pj4gQEAgLTEzLDkgKzEzLDEwIEBADQo+Pj4gwqAgI2luY2x1ZGUgPGRy
bS9kcm1fc2ltcGxlX2ttc19oZWxwZXIuaD4NCj4+PiDCoCBzdHJ1Y3QgZHJtX3JlY3Q7DQo+
Pj4gLXN0cnVjdCBzcGlfZGV2aWNlOw0KPj4+IMKgIHN0cnVjdCBncGlvX2Rlc2M7DQo+Pj4g
K3N0cnVjdCBpb3N5c19tYXA7DQo+Pj4gwqAgc3RydWN0IHJlZ3VsYXRvcjsNCj4+PiArc3Ry
dWN0IHNwaV9kZXZpY2U7DQo+Pj4gwqAgLyoqDQo+Pj4gwqDCoCAqIHN0cnVjdCBtaXBpX2Ri
aSAtIE1JUEkgREJJIGludGVyZmFjZQ0KPj4+IEBAIC0xNzYsOCArMTc3LDkgQEAgaW50IG1p
cGlfZGJpX2NvbW1hbmRfcmVhZChzdHJ1Y3QgbWlwaV9kYmkgKmRiaSwgDQo+Pj4gdTggY21k
LCB1OCAqdmFsKTsNCj4+PiDCoCBpbnQgbWlwaV9kYmlfY29tbWFuZF9idWYoc3RydWN0IG1p
cGlfZGJpICpkYmksIHU4IGNtZCwgdTggKmRhdGEsIA0KPj4+IHNpemVfdCBsZW4pOw0KPj4+
IMKgIGludCBtaXBpX2RiaV9jb21tYW5kX3N0YWNrYnVmKHN0cnVjdCBtaXBpX2RiaSAqZGJp
LCB1OCBjbWQsIGNvbnN0IA0KPj4+IHU4ICpkYXRhLA0KPj4+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNpemVfdCBsZW4pOw0KPj4+IC1pbnQgbWlwaV9kYmlf
YnVmX2NvcHkodm9pZCAqZHN0LCBzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYiwNCj4+PiAr
aW50IG1pcGlfZGJpX2J1Zl9jb3B5KHZvaWQgKmRzdCwgc3RydWN0IGlvc3lzX21hcCAqc3Jj
LCBzdHJ1Y3QgDQo+Pj4gZHJtX2ZyYW1lYnVmZmVyICpmYiwNCj4+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGRybV9yZWN0ICpjbGlwLCBib29sIHN3YXApOw0K
Pj4+ICsNCj4+PiDCoCAvKioNCj4+PiDCoMKgICogbWlwaV9kYmlfY29tbWFuZCAtIE1JUEkg
RENTIGNvbW1hbmQgd2l0aCBvcHRpb25hbCBwYXJhbWV0ZXIocykNCj4+PiDCoMKgICogQGRi
aTogTUlQSSBEQkkgc3RydWN0dXJlDQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpH
cmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJt
YW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhS
QiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K


--------------h6d0PIVo0EnidjlidrP702J7--

--------------EfsmymUDKZjVLi7z0ya4ftcc
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmOJ5o0FAwAAAAAACgkQlh/E3EQov+Bv
XBAAi618Uuz5jLhB2/4doU1OaHxS3JkzD2YC55iMWSnqcaSRk50u/9dnym8JBMWgKj3Kr372gF39
Z8A6B0UUka9Qx4AN891DBdcwe95izhTxd0lojlz08bHwkBsBbkUCXW1gHlRyUaOHCiheVjHb/DVI
20jZTOhJcV51rI9dFKNNYlyuCvByci7nNW8HwQLJon1feuzLYJnJ8Jg5x4xi82LpUisZ4g1JXhL0
Qn2siCDpRfku04cd8fkNaEBCGBODkK1hcsDk03T9Rq+DdP3rPK8Supth4sm9Vv8o5G7aPzN+KcMN
ITCkCYJvXNnnXqK8uoaZPkQXyA11/EdYR2Iv+hfFGWacRezj5/0vGOnMBSu4CGz43WvdRsSoBpxg
V9JDyPaYjtMU6SMw6HR8aGXQ38wflm5TaygVrQHWjY2o6sY0VZPE44gscCB0rztYDn39+/o0zygb
2i8WN39/IpA6mwdxo3Uig5H9vlcDidYRRy1CIv28dDVGyGroPRZ37MfQFIwHrwd0UsL8vMBVyRyo
av91DtiTLMXdxIUQgq8WtDkNP6fWwhprs9tcPVhjKRzmiuTY9duDevDHStGjMorIurzTXjD72uG0
PMSFb+uq3F+Yb4trdtioiu6yamYatTH6mjMupqQ1qqkhWfMKP0VYUgHAB/9OJR+sqHjm6oTrRZjR
wfg=
=fbZ7
-----END PGP SIGNATURE-----

--------------EfsmymUDKZjVLi7z0ya4ftcc--
