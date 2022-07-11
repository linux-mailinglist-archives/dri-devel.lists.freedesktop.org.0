Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6476956D736
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 09:59:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34E9A11BBCF;
	Mon, 11 Jul 2022 07:59:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D7C311BBCF
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 07:59:00 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D208C226F6;
 Mon, 11 Jul 2022 07:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1657526338; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IlWntfQBjI/2Q6jsxseuU3a8y+VuzoC7It9vyLtNSsw=;
 b=mx+/KCfzNPrhi82UnE+9Q8w6oTIIOj+bng94lizgtLCkB1TJlTCinv0Y9CrCdJImOrmnJS
 hddpbS0EeTspKFHPs+NxCuzMWn0iOs1gx3F4BIhkGCFPTfYzNGdPwsmK+EIMVvCKHhABu8
 5RIQYgzyWM7tU18fSYtQEd4kszkxVEg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1657526338;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IlWntfQBjI/2Q6jsxseuU3a8y+VuzoC7It9vyLtNSsw=;
 b=FKhk6qVwfqrwESnQyMWDW3zBVsp+qW2IaBxANugrofk/bWQ/mCB6tqeZ+jWBuWaIflMdti
 qHnvu9dhU9kVntCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 98D4613524;
 Mon, 11 Jul 2022 07:58:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id svhcJELYy2KGFgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 11 Jul 2022 07:58:58 +0000
Message-ID: <95302954-76bc-3da6-70ad-25a8a22a37f0@suse.de>
Date: Mon, 11 Jul 2022 09:58:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 02/11] fbdev/vga16fb: Create EGA/VGA devices in sysfb code
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, deller@gmx.de,
 daniel@ffwll.ch, sam@ravnborg.org, maxime@cerno.tech
References: <20220707153952.32264-1-tzimmermann@suse.de>
 <20220707153952.32264-3-tzimmermann@suse.de>
 <fec8dcc1-c490-3bb6-2d2f-805d690d3f95@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <fec8dcc1-c490-3bb6-2d2f-805d690d3f95@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------TQ9MgoKr9NQWzyOSyNa75S2p"
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
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------TQ9MgoKr9NQWzyOSyNa75S2p
Content-Type: multipart/mixed; boundary="------------JaHbeCmtdfeP0eUxvfewAWPT";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, deller@gmx.de,
 daniel@ffwll.ch, sam@ravnborg.org, maxime@cerno.tech
Cc: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 dri-devel@lists.freedesktop.org
Message-ID: <95302954-76bc-3da6-70ad-25a8a22a37f0@suse.de>
Subject: Re: [PATCH 02/11] fbdev/vga16fb: Create EGA/VGA devices in sysfb code
References: <20220707153952.32264-1-tzimmermann@suse.de>
 <20220707153952.32264-3-tzimmermann@suse.de>
 <fec8dcc1-c490-3bb6-2d2f-805d690d3f95@redhat.com>
In-Reply-To: <fec8dcc1-c490-3bb6-2d2f-805d690d3f95@redhat.com>

