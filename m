Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C052A44ADA6
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 13:38:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E8E389D3E;
	Tue,  9 Nov 2021 12:38:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39B0889D60
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Nov 2021 12:38:06 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C435B21B08;
 Tue,  9 Nov 2021 12:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1636461484; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Pr/msufIEfNhH9LdDdBIkoAqy+mIPBluRaSOI5NcWzQ=;
 b=CjWQIkbfxqKJWP7BJX1cfkv6oxyIc0YFq+rsBMby+qHgWNN19wxKz5iP562oaj9si0N+MN
 FW/0/TpimTSLiRgK+24Yn61vxqYCUa+FD8i18QE3WfwEG/yInZtfeP8KVsZwBRPDkUuzGe
 0ONiO7v/GT6vLa1pL9xR5TgzJ/z5sPw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1636461484;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Pr/msufIEfNhH9LdDdBIkoAqy+mIPBluRaSOI5NcWzQ=;
 b=vczv6oEwQcrgYV23UUbO8DUdtsh5wHPl6zjuL+QzkROeIPyCBXRNsHyfVt2SGbyVXjkhHw
 K/UBISnmUPZaOqBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5F71F13467;
 Tue,  9 Nov 2021 12:38:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id +K1AFaxrimEYOwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 09 Nov 2021 12:38:04 +0000
Message-ID: <b5e514a7-74f3-d072-cfba-80ff05c2669c@suse.de>
Date: Tue, 9 Nov 2021 13:38:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v2 7/9] drm/simpledrm: Enable FB_DAMAGE_CLIPS property
Content-Language: en-US
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 drawat.floss@gmail.com, airlied@redhat.com, kraxel@redhat.com,
 david@lechnology.com, sam@ravnborg.org, javierm@redhat.com,
 kernel@amanoeldawod.com, dirty.ice.hu@gmail.com, michael+lkml@stapelberg.ch,
 aros@gmx.com, joshua@stroblindustries.com, arnd@arndb.de
References: <20211101141532.26655-1-tzimmermann@suse.de>
 <20211101141532.26655-8-tzimmermann@suse.de>
 <974e10bb-ae58-d1c1-a89e-881b39da4930@tronnes.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <974e10bb-ae58-d1c1-a89e-881b39da4930@tronnes.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------wK7tSr06me0FXGvFt0X5U1mm"
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
--------------wK7tSr06me0FXGvFt0X5U1mm
Content-Type: multipart/mixed; boundary="------------eVIgUgLMxW5e0kqYjoQAsoG2";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 drawat.floss@gmail.com, airlied@redhat.com, kraxel@redhat.com,
 david@lechnology.com, sam@ravnborg.org, javierm@redhat.com,
 kernel@amanoeldawod.com, dirty.ice.hu@gmail.com, michael+lkml@stapelberg.ch,
 aros@gmx.com, joshua@stroblindustries.com, arnd@arndb.de
Cc: dri-devel@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
 virtualization@lists.linux-foundation.org
Message-ID: <b5e514a7-74f3-d072-cfba-80ff05c2669c@suse.de>
Subject: Re: [PATCH v2 7/9] drm/simpledrm: Enable FB_DAMAGE_CLIPS property
References: <20211101141532.26655-1-tzimmermann@suse.de>
 <20211101141532.26655-8-tzimmermann@suse.de>
 <974e10bb-ae58-d1c1-a89e-881b39da4930@tronnes.org>
In-Reply-To: <974e10bb-ae58-d1c1-a89e-881b39da4930@tronnes.org>

