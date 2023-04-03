Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8059E6D3EB4
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 10:12:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BE2410E3DE;
	Mon,  3 Apr 2023 08:12:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DBCC10E3C3
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 08:12:50 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7BEF71F8B8;
 Mon,  3 Apr 2023 08:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680509568; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7ndR2HDwwsuscy2he5gDdgHnxTBzS7b4RvQgeWEBFGc=;
 b=R2GslC9nxZEH285xr334W1ElgOaCeWruEX0ybLnemypCxZwkKo4XvOAEQ1njI+ymFuPxeU
 rzZNR7WbiU+f2JNbjFbMW8YCx02mD9RBWJmzQBIex1hUQzwZeDdaFg9697lAV1BdoYpvU7
 YsKsVBNX/Z7+B5Tq8S1N8VB8WXaryvE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680509568;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7ndR2HDwwsuscy2he5gDdgHnxTBzS7b4RvQgeWEBFGc=;
 b=egrEFNkNEyWL+PvD4n8UgtJZbb3VkdvbrpjGDjJv5cFvgnVbiEh2tInOb234KBJ1ONzSea
 3Yt3Hrn9Gl5MwhCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5A1221331A;
 Mon,  3 Apr 2023 08:12:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WT8CFYCKKmT6OAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 03 Apr 2023 08:12:48 +0000
Message-ID: <73e94c26-0bba-ebe8-6b7f-553b9d9b0552@suse.de>
Date: Mon, 3 Apr 2023 10:12:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 4/6] drm/omapdrm: Remove fbdev from struct omap_drm_private
Content-Language: en-US
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, javierm@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch
References: <20230330083205.12621-1-tzimmermann@suse.de>
 <20230330083205.12621-5-tzimmermann@suse.de>
 <4198992b-b2b9-6cf6-4d04-88df43b68ea9@ideasonboard.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <4198992b-b2b9-6cf6-4d04-88df43b68ea9@ideasonboard.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------FJPj0mPlhBH29ia12uHjlGMD"
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
--------------FJPj0mPlhBH29ia12uHjlGMD
Content-Type: multipart/mixed; boundary="------------d8rMo6S9NzZ04qMtb99EDcma";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, javierm@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
Message-ID: <73e94c26-0bba-ebe8-6b7f-553b9d9b0552@suse.de>
Subject: Re: [PATCH 4/6] drm/omapdrm: Remove fbdev from struct
 omap_drm_private
References: <20230330083205.12621-1-tzimmermann@suse.de>
 <20230330083205.12621-5-tzimmermann@suse.de>
 <4198992b-b2b9-6cf6-4d04-88df43b68ea9@ideasonboard.com>
In-Reply-To: <4198992b-b2b9-6cf6-4d04-88df43b68ea9@ideasonboard.com>

