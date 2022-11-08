Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8477620B02
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 09:16:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A29BC10E240;
	Tue,  8 Nov 2022 08:16:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F17610E240
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 08:16:24 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D439B2249D;
 Tue,  8 Nov 2022 08:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1667895382; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7AjH3iy5foLIcMClHOHIZnBN7Cx/DCSY5CAl77BmECQ=;
 b=0XmDLAWR/soPXHPszutNhobbg1c+fqK5nQ0yhisHf+iWkJsK6KoUOWN5wLO5za/KNk8yu9
 5BJ52DUTZFgO1686BdEBgLsvHsGd3P1PCsysvrpx/Gi8oQmq3qwld4PIzOaEO5NzbjV/Y0
 V4U9W8kAiFGPMWdR97KoFafxo7PfYsI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1667895382;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7AjH3iy5foLIcMClHOHIZnBN7Cx/DCSY5CAl77BmECQ=;
 b=gN48d2w2vIbTmw+irHNPayjokGVBstf5pl2KuUo191fkXJ8gP3As91d62zsxLRKwPGEMzP
 dpBoJMfdp3KJ5kDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B46A113398;
 Tue,  8 Nov 2022 08:16:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ZR//KlYQamOBRAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 08 Nov 2022 08:16:22 +0000
Message-ID: <dfa83c75-4062-93ee-380c-3e0e4f41c448@suse.de>
Date: Tue, 8 Nov 2022 09:16:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 2/2] fbdev: Add support for the nomodeset kernel parameter
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, daniel@ffwll.ch, javierm@redhat.com
References: <20221107104916.18733-1-tzimmermann@suse.de>
 <20221107104916.18733-3-tzimmermann@suse.de>
 <2e2d23f3-9c2d-e75e-f390-4651a4da730f@gmx.de>
 <6547fba2-a002-f339-2997-5b28df794095@suse.de>
 <d21a0a0d-22fb-99bf-0d29-75b1fe1db677@gmx.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <d21a0a0d-22fb-99bf-0d29-75b1fe1db677@gmx.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------jq1kv0QifaGD1J9gYvl42emD"
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------jq1kv0QifaGD1J9gYvl42emD
Content-Type: multipart/mixed; boundary="------------fyrWrYRXqZLgyhIByiVS45ZY";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Helge Deller <deller@gmx.de>, daniel@ffwll.ch, javierm@redhat.com
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <dfa83c75-4062-93ee-380c-3e0e4f41c448@suse.de>
Subject: Re: [PATCH 2/2] fbdev: Add support for the nomodeset kernel parameter
References: <20221107104916.18733-1-tzimmermann@suse.de>
 <20221107104916.18733-3-tzimmermann@suse.de>
 <2e2d23f3-9c2d-e75e-f390-4651a4da730f@gmx.de>
 <6547fba2-a002-f339-2997-5b28df794095@suse.de>
 <d21a0a0d-22fb-99bf-0d29-75b1fe1db677@gmx.de>
In-Reply-To: <d21a0a0d-22fb-99bf-0d29-75b1fe1db677@gmx.de>