--------------eVIgUgLMxW5e0kqYjoQAsoG2
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDA4LjExLjIxIHVtIDIxOjU1IHNjaHJpZWIgTm9yYWxmIFRyw7hubmVzOg0KPiAN
Cj4gDQo+IERlbiAwMS4xMS4yMDIxIDE1LjE1LCBza3JldiBUaG9tYXMgWmltbWVybWFubjoN
Cj4+IEVuYWJsZSB0aGUgRkJfREFNQUdFX0NMSVBTIHByb3BlcnR5IHRvIHJlZHVjZSBkaXNw
bGF5LXVwZGF0ZQ0KPj4gb3ZlcmhlYWQuIEFsc28gZml4ZXMgYSB3YXJuaW5nIGluIHRoZSBr
ZXJuZWwgbG9nLg0KPj4NCj4+ICAgIHNpbXBsZS1mcmFtZWJ1ZmZlciBzaW1wbGUtZnJhbWVi
dWZmZXIuMDogW2RybV0gZHJtX3BsYW5lX2VuYWJsZV9mYl9kYW1hZ2VfY2xpcHMoKSBub3Qg
Y2FsbGVkDQo+Pg0KPj4gRml4IHRoZSBjb21wdXRhdGlvbiBvZiB0aGUgYmxpdCByZWN0YW5n
bGUuIFRoaXMgd2Fzbid0IGFuIGlzc3VlIHNvDQo+PiBmYXIsIGFzIHNpbXBsZWRybSBhbHdh
eXMgYmxpdHRlZCB0aGUgZnVsbCBmcmFtZWJ1ZmZlci4gVGhlIGNvZGUgbm93DQo+PiBzdXBw
b3J0cyBkYW1hZ2UgY2xpcHBpbmcgYW5kIHZpcnR1YWwgc2NyZWVuIHNpemVzLg0KPj4NCj4+
IFNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRl
Pg0KPj4gLS0tDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS90aW55L3NpbXBsZWRybS5jIHwgMzAg
KysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAy
MiBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vdGlueS9zaW1wbGVkcm0uYyBiL2RyaXZlcnMvZ3B1L2RybS90aW55
L3NpbXBsZWRybS5jDQo+PiBpbmRleCA1NzFmNzE2ZmY0MjcuLmU4NzIxMjFlOWZiMCAxMDA2
NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90aW55L3NpbXBsZWRybS5jDQo+PiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vdGlueS9zaW1wbGVkcm0uYw0KPj4gQEAgLTY0Miw3ICs2NDIs
NyBAQCBzaW1wbGVkcm1fc2ltcGxlX2Rpc3BsYXlfcGlwZV9lbmFibGUoc3RydWN0IGRybV9z
aW1wbGVfZGlzcGxheV9waXBlICpwaXBlLA0KPj4gICAJdm9pZCAqdm1hcCA9IHNoYWRvd19w
bGFuZV9zdGF0ZS0+ZGF0YVswXS52YWRkcjsgLyogVE9ETzogVXNlIG1hcHBpbmcgYWJzdHJh
Y3Rpb24gKi8NCj4+ICAgCXN0cnVjdCBkcm1fZGV2aWNlICpkZXYgPSAmc2Rldi0+ZGV2Ow0K
Pj4gICAJdm9pZCBfX2lvbWVtICpkc3QgPSBzZGV2LT5zY3JlZW5fYmFzZTsNCj4+IC0Jc3Ry
dWN0IGRybV9yZWN0IGNsaXA7DQo+PiArCXN0cnVjdCBkcm1fcmVjdCBzcmNfY2xpcCwgZHN0
X2NsaXA7DQo+PiAgIAlpbnQgaWR4Ow0KPj4gICANCj4+ICAgCWlmICghZmIpDQo+PiBAQCAt
NjUxLDEwICs2NTEsMTQgQEAgc2ltcGxlZHJtX3NpbXBsZV9kaXNwbGF5X3BpcGVfZW5hYmxl
KHN0cnVjdCBkcm1fc2ltcGxlX2Rpc3BsYXlfcGlwZSAqcGlwZSwNCj4+ICAgCWlmICghZHJt
X2Rldl9lbnRlcihkZXYsICZpZHgpKQ0KPj4gICAJCXJldHVybjsNCj4+ICAgDQo+PiAtCWRy
bV9yZWN0X2luaXQoJmNsaXAsIDAsIDAsIGZiLT53aWR0aCwgZmItPmhlaWdodCk7DQo+PiAr
CWRybV9yZWN0X2ZwX3RvX2ludCgmc3JjX2NsaXAsICZwbGFuZV9zdGF0ZS0+c3JjKTsNCj4+
ICAgDQo+PiAtCWRzdCArPSBkcm1fZmJfY2xpcF9vZmZzZXQoc2Rldi0+cGl0Y2gsIHNkZXYt
PmZvcm1hdCwgJmNsaXApOw0KPj4gLQlkcm1fZmJfYmxpdF90b2lvKGRzdCwgc2Rldi0+cGl0
Y2gsIHNkZXYtPmZvcm1hdC0+Zm9ybWF0LCB2bWFwLCBmYiwgJmNsaXApOw0KPj4gKwlkc3Rf
Y2xpcCA9IHBsYW5lX3N0YXRlLT5kc3Q7DQo+IA0KPiBJIGFzc3VtZSB0aGF0IHNyY19jbGlw
IGFuZCBkc3RfY2xpcCBhcmUgb2YgdGhlIHNhbWUgc2l6ZSwgc2luY2Ugc2NhbGluZw0KPiBp
cyBub3Qgc3VwcG9ydGVkLiBXaGF0IHByZXZlbnRzIGRzdF9jbGlwIGZyb20gYmVpbmcgYmln
Z2VyIHRoYW4gdGhlDQo+IGJ1ZmZlciB0aGF0J3MgYmVpbmcgYmxpdHRlZCBpbnRvPyBXaGVy
ZSBpcyB0aGF0IGJvdW5kcyBjaGVja2luZyBkb25lPw0KDQpUaGUgdmFsdWUgb2YgZHN0X2Ns
aXAgY29tZXMgZnJvbSBwbGFuZV9zdGF0ZS0+ZHN0LCB3aGljaCBnZXRzIA0KaW5pdGlhbGl6
ZWQgaW4gZHJtX2F0b21pY19oZWxwZXJfY2hlY2tfcGxhbmVfc3RhdGUoKS4gWzFdIFRoZSBm
aWVsZHMgYXJlIA0KdGFrZW4gZnJvbSB0aGUgY3J0Y197eCx5LHcsaH0gdmFsdWVzIGJ5IGRy
bV9wbGFuZV9nZXRfZGVzdCgpLiBbMl0gRm9yIA0KcHJpbWFyeSBwbGFuZXMsIHRoZSBjcnRj
X3t4LHksdyxofSB2YWx1ZXMgYXJlIGluaXRpYWxpemVkIGluIA0KX19kcm1fYXRvbWljX2hl
bHBlcl9zZXRfY29uZmlnKCkgdG8gdGhlIHNpemUgb2YgdGhlIGRpc3BsYXkuIFszXSBUaGF0
IA0Kc2l6ZSBjb21lcyBkaXJlY3RseSBmcm9tIHRoZSBjdXJyZW50IHZpZGVvIG1vZGUuIFs0
XSBGcm9tIGFsbCBJIGNhbiBzZWUgDQp0aGlzIGNhbm5vdCBvdmVyZmxvdy4NCg0KQmVzdCBy
ZWdhcmRzDQpUaG9tYXMNCg0KWzFdIA0KaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGlu
dXgvbGF0ZXN0L3NvdXJjZS9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pY19oZWxwZXIuYyNM
ODA3DQpbMl0gDQpodHRwczovL2VsaXhpci5ib290bGluLmNvbS9saW51eC9sYXRlc3Qvc291
cmNlL2luY2x1ZGUvZHJtL2RybV9wbGFuZS5oI0wyNTcNClszXSANCmh0dHBzOi8vZWxpeGly
LmJvb3RsaW4uY29tL2xpbnV4L2xhdGVzdC9zb3VyY2UvZHJpdmVycy9ncHUvZHJtL2RybV9h
dG9taWMuYyNMMTU5MA0KWzRdIA0KaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgv
bGF0ZXN0L3NvdXJjZS9kcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVzLmMjTDc4OA0KDQo+IA0K
PiBOb3JhbGYuDQo+IA0KPj4gKwlpZiAoIWRybV9yZWN0X2ludGVyc2VjdCgmZHN0X2NsaXAs
ICZzcmNfY2xpcCkpDQo+PiArCQlyZXR1cm47DQo+PiArDQo+PiArCWRzdCArPSBkcm1fZmJf
Y2xpcF9vZmZzZXQoc2Rldi0+cGl0Y2gsIHNkZXYtPmZvcm1hdCwgJmRzdF9jbGlwKTsNCj4+
ICsJZHJtX2ZiX2JsaXRfdG9pbyhkc3QsIHNkZXYtPnBpdGNoLCBzZGV2LT5mb3JtYXQtPmZv
cm1hdCwgdm1hcCwgZmIsICZzcmNfY2xpcCk7DQo+PiAgIA0KPj4gICAJZHJtX2Rldl9leGl0
KGlkeCk7DQo+PiAgIH0NCj4+IEBAIC02ODYsMjAgKzY5MCwyOCBAQCBzaW1wbGVkcm1fc2lt
cGxlX2Rpc3BsYXlfcGlwZV91cGRhdGUoc3RydWN0IGRybV9zaW1wbGVfZGlzcGxheV9waXBl
ICpwaXBlLA0KPj4gICAJc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIgPSBwbGFuZV9zdGF0
ZS0+ZmI7DQo+PiAgIAlzdHJ1Y3QgZHJtX2RldmljZSAqZGV2ID0gJnNkZXYtPmRldjsNCj4+
ICAgCXZvaWQgX19pb21lbSAqZHN0ID0gc2Rldi0+c2NyZWVuX2Jhc2U7DQo+PiAtCXN0cnVj
dCBkcm1fcmVjdCBjbGlwOw0KPj4gKwlzdHJ1Y3QgZHJtX3JlY3QgZGFtYWdlX2NsaXAsIHNy
Y19jbGlwLCBkc3RfY2xpcDsNCj4+ICAgCWludCBpZHg7DQo+PiAgIA0KPj4gICAJaWYgKCFm
YikNCj4+ICAgCQlyZXR1cm47DQo+PiAgIA0KPj4gLQlpZiAoIWRybV9hdG9taWNfaGVscGVy
X2RhbWFnZV9tZXJnZWQob2xkX3BsYW5lX3N0YXRlLCBwbGFuZV9zdGF0ZSwgJmNsaXApKQ0K
Pj4gKwlpZiAoIWRybV9hdG9taWNfaGVscGVyX2RhbWFnZV9tZXJnZWQob2xkX3BsYW5lX3N0
YXRlLCBwbGFuZV9zdGF0ZSwgJmRhbWFnZV9jbGlwKSkNCj4+ICsJCXJldHVybjsNCj4+ICsN
Cj4+ICsJZHJtX3JlY3RfZnBfdG9faW50KCZzcmNfY2xpcCwgJnBsYW5lX3N0YXRlLT5zcmMp
Ow0KPj4gKwlpZiAoIWRybV9yZWN0X2ludGVyc2VjdCgmc3JjX2NsaXAsICZkYW1hZ2VfY2xp
cCkpDQo+PiArCQlyZXR1cm47DQo+PiArDQo+PiArCWRzdF9jbGlwID0gcGxhbmVfc3RhdGUt
PmRzdDsNCj4+ICsJaWYgKCFkcm1fcmVjdF9pbnRlcnNlY3QoJmRzdF9jbGlwLCAmc3JjX2Ns
aXApKQ0KPj4gICAJCXJldHVybjsNCj4+ICAgDQo+PiAgIAlpZiAoIWRybV9kZXZfZW50ZXIo
ZGV2LCAmaWR4KSkNCj4+ICAgCQlyZXR1cm47DQo+PiAgIA0KPj4gLQlkc3QgKz0gZHJtX2Zi
X2NsaXBfb2Zmc2V0KHNkZXYtPnBpdGNoLCBzZGV2LT5mb3JtYXQsICZjbGlwKTsNCj4+IC0J
ZHJtX2ZiX2JsaXRfdG9pbyhkc3QsIHNkZXYtPnBpdGNoLCBzZGV2LT5mb3JtYXQtPmZvcm1h
dCwgdm1hcCwgZmIsICZjbGlwKTsNCj4+ICsJZHN0ICs9IGRybV9mYl9jbGlwX29mZnNldChz
ZGV2LT5waXRjaCwgc2Rldi0+Zm9ybWF0LCAmZHN0X2NsaXApOw0KPj4gKwlkcm1fZmJfYmxp
dF90b2lvKGRzdCwgc2Rldi0+cGl0Y2gsIHNkZXYtPmZvcm1hdC0+Zm9ybWF0LCB2bWFwLCBm
YiwgJnNyY19jbGlwKTsNCj4+ICAgDQo+PiAgIAlkcm1fZGV2X2V4aXQoaWR4KTsNCj4+ICAg
fQ0KPj4gQEAgLTc5NCw2ICs4MDYsOCBAQCBzdGF0aWMgaW50IHNpbXBsZWRybV9kZXZpY2Vf
aW5pdF9tb2Rlc2V0KHN0cnVjdCBzaW1wbGVkcm1fZGV2aWNlICpzZGV2KQ0KPj4gICAJaWYg
KHJldCkNCj4+ICAgCQlyZXR1cm4gcmV0Ow0KPj4gICANCj4+ICsJZHJtX3BsYW5lX2VuYWJs
ZV9mYl9kYW1hZ2VfY2xpcHMoJnBpcGUtPnBsYW5lKTsNCj4+ICsNCj4+ICAgCWRybV9tb2Rl
X2NvbmZpZ19yZXNldChkZXYpOw0KPj4gICANCj4+ICAgCXJldHVybiAwOw0KPj4NCg0KLS0g
DQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBT
b2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBO
w7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6Rm
dHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------eVIgUgLMxW5e0kqYjoQAsoG2--

