Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 127BB50F517
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 10:41:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC11D10E45B;
	Tue, 26 Apr 2022 08:41:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD12B10E45B
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 08:41:14 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 872F01F747;
 Tue, 26 Apr 2022 08:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1650962473; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4Ah1odPLrlvZTtAu1DAwy5lx+6PE0FfL5PemrOF6BXc=;
 b=X0zMjX58DUG/DVYv7KCcXAMabpPwc7AXwTaNyWHIaAYILKGAiqo/e8WPrJ/IdpvYa0DotK
 KWIefmLeObiWYi+SPmhnsnjI/FZ8n47FbqzdRtzDxW3YdkbByj+qLlnTYZhkS8KGsjqB0D
 aQWz3nULmezCWxeSj8Ca6yuLbElHl0I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1650962473;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4Ah1odPLrlvZTtAu1DAwy5lx+6PE0FfL5PemrOF6BXc=;
 b=yAYO0vDpCTPqs3Xagvf+9ZDNu5MuH5H/sSIITY5vi0CP5YTfdbMy/xje1Ow6lESQmOVmEk
 i1675U4ZbzghfOAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5A8A013AD5;
 Tue, 26 Apr 2022 08:41:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cukiFSmwZ2LzHQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 26 Apr 2022 08:41:13 +0000
Message-ID: <13cce5b6-0353-dad1-33d5-b089bdfd4b8c@suse.de>
Date: Tue, 26 Apr 2022 10:41:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 3/3] fbdev: Refactor implementation of page_mkwrite
Content-Language: en-US
To: Sam Ravnborg <sam@ravnborg.org>
References: <20220425112751.25985-1-tzimmermann@suse.de>
 <20220425112751.25985-4-tzimmermann@suse.de> <YmbncpwerOQLB1cS@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <YmbncpwerOQLB1cS@ravnborg.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------lgBOhBRyyNxExIiTrL09Kpks"
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
Cc: linux-fbdev@vger.kernel.org, airlied@linux.ie, deller@gmx.de,
 javierm@redhat.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------lgBOhBRyyNxExIiTrL09Kpks
Content-Type: multipart/mixed; boundary="------------tMbS5lLOlke0tFvpuOnR6hDI";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: javierm@redhat.com, daniel@ffwll.ch, deller@gmx.de, airlied@linux.ie,
 maarten.lankhorst@linux.intel.com, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Message-ID: <13cce5b6-0353-dad1-33d5-b089bdfd4b8c@suse.de>
Subject: Re: [PATCH v2 3/3] fbdev: Refactor implementation of page_mkwrite
References: <20220425112751.25985-1-tzimmermann@suse.de>
 <20220425112751.25985-4-tzimmermann@suse.de> <YmbncpwerOQLB1cS@ravnborg.org>
In-Reply-To: <YmbncpwerOQLB1cS@ravnborg.org>

