Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BCF6CFCAE
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 09:26:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B72D10ED00;
	Thu, 30 Mar 2023 07:26:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DA6610ECFB
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 07:26:35 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 69F7521A97;
 Thu, 30 Mar 2023 07:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680161193; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sDQaHMTCkHnpZY7hxkm0yiW39lbK9+TltXhowV+JZcg=;
 b=R84rW83fkPFuwZhEh2DAgDFI6fWNtuiMuPR2W827VTTLlQ6Ez+EMKcd46gwJMwdOqj5gwQ
 duTgOuPx8N1GrPAqKZxUaSUcEUe+rUalEJMgOpyycJZcVH0PE4MWhK8N71nN/YUptYUYvL
 LN0bDma55VAJdPdiGLS6vc4nRdF4xMw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680161193;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sDQaHMTCkHnpZY7hxkm0yiW39lbK9+TltXhowV+JZcg=;
 b=oZcqOZUKfKFsemagRX2uQ+FCj1hQXYyr5hNA+jmN0HX7S1fmduMXdVCMbePRgxAviUYZ9Y
 WHikQKP/Y8WULaBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 468391348E;
 Thu, 30 Mar 2023 07:26:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id HOBJEKk5JWQ3dgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 30 Mar 2023 07:26:33 +0000
Message-ID: <4e2a2222-59c2-2935-08a7-4a661d5073b2@suse.de>
Date: Thu, 30 Mar 2023 09:26:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] drm/fbdev-generic: optimize out a redundant assignment
 clause
Content-Language: en-US
To: Sui Jingfeng <15330273260@189.cn>,
 Lucas De Marchi <lucas.demarchi@intel.com>
References: <20230325074636.136833-1-15330273260@189.cn>
 <a3370ae7-8c78-8170-f9c3-7f616a1fa382@suse.de>
 <20230330041726.w7boceq7ljymvfq2@ldmartin-desk2>
 <f42d8ab8-c765-2517-7d25-6ce1dea320e8@suse.de>
 <2e6ec82f-dfde-0f3a-7980-136cea161d6b@189.cn>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <2e6ec82f-dfde-0f3a-7980-136cea161d6b@189.cn>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------awmMR6Ed2ZWYLUBbWlBFctIB"
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
Cc: David Airlie <airlied@linux.ie>, liyi <liyi@loongson.cn>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------awmMR6Ed2ZWYLUBbWlBFctIB
Content-Type: multipart/mixed; boundary="------------AZ3hUxuT4d0NSDAR5mlk9A18";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sui Jingfeng <15330273260@189.cn>,
 Lucas De Marchi <lucas.demarchi@intel.com>
Cc: David Airlie <airlied@linux.ie>, liyi <liyi@loongson.cn>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <4e2a2222-59c2-2935-08a7-4a661d5073b2@suse.de>
Subject: Re: [PATCH] drm/fbdev-generic: optimize out a redundant assignment
 clause
References: <20230325074636.136833-1-15330273260@189.cn>
 <a3370ae7-8c78-8170-f9c3-7f616a1fa382@suse.de>
 <20230330041726.w7boceq7ljymvfq2@ldmartin-desk2>
 <f42d8ab8-c765-2517-7d25-6ce1dea320e8@suse.de>
 <2e6ec82f-dfde-0f3a-7980-136cea161d6b@189.cn>
In-Reply-To: <2e6ec82f-dfde-0f3a-7980-136cea161d6b@189.cn>

