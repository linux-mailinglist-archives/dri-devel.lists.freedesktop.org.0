Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0640555BFAA
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 11:01:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0843212A974;
	Tue, 28 Jun 2022 09:00:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B68BA11BF61
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 09:00:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6D9DD1FD0E;
 Tue, 28 Jun 2022 09:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1656406855; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dCs8GDXOmD8S9wSrgyMqOxdVc/pb9S7xJbz4vr/dUnE=;
 b=GCPQHQXTF6Z4/ISJpMqIVfrjWO8r3eBJxPpSyeiUDUf10b88ChSLTSy812Ue2QfKFaXkEf
 EJLH/om1R198HF8BododdYL9uJIBx0ykwFCFvW/lbKuA/OC1h6nLO5RwbrVnX44vk6zrgZ
 pDLfEqSuqAXD5mfvXIN0phswodm2rfI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1656406855;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dCs8GDXOmD8S9wSrgyMqOxdVc/pb9S7xJbz4vr/dUnE=;
 b=zVWzFOEAoNX9rAXe8XAnEyX+DnLYhcqaYeo3mA4kOGViLbN1ZKpbfBG8LpVg6WDBAa6OHG
 GcQJJ7li3dnAqUAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4CA4413ACA;
 Tue, 28 Jun 2022 09:00:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id veKtEUfDumJNPQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 28 Jun 2022 09:00:55 +0000
Message-ID: <473edc93-e60d-6230-33a4-1bf224373a0a@suse.de>
Date: Tue, 28 Jun 2022 11:00:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 08/68] drm/connector: Introduce
 drmm_connector_init_with_ddc
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
References: <20220622143209.600298-1-maxime@cerno.tech>
 <20220622143209.600298-9-maxime@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220622143209.600298-9-maxime@cerno.tech>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------XjKFVZbyRIQzQTD6caIpFZzi"
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
--------------XjKFVZbyRIQzQTD6caIpFZzi
Content-Type: multipart/mixed; boundary="------------pLByRaNj44ofDlx2n09T0Y2F";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Cc: dri-devel@lists.freedesktop.org
Message-ID: <473edc93-e60d-6230-33a4-1bf224373a0a@suse.de>
Subject: Re: [PATCH v2 08/68] drm/connector: Introduce
 drmm_connector_init_with_ddc
References: <20220622143209.600298-1-maxime@cerno.tech>
 <20220622143209.600298-9-maxime@cerno.tech>
In-Reply-To: <20220622143209.600298-9-maxime@cerno.tech>

