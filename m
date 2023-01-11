Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5507766600B
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 17:10:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D288E10E787;
	Wed, 11 Jan 2023 16:09:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F29610E776;
 Wed, 11 Jan 2023 16:09:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E10DD4DA8;
 Wed, 11 Jan 2023 16:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1673453394; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=phAUobLIYge+u/z3xxmO+c6c42P0FZDS1hguN6HMNjs=;
 b=JC7/H+yOSKJ8RKs1JdIgPuJAxq1H6cpLP35x+WpRdBZJbI74rBSDdMqpP46WPV77PIzFql
 552aBOjh8p/+1y8JnTmVXhGKNUiNUB/FJ/R4fh32QHw7VMlDArmzrqsujEVB5DooKAxGIS
 qG0l2kVeENHpdO5sWyJ10oYuFuoHarM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1673453394;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=phAUobLIYge+u/z3xxmO+c6c42P0FZDS1hguN6HMNjs=;
 b=qefmOtV+W6wzwn3ng1DF6WAUGjNLTjt3WdJZObqbYN65mtF0WdofEgxIUPckkWjjut5nuX
 AMjhVRSlcdvl0qBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ADD9E1358A;
 Wed, 11 Jan 2023 16:09:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ESoRKVLfvmMFSgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 11 Jan 2023 16:09:54 +0000
Message-ID: <2cf4eeef-2b38-ef4c-f807-4e32378fed13@suse.de>
Date: Wed, 11 Jan 2023 17:09:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 10/11] video/aperture: Drop primary argument
Content-Language: en-US
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20230111154112.90575-1-daniel.vetter@ffwll.ch>
 <20230111154112.90575-10-daniel.vetter@ffwll.ch>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230111154112.90575-10-daniel.vetter@ffwll.ch>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------hcfzcs0YkgpIQ0oEE1P0fjoR"
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
Cc: linux-fbdev@vger.kernel.org,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>, Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------hcfzcs0YkgpIQ0oEE1P0fjoR
Content-Type: multipart/mixed; boundary="------------7nACAzIgxY7MRUFPdKTYGYVc";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Daniel Vetter
 <daniel.vetter@intel.com>, Javier Martinez Canillas <javierm@redhat.com>,
 Helge Deller <deller@gmx.de>, linux-fbdev@vger.kernel.org
Message-ID: <2cf4eeef-2b38-ef4c-f807-4e32378fed13@suse.de>
Subject: Re: [PATCH 10/11] video/aperture: Drop primary argument
References: <20230111154112.90575-1-daniel.vetter@ffwll.ch>
 <20230111154112.90575-10-daniel.vetter@ffwll.ch>
In-Reply-To: <20230111154112.90575-10-daniel.vetter@ffwll.ch>

