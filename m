Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 868CF58D640
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 11:17:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A528ECCA0D;
	Tue,  9 Aug 2022 09:15:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51056CC9A6
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Aug 2022 09:13:49 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1888834F65;
 Tue,  9 Aug 2022 09:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1660036427; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SJSHuew8vf+9wFLb4p8A2bkQsHP8Yvi29fzkqBpe3U8=;
 b=V5ivWgRclZaQaNA+PxsaqCK9xvReibPwNtTBL6Nc3qY6yBojztzyhiTTebc2RcwgPtQuXM
 vZwh070RQh04HJ84TopDe7MkWbBB9y8pOEYs3cFvcE/tlnPbM96pxu3ANTeTSgJk2cA1K8
 LZLFPpaMZDo8z0z5LhslbfccGxbx7LI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1660036427;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SJSHuew8vf+9wFLb4p8A2bkQsHP8Yvi29fzkqBpe3U8=;
 b=7Wat+FVtsFh39sqwJ0Q1R4S5fzYO2y8JETXN1JzdxxIVs2oHHymC0VRPkGFTutOsniOpkZ
 wIX2fFO/EAkGT4Dg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C64C513A9D;
 Tue,  9 Aug 2022 09:13:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id kiJeL0ol8mLPLwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 09 Aug 2022 09:13:46 +0000
Message-ID: <32d98960-a952-b3ab-c3fb-0d615626a3d1@suse.de>
Date: Tue, 9 Aug 2022 11:13:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
Subject: Re: [PATCH 3/4] drm/udl: Kill pending URBs at suspend and disconnect
To: Takashi Iwai <tiwai@suse.de>
References: <20220804075826.27036-1-tiwai@suse.de>
 <20220804075826.27036-4-tiwai@suse.de>
 <bebcfa4a-7908-d8ba-3bff-ea7c2ee2d7a9@suse.de> <87h72lx4yw.wl-tiwai@suse.de>
 <2a307221-62a8-a5f8-354f-d92e90f74f04@suse.de> <87a68dwzzi.wl-tiwai@suse.de>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <87a68dwzzi.wl-tiwai@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------gg2fgYIg0QzANPFhSFtWSkmf"
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------gg2fgYIg0QzANPFhSFtWSkmf
Content-Type: multipart/mixed; boundary="------------BcjxvGw1N20JEjYGU9WD2euq";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Takashi Iwai <tiwai@suse.de>
Cc: Dave Airlie <airlied@redhat.com>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <32d98960-a952-b3ab-c3fb-0d615626a3d1@suse.de>
Subject: Re: [PATCH 3/4] drm/udl: Kill pending URBs at suspend and disconnect
References: <20220804075826.27036-1-tiwai@suse.de>
 <20220804075826.27036-4-tiwai@suse.de>
 <bebcfa4a-7908-d8ba-3bff-ea7c2ee2d7a9@suse.de> <87h72lx4yw.wl-tiwai@suse.de>
 <2a307221-62a8-a5f8-354f-d92e90f74f04@suse.de> <87a68dwzzi.wl-tiwai@suse.de>
In-Reply-To: <87a68dwzzi.wl-tiwai@suse.de>

