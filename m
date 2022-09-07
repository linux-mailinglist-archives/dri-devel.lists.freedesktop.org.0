Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7F35AFD93
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 09:32:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EF3910E3CB;
	Wed,  7 Sep 2022 07:31:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 135D010E3CA
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Sep 2022 07:31:50 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A7A2E200E9;
 Wed,  7 Sep 2022 07:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662535908; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nEZtsFP7Pfmjy7Ks9btHDFKhLuYstlIDGUPVhtQoNCY=;
 b=EfF/e5y218vmr5vIt27j/Shzj0ikwa6Zj8ENUKuGY/42b5GaTkbpTDm/kUUz0jPxwyIWR6
 vJ3cgZ27gCAKP5q0EdP+vLvA/Uyj4bYCQ5hIcLo2eMAAFlzOd54fQQs6ZAmBu5h2VF7xWz
 c7odlYV6/TlVFDugdikLQ87hMWfdOwk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662535908;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nEZtsFP7Pfmjy7Ks9btHDFKhLuYstlIDGUPVhtQoNCY=;
 b=Pb6ZZkzlkt0Fqtl9aTwGmSvclWZpIxQis4nOKFA58KLUGvgab7Iq6yFVMSOCRj+/LBDhch
 dqYefqdyVGJxHTCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 8A61913A66;
 Wed,  7 Sep 2022 07:31:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WTBjIORIGGMGfAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 07 Sep 2022 07:31:48 +0000
Message-ID: <4773032b-d103-a636-2d36-e9e19baa284b@suse.de>
Date: Wed, 7 Sep 2022 09:31:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v2 09/11] drm/udl: Fix inconsistent urbs.count value
 during udl_free_urb_list()
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
References: <20220906073951.2085-1-tiwai@suse.de>
 <20220906073951.2085-10-tiwai@suse.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220906073951.2085-10-tiwai@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------CwvdA0n67lxX2mJ26Dhv3fxH"
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------CwvdA0n67lxX2mJ26Dhv3fxH
Content-Type: multipart/mixed; boundary="------------01qYnnl4kuNRhe8vFC7lIWIm";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <4773032b-d103-a636-2d36-e9e19baa284b@suse.de>
Subject: Re: [PATCH v2 09/11] drm/udl: Fix inconsistent urbs.count value
 during udl_free_urb_list()
References: <20220906073951.2085-1-tiwai@suse.de>
 <20220906073951.2085-10-tiwai@suse.de>
In-Reply-To: <20220906073951.2085-10-tiwai@suse.de>