--------------7nACAzIgxY7MRUFPdKTYGYVc
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTEuMDEuMjMgdW0gMTY6NDEgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBX
aXRoIHRoZSBwcmVjZWVkaW5nIHBhdGNoZXMgaXQncyBiZWNvbWUgZGVmdW5jdC4gQWxzbyBJ
J20gYWJvdXQgdG8gYWRkDQo+IGEgZGlmZmVyZW50IGJvb2xlYW4gYXJndW1lbnQsIHNvIGl0
J3MgYmV0dGVyIHRvIGtlZXAgdGhlIGNvbmZ1c2lvbg0KPiBkb3duIHRvIHRoZSBhYnNvbHV0
ZSBtaW5pbXVtLg0KDQpPSywgbWF5YmUgbXkgZWFybGllciBjb21tZW50cyBhYm91dCB0aGUg
dXNlIG9mICdwcmltYXJ5JyBpbiBzb21lIA0KZnVuY3Rpb24gY2FsbHMgd2VyZSBub3QgY29y
cmVjdC4gSWdub3JlIHRoZW0gdGhlbi4NCg0KPiANCj4gU2lnbmVkLW9mZi1ieTogRGFuaWVs
IFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+DQo+IENjOiBUaG9tYXMgWmltbWVy
bWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4gQ2M6IEphdmllciBNYXJ0aW5leiBDYW5p
bGxhcyA8amF2aWVybUByZWRoYXQuY29tPg0KPiBDYzogSGVsZ2UgRGVsbGVyIDxkZWxsZXJA
Z214LmRlPg0KPiBDYzogbGludXgtZmJkZXZAdmdlci5rZXJuZWwub3JnDQo+IC0tLQ0KPiAg
IGRyaXZlcnMvZ3B1L2RybS9kcm1fYXBlcnR1cmUuYyB8IDIgKy0NCj4gICBkcml2ZXJzL3Zp
ZGVvL2FwZXJ0dXJlLmMgICAgICAgfCA3ICsrKy0tLS0NCj4gICBpbmNsdWRlL2xpbnV4L2Fw
ZXJ0dXJlLmggICAgICAgfCA5ICsrKystLS0tLQ0KPiAgIDMgZmlsZXMgY2hhbmdlZCwgOCBp
bnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vZHJtX2FwZXJ0dXJlLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2FwZXJ0
dXJlLmMNCj4gaW5kZXggNjk3Y2ZmYmZkNjAzLi41NzI5ZjNiYjQzOTggMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXBlcnR1cmUuYw0KPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vZHJtX2FwZXJ0dXJlLmMNCj4gQEAgLTE2OCw3ICsxNjgsNyBAQCBFWFBPUlRfU1lN
Qk9MKGRldm1fYXBlcnR1cmVfYWNxdWlyZV9mcm9tX2Zpcm13YXJlKTsNCj4gICBpbnQgZHJt
X2FwZXJ0dXJlX3JlbW92ZV9jb25mbGljdGluZ19mcmFtZWJ1ZmZlcnMocmVzb3VyY2Vfc2l6
ZV90IGJhc2UsIHJlc291cmNlX3NpemVfdCBzaXplLA0KPiAgIAkJCQkJCSBjb25zdCBzdHJ1
Y3QgZHJtX2RyaXZlciAqcmVxX2RyaXZlcikNCj4gICB7DQo+IC0JcmV0dXJuIGFwZXJ0dXJl
X3JlbW92ZV9jb25mbGljdGluZ19kZXZpY2VzKGJhc2UsIHNpemUsIGZhbHNlLCByZXFfZHJp
dmVyLT5uYW1lKTsNCj4gKwlyZXR1cm4gYXBlcnR1cmVfcmVtb3ZlX2NvbmZsaWN0aW5nX2Rl
dmljZXMoYmFzZSwgc2l6ZSwgcmVxX2RyaXZlci0+bmFtZSk7DQo+ICAgfQ0KPiAgIEVYUE9S
VF9TWU1CT0woZHJtX2FwZXJ0dXJlX3JlbW92ZV9jb25mbGljdGluZ19mcmFtZWJ1ZmZlcnMp
Ow0KPiAgIA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9hcGVydHVyZS5jIGIvZHJp
dmVycy92aWRlby9hcGVydHVyZS5jDQo+IGluZGV4IDAzZjhhNWU5NTIzOC4uYmE1NjU1MTU0
ODBkIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3ZpZGVvL2FwZXJ0dXJlLmMNCj4gKysrIGIv
ZHJpdmVycy92aWRlby9hcGVydHVyZS5jDQo+IEBAIC00Myw3ICs0Myw3IEBADQo+ICAgICoJ
CWJhc2UgPSBtZW0tPnN0YXJ0Ow0KPiAgICAqCQlzaXplID0gcmVzb3VyY2Vfc2l6ZShtZW0p
Ow0KPiAgICAqDQo+IC0gKgkJcmV0ID0gYXBlcnR1cmVfcmVtb3ZlX2NvbmZsaWN0aW5nX2Rl
dmljZXMoYmFzZSwgc2l6ZSwgZmFsc2UsICJleGFtcGxlIik7DQo+ICsgKgkJcmV0ID0gYXBl
cnR1cmVfcmVtb3ZlX2NvbmZsaWN0aW5nX2RldmljZXMoYmFzZSwgc2l6ZSwgImV4YW1wbGUi
KTsNCj4gICAgKgkJaWYgKHJldCkNCj4gICAgKgkJCXJldHVybiByZXQ7DQo+ICAgICoNCj4g
QEAgLTI3NCw3ICsyNzQsNiBAQCBzdGF0aWMgdm9pZCBhcGVydHVyZV9kZXRhY2hfZGV2aWNl
cyhyZXNvdXJjZV9zaXplX3QgYmFzZSwgcmVzb3VyY2Vfc2l6ZV90IHNpemUpDQo+ICAgICog
YXBlcnR1cmVfcmVtb3ZlX2NvbmZsaWN0aW5nX2RldmljZXMgLSByZW1vdmUgZGV2aWNlcyBp
biB0aGUgZ2l2ZW4gcmFuZ2UNCj4gICAgKiBAYmFzZTogdGhlIGFwZXJ0dXJlJ3MgYmFzZSBh
ZGRyZXNzIGluIHBoeXNpY2FsIG1lbW9yeQ0KPiAgICAqIEBzaXplOiBhcGVydHVyZSBzaXpl
IGluIGJ5dGVzDQo+IC0gKiBAcHJpbWFyeTogYWxzbyBraWNrIHZnYTE2ZmIgaWYgcHJlc2Vu
dDsgb25seSByZWxldmFudCBmb3IgVkdBIGRldmljZXMNCj4gICAgKiBAbmFtZTogYSBkZXNj
cmlwdGl2ZSBuYW1lIG9mIHRoZSByZXF1ZXN0aW5nIGRyaXZlcg0KPiAgICAqDQo+ICAgICog
VGhpcyBmdW5jdGlvbiByZW1vdmVzIGRldmljZXMgdGhhdCBvd24gYXBlcnR1cmVzIHdpdGhp
biBAYmFzZSBhbmQgQHNpemUuDQo+IEBAIC0yODMsNyArMjgyLDcgQEAgc3RhdGljIHZvaWQg
YXBlcnR1cmVfZGV0YWNoX2RldmljZXMocmVzb3VyY2Vfc2l6ZV90IGJhc2UsIHJlc291cmNl
X3NpemVfdCBzaXplKQ0KPiAgICAqIDAgb24gc3VjY2Vzcywgb3IgYSBuZWdhdGl2ZSBlcnJu
byBjb2RlIG90aGVyd2lzZQ0KPiAgICAqLw0KPiAgIGludCBhcGVydHVyZV9yZW1vdmVfY29u
ZmxpY3RpbmdfZGV2aWNlcyhyZXNvdXJjZV9zaXplX3QgYmFzZSwgcmVzb3VyY2Vfc2l6ZV90
IHNpemUsDQo+IC0JCQkJCWJvb2wgcHJpbWFyeSwgY29uc3QgY2hhciAqbmFtZSkNCj4gKwkJ
CQkJY29uc3QgY2hhciAqbmFtZSkNCj4gICB7DQo+ICAgCS8qDQo+ICAgCSAqIElmIGEgZHJp
dmVyIGFza2VkIHRvIHVucmVnaXN0ZXIgYSBwbGF0Zm9ybSBkZXZpY2UgcmVnaXN0ZXJlZCBi
eQ0KPiBAQCAtMzI4LDcgKzMyNyw3IEBAIGludCBhcGVydHVyZV9yZW1vdmVfY29uZmxpY3Rp
bmdfcGNpX2RldmljZXMoc3RydWN0IHBjaV9kZXYgKnBkZXYsIGNvbnN0IGNoYXIgKm5hDQo+
ICAgDQo+ICAgCQliYXNlID0gcGNpX3Jlc291cmNlX3N0YXJ0KHBkZXYsIGJhcik7DQo+ICAg
CQlzaXplID0gcGNpX3Jlc291cmNlX2xlbihwZGV2LCBiYXIpOw0KPiAtCQlyZXQgPSBhcGVy
dHVyZV9yZW1vdmVfY29uZmxpY3RpbmdfZGV2aWNlcyhiYXNlLCBzaXplLCBwcmltYXJ5LCBu
YW1lKTsNCj4gKwkJcmV0ID0gYXBlcnR1cmVfcmVtb3ZlX2NvbmZsaWN0aW5nX2RldmljZXMo
YmFzZSwgc2l6ZSwgbmFtZSk7DQo+ICAgCQlpZiAocmV0KQ0KPiAgIAkJCXJldHVybiByZXQ7
DQo+ICAgCX0NCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvYXBlcnR1cmUuaCBiL2lu
Y2x1ZGUvbGludXgvYXBlcnR1cmUuaA0KPiBpbmRleCA0NDJmMTVhNTdjYWQuLjcyNDg3Mjc3
NTNiZSAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9saW51eC9hcGVydHVyZS5oDQo+ICsrKyBi
L2luY2x1ZGUvbGludXgvYXBlcnR1cmUuaA0KPiBAQCAtMTQsNyArMTQsNyBAQCBpbnQgZGV2
bV9hcGVydHVyZV9hY3F1aXJlX2Zvcl9wbGF0Zm9ybV9kZXZpY2Uoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldiwNCj4gICAJCQkJCSAgICAgIHJlc291cmNlX3NpemVfdCBzaXplKTsN
Cj4gICANCj4gICBpbnQgYXBlcnR1cmVfcmVtb3ZlX2NvbmZsaWN0aW5nX2RldmljZXMocmVz
b3VyY2Vfc2l6ZV90IGJhc2UsIHJlc291cmNlX3NpemVfdCBzaXplLA0KPiAtCQkJCQlib29s
IHByaW1hcnksIGNvbnN0IGNoYXIgKm5hbWUpOw0KPiArCQkJCQljb25zdCBjaGFyICpuYW1l
KTsNCj4gICANCj4gICBpbnQgYXBlcnR1cmVfcmVtb3ZlX2NvbmZsaWN0aW5nX3BjaV9kZXZp
Y2VzKHN0cnVjdCBwY2lfZGV2ICpwZGV2LCBjb25zdCBjaGFyICpuYW1lKTsNCj4gICAjZWxz
ZQ0KPiBAQCAtMjYsNyArMjYsNyBAQCBzdGF0aWMgaW5saW5lIGludCBkZXZtX2FwZXJ0dXJl
X2FjcXVpcmVfZm9yX3BsYXRmb3JtX2RldmljZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aQ0KPiAg
IH0NCj4gICANCj4gICBzdGF0aWMgaW5saW5lIGludCBhcGVydHVyZV9yZW1vdmVfY29uZmxp
Y3RpbmdfZGV2aWNlcyhyZXNvdXJjZV9zaXplX3QgYmFzZSwgcmVzb3VyY2Vfc2l6ZV90IHNp
emUsDQo+IC0JCQkJCQkgICAgICBib29sIHByaW1hcnksIGNvbnN0IGNoYXIgKm5hbWUpDQo+
ICsJCQkJCQkgICAgICBjb25zdCBjaGFyICpuYW1lKQ0KPiAgIHsNCj4gICAJcmV0dXJuIDA7
DQo+ICAgfQ0KPiBAQCAtMzksNyArMzksNiBAQCBzdGF0aWMgaW5saW5lIGludCBhcGVydHVy
ZV9yZW1vdmVfY29uZmxpY3RpbmdfcGNpX2RldmljZXMoc3RydWN0IHBjaV9kZXYgKnBkZXYs
DQo+ICAgDQo+ICAgLyoqDQo+ICAgICogYXBlcnR1cmVfcmVtb3ZlX2FsbF9jb25mbGljdGlu
Z19kZXZpY2VzIC0gcmVtb3ZlIGFsbCBleGlzdGluZyBmcmFtZWJ1ZmZlcnMNCj4gLSAqIEBw
cmltYXJ5OiBhbHNvIGtpY2sgdmdhMTZmYiBpZiBwcmVzZW50OyBvbmx5IHJlbGV2YW50IGZv
ciBWR0EgZGV2aWNlcw0KPiAgICAqIEBuYW1lOiBhIGRlc2NyaXB0aXZlIG5hbWUgb2YgdGhl
IHJlcXVlc3RpbmcgZHJpdmVyDQo+ICAgICoNCj4gICAgKiBUaGlzIGZ1bmN0aW9uIHJlbW92
ZXMgYWxsIGdyYXBoaWNzIGRldmljZSBkcml2ZXJzLiBVc2UgdGhpcyBmdW5jdGlvbiBvbiBz
eXN0ZW1zDQo+IEBAIC00OCw5ICs0Nyw5IEBAIHN0YXRpYyBpbmxpbmUgaW50IGFwZXJ0dXJl
X3JlbW92ZV9jb25mbGljdGluZ19wY2lfZGV2aWNlcyhzdHJ1Y3QgcGNpX2RldiAqcGRldiwN
Cj4gICAgKiBSZXR1cm5zOg0KPiAgICAqIDAgb24gc3VjY2Vzcywgb3IgYSBuZWdhdGl2ZSBl
cnJubyBjb2RlIG90aGVyd2lzZQ0KPiAgICAqLw0KPiAtc3RhdGljIGlubGluZSBpbnQgYXBl
cnR1cmVfcmVtb3ZlX2FsbF9jb25mbGljdGluZ19kZXZpY2VzKGJvb2wgcHJpbWFyeSwgY29u
c3QgY2hhciAqbmFtZSkNCj4gK3N0YXRpYyBpbmxpbmUgaW50IGFwZXJ0dXJlX3JlbW92ZV9h
bGxfY29uZmxpY3RpbmdfZGV2aWNlcyhjb25zdCBjaGFyICpuYW1lKQ0KPiAgIHsNCj4gLQly
ZXR1cm4gYXBlcnR1cmVfcmVtb3ZlX2NvbmZsaWN0aW5nX2RldmljZXMoMCwgKHJlc291cmNl
X3NpemVfdCktMSwgcHJpbWFyeSwgbmFtZSk7DQo+ICsJcmV0dXJuIGFwZXJ0dXJlX3JlbW92
ZV9jb25mbGljdGluZ19kZXZpY2VzKDAsIChyZXNvdXJjZV9zaXplX3QpLTEsIG5hbWUpOw0K
PiAgIH0NCj4gICANCj4gICAjZW5kaWYNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3Jh
cGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFu
eSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIg
MzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==