--------------fyrWrYRXqZLgyhIByiVS45ZY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDcuMTEuMjIgdW0gMjE6NDYgc2NocmllYiBIZWxnZSBEZWxsZXI6DQo+IE9u
IDExLzcvMjIgMTY6MzAsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4gSGkNCj4+DQo+
PiBBbSAwNy4xMS4yMiB1bSAxNDo1NyBzY2hyaWViIEhlbGdlIERlbGxlcjoNCj4+PiBPbiAx
MS83LzIyIDExOjQ5LCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4+Pj4gU3VwcG9ydCB0
aGUga2VybmVsJ3Mgbm9tb2Rlc2V0IHBhcmFtZXRlciBmb3IgYWxsIFBDSS1iYXNlZCBmYmRl
dg0KPj4+PiBkcml2ZXJzIHRoYXQgdXNlIGFwZXJ0dXJlIGhlbHBlcnMgdG8gcmVtb3ZlIG90
aGVyLCBoYXJkd2FyZS1hZ25vc3RpYw0KPj4+PiBncmFwaGljcyBkcml2ZXJzLg0KPj4+Pg0K
Pj4+PiBUaGUgcGFyYW1ldGVyIGlzIGEgc2ltcGxlIHdheSBvZiB1c2luZyB0aGUgZmlybXdh
cmUtcHJvdmlkZWQgc2Nhbm91dA0KPj4+PiBidWZmZXIgaWYgdGhlIGhhcmR3YXJlJ3MgbmF0
aXZlIGRyaXZlciBpcyBicm9rZW4uDQo+Pj4NCj4+PiBOYWguLi4gaXQncyBwcm9iYWJseSBu
b3QgYnJva2VuLCBidXQgeW91IHdhbnQgaXQgZGlzYWJsZWQgaW4gb3JkZXINCj4+PiB0byB1
c2UgdGhlIERSTSBkcml2ZXIgaW5zdGVhZD8NCj4+DQo+PiBObywgaXQncyByZWFsbHkgZm9y
IGJyb2tlbiBuYXRpdmUgZHJpdmVycyBvciBhbnkga2luZCBvZiBwcm9ibGVtYXRpYw0KPj4g
bW9kZXNldHRpbmcuIE1vc3QgRFJNIGRyaXZlcnMgYWxyZWFkeSByZXNwZWN0IHRoZSBub21v
ZGVzZXQgb3B0aW9uDQo+PiBhbmQgd29uJ3QgbG9hZCB3aGVuIGdpdmVuLiBBbGwgeW91J2Qg
Z2V0IGFyZSB0aGUgZ2VuZXJpYyBkcml2ZXJzLA0KPj4gc3VjaCBhcyBzaW1wbGVkcm0sIGVm
aWZiIG9yIHNpbXBsZWZiLg0KPj4NCj4+IFRoZXJlIGFyZSBiZXR0ZXIgb3B0aW9ucyBvZiBj
b25maWd1cmluZyB2aWRlbyBvdXRwdXQgb24gdGhlIGtlcm5lbA0KPj4gY29tbWFuZCBsaW5l
LsKgIEJ1dCBhcyBncmFwaGljcyBvdXRwdXQgaXMgc3VjaCBhIGZ1bmRhbWVudGFsIGZlYXR1
cmUNCj4+IHRvIHVzaW5nIGEgY29tcHV0ZXIsIHdlIGZvdW5kIHRoYXQgYSBzaW1wbGUgYW5k
IGVhc3kgb3B0aW9uIHRvDQo+PiB3b3JrYXJvdW5kIGVycm9uZW91cyBzeXN0ZW1zIHdvdWxk
IGJlbmVmaXQgRFJNIHVzZXJzOyBoZW5jZSB0aGUNCj4+IG5vbW9kZXNldCBwYXJhbWV0ZXIu
DQo+Pg0KPj4gQXMgZmJkZXYgZHJpdmVycyBhbHNvIGRvIG1vZGVzZXR0aW5nLCBzdXBwb3J0
aW5nIHRoZSBwYXJhbWV0ZXIgc2ltcGx5DQo+PiB1bmlmaWVzIHRoZSBiZWhhdmlvci4NCj4g
DQo+IE9rLg0KPiANCj4+Pj4gVGhlIHNhbWUgZWZmZWN0DQo+Pj4+IGNvdWxkIGJlIGFjaGll
dmVkIHdpdGggcGVyLWRyaXZlciBvcHRpb25zLCBidXQgdGhlIGltcG9ydGFuY2Ugb2YgdGhl
DQo+Pj4+IGdyYXBoaWNzIG91dHB1dCBmb3IgbWFueSB1c2VycyBtYWtlcyBhIHNpbmdsZSwg
dW5pZmllZCBhcHByb2FjaA0KPj4+PiB3b3J0aHdoaWxlLg0KPj4+Pg0KPj4+PiBXaXRoIG5v
bW9kZXNldCBzcGVjaWZpZWQsIHRoZSBmYmRldiBkcml2ZXIgbW9kdWxlIHdpbGwgbm90IGxv
YWQuIFRoaXMNCj4+Pj4gdW5pZmllcyBiZWhhdmlvciB3aXRoIHNpbWlsYXIgRFJNIGRyaXZl
cnMuIEluIERSTSBoZWxwZXJzLCBtb2R1bGVzDQo+Pj4+IGZpcnN0IGNoZWNrIHRoZSBub21v
ZGVzZXQgcGFyYW1ldGVyIGJlZm9yZSByZWdpc3RlcmluZyB0aGUgUENJDQo+Pj4+IGRyaXZl
ci4gQXMgZmJkZXYgaGFzIG5vIHN1Y2ggbW9kdWxlIGhlbHBlcnMsIHdlIGhhdmUgdG8gbW9k
aWZ5IGVhY2gNCj4+Pj4gZHJpdmVyIGluZGl2aWR1YWxseS4NCj4+Pg0KPj4+IE9rLg0KPj4+
DQo+Pj4+IFRoZSBuYW1lICdub21vZGVzZXQnIGlzIHNsaWdodGx5IG1pc2xlYWRpbmcsIGJ1
dCBoYXMgYmVlbiBjaG9zZW4gZm9yDQo+Pj4+IGhpc3RvcmljYWwgcmVhc29ucy4gU2V2ZXJh
bCBkcml2ZXJzIGltcGxlbWVudGVkIGl0IGJlZm9yZSBpdCBiZWNhbWUgYQ0KPj4+PiBnZW5l
cmFsIG9wdGlvbiBmb3IgRFJNLiBTbyBrZWVwaW5nIHRoZSBleGlzdGluZyBuYW1lIHdhcyBw
cmVmZXJyZWQgb3Zlcg0KPj4+PiBpbnRyb2R1Y2luZyBhIG5ldyBvbmUuDQo+Pj4NCj4+Pj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvYXR5L2F0eTEyOGZiLmMgDQo+Pj4+
IGIvZHJpdmVycy92aWRlby9mYmRldi9hdHkvYXR5MTI4ZmIuYw0KPj4+PiBpbmRleCA1N2Uz
OThmZTdhODFjLi4xYTI2YWMyODY1ZDY1IDEwMDY0NA0KPj4+PiAtLS0gYS9kcml2ZXJzL3Zp
ZGVvL2ZiZGV2L2F0eS9hdHkxMjhmYi5jDQo+Pj4+ICsrKyBiL2RyaXZlcnMvdmlkZW8vZmJk
ZXYvYXR5L2F0eTEyOGZiLmMNCj4+Pj4gQEAgLTI1MDMsNyArMjUwNCwxMiBAQCBzdGF0aWMg
aW50IGF0eTEyOGZiX2luaXQodm9pZCkNCj4+Pj4gwqAgew0KPj4+PiDCoCAjaWZuZGVmIE1P
RFVMRQ0KPj4+PiDCoMKgwqDCoMKgIGNoYXIgKm9wdGlvbiA9IE5VTEw7DQo+Pj4+ICsjZW5k
aWYNCj4+Pj4gKw0KPj4+PiArwqDCoMKgIGlmICh2aWRlb19maXJtd2FyZV9kcml2ZXJzX29u
bHkoKSkNCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiAtRU5PREVWOw0KPj4+DQo+Pj4g
SSB0aGluayBpdCBtYWtlcyBzZW5zZSB0byBnaXZlIGF0IGxlYXN0IHNvbWUgaW5mbywgd2h5
IGEgc3BlY2lmaWMNCj4+PiBkcml2ZXIgd2Fzbid0IGxvYWRlZCwgZS5nLiBzb21ldGhpbmcg
bGlrZSB0aGlzIGtlcm5lbCBtZXNzYWdlOg0KPj4+IGF0eTEyOGZiOiBEcml2ZXIgZGlzYWJs
ZWQgZHVlIHRvICJub21vZGVzZXQiIGtlcm5lbCBwYXJhbWV0ZXIuDQo+Pj4NCj4+PiBJZiB5
b3UgZS5nLiBjaGFuZ2UgdGhlIGZ1bmN0aW9uIHZpZGVvX2Zpcm13YXJlX2RyaXZlcnNfb25s
eSgpDQo+Pj4gdG8gYmVjb21lIHZpZGVvX2Zpcm13YXJlX2RyaXZlcnNfb25seShjb25zdCBj
aGFyICpkcml2ZXJuYW1lKQ0KPj4+IHRoZW4geW91IGNvdWxkIHByaW50IHN1Y2ggYSBtZXNz
YWdlIGluIHZpZGVvX2Zpcm13YXJlX2RyaXZlcnNfb25seSgpDQo+Pg0KPj4gV2VsbCwgd2Ug
ZG8gaGF2ZSBzdWNoIGEgbWVzc2FnZSBpbiBkaXNhYmxlX21vZGVzZXQoKSBhbHJlYWR5LiBb
MV0NCj4+IFsxXSANCj4+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L2xhdGVz
dC9zb3VyY2UvZHJpdmVycy9ncHUvZHJtL2RybV9ub21vZGVzZXQuYyNMMTgNCj4gDQo+IFll
cywgSSBzYXcgaXQsIGJ1dCB0aGF0IG1lc3NhZ2UgcXVpdGUgZ2VuZXJpYy4NCj4gSWYgZm9y
IGV4YW1wbGUgbXkgYXR5ZmIgZG9lc24ndCBzaG93IHVwLCBJIHdvdWxkIGdyZXAgZG1lc2cg
Zm9yICJhdHkiIGFuZA0KPiBub3QgIm5vbW9kZXNldCIuLi4NCg0KSSdkIGxpa2UgdG8gYWRk
IHRoaXMgdG8gZmJkZXYgb3IgdGhlIGRyaXZlcnMgaW5zdGVhZCBvZiB0aGUgdmlkZW8gDQpo
ZWxwZXIuIE9uIHRoZSBEUk0gc2lkZSwgaXQgd29ya3MgYSBhIGJpdCBkaWZmZXJlbnQgYW5k
IEkgdGhpbmsgSSBoYXZlIGEgDQp1c2UgY2FzZSBmb3IgdGhlIGZ1bmN0aW9uIHRoYXQgZG9l
cyBub3QgZGlyZWN0bHkgaW52b2x2ZSBkaXNhYmxpbmcgDQpkcml2ZXJzLiBTZWUgYmVsb3cg
Zm9yIGEgcHJvcG9zYWwuDQoNCj4gDQo+IA0KPj4+IEFuZCBJIGRvbid0IGxpa2UgdmVyeSBt
dWNoIHRoZSBuYW1lIG9mIGZ1bmN0aW9uIA0KPj4+IHZpZGVvX2Zpcm13YXJlX2RyaXZlcnNf
b25seSgpLA0KPj4+IGJ1dCBkb24ndCBoYXZlIGFueSBvdGhlciBiZXR0ZXIgaWRlYSByaWdo
dCBub3cgZWl0aGVyLi4uDQo+Pg0KPj4gSXQncyBwYXJ0IG9mIHRoZSAndmlkZW8nIG1vZHVs
ZSwgaGVuY2UgdGhlIHByZWZpeC4gVGhlICdub21vZGVzZXQnDQo+PiBvcHRpb24gdXNlZCB0
byBiZSBpbXBsZW1lbnRlZCBpbiBzZXZlcmFsIERSTSBkcml2ZXJzLiBJdCdzIGFuIGF3ZnVs
DQo+PiBuYW1lLCBidXQgd2UgZGlkbid0IHdhbnQgdG8gcmVtb3ZlIGl0IG9yIGludHJvZHVj
ZSBhIG5ldyBvbmUgZm9yIHRoZQ0KPj4gc2FtZSBmZWF0dXJlLiBTbyB3ZSBrZXB0IG5vbW9k
ZXNldCBmb3IgYWxsIG9mIERSTS7CoCBUaGVuIHdlIHN0YXJ0ZWQNCj4+IGJpa2VzaGVkZGlu
ZyB0aGUgZnVuY3Rpb24gbmFtZSB0aGF0IHJldHVybnMgdGhlIHNldHRpbmcuIEFuZA0KPj4g
ZmlybXdhcmUtZHJpdmVycy1vbmx5IGlzIHRoZSBiZXN0IGRlc2NyaXB0aW9uIG9mIHdoYXQg
aXMgaGFwcGVuaW5nDQo+PiBoZXJlLiBTbyB0aGF0J3MgaG93IHRoZSBuYW1lIGhhcHBlbmQu
DQo+IA0KPiB2aWRlb19tb2Rlc2V0dGluZ19kaXNhYmxlZCgpID8NCj4gKEp1c3QgYW4gaWRl
YSkNCg0KVGhlIHRlcm0gbW9kZXNldHRpbmcgaXMgbWlzbGVhZGluZyBhbmQgd2UgaGFkIHRo
aXMgcHJvYmxlbSB3aXRoIA0KJ25vbW9kZXNldCcgYWxyZWFkeS4gVGhlcmUgYXJlIHN0aWxs
IHBsZW50eSBvZiBkcml2ZXJzIHdpdGggbW9kZSANCnNldHRpbmcsIHN1Y2ggYXMgdGhlIFVT
Qi1iYXNlZCBvbmVzLiAgSXQncyBhbHNvIG5vdCBzbyBlYXN5IG9uIHRoZSBEUk0gDQpzaWRl
LCB3aGVyZSBhIG1vZGVzZXR0aW5nIG9wZXJhdGlvbiBpcyBvbmUgb2YgbWFueSBlZmZlY3Rz
IG9mIGxvYWRpbmcgYW4gDQphdG9taWMgc3RhdGUuICBNYXliZSBsZXQncyBsZWF2ZSB0aGUg
bmFtZSBpcyBmb3Igbm93PyBJZiB3ZSBldmVyIGZpbmQgDQp0aGUgcGVyZmVjdCBuYW1lLCBp
dCdzIGEgc2ltcGxlIHJlbmFtZSB3aXRoIHNlZC4NCg0KTXkgcHJvcG9zYWwgd291bGQgYmUg
dG8gYWRkIGEgbGl0dGxlIGhlbHBlciB0byBmYmRldiB0aGF0IGluY2x1ZGVzIHlvdXIgDQpz
dWdnZXN0aW9uczoNCg0KICAgYm9vbCBmYl9tb2Rlc2V0dGluZ19kaXNhYmxlZChjb25zdCBj
aGFyICpkcnZuYW1lKQ0KICAgew0KICAgICAgZndvbmx5ID0gdmlkZW9fZmlybXdhcmVfZHJp
dmVyc19vbmx5KCkNCiAgICAgIGlmIChmYm9ubHkgJiYgZHJ2bmFtZSkNCglwcl93YXJuKCIi
KQ0KICAgICAgcmV0dXJuIGZib25seTsNCiAgIH0NCg0KRHJpdmVycyBjYW4gdXNlIHRoYXQg
Zm9yIHRoZSB0ZXN0Lg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQoNCj4gDQo+IEhlbGdl
DQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXIN
ClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwg
OTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpH
ZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------fyrWrYRXqZLgyhIByiVS45ZY--

