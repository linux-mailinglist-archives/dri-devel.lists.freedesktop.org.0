Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE204DCEF9
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 20:44:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CC3610E710;
	Thu, 17 Mar 2022 19:44:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C9BE10E710
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 19:44:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3ACA3210EB;
 Thu, 17 Mar 2022 19:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1647546290; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=je4N0L3IciCUHOWWwN/sATcW/fDYQU1K0ND/UXX7TOk=;
 b=ylEnfwlzaZLNJtI+F1+8JlKlsD4SVykGvJ6UlNgjWvGr/VGuEy6A/3Qw+849RgiENRHZ8I
 /wlagefB8fuOCKSauO4W5TdhslipzyTZrudJnTet+/GbIqulkBGm0ryb+ONmeXKvwR+Cex
 oZ6t7DJ6p6RKYthq1b9N/FhMBPMqUYI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1647546290;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=je4N0L3IciCUHOWWwN/sATcW/fDYQU1K0ND/UXX7TOk=;
 b=jGF101zH43skgOfKMWDeuS9biw7DYIzkW32iZ4lAT9KhKd73ca/mUsE7L8yPxdGb8cghRS
 23iMR247VBrRKKAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 13F5513BCA;
 Thu, 17 Mar 2022 19:44:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 07D3ArKPM2LFOwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 17 Mar 2022 19:44:50 +0000
Message-ID: <32e6bdeb-afc6-6b82-ec18-5471bb27ed76@suse.de>
Date: Thu, 17 Mar 2022 20:44:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 1/4] drm/gma500: Remove unused declarations and other cruft
Content-Language: en-US
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20220317092555.17882-1-patrik.r.jakobsson@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220317092555.17882-1-patrik.r.jakobsson@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0W2jjIovB2OCHYKsn7Vk2X9V"
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
Cc: daniel.vetter@ffwll.ch, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0W2jjIovB2OCHYKsn7Vk2X9V
Content-Type: multipart/mixed; boundary="------------Y1MVVMZuDgkoblF0hgUJTO9m";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 dri-devel@lists.freedesktop.org
Cc: sam@ravnborg.org, daniel.vetter@ffwll.ch
Message-ID: <32e6bdeb-afc6-6b82-ec18-5471bb27ed76@suse.de>
Subject: Re: [PATCH 1/4] drm/gma500: Remove unused declarations and other
 cruft
References: <20220317092555.17882-1-patrik.r.jakobsson@gmail.com>
In-Reply-To: <20220317092555.17882-1-patrik.r.jakobsson@gmail.com>

