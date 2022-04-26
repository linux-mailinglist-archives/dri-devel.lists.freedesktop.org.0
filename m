Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F8450F36F
	for <lists+dri-devel@lfdr.de>; Tue, 26 Apr 2022 10:10:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A78A510F087;
	Tue, 26 Apr 2022 08:10:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7A3010F087
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Apr 2022 08:10:27 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 477EC210EC;
 Tue, 26 Apr 2022 08:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1650960626; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LmskNZ8QwoHGMp8cTjNXsgl4SEJ7yW6gMzkJaCzctRg=;
 b=V45YJDOX0RaLLqpgzAWxdHbR/JTOv9TWKzWtNnjTkZCBIf6xIbPaW2NJ84/WOJHkiGbhmi
 FevGGTjU2dstQCPbmoJUrESHQgTiNlrPm8Jk7ukkYt5louiKmzP3j3cuWsJInJdqwhAklx
 33opP621kyzPaTOl2TvvI0yJQFSL0DE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1650960626;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LmskNZ8QwoHGMp8cTjNXsgl4SEJ7yW6gMzkJaCzctRg=;
 b=5kUqCWtTu3SGjREAR+HMbfTCdP0Q6upDEJMIiV0p+CnScp7de3F/K3o8uEY7Wygt3g20zz
 auRFW2/Z41jxwODA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1C72213AD5;
 Tue, 26 Apr 2022 08:10:26 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id jqgOBvKoZ2KLDgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 26 Apr 2022 08:10:26 +0000
Message-ID: <5be6e9da-7520-dd54-3cb6-1b0bad41dfb4@suse.de>
Date: Tue, 26 Apr 2022 10:10:25 +0200
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
 boundary="------------E4eX91akBqh6FRl7TY21HpSJ"
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
--------------E4eX91akBqh6FRl7TY21HpSJ
Content-Type: multipart/mixed; boundary="------------8iSzKNXVAgw7STLLe42hIp0K";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: javierm@redhat.com, daniel@ffwll.ch, deller@gmx.de, airlied@linux.ie,
 maarten.lankhorst@linux.intel.com, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Message-ID: <5be6e9da-7520-dd54-3cb6-1b0bad41dfb4@suse.de>
Subject: Re: [PATCH v2 3/3] fbdev: Refactor implementation of page_mkwrite
References: <20220425112751.25985-1-tzimmermann@suse.de>
 <20220425112751.25985-4-tzimmermann@suse.de> <YmbncpwerOQLB1cS@ravnborg.org>
In-Reply-To: <YmbncpwerOQLB1cS@ravnborg.org>