--------------tMbS5lLOlke0tFvpuOnR6hDI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjUuMDQuMjIgdW0gMjA6MjQgc2NocmllYiBTYW0gUmF2bmJvcmc6DQo+IEhp
IFRob21hcy4NCj4gDQo+IE9uIE1vbiwgQXByIDI1LCAyMDIyIGF0IDAxOjI3OjUxUE0gKzAy
MDAsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4gUmVmYWN0b3IgdGhlIHBhZ2Utd3Jp
dGUgaGFuZGxlciBmb3IgZGVmZXJyZWQgSS9PLiBEcml2ZXJzIHVzZSB0aGUNCj4+IGZ1bmN0
aW9uIHRvIGxldCBmYmRldiB0cmFjayB3cml0dGVuIHBhZ2VzIG9mIG1tYXAnZWQgZnJhbWVi
dWZmZXINCj4+IG1lbW9yeS4NCj4gDQo+IEkgbGlrZSBob3cgdGhlIGNvbW1lbnRzIGdvdCBh
IGJydXNoIHVwIGFuZCBhIGxpdHRsZSBtb3JlIGluZm8gd2FzIGFkZGVkLg0KPiBCdXQgSSBk
byBub3Qgc2VlIHRoZSBwb2ludCBvZiB0aGUgcmVmYWN0b3JpbmcgLSB0aGUgY29kZSBpcyBl
cXVhbGx5DQo+IHJlYWRhYmxlIGJlZm9yZSBhbmQgYWZ0ZXIgLSBtYXliZSBldmVuIGVhc2ll
ciBiZWZvcmUgKG1vZHVsdXMgdGhlDQo+IGltcHJvdmVkIGNvbW1lbnRzKS4NCg0KRllJIEkn
bSBnb2luZyB0byBtb3ZlIHRoZSBsb2NraW5nIGludG8gdGhlIHRyYWNrLXBhZ2UgaGVscGVy
LCB3aGljaCANCm1ha2VzIHRoZSBjb2RlIG1vcmUgcmVhZGFibGUuDQoNCkJlc3QgcmVnYXJk
cw0KVGhvbWFzDQoNCj4gDQo+IEJ1dCBpZiB5b3UgY29uc2lkZXIgaXQgYmV0dGVyIGtlZXAg
aXQuIEFnYWluIGp1c3QgbXkgdGhvdWdodHMgd2hlbg0KPiByZWFkaW5nIHRoZSBjb2RlLg0K
PiANCj4gCVNhbQ0KPiANCj4+DQo+PiB2MjoNCj4+IAkqIGRvbid0IGV4cG9ydCB0aGUgaGVs
cGVyIHVudGlsIHdlIGhhdmUgYW4gZXh0ZXJuYWwgY2FsbGVyDQo+Pg0KPj4gU2lnbmVkLW9m
Zi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+PiBSZXZp
ZXdlZC1ieTogSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzIDxqYXZpZXJtQHJlZGhhdC5jb20+
DQo+PiAtLS0NCj4+ICAgZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZiX2RlZmlvLmMgfCA2
OCArKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLQ0KPj4gICAxIGZpbGUgY2hhbmdlZCwg
NDggaW5zZXJ0aW9ucygrKSwgMjAgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYl9kZWZpby5jIGIvZHJpdmVycy92aWRlby9m
YmRldi9jb3JlL2ZiX2RlZmlvLmMNCj4+IGluZGV4IGEwM2I5YzY0ZmM2MS4uMjE0NTgxY2U1
ODQwIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9jb3JlL2ZiX2RlZmlv
LmMNCj4+ICsrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYl9kZWZpby5jDQo+PiBA
QCAtMTQzLDI5ICsxNDMsMTggQEAgaW50IGZiX2RlZmVycmVkX2lvX2ZzeW5jKHN0cnVjdCBm
aWxlICpmaWxlLCBsb2ZmX3Qgc3RhcnQsIGxvZmZfdCBlbmQsIGludCBkYXRhc3kNCj4+ICAg
fQ0KPj4gICBFWFBPUlRfU1lNQk9MX0dQTChmYl9kZWZlcnJlZF9pb19mc3luYyk7DQo+PiAg
IA0KPj4gLS8qIHZtX29wcy0+cGFnZV9ta3dyaXRlIGhhbmRsZXIgKi8NCj4+IC1zdGF0aWMg
dm1fZmF1bHRfdCBmYl9kZWZlcnJlZF9pb19ta3dyaXRlKHN0cnVjdCB2bV9mYXVsdCAqdm1m
KQ0KPj4gKy8qDQo+PiArICogQWRkcyBhIHBhZ2UgdG8gdGhlIGRpcnR5IGxpc3QuIFJlcXVp
cmVzIGNhbGxlciB0byBob2xkDQo+PiArICogc3RydWN0IGZiX2RlZmVycmVkX2lvLmxvY2su
IENhbGwgdGhpcyBmcm9tIHN0cnVjdA0KPj4gKyAqIHZtX29wZXJhdGlvbnNfc3RydWN0LnBh
Z2VfbWt3cml0ZS4NCj4+ICsgKi8NCj4+ICtzdGF0aWMgdm1fZmF1bHRfdCBfX2ZiX2RlZmVy
cmVkX2lvX3RyYWNrX3BhZ2Uoc3RydWN0IGZiX2luZm8gKmluZm8sIHVuc2lnbmVkIGxvbmcg
b2Zmc2V0LA0KPj4gKwkJCQkJICAgICAgc3RydWN0IHBhZ2UgKnBhZ2UpDQo+PiAgIHsNCj4+
IC0Jc3RydWN0IHBhZ2UgKnBhZ2UgPSB2bWYtPnBhZ2U7DQo+PiAtCXN0cnVjdCBmYl9pbmZv
ICppbmZvID0gdm1mLT52bWEtPnZtX3ByaXZhdGVfZGF0YTsNCj4+ICAgCXN0cnVjdCBmYl9k
ZWZlcnJlZF9pbyAqZmJkZWZpbyA9IGluZm8tPmZiZGVmaW87DQo+PiAgIAlzdHJ1Y3QgZmJf
ZGVmZXJyZWRfaW9fcGFnZXJlZiAqcGFnZXJlZjsNCj4+IC0JdW5zaWduZWQgbG9uZyBvZmZz
ZXQ7DQo+PiAgIAl2bV9mYXVsdF90IHJldDsNCj4+ICAgDQo+PiAtCW9mZnNldCA9ICh2bWYt
PmFkZHJlc3MgLSB2bWYtPnZtYS0+dm1fc3RhcnQpOw0KPj4gLQ0KPj4gLQkvKiB0aGlzIGlz
IGEgY2FsbGJhY2sgd2UgZ2V0IHdoZW4gdXNlcnNwYWNlIGZpcnN0IHRyaWVzIHRvDQo+PiAt
CXdyaXRlIHRvIHRoZSBwYWdlLiB3ZSBzY2hlZHVsZSBhIHdvcmtxdWV1ZS4gdGhhdCB3b3Jr
cXVldWUNCj4+IC0Jd2lsbCBldmVudHVhbGx5IG1rY2xlYW4gdGhlIHRvdWNoZWQgcGFnZXMg
YW5kIGV4ZWN1dGUgdGhlDQo+PiAtCWRlZmVycmVkIGZyYW1lYnVmZmVyIElPLiB0aGVuIGlm
IHVzZXJzcGFjZSB0b3VjaGVzIGEgcGFnZQ0KPj4gLQlhZ2Fpbiwgd2UgcmVwZWF0IHRoZSBz
YW1lIHNjaGVtZSAqLw0KPj4gLQ0KPj4gLQlmaWxlX3VwZGF0ZV90aW1lKHZtZi0+dm1hLT52
bV9maWxlKTsNCj4+IC0NCj4+IC0JLyogcHJvdGVjdCBhZ2FpbnN0IHRoZSB3b3JrcXVldWUg
Y2hhbmdpbmcgdGhlIHBhZ2UgbGlzdCAqLw0KPj4gLQltdXRleF9sb2NrKCZmYmRlZmlvLT5s
b2NrKTsNCj4+IC0NCj4+ICAgCS8qIGZpcnN0IHdyaXRlIGluIHRoaXMgY3ljbGUsIG5vdGlm
eSB0aGUgZHJpdmVyICovDQo+PiAgIAlpZiAoZmJkZWZpby0+Zmlyc3RfaW8gJiYgbGlzdF9l
bXB0eSgmZmJkZWZpby0+cGFnZWxpc3QpKQ0KPj4gICAJCWZiZGVmaW8tPmZpcnN0X2lvKGlu
Zm8pOw0KPj4gQEAgLTE4Niw4ICsxNzUsNiBAQCBzdGF0aWMgdm1fZmF1bHRfdCBmYl9kZWZl
cnJlZF9pb19ta3dyaXRlKHN0cnVjdCB2bV9mYXVsdCAqdm1mKQ0KPj4gICAJICovDQo+PiAg
IAlsb2NrX3BhZ2UocGFnZXJlZi0+cGFnZSk7DQo+PiAgIA0KPj4gLQltdXRleF91bmxvY2so
JmZiZGVmaW8tPmxvY2spOw0KPj4gLQ0KPj4gICAJLyogY29tZSBiYWNrIGFmdGVyIGRlbGF5
IHRvIHByb2Nlc3MgdGhlIGRlZmVycmVkIElPICovDQo+PiAgIAlzY2hlZHVsZV9kZWxheWVk
X3dvcmsoJmluZm8tPmRlZmVycmVkX3dvcmssIGZiZGVmaW8tPmRlbGF5KTsNCj4+ICAgCXJl
dHVybiBWTV9GQVVMVF9MT0NLRUQ7DQo+PiBAQCAtMTk3LDYgKzE4NCw0NyBAQCBzdGF0aWMg
dm1fZmF1bHRfdCBmYl9kZWZlcnJlZF9pb19ta3dyaXRlKHN0cnVjdCB2bV9mYXVsdCAqdm1m
KQ0KPj4gICAJcmV0dXJuIHJldDsNCj4+ICAgfQ0KPj4gICANCj4+ICsvKg0KPj4gKyAqIGZi
X2RlZmVycmVkX2lvX3BhZ2VfbWt3cml0ZSAtIE1hcmsgYSBwYWdlIGFzIHdyaXR0ZW4gZm9y
IGRlZmVycmVkIEkvTw0KPj4gKyAqIEBmYl9pbmZvOiBUaGUgZmJkZXYgaW5mbyBzdHJ1Y3R1
cmUNCj4+ICsgKiBAdm1mOiBUaGUgVk0gZmF1bHQNCj4+ICsgKg0KPj4gKyAqIFRoaXMgaXMg
YSBjYWxsYmFjayB3ZSBnZXQgd2hlbiB1c2Vyc3BhY2UgZmlyc3QgdHJpZXMgdG8NCj4+ICsg
KiB3cml0ZSB0byB0aGUgcGFnZS4gV2Ugc2NoZWR1bGUgYSB3b3JrcXVldWUuIFRoYXQgd29y
a3F1ZXVlDQo+PiArICogd2lsbCBldmVudHVhbGx5IG1rY2xlYW4gdGhlIHRvdWNoZWQgcGFn
ZXMgYW5kIGV4ZWN1dGUgdGhlDQo+PiArICogZGVmZXJyZWQgZnJhbWVidWZmZXIgSU8uIFRo
ZW4gaWYgdXNlcnNwYWNlIHRvdWNoZXMgYSBwYWdlDQo+PiArICogYWdhaW4sIHdlIHJlcGVh
dCB0aGUgc2FtZSBzY2hlbWUuDQo+PiArICoNCj4+ICsgKiBSZXR1cm5zOg0KPj4gKyAqIFZN
X0ZBVUxUX0xPQ0tFRCBvbiBzdWNjZXNzLCBvciBhIFZNX0ZBVUxUIGVycm9yIG90aGVyd2lz
ZS4NCj4+ICsgKi8NCj4+ICtzdGF0aWMgdm1fZmF1bHRfdCBmYl9kZWZlcnJlZF9pb19wYWdl
X21rd3JpdGUoc3RydWN0IGZiX2luZm8gKmluZm8sIHN0cnVjdCB2bV9mYXVsdCAqdm1mKQ0K
Pj4gK3sNCj4+ICsJc3RydWN0IHBhZ2UgKnBhZ2UgPSB2bWYtPnBhZ2U7DQo+PiArCXN0cnVj
dCBmYl9kZWZlcnJlZF9pbyAqZmJkZWZpbyA9IGluZm8tPmZiZGVmaW87DQo+PiArCXVuc2ln
bmVkIGxvbmcgb2Zmc2V0Ow0KPj4gKwl2bV9mYXVsdF90IHJldDsNCj4+ICsNCj4+ICsJb2Zm
c2V0ID0gKHZtZi0+YWRkcmVzcyAtIHZtZi0+dm1hLT52bV9zdGFydCk7DQo+PiArDQo+PiAr
CWZpbGVfdXBkYXRlX3RpbWUodm1mLT52bWEtPnZtX2ZpbGUpOw0KPj4gKw0KPj4gKwkvKiBw
cm90ZWN0IGFnYWluc3QgdGhlIHdvcmtxdWV1ZSBjaGFuZ2luZyB0aGUgcGFnZSBsaXN0ICov
DQo+PiArCW11dGV4X2xvY2soJmZiZGVmaW8tPmxvY2spOw0KPj4gKwlyZXQgPSBfX2ZiX2Rl
ZmVycmVkX2lvX3RyYWNrX3BhZ2UoaW5mbywgb2Zmc2V0LCBwYWdlKTsNCj4+ICsJbXV0ZXhf
dW5sb2NrKCZmYmRlZmlvLT5sb2NrKTsNCj4+ICsNCj4+ICsJcmV0dXJuIHJldDsNCj4+ICt9
DQo+PiArDQo+PiArLyogdm1fb3BzLT5wYWdlX21rd3JpdGUgaGFuZGxlciAqLw0KPj4gK3N0
YXRpYyB2bV9mYXVsdF90IGZiX2RlZmVycmVkX2lvX21rd3JpdGUoc3RydWN0IHZtX2ZhdWx0
ICp2bWYpDQo+PiArew0KPj4gKwlzdHJ1Y3QgZmJfaW5mbyAqaW5mbyA9IHZtZi0+dm1hLT52
bV9wcml2YXRlX2RhdGE7DQo+PiArDQo+PiArCXJldHVybiBmYl9kZWZlcnJlZF9pb19wYWdl
X21rd3JpdGUoaW5mbywgdm1mKTsNCj4+ICt9DQo+PiArDQo+PiAgIHN0YXRpYyBjb25zdCBz
dHJ1Y3Qgdm1fb3BlcmF0aW9uc19zdHJ1Y3QgZmJfZGVmZXJyZWRfaW9fdm1fb3BzID0gew0K
Pj4gICAJLmZhdWx0CQk9IGZiX2RlZmVycmVkX2lvX2ZhdWx0LA0KPj4gICAJLnBhZ2VfbWt3
cml0ZQk9IGZiX2RlZmVycmVkX2lvX21rd3JpdGUsDQo+PiAtLSANCj4+IDIuMzYuMA0KDQot
LSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNF
IFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5
IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jD
pGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------tMbS5lLOlke0tFvpuOnR6hDI--