--------------Y1MVVMZuDgkoblF0hgUJTO9m
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgUGF0cmlrDQoNCkFtIDE3LjAzLjIyIHVtIDEwOjI1IHNjaHJpZWIgUGF0cmlrIEpha29i
c3NvbjoNCj4gTW9zdCBvZiB0aGVzZSBhcmUgb2xkIGxlZnRvdmVycyBmcm9tIG9uZSBvZiB0
aGUgZHJpdmVyIG1lcmdlcy4gVGhpcyBpcw0KPiBhbGwgZGVhZCBjb2RlLg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogUGF0cmlrIEpha29ic3NvbiA8cGF0cmlrLnIuamFrb2Jzc29uQGdtYWls
LmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9wc2JfZHJ2LmggfCA3
NSArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgNzQgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9wc2JfZHJ2LmggYi9kcml2ZXJzL2dwdS9kcm0vZ21h
NTAwL3BzYl9kcnYuaA0KPiBpbmRleCA1NTNkMDMxOTBjZTEuLjY2ZjYxOTA5YThjOCAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9wc2JfZHJ2LmgNCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9wc2JfZHJ2LmgNCj4gQEAgLTM2LDEyICszNiw2IEBA
DQo+ICAgLyogQXBwZW5kIG5ldyBkcm0gbW9kZSBkZWZpbml0aW9uIGhlcmUsIGFsaWduIHdp
dGggbGliZHJtIGRlZmluaXRpb24gKi8NCj4gICAjZGVmaW5lIERSTV9NT0RFX1NDQUxFX05P
X1NDQUxFICAgCTINCj4gICANCj4gLWVudW0gew0KPiAtCUNISVBfUFNCXzgxMDggPSAwLAkJ
LyogUG91bHNibyAqLw0KPiAtCUNISVBfUFNCXzgxMDkgPSAxLAkJLyogUG91bHNibyAqLw0K
PiAtCUNISVBfTVJTVF80MTAwID0gMiwJCS8qIE1vb3Jlc3Rvd24vT2FrdHJhaWwgKi8NCj4g
LX07DQo+IC0NCj4gICAjZGVmaW5lIElTX1BTQihkcm0pICgodG9fcGNpX2RldigoZHJtKS0+
ZGV2KS0+ZGV2aWNlICYgMHhmZmZlKSA9PSAweDgxMDgpDQo+ICAgI2RlZmluZSBJU19NUlNU
KGRybSkgKCh0b19wY2lfZGV2KChkcm0pLT5kZXYpLT5kZXZpY2UgJiAweGZmZjApID09IDB4
NDEwMCkNCj4gICAjZGVmaW5lIElTX0NEVihkcm0pICgodG9fcGNpX2RldigoZHJtKS0+ZGV2
KS0+ZGV2aWNlICYgMHhmZmYwKSA9PSAweDBiZTApDQo+IEBAIC02MTcsMTUgKzYxMSw3IEBA
IHN0cnVjdCBwc2Jfb3BzIHsNCj4gICAJaW50IGkyY19idXM7CQkvKiBJMkMgYnVzIGlkZW50
aWZpZXIgZm9yIE1vb3Jlc3Rvd24gKi8NCj4gICB9Ow0KPiAgIA0KPiAtDQo+IC0NCj4gLWV4
dGVybiBpbnQgZHJtX2NydGNfcHJvYmVfb3V0cHV0X21vZGVzKHN0cnVjdCBkcm1fZGV2aWNl
ICpkZXYsIGludCwgaW50KTsNCj4gLWV4dGVybiBpbnQgZHJtX3BpY2tfY3J0Y3Moc3RydWN0
IGRybV9kZXZpY2UgKmRldik7DQo+IC0NCj4gICAvKiBwc2JfaXJxLmMgKi8NCj4gLWV4dGVy
biB2b2lkIHBzYl9pcnFfdW5pbnN0YWxsX2lzbGFuZHMoc3RydWN0IGRybV9kZXZpY2UgKmRl
diwgaW50IGh3X2lzbGFuZHMpOw0KPiAtZXh0ZXJuIGludCBwc2JfdmJsYW5rX3dhaXQyKHN0
cnVjdCBkcm1fZGV2aWNlICpkZXYsIHVuc2lnbmVkIGludCAqc2VxdWVuY2UpOw0KPiAtZXh0
ZXJuIGludCBwc2JfdmJsYW5rX3dhaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdW5zaWdu
ZWQgaW50ICpzZXF1ZW5jZSk7DQo+ICAgZXh0ZXJuIGludCBwc2JfZW5hYmxlX3ZibGFuayhz
dHJ1Y3QgZHJtX2NydGMgKmNydGMpOw0KPiAgIGV4dGVybiB2b2lkIHBzYl9kaXNhYmxlX3Zi
bGFuayhzdHJ1Y3QgZHJtX2NydGMgKmNydGMpOw0KDQpUaGUgdmJsYW5rIGVuYWJsZS9kaXNh
YmxlIGZ1bmN0aW9ucyBhcmUgYWxzbyBkZWNsYXJlZCBpbiBwc2JfaXJxLmguIFRoZSANCmRl
Y2xhcmF0aW9ucyBoZXJlIGNvdWxkIGJlIHJlbW92ZWQgYXMgd2VsbC4NCg0KPiAgIHZvaWQN
Cj4gQEAgLTYzNiwxNyArNjIyLDkgQEAgcHNiX2Rpc2FibGVfcGlwZXN0YXQoc3RydWN0IGRy
bV9wc2JfcHJpdmF0ZSAqZGV2X3ByaXYsIGludCBwaXBlLCB1MzIgbWFzayk7DQo+ICAgDQo+
ICAgZXh0ZXJuIHUzMiBwc2JfZ2V0X3ZibGFua19jb3VudGVyKHN0cnVjdCBkcm1fY3J0YyAq
Y3J0Yyk7DQo+ICAgDQo+IC0vKiBmcmFtZWJ1ZmZlci5jICovDQo+IC1leHRlcm4gaW50IHBz
YmZiX3Byb2JlZChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KTsNCj4gLWV4dGVybiBpbnQgcHNi
ZmJfcmVtb3ZlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsDQo+IC0JCQlzdHJ1Y3QgZHJtX2Zy
YW1lYnVmZmVyICpmYik7DQo+IC0vKiBwc2JfZHJ2LmMgKi8NCj4gLWV4dGVybiB2b2lkIHBz
Yl9zcGFuayhzdHJ1Y3QgZHJtX3BzYl9wcml2YXRlICpkZXZfcHJpdik7DQoNClRoaXMgZnVu
Y3Rpb24gaXMgc3RpbGwgYXJvdW5kIGluIHBzYl9kcnYuYy4gSXQgc2hvdWxkIG5vdyBiZSBk
ZWNsYXJlZCANCnN0YXRpYy4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiAtDQo+IC0v
KiBwc2JfcmVzZXQuYyAqLw0KPiArLyogcHNiX2xpZC5jICovDQo+ICAgZXh0ZXJuIHZvaWQg
cHNiX2xpZF90aW1lcl9pbml0KHN0cnVjdCBkcm1fcHNiX3ByaXZhdGUgKmRldl9wcml2KTsN
Cj4gICBleHRlcm4gdm9pZCBwc2JfbGlkX3RpbWVyX3Rha2Vkb3duKHN0cnVjdCBkcm1fcHNi
X3ByaXZhdGUgKmRldl9wcml2KTsNCj4gLWV4dGVybiB2b2lkIHBzYl9wcmludF9wYWdlZmF1
bHQoc3RydWN0IGRybV9wc2JfcHJpdmF0ZSAqZGV2X3ByaXYpOw0KPiAgIA0KPiAgIC8qIG1v
ZGVzZXR0aW5nICovDQo+ICAgZXh0ZXJuIHZvaWQgcHNiX21vZGVzZXRfaW5pdChzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGV2KTsNCj4gQEAgLTY4OSw0MyArNjY3LDcgQEAgZXh0ZXJuIGNvbnN0
IHN0cnVjdCBwc2Jfb3BzIG9ha3RyYWlsX2NoaXBfb3BzOw0KPiAgIC8qIGNkdl9kZXZpY2Uu
YyAqLw0KPiAgIGV4dGVybiBjb25zdCBzdHJ1Y3QgcHNiX29wcyBjZHZfY2hpcF9vcHM7DQo+
ICAgDQo+IC0vKiBEZWJ1ZyBwcmludCBiaXRzIHNldHRpbmcgKi8NCj4gLSNkZWZpbmUgUFNC
X0RfR0VORVJBTCAoMSA8PCAwKQ0KPiAtI2RlZmluZSBQU0JfRF9JTklUICAgICgxIDw8IDEp
DQo+IC0jZGVmaW5lIFBTQl9EX0lSUSAgICAgKDEgPDwgMikNCj4gLSNkZWZpbmUgUFNCX0Rf
RU5UUlkgICAoMSA8PCAzKQ0KPiAtLyogZGVidWcgdGhlIGdldCBIL1YgQlAvRlAgY291bnQg
Ki8NCj4gLSNkZWZpbmUgUFNCX0RfSFYgICAgICAoMSA8PCA0KQ0KPiAtI2RlZmluZSBQU0Jf
RF9EQklfQkYgICgxIDw8IDUpDQo+IC0jZGVmaW5lIFBTQl9EX1BNICAgICAgKDEgPDwgNikN
Cj4gLSNkZWZpbmUgUFNCX0RfUkVOREVSICAoMSA8PCA3KQ0KPiAtI2RlZmluZSBQU0JfRF9S
RUcgICAgICgxIDw8IDgpDQo+IC0jZGVmaW5lIFBTQl9EX01TVkRYICAgKDEgPDwgOSkNCj4g
LSNkZWZpbmUgUFNCX0RfVE9QQVogICAoMSA8PCAxMCkNCj4gLQ0KPiAtZXh0ZXJuIGludCBk
cm1faWRsZV9jaGVja19pbnRlcnZhbDsNCj4gLQ0KPiAgIC8qIFV0aWxpdGllcyAqLw0KPiAt
c3RhdGljIGlubGluZSB1MzIgTVJTVF9NU0dfUkVBRDMyKGludCBkb21haW4sIHVpbnQgcG9y
dCwgdWludCBvZmZzZXQpDQo+IC17DQo+IC0JaW50IG1jciA9ICgweEQwPDwyNCkgfCAocG9y
dCA8PCAxNikgfCAob2Zmc2V0IDw8IDgpOw0KPiAtCXVpbnQzMl90IHJldF92YWwgPSAwOw0K
PiAtCXN0cnVjdCBwY2lfZGV2ICpwY2lfcm9vdCA9IHBjaV9nZXRfZG9tYWluX2J1c19hbmRf
c2xvdChkb21haW4sIDAsIDApOw0KPiAtCXBjaV93cml0ZV9jb25maWdfZHdvcmQocGNpX3Jv
b3QsIDB4RDAsIG1jcik7DQo+IC0JcGNpX3JlYWRfY29uZmlnX2R3b3JkKHBjaV9yb290LCAw
eEQ0LCAmcmV0X3ZhbCk7DQo+IC0JcGNpX2Rldl9wdXQocGNpX3Jvb3QpOw0KPiAtCXJldHVy
biByZXRfdmFsOw0KPiAtfQ0KPiAtc3RhdGljIGlubGluZSB2b2lkIE1SU1RfTVNHX1dSSVRF
MzIoaW50IGRvbWFpbiwgdWludCBwb3J0LCB1aW50IG9mZnNldCwNCj4gLQkJCQkgICAgdTMy
IHZhbHVlKQ0KPiAtew0KPiAtCWludCBtY3IgPSAoMHhFMDw8MjQpIHwgKHBvcnQgPDwgMTYp
IHwgKG9mZnNldCA8PCA4KSB8IDB4RjA7DQo+IC0Jc3RydWN0IHBjaV9kZXYgKnBjaV9yb290
ID0gcGNpX2dldF9kb21haW5fYnVzX2FuZF9zbG90KGRvbWFpbiwgMCwgMCk7DQo+IC0JcGNp
X3dyaXRlX2NvbmZpZ19kd29yZChwY2lfcm9vdCwgMHhENCwgdmFsdWUpOw0KPiAtCXBjaV93
cml0ZV9jb25maWdfZHdvcmQocGNpX3Jvb3QsIDB4RDAsIG1jcik7DQo+IC0JcGNpX2Rldl9w
dXQocGNpX3Jvb3QpOw0KPiAtfQ0KPiAtDQo+ICAgc3RhdGljIGlubGluZSB1aW50MzJfdCBS
RUdJU1RFUl9SRUFEKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHVpbnQzMl90IHJlZykNCj4g
ICB7DQo+ICAgCXN0cnVjdCBkcm1fcHNiX3ByaXZhdGUgKmRldl9wcml2ID0gdG9fZHJtX3Bz
Yl9wcml2YXRlKGRldik7DQo+IEBAIC04MDYsMjQgKzc0OCw5IEBAIHN0YXRpYyBpbmxpbmUg
dm9pZCBSRUdJU1RFUl9XUklURTgoc3RydWN0IGRybV9kZXZpY2UgKmRldiwNCj4gICAjZGVm
aW5lIFBTQl9XVkRDMzIoX3ZhbCwgX29mZnMpCQlpb3dyaXRlMzIoX3ZhbCwgZGV2X3ByaXYt
PnZkY19yZWcgKyAoX29mZnMpKQ0KPiAgICNkZWZpbmUgUFNCX1JWREMzMihfb2ZmcykJCWlv
cmVhZDMyKGRldl9wcml2LT52ZGNfcmVnICsgKF9vZmZzKSkNCj4gICANCj4gLS8qICNkZWZp
bmUgVFJBUF9TR1hfUE1fRkFVTFQgMSAqLw0KPiAtI2lmZGVmIFRSQVBfU0dYX1BNX0ZBVUxU
DQo+IC0jZGVmaW5lIFBTQl9SU0dYMzIoX29mZnMpCQkJCQkJXA0KPiAtKHsJCQkJCQkJCQlc
DQo+IC0JaWYgKGlubChkZXZfcHJpdi0+YXBtX2Jhc2UgKyBQU0JfQVBNX1NUUykgJiAweDMp
IHsJCVwNCj4gLQkJcHJfZXJyKCJhY2Nlc3Mgc2d4IHdoZW4gaXQncyBvZmYhISAoUkVBRCkg
JXMsICVkXG4iLAlcDQo+IC0JCSAgICAgICBfX0ZJTEVfXywgX19MSU5FX18pOwkJCQlcDQo+
IC0JCW1lbGF5KDEwMDApOwkJCQkJCVwNCj4gLQl9CQkJCQkJCQlcDQo+IC0JaW9yZWFkMzIo
ZGV2X3ByaXYtPnNneF9yZWcgKyAoX29mZnMpKTsJCQkJXA0KPiAtfSkNCj4gLSNlbHNlDQo+
ICAgI2RlZmluZSBQU0JfUlNHWDMyKF9vZmZzKQkJaW9yZWFkMzIoZGV2X3ByaXYtPnNneF9y
ZWcgKyAoX29mZnMpKQ0KPiAtI2VuZGlmDQo+ICAgI2RlZmluZSBQU0JfV1NHWDMyKF92YWws
IF9vZmZzKQkJaW93cml0ZTMyKF92YWwsIGRldl9wcml2LT5zZ3hfcmVnICsgKF9vZmZzKSkN
Cj4gICANCj4gLSNkZWZpbmUgTVNWRFhfUkVHX0RVTVAgMA0KPiAtDQo+ICAgI2RlZmluZSBQ
U0JfV01TVkRYMzIoX3ZhbCwgX29mZnMpCWlvd3JpdGUzMihfdmFsLCBkZXZfcHJpdi0+bXN2
ZHhfcmVnICsgKF9vZmZzKSkNCj4gICAjZGVmaW5lIFBTQl9STVNWRFgzMihfb2ZmcykJCWlv
cmVhZDMyKGRldl9wcml2LT5tc3ZkeF9yZWcgKyAoX29mZnMpKQ0KPiAgIA0KDQotLSANClRo
b21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3
YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJu
YmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bD
vGhyZXI6IEl2byBUb3Rldg0K

