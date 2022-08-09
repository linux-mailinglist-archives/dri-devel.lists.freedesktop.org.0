Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C43F658D4D4
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 09:42:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCECAC9E66;
	Tue,  9 Aug 2022 07:41:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D69C7C9E34
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Aug 2022 07:41:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2CE0C34A44;
 Tue,  9 Aug 2022 07:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1660030880; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4Xh2jpP1wbYFtK4GZ1t8YG+YABoNc8b8QlXm17Y1jy0=;
 b=aeA2Lh6YiB5VM5GMLJ+IPsivMkMOF7Jakb6aYv1tGV1NMhzIEZtVTcazE0MmfA1Z/vjWc6
 wI4R+/Tv2csiXmvNV/ej2/cZVpCccUJTnJraZGWktIwctLsonO/ZoFKsXzC0wIz62M/si4
 UdsGy+EzHtz7TJGqmQmQM92XGEZ5SNA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1660030880;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4Xh2jpP1wbYFtK4GZ1t8YG+YABoNc8b8QlXm17Y1jy0=;
 b=N5b7UsAqpd3eSF8Q7dYNe8VJ9kBqhHUhWlrJMYZkPwMV9eDmS5AVn6N4euFbBMYqRGG60M
 O72XlyIBcSVBN/CQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id EE34413AA1;
 Tue,  9 Aug 2022 07:41:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SspUOJ8P8mJ6fQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 09 Aug 2022 07:41:19 +0000
Message-ID: <2a307221-62a8-a5f8-354f-d92e90f74f04@suse.de>
Date: Tue, 9 Aug 2022 09:41:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.0
Subject: Re: [PATCH 3/4] drm/udl: Kill pending URBs at suspend and disconnect
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
References: <20220804075826.27036-1-tiwai@suse.de>
 <20220804075826.27036-4-tiwai@suse.de>
 <bebcfa4a-7908-d8ba-3bff-ea7c2ee2d7a9@suse.de> <87h72lx4yw.wl-tiwai@suse.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <87h72lx4yw.wl-tiwai@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ai9jFhmK27dZqcVAe4F2gK2O"
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
--------------ai9jFhmK27dZqcVAe4F2gK2O
Content-Type: multipart/mixed; boundary="------------qXE9z3FedFZkzDaugS6KIMqN";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Takashi Iwai <tiwai@suse.de>
Cc: Dave Airlie <airlied@redhat.com>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <2a307221-62a8-a5f8-354f-d92e90f74f04@suse.de>
Subject: Re: [PATCH 3/4] drm/udl: Kill pending URBs at suspend and disconnect
References: <20220804075826.27036-1-tiwai@suse.de>
 <20220804075826.27036-4-tiwai@suse.de>
 <bebcfa4a-7908-d8ba-3bff-ea7c2ee2d7a9@suse.de> <87h72lx4yw.wl-tiwai@suse.de>
In-Reply-To: <87h72lx4yw.wl-tiwai@suse.de>