--------------pLByRaNj44ofDlx2n09T0Y2F
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjIuMDYuMjIgdW0gMTY6MzEgc2NocmllYiBNYXhpbWUgUmlwYXJkOg0KPiBM
ZXQncyBjcmVhdGUgYSBEUk0tbWFuYWdlZCB2YXJpYW50IG9mIGRybV9jb25uZWN0b3JfaW5p
dF93aXRoX2RkYyB0aGF0IHdpbGwNCj4gdGFrZSBjYXJlIG9mIGFuIGFjdGlvbiBvZiB0aGUg
Y29ubmVjdG9yIGNsZWFudXAuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBNYXhpbWUgUmlwYXJk
IDxtYXhpbWVAY2Vybm8udGVjaD4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9j
b25uZWN0b3IuYyB8IDc0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLQ0KPiAg
IGluY2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaCAgICAgfCAgNSArKysNCj4gICAyIGZpbGVz
IGNoYW5nZWQsIDY5IGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29ubmVjdG9yLmMgYi9kcml2ZXJzL2dw
dS9kcm0vZHJtX2Nvbm5lY3Rvci5jDQo+IGluZGV4IDBmZWMyZDg3MTc4Zi4uMDc2Y2EyNDdj
NmQwIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jDQo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29ubmVjdG9yLmMNCj4gQEAgLTM1NCw2ICsz
NTQsMzAgQEAgaW50IGRybV9jb25uZWN0b3JfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2
LA0KPiAgIH0NCj4gICBFWFBPUlRfU1lNQk9MKGRybV9jb25uZWN0b3JfaW5pdCk7DQo+ICAg
DQo+ICt0eXBlZGVmIGludCAoKmNvbm5lY3Rvcl9pbml0X3QpKHN0cnVjdCBkcm1fZGV2aWNl
ICpkZXYsDQo+ICsJCQkJc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciwNCj4gKwkJ
CQljb25zdCBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9mdW5jcyAqZnVuY3MsDQo+ICsJCQkJaW50
IGNvbm5lY3Rvcl90eXBlKTsNCj4gKw0KPiArc3RhdGljIGludCBfX2RybV9jb25uZWN0b3Jf
aW5pdF93aXRoX2RkYyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LA0KPiArCQkJCQkgc3RydWN0
IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvciwNCj4gKwkJCQkJIGNvbm5lY3Rvcl9pbml0X3Qg
aW5pdF9mdW5jLA0KPiArCQkJCQkgY29uc3Qgc3RydWN0IGRybV9jb25uZWN0b3JfZnVuY3Mg
KmZ1bmNzLA0KPiArCQkJCQkgaW50IGNvbm5lY3Rvcl90eXBlLA0KPiArCQkJCQkgc3RydWN0
IGkyY19hZGFwdGVyICpkZGMpDQoNCkJhY2sgaW4gdGhlIGRheXMgd2hlbiBkcm1fY29ubmVj
dG9yX2luaXRfd2l0aF9kZGMoKSB3YXMgYWRkZWQsIHRoZXJlIHdhcyANCmEgc21hbGwgY29u
dHJvdmVyc3kgYWJvdXQgd2hldGhlciB3ZSBzaG91bGQgc2ltcGx5IGV4dGVuZCB0aGUgcmVn
dWxhciANCmRybV9jb25uZWN0b3JfaW5pdCgpIHRvIHN1cHBvcnQgdGhlIGV4dHJhIGRkYyBh
cmd1bWVudC4gVGhhdCB3b3VsZCBoYXZlIA0KbWVhbnQgYSBsb3Qgb2YgY2h1cm4sIGJ1dCB0
aGUgaWRlYSB3YXMgcHJvYmFibHkgc291bmQuDQoNCk1heWJlIGl0IHdvdWxkIGJlIGJldHRl
ciB0byBwcm92aWRlIGEgc2luZ2xlIGZ1bmN0aW9uIA0KZHJtbV9jb25uZWN0b3JfaW5pdCgp
IHRoYXQgcmVjZWl2ZXMgYSBkZGMgYXJndW1lbnQuIElmIHRoZSBhcmd1bWVudCBpcyANCk5V
TEwsIG5vIEREQyBjaGFubmVsIHdvdWxkIGJlIHNldC4gVGhpcyB3b3VsZCBtYWtlIA0KZHJt
bV9jb25uZWN0b3JfaW5pdF93aXRoX2RkYygpIHVubm5lY2Vzc2FyeS4NCg0KQmVzdCByZWdh
cmRzDQpUaG9tYXMNCg0KPiArew0KPiArCWludCByZXQ7DQo+ICsNCj4gKwlyZXQgPSBpbml0
X2Z1bmMoZGV2LCBjb25uZWN0b3IsIGZ1bmNzLCBjb25uZWN0b3JfdHlwZSk7DQo+ICsJaWYg
KHJldCkNCj4gKwkJcmV0dXJuIHJldDsNCj4gKw0KPiArCS8qIHByb3ZpZGUgZGRjIHN5bWxp
bmsgaW4gc3lzZnMgKi8NCj4gKwljb25uZWN0b3ItPmRkYyA9IGRkYzsNCj4gKw0KPiArCXJl
dHVybiByZXQ7DQo+ICt9DQo+ICsNCj4gICAvKioNCj4gICAgKiBkcm1fY29ubmVjdG9yX2lu
aXRfd2l0aF9kZGMgLSBJbml0IGEgcHJlYWxsb2NhdGVkIGNvbm5lY3Rvcg0KPiAgICAqIEBk
ZXY6IERSTSBkZXZpY2UNCj4gQEAgLTM3MSw2ICszOTUsMTAgQEAgRVhQT1JUX1NZTUJPTChk
cm1fY29ubmVjdG9yX2luaXQpOw0KPiAgICAqDQo+ICAgICogRW5zdXJlcyB0aGF0IHRoZSBk
ZGMgZmllbGQgb2YgdGhlIGNvbm5lY3RvciBpcyBjb3JyZWN0bHkgc2V0Lg0KPiAgICAqDQo+
ICsgKiBOb3RlOiBjb25zaWRlciB1c2luZyBkcm1tX2Nvbm5lY3Rvcl9pbml0X3dpdGhfZGRj
KCkgaW5zdGVhZCBvZg0KPiArICogZHJtX2Nvbm5lY3Rvcl9pbml0X3dpdGhfZGRjKCkgdG8g
bGV0IHRoZSBEUk0gbWFuYWdlZCByZXNvdXJjZQ0KPiArICogaW5mcmFzdHJ1Y3R1cmUgdGFr
ZSBjYXJlIG9mIGNsZWFudXAgYW5kIGRlYWxsb2NhdGlvbi4NCj4gKyAqDQo+ICAgICogUmV0
dXJuczoNCj4gICAgKiBaZXJvIG9uIHN1Y2Nlc3MsIGVycm9yIGNvZGUgb24gZmFpbHVyZS4N
Cj4gICAgKi8NCj4gQEAgLTM4MCwxNiArNDA4LDkgQEAgaW50IGRybV9jb25uZWN0b3JfaW5p
dF93aXRoX2RkYyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LA0KPiAgIAkJCQlpbnQgY29ubmVj
dG9yX3R5cGUsDQo+ICAgCQkJCXN0cnVjdCBpMmNfYWRhcHRlciAqZGRjKQ0KPiAgIHsNCj4g
LQlpbnQgcmV0Ow0KPiAtDQo+IC0JcmV0ID0gZHJtX2Nvbm5lY3Rvcl9pbml0KGRldiwgY29u
bmVjdG9yLCBmdW5jcywgY29ubmVjdG9yX3R5cGUpOw0KPiAtCWlmIChyZXQpDQo+IC0JCXJl
dHVybiByZXQ7DQo+IC0NCj4gLQkvKiBwcm92aWRlIGRkYyBzeW1saW5rIGluIHN5c2ZzICov
DQo+IC0JY29ubmVjdG9yLT5kZGMgPSBkZGM7DQo+IC0NCj4gLQlyZXR1cm4gcmV0Ow0KPiAr
CXJldHVybiBfX2RybV9jb25uZWN0b3JfaW5pdF93aXRoX2RkYyhkZXYsIGNvbm5lY3RvciwN
Cj4gKwkJCQkJICAgICBkcm1fY29ubmVjdG9yX2luaXQsDQo+ICsJCQkJCSAgICAgZnVuY3Ms
IGNvbm5lY3Rvcl90eXBlLCBkZGMpOw0KPiAgIH0NCj4gICBFWFBPUlRfU1lNQk9MKGRybV9j
b25uZWN0b3JfaW5pdF93aXRoX2RkYyk7DQo+ICAgDQo+IEBAIC00NDMsNiArNDY0LDM5IEBA
IGludCBkcm1tX2Nvbm5lY3Rvcl9pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsDQo+ICAg
fQ0KPiAgIEVYUE9SVF9TWU1CT0woZHJtbV9jb25uZWN0b3JfaW5pdCk7DQo+ICAgDQo+ICsv
KioNCj4gKyAqIGRybW1fY29ubmVjdG9yX2luaXRfd2l0aF9kZGMgLSBJbml0IGEgcHJlYWxs
b2NhdGVkIGNvbm5lY3Rvcg0KPiArICogQGRldjogRFJNIGRldmljZQ0KPiArICogQGNvbm5l
Y3RvcjogdGhlIGNvbm5lY3RvciB0byBpbml0DQo+ICsgKiBAZnVuY3M6IGNhbGxiYWNrcyBm
b3IgdGhpcyBjb25uZWN0b3INCj4gKyAqIEBjb25uZWN0b3JfdHlwZTogdXNlciB2aXNpYmxl
IHR5cGUgb2YgdGhlIGNvbm5lY3Rvcg0KPiArICogQGRkYzogcG9pbnRlciB0byB0aGUgYXNz
b2NpYXRlZCBkZGMgYWRhcHRlcg0KPiArICoNCj4gKyAqIEluaXRpYWxpc2VzIGEgcHJlYWxs
b2NhdGVkIGNvbm5lY3Rvci4gQ29ubmVjdG9ycyBzaG91bGQgYmUNCj4gKyAqIHN1YmNsYXNz
ZWQgYXMgcGFydCBvZiBkcml2ZXIgY29ubmVjdG9yIG9iamVjdHMuDQo+ICsgKg0KPiArICog
Q2xlYW51cCBpcyBhdXRvbWF0aWNhbGx5IGhhbmRsZWQgd2l0aCBhIGNhbGwgdG8NCj4gKyAq
IGRybV9jb25uZWN0b3JfY2xlYW51cCgpIGluIGEgRFJNLW1hbmFnZWQgYWN0aW9uLg0KPiAr
ICoNCj4gKyAqIFRoZSBjb25uZWN0b3Igc3RydWN0dXJlIHNob3VsZCBiZSBhbGxvY2F0ZWQg
d2l0aCBkcm1tX2t6YWxsb2MoKS4NCj4gKyAqDQo+ICsgKiBFbnN1cmVzIHRoYXQgdGhlIGRk
YyBmaWVsZCBvZiB0aGUgY29ubmVjdG9yIGlzIGNvcnJlY3RseSBzZXQuDQo+ICsgKg0KPiAr
ICogUmV0dXJuczoNCj4gKyAqIFplcm8gb24gc3VjY2VzcywgZXJyb3IgY29kZSBvbiBmYWls
dXJlLg0KPiArICovDQo+ICtpbnQgZHJtbV9jb25uZWN0b3JfaW5pdF93aXRoX2RkYyhzdHJ1
Y3QgZHJtX2RldmljZSAqZGV2LA0KPiArCQkJCSBzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29u
bmVjdG9yLA0KPiArCQkJCSBjb25zdCBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9mdW5jcyAqZnVu
Y3MsDQo+ICsJCQkJIGludCBjb25uZWN0b3JfdHlwZSwNCj4gKwkJCQkgc3RydWN0IGkyY19h
ZGFwdGVyICpkZGMpDQo+ICt7DQo+ICsJcmV0dXJuIF9fZHJtX2Nvbm5lY3Rvcl9pbml0X3dp
dGhfZGRjKGRldiwgY29ubmVjdG9yLA0KPiArCQkJCQkgICAgIGRybW1fY29ubmVjdG9yX2lu
aXQsDQo+ICsJCQkJCSAgICAgZnVuY3MsIGNvbm5lY3Rvcl90eXBlLCBkZGMpOw0KPiArfQ0K
PiArRVhQT1JUX1NZTUJPTChkcm1tX2Nvbm5lY3Rvcl9pbml0X3dpdGhfZGRjKTsNCj4gKw0K
PiAgIC8qKg0KPiAgICAqIGRybV9jb25uZWN0b3JfYXR0YWNoX2VkaWRfcHJvcGVydHkgLSBh
dHRhY2ggZWRpZCBwcm9wZXJ0eS4NCj4gICAgKiBAY29ubmVjdG9yOiB0aGUgY29ubmVjdG9y
DQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmggYi9pbmNsdWRl
L2RybS9kcm1fY29ubmVjdG9yLmgNCj4gaW5kZXggMzVhNmI2ZTk0NGI3Li4yNTY1NTQxZjJj
MTAgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvZHJtL2RybV9jb25uZWN0b3IuaA0KPiArKysg
Yi9pbmNsdWRlL2RybS9kcm1fY29ubmVjdG9yLmgNCj4gQEAgLTE2NzYsNiArMTY3NiwxMSBA
QCBpbnQgZHJtbV9jb25uZWN0b3JfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LA0KPiAg
IAkJCXN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IsDQo+ICAgCQkJY29uc3Qgc3Ry
dWN0IGRybV9jb25uZWN0b3JfZnVuY3MgKmZ1bmNzLA0KPiAgIAkJCWludCBjb25uZWN0b3Jf
dHlwZSk7DQo+ICtpbnQgZHJtbV9jb25uZWN0b3JfaW5pdF93aXRoX2RkYyhzdHJ1Y3QgZHJt
X2RldmljZSAqZGV2LA0KPiArCQkJCSBzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9y
LA0KPiArCQkJCSBjb25zdCBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9mdW5jcyAqZnVuY3MsDQo+
ICsJCQkJIGludCBjb25uZWN0b3JfdHlwZSwNCj4gKwkJCQkgc3RydWN0IGkyY19hZGFwdGVy
ICpkZGMpOw0KPiAgIHZvaWQgZHJtX2Nvbm5lY3Rvcl9hdHRhY2hfZWRpZF9wcm9wZXJ0eShz
dHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKTsNCj4gICBpbnQgZHJtX2Nvbm5lY3Rv
cl9yZWdpc3RlcihzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKTsNCj4gICB2b2lk
IGRybV9jb25uZWN0b3JfdW5yZWdpc3RlcihzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVj
dG9yKTsNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVs
b3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3Ry
LiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVy
ZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------pLByRaNj44ofDlx2n09T0Y2F--