--------------d8rMo6S9NzZ04qMtb99EDcma
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMzAuMDMuMjMgdW0gMTQ6MDggc2NocmllYiBUb21pIFZhbGtlaW5lbjoNCj4g
T24gMzAvMDMvMjAyMyAxMTozMiwgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6DQo+PiBUaGUg
RFJNIGRldmljZSBzdG9yZXMgYSBwb2ludGVyIHRvIHRoZSBmYmRldiBoZWxwZXIuIFJlbW92
ZSBzdHJ1Y3QNCj4+IG9tYXBfZHJtX3ByaXZhdGUuZmJkZXYsIHdoaWNoIGNvbnRhaW5zIHRo
ZSBzYW1lIHZhbHVlLiBObyBmdW5jdGlvbmFsDQo+PiBjaGFuZ2VzLg0KPj4NCj4+IFNpZ25l
ZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPj4g
LS0tDQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2RlYnVnZnMuYyB8IDYg
KysrLS0tDQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2Rydi5jwqDCoMKg
wqAgfCAxICsNCj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZHJ2LmjCoMKg
wqDCoCB8IDMgLS0tDQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2ZiZGV2
LmPCoMKgIHwgNyArKy0tLS0tDQo+PiDCoCA0IGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0aW9u
cygrKSwgMTEgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9vbWFwZHJtL29tYXBfZGVidWdmcy5jIA0KPj4gYi9kcml2ZXJzL2dwdS9kcm0vb21h
cGRybS9vbWFwX2RlYnVnZnMuYw0KPj4gaW5kZXggYmZiMmNjYjQwYmQxLi5hM2Q0NzA0Njhl
NWIgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2RlYnVn
ZnMuYw0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9kZWJ1Z2ZzLmMN
Cj4+IEBAIC00NywxNSArNDcsMTUgQEAgc3RhdGljIGludCBmYl9zaG93KHN0cnVjdCBzZXFf
ZmlsZSAqbSwgdm9pZCAqYXJnKQ0KPj4gwqAgew0KPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgZHJt
X2luZm9fbm9kZSAqbm9kZSA9IChzdHJ1Y3QgZHJtX2luZm9fbm9kZSAqKSBtLT5wcml2YXRl
Ow0KPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgZHJtX2RldmljZSAqZGV2ID0gbm9kZS0+bWlub3It
PmRldjsNCj4+IC3CoMKgwqAgc3RydWN0IG9tYXBfZHJtX3ByaXZhdGUgKnByaXYgPSBkZXYt
PmRldl9wcml2YXRlOw0KPj4gK8KgwqDCoCBzdHJ1Y3QgZHJtX2ZiX2hlbHBlciAqaGVscGVy
ID0gZGV2LT5mYl9oZWxwZXI7DQo+PiDCoMKgwqDCoMKgIHN0cnVjdCBkcm1fZnJhbWVidWZm
ZXIgKmZiOw0KPj4gwqDCoMKgwqDCoCBzZXFfcHJpbnRmKG0sICJmYmNvbiAiKTsNCj4+IC3C
oMKgwqAgb21hcF9mcmFtZWJ1ZmZlcl9kZXNjcmliZShwcml2LT5mYmRldi0+ZmIsIG0pOw0K
Pj4gK8KgwqDCoCBvbWFwX2ZyYW1lYnVmZmVyX2Rlc2NyaWJlKGhlbHBlci0+ZmIsIG0pOw0K
Pj4gwqDCoMKgwqDCoCBtdXRleF9sb2NrKCZkZXYtPm1vZGVfY29uZmlnLmZiX2xvY2spOw0K
Pj4gwqDCoMKgwqDCoCBsaXN0X2Zvcl9lYWNoX2VudHJ5KGZiLCAmZGV2LT5tb2RlX2NvbmZp
Zy5mYl9saXN0LCBoZWFkKSB7DQo+PiAtwqDCoMKgwqDCoMKgwqAgaWYgKGZiID09IHByaXYt
PmZiZGV2LT5mYikNCj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoZmIgPT0gaGVscGVyLT5mYikN
Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnRpbnVlOw0KPj4gwqDCoMKgwqDC
oMKgwqDCoMKgIHNlcV9wcmludGYobSwgInVzZXIgIik7DQo+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9kcnYuYyANCj4+IGIvZHJpdmVycy9ncHUvZHJt
L29tYXBkcm0vb21hcF9kcnYuYw0KPj4gaW5kZXggZmI0MDNiNDQ3NjljLi42YTJmNDQ2Yzk2
MGYgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2Rydi5j
DQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2Rydi5jDQo+PiBAQCAt
MjUsNiArMjUsNyBAQA0KPj4gwqAgI2luY2x1ZGUgIm9tYXBfZG1tX3RpbGVyLmgiDQo+PiDC
oCAjaW5jbHVkZSAib21hcF9kcnYuaCINCj4+ICsjaW5jbHVkZSAib21hcF9mYmRldi5oIg0K
Pj4gwqAgI2RlZmluZSBEUklWRVJfTkFNRcKgwqDCoMKgwqDCoMKgIE1PRFVMRV9OQU1FDQo+
PiDCoCAjZGVmaW5lIERSSVZFUl9ERVNDwqDCoMKgwqDCoMKgwqAgIk9NQVAgRFJNIg0KPj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZHJ2LmggDQo+PiBi
L2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZHJ2LmgNCj4+IGluZGV4IDgyNTk2MGZk
M2VhOS4uNGM3MjE3YjM1ZjZiIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL29t
YXBkcm0vb21hcF9kcnYuaA0KPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21h
cF9kcnYuaA0KPj4gQEAgLTIxLDcgKzIxLDYgQEANCj4+IMKgICNpbmNsdWRlICJvbWFwX2Ny
dGMuaCINCj4+IMKgICNpbmNsdWRlICJvbWFwX2VuY29kZXIuaCINCj4+IMKgICNpbmNsdWRl
ICJvbWFwX2ZiLmgiDQo+PiAtI2luY2x1ZGUgIm9tYXBfZmJkZXYuaCINCj4+IMKgICNpbmNs
dWRlICJvbWFwX2dlbS5oIg0KPj4gwqAgI2luY2x1ZGUgIm9tYXBfaXJxLmgiDQo+PiDCoCAj
aW5jbHVkZSAib21hcF9wbGFuZS5oIg0KPj4gQEAgLTc3LDggKzc2LDYgQEAgc3RydWN0IG9t
YXBfZHJtX3ByaXZhdGUgew0KPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgZHJtX3ByaXZhdGVfb2Jq
IGdsb2Jfb2JqOw0KPj4gLcKgwqDCoCBzdHJ1Y3QgZHJtX2ZiX2hlbHBlciAqZmJkZXY7DQo+
PiAtDQo+PiDCoMKgwqDCoMKgIHN0cnVjdCB3b3JrcXVldWVfc3RydWN0ICp3cTsNCj4+IMKg
wqDCoMKgwqAgLyogbG9jayBmb3Igb2JqX2xpc3QgYmVsb3cgKi8NCj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2ZiZGV2LmMgDQo+PiBiL2RyaXZlcnMv
Z3B1L2RybS9vbWFwZHJtL29tYXBfZmJkZXYuYw0KPj4gaW5kZXggZDA0YTIwZjk1ZTNkLi43
OWU0MTdiMzkxYmYgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9v
bWFwX2ZiZGV2LmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZmJk
ZXYuYw0KPj4gQEAgLTI1MCw4ICsyNTAsNiBAQCB2b2lkIG9tYXBfZmJkZXZfaW5pdChzdHJ1
Y3QgZHJtX2RldmljZSAqZGV2KQ0KPj4gwqDCoMKgwqDCoCBpZiAocmV0KQ0KPj4gwqDCoMKg
wqDCoMKgwqDCoMKgIGdvdG8gZmluaTsNCj4+IC3CoMKgwqAgcHJpdi0+ZmJkZXYgPSBoZWxw
ZXI7DQo+PiAtDQo+PiDCoMKgwqDCoMKgIHJldHVybjsNCj4+IMKgIGZpbmk6DQo+PiBAQCAt
MjY1LDggKzI2Myw3IEBAIHZvaWQgb21hcF9mYmRldl9pbml0KHN0cnVjdCBkcm1fZGV2aWNl
ICpkZXYpDQo+PiDCoCB2b2lkIG9tYXBfZmJkZXZfZmluaShzdHJ1Y3QgZHJtX2RldmljZSAq
ZGV2KQ0KPj4gwqAgew0KPj4gLcKgwqDCoCBzdHJ1Y3Qgb21hcF9kcm1fcHJpdmF0ZSAqcHJp
diA9IGRldi0+ZGV2X3ByaXZhdGU7DQo+PiAtwqDCoMKgIHN0cnVjdCBkcm1fZmJfaGVscGVy
ICpoZWxwZXIgPSBwcml2LT5mYmRldjsNCj4+ICvCoMKgwqAgc3RydWN0IGRybV9mYl9oZWxw
ZXIgKmhlbHBlciA9IGRldi0+ZmJfaGVscGVyOw0KPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgZHJt
X2ZyYW1lYnVmZmVyICpmYjsNCj4+IMKgwqDCoMKgwqAgc3RydWN0IGRybV9nZW1fb2JqZWN0
ICpibzsNCj4+IMKgwqDCoMKgwqAgc3RydWN0IG9tYXBfZmJkZXYgKmZiZGV2Ow0KPj4gQEAg
LTI5Nyw1ICsyOTQsNSBAQCB2b2lkIG9tYXBfZmJkZXZfZmluaShzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZGV2KQ0KPj4gwqDCoMKgwqDCoCBkcm1fZmJfaGVscGVyX3VucHJlcGFyZShoZWxwZXIp
Ow0KPj4gwqDCoMKgwqDCoCBrZnJlZShmYmRldik7DQo+PiAtwqDCoMKgIHByaXYtPmZiZGV2
ID0gTlVMTDsNCj4+ICvCoMKgwqAgZGV2LT5mYl9oZWxwZXIgPSBOVUxMOw0KPiANCj4gSXMg
dGhpcyBsaW5lIG5lZWRlZCBhbnltb3JlPyBBcyB5b3UgZHJvcHBlZCB0aGUgcHJpdi0+ZmJk
ZXYgYXNzaWdubWVudCANCj4gaW4gb21hcF9mYmRldl9pbml0KCksIGl0IHdvdWxkIGxvb2sg
c3ltbWV0cmljYWwgdG8gYWxzbyBkcm9wIHRoaXMgb25lLiANCj4gSSdtIHN1cmUgaXQgZG9l
c24ndCBodXJ0LCBqdXN0IHdvbmRlcmluZyBpZiB0aGlzIGlzIHNvbWV0aGluZyBkcml2ZXJz
IA0KPiBhcmUgc3VwcG9zZWQgdG8gZG8sIG9yIGlzIHRoaXMganVzdCBhbiBleHRyYSBsaW5l
IGluIHRoZSBkcml2ZXIuDQoNCkkgdGhpbmsgSSBjYW4gcmVtb3ZlIGl0IGhlcmUuIEkganVz
dCBkaWRuJ3Qgd2FudCB0byBjaGFuZ2UgdG9vIG11Y2guDQoNCkJlc3QgcmVnYXJkcw0KVGhv
bWFzDQoNCj4gDQo+IEluIGVpdGhlciBjYXNlOg0KPiANCj4gUmV2aWV3ZWQtYnk6IFRvbWkg
VmFsa2VpbmVuIDx0b21pLnZhbGtlaW5lbkBpZGVhc29uYm9hcmQuY29tPg0KPiANCj4gIMKg
VG9taQ0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERl
dmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxk
c3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJu
YmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------d8rMo6S9NzZ04qMtb99EDcma--