--------------BcjxvGw1N20JEjYGU9WD2euq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDkuMDguMjIgdW0gMTE6MDMgc2NocmllYiBUYWthc2hpIEl3YWk6DQo+IE9u
IFR1ZSwgMDkgQXVnIDIwMjIgMDk6NDE6MTkgKzAyMDAsDQo+IFRob21hcyBaaW1tZXJtYW5u
IHdyb3RlOg0KPj4NCj4+IEhpDQo+Pg0KPj4gQW0gMDkuMDguMjIgdW0gMDk6MTUgc2Nocmll
YiBUYWthc2hpIEl3YWk6DQo+Pj4gT24gVHVlLCAwOSBBdWcgMjAyMiAwOToxMzoxNiArMDIw
MCwNCj4+PiBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4+Pj4NCj4+Pj4gSGkNCj4+Pj4N
Cj4+Pj4gQW0gMDQuMDguMjIgdW0gMDk6NTggc2NocmllYiBUYWthc2hpIEl3YWk6DQo+Pj4+
PiBBdCBib3RoIHN1c3BlbmQgYW5kIGRpc2Nvbm5lY3QsIHdlIHNob3VsZCByYXRoZXIgY2Fu
Y2VsIHRoZSBwZW5kaW5nDQo+Pj4+PiBVUkJzIGltbWVkaWF0ZWx5LiAgRm9yIHRoZSBzdXNw
ZW5kIGNhc2UsIHRoZSBkaXNwbGF5IHdpbGwgYmUgdHVybmVkDQo+Pj4+PiBvZmYsIHNvIGl0
IG1ha2VzIG5vIHNlbnNlIHRvIHByb2Nlc3MgdGhlIHJlbmRlcmluZy4gIEFuZCBmb3IgdGhl
DQo+Pj4+PiBkaXNjb25uZWN0IGNhc2UsIHRoZSBkZXZpY2UgbWF5IGJlIG5vIGxvbmdlciBh
Y2Nlc3NpYmxlLCBoZW5jZSB3ZQ0KPj4+Pj4gc2hvdWxkbid0IGRvIGFueSBzdWJtaXNzaW9u
Lg0KPj4+Pj4NCj4+Pj4+IFRlc3RlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJt
YW5uQHN1c2UuZGU+DQo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBUYWthc2hpIEl3YWkgPHRpd2Fp
QHN1c2UuZGU+DQo+Pj4+PiAtLS0NCj4+Pj4+ICAgICBkcml2ZXJzL2dwdS9kcm0vdWRsL3Vk
bF9kcnYuaCAgICAgfCAgMiArKw0KPj4+Pj4gICAgIGRyaXZlcnMvZ3B1L2RybS91ZGwvdWRs
X21haW4uYyAgICB8IDI1ICsrKysrKysrKysrKysrKysrKysrKystLS0NCj4+Pj4+ICAgICBk
cml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9tb2Rlc2V0LmMgfCAgMiArKw0KPj4+Pj4gICAgIDMg
ZmlsZXMgY2hhbmdlZCwgMjYgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4+Pj4+
DQo+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfZHJ2LmggYi9k
cml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9kcnYuaA0KPj4+Pj4gaW5kZXggZjAxZTUwYzViN2I3
Li4yOGFhZjc1ZDcxY2YgMTAwNjQ0DQo+Pj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdWRs
L3VkbF9kcnYuaA0KPj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfZHJ2LmgN
Cj4+Pj4+IEBAIC0zOSw2ICszOSw3IEBAIHN0cnVjdCB1cmJfbm9kZSB7DQo+Pj4+PiAgICAg
ICBzdHJ1Y3QgdXJiX2xpc3Qgew0KPj4+Pj4gICAgIAlzdHJ1Y3QgbGlzdF9oZWFkIGxpc3Q7
DQo+Pj4+PiArCXN0cnVjdCBsaXN0X2hlYWQgaW5fZmxpZ2h0Ow0KPj4+Pj4gICAgIAlzcGlu
bG9ja190IGxvY2s7DQo+Pj4+PiAgICAgCXdhaXRfcXVldWVfaGVhZF90IHNsZWVwOw0KPj4+
Pj4gICAgIAlpbnQgYXZhaWxhYmxlOw0KPj4+Pj4gQEAgLTg0LDYgKzg1LDcgQEAgc3RhdGlj
IGlubGluZSBzdHJ1Y3QgdXJiICp1ZGxfZ2V0X3VyYihzdHJ1Y3QgZHJtX2RldmljZSAqZGV2
KQ0KPj4+Pj4gICAgICAgaW50IHVkbF9zdWJtaXRfdXJiKHN0cnVjdCBkcm1fZGV2aWNlICpk
ZXYsIHN0cnVjdCB1cmIgKnVyYiwNCj4+Pj4+IHNpemVfdCBsZW4pOw0KPj4+Pj4gICAgIGlu
dCB1ZGxfc3luY19wZW5kaW5nX3VyYnMoc3RydWN0IGRybV9kZXZpY2UgKmRldik7DQo+Pj4+
PiArdm9pZCB1ZGxfa2lsbF9wZW5kaW5nX3VyYnMoc3RydWN0IGRybV9kZXZpY2UgKmRldik7
DQo+Pj4+PiAgICAgdm9pZCB1ZGxfdXJiX2NvbXBsZXRpb24oc3RydWN0IHVyYiAqdXJiKTsN
Cj4+Pj4+ICAgICAgIGludCB1ZGxfaW5pdChzdHJ1Y3QgdWRsX2RldmljZSAqdWRsKTsNCj4+
Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9tYWluLmMgYi9kcml2
ZXJzL2dwdS9kcm0vdWRsL3VkbF9tYWluLmMNCj4+Pj4+IGluZGV4IDkzNjE1NjQ4NDE0Yi4u
NDcyMDRiN2ViMTBlIDEwMDY0NA0KPj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3VkbC91
ZGxfbWFpbi5jDQo+Pj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9tYWluLmMN
Cj4+Pj4+IEBAIC0xMzUsNyArMTM1LDcgQEAgdm9pZCB1ZGxfdXJiX2NvbXBsZXRpb24oc3Ry
dWN0IHVyYiAqdXJiKQ0KPj4+Pj4gICAgIAl1cmItPnRyYW5zZmVyX2J1ZmZlcl9sZW5ndGgg
PSB1ZGwtPnVyYnMuc2l6ZTsgLyogcmVzZXQgdG8gYWN0dWFsICovDQo+Pj4+PiAgICAgICAJ
c3Bpbl9sb2NrX2lycXNhdmUoJnVkbC0+dXJicy5sb2NrLCBmbGFncyk7DQo+Pj4+PiAtCWxp
c3RfYWRkX3RhaWwoJnVub2RlLT5lbnRyeSwgJnVkbC0+dXJicy5saXN0KTsNCj4+Pj4+ICsJ
bGlzdF9tb3ZlKCZ1bm9kZS0+ZW50cnksICZ1ZGwtPnVyYnMubGlzdCk7DQo+Pj4+PiAgICAg
CXVkbC0+dXJicy5hdmFpbGFibGUrKzsNCj4+Pj4+ICAgICAJc3Bpbl91bmxvY2tfaXJxcmVz
dG9yZSgmdWRsLT51cmJzLmxvY2ssIGZsYWdzKTsNCj4+Pj4+ICAgICBAQCAtMTgwLDYgKzE4
MCw3IEBAIHN0YXRpYyBpbnQgdWRsX2FsbG9jX3VyYl9saXN0KHN0cnVjdA0KPj4+Pj4gZHJt
X2RldmljZSAqZGV2LCBpbnQgY291bnQsIHNpemVfdCBzaXplKQ0KPj4+Pj4gICAgIHJldHJ5
Og0KPj4+Pj4gICAgIAl1ZGwtPnVyYnMuc2l6ZSA9IHNpemU7DQo+Pj4+PiAgICAgCUlOSVRf
TElTVF9IRUFEKCZ1ZGwtPnVyYnMubGlzdCk7DQo+Pj4+PiArCUlOSVRfTElTVF9IRUFEKCZ1
ZGwtPnVyYnMuaW5fZmxpZ2h0KTsNCj4+Pj4+ICAgICAgIAlpbml0X3dhaXRxdWV1ZV9oZWFk
KCZ1ZGwtPnVyYnMuc2xlZXApOw0KPj4+Pj4gICAgIAl1ZGwtPnVyYnMuY291bnQgPSAwOw0K
Pj4+Pj4gQEAgLTI0Niw3ICsyNDcsNyBAQCBzdHJ1Y3QgdXJiICp1ZGxfZ2V0X3VyYl90aW1l
b3V0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIGxvbmcgdGltZW91dCkNCj4+Pj4+ICAgICAJ
fQ0KPj4+Pj4gICAgICAgCXVub2RlID0gbGlzdF9maXJzdF9lbnRyeSgmdWRsLT51cmJzLmxp
c3QsIHN0cnVjdCB1cmJfbm9kZSwNCj4+Pj4+IGVudHJ5KTsNCj4+Pj4+IC0JbGlzdF9kZWxf
aW5pdCgmdW5vZGUtPmVudHJ5KTsNCj4+Pj4+ICsJbGlzdF9tb3ZlKCZ1bm9kZS0+ZW50cnks
ICZ1ZGwtPnVyYnMuaW5fZmxpZ2h0KTsNCj4+Pj4+ICAgICAJdWRsLT51cmJzLmF2YWlsYWJs
ZS0tOw0KPj4+Pj4gICAgICAgdW5sb2NrOg0KPj4+Pj4gQEAgLTI3OSw3ICsyODAsNyBAQCBp
bnQgdWRsX3N5bmNfcGVuZGluZ191cmJzKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpDQo+Pj4+
PiAgICAgCXNwaW5fbG9ja19pcnEoJnVkbC0+dXJicy5sb2NrKTsNCj4+Pj4+ICAgICAJLyog
MiBzZWNvbmRzIGFzIGEgc2FuZSB0aW1lb3V0ICovDQo+Pj4+PiAgICAgCWlmICghd2FpdF9l
dmVudF9sb2NrX2lycV90aW1lb3V0KHVkbC0+dXJicy5zbGVlcCwNCj4+Pj4+IC0JCQkJCSB1
ZGwtPnVyYnMuYXZhaWxhYmxlID09IHVkbC0+dXJicy5jb3VudCwNCj4+Pj4+ICsJCQkJCSBs
aXN0X2VtcHR5KCZ1ZGwtPnVyYnMuaW5fZmxpZ2h0KSwNCj4+Pj4+ICAgICAJCQkJCSB1ZGwt
PnVyYnMubG9jaywNCj4+Pj4+ICAgICAJCQkJCSBtc2Vjc190b19qaWZmaWVzKDIwMDApKSkN
Cj4+Pj4+ICAgICAJCXJldCA9IC1FVElNRURPVVQ7DQo+Pj4+PiBAQCAtMjg3LDYgKzI4OCwy
MyBAQCBpbnQgdWRsX3N5bmNfcGVuZGluZ191cmJzKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYp
DQo+Pj4+PiAgICAgCXJldHVybiByZXQ7DQo+Pj4+PiAgICAgfQ0KPj4+Pj4gICAgICsvKiBr
aWxsIHBlbmRpbmcgVVJCcyAqLw0KPj4+Pj4gK3ZvaWQgdWRsX2tpbGxfcGVuZGluZ191cmJz
KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpDQo+Pj4+PiArew0KPj4+Pj4gKwlzdHJ1Y3QgdWRs
X2RldmljZSAqdWRsID0gdG9fdWRsKGRldik7DQo+Pj4+PiArCXN0cnVjdCB1cmJfbm9kZSAq
dW5vZGU7DQo+Pj4+PiArDQo+Pj4+PiArCXNwaW5fbG9ja19pcnEoJnVkbC0+dXJicy5sb2Nr
KTsNCj4+Pj4+ICsJd2hpbGUgKCFsaXN0X2VtcHR5KCZ1ZGwtPnVyYnMuaW5fZmxpZ2h0KSkg
ew0KPj4+Pj4gKwkJdW5vZGUgPSBsaXN0X2ZpcnN0X2VudHJ5KCZ1ZGwtPnVyYnMuaW5fZmxp
Z2h0LA0KPj4+Pj4gKwkJCQkJIHN0cnVjdCB1cmJfbm9kZSwgZW50cnkpOw0KPj4+Pj4gKwkJ
c3Bpbl91bmxvY2tfaXJxKCZ1ZGwtPnVyYnMubG9jayk7DQo+Pj4+PiArCQl1c2Jfa2lsbF91
cmIodW5vZGUtPnVyYik7DQo+Pj4+PiArCQlzcGluX2xvY2tfaXJxKCZ1ZGwtPnVyYnMubG9j
ayk7DQo+Pj4+PiArCX0NCj4+Pj4+ICsJc3Bpbl91bmxvY2tfaXJxKCZ1ZGwtPnVyYnMubG9j
ayk7DQo+Pj4+PiArfQ0KPj4+Pj4gKw0KPj4+Pj4gICAgIGludCB1ZGxfaW5pdChzdHJ1Y3Qg
dWRsX2RldmljZSAqdWRsKQ0KPj4+Pj4gICAgIHsNCj4+Pj4+ICAgICAJc3RydWN0IGRybV9k
ZXZpY2UgKmRldiA9ICZ1ZGwtPmRybTsNCj4+Pj4+IEBAIC0zMzUsNiArMzUzLDcgQEAgaW50
IHVkbF9kcm9wX3VzYihzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQ0KPj4+Pj4gICAgIHsNCj4+
Pj4+ICAgICAJc3RydWN0IHVkbF9kZXZpY2UgKnVkbCA9IHRvX3VkbChkZXYpOw0KPj4+Pj4g
ICAgICsJdWRsX2tpbGxfcGVuZGluZ191cmJzKGRldik7DQo+Pj4+PiAgICAgCXVkbF9mcmVl
X3VyYl9saXN0KGRldik7DQo+Pj4+PiAgICAgCXB1dF9kZXZpY2UodWRsLT5kbWFkZXYpOw0K
Pj4+Pj4gICAgIAl1ZGwtPmRtYWRldiA9IE5VTEw7DQo+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3VkbC91ZGxfbW9kZXNldC5jIGIvZHJpdmVycy9ncHUvZHJtL3VkbC91
ZGxfbW9kZXNldC5jDQo+Pj4+PiBpbmRleCA1MDAyNTYwNmI2YWQuLjE2OTExMGQ4ZmMyZSAx
MDA2NDQNCj4+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX21vZGVzZXQuYw0K
Pj4+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfbW9kZXNldC5jDQo+Pj4+PiBA
QCAtMzk3LDYgKzM5Nyw4IEBAIHVkbF9zaW1wbGVfZGlzcGxheV9waXBlX2Rpc2FibGUoc3Ry
dWN0IGRybV9zaW1wbGVfZGlzcGxheV9waXBlICpwaXBlKQ0KPj4+Pj4gICAgIAlzdHJ1Y3Qg
dXJiICp1cmI7DQo+Pj4+PiAgICAgCWNoYXIgKmJ1ZjsNCj4+Pj4+ICAgICArCXVkbF9raWxs
X3BlbmRpbmdfdXJicyhkZXYpOw0KPj4+Pj4gKw0KPj4+Pg0KPj4+PiBJIGFscmVhZHkgcmV2
aWV3ZWQgdGhlIHBhdGNoc2V0LCBidXQgSSBoYXZlIGFub3RoZXIgY29tbWVudC4gSSB0aGlu
aw0KPj4+PiB3ZSBzaG91bGQgb25seSBraWxsIHVyYnMgZnJvbSB3aXRoaW4gdGhlIHN1c3Bl
bmQgaGFuZGxlci4gU2FtZSBmb3IgdGhlDQo+Pj4+IGNhbGwgdG8gdGhlIFVSQi1zeW5jIGZ1
bmN0aW9uIGluIHBhdGNoIDIuDQo+Pj4+DQo+Pj4+IFRoaXMgZGlzYWJsZSBmdW5jdGlvbiBp
cyBwYXJ0IG9mIHRoZSByZWd1bGFyIG1vZGVzZXQgcGF0aC4gSXQncw0KPj4+PiBwcm9iYWJs
eSBub3QgYXBwcm9wcmlhdGUgdG8gb3V0cmlnaHQgcmVtb3ZlIHBlbmRpbmcgVVJCcyBoZXJl
LiBUaGlzDQo+Pj4+IGNhbiBsZWFkIHRvIGZhaWxlZCBtb2Rlc2V0cywgd2hpY2ggd291bGQg
aGF2ZSBzdWNjZWVkZWQgb3RoZXJ3aXNlLg0KPj4+DQo+Pj4gV2VsbCwgdGhlIGRldmljZSBz
aGFsbCBiZSB0dXJuZWQgb2ZmIHJpZ2h0IGFmdGVyIHRoYXQgcG9pbnQsIHNvIHRoZQ0KPj4+
IGFsbCBwZW5kaW5nIHJlbmRlcmluZyBtYWtlcyBsaXR0bGUgc2Vuc2UsIG5vPw0KPj4NCj4+
IHVkbF9zaW1wbGVfZGlzcGxheV9waXBlX2Rpc2FibGUoKSBvbmx5IGRpc2FibGVzIHRoZSBk
aXNwbGF5LCBidXQgbm90DQo+PiB0aGUgZGV2aWNlLiBUaGUga2lsbCBvcGVyYXRpb24gaGVy
ZSBjb3VsZCBwb3RlbnRpYWxseSBraWxsIHNvbWUgdmFsaWQNCj4+IG1vZGVzZXQgb3BlcmF0
aW9uIHRoYXQgd2FzIHN0aWxsIGdvaW5nIG9uLiBBbmQgd2hvIGtub3dzIHdoYXQgdGhlDQo+
PiBkZXZpY2Ugc3RhdGUgaXMgYWZ0ZXIgdGhhdC4NCj4gDQo+IEJ1dCB1ZGxfc2ltcGxlX2Rp
c3BsYXlfcGlwZV9kaXNhYmxlKCkgaW52b2tlcyBVRExfQkxBTktfTU9ERV9QT1dFUkRPV04N
Cj4gY29tbWFuZCByaWdodCBhZnRlciB0aGUgcGxhY2UgSSd2ZSBwdXQgdWRsX2tpbGxfcGVu
ZGluZ191cmJzKCkuICBTbyBpdA0KPiBzaGFsbCBibGFuayAvIHR1cm4gb2ZmIHRoZSBwb3dl
ciAob2YgdGhlIGRldmljZSwgYXMgaXQgaGFzIGEgc2luZ2xlDQo+IG91dHB1dCkuICBBbmQg
dGhlIFVSQiBjb21wbGV0aW9uIGRvZXNuJ3QgZG8gYW55IGVycm9yIGhhbmRsaW5nIGJ1dA0K
PiBqdXN0IHJlLWxpbmtzIFVSQiBjaGFpbiBhbmQgd2FrZXMgdXAgdGhlIHF1ZXVlLiAgU28g
a2lsbGluZyBhIHBlbmRpbmcNCj4gVVJCIHdvdWxkIG5vdGhpbmcgYnV0IGNhbmNlbGluZyB0
aGUgaW4tZmxpZ2h0IFVSQnMsIGFuZCB0aGVyZSBzaG91bGQNCj4gYmUgbm8gZGlzdHVyYmFu
Y2UgdG8gdGhlIG1vZGVzZXQgb3BlcmF0aW9uIGl0c2VsZiwgYXMgdGhlIHNjcmVlbiB3aWxs
DQo+IGJlIGJsYW5rZWQgaW1tZWRpYXRlbHkuDQoNClRoZSBibGFuayBtb2RlIGlzIGVzc2Vu
dGlhbGx5IERQTVMuIEl0J3MgdW5yZWxhdGVkIHRvIHRoZSBkZXZpY2UncyANCmRpc3BsYXkg
bW9kZS4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gT2YgY291cnNlLCBpdCdz
IGFsbCB0aGVvcnksIGFuZCBpZiB0aGlzIGJyZWFrcyBhbnl0aGluZywgaXQgc2hvdWxkIGJl
DQo+IGNvcnJlY3RlZCA6KQ0KPiANCj4gDQo+IHRoYW5rcywNCj4gDQo+IFRha2FzaGkNCg0K
LS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VT
RSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQw
OSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2No
w6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------BcjxvGw1N20JEjYGU9WD2euq--