--------------qXE9z3FedFZkzDaugS6KIMqN
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDkuMDguMjIgdW0gMDk6MTUgc2NocmllYiBUYWthc2hpIEl3YWk6DQo+IE9u
IFR1ZSwgMDkgQXVnIDIwMjIgMDk6MTM6MTYgKzAyMDAsDQo+IFRob21hcyBaaW1tZXJtYW5u
IHdyb3RlOg0KPj4NCj4+IEhpDQo+Pg0KPj4gQW0gMDQuMDguMjIgdW0gMDk6NTggc2Nocmll
YiBUYWthc2hpIEl3YWk6DQo+Pj4gQXQgYm90aCBzdXNwZW5kIGFuZCBkaXNjb25uZWN0LCB3
ZSBzaG91bGQgcmF0aGVyIGNhbmNlbCB0aGUgcGVuZGluZw0KPj4+IFVSQnMgaW1tZWRpYXRl
bHkuICBGb3IgdGhlIHN1c3BlbmQgY2FzZSwgdGhlIGRpc3BsYXkgd2lsbCBiZSB0dXJuZWQN
Cj4+PiBvZmYsIHNvIGl0IG1ha2VzIG5vIHNlbnNlIHRvIHByb2Nlc3MgdGhlIHJlbmRlcmlu
Zy4gIEFuZCBmb3IgdGhlDQo+Pj4gZGlzY29ubmVjdCBjYXNlLCB0aGUgZGV2aWNlIG1heSBi
ZSBubyBsb25nZXIgYWNjZXNzaWJsZSwgaGVuY2Ugd2UNCj4+PiBzaG91bGRuJ3QgZG8gYW55
IHN1Ym1pc3Npb24uDQo+Pj4NCj4+PiBUZXN0ZWQtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0
emltbWVybWFubkBzdXNlLmRlPg0KPj4+IFNpZ25lZC1vZmYtYnk6IFRha2FzaGkgSXdhaSA8
dGl3YWlAc3VzZS5kZT4NCj4+PiAtLS0NCj4+PiAgICBkcml2ZXJzL2dwdS9kcm0vdWRsL3Vk
bF9kcnYuaCAgICAgfCAgMiArKw0KPj4+ICAgIGRyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX21h
aW4uYyAgICB8IDI1ICsrKysrKysrKysrKysrKysrKysrKystLS0NCj4+PiAgICBkcml2ZXJz
L2dwdS9kcm0vdWRsL3VkbF9tb2Rlc2V0LmMgfCAgMiArKw0KPj4+ICAgIDMgZmlsZXMgY2hh
bmdlZCwgMjYgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4+Pg0KPj4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9kcnYuaCBiL2RyaXZlcnMvZ3B1L2Ry
bS91ZGwvdWRsX2Rydi5oDQo+Pj4gaW5kZXggZjAxZTUwYzViN2I3Li4yOGFhZjc1ZDcxY2Yg
MTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfZHJ2LmgNCj4+PiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9kcnYuaA0KPj4+IEBAIC0zOSw2ICszOSw3
IEBAIHN0cnVjdCB1cmJfbm9kZSB7DQo+Pj4gICAgICBzdHJ1Y3QgdXJiX2xpc3Qgew0KPj4+
ICAgIAlzdHJ1Y3QgbGlzdF9oZWFkIGxpc3Q7DQo+Pj4gKwlzdHJ1Y3QgbGlzdF9oZWFkIGlu
X2ZsaWdodDsNCj4+PiAgICAJc3BpbmxvY2tfdCBsb2NrOw0KPj4+ICAgIAl3YWl0X3F1ZXVl
X2hlYWRfdCBzbGVlcDsNCj4+PiAgICAJaW50IGF2YWlsYWJsZTsNCj4+PiBAQCAtODQsNiAr
ODUsNyBAQCBzdGF0aWMgaW5saW5lIHN0cnVjdCB1cmIgKnVkbF9nZXRfdXJiKHN0cnVjdCBk
cm1fZGV2aWNlICpkZXYpDQo+Pj4gICAgICBpbnQgdWRsX3N1Ym1pdF91cmIoc3RydWN0IGRy
bV9kZXZpY2UgKmRldiwgc3RydWN0IHVyYiAqdXJiLA0KPj4+IHNpemVfdCBsZW4pOw0KPj4+
ICAgIGludCB1ZGxfc3luY19wZW5kaW5nX3VyYnMoc3RydWN0IGRybV9kZXZpY2UgKmRldik7
DQo+Pj4gK3ZvaWQgdWRsX2tpbGxfcGVuZGluZ191cmJzKHN0cnVjdCBkcm1fZGV2aWNlICpk
ZXYpOw0KPj4+ICAgIHZvaWQgdWRsX3VyYl9jb21wbGV0aW9uKHN0cnVjdCB1cmIgKnVyYik7
DQo+Pj4gICAgICBpbnQgdWRsX2luaXQoc3RydWN0IHVkbF9kZXZpY2UgKnVkbCk7DQo+Pj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX21haW4uYyBiL2RyaXZlcnMv
Z3B1L2RybS91ZGwvdWRsX21haW4uYw0KPj4+IGluZGV4IDkzNjE1NjQ4NDE0Yi4uNDcyMDRi
N2ViMTBlIDEwMDY0NA0KPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX21haW4u
Yw0KPj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX21haW4uYw0KPj4+IEBAIC0x
MzUsNyArMTM1LDcgQEAgdm9pZCB1ZGxfdXJiX2NvbXBsZXRpb24oc3RydWN0IHVyYiAqdXJi
KQ0KPj4+ICAgIAl1cmItPnRyYW5zZmVyX2J1ZmZlcl9sZW5ndGggPSB1ZGwtPnVyYnMuc2l6
ZTsgLyogcmVzZXQgdG8gYWN0dWFsICovDQo+Pj4gICAgICAJc3Bpbl9sb2NrX2lycXNhdmUo
JnVkbC0+dXJicy5sb2NrLCBmbGFncyk7DQo+Pj4gLQlsaXN0X2FkZF90YWlsKCZ1bm9kZS0+
ZW50cnksICZ1ZGwtPnVyYnMubGlzdCk7DQo+Pj4gKwlsaXN0X21vdmUoJnVub2RlLT5lbnRy
eSwgJnVkbC0+dXJicy5saXN0KTsNCj4+PiAgICAJdWRsLT51cmJzLmF2YWlsYWJsZSsrOw0K
Pj4+ICAgIAlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZ1ZGwtPnVyYnMubG9jaywgZmxhZ3Mp
Ow0KPj4+ICAgIEBAIC0xODAsNiArMTgwLDcgQEAgc3RhdGljIGludCB1ZGxfYWxsb2NfdXJi
X2xpc3Qoc3RydWN0DQo+Pj4gZHJtX2RldmljZSAqZGV2LCBpbnQgY291bnQsIHNpemVfdCBz
aXplKQ0KPj4+ICAgIHJldHJ5Og0KPj4+ICAgIAl1ZGwtPnVyYnMuc2l6ZSA9IHNpemU7DQo+
Pj4gICAgCUlOSVRfTElTVF9IRUFEKCZ1ZGwtPnVyYnMubGlzdCk7DQo+Pj4gKwlJTklUX0xJ
U1RfSEVBRCgmdWRsLT51cmJzLmluX2ZsaWdodCk7DQo+Pj4gICAgICAJaW5pdF93YWl0cXVl
dWVfaGVhZCgmdWRsLT51cmJzLnNsZWVwKTsNCj4+PiAgICAJdWRsLT51cmJzLmNvdW50ID0g
MDsNCj4+PiBAQCAtMjQ2LDcgKzI0Nyw3IEBAIHN0cnVjdCB1cmIgKnVkbF9nZXRfdXJiX3Rp
bWVvdXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgbG9uZyB0aW1lb3V0KQ0KPj4+ICAgIAl9
DQo+Pj4gICAgICAJdW5vZGUgPSBsaXN0X2ZpcnN0X2VudHJ5KCZ1ZGwtPnVyYnMubGlzdCwg
c3RydWN0IHVyYl9ub2RlLA0KPj4+IGVudHJ5KTsNCj4+PiAtCWxpc3RfZGVsX2luaXQoJnVu
b2RlLT5lbnRyeSk7DQo+Pj4gKwlsaXN0X21vdmUoJnVub2RlLT5lbnRyeSwgJnVkbC0+dXJi
cy5pbl9mbGlnaHQpOw0KPj4+ICAgIAl1ZGwtPnVyYnMuYXZhaWxhYmxlLS07DQo+Pj4gICAg
ICB1bmxvY2s6DQo+Pj4gQEAgLTI3OSw3ICsyODAsNyBAQCBpbnQgdWRsX3N5bmNfcGVuZGlu
Z191cmJzKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpDQo+Pj4gICAgCXNwaW5fbG9ja19pcnEo
JnVkbC0+dXJicy5sb2NrKTsNCj4+PiAgICAJLyogMiBzZWNvbmRzIGFzIGEgc2FuZSB0aW1l
b3V0ICovDQo+Pj4gICAgCWlmICghd2FpdF9ldmVudF9sb2NrX2lycV90aW1lb3V0KHVkbC0+
dXJicy5zbGVlcCwNCj4+PiAtCQkJCQkgdWRsLT51cmJzLmF2YWlsYWJsZSA9PSB1ZGwtPnVy
YnMuY291bnQsDQo+Pj4gKwkJCQkJIGxpc3RfZW1wdHkoJnVkbC0+dXJicy5pbl9mbGlnaHQp
LA0KPj4+ICAgIAkJCQkJIHVkbC0+dXJicy5sb2NrLA0KPj4+ICAgIAkJCQkJIG1zZWNzX3Rv
X2ppZmZpZXMoMjAwMCkpKQ0KPj4+ICAgIAkJcmV0ID0gLUVUSU1FRE9VVDsNCj4+PiBAQCAt
Mjg3LDYgKzI4OCwyMyBAQCBpbnQgdWRsX3N5bmNfcGVuZGluZ191cmJzKHN0cnVjdCBkcm1f
ZGV2aWNlICpkZXYpDQo+Pj4gICAgCXJldHVybiByZXQ7DQo+Pj4gICAgfQ0KPj4+ICAgICsv
KiBraWxsIHBlbmRpbmcgVVJCcyAqLw0KPj4+ICt2b2lkIHVkbF9raWxsX3BlbmRpbmdfdXJi
cyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQ0KPj4+ICt7DQo+Pj4gKwlzdHJ1Y3QgdWRsX2Rl
dmljZSAqdWRsID0gdG9fdWRsKGRldik7DQo+Pj4gKwlzdHJ1Y3QgdXJiX25vZGUgKnVub2Rl
Ow0KPj4+ICsNCj4+PiArCXNwaW5fbG9ja19pcnEoJnVkbC0+dXJicy5sb2NrKTsNCj4+PiAr
CXdoaWxlICghbGlzdF9lbXB0eSgmdWRsLT51cmJzLmluX2ZsaWdodCkpIHsNCj4+PiArCQl1
bm9kZSA9IGxpc3RfZmlyc3RfZW50cnkoJnVkbC0+dXJicy5pbl9mbGlnaHQsDQo+Pj4gKwkJ
CQkJIHN0cnVjdCB1cmJfbm9kZSwgZW50cnkpOw0KPj4+ICsJCXNwaW5fdW5sb2NrX2lycSgm
dWRsLT51cmJzLmxvY2spOw0KPj4+ICsJCXVzYl9raWxsX3VyYih1bm9kZS0+dXJiKTsNCj4+
PiArCQlzcGluX2xvY2tfaXJxKCZ1ZGwtPnVyYnMubG9jayk7DQo+Pj4gKwl9DQo+Pj4gKwlz
cGluX3VubG9ja19pcnEoJnVkbC0+dXJicy5sb2NrKTsNCj4+PiArfQ0KPj4+ICsNCj4+PiAg
ICBpbnQgdWRsX2luaXQoc3RydWN0IHVkbF9kZXZpY2UgKnVkbCkNCj4+PiAgICB7DQo+Pj4g
ICAgCXN0cnVjdCBkcm1fZGV2aWNlICpkZXYgPSAmdWRsLT5kcm07DQo+Pj4gQEAgLTMzNSw2
ICszNTMsNyBAQCBpbnQgdWRsX2Ryb3BfdXNiKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpDQo+
Pj4gICAgew0KPj4+ICAgIAlzdHJ1Y3QgdWRsX2RldmljZSAqdWRsID0gdG9fdWRsKGRldik7
DQo+Pj4gICAgKwl1ZGxfa2lsbF9wZW5kaW5nX3VyYnMoZGV2KTsNCj4+PiAgICAJdWRsX2Zy
ZWVfdXJiX2xpc3QoZGV2KTsNCj4+PiAgICAJcHV0X2RldmljZSh1ZGwtPmRtYWRldik7DQo+
Pj4gICAgCXVkbC0+ZG1hZGV2ID0gTlVMTDsNCj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3VkbC91ZGxfbW9kZXNldC5jIGIvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfbW9k
ZXNldC5jDQo+Pj4gaW5kZXggNTAwMjU2MDZiNmFkLi4xNjkxMTBkOGZjMmUgMTAwNjQ0DQo+
Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfbW9kZXNldC5jDQo+Pj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfbW9kZXNldC5jDQo+Pj4gQEAgLTM5Nyw2ICszOTcs
OCBAQCB1ZGxfc2ltcGxlX2Rpc3BsYXlfcGlwZV9kaXNhYmxlKHN0cnVjdCBkcm1fc2ltcGxl
X2Rpc3BsYXlfcGlwZSAqcGlwZSkNCj4+PiAgICAJc3RydWN0IHVyYiAqdXJiOw0KPj4+ICAg
IAljaGFyICpidWY7DQo+Pj4gICAgKwl1ZGxfa2lsbF9wZW5kaW5nX3VyYnMoZGV2KTsNCj4+
PiArDQo+Pg0KPj4gSSBhbHJlYWR5IHJldmlld2VkIHRoZSBwYXRjaHNldCwgYnV0IEkgaGF2
ZSBhbm90aGVyIGNvbW1lbnQuIEkgdGhpbmsNCj4+IHdlIHNob3VsZCBvbmx5IGtpbGwgdXJi
cyBmcm9tIHdpdGhpbiB0aGUgc3VzcGVuZCBoYW5kbGVyLiBTYW1lIGZvciB0aGUNCj4+IGNh
bGwgdG8gdGhlIFVSQi1zeW5jIGZ1bmN0aW9uIGluIHBhdGNoIDIuDQo+Pg0KPj4gVGhpcyBk
aXNhYmxlIGZ1bmN0aW9uIGlzIHBhcnQgb2YgdGhlIHJlZ3VsYXIgbW9kZXNldCBwYXRoLiBJ
dCdzDQo+PiBwcm9iYWJseSBub3QgYXBwcm9wcmlhdGUgdG8gb3V0cmlnaHQgcmVtb3ZlIHBl
bmRpbmcgVVJCcyBoZXJlLiBUaGlzDQo+PiBjYW4gbGVhZCB0byBmYWlsZWQgbW9kZXNldHMs
IHdoaWNoIHdvdWxkIGhhdmUgc3VjY2VlZGVkIG90aGVyd2lzZS4NCj4gDQo+IFdlbGwsIHRo
ZSBkZXZpY2Ugc2hhbGwgYmUgdHVybmVkIG9mZiByaWdodCBhZnRlciB0aGF0IHBvaW50LCBz
byB0aGUNCj4gYWxsIHBlbmRpbmcgcmVuZGVyaW5nIG1ha2VzIGxpdHRsZSBzZW5zZSwgbm8/
DQoNCnVkbF9zaW1wbGVfZGlzcGxheV9waXBlX2Rpc2FibGUoKSBvbmx5IGRpc2FibGVzIHRo
ZSBkaXNwbGF5LCBidXQgbm90IHRoZSANCmRldmljZS4gVGhlIGtpbGwgb3BlcmF0aW9uIGhl
cmUgY291bGQgcG90ZW50aWFsbHkga2lsbCBzb21lIHZhbGlkIA0KbW9kZXNldCBvcGVyYXRp
b24gdGhhdCB3YXMgc3RpbGwgZ29pbmcgb24uIEFuZCB3aG8ga25vd3Mgd2hhdCB0aGUgZGV2
aWNlIA0Kc3RhdGUgaXMgYWZ0ZXIgdGhhdC4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0K
PiANCj4gDQo+IFRha2FzaGkNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3Mg
RHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJI
DQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDks
IEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------qXE9z3FedFZkzDaugS6KIMqN--