--------------7nACAzIgxY7MRUFPdKTYGYVc--

--------------hcfzcs0YkgpIQ0oEE1P0fjoR
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmO+31IFAwAAAAAACgkQlh/E3EQov+BD
mQ//dQTlQxR8b2T5jfBcxKjY4rQWo5fVA0R4dZ0i6H2hEh6JqQbdMuTdVYZmaGAQtUTXEgCflWHq
fF34hH6Gn8eVFtZPxEugIvZVkC8Mt0NbCY2ZMCrEfP6MoCBPK94YSSio/P8fNJfJ/sXpZKfV9U6t
+JiPXX0tMxsAlTZLKxKogE+OUJspo9avxGqRSSLRI2Zir2lAI1NRkBkYO1ox8P1agPrkH+yDymOM
yx55L8asyi7fGmRjVvyj0InUOVIQ11l/va+reCrZ4NorekBfmL869uJ3OYvXl/7IyDSOaEb6TK/4
23qLsVfLUI3bIzs/8mgqadeEy7BYw1dLsyLu8h80HWAwnU9aZWL6WFO10XXtDCKZBJdQhSYKozqh
uv7S+oNgN7ll+8DrsfK9UW7FDcuxsS9eTXHDGmIJd4ZtfNY3uzI48bXKnlvvHMg/835YLfzZzOkA
SVFABvZlcBSF6OmsEMNT4Lxyib9CpxVhINNjZz4SRaMnwZJRrIAWDBLEIps1knWWIRUrkKndQ6gF
Kd/SV2YKHMT7oDFR3wQvZRsd3Vr1c3y4I7goC8F69X7yFZFJg7/xwtDMCrEK0m3hjDHGyjeHeos6
RE+KzB+oxwGCkkmIwlsWZb1H2nW9XWQgZmwMjs9RLlBDPtBGP7vcB2ZEH9eXAspt8VQVW1rJbgHH
nSE=
=DFO9
-----END PGP SIGNATURE-----

--------------hcfzcs0YkgpIQ0oEE1P0fjoR--
