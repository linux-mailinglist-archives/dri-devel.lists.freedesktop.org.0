Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 994834415B4
	for <lists+dri-devel@lfdr.de>; Mon,  1 Nov 2021 09:56:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 542B26E0F4;
	Mon,  1 Nov 2021 08:56:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2A0B6E0EC
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Nov 2021 08:56:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 68575218EE;
 Mon,  1 Nov 2021 08:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1635756980; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/gAoh/M3xLamXnKRhZQpP6ElE8tO8QH5H+3FlrM2DoM=;
 b=dIvPJNB2B8kKTYs/HXQPbI6k6cQku+49UsUI/qYJRZcb23bto18gBtiHIBAPUuw8hhWVFY
 CdK/TKsD24NBrvH/a+KSB+iaNgzVhHd1TNJCxBP06FZxQsrOwFOmgOiTq2rPqXdc8BAza0
 XMeDdPgA7pYpzxNoGl26XZgA6RzqK+U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1635756980;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/gAoh/M3xLamXnKRhZQpP6ElE8tO8QH5H+3FlrM2DoM=;
 b=ST/Scq4z/Uaz/QZarqC5mq6FThKVpKypfmuS2LVL1lMjfvx+MLXrePf57GXp1DMDpiPrvd
 fU6scMF0nhD+NeAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F244413A6F;
 Mon,  1 Nov 2021 08:56:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Fr/rObOrf2EILQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 01 Nov 2021 08:56:19 +0000
Message-ID: <a9da0350-9bfb-7c03-6689-2aec2d81b9df@suse.de>
Date: Mon, 1 Nov 2021 09:56:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH 7/9] drm/simpledrm: Enable FB_DAMAGE_CLIPS property
Content-Language: en-US
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>, daniel@ffwll.ch,
 airlied@linux.ie, mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 drawat.floss@gmail.com, airlied@redhat.com, kraxel@redhat.com,
 david@lechnology.com, sam@ravnborg.org, javierm@redhat.com,
 kernel@amanoeldawod.com, dirty.ice.hu@gmail.com, michael+lkml@stapelberg.ch,
 aros@gmx.com, joshua@stroblindustries.com, arnd@arndb.de
References: <20211022132829.7697-1-tzimmermann@suse.de>
 <20211022132829.7697-8-tzimmermann@suse.de>
 <14b1c21f-25e5-d862-40ea-dda1e076ef63@tronnes.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <14b1c21f-25e5-d862-40ea-dda1e076ef63@tronnes.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------RJd1tUifW0hS6OGaGXfRBZ69"
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
--------------RJd1tUifW0hS6OGaGXfRBZ69
Content-Type: multipart/mixed; boundary="------------0tHjtdziKhVLCIdQFX1aXOL1";
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
Message-ID: <a9da0350-9bfb-7c03-6689-2aec2d81b9df@suse.de>
Subject: Re: [PATCH 7/9] drm/simpledrm: Enable FB_DAMAGE_CLIPS property
References: <20211022132829.7697-1-tzimmermann@suse.de>
 <20211022132829.7697-8-tzimmermann@suse.de>
 <14b1c21f-25e5-d862-40ea-dda1e076ef63@tronnes.org>
In-Reply-To: <14b1c21f-25e5-d862-40ea-dda1e076ef63@tronnes.org>

