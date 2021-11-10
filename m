Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1246944BDB3
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 10:17:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07ADC6E059;
	Wed, 10 Nov 2021 09:17:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D3546E059
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 09:17:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AACAF1FD6C;
 Wed, 10 Nov 2021 09:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1636535869; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vHgwnawnaXHvVDzvfYuFjE4SYcBeNZqQWbWTBdKzjtQ=;
 b=QSy4HYDCtV7fihmFS+6fmJPOR8SBT9xd5UsZdW03UNu9ybKmhq+YFyyWj1nS0LKOrHZ9gs
 fuLjgjDoWsQMjuUAvKZ5pTyTE9GOt1Jpibg6m/MobYxPPkEDtCnwNSZdxqMkk9rDoEgLs4
 kLVAyYCQ0Yhm9vkpRgA6hXyr929QWTs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1636535869;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vHgwnawnaXHvVDzvfYuFjE4SYcBeNZqQWbWTBdKzjtQ=;
 b=dapCQzmMhDRXsjFGj6GsValZemj6sVzOiUMznp6N7IE5TaxK6sFa/y3Xlhj7VIBxLaBxSe
 oo+JPGX3+/fsoLDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 38F5313B16;
 Wed, 10 Nov 2021 09:17:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id JR86DD2Oi2GBEwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 10 Nov 2021 09:17:49 +0000
Message-ID: <00605fd2-3ce5-39c9-e2a4-b25f9cf6dd84@suse.de>
Date: Wed, 10 Nov 2021 10:17:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v2 3/9] drm/format-helper: Add destination-buffer pitch to
 drm_fb_swab()
Content-Language: en-US
To: Amanoel Dawod <kernel@amanoeldawod.com>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 noralf@tronnes.org, drawat.floss@gmail.com, airlied@redhat.com,
 kraxel@redhat.com, david@lechnology.com, sam@ravnborg.org,
 javierm@redhat.com, dirty.ice.hu@gmail.com, michael+lkml@stapelberg.ch,
 aros@gmx.com, joshua@stroblindustries.com, arnd@arndb.de
References: <20211101141532.26655-1-tzimmermann@suse.de>
 <20211101141532.26655-4-tzimmermann@suse.de>
 <944752ef-ad6a-4e42-8754-54a58c7f50ef@www.fastmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <944752ef-ad6a-4e42-8754-54a58c7f50ef@www.fastmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------5HuTJDhDR8HfV4QYWWDBnmKm"
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
Cc: linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------5HuTJDhDR8HfV4QYWWDBnmKm
Content-Type: multipart/mixed; boundary="------------qvsDogr3rkIlNCe50F07NKE6";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Amanoel Dawod <kernel@amanoeldawod.com>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 noralf@tronnes.org, drawat.floss@gmail.com, airlied@redhat.com,
 kraxel@redhat.com, david@lechnology.com, sam@ravnborg.org,
 javierm@redhat.com, dirty.ice.hu@gmail.com, michael+lkml@stapelberg.ch,
 aros@gmx.com, joshua@stroblindustries.com, arnd@arndb.de
Cc: dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 virtualization@lists.linux-foundation.org
Message-ID: <00605fd2-3ce5-39c9-e2a4-b25f9cf6dd84@suse.de>
Subject: Re: [PATCH v2 3/9] drm/format-helper: Add destination-buffer pitch to
 drm_fb_swab()
References: <20211101141532.26655-1-tzimmermann@suse.de>
 <20211101141532.26655-4-tzimmermann@suse.de>
 <944752ef-ad6a-4e42-8754-54a58c7f50ef@www.fastmail.com>
In-Reply-To: <944752ef-ad6a-4e42-8754-54a58c7f50ef@www.fastmail.com>