--------------XjKFVZbyRIQzQTD6caIpFZzi
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmK6w0YFAwAAAAAACgkQlh/E3EQov+Bf
IhAArfRBz5LH/OK9IxQ2P0LStTt9gLKygCygebmOAnTNN7MN7rzb9nkdqfSaqxJrnatYJdkVtRGn
CtpUDxI49tAcLQA7ROU7TSOEycksuJkDbyGY7i7Zh3ImoutNYXybTpzA/NkkeRWnGUeWh++oq7hm
teWdInqgojVAx5XsuRHpAYQzW4aB4yZYH2e3leJH3JxMAmFjZjKfmv3y70JMh6UWnQI27sMw5c0T
qRLzSabHxxDAkU1jiolZKecuj7bT4ryQCedGPKcHw0ZIahfRoA/Ee+HHkwvPJorIWdusv2XTj6D1
liBW19xxV1QgslSr9SAwLQl/U7vWbydcSN2JsphW68R106ZV5hW2K9r5kRyj0zMi20XmktbcwqiK
W/UoZ1dG0usYXl75WpELKfQ68UTTml4mNz2zBuIDbV/vJ9WVweI0vQw9qBrUM1TEzOIKjCtX32nP
iuyuQTio0lwQCaVmnmoG0Dbd5V0GyhR/wLfm1wV0Vo/SN6RB2tE9JS2WfQUUfUik0TergjO0vucP
RDfOOk6Frb8TqMZWiiYchJcDGYGarHsIhR8T6lbFLAiB6kG7T0mrBM9yPGdy/lFkRtHQJTlTjSbJ
4hYiREEjKIXiASziHVpbQA2hyLh+UsUn4oqQRwAyj/48koGqMP1gYpNonUAXhLBk2/uRNwhcSdZJ
M1k=
=AIew
-----END PGP SIGNATURE-----

--------------XjKFVZbyRIQzQTD6caIpFZzi--