--------------ai9jFhmK27dZqcVAe4F2gK2O
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmLyD58FAwAAAAAACgkQlh/E3EQov+AL
vg/8CrBFgfAbAC+7scBUKa16Xg4TFI4bvgq2CXtrARCBxMWOUwurKcHb9WTJqpKmA+q5eFAHPiOO
Hg4bNkzXYRut94B32JyE+eL0RJaCX6pdKZJevVc7mp1+StiT7WELrffIibve+T3wIyONx6KDos+B
cwRE8BCsgrivR0Bfb6ocJn7SJW4rk56d+BukCaODta85fOp0lgU2aWg+22rDI9ItUQ2mqGy9wgOP
lQnpG2kdIpELxHJzkH0GOSjuDNONn075+1BRBUVPjjw/DHK+l/sn+XbS7+g4T6JCfhiusRYTRGTo
syhuBOKueMx2BDht9r+QQaQJz1H67abdgJ64fE8XC1HXUnYYRk+Dpmc5tuDnku7Sd06ZrYSv1c6J
1UWjVtnYwrG+CREKjBAj881KakA/NVHcGrUBpmor3jW/5D2PN+Un+oZjzEeQb1ZyAcDmFoC/2Hko
TvX9JuTyOGbvImyrAbbmpdBvj5h7lOMZzuwNK//TkJ8plLL9oTaA55Nm30PnJubcaz8iyGk7TBAS
9WIlAXKwbevTB2Q42xZmLEAzVMxya/F12IGpBpMeQhQExJTiCX8SiXq9QCYAdHP8LHgioa5XYtbN
dFsixQexyidlva1HBFfCZV6kDehf/AzPBHDwrmJG5t/bcmJOkyY10VtMhI7iYGOlhzlI/cAApT5g
oBU=
=4mxo
-----END PGP SIGNATURE-----

--------------ai9jFhmK27dZqcVAe4F2gK2O--