--------------AZ3hUxuT4d0NSDAR5mlk9A18
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMzAuMDMuMjMgdW0gMDk6MTcgc2NocmllYiBTdWkgSmluZ2Zlbmc6DQo+IEhp
LA0KPiANCj4gT24gMjAyMy8zLzMwIDE0OjU3LCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToN
Cj4+IEhpDQo+Pg0KPj4gQW0gMzAuMDMuMjMgdW0gMDY6MTcgc2NocmllYiBMdWNhcyBEZSBN
YXJjaGk6DQo+Pj4gT24gV2VkLCBNYXIgMjksIDIwMjMgYXQgMTE6MDQ6MTdBTSArMDIwMCwg
VGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6DQo+Pj4+IChjYydpbmcgTHVjYXMpDQo+Pj4+DQo+
Pj4+IEhpDQo+Pj4+DQo+Pj4+IEFtIDI1LjAzLjIzIHVtIDA4OjQ2IHNjaHJpZWIgU3VpIEpp
bmdmZW5nOg0KPj4+Pj4gwqBUaGUgYXNzaWdubWVudCBhbHJlYWR5IGRvbmUgaW4gZHJtX2Ns
aWVudF9idWZmZXJfdm1hcCgpLA0KPj4+Pj4gwqBqdXN0IHRyaXZhbCBjbGVhbiwgbm8gZnVu
Y3Rpb25hbCBjaGFuZ2UuDQo+Pj4+Pg0KPj4+Pj4gU2lnbmVkLW9mZi1ieTogU3VpIEppbmdm
ZW5nIDwxNTMzMDI3MzI2MEAxODkuY24+DQo+Pj4+PiAtLS0NCj4+Pj4+IMKgZHJpdmVycy9n
cHUvZHJtL2RybV9mYmRldl9nZW5lcmljLmMgfCA1ICsrLS0tDQo+Pj4+PiDCoDEgZmlsZSBj
aGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+Pj4+Pg0KPj4+Pj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJkZXZfZ2VuZXJpYy5jIA0KPj4+
Pj4gYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiZGV2X2dlbmVyaWMuYw0KPj4+Pj4gaW5kZXgg
NGQ2MzI1ZTkxNTY1Li4xZGE0OGU3MWM3ZjEgMTAwNjQ0DQo+Pj4+PiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vZHJtX2ZiZGV2X2dlbmVyaWMuYw0KPj4+Pj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2RybV9mYmRldl9nZW5lcmljLmMNCj4+Pj4+IEBAIC0yODIsNyArMjgyLDcgQEAgc3Rh
dGljIGludCBkcm1fZmJkZXZfZGFtYWdlX2JsaXQoc3RydWN0IA0KPj4+Pj4gZHJtX2ZiX2hl
bHBlciAqZmJfaGVscGVyLA0KPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBzdHJ1Y3QgZHJtX2NsaXBfcmVjdCAqY2xpcCkNCj4+Pj4+IMKgew0KPj4+Pj4gwqDC
oMKgwqAgc3RydWN0IGRybV9jbGllbnRfYnVmZmVyICpidWZmZXIgPSBmYl9oZWxwZXItPmJ1
ZmZlcjsNCj4+Pj4+IC3CoMKgwqAgc3RydWN0IGlvc3lzX21hcCBtYXAsIGRzdDsNCj4+Pj4+
ICvCoMKgwqAgc3RydWN0IGlvc3lzX21hcCBtYXA7DQo+Pj4+PiDCoMKgwqDCoCBpbnQgcmV0
Ow0KPj4+Pj4gwqDCoMKgwqAgLyoNCj4+Pj4+IEBAIC0zMDIsOCArMzAyLDcgQEAgc3RhdGlj
IGludCBkcm1fZmJkZXZfZGFtYWdlX2JsaXQoc3RydWN0IA0KPj4+Pj4gZHJtX2ZiX2hlbHBl
ciAqZmJfaGVscGVyLA0KPj4+Pj4gwqDCoMKgwqAgaWYgKHJldCkNCj4+Pj4+IMKgwqDCoMKg
wqDCoMKgwqAgZ290byBvdXQ7DQo+Pj4+PiAtwqDCoMKgIGRzdCA9IG1hcDsNCj4+Pj4+IC3C
oMKgwqAgZHJtX2ZiZGV2X2RhbWFnZV9ibGl0X3JlYWwoZmJfaGVscGVyLCBjbGlwLCAmZHN0
KTsNCj4+Pj4+ICvCoMKgwqAgZHJtX2ZiZGV2X2RhbWFnZV9ibGl0X3JlYWwoZmJfaGVscGVy
LCBjbGlwLCAmbWFwKTsNCj4+Pj4NCj4+Pj4gSSBzZWUgd2hhdCB5b3UncmUgZG9pbmcgYW5k
IGl0J3MgcHJvYmFibHkgY29ycmVjdCBpbiB0aGlzIGNhc2UuDQo+Pj4+DQo+Pj4+IEJ1dCB0
aGVyZSdzIGEgbGFyZ2VyIGlzc3VlIHdpdGggdGhpcyBpb3N5cyBpbnRlcmZhY2VzLiBTb21l
dGltZXMgdGhlIA0KPj4+PiBhZGRyZXNzIGhhcyB0byBiZSBtb2RpZmllZCAoc2VlIGNhbGxz
IG9mIGlvc3lzX21hcF9pbmNyKCkpLiBUaGF0IGNhbiANCj4+Pj4gcHJldmVudCBpbmNvcnJl
Y3QgdXNlcyBvZiB0aGUgbWFwcGluZyBpbiBvdGhlciBwbGFjZXMsIGVzcGVjaWFsbHkgaW4g
DQo+Pj4+IHVubWFwIGNvZGUuDQo+Pj4NCj4+PiB1c2luZyBhIGluaXRpYWxpemVyIGZvciB0
aGUgY2FzZXMgaXQncyBuZWVkZWQgSU1PIHdvdWxkIG1ha2UgdGhlc2Uga2luZA0KPj4+IG9m
IHByb2JsZW1zIGdvIGF3YXksIGJlY2F1c2UgdGhlbiB0aGUgaW50ZW50IGlzIGV4cGxpY2l0
DQo+Pj4NCj4+Pj4NCj4+Pj4gSSB0aGluayBpdCB3b3VsZCBtYWtlIHNlbnNlIHRvIGNvbnNp
ZGVyIGEgc2VwYXJhdGUgc3RydWN0dXJlIGZvciB0aGUgDQo+Pj4+IEkvTyBsb2NhdGlvbi4g
VGhlIGJ1ZmZlciBhcyBhIHdob2xlIHdvdWxkIHN0aWxsIGJlIHJlcHJlc2VudGVkIGJ5IA0K
Pj4+PiBzdHJ1Y3QgaW9zeXNfbWFwLsKgIEFuZCB0aGF0IG5ldyBzdHJ1Y3R1cmUsIGxldCdz
IGNhbGwgaXQgc3RydWN0IA0KPj4+PiBpb3N5c19wdHIsIHdvdWxkIHBvaW50IHRvIGFuIGFj
dHVhbCBsb2NhdGlvbiB3aXRoaW4gdGhlIGJ1ZmZlcidzDQo+Pj4NCj4+PiBzb3VuZHMgZmlu
ZSB0byBtZSwgYnV0IEknZCBoYXZlIHRvIHRha2UgYSBkZWVwZXIgbG9vayBsYXRlciAob3Ig
d2hlbg0KPj4+IHNvbWVvbmUgd3JpdGVzIHRoZSBwYXRjaCkuwqAgSXQgc2VlbXMgd2UnZCBy
ZXBsaWNhdGUgYWxtb3N0IHRoZSBlbnRpcmUNCj4+PiBBUEkgdG8ganVzdCBhY2NvbW9kYXRl
IHRoZSAyIHN0cnVjdHMuwqAgQW5kIHRoZSBkaWZmZXJlbnQgdHlwZXMgd2lsbCBsZWFkDQo+
Pj4gdG8gY29uZnVzaW9uIHdoZW4gb25lIG9yIHRoZSBvdGhlciBzaG91bGQgYmUgdXNlZA0K
Pj4NCj4+IEkgdGhpbmsgd2UgY2FuIHNwbGl0IHRoZSBjdXJyZW50IGludGVyZmFjZSBvbnRv
IHR3byBjYXRlZ29yaWVzOiANCj4+IG1hcHBpbmcgYW5kIEkvTy4gVGhlIGZvcm1lciB3b3Vs
ZCB1c2UgaW9zeXNfbWFwIGFuZCB0aGUgbGF0dGVyIHdvdWxkIA0KPj4gdXNlIGlvc3lzX3B0
ci4gQW5kIHdlJ2QgbmVlZCBhIGhlbHBlciB0aGF0IHR1cm5zIGdldHMgYSBwdHIgZm9yIGEg
DQo+PiBnaXZlbiBtYXAuDQo+Pg0KPj4gSWYgSSBmaW5kIHRoZSB0aW5lLCBJJ2xsIHByb2Jh
Ymx5IHR5cGUgdXAgYSBwYXRjaC4NCj4+DQo+ICDCoEhlcmUgaSBmaXggYSB0eXBvLCAndGlu
ZScgLT4gJ3RpbWUnDQo+IA0KPiBBcyBmYXIgYXMgaSBjYW4gc2VlLCB0aGV5IGFyZSB0d28g
bWFqb3IgdHlwZSBvZiBtZW1vcnkgaW4gdGhlIHN5c3RlbS4NCj4gDQo+IFN5c3RlbSBtZW1v
cnkgb3IgVlJBTSzCoCBmb3IgdGhlIGdwdSB3aXRoIGRlZGljYXRlIHZpZGVvIHJhbSwgVlJB
TSBpcyANCj4gYmVsb25nIHRvIHRoZSBJTyBtZW1vcnkgY2F0ZWdvcnkuDQo+IA0KPiBCdXQg
dGhlcmUgYXJlIHN5c3RlbSBjaG9vc2UgY2FydmVvdXQgcGFydCBvZiBzeXN0ZW0gcmFtIGFz
IHZpZGVvIA0KPiByYW0oaTkxNT8swqAgZm9yIGV4YW1wbGUpLg0KPiANCj4gdGhlIG5hbWUg
aW9zeXNfbWFwIGFuZCBpb3N5c19wdHIgaGF2ZSBubyBkaWZmZXJlbmNlIGF0IHRoZSBmaXJz
dCBzaWdodCwgDQo+IHRlbGwgbWUgd2hpY2ggb25lIGlzIGZvciBtYXBwaW5nIHN5c3RlbSBy
YW0NCj4gDQo+IGFuZCB3aGljaCBvbmUgaXMgZm9yIG1hcHBpbmcgdnJhbT8NCg0KQXMgeW91
IHNheSBjb3JyZWN0bHksIGdyYXBoaWNzIGJ1ZmZlcnMgYW5kIGJlIGluIHZhcmlvdXMgbG9j
YXRpb25zLiBUaGV5IA0KY2FuIGV2ZW4gbW92ZSBiZXR3ZWVuIEkvTyBhbmQgc3lzdGVtIG1l
bW9yeS4gVGhlIGlkZWEgYmVoaW5kIGlvc3lzX21hcCANCigiSS9PIGFuZC9vciBzeXN0ZW0g
bWFwcGluZyIpIGlzIHRoYXQgaXQncyBhIHNpbmdsZSBpbnRlcmZhY2UgdGhhdCBjYW4gDQpo
YW5kbGUgYm90aC4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gDQo+PiBCZXN0
IHJlZ2FyZHMNCj4+IFRob21hcw0KPj4NCj4+Pg0KPj4+IHRoYW5rcw0KPj4+IEx1Y2FzIERl
IE1hcmNoaQ0KPj4+DQo+Pj4+IG1lbW9yeSByYW5nZS4gQSBmZXcgbG9jYXRpb25zIGFuZCBo
ZWxwZXJzIHdvdWxkIG5lZWQgY2hhbmdlcywgYnV0IA0KPj4+PiB0aGVyZSBhcmUgbm90IHNv
IG1hbnkgY2FsbGVycyB0aGF0IGl0J3MgYW4gaXNzdWUuwqAgVGhpcyB3b3VsZCBhbHNvIA0K
Pj4+PiBhbGxvdyBmb3IgYSBmZXcgZGVidWdnaW5nIHRlc3RzIHRoYXQgZW5zdXJlIHRoYXQg
aW9zeXNfcHRyIGFsd2F5cyANCj4+Pj4gb3BlcmF0ZXMgd2l0aGluIHRoZSBib3VuZHMgb2Yg
YW4gaW9zeXNfbWFwLg0KPj4+Pg0KPj4+PiBJJ3ZlIGxvbmcgY29uc2lkZXJlZCB0aGlzIGlk
ZWEsIGJ1dCB0aGVyZSB3YXMgbm8gcHJlc3N1cmUgdG8gd29yayBvbiANCj4+Pj4gaXQuIE1h
eWJlIG5vdy4NCj4+Pj4NCj4+Pj4gQmVzdCByZWdhcmRzDQo+Pj4+IFRob21hcw0KPj4+Pg0K
Pj4+Pj4gwqDCoMKgwqAgZHJtX2NsaWVudF9idWZmZXJfdnVubWFwKGJ1ZmZlcik7DQo+Pj4+
DQo+Pj4+IC0tIA0KPj4+PiBUaG9tYXMgWmltbWVybWFubg0KPj4+PiBHcmFwaGljcyBEcml2
ZXIgRGV2ZWxvcGVyDQo+Pj4+IFNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21i
SA0KPj4+PiBNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCj4+Pj4g
KEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KPj4+PiBHZXNjaMOkZnRzZsO8aHJlcjogSXZv
IFRvdGV2DQo+Pj4NCj4+Pg0KPj4+DQo+Pg0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpH
cmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJt
YW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhS
QiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K