--------------gg2fgYIg0QzANPFhSFtWSkmf
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmLyJUoFAwAAAAAACgkQlh/E3EQov+CT
vBAAs6xCaIxDH9RvMbwwSURPxxbIL14zaT5nz2vTay/oOGisJGR+GowYT9jv6jK2a5d1mO3yhXVr
gTlYVqIj9YZBMy5H0y05Xlf5wYlavn7Hn/go9ioQNeWaGUdur3saNhVJqwAJBEKEa3skvbTTiAss
9g4Vkacm3Ya3gzVLF45dh3dPVCla3rPHsGR8pcSPfGjiqpXy+WTFSB6kEqlow66tHgWFCvgKX86I
SXHQDGXchUEnqPZ3JJmeDaFS8bLgi2oHsDsixdhDvx0rZGH8PqU9La/KgeT9otwfML6dfzJLq1ZM
ay0IQxiUiYakATfTbhURUGZEX8HT6cG4pQHsN+9m2+Jf+yTVQKawIO88rrW05AdCgYtHMsDf658M
zlpbgDdY+TxYeaC2eTBcaDarw49CURh00Asujlr9asegzbnHJWGkNwutpThd1Sr+zlk1wVBeM4My
8HWvpcGu+Z5KIn3s9OlQDv75HgPqs09abBtNmbXKJRLL74YZZyxjMzvD4hwnNQ3yRwS4nxZf9gua
agE8oYUga2jjgQoDlzF2ZD2/7FcTShxpI3Z06ISRRiM3sJrw3NVdQ7JF4gw+hjlHphppqqFIgnzd
OZUBckj8iHEHnOBVAyBigdCBVyYMVMYIqiB0Mfxg5NPV9GDkCzraLMmV7dv9pt+nciplJImktkmK
YWg=
=hSq/
-----END PGP SIGNATURE-----

--------------gg2fgYIg0QzANPFhSFtWSkmf--