--------------lgBOhBRyyNxExIiTrL09Kpks
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJnsCgFAwAAAAAACgkQlh/E3EQov+AO
iBAAtHIK92BAhYVvU50zHO+rPQdam/euh2/YaShZI41f4HuEI3u5ZxQXarCiW33igbHsOU5vSTZv
7k0GtOaWk+rJqJs06rJcRuLic3D0XCbC1elZW1QUM1fL3AIfGd2PuZ38KrhwQwpzKSfOZp37QaS0
RL8m9tsG1WCmvst8t1t1MHjEdiVkwplebVpDGOu1dIAwwGMgMH/S2cOA8yO0Sca4I3k2hCS44Csh
ssLvG0XnYl4vpbAdwMhtKDNp7eUTH8a3mnmgjo3ekTMiRMg1oAlL9wHlhcFMUcvio8MXFtQ3fc66
X0jerKfK//Djyro9/D+ArPNmQyL1zeUdFMYDXa/PV+CbKG/cttZ3po9q3crnfKXHY1WBNt3vjHUF
W1DTTgZCA/f8HOZ60crVOPyaQ8FuBFUlyIlNkIqa5IUB1NiAbHmW44bNKu8k0RkxOfQOmICh70q0
TkFrJzcXEkvtRvGSHB0+QNz1xu5ZO3fBTG0k6iWQgm4sZVOtkpunxB20YsramSpyGMALKRfKrw28
QMvspTvv04Z5ujtZ0nPZ09D/weHVDNusRw9oLridNLarC7bPEpXq7/G76UsTcB2ijaN+EtbnuYLo
sWuv2XmDc0fuXdNUtNkkEJAusAlr8El4/8Kq6Mih4D5/df9SYwlHbtGJFfBtsSlzGbn7T7r6bq0o
Ka8=
=OaWG
-----END PGP SIGNATURE-----

--------------lgBOhBRyyNxExIiTrL09Kpks--