--------------FJPj0mPlhBH29ia12uHjlGMD
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQqin8FAwAAAAAACgkQlh/E3EQov+DJ
NA//RZO7vCzekfZHLpT1YExB0YOpxdMg4L3XL1EqFmw+PSglZdYBrL2g2d9OiYumx6s1lbQruW/9
3S/PY0RtaP5bhQ0vlQbp8cz1LI92mZqGqhq3tRzzfivhkAD8mHpikeZSBMXJV8m8bDYFVFN3nkvi
2vg0XgVdB6tgrcGrcg/6R0XsIfSaUO27kPNfUY+ld+fBUrwvp3IzIHNfTsAvjgE1PZYTGaUb18nY
PJ2QYuuJilOIe3nxu7xxyMQdYUH2Sr1SgPiyGtnbEakpJ8p1nPQEY64FDR/xFp/nyULg1V7eDe1N
NGBTSByVhXQuF/ktmQDf1aSQaliW9CleRtuiXmGe+1hoBE4wnbNA1p+FLg76vJwiBHnE8cV0jQWh
p63BzrJvs9NF1Wn6ciNTkpSxycmvMqMWt9s5FyV/5p6pmrpf1zuS9LBcnZwJZuCKQhDQ6FTeU56d
KQ4Bs1Yj0625zVwZPJYvCWGVTedKGTzF0ObVDDtvJ8FiRdJNqQaMUFr9pnXKqewwF6hHqBrXKzUo
tBsLuPb+FORnztLaZVzzRqjvZ5xwbB0Er5c7wp3hm7MDwT7dkPYTk9wCcQvr+60wvmt1OnzEVcF1
fYYBUEkjYsBfSuapeb8+3CNfPfAdtP8vrOorUIdsiq2kl5X8Aj+VtP/dIL7Gk8uZ7E5jGWNQbVOW
Ksk=
=AamX
-----END PGP SIGNATURE-----

--------------FJPj0mPlhBH29ia12uHjlGMD--
