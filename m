Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA38D706FB9
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 19:44:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C55E610E265;
	Wed, 17 May 2023 17:44:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C37110E260;
 Wed, 17 May 2023 17:43:58 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8816C22493;
 Wed, 17 May 2023 17:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1684345434; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c/qLVJLHZAWWriPygmMDN2Za8L0L2Z8Q88T7MfaLVtI=;
 b=K/jPUILgpDBpWz0XztExDqRoxpdXwJePBefVM0v1zrntvaSUxmahEsPQGbYtdVALhAmMLQ
 lmhCzhhc2mXfo+DsJHUemnr54SU/CThC1r3vDlKweTIKH69ffEBuvoJgRI1jVDIMmSLfx2
 DMCkOsR/mhhv8syMCjvPOxG4yYoZ9EM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1684345434;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c/qLVJLHZAWWriPygmMDN2Za8L0L2Z8Q88T7MfaLVtI=;
 b=ffrekBNJ0vWFrf6R+eobXXBZ5M/quKgDzDFENTuPaG6+kU0LBZo7CubGLc9ME1MlFQLUb8
 3lt8Kte4e5ur1yDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4AC1113358;
 Wed, 17 May 2023 17:43:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id pWBeEFoSZWRIQwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 17 May 2023 17:43:54 +0000
Message-ID: <2ee8f9f8-ec28-0a60-69df-259a95212aa7@suse.de>
Date: Wed, 17 May 2023 19:43:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v5 1/7] drm: fix drmm_mutex_init()
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
References: <20230517152244.348171-1-matthew.auld@intel.com>
 <ccc963ec-5328-d418-bb20-88d2776a5b07@suse.de>
 <166214dd-ec9e-b9bd-5bae-d035b3db918c@intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <166214dd-ec9e-b9bd-5bae-d035b3db918c@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------nDVLGpfseCOfXrNk602L0nB9"
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------nDVLGpfseCOfXrNk602L0nB9
Content-Type: multipart/mixed; boundary="------------8KQf634wXXo2PIpmusHBApbA";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Matthew Auld <matthew.auld@intel.com>, intel-xe@lists.freedesktop.org
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Message-ID: <2ee8f9f8-ec28-0a60-69df-259a95212aa7@suse.de>
Subject: Re: [PATCH v5 1/7] drm: fix drmm_mutex_init()
References: <20230517152244.348171-1-matthew.auld@intel.com>
 <ccc963ec-5328-d418-bb20-88d2776a5b07@suse.de>
 <166214dd-ec9e-b9bd-5bae-d035b3db918c@intel.com>
In-Reply-To: <166214dd-ec9e-b9bd-5bae-d035b3db918c@intel.com>

