Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC6460E086
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 14:21:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F27E010E4CB;
	Wed, 26 Oct 2022 12:21:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AE4910E36F
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 12:21:09 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1405A21FED;
 Wed, 26 Oct 2022 12:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1666786868; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sGOVoDIGR2+TlSrxkUQS8Jw4Hv+h0uy6jwuUyzH9JSM=;
 b=L1VK5rT/e5zB0PkD72PaZz2OY/Dp7YzuZhTwLUlTn9J2O1Vyeh2ZQYeuGvPSIFbmxKOlA9
 Uv5YTMScukOSQTSQwqsATJTFnpQYvC06bfm8F6lTfl6oG21zZ38oEcYyElA2gv19sCeANb
 b9RpO57i0v59RDaapex853y3jt+b1ic=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1666786868;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sGOVoDIGR2+TlSrxkUQS8Jw4Hv+h0uy6jwuUyzH9JSM=;
 b=IlK/whoso24CLRIlKgBECqTpgsnRaR+4BrHELE2SODwdfOUU6/dqzDA3kkNn14AJnKJMzI
 fbRsVzoTQ3ot+3Cg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DF4B413A77;
 Wed, 26 Oct 2022 12:21:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id e71yNTMmWWOUPgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 26 Oct 2022 12:21:07 +0000
Message-ID: <3d97ad87-535c-b2cd-c3f3-9cea140e9957@suse.de>
Date: Wed, 26 Oct 2022 14:21:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v3 1/7] drm/ivpu: Introduce a new DRM driver for Intel VPU
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel@ffwll.ch
References: <20220924151149.323622-1-jacek.lawrynowicz@linux.intel.com>
 <20220924151149.323622-2-jacek.lawrynowicz@linux.intel.com>
 <68171df1-1241-cd09-f3bf-12919828b868@quicinc.com>
 <d08ff59d-0a91-02bf-f08e-63b56e63df99@linux.intel.com>
 <c276b8c2-9639-37ff-9253-06cfa52d3fd7@suse.de>
 <73d2e8b4-6b31-4b7e-3b8a-0e60b2fd6a51@linux.intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <73d2e8b4-6b31-4b7e-3b8a-0e60b2fd6a51@linux.intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------iRPnWMd10v7vm6YPWcGxjsXX"
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
Cc: andrzej.kacprowski@linux.intel.com, stanislaw.gruszka@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------iRPnWMd10v7vm6YPWcGxjsXX
Content-Type: multipart/mixed; boundary="------------xAU1ErTNPwmchAUOn6FSVZBN";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel@ffwll.ch
Cc: andrzej.kacprowski@linux.intel.com, stanislaw.gruszka@linux.intel.com
Message-ID: <3d97ad87-535c-b2cd-c3f3-9cea140e9957@suse.de>
Subject: Re: [PATCH v3 1/7] drm/ivpu: Introduce a new DRM driver for Intel VPU
References: <20220924151149.323622-1-jacek.lawrynowicz@linux.intel.com>
 <20220924151149.323622-2-jacek.lawrynowicz@linux.intel.com>
 <68171df1-1241-cd09-f3bf-12919828b868@quicinc.com>
 <d08ff59d-0a91-02bf-f08e-63b56e63df99@linux.intel.com>
 <c276b8c2-9639-37ff-9253-06cfa52d3fd7@suse.de>
 <73d2e8b4-6b31-4b7e-3b8a-0e60b2fd6a51@linux.intel.com>
In-Reply-To: <73d2e8b4-6b31-4b7e-3b8a-0e60b2fd6a51@linux.intel.com>