--------------8iSzKNXVAgw7STLLe42hIp0K
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
ciBiZWZvcmUgKG1vZHVsdXMgdGhlDQo+IGltcHJvdmVkIGNvbW1lbnRzKS4NCj4gDQo+IEJ1
dCBpZiB5b3UgY29uc2lkZXIgaXQgYmV0dGVyIGtlZXAgaXQuIEFnYWluIGp1c3QgbXkgdGhv
dWdodHMgd2hlbg0KPiByZWFkaW5nIHRoZSBjb2RlLg0KDQpUaGUgY29tZXMgZnJvbSBwYXRj
aCBvZiB0aGUgbGFyZ2VyIEdFTSByZWZhY3RvcmluZyBwYXRjaGVzLiBbMV0gDQpmYl9kZWZl
cnJlZF9pb19wYWdlX21rd3JpdGUoKSBpcyBsYXRlciBzdXBwb3NlZCB0byBiZSBleHBvcnRl
ZCBmb3IgdXNlIA0Kd2l0aCBEUk0uDQoNClRoZSBwYXRjaCBpc24ndCBzdHJpY3RseSBuZWNl
c3NhcnksIGJ1dCBpdCBkb2Vzbid0IGRvIGFueSBoYXJtIGVpdGhlci4gSSANCmFkZGVkIGl0
IHRvIHRoZSBwYXRjaHNldCwgc28gdGhhdCBJIGRvbid0IGhhdmUgdG8gZGVhbCB3aXRoIHBv
dGVudGlhbCANCmJpdCByb3QgbGF0ZXIgb24uDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoN
ClsxXSANCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2RyaS1kZXZlbC8yMDIyMDMwMzIwNTgz
OS4yODQ4NC01LXR6aW1tZXJtYW5uQHN1c2UuZGUvDQoNCj4gDQo+IAlTYW0NCj4gDQo+Pg0K
Pj4gdjI6DQo+PiAJKiBkb24ndCBleHBvcnQgdGhlIGhlbHBlciB1bnRpbCB3ZSBoYXZlIGFu
IGV4dGVybmFsIGNhbGxlcg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJt
YW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPj4gUmV2aWV3ZWQtYnk6IEphdmllciBNYXJ0
aW5leiBDYW5pbGxhcyA8amF2aWVybUByZWRoYXQuY29tPg0KPj4gLS0tDQo+PiAgIGRyaXZl
cnMvdmlkZW8vZmJkZXYvY29yZS9mYl9kZWZpby5jIHwgNjggKysrKysrKysrKysrKysrKysr
KystLS0tLS0tLS0NCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDQ4IGluc2VydGlvbnMoKyksIDIw
IGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2
L2NvcmUvZmJfZGVmaW8uYyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYl9kZWZpby5j
DQo+PiBpbmRleCBhMDNiOWM2NGZjNjEuLjIxNDU4MWNlNTg0MCAxMDA2NDQNCj4+IC0tLSBh
L2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYl9kZWZpby5jDQo+PiArKysgYi9kcml2ZXJz
L3ZpZGVvL2ZiZGV2L2NvcmUvZmJfZGVmaW8uYw0KPj4gQEAgLTE0MywyOSArMTQzLDE4IEBA
IGludCBmYl9kZWZlcnJlZF9pb19mc3luYyhzdHJ1Y3QgZmlsZSAqZmlsZSwgbG9mZl90IHN0
YXJ0LCBsb2ZmX3QgZW5kLCBpbnQgZGF0YXN5DQo+PiAgIH0NCj4+ICAgRVhQT1JUX1NZTUJP
TF9HUEwoZmJfZGVmZXJyZWRfaW9fZnN5bmMpOw0KPj4gICANCj4+IC0vKiB2bV9vcHMtPnBh
Z2VfbWt3cml0ZSBoYW5kbGVyICovDQo+PiAtc3RhdGljIHZtX2ZhdWx0X3QgZmJfZGVmZXJy
ZWRfaW9fbWt3cml0ZShzdHJ1Y3Qgdm1fZmF1bHQgKnZtZikNCj4+ICsvKg0KPj4gKyAqIEFk
ZHMgYSBwYWdlIHRvIHRoZSBkaXJ0eSBsaXN0LiBSZXF1aXJlcyBjYWxsZXIgdG8gaG9sZA0K
Pj4gKyAqIHN0cnVjdCBmYl9kZWZlcnJlZF9pby5sb2NrLiBDYWxsIHRoaXMgZnJvbSBzdHJ1
Y3QNCj4+ICsgKiB2bV9vcGVyYXRpb25zX3N0cnVjdC5wYWdlX21rd3JpdGUuDQo+PiArICov
DQo+PiArc3RhdGljIHZtX2ZhdWx0X3QgX19mYl9kZWZlcnJlZF9pb190cmFja19wYWdlKHN0
cnVjdCBmYl9pbmZvICppbmZvLCB1bnNpZ25lZCBsb25nIG9mZnNldCwNCj4+ICsJCQkJCSAg
ICAgIHN0cnVjdCBwYWdlICpwYWdlKQ0KPj4gICB7DQo+PiAtCXN0cnVjdCBwYWdlICpwYWdl
ID0gdm1mLT5wYWdlOw0KPj4gLQlzdHJ1Y3QgZmJfaW5mbyAqaW5mbyA9IHZtZi0+dm1hLT52
bV9wcml2YXRlX2RhdGE7DQo+PiAgIAlzdHJ1Y3QgZmJfZGVmZXJyZWRfaW8gKmZiZGVmaW8g
PSBpbmZvLT5mYmRlZmlvOw0KPj4gICAJc3RydWN0IGZiX2RlZmVycmVkX2lvX3BhZ2VyZWYg
KnBhZ2VyZWY7DQo+PiAtCXVuc2lnbmVkIGxvbmcgb2Zmc2V0Ow0KPj4gICAJdm1fZmF1bHRf
dCByZXQ7DQo+PiAgIA0KPj4gLQlvZmZzZXQgPSAodm1mLT5hZGRyZXNzIC0gdm1mLT52bWEt
PnZtX3N0YXJ0KTsNCj4+IC0NCj4+IC0JLyogdGhpcyBpcyBhIGNhbGxiYWNrIHdlIGdldCB3
aGVuIHVzZXJzcGFjZSBmaXJzdCB0cmllcyB0bw0KPj4gLQl3cml0ZSB0byB0aGUgcGFnZS4g
d2Ugc2NoZWR1bGUgYSB3b3JrcXVldWUuIHRoYXQgd29ya3F1ZXVlDQo+PiAtCXdpbGwgZXZl
bnR1YWxseSBta2NsZWFuIHRoZSB0b3VjaGVkIHBhZ2VzIGFuZCBleGVjdXRlIHRoZQ0KPj4g
LQlkZWZlcnJlZCBmcmFtZWJ1ZmZlciBJTy4gdGhlbiBpZiB1c2Vyc3BhY2UgdG91Y2hlcyBh
IHBhZ2UNCj4+IC0JYWdhaW4sIHdlIHJlcGVhdCB0aGUgc2FtZSBzY2hlbWUgKi8NCj4+IC0N
Cj4+IC0JZmlsZV91cGRhdGVfdGltZSh2bWYtPnZtYS0+dm1fZmlsZSk7DQo+PiAtDQo+PiAt
CS8qIHByb3RlY3QgYWdhaW5zdCB0aGUgd29ya3F1ZXVlIGNoYW5naW5nIHRoZSBwYWdlIGxp
c3QgKi8NCj4+IC0JbXV0ZXhfbG9jaygmZmJkZWZpby0+bG9jayk7DQo+PiAtDQo+PiAgIAkv
KiBmaXJzdCB3cml0ZSBpbiB0aGlzIGN5Y2xlLCBub3RpZnkgdGhlIGRyaXZlciAqLw0KPj4g
ICAJaWYgKGZiZGVmaW8tPmZpcnN0X2lvICYmIGxpc3RfZW1wdHkoJmZiZGVmaW8tPnBhZ2Vs
aXN0KSkNCj4+ICAgCQlmYmRlZmlvLT5maXJzdF9pbyhpbmZvKTsNCj4+IEBAIC0xODYsOCAr
MTc1LDYgQEAgc3RhdGljIHZtX2ZhdWx0X3QgZmJfZGVmZXJyZWRfaW9fbWt3cml0ZShzdHJ1
Y3Qgdm1fZmF1bHQgKnZtZikNCj4+ICAgCSAqLw0KPj4gICAJbG9ja19wYWdlKHBhZ2VyZWYt
PnBhZ2UpOw0KPj4gICANCj4+IC0JbXV0ZXhfdW5sb2NrKCZmYmRlZmlvLT5sb2NrKTsNCj4+
IC0NCj4+ICAgCS8qIGNvbWUgYmFjayBhZnRlciBkZWxheSB0byBwcm9jZXNzIHRoZSBkZWZl
cnJlZCBJTyAqLw0KPj4gICAJc2NoZWR1bGVfZGVsYXllZF93b3JrKCZpbmZvLT5kZWZlcnJl
ZF93b3JrLCBmYmRlZmlvLT5kZWxheSk7DQo+PiAgIAlyZXR1cm4gVk1fRkFVTFRfTE9DS0VE
Ow0KPj4gQEAgLTE5Nyw2ICsxODQsNDcgQEAgc3RhdGljIHZtX2ZhdWx0X3QgZmJfZGVmZXJy
ZWRfaW9fbWt3cml0ZShzdHJ1Y3Qgdm1fZmF1bHQgKnZtZikNCj4+ICAgCXJldHVybiByZXQ7
DQo+PiAgIH0NCj4+ICAgDQo+PiArLyoNCj4+ICsgKiBmYl9kZWZlcnJlZF9pb19wYWdlX21r
d3JpdGUgLSBNYXJrIGEgcGFnZSBhcyB3cml0dGVuIGZvciBkZWZlcnJlZCBJL08NCj4+ICsg
KiBAZmJfaW5mbzogVGhlIGZiZGV2IGluZm8gc3RydWN0dXJlDQo+PiArICogQHZtZjogVGhl
IFZNIGZhdWx0DQo+PiArICoNCj4+ICsgKiBUaGlzIGlzIGEgY2FsbGJhY2sgd2UgZ2V0IHdo
ZW4gdXNlcnNwYWNlIGZpcnN0IHRyaWVzIHRvDQo+PiArICogd3JpdGUgdG8gdGhlIHBhZ2Uu
IFdlIHNjaGVkdWxlIGEgd29ya3F1ZXVlLiBUaGF0IHdvcmtxdWV1ZQ0KPj4gKyAqIHdpbGwg
ZXZlbnR1YWxseSBta2NsZWFuIHRoZSB0b3VjaGVkIHBhZ2VzIGFuZCBleGVjdXRlIHRoZQ0K
Pj4gKyAqIGRlZmVycmVkIGZyYW1lYnVmZmVyIElPLiBUaGVuIGlmIHVzZXJzcGFjZSB0b3Vj
aGVzIGEgcGFnZQ0KPj4gKyAqIGFnYWluLCB3ZSByZXBlYXQgdGhlIHNhbWUgc2NoZW1lLg0K
Pj4gKyAqDQo+PiArICogUmV0dXJuczoNCj4+ICsgKiBWTV9GQVVMVF9MT0NLRUQgb24gc3Vj
Y2Vzcywgb3IgYSBWTV9GQVVMVCBlcnJvciBvdGhlcndpc2UuDQo+PiArICovDQo+PiArc3Rh
dGljIHZtX2ZhdWx0X3QgZmJfZGVmZXJyZWRfaW9fcGFnZV9ta3dyaXRlKHN0cnVjdCBmYl9p
bmZvICppbmZvLCBzdHJ1Y3Qgdm1fZmF1bHQgKnZtZikNCj4+ICt7DQo+PiArCXN0cnVjdCBw
YWdlICpwYWdlID0gdm1mLT5wYWdlOw0KPj4gKwlzdHJ1Y3QgZmJfZGVmZXJyZWRfaW8gKmZi
ZGVmaW8gPSBpbmZvLT5mYmRlZmlvOw0KPj4gKwl1bnNpZ25lZCBsb25nIG9mZnNldDsNCj4+
ICsJdm1fZmF1bHRfdCByZXQ7DQo+PiArDQo+PiArCW9mZnNldCA9ICh2bWYtPmFkZHJlc3Mg
LSB2bWYtPnZtYS0+dm1fc3RhcnQpOw0KPj4gKw0KPj4gKwlmaWxlX3VwZGF0ZV90aW1lKHZt
Zi0+dm1hLT52bV9maWxlKTsNCj4+ICsNCj4+ICsJLyogcHJvdGVjdCBhZ2FpbnN0IHRoZSB3
b3JrcXVldWUgY2hhbmdpbmcgdGhlIHBhZ2UgbGlzdCAqLw0KPj4gKwltdXRleF9sb2NrKCZm
YmRlZmlvLT5sb2NrKTsNCj4+ICsJcmV0ID0gX19mYl9kZWZlcnJlZF9pb190cmFja19wYWdl
KGluZm8sIG9mZnNldCwgcGFnZSk7DQo+PiArCW11dGV4X3VubG9jaygmZmJkZWZpby0+bG9j
ayk7DQo+PiArDQo+PiArCXJldHVybiByZXQ7DQo+PiArfQ0KPj4gKw0KPj4gKy8qIHZtX29w
cy0+cGFnZV9ta3dyaXRlIGhhbmRsZXIgKi8NCj4+ICtzdGF0aWMgdm1fZmF1bHRfdCBmYl9k
ZWZlcnJlZF9pb19ta3dyaXRlKHN0cnVjdCB2bV9mYXVsdCAqdm1mKQ0KPj4gK3sNCj4+ICsJ
c3RydWN0IGZiX2luZm8gKmluZm8gPSB2bWYtPnZtYS0+dm1fcHJpdmF0ZV9kYXRhOw0KPj4g
Kw0KPj4gKwlyZXR1cm4gZmJfZGVmZXJyZWRfaW9fcGFnZV9ta3dyaXRlKGluZm8sIHZtZik7
DQo+PiArfQ0KPj4gKw0KPj4gICBzdGF0aWMgY29uc3Qgc3RydWN0IHZtX29wZXJhdGlvbnNf
c3RydWN0IGZiX2RlZmVycmVkX2lvX3ZtX29wcyA9IHsNCj4+ICAgCS5mYXVsdAkJPSBmYl9k
ZWZlcnJlZF9pb19mYXVsdCwNCj4+ICAgCS5wYWdlX21rd3JpdGUJPSBmYl9kZWZlcnJlZF9p
b19ta3dyaXRlLA0KPj4gLS0gDQo+PiAyLjM2LjANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFu
bg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMg
R2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkN
CihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90
ZXYNCg==