--------------8KQf634wXXo2PIpmusHBApbA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTcuMDUuMjMgdW0gMTk6MDQgc2NocmllYiBNYXR0aGV3IEF1bGQ6DQo+IE9u
IDE3LzA1LzIwMjMgMTc6MjEsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4gSGkNCj4+
DQo+PiBBbSAxNy4wNS4yMyB1bSAxNzoyMiBzY2hyaWViIE1hdHRoZXcgQXVsZDoNCj4+PiBJ
biBtdXRleF9pbml0KCkgbG9ja2RlcCBzZWVtcyB0byBpZGVudGlmeSBhIGxvY2sgYnkgZGVm
aW5pbmcgYSBzdGF0aWMNCj4+PiBrZXkgZm9yIGVhY2ggbG9jayBjbGFzcy4gSG93ZXZlciBp
ZiB3ZSB3cmFwIHRoZSB3aG9sZSB0aGluZyBpbiBhDQo+Pj4gZnVuY3Rpb24gdGhlIHN0YXRp
YyBrZXkgd2lsbCBiZSB0aGUgc2FtZSBmb3IgZXZlcnl0aGluZyBjYWxsaW5nIHRoYXQNCj4+
PiBmdW5jdGlvbiwgd2hpY2ggbG9va3MgdG8gYmUgdGhlIGNhc2UgZm9yIGRybW1fbXV0ZXhf
aW5pdCgpLiBUaGlzIHRoZW4NCj4+PiByZXN1bHRzIGluIGltcG9zc2libGUgbG9ja2RlcCBz
cGxhdHMgc2luY2UgbG9ja2RlcCB0aGlua3MgY29tcGxldGVseQ0KPj4+IHVucmVsYXRlZCBs
b2NrcyBhcmUgdGhlIHNhbWUgbG9jayBjbGFzcy4gVGhlIG90aGVyIGlzc3VlIGlzIHRoYXQg
d2hlbg0KPj4+IGxvb2tpbmcgYXQgc3BsYXRzIHdlIGxvc2UgdGhlIGFjdHVhbCBsb2NrIG5h
bWUsIHdoZXJlIGluc3RlYWQgb2Ygc2VlaW5nDQo+Pj4gc29tZXRoaW5nIGxpa2UgeGUtPm1l
bV9hY2Nlc3MubG9jayBmb3IgdGhlIG5hbWUsIHdlIGp1c3Qgc2VlIHNvbWV0aGluZw0KPj4+
IGdlbmVyaWMgbGlrZSBsb2NrIzguDQo+Pj4NCj4+PiBBdHRlbXB0IHRvIGZpeCB0aGlzIGJ5
IGNvbnZlcnRpbmcgZHJtbV9tdXRleF9pbml0KCkgaW50byBhIG1hY3JvLCB3aGljaA0KPj4+
IHNob3VsZCBlbnN1cmUgdGhhdCBtdXRleF9pbml0KCkgYmVoYXZlcyBhcyBleHBlY3RlZC4N
Cj4+DQo+PiBJZiB0aGF0J3Mgd2hhdCBpcyByZXF1aXJlZCwgdGhlbiBPSy4gQnV0IGV2ZW4g
d2l0aCB5b3VyIGNvbW1pdCBtZXNhZ2UsIA0KPj4gSSBmaW5kIGl0IGVudGlyZWx5IG5vbi1v
YnZpb3VzIHdoYXQgdGhlIHByb2JsZW0gaXMuIElzbid0IHRoZXJlIGEgd2F5IA0KPj4gdG8g
YW5ub3RhdGUgZHJtbV9tdXRleF9pbml0KCkgc28gdGhhdCBsb2NrZGVwIHRyZWF0cyBpdCBs
aWtlIGEgcmVndWxhciANCj4+IG11dGV4X2luaXQoKT8NCj4gDQo+IEFGQUlDVCB0aGUgaXNz
dWUgaXMgdGhhdCB3aXRoIHRoZSBleGlzdGluZyBkcm1tX211dGV4X2luaXQoKSB3ZSANCj4g
YmFzaWNhbGx5IGVuZCB1cCBnZW5lcmF0aW5nOg0KPiANCj4gaW50IGRybW1fbXV0ZXhfaW5p
dChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBzdHJ1Y3QgbXV0ZXggKmxvY2spDQo+IHsNCj4g
IMKgwqDCoMKgIHN0YXRpYyBzdHJ1Y3QgbG9ja19jbGFzc19rZXkgX19rZXk7DQo+IA0KPiAg
wqDCoMKgwqAgX19tdXRleF9pbml0KChsb2NrKSwgImxvY2siLCAmX19rZXkpOw0KPiAgwqDC
oMKgwqAgLi4uLg0KPiB9DQo+IA0KPiBJIHRoaW5rIHRoZSBzcGVjaWFsIHN0YXRpYyBfX2tl
eSBpcyB3aGF0IGxvY2tkZXAgdXNlcyB0byBpZGVudGlmeSBhIGxvY2sgDQo+IGNsYXNzLCBz
byBldmVyeSB0aW1lIHdlIGNhbGwgZHJtbV9tdXRleF9pbml0KCkgd2Ugc2hvdWxkIGV4cGVj
dCBhIA0KPiBkaWZmZXJlbnQga2V5LiBIb3dldmVyIHNpbmNlIHRoaXMgaXMganVzdCBhIG5v
cm1hbCBmdW5jdGlvbiB0aGUga2V5IHdpbGwgDQo+IGJlIGNyZWF0ZWQgb25jZSBhbmQgdGhl
biBhbGwgY2FsbGVycyB1c2UgdGhlIHNhbWUga2V5LiBGb3IgZXhhbXBsZSwgaWYgDQo+IHlv
dSBwcmludCBtdXRleC0+ZGVwbWFwLmtleSB5b3Ugd2lsbCBnZXQgdGhlIHNhbWUgcG9pbnRl
ciB1bmRlcm5lYXRoIGZvciANCj4gZGlmZmVyZW50IGRybW1fbXV0ZXhfaW5pdCBjYWxsZXJz
LiBBbmQgdGhlbiBvZmMgbG9ja2RlcCBnZXRzIHJlYWxseSANCj4gY29uZnVzZWQuDQo+IA0K
PiBUdXJuaW5nIGl0IGludG8gYSBtYWNybyBlbnN1cmVzIHRoYXQgZWFjaCBkcm1tX211dGV4
X2luaXQoKSBnZW5lcmF0ZXMgYSANCj4gZGlmZmVyZW50ICJzdGF0aWMgc3RydWN0IGxvY2tf
Y2xhc3Nfa2V5IF9fa2V5IiBmb3IgZWFjaCBpbnZvY2F0aW9uLCANCj4gd2hpY2ggbG9va3Mg
dG8gYmUgaW5saW5lIHdpdGggd2hhdCBtdXRleF9pbml0KCkgd2FudHMuDQoNCk9LLCB0aGFu
a3MgYSBsb3QgZm9yIGV4cGxhaW5pbmcuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4g
DQo+IEknbSBub3Qgc3VyZSBpZiB0aGVyZSBhIGJldHRlciB3YXkgdG8gc29sdmUgdGhpcy4u
Lg0KPiANCj4+DQo+PiBCZXN0IHJlZ2FyZHMNCj4+IFRob21hcw0KPj4NCj4+Pg0KPj4+IFJl
cG9ydGVkLWJ5OiBUaG9tYXMgSGVsbHN0csO2bSA8dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5p
bnRlbC5jb20+DQo+Pj4gRml4ZXM6IGUxM2YxM2UwMzlkYyAoImRybTogQWRkIERSTS1tYW5h
Z2VkIG11dGV4X2luaXQoKSIpDQo+Pj4gQ2M6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVy
bWFubkBzdXNlLmRlPg0KPj4+IENjOiBKb2NlbHluIEZhbGVtcGUgPGpmYWxlbXBlQHJlZGhh
dC5jb20+DQo+Pj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+
DQo+Pj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4+PiBTaWduZWQt
b2ZmLWJ5OiBNYXR0aGV3IEF1bGQgPG1hdHRoZXcuYXVsZEBpbnRlbC5jb20+DQo+Pj4gLS0t
DQo+Pj4gwqAgZHJpdmVycy9ncHUvZHJtL2RybV9tYW5hZ2VkLmMgfCAyNiAtLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQ0KPj4+IMKgIGluY2x1ZGUvZHJtL2RybV9tYW5hZ2VkLmjCoMKg
wqDCoCB8IDIzICsrKysrKysrKysrKysrKysrKysrKystDQo+Pj4gwqAgMiBmaWxlcyBjaGFu
Z2VkLCAyMiBpbnNlcnRpb25zKCspLCAyNyBkZWxldGlvbnMoLSkNCj4+Pg0KPj4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX21hbmFnZWQuYyANCj4+PiBiL2RyaXZlcnMv
Z3B1L2RybS9kcm1fbWFuYWdlZC5jDQo+Pj4gaW5kZXggNGNmMjE0ZGU1MGM0Li43MWM0OTgx
OWE3YTIgMTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9tYW5hZ2VkLmMN
Cj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX21hbmFnZWQuYw0KPj4+IEBAIC0yNjMs
MjkgKzI2MywzIEBAIHZvaWQgZHJtbV9rZnJlZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2
b2lkICpkYXRhKQ0KPj4+IMKgwqDCoMKgwqAgZnJlZV9kcihkcl9tYXRjaCk7DQo+Pj4gwqAg
fQ0KPj4+IMKgIEVYUE9SVF9TWU1CT0woZHJtbV9rZnJlZSk7DQo+Pj4gLQ0KPj4+IC1zdGF0
aWMgdm9pZCBkcm1tX211dGV4X3JlbGVhc2Uoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9p
ZCAqcmVzKQ0KPj4+IC17DQo+Pj4gLcKgwqDCoCBzdHJ1Y3QgbXV0ZXggKmxvY2sgPSByZXM7
DQo+Pj4gLQ0KPj4+IC3CoMKgwqAgbXV0ZXhfZGVzdHJveShsb2NrKTsNCj4+PiAtfQ0KPj4+
IC0NCj4+PiAtLyoqDQo+Pj4gLSAqIGRybW1fbXV0ZXhfaW5pdCAtICZkcm1fZGV2aWNlLW1h
bmFnZWQgbXV0ZXhfaW5pdCgpDQo+Pj4gLSAqIEBkZXY6IERSTSBkZXZpY2UNCj4+PiAtICog
QGxvY2s6IGxvY2sgdG8gYmUgaW5pdGlhbGl6ZWQNCj4+PiAtICoNCj4+PiAtICogUmV0dXJu
czoNCj4+PiAtICogMCBvbiBzdWNjZXNzLCBvciBhIG5lZ2F0aXZlIGVycm5vIGNvZGUgb3Ro
ZXJ3aXNlLg0KPj4+IC0gKg0KPj4+IC0gKiBUaGlzIGlzIGEgJmRybV9kZXZpY2UtbWFuYWdl
ZCB2ZXJzaW9uIG9mIG11dGV4X2luaXQoKS4gVGhlIA0KPj4+IGluaXRpYWxpemVkDQo+Pj4g
LSAqIGxvY2sgaXMgYXV0b21hdGljYWxseSBkZXN0cm95ZWQgb24gdGhlIGZpbmFsIGRybV9k
ZXZfcHV0KCkuDQo+Pj4gLSAqLw0KPj4+IC1pbnQgZHJtbV9tdXRleF9pbml0KHN0cnVjdCBk
cm1fZGV2aWNlICpkZXYsIHN0cnVjdCBtdXRleCAqbG9jaykNCj4+PiAtew0KPj4+IC3CoMKg
wqAgbXV0ZXhfaW5pdChsb2NrKTsNCj4+PiAtDQo+Pj4gLcKgwqDCoCByZXR1cm4gZHJtbV9h
ZGRfYWN0aW9uX29yX3Jlc2V0KGRldiwgZHJtbV9tdXRleF9yZWxlYXNlLCBsb2NrKTsNCj4+
PiAtfQ0KPj4+IC1FWFBPUlRfU1lNQk9MKGRybW1fbXV0ZXhfaW5pdCk7DQo+Pj4gZGlmZiAt
LWdpdCBhL2luY2x1ZGUvZHJtL2RybV9tYW5hZ2VkLmggYi9pbmNsdWRlL2RybS9kcm1fbWFu
YWdlZC5oDQo+Pj4gaW5kZXggMzU5ODgzOTQyNjEyLi4wMWY5NzdlOTE5MzMgMTAwNjQ0DQo+
Pj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX21hbmFnZWQuaA0KPj4+ICsrKyBiL2luY2x1ZGUv
ZHJtL2RybV9tYW5hZ2VkLmgNCj4+PiBAQCAtMTA1LDYgKzEwNSwyNyBAQCBjaGFyICpkcm1t
X2tzdHJkdXAoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgY29uc3QgDQo+Pj4gY2hhciAqcywg
Z2ZwX3QgZ2ZwKTsNCj4+PiDCoCB2b2lkIGRybW1fa2ZyZWUoc3RydWN0IGRybV9kZXZpY2Ug
KmRldiwgdm9pZCAqZGF0YSk7DQo+Pj4gLWludCBkcm1tX211dGV4X2luaXQoc3RydWN0IGRy
bV9kZXZpY2UgKmRldiwgc3RydWN0IG11dGV4ICpsb2NrKTsNCj4+PiArc3RhdGljIGlubGlu
ZSB2b2lkIF9fZHJtbV9tdXRleF9yZWxlYXNlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZv
aWQgDQo+Pj4gKnJlcykNCj4+PiArew0KPj4+ICvCoMKgwqAgc3RydWN0IG11dGV4ICpsb2Nr
ID0gcmVzOw0KPj4+ICsNCj4+PiArwqDCoMKgIG11dGV4X2Rlc3Ryb3kobG9jayk7DQo+Pj4g
K30NCj4+PiArDQo+Pj4gKy8qKg0KPj4+ICsgKiBkcm1tX211dGV4X2luaXQgLSAmZHJtX2Rl
dmljZS1tYW5hZ2VkIG11dGV4X2luaXQoKQ0KPj4+ICsgKiBAZGV2OiBEUk0gZGV2aWNlDQo+
Pj4gKyAqIEBsb2NrOiBsb2NrIHRvIGJlIGluaXRpYWxpemVkDQo+Pj4gKyAqDQo+Pj4gKyAq
IFJldHVybnM6DQo+Pj4gKyAqIDAgb24gc3VjY2Vzcywgb3IgYSBuZWdhdGl2ZSBlcnJubyBj
b2RlIG90aGVyd2lzZS4NCj4+PiArICoNCj4+PiArICogVGhpcyBpcyBhICZkcm1fZGV2aWNl
LW1hbmFnZWQgdmVyc2lvbiBvZiBtdXRleF9pbml0KCkuIFRoZSANCj4+PiBpbml0aWFsaXpl
ZA0KPj4+ICsgKiBsb2NrIGlzIGF1dG9tYXRpY2FsbHkgZGVzdHJveWVkIG9uIHRoZSBmaW5h
bCBkcm1fZGV2X3B1dCgpLg0KPj4+ICsgKi8NCj4+PiArI2RlZmluZSBkcm1tX211dGV4X2lu
aXQoZGV2LCBsb2NrKSAoe8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBcDQo+Pj4gK8KgwqDCoCBtdXRleF9pbml0KGxvY2spO8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwNCj4+PiAr
wqDCoMKgIGRybW1fYWRkX2FjdGlvbl9vcl9yZXNldChkZXYsIF9fZHJtbV9tdXRleF9yZWxl
YXNlLCANCj4+PiBsb2NrKTvCoMKgwqDCoMKgwqDCoMKgIFwNCj4+PiArfSnCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBcDQo+Pj4gwqAgI2VuZGlmDQo+Pg0KDQotLSANClRob21hcyBa
aW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNv
bHV0aW9ucyBHZXJtYW55IEdtYkgNCkZyYW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5i
ZXJnLCBHZXJtYW55DQpHRjogSXZvIFRvdGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0Rv
bmFsZCwgQm91ZGllbiBNb2VybWFuDQpIUkIgMzY4MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------8KQf634wXXo2PIpmusHBApbA--

