Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E42C65B461
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 16:47:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A1DF10E357;
	Mon,  2 Jan 2023 15:46:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96CD810E357
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 15:46:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4092220F2C;
 Mon,  2 Jan 2023 15:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1672674404; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=faAOvXqXcrv48NgtDcYx829RElJyNDua6zMpe55LG04=;
 b=goCOCsfPMuSPi/9RjLK1dNZXC96cccRar60lMiJWPWYnpbMQAhQTcULhxnF5mNjDJ5UG4x
 N2Wh6UmApcWsDI5yOI5cHhR6V+gHDNbh//rlTWyVjlL6qo0yxKSWGZIl9SK3O6N5CEGC0p
 m9Fl6141VfjXWibtq2A4UhBaEmNaKLo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1672674404;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=faAOvXqXcrv48NgtDcYx829RElJyNDua6zMpe55LG04=;
 b=vUNO35UT8JTjy4IAmPoQ5KWWXhkFP17nn8s2g9v6ld8cnX0Xf7ZpqsZKvotUkHaOmGAnMk
 KSyOUs3wzc1r7xAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F224A13427;
 Mon,  2 Jan 2023 15:46:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 1miLOWP8smO1cQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 02 Jan 2023 15:46:43 +0000
Message-ID: <8a5532cf-4dac-98ef-c59f-df8373ccdd96@suse.de>
Date: Mon, 2 Jan 2023 16:46:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] drm/vc4: Check for valid formats
Content-Language: en-US
To: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>,
 Maxime Ripard <mripard@kernel.org>, Emma Anholt <emma@anholt.net>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230102135757.262676-1-mcanal@igalia.com>
 <a4d642d8-5556-7efb-308f-ab5f9c7284b0@suse.de>
 <3db30278-c106-cb3b-e581-9165446857f1@igalia.com>
 <33e42652-cec2-83eb-5000-5358f3f456e3@suse.de>
 <799183a2-fa3e-44bb-36a8-ee5eb16afb32@igalia.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <799183a2-fa3e-44bb-36a8-ee5eb16afb32@igalia.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------dpdAM4qn46QhgbwkiMPyUMhf"
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
Cc: Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Andr=c3=a9_Almeida?= <andrealmeid@igalia.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------dpdAM4qn46QhgbwkiMPyUMhf
Content-Type: multipart/mixed; boundary="------------czW0flqZvtNDLal5KhJFiusP";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>,
 Maxime Ripard <mripard@kernel.org>, Emma Anholt <emma@anholt.net>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Melissa Wen <mwen@igalia.com>, =?UTF-8?Q?Andr=c3=a9_Almeida?=
 <andrealmeid@igalia.com>, dri-devel@lists.freedesktop.org
Message-ID: <8a5532cf-4dac-98ef-c59f-df8373ccdd96@suse.de>
Subject: Re: [PATCH] drm/vc4: Check for valid formats
References: <20230102135757.262676-1-mcanal@igalia.com>
 <a4d642d8-5556-7efb-308f-ab5f9c7284b0@suse.de>
 <3db30278-c106-cb3b-e581-9165446857f1@igalia.com>
 <33e42652-cec2-83eb-5000-5358f3f456e3@suse.de>
 <799183a2-fa3e-44bb-36a8-ee5eb16afb32@igalia.com>
In-Reply-To: <799183a2-fa3e-44bb-36a8-ee5eb16afb32@igalia.com>