--------------qvsDogr3rkIlNCe50F07NKE6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDA4LjExLjIxIHVtIDE5OjU3IHNjaHJpZWIgQW1hbm9lbCBEYXdvZDoNCj4gSGks
DQo+IA0KPiBPbiBNb24sIE5vdiAxLCAyMDIxLCBhdCAxMDoxNSBBTSwgVGhvbWFzIFppbW1l
cm1hbm4gd3JvdGU6DQo+PiBBZGQgZGVzdGluYXRpb24tYnVmZmVyIHBpdGNoIGFzIGFyZ3Vt
ZW50IHRvIGRybV9mYl9zd2FiKCkuIERvbmUgZm9yDQo+PiBjb25zaXN0ZW5jeSB3aXRoIHRo
ZSByZXN0IG9mIHRoZSBpbnRlcmZhY2UuDQo+Pg0KPj4gdjI6DQo+PiAJKiB1cGRhdGUgZG9j
dW1lbnRhdGlvbiAoTm9yYWxmKQ0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1t
ZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPj4gVGVzdGVkLWJ5OiBOb3JhbGYgVHLD
uG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4NCj4+IFJldmlld2VkLWJ5OiBOb3JhbGYgVHLD
uG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4NCj4+IC0tLQ0KPj4gICBkcml2ZXJzL2dwdS9k
cm0vZHJtX2Zvcm1hdF9oZWxwZXIuYyB8IDIxICsrKysrKysrKysrKysrKystLS0tLQ0KPj4g
ICBkcml2ZXJzL2dwdS9kcm0vZHJtX21pcGlfZGJpLmMgICAgICB8ICAyICstDQo+PiAgIGRy
aXZlcnMvZ3B1L2RybS9ndWQvZ3VkX3BpcGUuYyAgICAgIHwgIDIgKy0NCj4+ICAgaW5jbHVk
ZS9kcm0vZHJtX2Zvcm1hdF9oZWxwZXIuaCAgICAgfCAgNSArKystLQ0KPj4gICA0IGZpbGVz
IGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZm9ybWF0X2hlbHBlci5jDQo+PiBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZm9ybWF0X2hlbHBlci5jDQo+PiBpbmRleCBmYWMzN2M2OTdk
OGIuLmRhYzM1NTMyMDI4NyAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
Zm9ybWF0X2hlbHBlci5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Zvcm1hdF9o
ZWxwZXIuYw0KPj4gQEAgLTEwMSw2ICsxMDEsNyBAQCBFWFBPUlRfU1lNQk9MKGRybV9mYl9t
ZW1jcHlfdG9pbyk7DQo+PiAgIC8qKg0KPj4gICAgKiBkcm1fZmJfc3dhYiAtIFN3YXAgYnl0
ZXMgaW50byBjbGlwIGJ1ZmZlcg0KPj4gICAgKiBAZHN0OiBEZXN0aW5hdGlvbiBidWZmZXIN
Cj4+ICsgKiBAZHN0X3BpdGNoOiBOdW1iZXIgb2YgYnl0ZXMgYmV0d2VlbiB0d28gY29uc2Vj
dXRpdmUgc2NhbmxpbmVzDQo+PiB3aXRoaW4gZHN0DQo+PiAgICAqIEBzcmM6IFNvdXJjZSBi
dWZmZXINCj4+ICAgICogQGZiOiBEUk0gZnJhbWVidWZmZXINCj4+ICAgICogQGNsaXA6IENs
aXAgcmVjdGFuZ2xlIGFyZWEgdG8gY29weQ0KPj4gQEAgLTExMCwyMSArMTExLDI3IEBAIEVY
UE9SVF9TWU1CT0woZHJtX2ZiX21lbWNweV90b2lvKTsNCj4+ICAgICogdGltZSB0byBzcGVl
ZCB1cCBzbG93IHVuY2FjaGVkIHJlYWRzLg0KPj4gICAgKg0KPj4gICAgKiBUaGlzIGZ1bmN0
aW9uIGRvZXMgbm90IGFwcGx5IGNsaXBwaW5nIG9uIGRzdCwgaS5lLiB0aGUgZGVzdGluYXRp
b24NCj4+IC0gKiBpcyBhIHNtYWxsIGJ1ZmZlciBjb250YWluaW5nIHRoZSBjbGlwIHJlY3Qg
b25seS4NCj4+ICsgKiBpcyBhdCB0aGUgdG9wLWxlZnQgY29ybmVyLg0KPj4gICAgKi8NCj4+
IC12b2lkIGRybV9mYl9zd2FiKHZvaWQgKmRzdCwgdm9pZCAqc3JjLCBzdHJ1Y3QgZHJtX2Zy
YW1lYnVmZmVyICpmYiwNCj4+IC0JCSBzdHJ1Y3QgZHJtX3JlY3QgKmNsaXAsIGJvb2wgY2Fj
aGVkKQ0KPj4gK3ZvaWQgZHJtX2ZiX3N3YWIodm9pZCAqZHN0LCB1bnNpZ25lZCBpbnQgZHN0
X3BpdGNoLCBjb25zdCB2b2lkICpzcmMsDQo+PiArCQkgY29uc3Qgc3RydWN0IGRybV9mcmFt
ZWJ1ZmZlciAqZmIsIGNvbnN0IHN0cnVjdCBkcm1fcmVjdCAqY2xpcCwNCj4+ICsJCSBib29s
IGNhY2hlZCkNCj4+ICAgew0KPj4gICAJdTggY3BwID0gZmItPmZvcm1hdC0+Y3BwWzBdOw0K
Pj4gICAJc2l6ZV90IGxlbiA9IGRybV9yZWN0X3dpZHRoKGNsaXApICogY3BwOw0KPj4gLQl1
MTYgKnNyYzE2LCAqZHN0MTYgPSBkc3Q7DQo+PiAtCXUzMiAqc3JjMzIsICpkc3QzMiA9IGRz
dDsNCj4+ICsJY29uc3QgdTE2ICpzcmMxNjsNCj4+ICsJY29uc3QgdTMyICpzcmMzMjsNCj4+
ICsJdTE2ICpkc3QxNjsNCj4+ICsJdTMyICpkc3QzMjsNCj4+ICAgCXVuc2lnbmVkIGludCB4
LCB5Ow0KPj4gICAJdm9pZCAqYnVmID0gTlVMTDsNCj4+DQo+PiAgIAlpZiAoV0FSTl9PTl9P
TkNFKGNwcCAhPSAyICYmIGNwcCAhPSA0KSkNCj4+ICAgCQlyZXR1cm47DQo+Pg0KPj4gKwlp
ZiAoIWRzdF9waXRjaCkNCj4+ICsJCWRzdF9waXRjaCA9IGxlbjsNCj4+ICsNCj4+ICAgCWlm
ICghY2FjaGVkKQ0KPj4gICAJCWJ1ZiA9IGttYWxsb2MobGVuLCBHRlBfS0VSTkVMKTsNCj4+
DQo+PiBAQCAtMTQwLDYgKzE0Nyw5IEBAIHZvaWQgZHJtX2ZiX3N3YWIodm9pZCAqZHN0LCB2
b2lkICpzcmMsIHN0cnVjdA0KPj4gZHJtX2ZyYW1lYnVmZmVyICpmYiwNCj4+ICAgCQkJc3Jj
MzIgPSBzcmM7DQo+PiAgIAkJfQ0KPj4NCj4+ICsJCWRzdDE2ID0gZHN0Ow0KPj4gKwkJZHN0
MzIgPSBkc3Q7DQo+PiArDQo+PiAgIAkJZm9yICh4ID0gY2xpcC0+eDE7IHggPCBjbGlwLT54
MjsgeCsrKSB7DQo+PiAgIAkJCWlmIChjcHAgPT0gNCkNCj4+ICAgCQkJCSpkc3QzMisrID0g
c3dhYjMyKCpzcmMzMisrKTsNCj4+IEBAIC0xNDgsNiArMTU4LDcgQEAgdm9pZCBkcm1fZmJf
c3dhYih2b2lkICpkc3QsIHZvaWQgKnNyYywgc3RydWN0DQo+PiBkcm1fZnJhbWVidWZmZXIg
KmZiLA0KPj4gICAJCX0NCj4+DQo+PiAgIAkJc3JjICs9IGZiLT5waXRjaGVzWzBdOw0KPj4g
KwkJZHN0ICs9IGRzdF9waXRjaDsNCj4+ICAgCX0NCj4+DQo+PiAgIAlrZnJlZShidWYpOw0K
Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fbWlwaV9kYmkuYw0KPj4gYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX21pcGlfZGJpLmMNCj4+IGluZGV4IGMwOWRmOGIwNmM3YS4u
N2NlODk5MTdkNzYxIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9taXBp
X2RiaS5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX21pcGlfZGJpLmMNCj4+IEBA
IC0yMTEsNyArMjExLDcgQEAgaW50IG1pcGlfZGJpX2J1Zl9jb3B5KHZvaWQgKmRzdCwgc3Ry
dWN0DQo+PiBkcm1fZnJhbWVidWZmZXIgKmZiLA0KPj4gICAJc3dpdGNoIChmYi0+Zm9ybWF0
LT5mb3JtYXQpIHsNCj4+ICAgCWNhc2UgRFJNX0ZPUk1BVF9SR0I1NjU6DQo+PiAgIAkJaWYg
KHN3YXApDQo+PiAtCQkJZHJtX2ZiX3N3YWIoZHN0LCBzcmMsIGZiLCBjbGlwLCAhZ2VtLT5p
bXBvcnRfYXR0YWNoKTsNCj4+ICsJCQlkcm1fZmJfc3dhYihkc3QsIDAsIHNyYywgZmIsIGNs
aXAsICFnZW0tPmltcG9ydF9hdHRhY2gpOw0KPj4gICAJCWVsc2UNCj4+ICAgCQkJZHJtX2Zi
X21lbWNweShkc3QsIDAsIHNyYywgZmIsIGNsaXApOw0KPj4gICAJCWJyZWFrOw0KPj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ndWQvZ3VkX3BpcGUuYw0KPj4gYi9kcml2ZXJz
L2dwdS9kcm0vZ3VkL2d1ZF9waXBlLmMNCj4+IGluZGV4IGE5MjExMmZmZDM3YS4uZTBiMTE3
YjI1NTlmIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2d1ZC9ndWRfcGlwZS5j
DQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZ3VkL2d1ZF9waXBlLmMNCj4+IEBAIC0yMDEs
NyArMjAxLDcgQEAgc3RhdGljIGludCBndWRfcHJlcF9mbHVzaChzdHJ1Y3QgZ3VkX2Rldmlj
ZSAqZ2RybSwNCj4+IHN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiLA0KPj4gICAJCQlsZW4g
PSBndWRfeHJnYjg4ODhfdG9fY29sb3IoYnVmLCBmb3JtYXQsIHZhZGRyLCBmYiwgcmVjdCk7
DQo+PiAgIAkJfQ0KPj4gICAJfSBlbHNlIGlmIChndWRfaXNfYmlnX2VuZGlhbigpICYmIGZv
cm1hdC0+Y3BwWzBdID4gMSkgew0KPj4gLQkJZHJtX2ZiX3N3YWIoYnVmLCB2YWRkciwgZmIs
IHJlY3QsICFpbXBvcnRfYXR0YWNoKTsNCj4+ICsJCWRybV9mYl9zd2FiKGJ1ZiwgMCwgdmFk
ZHIsIGZiLCByZWN0LCAhaW1wb3J0X2F0dGFjaCk7DQo+PiAgIAl9IGVsc2UgaWYgKGNvbXBy
ZXNzaW9uICYmICFpbXBvcnRfYXR0YWNoICYmIHBpdGNoID09IGZiLT5waXRjaGVzWzBdKSB7
DQo+PiAgIAkJLyogY2FuIGNvbXByZXNzIGRpcmVjdGx5IGZyb20gdGhlIGZyYW1lYnVmZmVy
ICovDQo+PiAgIAkJYnVmID0gdmFkZHIgKyByZWN0LT55MSAqIHBpdGNoOw0KPj4gZGlmZiAt
LWdpdCBhL2luY2x1ZGUvZHJtL2RybV9mb3JtYXRfaGVscGVyLmgNCj4+IGIvaW5jbHVkZS9k
cm0vZHJtX2Zvcm1hdF9oZWxwZXIuaA0KPj4gaW5kZXggMWZjM2JhN2I2MDYwLi5kZGNiYTVh
YmUzMDYgMTAwNjQ0DQo+PiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fZm9ybWF0X2hlbHBlci5o
DQo+PiArKysgYi9pbmNsdWRlL2RybS9kcm1fZm9ybWF0X2hlbHBlci5oDQo+PiBAQCAtMTcs
OCArMTcsOSBAQCB2b2lkIGRybV9mYl9tZW1jcHkodm9pZCAqZHN0LCB1bnNpZ25lZCBpbnQg
ZHN0X3BpdGNoLA0KPj4gY29uc3Qgdm9pZCAqdmFkZHIsDQo+PiAgIAkJICAgY29uc3Qgc3Ry
dWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIsIGNvbnN0IHN0cnVjdCBkcm1fcmVjdCAqY2xpcCk7
DQo+PiAgIHZvaWQgZHJtX2ZiX21lbWNweV90b2lvKHZvaWQgX19pb21lbSAqZHN0LCB1bnNp
Z25lZCBpbnQgZHN0X3BpdGNoLA0KPj4gY29uc3Qgdm9pZCAqdmFkZHIsDQo+PiAgIAkJCWNv
bnN0IHN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiLCBjb25zdCBzdHJ1Y3QgZHJtX3JlY3Qg
KmNsaXApOw0KPj4gLXZvaWQgZHJtX2ZiX3N3YWIodm9pZCAqZHN0LCB2b2lkICpzcmMsIHN0
cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiLA0KPj4gLQkJIHN0cnVjdCBkcm1fcmVjdCAqY2xp
cCwgYm9vbCBjYWNoZWQpOw0KPj4gK3ZvaWQgZHJtX2ZiX3N3YWIodm9pZCAqZHN0LCB1bnNp
Z25lZCBpbnQgZHN0X3BpdGNoLCBjb25zdCB2b2lkICpzcmMsDQo+PiArCQkgY29uc3Qgc3Ry
dWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIsIGNvbnN0IHN0cnVjdCBkcm1fcmVjdCAqY2xpcCwN
Cj4+ICsJCSBib29sIGNhY2hlZCk7DQo+PiAgIHZvaWQgZHJtX2ZiX3hyZ2I4ODg4X3RvX3Jn
YjMzMih2b2lkICpkc3QsIHZvaWQgKnZhZGRyLCBzdHJ1Y3QNCj4+IGRybV9mcmFtZWJ1ZmZl
ciAqZmIsDQo+PiAgIAkJCSAgICAgICBzdHJ1Y3QgZHJtX3JlY3QgKmNsaXApOw0KPj4gICB2
b2lkIGRybV9mYl94cmdiODg4OF90b19yZ2I1NjUodm9pZCAqZHN0LCB2b2lkICp2YWRkciwN
Cj4+IC0tIA0KPj4gMi4zMy4xDQo+IA0KPiBBcHBseWluZyB0aGlzIGZhaWxzIGZvciBtZSAo
dGVzdGVkIGFnYWluc3QgNS4xNCBhbmQgNS4xNSB0cmVlcykuDQo+IEV4YW1wbGU6DQo+IHBh
dGNoaW5nIGZpbGUgaW5jbHVkZS9kcm0vZHJtX2Zvcm1hdF9oZWxwZXIuaA0KPiBIdW5rICMx
IEZBSUxFRCBhdCAxNy4NCg0KVGhhbmtzIGZvciB0ZXN0aW5nLiBUaGUgcGF0Y2hlcyBhcmUg
d3JpdHRlbiBhZ2FpbnN0IGEgcmVjZW50IGRybS10aXAgdHJlZS4NCg0KQmVzdCByZWdhcmQN
ClRob21hcw0KDQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2
ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1h
eGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcg
TsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------qvsDogr3rkIlNCe50F07NKE6--