--------------wK7tSr06me0FXGvFt0X5U1mm
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmGKa6sFAwAAAAAACgkQlh/E3EQov+C0
9g/9HmKQqgtp+uesWq78WcBv4X41VxGx6Yz3HBBzK/4950CL14YiLR9WfX713flilGbxJNfCQ8ao
xPcFS1wPMprxrGF7DOoXPz0iV7SqUVx8l8IEOpv+vamNCwL2Fk2mSw3qLADZxB3he/9F7DeXPcxe
berTUWb55LvLruL4g8eRh4T/a3x2goBZnOgxZT4UFg9uaxqX74waSWOGdcGrig/jUmCogBpmNkCx
AdAaD/SO5EughdjmWkZG3mTpOIaat5/fz0hMDjQSsRJivHjKxu9ledHyqv13yKhLUJ2h9035BXp1
XrdrK36yVMXmqnJZUCinqJaI6nqOCDL26u5DygIeGITe2wsCtRIpmqX/zTV7JeCUpiCcxce/HUSA
WMNzFmN2t34DRlEm2K+oGnAN3Hq824QZptylz6VtqxAyD5r8CaldPWwaQrZkhAz3Flm2tIdJb4ag
Niu8fx2ULTkyBKdWuIFPP94zSpqP63pvMarkY5mYfGVS1nwH09Nqi3mx6uLgFrg0q4MZ9hz1PwoP
UjjMon7ZdWzqan1rk1hwGU1IPt3EyCUYyM63M3rzbhtbdUhlRboV/oDBjk8Xj1ZwyLrD5geFS3zJ
aB+xYhLZG86uoOxEES71aNbQTsF9LlvBQQukMkg9/s2KibTLBkWtV8RzIHs4mhrp1EVZhSsw6RUc
wJ0=
=5oUY
-----END PGP SIGNATURE-----

--------------wK7tSr06me0FXGvFt0X5U1mm--