--------------czW0flqZvtNDLal5KhJFiusP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDIuMDEuMjMgdW0gMTY6Mzkgc2NocmllYiBNYcOtcmEgQ2FuYWw6DQo+IE9u
IDEvMi8yMyAxMjoyMSwgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6DQo+PiBIaQ0KPj4NCj4+
IEFtIDAyLjAxLjIzIHVtIDE1OjI5IHNjaHJpZWIgTWHDrXJhIENhbmFsOg0KPj4+IEhpLA0K
Pj4+DQo+Pj4gT24gMS8yLzIzIDExOjIwLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4+
Pj4gSGkNCj4+Pj4NCj4+Pj4gQW0gMDIuMDEuMjMgdW0gMTQ6NTcgc2NocmllYiBNYcOtcmEg
Q2FuYWw6DQo+Pj4+PiBDdXJyZW50bHksIHZjNCBpcyBub3QgY2hlY2tpbmcgdmFsaWQgZm9y
bWF0cyBiZWZvcmUgY3JlYXRpbmcgYQ0KPj4+Pj4gZnJhbWVidWZmZXIsIHdoaWNoIGlzIHRy
aWdnZXJpbmcgdGhlIElHVCB0ZXN0DQo+Pj4+PiBpZ3RAa21zX2FkZGZiX2Jhc2ljQGFkZGZi
MjUtYmFkLW1vZGlmaWVyIHRvIGZhaWwsIGFzIHZjNCBhY2NlcHRzDQo+Pj4+PiB0byBjcmVh
dGUgYSBmcmFtZWJ1ZmZlciB3aXRoIGFuIGludmFsaWQgbW9kaWZpZXIuIFRoZXJlZm9yZSwg
Y2hlY2sNCj4+Pj4+IGZvciB2YWxpZCBmb3JtYXRzIGJlZm9yZSBjcmVhdGluZyBmcmFtZWJ1
ZmZlcnMgb24gdmM0IGFuZCB2YzUgaW4NCj4+Pj4+IG9yZGVyIHRvIGF2b2lkIGNyZWF0aW5n
IGZyYW1lYnVmZmVycyB3aXRoIGludmFsaWQgZm9ybWF0cy4NCj4+Pj4+DQo+Pj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBNYcOtcmEgQ2FuYWwgPG1jYW5hbEBpZ2FsaWEuY29tPg0KPj4+Pj4gLS0t
DQo+Pj4+PiDCoCBkcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9rbXMuYyB8IDIzICsrKysrKysr
KysrKysrKysrKysrKystDQo+Pj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQ0KPj4+Pj4NCj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vdmM0L3ZjNF9rbXMuYyANCj4+Pj4+IGIvZHJpdmVycy9ncHUvZHJtL3ZjNC92
YzRfa21zLmMNCj4+Pj4+IGluZGV4IDUzZDlmMzA0NjBjZi4uNWQxYWZkNjZmY2MxIDEwMDY0
NA0KPj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfa21zLmMNCj4+Pj4+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2ttcy5jDQo+Pj4+PiBAQCAtNTAwLDYgKzUw
MCwyNyBAQCBzdGF0aWMgc3RydWN0IGRybV9mcmFtZWJ1ZmZlciANCj4+Pj4+ICp2YzRfZmJf
Y3JlYXRlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsDQo+Pj4+PiDCoMKgwqDCoMKgwqDCoCBt
b2RlX2NtZCA9ICZtb2RlX2NtZF9sb2NhbDsNCj4+Pj4+IMKgwqDCoMKgfQ0KPj4+Pj4NCj4+
Pj4+ICvCoMKgwqAgaWYgKCFkcm1fYW55X3BsYW5lX2hhc19mb3JtYXQoZGV2LCBtb2RlX2Nt
ZC0+cGl4ZWxfZm9ybWF0LA0KPj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBtb2RlX2NtZC0+bW9kaWZpZXJbMF0pKSB7DQo+Pj4+PiArwqDCoMKg
wqDCoMKgwqAgZHJtX2RiZ19rbXMoZGV2LCAiVW5zdXBwb3J0ZWQgcGl4ZWwgZm9ybWF0ICVw
NGNjIC8gDQo+Pj4+PiBtb2RpZmllciAweCVsbHhcbiIsDQo+Pj4+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgICZtb2RlX2NtZC0+cGl4ZWxfZm9ybWF0LCBtb2RlX2NtZC0+
bW9kaWZpZXJbMF0pOw0KPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiBFUlJfUFRSKC1F
SU5WQUwpOw0KPj4+Pj4gK8KgwqDCoCB9DQo+Pj4+DQo+Pj4+IFRoaXMgbWlnaHQgYmUgYSBz
dHVwaWQgcXVlc3Rpb24sIGJ1dCB3aHkgZG9lc24ndCANCj4+Pj4gZHJtX2ZiZ2VtX2ZiX2Ny
ZWF0ZSgpIGRvIHRoaXMgdGVzdCBhbHJlYWR5PyBJdCBzZWVtcyBsaWtlIGEgDQo+Pj4+IG5v
LWJyYWluZXIgYW5kICpub3QqIHRlc3RpbmcgZm9yIHRoZSBwbGFuZSBmb3JtYXRzIHNob3Vs
ZCBiZSB0aGUgDQo+Pj4+IGV4Y2VwdGlvbi4NCj4+Pg0KPj4+IEkgdGhvdWdodCB0aGUgc2Ft
ZSBpbml0aWFsbHksIGJ1dCB0aGVuIEkgZm91bmQgdGhpcyBtZW50aW9uIG9uIHRoZSANCj4+
PiBUT0RPIGxpc3QgWzFdLiBTbywgaXQNCj4+PiBpcyBub3QgcG9zc2libGUgdG8gdGVzdCBp
dCBvbiBkcm1fZ2VtX2ZiX2NyZWF0ZSgpIGJlY2F1c2UsIGZvciANCj4+PiBub24tYXRvbWlj
LCBjaGVja2luZw0KPj4+IGRybV9hbnlfcGxhbmVfaGFzX2Zvcm1hdCgpIGlzIG5vdCBwb3Nz
aWJsZSBzaW5jZSBsaWtlIHRoZSBmb3JtYXQgbGlzdCANCj4+PiBmb3IgdGhlIHByaW1hcnkg
cGxhbmUNCj4+PiBpcyBmYWtlIGFuZCB3ZSdkIHRoZXJlZm9yIHJlamVjdCB2YWxpZCBmb3Jt
YXRzLg0KPj4NCj4+IFRoYW5rcyBmb3IgdGhlIHBvaW50ZXIgdG8gdGhlIGRvY3MuDQo+Pg0K
Pj4gSSBzZWUgdHdvIG9wdGlvbnM6DQo+Pg0KPj4gMSkgVGVzdGluZyBmb3IgYXRvbWljIG1v
ZGVzZXR0aW5nIGNhbiBiZSBkb25lIHZpYSANCj4+IGRybV9jb3JlX2NoZWNrX2ZlYXR1cmUo
ZGV2LCBEUklWRVJfQVRPTUlDKS7CoCBJZiB0cnVlLCANCj4+IGRybV9nZW1fZmJfY3JlYXRl
KCkgY2FuIGZ1cnRoZXIgdGVzdCBmb3IgdGhlIHBsYW5lIGZvcm1hdHMuIEZvciANCj4+IG5v
bi1hdG9taWMgZHJpdmVycywganVzdCBza2lwIHRoZSBmb3JtYXQgdGVzdC4NCj4+DQo+PiAy
KSBBcyBhbiBhbHRlcm5hdGl2ZSwgd2UgY291bGQgaW52ZXJ0IHRoZSBJR1QgdGVzdCBhbmQg
ZXhwbGljaXRseSANCj4+IGFsbG93IGFueSBmb3JtYXQgdG8gYmUgYWxsb2NhdGVkLiBBbG1v
c3Qgbm8gZHJpdmVycyBjdXJyZW50bHkgYm90aGVyIA0KPj4gd2l0aCB0aGUgZm9ybWF0IHRl
c3QgYW55d2F5LiBBbmQgRFJNIHdpbGwgYWxyZWFkeSBmYWlsIGlmIHVzZXJzcGFjZSANCj4+
IGF0dGFjaGVzIGEgZnJhbWVidWZmZXIgdG8gYSBwbGFuZSB3aXRoIGluY29tcGF0aWJsZSBm
b3JtYXRzLiBbMV3CoCAoSSdkIA0KPj4gcGVyc29uYWxseSBwcmVmZXIgdGhpcyBvcHRpb24s
IGJ1dCBJJ20gbm90IHN1cmUgaWYgdGhlcmUncyBhbnkgDQo+PiBjb25zZW5zdXMgb24gdGhh
dC4pDQo+IA0KPiBJIGd1ZXNzIHRoZSBzZWNvbmQgb3B0aW9uIHdpbGwgcHJvYmFibHkgYnJl
YWsgSW50ZWwncyBDSSwgd2hpY2ggSSdtIG5vdCANCj4gc3VyZSBpZiBpdCBpcyBhIGdvb2QN
Cj4gaWRlYS4gTWF5YmUgdGhlIGZpcnN0IG9wdGlvbiBpcyBhIGJpdCBsZXNzIGludHJ1c2l2
ZSBhbmQgd2lsbCBoZWxwIHRoZSANCj4gRFJNIGhlbHBlciB0byBoYXZlIHRoZQ0KPiBzYW1l
IGJlaGF2aW9yIGFzIGRyaXZlcnMgbGlrZSBpOTE1IGFuZCBBTURHUFUuDQoNClRoYXQgbWFr
ZXMgc29tZSBzZW5zZS4gSSdkIGxpa2UgdG8gaGVhciB0aGUgb3BpbmlvbiBvZiB0aGUgYWZm
ZWN0ZWQgDQpkZXZlbG9wZXJzLiBJZiBubyBvbmUgc2hvd3MgdXAsIGdvIGZvciBvcHRpb24g
MSB0aGVuLiBJdCBoYXMgdGhlIA0KcG90ZW50aWFsIHRvIGJyZWFrIHNvbWVvbmUncyB1c2Vy
c3BhY2UgY29kZSwgYnV0IGl0J3MgZWFzaWx5IHJldmVydC1hYmxlLg0KDQpCZXN0IHJlZ2Fy
ZHMNClRob21hcw0KDQo+IA0KPiBUaGFua3MgZm9yIHRoZSBzdWdnZXN0aW9ucyENCj4gDQo+
IEJlc3QgUmVnYXJkcywNCj4gLSBNYcOtcmEgQ2FuYWwNCj4gDQo+Pg0KPj4gV2l0aCBlaXRo
ZXIgaW1wbGVtZW50ZWQsIHRoZSBUT0RPIGl0ZW0gY291bGQgYmUgcmVtdm9lZCBBRkFJQ1Qu
DQo+Pg0KPj4gQmVzdCByZWdhcmRzDQo+PiBUaG9tYXMNCj4+DQo+PiBbMV0gDQo+PiBodHRw
czovL2VsaXhpci5ib290bGluLmNvbS9saW51eC9sYXRlc3Qvc291cmNlL2RyaXZlcnMvZ3B1
L2RybS9kcm1fcGxhbmUuYyNMNzg5DQo+Pg0KPj4+DQo+Pj4gSSdtIG5vdCBzdXJlIGlmIGFu
eXRoaW5nIGNoYW5nZWQgc2luY2UgdGhpcyB3YXMgd3JpdHRlbiwgYnV0IHRoYXQgd2FzIA0K
Pj4+IHRoZSByZWFzb24gdGhhdCBJDQo+Pj4gZGVjaWRlZCB0byBpbnRyb2R1Y2UgdGhlIGNo
ZWNrIGluIHRoZSBkcml2ZXIgaW5zdGVhZCBvZiB0aGUgQVBJLg0KPj4+DQo+Pj4gWzFdIA0K
Pj4+IGh0dHBzOi8vY2dpdC5mcmVlZGVza3RvcC5vcmcvZHJtL2RybS90cmVlL0RvY3VtZW50
YXRpb24vZ3B1L3RvZG8ucnN0I24yNzkNCj4+Pg0KPj4+IEJlc3QgUmVnYXJkcywNCj4+PiAt
IE1hw61yYSBDYW5hbA0KPj4+DQo+Pj4+DQo+Pj4+IEJlc3QgcmVnYXJkcw0KPj4+PiBUaG9t
YXMNCj4+Pj4NCj4+Pj4+ICsNCj4+Pj4+ICvCoMKgwqAgcmV0dXJuIGRybV9nZW1fZmJfY3Jl
YXRlKGRldiwgZmlsZV9wcml2LCBtb2RlX2NtZCk7DQo+Pj4+PiArfQ0KPj4+Pj4gKw0KPj4+
Pj4gK3N0YXRpYyBzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVyICp2YzVfZmJfY3JlYXRlKHN0cnVj
dCBkcm1fZGV2aWNlICpkZXYsDQo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBkcm1fZmlsZSAqZmlsZV9wcml2LA0KPj4+
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBj
b25zdCBzdHJ1Y3QgZHJtX21vZGVfZmJfY21kMiAqbW9kZV9jbWQpDQo+Pj4+PiArew0KPj4+
Pj4gK8KgwqDCoCBpZiAoIWRybV9hbnlfcGxhbmVfaGFzX2Zvcm1hdChkZXYsIG1vZGVfY21k
LT5waXhlbF9mb3JtYXQsDQo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIG1vZGVfY21kLT5tb2RpZmllclswXSkpIHsNCj4+Pj4+ICvCoMKgwqDC
oMKgwqDCoCBkcm1fZGJnX2ttcyhkZXYsICJVbnN1cHBvcnRlZCBwaXhlbCBmb3JtYXQgJXA0
Y2MgLyANCj4+Pj4+IG1vZGlmaWVyIDB4JWxseFxuIiwNCj4+Pj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgJm1vZGVfY21kLT5waXhlbF9mb3JtYXQsIG1vZGVfY21kLT5t
b2RpZmllclswXSk7DQo+Pj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIEVSUl9QVFIoLUVJ
TlZBTCk7DQo+Pj4+PiArwqDCoMKgIH0NCj4+Pj4+ICsNCj4+Pj4+IMKgwqDCoMKgcmV0dXJu
IGRybV9nZW1fZmJfY3JlYXRlKGRldiwgZmlsZV9wcml2LCBtb2RlX2NtZCk7DQo+Pj4+PiDC
oCB9DQo+Pj4+Pg0KPj4+Pj4gQEAgLTEwMzMsNyArMTA1NCw3IEBAIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgZHJtX21vZGVfY29uZmlnX2Z1bmNzIA0KPj4+Pj4gdmM0X21vZGVfZnVuY3MgPSB7
DQo+Pj4+PiDCoCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9tb2RlX2NvbmZpZ19mdW5jcyB2
YzVfbW9kZV9mdW5jcyA9IHsNCj4+Pj4+IMKgwqDCoMKgLmF0b21pY19jaGVjayA9IHZjNF9h
dG9taWNfY2hlY2ssDQo+Pj4+PiDCoMKgwqDCoC5hdG9taWNfY29tbWl0ID0gZHJtX2F0b21p
Y19oZWxwZXJfY29tbWl0LA0KPj4+Pj4gLcKgwqDCoCAuZmJfY3JlYXRlID0gZHJtX2dlbV9m
Yl9jcmVhdGUsDQo+Pj4+PiArwqDCoMKgIC5mYl9jcmVhdGUgPSB2YzVfZmJfY3JlYXRlLA0K
Pj4+Pj4gwqAgfTsNCj4+Pj4+DQo+Pj4+PiDCoCBpbnQgdmM0X2ttc19sb2FkKHN0cnVjdCBk
cm1fZGV2aWNlICpkZXYpDQo+Pj4+PiAtLSANCj4+Pj4+IDIuMzguMQ0KPj4+Pj4NCj4+Pj4N
Cj4+DQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9w
ZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4g
NSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcp
DQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------czW0flqZvtNDLal5KhJFiusP--

