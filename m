Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A4F58D44A
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 09:13:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E99EAC90E4;
	Tue,  9 Aug 2022 07:13:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D87C3BB038
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Aug 2022 07:13:18 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E30FC34CD9;
 Tue,  9 Aug 2022 07:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1660029196; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R9WK+PF0ETOz3VoM1ksRtxXg6EcKjbZyKCGgIJY3ihY=;
 b=VrPX3cMOdwqnxqgWtgWGVCGqNFJ2Pj6KNnxc+fXlNJ3pKlMcTA6CVECUNPxjxRHtxPKLsi
 8/BmJ8l2aiDdEpQYwujMfF85oi8/4XTryVexh62Q3Caq785NJH3/8BAsyhkH8MzxrLyfJI
 qhI1xlnx4kxep5cMMK6VXQNq+U/iBqA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1660029196;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=R9WK+PF0ETOz3VoM1ksRtxXg6EcKjbZyKCGgIJY3ihY=;
 b=kKnaQhyJ2hN29wC5Xj0XqDrcccm4M0hLeTgV5Z2rFZstZW2n2rQXeHi8weYhyjDMNzS42Z
 V9R7KDcyMc00RVCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C520E13A9D;
 Tue,  9 Aug 2022 07:13:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kBZFLwwJ8mLTcAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 09 Aug 2022 07:13:16 +0000
Message-ID: <bebcfa4a-7908-d8ba-3bff-ea7c2ee2d7a9@suse.de>
Date: Tue, 9 Aug 2022 09:13:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
Subject: Re: [PATCH 3/4] drm/udl: Kill pending URBs at suspend and disconnect
To: Takashi Iwai <tiwai@suse.de>, dri-devel@lists.freedesktop.org
References: <20220804075826.27036-1-tiwai@suse.de>
 <20220804075826.27036-4-tiwai@suse.de>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220804075826.27036-4-tiwai@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------6PVvEJazcpT2eX77No8hSGCQ"
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
Cc: Dave Airlie <airlied@redhat.com>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------6PVvEJazcpT2eX77No8hSGCQ
Content-Type: multipart/mixed; boundary="------------p5U70wzSTyvnHbBy1wMp7HQn";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Takashi Iwai <tiwai@suse.de>, dri-devel@lists.freedesktop.org
Cc: Dave Airlie <airlied@redhat.com>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Message-ID: <bebcfa4a-7908-d8ba-3bff-ea7c2ee2d7a9@suse.de>
Subject: Re: [PATCH 3/4] drm/udl: Kill pending URBs at suspend and disconnect
References: <20220804075826.27036-1-tiwai@suse.de>
 <20220804075826.27036-4-tiwai@suse.de>
In-Reply-To: <20220804075826.27036-4-tiwai@suse.de>

