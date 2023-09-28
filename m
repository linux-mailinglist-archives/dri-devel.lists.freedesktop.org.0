Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1ED47B15CD
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 10:16:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC97510E088;
	Thu, 28 Sep 2023 08:16:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DD8410E088
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 08:16:00 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 172B01F45A;
 Thu, 28 Sep 2023 08:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1695888959; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=YNb6C0midkoQmdHxUbn+HFOKyyDd3bF2/h2FCrS19n4=;
 b=HMmopPzSEnBZZv3YI0Uc4vpu3WHEqZbkCfU8l+YFQ7Q/K/n5p3QKYxlUtSCA1CAjCv0gbU
 E9fgX6G5P920pcTg7lcKGsVPR6hQ3HVkQ6koRhAqWGGkzi8WUQJdXKtX7yNI/6oZ/CbM5i
 muwZi6ZukvRwSKGzmbWHJ+b5fO6NDAg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1695888959;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=YNb6C0midkoQmdHxUbn+HFOKyyDd3bF2/h2FCrS19n4=;
 b=fNG4hKgtNdiLzpHzv3lFcXQ3wAd6A8+hqy2cHEVbas0j6RtefwD+/kkthu4EPXRkSbjlEQ
 dBd732AtrnVYCBDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D1A82138E9;
 Thu, 28 Sep 2023 08:15:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0UwcMj42FWW/RAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 28 Sep 2023 08:15:58 +0000
Message-ID: <0ead441a-a573-4da8-8125-ef3dfa3d751c@suse.de>
Date: Thu, 28 Sep 2023 10:15:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] drm/simpledrm: Store xfrm buffer in device instance
To: Jocelyn Falempe <jfalempe@redhat.com>, javierm@redhat.com,
 jose.exposito89@gmail.com, arthurgrillo@riseup.net, mairacanal@riseup.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, noralf@tronnes.org
References: <20230920142535.19321-1-tzimmermann@suse.de>
 <20230920142535.19321-4-tzimmermann@suse.de>
 <c19e0868-b84e-8eb6-909e-9e37e222b809@redhat.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <c19e0868-b84e-8eb6-909e-9e37e222b809@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------zYFGsCFQOGFNZB1SCBRkTxqL"
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
--------------zYFGsCFQOGFNZB1SCBRkTxqL
Content-Type: multipart/mixed; boundary="------------ozfyj1ahRH0KwLRx3v4uNiiB";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jocelyn Falempe <jfalempe@redhat.com>, javierm@redhat.com,
 jose.exposito89@gmail.com, arthurgrillo@riseup.net, mairacanal@riseup.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, noralf@tronnes.org
Cc: dri-devel@lists.freedesktop.org
Message-ID: <0ead441a-a573-4da8-8125-ef3dfa3d751c@suse.de>
Subject: Re: [PATCH v2 3/5] drm/simpledrm: Store xfrm buffer in device
 instance
References: <20230920142535.19321-1-tzimmermann@suse.de>
 <20230920142535.19321-4-tzimmermann@suse.de>
 <c19e0868-b84e-8eb6-909e-9e37e222b809@redhat.com>
In-Reply-To: <c19e0868-b84e-8eb6-909e-9e37e222b809@redhat.com>

