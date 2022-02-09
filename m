Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8724AF50D
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 16:21:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4693D10E204;
	Wed,  9 Feb 2022 15:21:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D451610E204
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 15:21:09 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7F3F121102;
 Wed,  9 Feb 2022 15:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644420068; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0gsG+OOopxEuh693BdcBnjh8UcladxYwrrkRHwJ7mBI=;
 b=pBAnMmrGo81oQ8oybIUu1ItVqogsohn4Zts7JQUKEXvkobQ9wLow5hz5Om3Cbm9MZLcwXM
 XYbC5wY7OhEp5lNn+yoALs/wJL1PmyX4H5UVyY9LeYbd5GcTqCtN8D1Zq/U0D85VeBfI7C
 6K2S6BOEtVO2NlUzjzUzXu67cFwctpc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644420068;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0gsG+OOopxEuh693BdcBnjh8UcladxYwrrkRHwJ7mBI=;
 b=SpTaNOjAwxnDTNd4Ycz8lGQrWa/3Y4JeC/YNVYwy8DGXiKllvIlZyJZofZay19Hgu/cKZk
 YBJE8tEZ/MeV+QCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4490E13D4F;
 Wed,  9 Feb 2022 15:21:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IsfAD+TbA2J6CAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 09 Feb 2022 15:21:08 +0000
Message-ID: <d5fc654c-643a-7b20-85f1-54169a3aa889@suse.de>
Date: Wed, 9 Feb 2022 16:21:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 2/7] drm/format-helper: Add drm_fb_{xrgb8888,
 gray8}_to_mono_reversed()
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20220209090314.2511959-1-javierm@redhat.com>
 <20220209090314.2511959-3-javierm@redhat.com>
 <6df9c28d-968d-ff16-988e-8e88e4734e49@suse.de>
 <f75a1544-5a3e-e49f-7eab-5dd5c72584b9@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <f75a1544-5a3e-e49f-7eab-5dd5c72584b9@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------wUsU9n6TUXoMmXjFd6Sl01Qi"
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
Cc: linux-fbdev@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard <maxime@cerno.tech>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------wUsU9n6TUXoMmXjFd6Sl01Qi
Content-Type: multipart/mixed; boundary="------------SboH3Z97a8U5LshpeDClu6bl";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: linux-fbdev@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Maxime Ripard
 <maxime@cerno.tech>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Message-ID: <d5fc654c-643a-7b20-85f1-54169a3aa889@suse.de>
Subject: Re: [PATCH v3 2/7] drm/format-helper: Add drm_fb_{xrgb8888,
 gray8}_to_mono_reversed()
References: <20220209090314.2511959-1-javierm@redhat.com>
 <20220209090314.2511959-3-javierm@redhat.com>
 <6df9c28d-968d-ff16-988e-8e88e4734e49@suse.de>
 <f75a1544-5a3e-e49f-7eab-5dd5c72584b9@redhat.com>
In-Reply-To: <f75a1544-5a3e-e49f-7eab-5dd5c72584b9@redhat.com>