--------------01qYnnl4kuNRhe8vFC7lIWIm
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDYuMDkuMjIgdW0gMDk6Mzkgc2NocmllYiBUYWthc2hpIEl3YWk6DQo+IElu
IHRoZSBjdXJyZW50IGRlc2lnbiwgdWRsX2dldF91cmIoKSBtYXkgYmUgY2FsbGVkIGFzeW5j
aHJvbm91c2x5DQo+IGR1cmluZyB0aGUgZHJpdmVyIGZyZWVpbmcgaXRzIFVSTCBsaXN0IHZp
YSB1ZGxfZnJlZV91cmJfbGlzdCgpLg0KPiBUaGUgcHJvYmxlbSBpcyB0aGF0IHRoZSBzeW5j
IGlzIGRldGVybWluZWQgYnkgY29tcGFyaW5nIHRoZSB1cmJzLmNvdW50DQo+IGFuZCB1cmJz
LmF2YWlsYWJsZSBmaWVsZHMsIHdoaWxlIHdlIGNsZWFyIHVyYnMuY291bnQgZmllbGQgb25s
eSBvbmNlDQo+IGFmdGVyIHVkbF9mcmVlX3VyYl9saXN0KCkgZmluaXNoZXMsIGkuZS4gZHVy
aW5nIHVkbF9mcmVlX3VyYl9saXN0KCksDQo+IHRoZSBzdGF0ZSBiZWNvbWVzIGluY29uc2lz
dGVudC4NCj4gDQo+IEZvciBmaXhpbmcgdGhpcyBpbmNvbnNpc3RlbmN5IGFuZCBhbHNvIGZv
ciBoYXJkZW5pbmcgdGhlIGxvY2tpbmcNCj4gc2NoZW1lLCB0aGlzIHBhdGNoIGRvZXMgYSBz
bGlnaHQgcmVmYWN0b3Jpbmcgb2YgdGhlIGNvZGUgYXJvdW5kDQo+IHVkbF9nZXRfdXJiKCkg
YW5kIHVkbF9mcmVlX3VyYl9saXN0KCkuICBOb3cgdXJicy5jb3VudCBpcyB1cGRhdGVkIGlu
DQo+IHRoZSBzYW1lIHNwaW5sb2NrIGF0IGV4dHJhY3RpbmcgYSBVUkIgZnJvbSB0aGUgbGlz
dCBpbg0KPiB1ZGxfZnJlZV91cmxfbGlzdCgpLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogVGFr
YXNoaSBJd2FpIDx0aXdhaUBzdXNlLmRlPg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0v
dWRsL3VkbF9kcnYuaCAgfCAgOCArLS0tLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL3VkbC91
ZGxfbWFpbi5jIHwgNDQgKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLQ0KPiAg
IDIgZmlsZXMgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKSwgMjEgZGVsZXRpb25zKC0pDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfZHJ2LmggYi9kcml2
ZXJzL2dwdS9kcm0vdWRsL3VkbF9kcnYuaA0KPiBpbmRleCA1OTIzZDJlMDJiYzguLmQ5NDM2
ODRiNWJiYiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfZHJ2LmgN
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfZHJ2LmgNCj4gQEAgLTc0LDEzICs3
NCw3IEBAIHN0YXRpYyBpbmxpbmUgc3RydWN0IHVzYl9kZXZpY2UgKnVkbF90b191c2JfZGV2
aWNlKHN0cnVjdCB1ZGxfZGV2aWNlICp1ZGwpDQo+ICAgaW50IHVkbF9tb2Rlc2V0X2luaXQo
c3RydWN0IGRybV9kZXZpY2UgKmRldik7DQo+ICAgc3RydWN0IGRybV9jb25uZWN0b3IgKnVk
bF9jb25uZWN0b3JfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KTsNCj4gICANCj4gLXN0
cnVjdCB1cmIgKnVkbF9nZXRfdXJiX3RpbWVvdXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwg
bG9uZyB0aW1lb3V0KTsNCj4gLQ0KPiAtI2RlZmluZSBHRVRfVVJCX1RJTUVPVVQJSFoNCj4g
LXN0YXRpYyBpbmxpbmUgc3RydWN0IHVyYiAqdWRsX2dldF91cmIoc3RydWN0IGRybV9kZXZp
Y2UgKmRldikNCj4gLXsNCj4gLQlyZXR1cm4gdWRsX2dldF91cmJfdGltZW91dChkZXYsIEdF
VF9VUkJfVElNRU9VVCk7DQo+IC19DQo+ICtzdHJ1Y3QgdXJiICp1ZGxfZ2V0X3VyYihzdHJ1
Y3QgZHJtX2RldmljZSAqZGV2KTsNCj4gICANCj4gICBpbnQgdWRsX3N1Ym1pdF91cmIoc3Ry
dWN0IGRybV9kZXZpY2UgKmRldiwgc3RydWN0IHVyYiAqdXJiLCBzaXplX3QgbGVuKTsNCj4g
ICBpbnQgdWRsX3N5bmNfcGVuZGluZ191cmJzKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpOw0K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfbWFpbi5jIGIvZHJpdmVy
cy9ncHUvZHJtL3VkbC91ZGxfbWFpbi5jDQo+IGluZGV4IGRlMjhlZWZmMzE1NS4uZGY3ZWJl
MWZkYzkwIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9tYWluLmMN
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfbWFpbi5jDQo+IEBAIC0yMyw2ICsy
Myw4IEBADQo+ICAgI2RlZmluZSBXUklURVNfSU5fRkxJR0hUICgyMCkNCj4gICAjZGVmaW5l
IE1BWF9WRU5ET1JfREVTQ1JJUFRPUl9TSVpFIDI1Ng0KPiAgIA0KPiArc3RhdGljIHN0cnVj
dCB1cmIgKnVkbF9nZXRfdXJiX2xvY2tlZChzdHJ1Y3QgdWRsX2RldmljZSAqdWRsLCBsb25n
IHRpbWVvdXQpOw0KPiArDQo+ICAgc3RhdGljIGludCB1ZGxfcGFyc2VfdmVuZG9yX2Rlc2Ny
aXB0b3Ioc3RydWN0IHVkbF9kZXZpY2UgKnVkbCkNCj4gICB7DQo+ICAgCXN0cnVjdCB1c2Jf
ZGV2aWNlICp1ZGV2ID0gdWRsX3RvX3VzYl9kZXZpY2UodWRsKTsNCj4gQEAgLTE0MCwyMSAr
MTQyLDIzIEBAIHZvaWQgdWRsX3VyYl9jb21wbGV0aW9uKHN0cnVjdCB1cmIgKnVyYikNCj4g
ICAJdWRsLT51cmJzLmF2YWlsYWJsZSsrOw0KPiAgIAlzcGluX3VubG9ja19pcnFyZXN0b3Jl
KCZ1ZGwtPnVyYnMubG9jaywgZmxhZ3MpOw0KPiAgIA0KPiAtCXdha2VfdXAoJnVkbC0+dXJi
cy5zbGVlcCk7DQo+ICsJd2FrZV91cF9hbGwoJnVkbC0+dXJicy5zbGVlcCk7DQo+ICAgfQ0K
PiAgIA0KPiAgIHN0YXRpYyB2b2lkIHVkbF9mcmVlX3VyYl9saXN0KHN0cnVjdCBkcm1fZGV2
aWNlICpkZXYpDQo+ICAgew0KPiAgIAlzdHJ1Y3QgdWRsX2RldmljZSAqdWRsID0gdG9fdWRs
KGRldik7DQo+IC0JaW50IGNvdW50ID0gdWRsLT51cmJzLmNvdW50Ow0KPiAgIAlzdHJ1Y3Qg
dXJiX25vZGUgKnVub2RlOw0KPiAgIAlzdHJ1Y3QgdXJiICp1cmI7DQo+ICAgDQo+ICAgCURS
TV9ERUJVRygiV2FpdGluZyBmb3IgY29tcGxldGVzIGFuZCBmcmVlaW5nIGFsbCByZW5kZXIg
dXJic1xuIik7DQo+ICAgDQo+ICAgCS8qIGtlZXAgd2FpdGluZyBhbmQgZnJlZWluZywgdW50
aWwgd2UndmUgZ290ICdlbSBhbGwgKi8NCj4gLQl3aGlsZSAoY291bnQtLSkgew0KPiAtCQl1
cmIgPSB1ZGxfZ2V0X3VyYl90aW1lb3V0KGRldiwgTUFYX1NDSEVEVUxFX1RJTUVPVVQpOw0K
PiArCXdoaWxlICh1ZGwtPnVyYnMuY291bnQpIHsNCj4gKwkJc3Bpbl9sb2NrX2lycSgmdWRs
LT51cmJzLmxvY2spOw0KPiArCQl1cmIgPSB1ZGxfZ2V0X3VyYl9sb2NrZWQodWRsLCBNQVhf
U0NIRURVTEVfVElNRU9VVCk7DQo+ICsJCXVkbC0+dXJicy5jb3VudC0tOw0KPiArCQlzcGlu
X3VubG9ja19pcnEoJnVkbC0+dXJicy5sb2NrKTsNCj4gICAJCWlmIChXQVJOX09OKCF1cmIp
KQ0KPiAgIAkJCWJyZWFrOw0KPiAgIAkJdW5vZGUgPSB1cmItPmNvbnRleHQ7DQo+IEBAIC0x
NjQsNyArMTY4LDggQEAgc3RhdGljIHZvaWQgdWRsX2ZyZWVfdXJiX2xpc3Qoc3RydWN0IGRy
bV9kZXZpY2UgKmRldikNCj4gICAJCXVzYl9mcmVlX3VyYih1cmIpOw0KPiAgIAkJa2ZyZWUo
dW5vZGUpOw0KPiAgIAl9DQo+IC0JdWRsLT51cmJzLmNvdW50ID0gMDsNCj4gKw0KPiArCXdh
a2VfdXAoJnVkbC0+dXJicy5zbGVlcCk7DQoNCkkgbWVhbnQgdGhhdCB3ZSBzaG91bGQgbWF5
YmUgZG8gYSB3YWtlX3VwX2FsbCgpIGhlcmUgYW5kIG5vdCBpbiB0aGUgDQpjb21wbGV0aW9u
IGhhbmRsZXIgdWRsX3VyYl9jb21wbGV0aW9uKCkuDQoNCkluIGFueSBjYXNlDQoNCkFja2Vk
LWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCg0KPiAgIH0N
Cj4gICANCj4gICBzdGF0aWMgaW50IHVkbF9hbGxvY191cmJfbGlzdChzdHJ1Y3QgZHJtX2Rl
dmljZSAqZGV2LCBpbnQgY291bnQsIHNpemVfdCBzaXplKQ0KPiBAQCAtMjI4LDMzICsyMzMs
NDQgQEAgc3RhdGljIGludCB1ZGxfYWxsb2NfdXJiX2xpc3Qoc3RydWN0IGRybV9kZXZpY2Ug
KmRldiwgaW50IGNvdW50LCBzaXplX3Qgc2l6ZSkNCj4gICAJcmV0dXJuIHVkbC0+dXJicy5j
b3VudDsNCj4gICB9DQo+ICAgDQo+IC1zdHJ1Y3QgdXJiICp1ZGxfZ2V0X3VyYl90aW1lb3V0
KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIGxvbmcgdGltZW91dCkNCj4gK3N0YXRpYyBzdHJ1
Y3QgdXJiICp1ZGxfZ2V0X3VyYl9sb2NrZWQoc3RydWN0IHVkbF9kZXZpY2UgKnVkbCwgbG9u
ZyB0aW1lb3V0KQ0KPiAgIHsNCj4gLQlzdHJ1Y3QgdWRsX2RldmljZSAqdWRsID0gdG9fdWRs
KGRldik7DQo+IC0Jc3RydWN0IHVyYl9ub2RlICp1bm9kZSA9IE5VTEw7DQo+ICsJc3RydWN0
IHVyYl9ub2RlICp1bm9kZTsNCj4gICANCj4gLQlpZiAoIXVkbC0+dXJicy5jb3VudCkNCj4g
LQkJcmV0dXJuIE5VTEw7DQo+ICsJYXNzZXJ0X3NwaW5fbG9ja2VkKCZ1ZGwtPnVyYnMubG9j
ayk7DQo+ICAgDQo+ICAgCS8qIFdhaXQgZm9yIGFuIGluLWZsaWdodCBidWZmZXIgdG8gY29t
cGxldGUgYW5kIGdldCByZS1xdWV1ZWQgKi8NCj4gLQlzcGluX2xvY2tfaXJxKCZ1ZGwtPnVy
YnMubG9jayk7DQo+ICAgCWlmICghd2FpdF9ldmVudF9sb2NrX2lycV90aW1lb3V0KHVkbC0+
dXJicy5zbGVlcCwNCj4gKwkJCQkJICF1ZGwtPnVyYnMuY291bnQgfHwNCj4gICAJCQkJCSAh
bGlzdF9lbXB0eSgmdWRsLT51cmJzLmxpc3QpLA0KPiAgIAkJCQkJIHVkbC0+dXJicy5sb2Nr
LCB0aW1lb3V0KSkgew0KPiAgIAkJRFJNX0lORk8oIndhaXQgZm9yIHVyYiBpbnRlcnJ1cHRl
ZDogYXZhaWxhYmxlOiAlZFxuIiwNCj4gICAJCQkgdWRsLT51cmJzLmF2YWlsYWJsZSk7DQo+
IC0JCWdvdG8gdW5sb2NrOw0KPiArCQlyZXR1cm4gTlVMTDsNCj4gICAJfQ0KPiAgIA0KPiAr
CWlmICghdWRsLT51cmJzLmNvdW50KQ0KPiArCQlyZXR1cm4gTlVMTDsNCj4gKw0KPiAgIAl1
bm9kZSA9IGxpc3RfZmlyc3RfZW50cnkoJnVkbC0+dXJicy5saXN0LCBzdHJ1Y3QgdXJiX25v
ZGUsIGVudHJ5KTsNCj4gICAJbGlzdF9kZWxfaW5pdCgmdW5vZGUtPmVudHJ5KTsNCj4gICAJ
dWRsLT51cmJzLmF2YWlsYWJsZS0tOw0KPiAgIA0KPiAtdW5sb2NrOg0KPiAtCXNwaW5fdW5s
b2NrX2lycSgmdWRsLT51cmJzLmxvY2spOw0KPiAgIAlyZXR1cm4gdW5vZGUgPyB1bm9kZS0+
dXJiIDogTlVMTDsNCj4gICB9DQo+ICAgDQo+ICsjZGVmaW5lIEdFVF9VUkJfVElNRU9VVAlI
Wg0KPiArc3RydWN0IHVyYiAqdWRsX2dldF91cmIoc3RydWN0IGRybV9kZXZpY2UgKmRldikN
Cj4gK3sNCj4gKwlzdHJ1Y3QgdWRsX2RldmljZSAqdWRsID0gdG9fdWRsKGRldik7DQo+ICsJ
c3RydWN0IHVyYiAqdXJiOw0KPiArDQo+ICsJc3Bpbl9sb2NrX2lycSgmdWRsLT51cmJzLmxv
Y2spOw0KPiArCXVyYiA9IHVkbF9nZXRfdXJiX2xvY2tlZCh1ZGwsIEdFVF9VUkJfVElNRU9V
VCk7DQo+ICsJc3Bpbl91bmxvY2tfaXJxKCZ1ZGwtPnVyYnMubG9jayk7DQo+ICsJcmV0dXJu
IHVyYjsNCj4gK30NCj4gKw0KPiAgIGludCB1ZGxfc3VibWl0X3VyYihzdHJ1Y3QgZHJtX2Rl
dmljZSAqZGV2LCBzdHJ1Y3QgdXJiICp1cmIsIHNpemVfdCBsZW4pDQo+ICAgew0KPiAgIAlz
dHJ1Y3QgdWRsX2RldmljZSAqdWRsID0gdG9fdWRsKGRldik7DQoNCi0tIA0KVGhvbWFzIFpp
bW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29s
dXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBH
ZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjog
SXZvIFRvdGV2DQo=