--------------0tHjtdziKhVLCIdQFX1aXOL1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjQuMTAuMjEgdW0gMTc6MjAgc2NocmllYiBOb3JhbGYgVHLDuG5uZXM6DQo+
IA0KPiANCj4gRGVuIDIyLjEwLjIwMjEgMTUuMjgsIHNrcmV2IFRob21hcyBaaW1tZXJtYW5u
Og0KPj4gRW5hYmxlIHRoZSBGQl9EQU1BR0VfQ0xJUFMgcHJvcGVydHkgdG8gcmVkdWNlIGRp
c3BsYXktdXBkYXRlDQo+PiBvdmVyaGVhZC4gQWxzbyBmaXhlcyBhIHdhcm5pbmcgaW4gdGhl
IGtlcm5lbCBsb2cuDQo+Pg0KPj4gICAgc2ltcGxlLWZyYW1lYnVmZmVyIHNpbXBsZS1mcmFt
ZWJ1ZmZlci4wOiBbZHJtXSBkcm1fcGxhbmVfZW5hYmxlX2ZiX2RhbWFnZV9jbGlwcygpIG5v
dCBjYWxsZWQNCj4+DQo+PiBGaXggdGhlIGNvbXB1dGF0aW9uIG9mIHRoZSBibGl0IHJlY3Rh
bmdsZS4gVGhpcyB3YXNuJ3QgYW4gaXNzdWUgc28NCj4+IGZhciwgYXMgc2ltcGxlZHJtIGFs
d2F5cyBibGl0dGVkIHRoZSBmdWxsIGZyYW1lYnVmZmVyLiBUaGUgY29kZSBub3cNCj4+IHN1
cHBvcnRzIGRhbWFnZSBjbGlwcGluZyBhbmQgdmlydHVhbCBzY3JlZW4gc2l6ZXMuDQo+Pg0K
Pj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2Uu
ZGU+DQo+PiAtLS0NCj4+ICAgZHJpdmVycy9ncHUvZHJtL3Rpbnkvc2ltcGxlZHJtLmMgfCAz
MCArKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0NCj4+ICAgMSBmaWxlIGNoYW5nZWQs
IDIyIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS90aW55L3NpbXBsZWRybS5jIGIvZHJpdmVycy9ncHUvZHJtL3Rp
bnkvc2ltcGxlZHJtLmMNCj4+IGluZGV4IDU3MWY3MTZmZjQyNy4uZTg3MjEyMWU5ZmIwIDEw
MDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Rpbnkvc2ltcGxlZHJtLmMNCj4+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS90aW55L3NpbXBsZWRybS5jDQo+PiBAQCAtNjQyLDcgKzY0
Miw3IEBAIHNpbXBsZWRybV9zaW1wbGVfZGlzcGxheV9waXBlX2VuYWJsZShzdHJ1Y3QgZHJt
X3NpbXBsZV9kaXNwbGF5X3BpcGUgKnBpcGUsDQo+PiAgIAl2b2lkICp2bWFwID0gc2hhZG93
X3BsYW5lX3N0YXRlLT5kYXRhWzBdLnZhZGRyOyAvKiBUT0RPOiBVc2UgbWFwcGluZyBhYnN0
cmFjdGlvbiAqLw0KPj4gICAJc3RydWN0IGRybV9kZXZpY2UgKmRldiA9ICZzZGV2LT5kZXY7
DQo+PiAgIAl2b2lkIF9faW9tZW0gKmRzdCA9IHNkZXYtPnNjcmVlbl9iYXNlOw0KPj4gLQlz
dHJ1Y3QgZHJtX3JlY3QgY2xpcDsNCj4+ICsJc3RydWN0IGRybV9yZWN0IHNyY19jbGlwLCBk
c3RfY2xpcDsNCj4+ICAgCWludCBpZHg7DQo+PiAgIA0KPj4gICAJaWYgKCFmYikNCj4+IEBA
IC02NTEsMTAgKzY1MSwxNCBAQCBzaW1wbGVkcm1fc2ltcGxlX2Rpc3BsYXlfcGlwZV9lbmFi
bGUoc3RydWN0IGRybV9zaW1wbGVfZGlzcGxheV9waXBlICpwaXBlLA0KPj4gICAJaWYgKCFk
cm1fZGV2X2VudGVyKGRldiwgJmlkeCkpDQo+PiAgIAkJcmV0dXJuOw0KPj4gICANCj4+IC0J
ZHJtX3JlY3RfaW5pdCgmY2xpcCwgMCwgMCwgZmItPndpZHRoLCBmYi0+aGVpZ2h0KTsNCj4+
ICsJZHJtX3JlY3RfZnBfdG9faW50KCZzcmNfY2xpcCwgJnBsYW5lX3N0YXRlLT5zcmMpOw0K
Pj4gICANCj4+IC0JZHN0ICs9IGRybV9mYl9jbGlwX29mZnNldChzZGV2LT5waXRjaCwgc2Rl
di0+Zm9ybWF0LCAmY2xpcCk7DQo+PiAtCWRybV9mYl9ibGl0X3RvaW8oZHN0LCBzZGV2LT5w
aXRjaCwgc2Rldi0+Zm9ybWF0LT5mb3JtYXQsIHZtYXAsIGZiLCAmY2xpcCk7DQo+PiArCWRz
dF9jbGlwID0gcGxhbmVfc3RhdGUtPmRzdDsNCj4+ICsJaWYgKCFkcm1fcmVjdF9pbnRlcnNl
Y3QoJmRzdF9jbGlwLCAmc3JjX2NsaXApKQ0KPj4gKwkJcmV0dXJuOw0KPj4gKw0KPj4gKwlk
c3QgKz0gZHJtX2ZiX2NsaXBfb2Zmc2V0KHNkZXYtPnBpdGNoLCBzZGV2LT5mb3JtYXQsICZk
c3RfY2xpcCk7DQo+PiArCWRybV9mYl9ibGl0X3RvaW8oZHN0LCBzZGV2LT5waXRjaCwgc2Rl
di0+Zm9ybWF0LT5mb3JtYXQsIHZtYXAsIGZiLCAmc3JjX2NsaXApOw0KPj4gICANCj4+ICAg
CWRybV9kZXZfZXhpdChpZHgpOw0KPj4gICB9DQo+PiBAQCAtNjg2LDIwICs2OTAsMjggQEAg
c2ltcGxlZHJtX3NpbXBsZV9kaXNwbGF5X3BpcGVfdXBkYXRlKHN0cnVjdCBkcm1fc2ltcGxl
X2Rpc3BsYXlfcGlwZSAqcGlwZSwNCj4+ICAgCXN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZi
ID0gcGxhbmVfc3RhdGUtPmZiOw0KPj4gICAJc3RydWN0IGRybV9kZXZpY2UgKmRldiA9ICZz
ZGV2LT5kZXY7DQo+PiAgIAl2b2lkIF9faW9tZW0gKmRzdCA9IHNkZXYtPnNjcmVlbl9iYXNl
Ow0KPj4gLQlzdHJ1Y3QgZHJtX3JlY3QgY2xpcDsNCj4+ICsJc3RydWN0IGRybV9yZWN0IGRh
bWFnZV9jbGlwLCBzcmNfY2xpcCwgZHN0X2NsaXA7DQo+PiAgIAlpbnQgaWR4Ow0KPj4gICAN
Cj4+ICAgCWlmICghZmIpDQo+PiAgIAkJcmV0dXJuOw0KPj4gICANCj4+IC0JaWYgKCFkcm1f
YXRvbWljX2hlbHBlcl9kYW1hZ2VfbWVyZ2VkKG9sZF9wbGFuZV9zdGF0ZSwgcGxhbmVfc3Rh
dGUsICZjbGlwKSkNCj4+ICsJaWYgKCFkcm1fYXRvbWljX2hlbHBlcl9kYW1hZ2VfbWVyZ2Vk
KG9sZF9wbGFuZV9zdGF0ZSwgcGxhbmVfc3RhdGUsICZkYW1hZ2VfY2xpcCkpDQo+PiArCQly
ZXR1cm47DQo+PiArDQo+IA0KPiBJJ20gYWZyYWlkIEkgZG9uJ3QgdW5kZXJzdGFuZCB3aGF0
J3MgZ29pbmcgb24gaGVyZSwgYnV0IGlzbid0IGl0DQo+IHBvc3NpYmxlIHRvIHB1dCB0aGlz
IGxvZ2ljIGludG8gZHJtX2F0b21pY19oZWxwZXJfZGFtYWdlX21lcmdlZCgpPw0KDQpUaGUg
Y29kZSBhYm92ZSBnZXRzIHRoZSBkYW1hZ2UgcmVjdGFuZ2xlIChpLmUuLCB0aGUgcGxhbmUn
cyBhcmVhIHRoYXQgDQpuZWVkcyB0byBiZSB1cGRhdGVkKS4gVGhlIGNvZGUgYmVsb3cgZ2V0
J3MgdGhlIGZyYW1lYnVmZmVyIGFyZWEuIElmIHRoZXkgDQpkb24ndCBvdmVybGFwLCByZXR1
cm4uIChJIHRoaW5rIHRoaXMgY2FuIHJlYWxseSBvbmx5IGZhaWwgd2l0aCB0aGUgbmV4dCAN
CnBhdGNoIGluIHRoZSBzZXJpZXMsIHdoaWNoIGFkZHMgdmlydHVhbCBzY3JlZW5zLikNCg0K
PiANCj4gTm9yYWxmLg0KPiANCj4+ICsJZHJtX3JlY3RfZnBfdG9faW50KCZzcmNfY2xpcCwg
JnBsYW5lX3N0YXRlLT5zcmMpOw0KPj4gKwlpZiAoIWRybV9yZWN0X2ludGVyc2VjdCgmc3Jj
X2NsaXAsICZkYW1hZ2VfY2xpcCkpDQo+PiArCQlyZXR1cm47DQo+PiArDQo+PiArCWRzdF9j
bGlwID0gcGxhbmVfc3RhdGUtPmRzdDsNCj4+ICsJaWYgKCFkcm1fcmVjdF9pbnRlcnNlY3Qo
JmRzdF9jbGlwLCAmc3JjX2NsaXApKQ0KPj4gICAJCXJldHVybjsNCg0KQW5kIGhlcmUgd2Ug
Y2hlY2sgaWYgdGhlIHVwZGF0ZWQgcGxhbmUvZnJhbWVidWZmZXIgYXJlYSBpcyBhY3R1YWxs
eSANCnZpc2libGUgb24gc2NyZWVuOyBvdGhlcndpc2UgcmV0dXJuLiBJdCBjb3VsZCBiZSBp
biBhbiBhcmVhIHRoYXQgaXMgDQpvZmYtc2NyZWVuLiAoQWdhaW4sIHRoaXMgcHJvYmFibHkg
b25seSBmYWlscyB3aXRoIHRoZSB2aXJ0dWFsLXNjcmVlbiBwYXRjaC4pDQoNCkkgZG9uJ3Qg
dGhpbmsgdGhpcyBpcyBhbGwgZ2VuZXJpYyBlbm91Z2ggdG8gYmUgd2l0aGluIA0KZHJtX2F0
b21pY19oZWxwZXJfZGFtYWdlX21lcmdlZCgpLiBCdXQgb25jZSB3ZSBoYXZlIG11bHRpcGxl
IFNITUVNLWJhc2VkIA0KZHJpdmVycyB3aXRoIHZpcnR1YWwgc2NyZWVucywgd2UgY2FuIG1v
dmUgaXQgaW50byBhIGhlbHBlciBmb3IgDQpzaGFkb3ctYnVmZmVyZWQgcGxhbmVzLiBZb3Vy
IGd1ZCBkcml2ZXIgd291bGQgYmUgYSBjYW5kaWRhdGUgZm9yIHRoaXMgDQpmZWF0dXJlIGFz
IHdlbGwuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4+ICAgDQo+PiAgIAlpZiAoIWRy
bV9kZXZfZW50ZXIoZGV2LCAmaWR4KSkNCj4+ICAgCQlyZXR1cm47DQo+PiAgIA0KPj4gLQlk
c3QgKz0gZHJtX2ZiX2NsaXBfb2Zmc2V0KHNkZXYtPnBpdGNoLCBzZGV2LT5mb3JtYXQsICZj
bGlwKTsNCj4+IC0JZHJtX2ZiX2JsaXRfdG9pbyhkc3QsIHNkZXYtPnBpdGNoLCBzZGV2LT5m
b3JtYXQtPmZvcm1hdCwgdm1hcCwgZmIsICZjbGlwKTsNCj4+ICsJZHN0ICs9IGRybV9mYl9j
bGlwX29mZnNldChzZGV2LT5waXRjaCwgc2Rldi0+Zm9ybWF0LCAmZHN0X2NsaXApOw0KPj4g
Kwlkcm1fZmJfYmxpdF90b2lvKGRzdCwgc2Rldi0+cGl0Y2gsIHNkZXYtPmZvcm1hdC0+Zm9y
bWF0LCB2bWFwLCBmYiwgJnNyY19jbGlwKTsNCj4+ICAgDQo+PiAgIAlkcm1fZGV2X2V4aXQo
aWR4KTsNCj4+ICAgfQ0KPj4gQEAgLTc5NCw2ICs4MDYsOCBAQCBzdGF0aWMgaW50IHNpbXBs
ZWRybV9kZXZpY2VfaW5pdF9tb2Rlc2V0KHN0cnVjdCBzaW1wbGVkcm1fZGV2aWNlICpzZGV2
KQ0KPj4gICAJaWYgKHJldCkNCj4+ICAgCQlyZXR1cm4gcmV0Ow0KPj4gICANCj4+ICsJZHJt
X3BsYW5lX2VuYWJsZV9mYl9kYW1hZ2VfY2xpcHMoJnBpcGUtPnBsYW5lKTsNCj4+ICsNCj4+
ICAgCWRybV9tb2RlX2NvbmZpZ19yZXNldChkZXYpOw0KPj4gICANCj4+ICAgCXJldHVybiAw
Ow0KPj4NCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVs
b3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3Ry
LiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVy
ZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------0tHjtdziKhVLCIdQFX1aXOL1--