--------------p5U70wzSTyvnHbBy1wMp7HQn
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDQuMDguMjIgdW0gMDk6NTggc2NocmllYiBUYWthc2hpIEl3YWk6DQo+IEF0
IGJvdGggc3VzcGVuZCBhbmQgZGlzY29ubmVjdCwgd2Ugc2hvdWxkIHJhdGhlciBjYW5jZWwg
dGhlIHBlbmRpbmcNCj4gVVJCcyBpbW1lZGlhdGVseS4gIEZvciB0aGUgc3VzcGVuZCBjYXNl
LCB0aGUgZGlzcGxheSB3aWxsIGJlIHR1cm5lZA0KPiBvZmYsIHNvIGl0IG1ha2VzIG5vIHNl
bnNlIHRvIHByb2Nlc3MgdGhlIHJlbmRlcmluZy4gIEFuZCBmb3IgdGhlDQo+IGRpc2Nvbm5l
Y3QgY2FzZSwgdGhlIGRldmljZSBtYXkgYmUgbm8gbG9uZ2VyIGFjY2Vzc2libGUsIGhlbmNl
IHdlDQo+IHNob3VsZG4ndCBkbyBhbnkgc3VibWlzc2lvbi4NCj4gDQo+IFRlc3RlZC1ieTog
VGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+IFNpZ25lZC1vZmYt
Ynk6IFRha2FzaGkgSXdhaSA8dGl3YWlAc3VzZS5kZT4NCj4gLS0tDQo+ICAgZHJpdmVycy9n
cHUvZHJtL3VkbC91ZGxfZHJ2LmggICAgIHwgIDIgKysNCj4gICBkcml2ZXJzL2dwdS9kcm0v
dWRsL3VkbF9tYWluLmMgICAgfCAyNSArKysrKysrKysrKysrKysrKysrKysrLS0tDQo+ICAg
ZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfbW9kZXNldC5jIHwgIDIgKysNCj4gICAzIGZpbGVz
IGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfZHJ2LmggYi9kcml2ZXJzL2dwdS9k
cm0vdWRsL3VkbF9kcnYuaA0KPiBpbmRleCBmMDFlNTBjNWI3YjcuLjI4YWFmNzVkNzFjZiAx
MDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfZHJ2LmgNCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfZHJ2LmgNCj4gQEAgLTM5LDYgKzM5LDcgQEAgc3Ry
dWN0IHVyYl9ub2RlIHsNCj4gICANCj4gICBzdHJ1Y3QgdXJiX2xpc3Qgew0KPiAgIAlzdHJ1
Y3QgbGlzdF9oZWFkIGxpc3Q7DQo+ICsJc3RydWN0IGxpc3RfaGVhZCBpbl9mbGlnaHQ7DQo+
ICAgCXNwaW5sb2NrX3QgbG9jazsNCj4gICAJd2FpdF9xdWV1ZV9oZWFkX3Qgc2xlZXA7DQo+
ICAgCWludCBhdmFpbGFibGU7DQo+IEBAIC04NCw2ICs4NSw3IEBAIHN0YXRpYyBpbmxpbmUg
c3RydWN0IHVyYiAqdWRsX2dldF91cmIoc3RydWN0IGRybV9kZXZpY2UgKmRldikNCj4gICAN
Cj4gICBpbnQgdWRsX3N1Ym1pdF91cmIoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgc3RydWN0
IHVyYiAqdXJiLCBzaXplX3QgbGVuKTsNCj4gICBpbnQgdWRsX3N5bmNfcGVuZGluZ191cmJz
KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpOw0KPiArdm9pZCB1ZGxfa2lsbF9wZW5kaW5nX3Vy
YnMoc3RydWN0IGRybV9kZXZpY2UgKmRldik7DQo+ICAgdm9pZCB1ZGxfdXJiX2NvbXBsZXRp
b24oc3RydWN0IHVyYiAqdXJiKTsNCj4gICANCj4gICBpbnQgdWRsX2luaXQoc3RydWN0IHVk
bF9kZXZpY2UgKnVkbCk7DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdWRsL3Vk
bF9tYWluLmMgYi9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9tYWluLmMNCj4gaW5kZXggOTM2
MTU2NDg0MTRiLi40NzIwNGI3ZWIxMGUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS91ZGwvdWRsX21haW4uYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9tYWlu
LmMNCj4gQEAgLTEzNSw3ICsxMzUsNyBAQCB2b2lkIHVkbF91cmJfY29tcGxldGlvbihzdHJ1
Y3QgdXJiICp1cmIpDQo+ICAgCXVyYi0+dHJhbnNmZXJfYnVmZmVyX2xlbmd0aCA9IHVkbC0+
dXJicy5zaXplOyAvKiByZXNldCB0byBhY3R1YWwgKi8NCj4gICANCj4gICAJc3Bpbl9sb2Nr
X2lycXNhdmUoJnVkbC0+dXJicy5sb2NrLCBmbGFncyk7DQo+IC0JbGlzdF9hZGRfdGFpbCgm
dW5vZGUtPmVudHJ5LCAmdWRsLT51cmJzLmxpc3QpOw0KPiArCWxpc3RfbW92ZSgmdW5vZGUt
PmVudHJ5LCAmdWRsLT51cmJzLmxpc3QpOw0KPiAgIAl1ZGwtPnVyYnMuYXZhaWxhYmxlKys7
DQo+ICAgCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJnVkbC0+dXJicy5sb2NrLCBmbGFncyk7
DQo+ICAgDQo+IEBAIC0xODAsNiArMTgwLDcgQEAgc3RhdGljIGludCB1ZGxfYWxsb2NfdXJi
X2xpc3Qoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgaW50IGNvdW50LCBzaXplX3Qgc2l6ZSkN
Cj4gICByZXRyeToNCj4gICAJdWRsLT51cmJzLnNpemUgPSBzaXplOw0KPiAgIAlJTklUX0xJ
U1RfSEVBRCgmdWRsLT51cmJzLmxpc3QpOw0KPiArCUlOSVRfTElTVF9IRUFEKCZ1ZGwtPnVy
YnMuaW5fZmxpZ2h0KTsNCj4gICANCj4gICAJaW5pdF93YWl0cXVldWVfaGVhZCgmdWRsLT51
cmJzLnNsZWVwKTsNCj4gICAJdWRsLT51cmJzLmNvdW50ID0gMDsNCj4gQEAgLTI0Niw3ICsy
NDcsNyBAQCBzdHJ1Y3QgdXJiICp1ZGxfZ2V0X3VyYl90aW1lb3V0KHN0cnVjdCBkcm1fZGV2
aWNlICpkZXYsIGxvbmcgdGltZW91dCkNCj4gICAJfQ0KPiAgIA0KPiAgIAl1bm9kZSA9IGxp
c3RfZmlyc3RfZW50cnkoJnVkbC0+dXJicy5saXN0LCBzdHJ1Y3QgdXJiX25vZGUsIGVudHJ5
KTsNCj4gLQlsaXN0X2RlbF9pbml0KCZ1bm9kZS0+ZW50cnkpOw0KPiArCWxpc3RfbW92ZSgm
dW5vZGUtPmVudHJ5LCAmdWRsLT51cmJzLmluX2ZsaWdodCk7DQo+ICAgCXVkbC0+dXJicy5h
dmFpbGFibGUtLTsNCj4gICANCj4gICB1bmxvY2s6DQo+IEBAIC0yNzksNyArMjgwLDcgQEAg
aW50IHVkbF9zeW5jX3BlbmRpbmdfdXJicyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQ0KPiAg
IAlzcGluX2xvY2tfaXJxKCZ1ZGwtPnVyYnMubG9jayk7DQo+ICAgCS8qIDIgc2Vjb25kcyBh
cyBhIHNhbmUgdGltZW91dCAqLw0KPiAgIAlpZiAoIXdhaXRfZXZlbnRfbG9ja19pcnFfdGlt
ZW91dCh1ZGwtPnVyYnMuc2xlZXAsDQo+IC0JCQkJCSB1ZGwtPnVyYnMuYXZhaWxhYmxlID09
IHVkbC0+dXJicy5jb3VudCwNCj4gKwkJCQkJIGxpc3RfZW1wdHkoJnVkbC0+dXJicy5pbl9m
bGlnaHQpLA0KPiAgIAkJCQkJIHVkbC0+dXJicy5sb2NrLA0KPiAgIAkJCQkJIG1zZWNzX3Rv
X2ppZmZpZXMoMjAwMCkpKQ0KPiAgIAkJcmV0ID0gLUVUSU1FRE9VVDsNCj4gQEAgLTI4Nyw2
ICsyODgsMjMgQEAgaW50IHVkbF9zeW5jX3BlbmRpbmdfdXJicyhzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZGV2KQ0KPiAgIAlyZXR1cm4gcmV0Ow0KPiAgIH0NCj4gICANCj4gKy8qIGtpbGwgcGVu
ZGluZyBVUkJzICovDQo+ICt2b2lkIHVkbF9raWxsX3BlbmRpbmdfdXJicyhzdHJ1Y3QgZHJt
X2RldmljZSAqZGV2KQ0KPiArew0KPiArCXN0cnVjdCB1ZGxfZGV2aWNlICp1ZGwgPSB0b191
ZGwoZGV2KTsNCj4gKwlzdHJ1Y3QgdXJiX25vZGUgKnVub2RlOw0KPiArDQo+ICsJc3Bpbl9s
b2NrX2lycSgmdWRsLT51cmJzLmxvY2spOw0KPiArCXdoaWxlICghbGlzdF9lbXB0eSgmdWRs
LT51cmJzLmluX2ZsaWdodCkpIHsNCj4gKwkJdW5vZGUgPSBsaXN0X2ZpcnN0X2VudHJ5KCZ1
ZGwtPnVyYnMuaW5fZmxpZ2h0LA0KPiArCQkJCQkgc3RydWN0IHVyYl9ub2RlLCBlbnRyeSk7
DQo+ICsJCXNwaW5fdW5sb2NrX2lycSgmdWRsLT51cmJzLmxvY2spOw0KPiArCQl1c2Jfa2ls
bF91cmIodW5vZGUtPnVyYik7DQo+ICsJCXNwaW5fbG9ja19pcnEoJnVkbC0+dXJicy5sb2Nr
KTsNCj4gKwl9DQo+ICsJc3Bpbl91bmxvY2tfaXJxKCZ1ZGwtPnVyYnMubG9jayk7DQo+ICt9
DQo+ICsNCj4gICBpbnQgdWRsX2luaXQoc3RydWN0IHVkbF9kZXZpY2UgKnVkbCkNCj4gICB7
DQo+ICAgCXN0cnVjdCBkcm1fZGV2aWNlICpkZXYgPSAmdWRsLT5kcm07DQo+IEBAIC0zMzUs
NiArMzUzLDcgQEAgaW50IHVkbF9kcm9wX3VzYihzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQ0K
PiAgIHsNCj4gICAJc3RydWN0IHVkbF9kZXZpY2UgKnVkbCA9IHRvX3VkbChkZXYpOw0KPiAg
IA0KPiArCXVkbF9raWxsX3BlbmRpbmdfdXJicyhkZXYpOw0KPiAgIAl1ZGxfZnJlZV91cmJf
bGlzdChkZXYpOw0KPiAgIAlwdXRfZGV2aWNlKHVkbC0+ZG1hZGV2KTsNCj4gICAJdWRsLT5k
bWFkZXYgPSBOVUxMOw0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxf
bW9kZXNldC5jIGIvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfbW9kZXNldC5jDQo+IGluZGV4
IDUwMDI1NjA2YjZhZC4uMTY5MTEwZDhmYzJlIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vdWRsL3VkbF9tb2Rlc2V0LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3VkbC91
ZGxfbW9kZXNldC5jDQo+IEBAIC0zOTcsNiArMzk3LDggQEAgdWRsX3NpbXBsZV9kaXNwbGF5
X3BpcGVfZGlzYWJsZShzdHJ1Y3QgZHJtX3NpbXBsZV9kaXNwbGF5X3BpcGUgKnBpcGUpDQo+
ICAgCXN0cnVjdCB1cmIgKnVyYjsNCj4gICAJY2hhciAqYnVmOw0KPiAgIA0KPiArCXVkbF9r
aWxsX3BlbmRpbmdfdXJicyhkZXYpOw0KPiArDQoNCkkgYWxyZWFkeSByZXZpZXdlZCB0aGUg
cGF0Y2hzZXQsIGJ1dCBJIGhhdmUgYW5vdGhlciBjb21tZW50LiBJIHRoaW5rIHdlIA0Kc2hv
dWxkIG9ubHkga2lsbCB1cmJzIGZyb20gd2l0aGluIHRoZSBzdXNwZW5kIGhhbmRsZXIuIFNh
bWUgZm9yIHRoZSBjYWxsIA0KdG8gdGhlIFVSQi1zeW5jIGZ1bmN0aW9uIGluIHBhdGNoIDIu
DQoNClRoaXMgZGlzYWJsZSBmdW5jdGlvbiBpcyBwYXJ0IG9mIHRoZSByZWd1bGFyIG1vZGVz
ZXQgcGF0aC4gSXQncyBwcm9iYWJseSANCm5vdCBhcHByb3ByaWF0ZSB0byBvdXRyaWdodCBy
ZW1vdmUgcGVuZGluZyBVUkJzIGhlcmUuIFRoaXMgY2FuIGxlYWQgdG8gDQpmYWlsZWQgbW9k
ZXNldHMsIHdoaWNoIHdvdWxkIGhhdmUgc3VjY2VlZGVkIG90aGVyd2lzZS4NCg0KQmVzdCBy
ZWdhcmRzDQpUaG9tYXMNCg0KPiAgIAl1cmIgPSB1ZGxfZ2V0X3VyYihkZXYpOw0KPiAgIAlp
ZiAoIXVyYikNCj4gICAJCXJldHVybjsNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3Jh
cGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFu
eSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIg
MzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==