--------------01qYnnl4kuNRhe8vFC7lIWIm--

--------------CwvdA0n67lxX2mJ26Dhv3fxH
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMYSOQFAwAAAAAACgkQlh/E3EQov+Bo
0Q/8C5yIqCW/qbuAl1D7AD7TBVoqTEFBun8G7d8JptRACxjh3rw5M0DP0Te/v8Mj5ItFtfF9Drli
pKdgOLC1bRVhGF6fbqRs+qDgbY9KqG8bGAWQn8LmBC3LifHZL8EVyo2PJmPbHciB4j/xIGYdZp0w
39kYNZewYMoe/zdoOPp8IG0OAjTUQQ2JU3Gs79n74QlGFgdj9Ei29k86qZPzwP1WiuxjKR+70kuM
dAitHdTxmnnhuqe/bHzteiKJQxGcO3Dag7ycjvBdSpskImrDtV6EmrGR+jaCAIE+KF3A1b2q2jhB
TbaozjheuJ6V+LZJTsBDBVf+vyBQsD4Cz6iXFmPsf2Q+jTM8pDMOw3VjE/jESrI1vSNjWFbaP8Xz
e9DzDT0xKfvuyr5M6zx2/b8bQAzVwLSjQ30/F9Rba3zvZlnquHBNugfoS9FlIU7TKCp6jdqtP/aW
f+YtAIdrO+FEHkF00cx6VpLRvrdBCX4RFoBfuwXH/3buhg2I9Il2h3756rwLN04sHjf6eaTYcwYA
G/GSa+P35WUYUmRU4bdgSIRjplFs/CJDTHA7s9sRe0ZPfbaZqwGVIfTdyOSYiPn71/9gwAFZ2UhG
cncDHAEk/ikxxUotkwMaA9J+4fXzUAR8reGnmoHo4UZaGx48IsSVUNL4a0gpwwihWr8C9pAW0Nnb
y/Q=
=47sM
-----END PGP SIGNATURE-----

--------------CwvdA0n67lxX2mJ26Dhv3fxH--