--------------8iSzKNXVAgw7STLLe42hIp0K--

--------------E4eX91akBqh6FRl7TY21HpSJ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJnqPEFAwAAAAAACgkQlh/E3EQov+Dz
lw//S3ZUoCBFUGi3B5DUoMORnu4PMCMOWvhWM4yzR9fZRGvf4vNMee8PBgxKBCpHKZ/+j736ENKj
/P3RiFeMaQQoB4YiVOhvffkHJF25tkVHkH/zQ9Zgklvxxq3TvisUc6eQU96OtVks26RAydcNGI/o
6QtdfBfoLRKplcDi4wlEqoWusJ8w7LLya1fZapzldoUJlFqtMIPT04JX2tW9fp2KrLltPonACXGw
2AqrxU0Wh+G/NAMjfsXLaZpxgEgnohBJ5lHgsOc3MpZbiUTXFzb03W3DCq21y5dExpOjatalsCOH
Kb97fzgRyTU0y4yI3hP1g2ZQpI36pB7FVfkCadn7riFgOOEjVazIZD6TNUZCxQJrsQ2HEY2tBgct
X2lOAz4mXZZUCB9Uyr+cZDsGAc/vzda1IK3SoVsp+Fkr1xqvMHZgnuqFkdVHppQoQ51At33AMMRU
SSksnZhPoBPhWa11g2GLuIriIvm0s9tEPhAzKg6N8bO/crtDcg+Eqaca7YkbDBTvOb4GVYfdlPDo
7eG/PXL4C3gt2ptZBOf/aFCPLrHDjQzEF1966qwQ65Vl2AQdCVe9xafvwbQmFwUtLSmhqZS7rKsZ
c1k1j0GQGRy054ZaOnQ1OLWCbWRBtr2rKMYgtcedOl3ohfLCw7Pw860Y8O0h/91y4pZYH8/aRBdU
2FA=
=sfAC
-----END PGP SIGNATURE-----

--------------E4eX91akBqh6FRl7TY21HpSJ--