--------------JaHbeCmtdfeP0eUxvfewAWPT
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgSmF2aWVyLA0KDQpJJ2xsIHRyeSB0byBnaXZlIHRoZSBtb3RpdmF0aW9uIG9mIHRoaXMg
cGF0Y2ggYmVsb3cuIEkga25vd24gaXQncyByYXRoZXIgDQpoeXBvdGhldGljYWwgYXMgdGhl
IFZHQSBkcml2ZXIgaXMgcHJvYmFibHkgbm90IHVzZWQgbXVjaC4NCg0KQW0gMDguMDcuMjIg
dW0gMTU6MDkgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXM6DQo+IEhlbGxvIFRo
b21hcywNCj4gDQo+IE9uIDcvNy8yMiAxNzozOSwgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6
DQo+PiBNb3ZlIHRoZSBkZXZpY2UtY3JlYXRpb24gZnJvbSB2Z2ExNmZiIHRvIHN5c2ZiIGNv
ZGUuIE1vdmUgdGhlIGZldw0KPj4gZXh0cmEgdmlkZW9tb2RlIGNoZWNrcyBpbnRvIHZnYTE2
ZmIncyBwcm9iZSBmdW5jdGlvbi4NCj4+DQo+PiBUaGUgdmdhMTZmYiBkcml2ZXIgcmVxdWly
ZXMgYSBzY3JlZW5faW5mbyBmb3IgdHlwZSBWSURFT19UWVBFX1ZHQUMNCj4+IG9yIFZJREVP
X1RZUEVfRUdBQy4gU3VjaCBjb2RlIGlzIG5vd2hlcmUgcHJlc2VudCBpbiB0aGUga2VybmVs
LCBleGNlcHQNCj4+IGZvciBzb21lIE1JUFMgc3lzdGVtcy4gSXQncyBub3QgY2xlYXIgaWYg
dGhlIHZnYTE2ZmIgZHJpdmVyIGFjdHVhbGx5DQo+PiB3b3JrcyBpbiBwcmFjdGljZS4NCj4+
DQo+PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3Vz
ZS5kZT4NCj4+IC0tLQ0KPj4gICBkcml2ZXJzL2Zpcm13YXJlL3N5c2ZiLmMgICAgICB8ICA0
ICsrKw0KPj4gICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3ZnYTE2ZmIuYyB8IDU5ICsrKysrKysr
KysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tDQo+PiAgIDIgZmlsZXMgY2hhbmdlZCwgMzIg
aW5zZXJ0aW9ucygrKSwgMzEgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZmlybXdhcmUvc3lzZmIuYyBiL2RyaXZlcnMvZmlybXdhcmUvc3lzZmIuYw0KPj4g
aW5kZXggMWYyNzZmMTA4Y2M5Li4zZmQzNTYzZDk2MmIgMTAwNjQ0DQo+PiAtLS0gYS9kcml2
ZXJzL2Zpcm13YXJlL3N5c2ZiLmMNCj4+ICsrKyBiL2RyaXZlcnMvZmlybXdhcmUvc3lzZmIu
Yw0KPj4gQEAgLTk0LDYgKzk0LDEwIEBAIHN0YXRpYyBfX2luaXQgaW50IHN5c2ZiX2luaXQo
dm9pZCkNCj4+ICAgCQluYW1lID0gImVmaS1mcmFtZWJ1ZmZlciI7DQo+PiAgIAllbHNlIGlm
IChzaS0+b3JpZ192aWRlb19pc1ZHQSA9PSBWSURFT19UWVBFX1ZMRkIpDQo+PiAgIAkJbmFt
ZSA9ICJ2ZXNhLWZyYW1lYnVmZmVyIjsNCj4+ICsJZWxzZSBpZiAoc2ktPm9yaWdfdmlkZW9f
aXNWR0EgPT0gVklERU9fVFlQRV9WR0FDKQ0KPj4gKwkJbmFtZSA9ICJ2Z2EtZnJhbWVidWZm
ZXIiOw0KPj4gKwllbHNlIGlmIChzaS0+b3JpZ192aWRlb19pc1ZHQSA9PSBWSURFT19UWVBF
X0VHQUMpDQo+PiArDQo+IA0KPiBJIHdvbmRlciBpZiB3ZSByZWFsbHkgbmVlZCB0byBkbyB0
aGlzIGRpc3RpbmN0aW9uIG9yIGNvdWxkIGp1c3QgaGF2ZSBhIHNpbmdsZQ0KPiBwbGF0Zm9y
bSBkZXZpY2UgZm9yIGJvdGggVklERU9fVFlQRV9WR0FDIGFuZCBWSURFT19UWVBFX0VHQUMu
IEFmdGVyIGFsbCwgdGhlDQo+IHNhbWUgZmJkZXYgZHJpdmVyIGlzIGJvdW5kIGFnYWluc3Qg
Ym90aCBwbGF0Zm9ybSBkZXZpY2VzLg0KDQpXaXRoIHRoZSBjdXJyZW50IGRyaXZlciwgd2Ug
ZG9uJ3Qgc3RyaWN0bHkgbmVlZCB0byBkaXN0aW5ndWlzaC4gQnV0IHRoZSANCnN5c2ZiIGNv
ZGUgaXMgdGhlIG9uZSB3ZSBjYXJlIGFib3V0LiBTbyBJIHdhbnRlZCBpdCB0byBiZSBjbGVh
ciBhbmQgDQpuaWNlbHkgbG9va2luZy4gQWxsIHRoZSBtb2RlIHRlc3RzLCBldGMgZGVwZW5k
IG9uIHRoZSBkcml2ZXIgKHdoaWNoIG5vIA0Kb25lIGNhcmVzIGFib3V0KS4NCg0KVGhlcmUn
cyBhbHNvIGEgZGlmZmVyZW5jZSBpbiBoYXJkd2FyZSBmZWF0dXJlcyBiZXR3ZWVuIEVHQSBh
bmQgVkdBLiBNb3N0IA0Kbm90YWJseSwgVkdBIGhhcyBtdWNoIGJldHRlciBjb2xvciBzdXBw
b3J0Lg0KDQo+IA0KPiBbLi4uXQ0KPiANCj4+ICAgc3RhdGljIGludCB2Z2ExNmZiX3Byb2Jl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKmRldikNCj4+ICAgew0KPj4gKwlzdHJ1Y3Qgc2Ny
ZWVuX2luZm8gKnNpOw0KPj4gICAJc3RydWN0IGZiX2luZm8gKmluZm87DQo+PiAgIAlzdHJ1
Y3QgdmdhMTZmYl9wYXIgKnBhcjsNCj4+ICAgCWludCBpOw0KPj4gICAJaW50IHJldCA9IDA7
DQo+PiAgIA0KPj4gKwlzaSA9IGRldl9nZXRfcGxhdGRhdGEoJmRldi0+ZGV2KTsNCj4+ICsJ
aWYgKCFzaSkNCj4+ICsJCXJldHVybiAtRU5PREVWOw0KPj4gKw0KPj4gKwlyZXQgPSBjaGVj
a19tb2RlX3N1cHBvcnRlZChzaSk7DQo+PiArCWlmIChyZXQpDQo+PiArCQlyZXR1cm4gcmV0
Ow0KPj4gKw0KPiANCj4gV2hhdCBkbyB5b3Ugc2VlIGFzIHRoZSBhZHZhbnRhZ2Ugb2YgbW92
aW5nIHRoZSBjaGVjayB0byB0aGUgZHJpdmVyJ3MgcHJvYmU/DQo+IA0KPiBCZWNhdXNlIGFm
dGVyIHRoaXMgY2hhbmdlIHRoZSBwbGF0Zm9ybSBkcml2ZXIgd2lsbCBiZSByZWdpc3RlcmVk
IGJ1dCBmb3Igbm8NCj4gcmVhc29uLCBzaW5jZSBjYW4ndCBldmVuIHByb2JlIGlmIG9yaWdf
dmlkZW9faXNWR0EgaXMgbmVpdGhlciBWR0FDIG5vciBFR0FDLg0KDQpUaGUgZHJpdmVyIG9u
bHkgc3VwcG9ydHMgdmVyeSBzcGVjaWZpYyBtb2Rlcywgd2hpY2ggbWF5IG5vdCBiZSB3aGF0
IA0Kc2NyZWVuX2luZm8gZGV0ZWN0ZWQuIE5vdGUgdGhhdCBWR0FDL0VHQUMgY2FuIGFsc28g
cmVmZXIgdG8gdGV4dC1tb2RlIA0KYnVmZmVycy4gVGhlIGN1cnJlbnQgdmdhY29uIGNvdWxk
IGJlIHR1cm5lZCBpbnRvIGEgcGxhdGZvcm0gZHJpdmVyIHRoYXQgDQphZG9wdHMgc3VjaCBh
IHRleHQgYnVmZmVyIGFuZCBpbnRlZ3JhdGVzIGl0IHdpdGggYXBlcnR1cmUgaGVscGVycy4N
Cg0KPiANCj4gWy4uLl0NCj4gDQo+PiArc3RhdGljIGNvbnN0IHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2VfaWQgdmdhMTZmYl9kcml2ZXJfaWRfdGFibGVbXSA9IHsNCj4+ICsJeyJlZ2EtZnJh
bWVidWZmZXIiLCAwfSwNCj4+ICsJeyJ2Z2EtZnJhbWVidWZmZXIiLCAwfSwNCj4+ICsJeyB9
DQo+PiArfTsNCj4+ICsNCj4gDQo+IFRoZSBmYWN0IHRoYXQgdGhlIHR3byBlbnRyaWVzIGRv
bid0IGhhdmUgYSBwbGF0Zm9ybSBkYXRhIGlzIGFuIGluZGljYXRpb24gZm9yDQoNClRoZSBu
YW1lIGlzIHRoZSBpbmRpY2F0aW9uLiBJIGtub3cgdGhhdCB2Z2ExNiBkb2Vzbid0IHRyZWF0
IHRoZW0gDQpkaWZmZXJlbnRseS4NCg0KPiBtZSB0aGF0IHdlIGNvdWxkIGp1c3QgY29uc29s
aWRhdGUgaW4gYSBzaW5nbGUgInZnYTE2LWZyYW1lYnVmZmVyIiBvciBzbXQuIEkNCj4ga25v
dyB0aGF0IHRoaXMgd29uJ3QgYmUgY29uc2lzdGVudCB3aXRoIGVmaSwgdmVzYSwgZXRjIGJ1
dCBJIGRvbid0IHRoaW5rIGlzDQo+IHRoYXQgaW1wb3J0YW50IGFuZCBhbHNvIHF1aXRlIGxp
a2VseSB3ZSB3aWxsIGdldCByaWQgb2YgdGhpcyBkcml2ZXIgYW5kIHRoZQ0KPiBwbGF0Zm9y
bSBkZXZpY2UgcmVnaXN0cmF0aW9uIHNvb24uIFNpbmNlIGFzIHlvdSBzYWlkLCBpdCdzIHVu
Y2xlYXIgdGhhdCBpcw0KPiBldmVuIHVzZWQuDQoNClRoZXJlJ3MgbWlwcyBjb2RlIGluIHRo
ZSBhcmNoLyBkaXJlY3RvcnkgdGhhdCBhcHBlYXJzIHRvIHNldHVwIA0Kc2NyZWVuX2luZm8g
aW4gdGhlIGNvcnJlY3Qgd2F5LiBJIGNhbid0IHNheSB3aGV0aGVyIHRoYXQncyBzdGlsbCB1
c2VmdWwgDQp0byBhbnlvbmUuIE9uIHg4NiwgSSBjb3VsZCBzZXQgYSBWR0EgbW9kZSBvbiB0
aGUga2VybmVsIGNvbW1hbmQgbGluZSwgDQpidXQgc2NyZWVuX2luZm8ncyBpc1ZHQSBvbmx5
IGNvbnRhaW5lZCAnMScuIEl0IG1pZ2h0IGJlIHBvc3NpYmxlIHRvIGZpeCANCnRoaXMgZWFz
aWx5IGJ5IHNldHRpbmcgdGhlIHJpZ2h0IHZhbHVlcyBpbiB2Z2FfcHJvYmUoKS4gWzFdIEkg
c2ltcGx5IA0KZG9uJ3QgaGF2ZSB0aGUgdGltZSB0byBwcm92aWRlIGEgcGF0Y2ggYW5kIGRl
YWwgd2l0aCB0aGUgcG90ZW50aWFsIA0KZmFsbG91dCBvZiBzdWNoIGEgY2hhbmdlLg0KDQo+
IA0KPj4gICBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciB2Z2ExNmZiX2RyaXZlciA9
IHsNCj4+ICAgCS5wcm9iZSA9IHZnYTE2ZmJfcHJvYmUsDQo+PiAgIAkucmVtb3ZlID0gdmdh
MTZmYl9yZW1vdmUsDQo+PiAgIAkuZHJpdmVyID0gew0KPj4gLQkJLm5hbWUgPSAidmdhMTZm
YiIsDQo+PiArCQkubmFtZSA9ICJ2Z2EtZnJhbWVidWZmZXIiLA0KPj4gICAJfSwNCj4gDQo+
IE1heWJlICJ2Z2ExNi1mcmFtZWJ1ZmZlciIgaW5zdGVhZD8gU2luY2UgZm9yIGV4YW1wbGUg
VkVTQSBpcyBhbHNvIFZHQSBBRkFJSy4NCg0KVkVTQSBpcyBzb21ldGhpbmcgZWxzZSB0aGFu
IFZHQS4gU2V0dGluZyBhIFZFU0EgbW9kZSAoZG9uZSB2aWEgSU5UIDEwaCANCklJUkMpIGFu
ZCB0aGVuIGZpZGRsaW5nIHdpdGggVkdBIHN0YXRlIHdpbGwgbGlrZWx5IHByb2R1Y2UgYnJv
a2VuIG91dHB1dCANCm9uIHRoZSBzY3JlZW4uDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoN
ClsxXSANCmh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y1LjE4LjEwL3NvdXJj
ZS9hcmNoL3g4Ni9ib290L3ZpZGVvLXZnYS5jI0wyMzENCg0KPiANCg0KLS0gDQpUaG9tYXMg
WmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBT
b2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcs
IEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVy
OiBJdm8gVG90ZXYNCg==