--------------nDVLGpfseCOfXrNk602L0nB9
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmRlElkFAwAAAAAACgkQlh/E3EQov+D/
Bg//UVLNGp/Se8ycj3VuSDFmyieAZC+qQhLUzHwBbkgwYsUqL9LXyJ3iCKMAontesK3ZEnZR9GtO
Bxe3zvWam5Tw/o6O/32P0WdZOPXGdDGM7/GhotbYm/vdxOodZxW2AI0K7+Cbh4Z4HEOXTNUYrxcC
FdnwsfeP9osMwi8mdB3HP2pTS6a9dTwzF/j5ePY+5ugIzhuYsIlPmqunOgeP9SCQX7BKTflNy0MR
AP4g/7zo5+uElptzlKr6SS4hYwRSjSbDCrBFKsK6skhiDKbuSZjWHeQXqmwfnmaUqAWD5+VLqDoA
DrqlZRsDk6KbZKEM1sQHbrQ6BxqTev2OQK48mk8LsQ+zQOlqto2ZBLf7wuL0o0cAuWn+tAqApyEd
ETsGg2jiU9m1Hei1SpxLvseF3X9pqnCVRwm7KpC8ImlZg4yzTIPlcnzm9U/b2zsVvpqYg5JCOu0W
F9Evn5Ab/QRUx/H0ioJPhrPz/z5QIjN/J8cvsdB+XI9KmO5VxEArNEFbhXbDOVcQU0GSpA8heFj+
ffbVUpLNx4QagUYtt05Z0EUhgsjrrBtm7rGRfpd2wNnVeOe9A4ce6Vv4arnPw0H7YjWdgZ7PAA1p
4soEV9yVkYbzimcd8iSadcrxKosp7c/khNKoSY2mjGE8dnAdP2pyFcuhvV7+kNt89tW6aMGu35Ii
624=
=Zdyq
-----END PGP SIGNATURE-----

--------------nDVLGpfseCOfXrNk602L0nB9--