--------------SboH3Z97a8U5LshpeDClu6bl
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDkuMDIuMjIgdW0gMTQ6MjYgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IEhlbGxvIFRob21hcywNCj4gDQo+IFRoYW5rcyBhIGxvdCBmb3IgeW91ciBm
ZWVkYmFjay4NCj4gDQo+IE9uIDIvOS8yMiAxMzo1MSwgVGhvbWFzIFppbW1lcm1hbm4gd3Jv
dGU6DQo+PiBIaQ0KPj4NCj4gDQo+IFtzbmlwXQ0KPiANCj4+PiArDQo+Pj4gKwkJaWYgKHhi
ID09IHBpeGVscyAtIDEgJiYgZW5kX29mZnNldCkNCj4+PiArCQkJZW5kID0gZW5kX29mZnNl
dDsNCj4+DQo+PiBlbmRfb2Zmc2V0IHNob3VsZCBiZSBjYWxsZWQgZW5kX2xlbiwgYmVjYXVz
ZSBpdCBpcyB0aGUgbnVtYmVyIG9mIGJpdHMgaW4NCj4+IHRoZSBmaW5hbCBieXRlOyBidXQg
bm90IHRoZSBvZmZzZXQgb2YgdGhlIGZpbmFsIGJpdC4NCj4+DQo+IA0KPiBJbmRlZWQuDQo+
IA0KPiBbc25pcF0NCj4gDQo+Pj4gK3ZvaWQgZHJtX2ZiX2dyYXk4X3RvX21vbm9fcmV2ZXJz
ZWQodm9pZCAqZHN0LCB1bnNpZ25lZCBpbnQgZHN0X3BpdGNoLCBjb25zdCB2b2lkICp2YWRk
ciwNCj4+PiArCQkJCSAgIGNvbnN0IHN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiLA0KPj4+
ICsJCQkJICAgY29uc3Qgc3RydWN0IGRybV9yZWN0ICpjbGlwKQ0KPiANCj4gW3NuaXBdDQo+
IA0KPj4NCj4+IERvIHlvdSByZWFsbHkgbmVlZCB0aGF0IGZ1bmN0aW9uLiBJdCdzIG5vdCBl
eHBvcnRlZCBhbmQgaWYgaXQncyBub3QNCj4+IG90aGVyd2lzZSB1c2VkLCBJJ2QganVzdCBy
ZW1vdmUgaXQuICBXZSBkb24ndCBrZWVwIHVudXNlZCBpbnRlcmZhY2VzIGFyb3VuZC4NCj4+
DQo+IA0KPiBBdCB0aGUgZW5kIGFmdGVyIHlvdXIgc3VnZ2VzdGlvbiBvZiBkb2luZyBsaW5l
LXBlci1saW5lIGNvbnZlcnNpb25zIGl0IGlzIG5vdA0KPiBuZWVkZWQsIGJ1dCBzaW5jZSBJ
IGFscmVhZHkgdHlwZWQgaXQgYW5kIHdlIHdlcmUgdGFsa2luZyBhYm91dCBhZGRpbmcgb3Ro
ZXINCj4gZm9ybWF0cyBiZXNpZGVzIHRoZSBmYWtlIFhSR0I4ODg4IGFzIGFuIG9wdGltaXph
dGlvbiAoUjggZm9yIGdyYXlzY2FsZSBhbmQNCj4gRHggb3Igc29tZXRoaW5nIGxpa2UgdGhh
dCBmb3IgcmV2ZXJzZWQgbW9ubyksIEkgdGhvdWdodCB0aGF0IHdvdWxkIGJlIHVzZWZ1bA0K
PiB0byBoYXZlIGl0IGFzIGEgaGVscGVyLg0KPiANCj4gQWxzbyBvdGhlciBkcml2ZXJzIHRo
YXQgd2FudCB0byBhZHZlcnRpc2UgYSBSOCBmb3JtYXQgY291bGQganVzdCB1c2UgaXQgYW5k
DQo+IG5vdCBoYXZpbmcgdG8gYWRkIHRoZWlyIG93biBoZWxwZXIuIEJ1dCBJJ20gaGFwcHkg
dG8gZHJvcCBpdCBpbiB2NCBpZiB5b3UNCj4gdGhpbmsgdGhhdCdzIGJldHRlciB0byBub3Qg
aGF2ZSB1bnVzZWQgaGVscGVycy4NCj4gDQo+IEl0IGNvdWxkIGJlIHRha2VuIGZyb20gdGhp
cyBwYXRjaC1zZXQgYW55d2F5cyBpZiBzb21lb25lIHdhbnRzIHRvIHdpcmUgdGhlDQo+IG5l
ZWRlZCBzdXBwb3J0IGZvciBSOC4NCg0KSSB0aGluaywgcG9saWN5IGlzIHRvIG5vdCBrZWVw
IHVudXNlZCBjb2RlIGFyb3VuZC4NCg0KPiANCj4gW3NuaXBdDQo+IA0KPj4+ICsNCj4+PiAr
CS8qDQo+Pj4gKwkgKiBUaGUgcmV2ZXJzZWQgbW9ubyBkZXN0aW5hdGlvbiBidWZmZXIgY29u
dGFpbnMgMSBiaXQgcGVyIHBpeGVsDQo+Pj4gKwkgKiBhbmQgZGVzdGluYXRpb24gc2Nhbmxp
bmVzIGhhdmUgdG8gYmUgaW4gbXVsdGlwbGUgb2YgOCBwaXhlbHMuDQo+Pj4gKwkgKi8NCj4+
PiArCWlmICghZHN0X3BpdGNoKQ0KPj4+ICsJCWRzdF9waXRjaCA9IERJVl9ST1VORF9VUChs
aW5lcGl4ZWxzLCA4KTsNCj4+DQo+PiBJJ2QgZG8gYSB3YXJuX29uY2UgaWYgKGRzdF9waXRj
aCAlIDggIT0gMCkuDQo+Pg0KPiANCj4gQWdyZWVkLiBJJ2xsIGFkZCBhIHdhcm5pbmcgYW4g
bWVudGlvbiB0aGF0IHdpbGwgYmUgcm91bmRlZCB1cC4NCj4gDQo+Pg0KPj4+ICsNCj4+PiAr
CS8qDQo+Pj4gKwkgKiBUaGUgY21hIG1lbW9yeSBpcyB3cml0ZS1jb21iaW5lZCBzbyByZWFk
cyBhcmUgdW5jYWNoZWQuDQo+Pj4gKwkgKiBTcGVlZCB1cCBieSBmZXRjaGluZyBvbmUgbGlu
ZSBhdCBhIHRpbWUuDQo+Pg0KPj4gSSBvbmNlIGhhZCBhIHBhdGNoc2V0IHRoYXQgYWRkcyBj
YWNoaW5nIGluZm9ybWF0aW9uIHRvIHN0cnVjdA0KPj4gZG1hX2J1Zl9tYXAgKHNvb24gdG8g
YmUgbmFtZWQgc3RydWN0IGlvc3lzX21hcCkuICBCbGl0dGluZyBoZWxwZXJzIHdvdWxkDQo+
PiBiZSBhYmxlIHRvIGVuYWJsZS9kaXNhYmxlIHRoaXMgb3B0aW1pemF0aW9uIGFzIG5lZWRl
ZC4NCj4+DQo+PiBIb3dldmVyLCB5b3VyIGRyaXZlciBkb2Vzbid0IHVzZSBDTUEuIEl0J3Mg
YmFja2VkIGJ5IFNITUVNLiBEbyB5b3UNCj4+IHJlYWxseSB3YW50IHRvIGtlZXAgdGhhdCBj
b2RlIGluPw0KPj4NCj4gDQo+IEl0IGRvZXNuJ3QgYnV0IHRoZSByZXBhcGVyIGRvZXMuIEFu
ZCBzaW5jZSB0aGUgcGxhbiB3YXMgdG8gbWFrZSB0aGF0IGRyaXZlcg0KPiB0byB1c2UgdGhl
IGhlbHBlciBpbnN0ZWFkIG9mIGhhdmluZyB0aGVpciBvd24sIEkgd2FudGVkIHRvIGFsc28g
bWFrZSBzdXJlDQo+IHRoYXQgd291bGQgd29yayB3ZWxsIHdpdGggQ01BLg0KDQpUaGF0IG1h
a2VzIHNlbnNlIHRoZW4uDQoNCj4gDQo+Pg0KPj4+ICsJICovDQo+Pj4gKwlzcmMzMiA9IGtt
YWxsb2MobGVuX3NyYzMyLCBHRlBfS0VSTkVMKTsNCj4+PiArCWlmICghc3JjMzIpDQo+Pj4g
KwkJcmV0dXJuOw0KPj4+ICsNCj4+PiArCS8qDQo+Pj4gKwkgKiBDb3BpZXMgYXJlIGRvbmUg
bGluZS1ieS1saW5lLCBhbGxvY2F0ZSBhbiBpbnRlcm1lZGlhdGUNCj4+PiArCSAqIGJ1ZmZl
ciB0byBjb3B5IHRoZSBncmF5OCBsaW5lcyBhbmQgdGhlbiBjb252ZXJ0IHRvIG1vbm8uDQo+
Pj4gKwkgKi8NCj4+PiArCWdyYXk4ID0ga21hbGxvYyhsaW5lcGl4ZWxzLCBHRlBfS0VSTkVM
KTsNCj4+PiArCWlmICghZ3JheTgpDQo+Pj4gKwkJZ290byBmcmVlX3NyYzMyOw0KPj4NCj4+
IElmIG1pZ2h0IGJlIGZhc3RlciB0byBhbGxvY2F0ZSBib3RoIGJ1ZmZlcnMgaW4gb25lIHN0
ZXAgYW5kIHNldCB0aGUNCj4+IHBvaW50ZXJzIGludG8gdGhlIGFsbG9jYXRlZCBidWZmZXIu
DQo+Pg0KPiANCj4gTm90IHN1cmUgSSBnb3QgdGhpcy4gRG8geW91IG1lYW4gdG8gaGF2ZSBh
IHNpbmdsZSBidWZmZXIgd2l0aCBsZW5ndGgNCj4gbGluZXBpeGVscyArIGxlbl9zcmMzMiBh
bmQgcG9pbnQgc3JjMzIgYW5kIGdyYXk4IHRvIHRoZSBzYW1lIGJ1ZmZlciA/DQoNClRoYXQn
cyB0aGUgaWRlYS4gSSBkb24ndCBrbm93IHRoZSBleGFjdCBvdmVyaGVhZCBmb3Iga2FsbG9j
KCksIGJ1dCBhdCANCmxlYXN0IHRoZSBpbiB1c2Vyc3BhY2UsIG1hbGxvYygpIGluIGhvdCBj
b2RlIHBhdGhzIGlzIG5vdCBhIGdvb2QgaWRlYS4gDQpUaGVyZSdzIHVzdWFsbHkgc29tZSBz
ZWFyY2hpbmcgZm9yIGZyZWUgc3BhY2UgaW52b2x2ZWQuDQoNCkluIHRoZSBsb25nIHRlcm0s
IHdlIGNvdWxkIGFkZCBhIGZpZWxkIGluIHN0cnVjdCBkcm1fZnJhbWVidWZmZXIgdG8ga2Vl
cCANCnN1Y2ggYnVmZmVycyBhcm91bmQgZm9yIHJldXNlLg0KDQo+IA0KPj4+ICsNCj4+PiAr
CS8qDQo+Pj4gKwkgKiBGb3IgZGFtYWdlIGhhbmRsaW5nLCBpdCBpcyBwb3NzaWJsZSB0aGF0
IG9ubHkgcGFydHMgb2YgdGhlIHNvdXJjZQ0KPj4+ICsJICogYnVmZmVyIGlzIGNvcGllZCBh
bmQgdGhpcyBjb3VsZCBsZWFkIHRvIHN0YXJ0IGFuZCBlbmQgcGl4ZWxzIHRoYXQNCj4+PiAr
CSAqIGFyZSBub3QgYWxpZ25lZCB0byBtdWx0aXBsZSBvZiA4Lg0KPj4+ICsJICoNCj4+PiAr
CSAqIENhbGN1bGF0ZSBpZiB0aGUgc3RhcnQgYW5kIGVuZCBwaXhlbHMgYXJlIG5vdCBhbGln
bmVkIGFuZCBzZXQgdGhlDQo+Pj4gKwkgKiBvZmZzZXRzIGZvciB0aGUgcmV2ZXJzZWQgbW9u
byBsaW5lIGNvbnZlcnNpb24gZnVuY3Rpb24gdG8gYWRqdXN0Lg0KPj4+ICsJICovDQo+Pj4g
KwlzdGFydF9vZmZzZXQgPSBjbGlwLT54MSAlIDg7DQo+Pj4gKwllbmRfb2Zmc2V0ID0gY2xp
cC0+eDIgJSA4Ow0KPj4NCj4+IGVuZF9sZW4sIGFnYWluLiBJZiB5b3UgaGF2ZSAxIHNpbmds
ZSBiaXQgc2V0IGluIHRoZSBmaW5hbCBieXRlLCB0aGUNCj4+IG9mZnNldCBpcyAwLCBidXQg
dGhlIGxlbmd0aCBpcyAxLg0KPj4NCj4gDQo+IEFncmVlZCwgd2lsbCBjaGFuZ2UgaXQgdG9v
Lg0KDQpGZWVsIGZyZWUgdG8gYWRkIG15DQoNClJldmlld2VkLWJ5OiBUaG9tYXMgWmltbWVy
bWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCg0KdG8gdGhlIG5leHQgdmVyc2lvbi4NCg0K
QmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gQmVzdCByZWdhcmRzLA0KDQotLSANClRo
b21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3
YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJu
YmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bD
vGhyZXI6IEl2byBUb3Rldg0K