--------------Y1MVVMZuDgkoblF0hgUJTO9m--

--------------0W2jjIovB2OCHYKsn7Vk2X9V
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmIzj7EFAwAAAAAACgkQlh/E3EQov+An
eQ//YcSKhmpuulUfj2uTpZyfmtra72LvhZN2qgMzGKkBDCwePL9kvYQelLzyUol24XxeQwB4jgJy
U3f3mjee3Y0+Cp3Ja/8Rt5adqMTOCqEO74JuLY4ob38CyyPyOPJnQRh151ATLWmKfeDfhIDYyR6B
iQDjYFLIWkrTEgdZe7g/ZO6mavZTDtEnrnDouPgUtDVb6BFP0ag2WPewGVyzzCWSlObMsCgETJo6
GJFgZ/q2veNI0RAHdHg3G6YSZAX8LOblS5JKRjH+XKUGa0JVOUIhkyOfZoywgYTKFgCg4vbGC73d
zJHrkNCdBlXD7Uw6xrH3qrNnBf0ngdV59o8gEnI8oATPBp/N7H9/5zoTdIWgPlLWx5YnjlWtbEbP
DP07MuQLe3vjRiJmdBG8BEZiRd0s2vUV7u++P70WmcT1gtTYAJfsIK9mcBrfLUTe+qiRqZp2w4hJ
jHI2eqFkT96SNtomfd4+L1EIqwP+RX2pijJnebwNqQZ6uC8ILLyH2DQ1hEuWVNrcJknWunwmA0gd
ZxJHoU+RBSOyy0BEEXlFogGGS+FfMmVrWWGtBrIFS/l4t9EVH2mLGHowC8uBWzlQr2AEqnGi/9kQ
hAxE/W192MTIXbIfB+RHmCykkuyM39eaJXbW8PPnAidMVEeAP3oRMFnPS2aPKfNT57yE0Fn8h8xR
5uc=
=3GSr
-----END PGP SIGNATURE-----

--------------0W2jjIovB2OCHYKsn7Vk2X9V--