--------------dpdAM4qn46QhgbwkiMPyUMhf
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmOy/GMFAwAAAAAACgkQlh/E3EQov+Ax
9w//Tkj0aok9OpSaKHFDNmfyT7qw6L/pHYUgLMoHHVrWUPqaVDqjKzLJWgixyN3c2bLjesebIaxw
AXdZvJ2loH1V5TqB3Bau2Wb7AeK9udDdYmHuzLwh6pPwQLEmBhTd1EkvY0R1C5HRH/uMZr5tC50s
eQMRy189Z1T3yaXj3lFlymyBv4EpAKvC8/dQMvjvjB2lF6TseB2QGAdorw8l2+VeUZ4vioX5/BD3
cwAyevRizBdigm36ZYAE5hZ23pj7Ua/pAVrKtI4/Pv6u7hkN6N4cnbfF2bOyORPW4N3vJnZH0SqK
Tyk2Y77wi6I68Mp155F6laXGlAw6ptziRf0skC7zRENfUoNzPxDDk6SyA1+eCv9luyzjwOCiSL0K
Zm1OAnIosyaFO1mJi8tvVldOXyjuXhlp8slcDQIpcJJX45Rn0GR8cbG/iMm1NDkB6iCIyUmflkp7
JnT4GVkvnFoLAqULvImXklGHeYVsg58UjFXUWEBjnFVBWVz9eloYbTeR7uflhg7hs+R6wmx5B5Rv
pfDQzOphZaO2srXBo98svYyAJiSLf64b3HABeHmBKnNORfBiQDwA1fXxa5DrUB38bru/Rwb+rnpe
V0wBv5Z03FDf5p2+1hiKn6cgyykcPpmvyb/gvJnz/xsE0VtvQIaywz1bEkDgr1nX9PFLiP5gSuvy
d1I=
=QR9Y
-----END PGP SIGNATURE-----

--------------dpdAM4qn46QhgbwkiMPyUMhf--