--------------JaHbeCmtdfeP0eUxvfewAWPT--

--------------TQ9MgoKr9NQWzyOSyNa75S2p
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmLL2EIFAwAAAAAACgkQlh/E3EQov+Cz
txAAshYc6vP1DrkYLQbCNuPFFPhY6ipwD/+JGYIonnnBUZoBvAdE/pldrIFTnbTM7CMv5A1GwZKd
H0sK+BQRez6KoenLAq8eo/OGOir/0/VZD8OiQSTqZvvcs2Y51J1OWH4Qcb9lLkjZNWo35vMBSQm0
HD8umCgfyQ0zGTBkrLUgVTUHlWVEFPleJBVfHoELpo+OSqfJAFuW8ojjbWwHehb/JwHdQ0jkXSH+
JCWSpB4fCX9LIM0Yf91c9u6IsABQ7fWelzScl31KO6LhxaF7Q32sisQ9ZaBxjzjAepcsRxw9yCUE
VT204jzxoDH0KgMGCr5lXYuEODCdp9wPN0qedAw3iGjuw3LjoAOkTQClsqtTEn7hMQeH45Y/VtHl
bzKlsImWmuwe8e9s7gx6axawc/KGuyNFpCAVLJwp2LWlracLm18G7ggozfj1Fe+I5cPfPodWmaYk
mwN5X/w3tghLhXiRjF8QKYnhk/StcqdOK9S1DqVobnCtQBMjGvOgr0Cm1Mq6t+JTqxrsKsNETKPR
ikLRC3R11UsRp+1ll1vFyJt4iKCqNh5kDB4CH4UM8d/w+9vAgrat8/nT4DYL9e8l9DjFjHkPEAvh
2KjXosTS4tcu+tQCBi4t7V/LfOhm/Xmn5Awi/r+WfqKjCKeR03itIWQATcVPc+/4sCkh9bGdEqNu
0ng=
=JS2J
-----END PGP SIGNATURE-----

--------------TQ9MgoKr9NQWzyOSyNa75S2p--