--------------jq1kv0QifaGD1J9gYvl42emD
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmNqEFUFAwAAAAAACgkQlh/E3EQov+DR
UxAAuoa4xPwiPCYa7kUcjHxtO2m8oWqharvnnIIby9LKEYLpH2nRQliUXdjuFnCcwlBugbdJNOmT
bUluWmV4NHikeaySkSPctgvH1ChR9RDsfVFOMR++e5ufEZ+hWc9e04Z42gnDj9DlT/GUb2dCmj94
9hgGqpEp0iRBad4y9acADUb2f9iwTagi/mf/IdzHhBL1Z/Gt93z6Q9mBsDvW9ZnDaHO+ASQipDVJ
/MEb4HDufMBWWcQbirrtdwAENDA4IpIQv8QY6grspRrnuj5FKD35hZ9zzngTlLHSH5aBLY5dYj7U
lVIN/RAoBWJROzitXr6jusmt5HDAYDRPYb6RfEiWhhoFVqWD+fpwMHtUTEBgT153Ho+zzRICgmf/
tqcDhCdDrJet+N21sAYjwo056/ApO98Jd9Kou+nlrcRnNA74D/IqkK+sQXxYmLdev4oqoZcW+24G
6e9JLtoSt1v5TxYAr/L13ou42AKB1LzVbOoUNleu8b7SkWMkannkeeRhwqdWS0y35vWeuOq6cZl4
iSVZXZUEKFY+bW4uFPDwRqBLCfbx0mT2nPL4G/WdqMg70XpoZ2OYBYnB6YwMlt+0UHQIFZw/CYWH
JExV6YQXmU0XACW1O4Y8DAJqMXHjLEcBBG0IlO+01lVZWyhlf7MIxKLKJxEY5CqBiRzlxVAA78eb
CVI=
=Oc9w
-----END PGP SIGNATURE-----

--------------jq1kv0QifaGD1J9gYvl42emD--