--------------RJd1tUifW0hS6OGaGXfRBZ69
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmF/q7MFAwAAAAAACgkQlh/E3EQov+A9
Fw//eUaWX6UrCpWmYeWgM2MeR9wFjwTIkIa08QW9KG/n0MHtwY/Ifp5NBgXe4thSPZQ6TF4sCQXp
ragNvD3qLPf/9dyRHu+mgnGdnZywsabjXe8Q7pHdrd6V+AhWsTl0zTg/2cZIMKyM5fE+39pRbAhY
4wo8mDASZqdIvfJUnzrb7Y0gzNyl3nXWiFgrbsNKclCBf3llxWCPweKnT5XbqPmhRb71/CcyTIWZ
QuvttfHy9XdRe3E+hvLPtBvQEL0rco2jVNBUjVbdkggzoeARdci/VmmsOy9b4S19gCqj3AU92Ulb
WU1mEL9eGCtHUM5qFkukHcLWR0XYtVdMxqh3oyLyN2V8aZoELCof8gxQo90cymNvXMYjV8uFxAR9
p1TWjNqa6QJ5IiTs+bpdJI7HLKe3fii+G6aihXkr0or5MsH5Ne3XGKBWSldyzVAEZCxQWhCCLfQh
3gI0B4ocaAtUg81KImn/hcbdg76TwJ5dVA2f4bKuWsimb94Q0ENI6vHo7M4HJZvRM2J3DcCnvHd3
E49Qd6OCFQ/vmZVAN1djQHV8iNiQmRSSY52hjzUpZ0k8bJQkBiaP23pm48t6vD2/ZUl59dGOoThE
9jyuqRV8PKfZl8r9XAaY8v7cPxiMwebQigfF6xInTw6fOvQ2pL82RbNBKF+DwejIu98Y+tY6YOwC
l9k=
=iyqV
-----END PGP SIGNATURE-----

--------------RJd1tUifW0hS6OGaGXfRBZ69--