--------------ozfyj1ahRH0KwLRx3v4uNiiB
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjYuMDkuMjMgdW0gMDk6MzEgc2NocmllYiBKb2NlbHluIEZhbGVtcGU6DQo+
IE9uIDIwLzA5LzIwMjMgMTY6MjQsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4gU3Rv
cmUgYW5kIGluc3RhbmNlIG9mIHN0cnVjdCBkcm1feGZybV9idWYgaW4gc3RydWN0IHNpbXBs
ZWRybV9kZXZpY2UNCj4+IGFuZCBrZWVwIHRoZSBhbGxvY2F0ZWQgbWVtb3J5IGFsbG9jYXRl
ZCBhY3Jvc3MgZGlzcGxheSB1cGRhdGVzLiBBdm9pZA0KPj4gcG9zc2libHkgcmVhbGxvY2F0
aW5nIHRlbXBvcmFyeSBtZW1vcnkgb24gZWFjaCBkaXNwbGF5IHVwZGF0ZS4gSW5zdGVhZA0K
Pj4gcHJlYWxsb2NhdGUgdGVtcG9yYXJ5IG1lbW9yeSBkdXJpbmcgaW5pdGlhbGl6YXRpb24u
IFJlbGVhc2luZyB0aGUgRFJNDQo+PiBkZXZpY2UgYWxzbyByZWxlYXNlcyB0aGUgeGZybSBi
dWZmZXIuDQo+Pg0KPj4gdjI6DQo+PiDCoMKgwqDCoCogcmVzZXJ2ZSBzdG9yYWdlIGR1cmlu
ZyBwcm9iZQ0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emlt
bWVybWFubkBzdXNlLmRlPg0KPj4gLS0tDQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vdGlueS9z
aW1wbGVkcm0uYyB8IDEzICsrKysrKysrKystLS0NCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAx
MCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vdGlueS9zaW1wbGVkcm0uYyANCj4+IGIvZHJpdmVycy9ncHUvZHJt
L3Rpbnkvc2ltcGxlZHJtLmMNCj4+IGluZGV4IDhhY2ViN2QzNzhkZWEuLmEzZDhhOTU2YTRj
NGUgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdGlueS9zaW1wbGVkcm0uYw0K
Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3Rpbnkvc2ltcGxlZHJtLmMNCj4+IEBAIC0yMzIs
NiArMjMyLDcgQEAgc3RydWN0IHNpbXBsZWRybV9kZXZpY2Ugew0KPj4gwqDCoMKgwqDCoCBz
dHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSBtb2RlOw0KPj4gwqDCoMKgwqDCoCBjb25zdCBzdHJ1
Y3QgZHJtX2Zvcm1hdF9pbmZvICpmb3JtYXQ7DQo+PiDCoMKgwqDCoMKgIHVuc2lnbmVkIGlu
dCBwaXRjaDsNCj4+ICvCoMKgwqAgc3RydWN0IGRybV94ZnJtX2J1ZiB4ZnJtOw0KPj4gwqDC
oMKgwqDCoCAvKiBtZW1vcnkgbWFuYWdlbWVudCAqLw0KPj4gwqDCoMKgwqDCoCBzdHJ1Y3Qg
aW9zeXNfbWFwIHNjcmVlbl9iYXNlOw0KPj4gQEAgLTQ4Niw3ICs0ODcsNiBAQCBzdGF0aWMg
dm9pZCANCj4+IHNpbXBsZWRybV9wcmltYXJ5X3BsYW5lX2hlbHBlcl9hdG9taWNfdXBkYXRl
KHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lDQo+PiDCoMKgwqDCoMKgIHN0cnVjdCBkcm1fZnJh
bWVidWZmZXIgKmZiID0gcGxhbmVfc3RhdGUtPmZiOw0KPj4gwqDCoMKgwqDCoCBzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGV2ID0gcGxhbmUtPmRldjsNCj4+IMKgwqDCoMKgwqAgc3RydWN0IHNp
bXBsZWRybV9kZXZpY2UgKnNkZXYgPSBzaW1wbGVkcm1fZGV2aWNlX29mX2RldihkZXYpOw0K
Pj4gLcKgwqDCoCBzdHJ1Y3QgZHJtX3hmcm1fYnVmIHhmcm0gPSBEUk1fWEZSTV9CVUZfSU5J
VDsNCj4+IMKgwqDCoMKgwqAgc3RydWN0IGRybV9hdG9taWNfaGVscGVyX2RhbWFnZV9pdGVy
IGl0ZXI7DQo+PiDCoMKgwqDCoMKgIHN0cnVjdCBkcm1fcmVjdCBkYW1hZ2U7DQo+PiDCoMKg
wqDCoMKgIGludCByZXQsIGlkeDsNCj4+IEBAIC01MDgsMTMgKzUwOCwxMiBAQCBzdGF0aWMg
dm9pZCANCj4+IHNpbXBsZWRybV9wcmltYXJ5X3BsYW5lX2hlbHBlcl9hdG9taWNfdXBkYXRl
KHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5lDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgaW9zeXNf
bWFwX2luY3IoJmRzdCwgZHJtX2ZiX2NsaXBfb2Zmc2V0KHNkZXYtPnBpdGNoLCANCj4+IHNk
ZXYtPmZvcm1hdCwgJmRzdF9jbGlwKSk7DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZHJtX2Zi
X2JsaXQoJmRzdCwgJnNkZXYtPnBpdGNoLCBzZGV2LT5mb3JtYXQtPmZvcm1hdCwgDQo+PiBz
aGFkb3dfcGxhbmVfc3RhdGUtPmRhdGEsDQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGZiLCAmZGFtYWdlLCAmeGZybSk7DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGZiLCAmZGFtYWdlLCAmc2Rldi0+eGZybSk7DQo+PiDCoMKgwqDCoMKgIH0N
Cj4+IMKgwqDCoMKgwqAgZHJtX2Rldl9leGl0KGlkeCk7DQo+PiDCoCBvdXRfZHJtX2dlbV9m
Yl9lbmRfY3B1X2FjY2VzczoNCj4+IMKgwqDCoMKgwqAgZHJtX2dlbV9mYl9lbmRfY3B1X2Fj
Y2VzcyhmYiwgRE1BX0ZST01fREVWSUNFKTsNCj4+IC3CoMKgwqAgZHJtX3hmcm1fYnVmX3Jl
bGVhc2UoJnhmcm0pOw0KPj4gwqAgfQ0KPj4gwqAgc3RhdGljIHZvaWQgc2ltcGxlZHJtX3By
aW1hcnlfcGxhbmVfaGVscGVyX2F0b21pY19kaXNhYmxlKHN0cnVjdCANCj4+IGRybV9wbGFu
ZSAqcGxhbmUsDQo+PiBAQCAtNjM3LDYgKzYzNiw3IEBAIHN0YXRpYyBzdHJ1Y3Qgc2ltcGxl
ZHJtX2RldmljZSANCj4+ICpzaW1wbGVkcm1fZGV2aWNlX2NyZWF0ZShzdHJ1Y3QgZHJtX2Ry
aXZlciAqZHJ2LA0KPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVj
dG9yOw0KPj4gwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nIG1heF93aWR0aCwgbWF4X2hlaWdo
dDsNCj4+IMKgwqDCoMKgwqAgc2l6ZV90IG5mb3JtYXRzOw0KPj4gK8KgwqDCoCB2b2lkICpi
dWY7DQo+PiDCoMKgwqDCoMKgIGludCByZXQ7DQo+PiDCoMKgwqDCoMKgIHNkZXYgPSBkZXZt
X2RybV9kZXZfYWxsb2MoJnBkZXYtPmRldiwgZHJ2LCBzdHJ1Y3QgDQo+PiBzaW1wbGVkcm1f
ZGV2aWNlLCBkZXYpOw0KPj4gQEAgLTcxOCw2ICs3MTgsMTMgQEAgc3RhdGljIHN0cnVjdCBz
aW1wbGVkcm1fZGV2aWNlIA0KPj4gKnNpbXBsZWRybV9kZXZpY2VfY3JlYXRlKHN0cnVjdCBk
cm1fZHJpdmVyICpkcnYsDQo+PiDCoMKgwqDCoMKgIGRybV9kYmcoZGV2LCAiZnJhbWVidWZm
ZXIgZm9ybWF0PSVwNGNjLCBzaXplPSVkeCVkLCBzdHJpZGU9JWQgDQo+PiBieXRlXG4iLA0K
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgICZmb3JtYXQtPmZvcm1hdCwgd2lkdGgsIGhlaWdodCwg
c3RyaWRlKTsNCj4+ICvCoMKgwqAgcmV0ID0gZHJtbV94ZnJtX2J1Zl9pbml0KGRldiwgJnNk
ZXYtPnhmcm0pOw0KPj4gK8KgwqDCoCBpZiAocmV0KQ0KPj4gK8KgwqDCoMKgwqDCoMKgIHJl
dHVybiBFUlJfUFRSKHJldCk7DQo+PiArwqDCoMKgIGJ1ZiA9IGRybV94ZnJtX2J1Zl9yZXNl
cnZlKCZzZGV2LT54ZnJtLCBzZGV2LT5waXRjaCwgR0ZQX0tFUk5FTCk7DQo+PiArwqDCoMKg
IGlmICghYnVmKQ0KPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiBFUlJfUFRSKC1FTk9NRU0p
Ow0KPj4gKw0KPiANCj4gSSB0aGluayBpdCB3b3VsZCBiZSBuaWNlIHRvIGhhdmUgYSAiaW5p
dF9hbmRfcmVzZXJ2ZSgpIiBmdW5jdGlvbiwgdG8gDQo+IHNpbXBsaWZ5IHRoZSBjYWxsZXJz
ID8NCg0KSSB0aGluayBJIGNhbiBhZGQgdGhlIHJlc2VydmUgcGFyYW1ldGVycyBkaXJlY3Rs
eSB0byB0aGUgX2luaXQoKSANCmZ1bmN0aW9uLiBSZXNlcnZpbmcgJzAnIHdpbGwgdGhlbiBu
b3QgcmVzZXJ2ZSBtZW1vcnkuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+PiDC
oMKgwqDCoMKgIC8qDQo+PiDCoMKgwqDCoMKgwqAgKiBNZW1vcnkgbWFuYWdlbWVudA0KPj4g
wqDCoMKgwqDCoMKgICovDQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGlj
cyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdt
YkgNCkZyYW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJnLCBHZXJtYW55DQpHRjog
SXZvIFRvdGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGllbiBNb2Vy
bWFuDQpIUkIgMzY4MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------ozfyj1ahRH0KwLRx3v4uNiiB--