--------------AZ3hUxuT4d0NSDAR5mlk9A18--

--------------awmMR6Ed2ZWYLUBbWlBFctIB
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQlOagFAwAAAAAACgkQlh/E3EQov+Dq
wg//QDUJBEFxbwmqonsq6Qnr2ZH1cQXZOBGZcVWNtAgdeIck109cjCZWBfOF2c08VTu5eAfM9zgr
gMk9nRc6Pgbl474dW/W3UFoqmIc+Pj6rUeyFRHixVeCCR8sFlCZELnQVpQpEc91liy1xGdjI4f80
N05pIaiE9D7YaTYiLOzOqkapkaxT5m4Lr+hHGBHYbVbyjcovz56kGIJmHWYLQQVXINN2iU1ZTfZv
NtY259V4f78c5d9oy+UX9xNMV7F083NG/chfs66qnkPYnXiS7P6wHxJFdSSg4o7CHvCE0b0CT5dQ
XVkpjoHVxraxpbfVf1Q8OZ1o2ZlXb3y6GeIQdQEg3L4NKJ+GnU+dyz1cix1RbU03eJEq2BuO+xq0
xzJkiGucsN8LZWkPMm+GuxhemVmMHOP42XhVhhsRyEdJ4Ie9WNbWy9sfLrcQKkpZc6Iu+5M5z1hf
NSmptnyjPJ2dMbB3MraUEnyf3MK/GQitfUCLj5phwsPSptKYUadLn1xaNE+dr8hNtFpEVMShDDhF
6yTSFH1+lAT77rhQHr0I8tcJpKeLB0Y9o50+DefT80T7DZBmDxbc/PjH5/nKfkCtmU4VbjuXYBKY
MaWvcfa8qaQkP3tc82nuNFz8KaVSpWj8+URZxrOA8rB9weORgHkmyZp4BZZZIVeUS2o8EI3c6Jb9
W6g=
=yI6g
-----END PGP SIGNATURE-----

--------------awmMR6Ed2ZWYLUBbWlBFctIB--