--------------xAU1ErTNPwmchAUOn6FSVZBN
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjYuMTAuMjIgdW0gMTQ6MDcgc2NocmllYiBKYWNlayBMYXdyeW5vd2ljejoN
Cj4gSGksDQo+IA0KPiBPbiAxMC8yNS8yMDIyIDE6NTcgUE0sIFRob21hcyBaaW1tZXJtYW5u
IHdyb3RlOg0KPj4gSGkNCj4+DQo+PiBBbSAyNS4xMC4yMiB1bSAxMzo0MiBzY2hyaWViIEph
Y2VrIExhd3J5bm93aWN6Og0KPj4+IEhpLCB0aGFua3MgZm9yIGRldGFpbGVkIHJldmlldy4g
TXkgcmVzcG9uc2VzIGlubGluZS4NCj4+Pg0KPj4+IE9uIDEwLzI1LzIwMjIgMTowMCBBTSwg
SmVmZnJleSBIdWdvIHdyb3RlOg0KPj4+PiBPbiA5LzI0LzIwMjIgOToxMSBBTSwgSmFjZWsg
TGF3cnlub3dpY3ogd3JvdGU6DQo+Pj4+PiBWUFUgc3RhbmRzIGZvciBWZXJzYXRpbGUgUHJv
Y2Vzc2luZyBVbml0IGFuZCBpdCdzIGEgQ1BVLWludGVncmF0ZWQNCj4+Pj4+IGluZmVyZW5j
ZSBhY2NlbGVyYXRvciBmb3IgQ29tcHV0ZXIgVmlzaW9uIGFuZCBEZWVwIExlYXJuaW5nDQo+
Pj4+PiBhcHBsaWNhdGlvbnMuDQo+Pj4+Pg0KPj4+Pj4gVGhlIFZQVSBkZXZpY2UgY29uc2lz
dCBvZiBmb2xsb3dpbmcgY29tcG9uZW5zdHM6DQo+Pj4+PiAgwqDCoMKgIC0gQnV0dHJlc3Mg
LSBwcm92aWRlcyBDUFUgdG8gVlBVIGludGVncmF0aW9uLCBpbnRlcnJ1cHQsIGZyZXF1ZW5j
eSBhbmQNCj4+Pj4+ICDCoMKgwqDCoMKgIHBvd2VyIG1hbmFnZW1lbnQuDQo+Pj4+PiAgwqDC
oMKgIC0gTWVtb3J5IE1hbmFnZW1lbnQgVW5pdCAoYmFzZWQgb24gQVJNIE1NVS02MDApIC0g
dHJhbnNsYXRlcyBWUFUgdG8NCj4+Pj4+ICDCoMKgwqDCoMKgIGhvc3QgRE1BIGFkZHJlc3Nl
cywgaXNvbGF0ZXMgdXNlciB3b3JrbG9hZHMuDQo+Pj4+PiAgwqDCoMKgIC0gUklTQyBiYXNl
ZCBtaWNyb2NvbnRyb2xsZXIgLSBleGVjdXRlcyBmaXJtd2FyZSB0aGF0IHByb3ZpZGVzIGpv
Yg0KPj4+Pj4gIMKgwqDCoMKgwqAgZXhlY3V0aW9uIEFQSSBmb3IgdGhlIGtlcm5lbC1tb2Rl
IGRyaXZlcg0KPj4+Pj4gIMKgwqDCoCAtIE5ldXJhbCBDb21wdXRlIFN1YnN5c3RlbSAoTkNT
KSAtIGRvZXMgdGhlIGFjdHVhbCB3b3JrLCBwcm92aWRlcw0KPj4+Pj4gIMKgwqDCoMKgwqAg
Q29tcHV0ZSBhbmQgQ29weSBlbmdpbmVzLg0KPj4+Pj4gIMKgwqDCoCAtIE5ldHdvcmsgb24g
Q2hpcCAoTm9DKSAtIG5ldHdvcmsgZmFicmljIGNvbm5lY3RpbmcgYWxsIHRoZSBjb21wb25l
bnRzDQo+Pj4+Pg0KPj4+Pj4gVGhpcyBkcml2ZXIgc3VwcG9ydHMgVlBVIElQIHYyLjcgaW50
ZWdyYXRlZCBpbnRvIEludGVsIE1ldGVvciBMYWtlDQo+Pj4+PiBjbGllbnQgQ1BVcyAoMTR0
aCBnZW5lcmF0aW9uKS4NCj4+Pj4+DQo+Pj4+PiBNb2R1bGUgc291cmNlcyBhcmUgYXQgZHJp
dmVycy9ncHUvZHJtL2l2cHUgYW5kIG1vZHVsZSBuYW1lIGlzDQo+Pj4+PiAiaW50ZWxfdnB1
LmtvIi4NCj4+Pj4+DQo+Pj4+PiBUaGlzIHBhdGNoIGluY2x1ZGVzIG9ubHkgdmVyeSBiZXNp
YyBmdW5jdGlvbmFsaXR5Og0KPj4+Pj4gIMKgwqDCoCAtIG1vZHVsZSwgUENJIGRldmljZSBh
bmQgSVJRIGluaXRpYWxpemF0aW9uDQo+Pj4+PiAgwqDCoMKgIC0gcmVnaXN0ZXIgZGVmaW5p
dGlvbnMgYW5kIGxvdyBsZXZlbCByZWdpc3RlciBtYW5pcHVsYXRpb24gZnVuY3Rpb25zDQo+
Pj4+PiAgwqDCoMKgIC0gU0VUL0dFVF9QQVJBTSBpb2N0bHMNCj4+Pj4+ICDCoMKgwqAgLSBw
b3dlciB1cCB3aXRob3V0IGZpcm13YXJlDQo+Pj4+Pg0KPj4+Pj4gU2lnbmVkLW9mZi1ieTog
S3J5c3RpYW4gUHJhZHp5bnNraSA8a3J5c3RpYW4ucHJhZHp5bnNraUBsaW51eC5pbnRlbC5j
b20+DQo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBKYWNlayBMYXdyeW5vd2ljeiA8amFjZWsubGF3
cnlub3dpY3pAbGludXguaW50ZWwuY29tPg0KPj4+Pj4gLS0tDQo+Pj4+PiAgwqDCoCBNQUlO
VEFJTkVSU8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB8wqDCoMKgIDggKw0KPj4+Pj4gIMKgwqAgZHJpdmVycy9ncHUvZHJtL0tjb25m
aWfCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqDCoCAyICsNCj4+Pj4+ICDC
oMKgIGRyaXZlcnMvZ3B1L2RybS9NYWtlZmlsZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfMKgwqDCoCAxICsNCj4+Pj4+ICDCoMKgIGRyaXZlcnMvZ3B1L2RybS9pdnB1L0tjb25m
aWfCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAxMiArDQo+Pj4+PiAgwqDCoCBkcml2ZXJz
L2dwdS9kcm0vaXZwdS9NYWtlZmlsZcKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoMKgIDggKw0K
Pj4+Pj4gIMKgwqAgZHJpdmVycy9ncHUvZHJtL2l2cHUvVE9ET8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHzCoMKgwqAgNyArDQo+Pj4+PiAgwqDCoCBkcml2ZXJzL2dwdS9kcm0vaXZw
dS9pdnB1X2Rydi5jwqDCoMKgwqDCoMKgwqAgfMKgIDM5MiArKysrKysrKysNCj4+Pj4+ICDC
oMKgIGRyaXZlcnMvZ3B1L2RybS9pdnB1L2l2cHVfZHJ2LmjCoMKgwqDCoMKgwqDCoCB8wqAg
MTUzICsrKysNCj4+Pj4+ICDCoMKgIGRyaXZlcnMvZ3B1L2RybS9pdnB1L2l2cHVfaHcuaMKg
wqDCoMKgwqDCoMKgwqAgfMKgIDE2OSArKysrDQo+Pj4+PiAgwqDCoCBkcml2ZXJzL2dwdS9k
cm0vaXZwdS9pdnB1X2h3X210bC5jwqDCoMKgwqAgfCAxMDIxICsrKysrKysrKysrKysrKysr
KysrKysrKw0KPj4+Pj4gIMKgwqAgZHJpdmVycy9ncHUvZHJtL2l2cHUvaXZwdV9od19tdGxf
cmVnLmggfMKgIDQ2OCArKysrKysrKysrKw0KPj4+Pj4gIMKgwqAgZHJpdmVycy9ncHUvZHJt
L2l2cHUvaXZwdV9od19yZWdfaW8uaMKgIHzCoCAxMTUgKysrDQo+Pj4+PiAgwqDCoCBpbmNs
dWRlL3VhcGkvZHJtL2l2cHVfZHJtLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDk1
ICsrKw0KPj4+Pj4gIMKgwqAgMTMgZmlsZXMgY2hhbmdlZCwgMjQ1MSBpbnNlcnRpb25zKCsp
DQo+Pj4+PiAgwqDCoCBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2l2cHUv
S2NvbmZpZw0KPj4+Pj4gIMKgwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2Ry
bS9pdnB1L01ha2VmaWxlDQo+Pj4+PiAgwqDCoCBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVy
cy9ncHUvZHJtL2l2cHUvVE9ETw0KPj4+Pj4gIMKgwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRy
aXZlcnMvZ3B1L2RybS9pdnB1L2l2cHVfZHJ2LmMNCj4+Pj4+ICDCoMKgIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vaXZwdS9pdnB1X2Rydi5oDQo+Pj4+PiAgwqDCoCBj
cmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2l2cHUvaXZwdV9ody5oDQo+Pj4+
PiAgwqDCoCBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2l2cHUvaXZwdV9o
d19tdGwuYw0KPj4+Pj4gIMKgwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2Ry
bS9pdnB1L2l2cHVfaHdfbXRsX3JlZy5oDQo+Pj4+PiAgwqDCoCBjcmVhdGUgbW9kZSAxMDA2
NDQgZHJpdmVycy9ncHUvZHJtL2l2cHUvaXZwdV9od19yZWdfaW8uaA0KPj4+Pj4gIMKgwqAg
Y3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvdWFwaS9kcm0vaXZwdV9kcm0uaA0KPj4+Pj4N
Cj4+Pj4+IGRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTDQo+Pj4+PiBp
bmRleCA5NDc1YWE3MDFhM2YuLmQ3MmNlZWYxMDdlNiAxMDA2NDQNCj4+Pj4+IC0tLSBhL01B
SU5UQUlORVJTDQo+Pj4+PiArKysgYi9NQUlOVEFJTkVSUw0KPj4+Pj4gQEAgLTcwNDYsNiAr
NzA0NiwxNCBAQCBGOsKgwqDCoCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
Z3B1L3ZpdmFudGUsZ2MueWFtbA0KPj4+Pj4gIMKgwqAgRjrCoMKgwqAgZHJpdmVycy9ncHUv
ZHJtL2V0bmF2aXYvDQo+Pj4+PiAgwqDCoCBGOsKgwqDCoCBpbmNsdWRlL3VhcGkvZHJtL2V0
bmF2aXZfZHJtLmgNCj4+Pj4+ICDCoMKgICtEUk0gRFJJVkVSUyBGT1IgVlBVDQo+Pj4+PiAr
TTrCoMKgwqAgSmFjZWsgTGF3cnlub3dpY3ogPGphY2VrLmxhd3J5bm93aWN6QGxpbnV4Lmlu
dGVsLmNvbT4NCj4+Pj4+ICtNOsKgwqDCoCBTdGFuaXNsYXcgR3J1c3prYSA8c3RhbmlzbGF3
LmdydXN6a2FAbGludXguaW50ZWwuY29tPg0KPj4+Pj4gK1M6wqDCoMKgIFN1cHBvcnRlZA0K
Pj4+Pj4gK1Q6wqDCoMKgIGdpdCBnaXQ6Ly9hbm9uZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0v
ZHJtLW1pc2MNCj4+Pj4+ICtGOsKgwqDCoCBkcml2ZXJzL2dwdS9kcm0vaXZwdS8NCj4+Pj4+
ICtGOsKgwqDCoCBpbmNsdWRlL3VhcGkvZHJtL2l2cHVfZHJtLmgNCj4+Pj4NCj4+Pj4gTm8g
bWFpbCBsaXN0Pw0KPj4+DQo+Pj4gT0ssIEkgd2lsbCBhZGQgYSBsaW5rIHRvIGRyaS1kZXZl
bC4NCj4+Pg0KPj4+Pj4gKw0KPj4+Pj4gIMKgwqAgRFJNIERSSVZFUlMgRk9SIFhFTg0KPj4+
Pj4gIMKgwqAgTTrCoMKgwqAgT2xla3NhbmRyIEFuZHJ1c2hjaGVua28gPG9sZWtzYW5kcl9h
bmRydXNoY2hlbmtvQGVwYW0uY29tPg0KPj4+Pj4gIMKgwqAgTDrCoMKgwqAgZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9LY29uZmlnIGIvZHJpdmVycy9ncHUvZHJtL0tjb25maWcNCj4+Pj4+IGluZGV4IDE5
OGJhODQ2ZDM0Yi4uMGFhYWMwZTUzNjZmIDEwMDY0NA0KPj4+Pj4gLS0tIGEvZHJpdmVycy9n
cHUvZHJtL0tjb25maWcNCj4+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9LY29uZmlnDQo+
Pj4+PiBAQCAtMzY0LDYgKzM2NCw4IEBAIHNvdXJjZSAiZHJpdmVycy9ncHUvZHJtL3YzZC9L
Y29uZmlnIg0KPj4+Pj4gIMKgwqDCoMKgIHNvdXJjZSAiZHJpdmVycy9ncHUvZHJtL3ZjNC9L
Y29uZmlnIg0KPj4+Pj4gIMKgwqAgK3NvdXJjZSAiZHJpdmVycy9ncHUvZHJtL2l2cHUvS2Nv
bmZpZyINCj4+Pj4+ICsNCj4+Pj4NCj4+Pj4gV2h5IGhlcmUgb2YgYWxsIHBsYWNlcz/CoCBK
dXN0IHJhbmRvbWx5IGluIHRoZSBtaWRkbGUgb2YgdGhlIGxpc3Qgb2Ygc291cmNlZCBLY29u
Zmlncz8NCj4+Pg0KPj4+IEknbGwgbW92ZSBpdCB0byB0aGUgZW5kLg0KPj4NCj4+IEkga25v
d24gdGhhdCB0aGUgS2NvbmZpZ3MgYW5kIE1ha2VmaWxlcyBhcmUgY2hhb3RpYy4gQnV0IGlm
IHlvdSBjYW4sIHRyeSB0byBzb3J0IGl0IGFscGhhYmV0aWNhbGx5Lg0KPiANCj4gTWFuLCB0
aGlzIGlzIGFuIGltcG9zc2libGUgdGFzayA6KQ0KPiBXb3VsZCB0aGUgbGluZSB1bmRlciBp
OTE1IGJlIE9LPw0KDQo6RA0KDQpTb3VuZHMgZ29vZC4NCg0KQmVzdCByZWdhcmRzDQpUaG9t
YXMNCg0KPiANCj4+Pg0KPj4+Pj4gIMKgwqAgc291cmNlICJkcml2ZXJzL2dwdS9kcm0vZXRu
YXZpdi9LY29uZmlnIg0KPj4+Pj4gIMKgwqDCoMKgIHNvdXJjZSAiZHJpdmVycy9ncHUvZHJt
L2hpc2lsaWNvbi9LY29uZmlnIg0KPj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9NYWtlZmlsZSBiL2RyaXZlcnMvZ3B1L2RybS9NYWtlZmlsZQ0KPj4+Pj4gaW5kZXggMjVk
MGJhMzEwNTA5Li4xYmZkNzQxNWMyZDAgMTAwNjQ0DQo+Pj4+PiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vTWFrZWZpbGUNCj4+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9NYWtlZmlsZQ0K
Pj4+Pj4gQEAgLTk0LDYgKzk0LDcgQEAgb2JqLSQoQ09ORklHX0RSTV9LTUJfRElTUExBWSnC
oCArPSBrbWIvDQo+Pj4+PiAgwqDCoCBvYmotJChDT05GSUdfRFJNX01HQUcyMDApICs9IG1n
YWcyMDAvDQo+Pj4+PiAgwqDCoCBvYmotJChDT05GSUdfRFJNX1YzRCnCoCArPSB2M2QvDQo+
Pj4+PiAgwqDCoCBvYmotJChDT05GSUdfRFJNX1ZDNCnCoCArPSB2YzQvDQo+Pj4+PiArb2Jq
LSQoQ09ORklHX0RSTV9JVlBVKcKgICs9IGl2cHUvDQo+Pj4+DQo+Pj4+IEFnYWluLCB3aHkg
aGVyZT8NCj4+Pg0KPj4+IEknbGwgbW92ZSBpdCB0byB0aGUgZW5kLg0KPj4NCj4+IFNhbWUu
DQo+IA0KPiBVbmRlciBpOTE1Pw0KPiANCj4gUmVnYXJkcywNCj4gSmFjZWsNCj4gDQoNCi0t
IA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0Ug
U29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkg
TsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOk
ZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------xAU1ErTNPwmchAUOn6FSVZBN--