--------------SboH3Z97a8U5LshpeDClu6bl--

--------------wUsU9n6TUXoMmXjFd6Sl01Qi
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmID2+MFAwAAAAAACgkQlh/E3EQov+CS
nA//bppg88zizs6GVQYgs+Eirsf8zaZp2LGOvV941RQgPr7a45UIpIihJxxqVmNDW+D4yve5jn1g
fRQ1ybGsu/7H6QBptrJwJUJ+3aSQSeEcCOtN6T9Na5ELm6CYu8HG/46cgjcIeMV9PpZNKSxeqPl9
SqoJCgxLpkfn58HQ7L7B8aP36Ii1KHaQa414lLyhrsUJvgwVfmWHcQFQyXFn4w+IMGGRNwBx1J2z
2AvQQhIN6y/89/RQZYfjeqBQzyEWT7IAO4RHfQnBbfr3PcdMTAFXgZOtVZLqn19Nn1Owlrk4hdhU
2PDvJA1Tz5lqsK1i9MI9aP4cDOr8BtzRcIkjUnk8EdG1Gc3jqjSPLUjWodg9iMtkY1erVyorZiIt
mc4oC1f/K/WXWrsKgYW4/k349TLihSj0o3IKeoQojMhe3nWczGfuQ9kY5qgzkEBjMPQKOWcjqhSx
XMjw0me0pLCUhsckzE4wFzhkFaZu/CcsgrcAyMxNrC7y4XWPKgVPXFJUzIbGpCnVyZ574DTRWhlf
FJ2+bwp1q63yAisdwNZs5pCpYP7KXqQWCqaZYb0KGLIIBr/n8gFMHi+UYgiBDQ28HGRBEoXZDWg8
X/afCjUbIKWs/uVcBIncwJqTN3Mjit2J3XtknihvqdHeZwx0v4F4doSzGRJpXHt9/3ZSONEEA2je
bYs=
=OfCw
-----END PGP SIGNATURE-----

--------------wUsU9n6TUXoMmXjFd6Sl01Qi--