--------------zYFGsCFQOGFNZB1SCBRkTxqL
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmUVNj4FAwAAAAAACgkQlh/E3EQov+DR
uw/8C38A2am3kQttLIxiFe725Z4xh3ACsDv0rDSulbCd4LleN9M3MAaxAptBZx6xne4ireigPoiq
FOxoQre/EVxdVqIlm5KLjwPzyTffABPsJwUvQn8z+9S/2xNWrcj61QLqif/Sa7gOyx5qREMt3iRp
HzpqhT6TfeYetneJFzjHpUzYSV/ElYCi0sl/oUQC0kW0+q0FETmgxxN9EYtvt5G+AvEgHiS6VJPD
YpcgsgBRYgxtFKw54aHkrWQusylKtNPOi/rhGPIyZ7NamC3Bns5HAAzRzf++2hhE2BGIXimnn7Ha
IQdFw3z3RthTUh63m/gJ1JsX5lLatknYELj5wVRnyebcUEBZXYYxClpBxLNR7yb6lkIxKuBXwG9L
hR16DxFDfsu6xnT4Nsjri4VZ5tmPtycrN+GyMbIpg4dIcuDNoGd8oy/jWv4UpG9x4+1igwMLU9Sf
VyJAMMInze6jCxT6dhdhSnAZda4DD6mJMjLjCJt+KOBfDaM5h9q+D0emEA4bGO6OYOLE9M3Ns2F7
w5VEkZdtGbGayHQ0w59YWuGLAtJbtFGD47+7DMxKw1IyQjH8I9yMIfapG1a6n6W7vItJjRPY22Zf
iaI4FYIjOCnwiJFdqn2yg6y3qCmSDxgrZ8fF0XcMbHsR4L7G5zqbq0o6nKcr+wQzfN99EazWEXqZ
ELE=
=xpem
-----END PGP SIGNATURE-----

--------------zYFGsCFQOGFNZB1SCBRkTxqL--