--------------5HuTJDhDR8HfV4QYWWDBnmKm
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmGLjjwFAwAAAAAACgkQlh/E3EQov+C4
UQ/+O3sR976EdOBUtbngl6cVzfb1NcKYhXsPQHUMojuzp5wXvQPDyWSP4YRVzlB6uei6g/icQRBG
VCaGD4brivLHhbJ38zieDP/6eniCngDIlcmhcuYRSoZI26xkcHXmOjC0w7XapaoeBqx0Mhhscbzu
eUTYdO6l3arDo1rUx/8AYUX82Gh7mLkx0xKvI2Z5kDDVVRj37WgWLCfjzjsLtQ/P7o+UEcoyQHlz
lq7GgC3Bt3B3zhOxE+zLJsk2POZNBsLw4DBBYZoBTlmI2nQpMWIXYYnL3N4tbYsvCNR1ygnALjSS
Wfe2Tje8vSvzNox804PYKBEAkSsFfix5JzhFlXv+7eiLqYnwe/KDnWOingxD7cFZdAhgHKRcGcll
vGUC5lnVQiG5gkbUcrmC4OkYQvnbWL5V0CaZm0yW7QAiFde57ANpXh3sywXj05NnrC7kby9ziPMn
b4VTQqJjhDdlQO7cYAmRgvCmsVgXz6O0jWsg8O2T3I3//Yk/6QkKpfRQLoloEyY2N2M5/YgtNEpw
xunYvObZs62QabYgPYqLznQ5YcFnGp3v1NMq4WAwx2JME4MoqSg4lHAEBu0PUHDOIpfJsSt+TL9B
EStlhV7JFogrJVKkuIGcaWyrDVOVyxM+MS5WOvuDYs61InyR/cmsJEQrfK6OHIGyIpn+zjqMfvsn
0K4=
=jTQe
-----END PGP SIGNATURE-----

--------------5HuTJDhDR8HfV4QYWWDBnmKm--