--------------iRPnWMd10v7vm6YPWcGxjsXX
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmNZJjMFAwAAAAAACgkQlh/E3EQov+A3
ow//VvAs5/qPmxAKUn9hkCiOS2rsrb73mrkA/Kwm6kMu7OGyijOHp0+Rd3cj6p0I6PGrNhuMGRug
MC4zcrARpBz/B1tBt6SvLu6WMCOY8VnPFtvGel3aAB4Nbxe0xv2HF+6S2TS/tFijO3B4uiQaaK8K
BAc+wtyfvQORbTfREHsuw9TZAPIxC59lsIjpJekcVNIgorB0F+8eTaRJRLbhDSw69zLUg1pKE9yb
Cm0Y5PHANCIjfv+5fJ0H6JK9kDr6nEKlAHBLpcI4AQsUTaYYh1KpeP6OPG1m7xP/1uOuHtDIzbgF
ajRammT7XR9TkS7gIx6KEg6nZJJnx9Pei67rZCtrJm6nZ2s9Z1KSM4JcBmM9vxrFNL9u7exL42On
yIM0Qao7i6917KQ0aV9jkEHuJ3rTsBSW2nESTqoI5cW508jGv1AqzBhJjhG3jvsNjTzCTvQnWMGz
GbWwjNUaZXXa69w8px8pxrwapSaV52KVjJLI4Awqw9o1h2CbgJBbMy0YoR5GVVXAEzMsLnzcwx4t
ptd8O4HLnh+K36VbQRq/Jx6nubX1f7Ixt4x2xnVHO853e0Tb0LKz3bq2OfqKE6R2Ol9ev5Z+Jyzs
tQMSLf5Xg0UXlLMSV6754FxUv3nIMl8xydQrnMHg6a6FhWJRH8v76dzMr/WO1IhXFjuJHiG4STKG
+vo=
=pax4
-----END PGP SIGNATURE-----

--------------iRPnWMd10v7vm6YPWcGxjsXX--