--------------p5U70wzSTyvnHbBy1wMp7HQn--

--------------6PVvEJazcpT2eX77No8hSGCQ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmLyCQwFAwAAAAAACgkQlh/E3EQov+CP
TQ/+Ndhu1QNi2h4m/FL0sw8mHZcn7aAFgM/z+lnTPwzOoRlvj3+NDlMGGLeTPg21UqRLcevddCKG
boVbrmmUkippN6ZWgvXfCxGVC73a1B7GbWjPoaO/hNYvZozMl20aeFLxY48G/3uMLUBn72NO2Tf7
xzLSFt0mqTd0XLe/JNwgn5h5ZfIGrsKx9z8H3Fx49P1bMlN5nGreWM2dgjLELy/pN0NZvt7xqTgX
QXItN35kHQ45T1f5tMKkE5jtNTbcKQ69qzXtXEH9HVG+znaMeejl6rRn0Qsem4/LFALg691bOmk0
tvJEsgfPBDU4vS9BWzwGlJ8wiJLSXFQLF7hCEW2qqP/Oos1ubHjQIc/YXcRFsSzyVidHozG0KV6O
1y44lu4D69Ba1mm1F+ZBLbgStjxxMWtOVLRP6S/5i9kxn5Z89IPhzHYcpnBdoM9rd9gTYhnZgaax
Z7dSFY0Ipn9wGvPh97vlqxqCzMbqmcceZN8Ot0POvuA10ckashuL4puOkIIWJqJGZh+ZYDOJ7ZSu
Pxi6M266a+4JhVj0knla5gA8YOg211Sg0REcysaXLRfRQVUytXDtAYAZbQorTcEcMSZI9B/i59kh
pSTQ6eXawSOODROhIMeWrE1ZA62+UE85VMmMJ58gETI7JBvqZhY1l4/y6WWGJhg3l7v93BC7wfQY
oog=
=SVRx
-----END PGP SIGNATURE-----

--------------6PVvEJazcpT2eX77No8hSGCQ--
