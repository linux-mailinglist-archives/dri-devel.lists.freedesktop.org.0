Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF6F5ACDA2
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 10:33:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2652510E20B;
	Mon,  5 Sep 2022 08:33:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9256710E214
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 08:32:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 38757386AA;
 Mon,  5 Sep 2022 08:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662366776; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y1TtC5XkW046NlKazDvHi6pQkPpJhQJ/cqIh0ccWhV8=;
 b=E4/y9QdBL+pkolyOpRlKb+MrYTf4SaqXtsmHyBOsd5672/fmOb97762eRLbaN2jAenxj3c
 /Gi8nxbr2S08Lf2CPpU36I3DAqP+ZEnDO1+ElooTlYiAGNe1jusKFM9nvXiB7Q01LUPuiQ
 RrmHz9WmoRz7qkGd1g/lbB7bePpccjQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662366776;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y1TtC5XkW046NlKazDvHi6pQkPpJhQJ/cqIh0ccWhV8=;
 b=ZBUDQAO6/OhmbF7joDmjI5FTk1x2dxivVXQSTYPDDdfWfsHfaMPhSMVHd9lG4qW/CxrbjJ
 TS6ADmJbA7SvyzBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 21480139C7;
 Mon,  5 Sep 2022 08:32:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id jHsIBzi0FWMiDwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 05 Sep 2022 08:32:56 +0000
Message-ID: <5730ea32-caea-03db-c37c-658484c2f8f0@suse.de>
Date: Mon, 5 Sep 2022 10:32:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 10/12] drm/udl: Fix inconsistent urbs.count value during
 udl_free_urb_list()
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>
References: <20220816153655.27526-1-tiwai@suse.de>
 <20220816153655.27526-11-tiwai@suse.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220816153655.27526-11-tiwai@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------tykqsKa1tBnyipMnwsFI05g1"
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
--------------tykqsKa1tBnyipMnwsFI05g1
Content-Type: multipart/mixed; boundary="------------O0FlQpQtIQxi7Fgwuwk8FIM8";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Takashi Iwai <tiwai@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <5730ea32-caea-03db-c37c-658484c2f8f0@suse.de>
Subject: Re: [PATCH 10/12] drm/udl: Fix inconsistent urbs.count value during
 udl_free_urb_list()
References: <20220816153655.27526-1-tiwai@suse.de>
 <20220816153655.27526-11-tiwai@suse.de>
In-Reply-To: <20220816153655.27526-11-tiwai@suse.de>

--------------O0FlQpQtIQxi7Fgwuwk8FIM8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTYuMDguMjIgdW0gMTc6MzYgc2NocmllYiBUYWthc2hpIEl3YWk6DQo+IElu
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
dWRsL3VkbF9kcnYuaCAgfCAgOCArLS0tLS0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS91ZGwv
dWRsX21haW4uYyB8IDM3ICsrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0NCj4g
ICAyIGZpbGVzIGNoYW5nZWQsIDI3IGluc2VydGlvbnMoKyksIDE4IGRlbGV0aW9ucygtKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2Rydi5oIGIvZHJp
dmVycy9ncHUvZHJtL3VkbC91ZGxfZHJ2LmgNCj4gaW5kZXggNTkyM2QyZTAyYmM4Li5kOTQz
Njg0YjViYmIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2Rydi5o
DQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2Rydi5oDQo+IEBAIC03NCwxMyAr
NzQsNyBAQCBzdGF0aWMgaW5saW5lIHN0cnVjdCB1c2JfZGV2aWNlICp1ZGxfdG9fdXNiX2Rl
dmljZShzdHJ1Y3QgdWRsX2RldmljZSAqdWRsKQ0KPiAgIGludCB1ZGxfbW9kZXNldF9pbml0
KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpOw0KPiAgIHN0cnVjdCBkcm1fY29ubmVjdG9yICp1
ZGxfY29ubmVjdG9yX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldik7DQo+ICAgDQo+IC1z
dHJ1Y3QgdXJiICp1ZGxfZ2V0X3VyYl90aW1lb3V0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYs
IGxvbmcgdGltZW91dCk7DQo+IC0NCj4gLSNkZWZpbmUgR0VUX1VSQl9USU1FT1VUCUhaDQo+
IC1zdGF0aWMgaW5saW5lIHN0cnVjdCB1cmIgKnVkbF9nZXRfdXJiKHN0cnVjdCBkcm1fZGV2
aWNlICpkZXYpDQo+IC17DQo+IC0JcmV0dXJuIHVkbF9nZXRfdXJiX3RpbWVvdXQoZGV2LCBH
RVRfVVJCX1RJTUVPVVQpOw0KPiAtfQ0KPiArc3RydWN0IHVyYiAqdWRsX2dldF91cmIoc3Ry
dWN0IGRybV9kZXZpY2UgKmRldik7DQo+ICAgDQo+ICAgaW50IHVkbF9zdWJtaXRfdXJiKHN0
cnVjdCBkcm1fZGV2aWNlICpkZXYsIHN0cnVjdCB1cmIgKnVyYiwgc2l6ZV90IGxlbik7DQo+
ICAgaW50IHVkbF9zeW5jX3BlbmRpbmdfdXJicyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KTsN
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX21haW4uYyBiL2RyaXZl
cnMvZ3B1L2RybS91ZGwvdWRsX21haW4uYw0KPiBpbmRleCA4YmJiNGUyODYxZmIuLjE5ZGM4
MzE3ZTg0MyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfbWFpbi5j
DQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX21haW4uYw0KPiBAQCAtMjgsNiAr
MjgsOCBAQA0KPiAgIHN0YXRpYyB1aW50IHVkbF9udW1fdXJicyA9IFdSSVRFU19JTl9GTElH
SFQ7DQo+ICAgbW9kdWxlX3BhcmFtX25hbWVkKG51bXVyYnMsIHVkbF9udW1fdXJicywgdWlu
dCwgMDYwMCk7DQo+ICAgDQo+ICtzdGF0aWMgc3RydWN0IHVyYiAqX191ZGxfZ2V0X3VyYihz
dHJ1Y3QgdWRsX2RldmljZSAqdWRsLCBsb25nIHRpbWVvdXQpOw0KPiArDQo+ICAgc3RhdGlj
IGludCB1ZGxfcGFyc2VfdmVuZG9yX2Rlc2NyaXB0b3Ioc3RydWN0IHVkbF9kZXZpY2UgKnVk
bCkNCj4gICB7DQo+ICAgCXN0cnVjdCB1c2JfZGV2aWNlICp1ZGV2ID0gdWRsX3RvX3VzYl9k
ZXZpY2UodWRsKTsNCj4gQEAgLTE1MSwxNSArMTUzLDE3IEBAIHZvaWQgdWRsX3VyYl9jb21w
bGV0aW9uKHN0cnVjdCB1cmIgKnVyYikNCj4gICBzdGF0aWMgdm9pZCB1ZGxfZnJlZV91cmJf
bGlzdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQ0KPiAgIHsNCj4gICAJc3RydWN0IHVkbF9k
ZXZpY2UgKnVkbCA9IHRvX3VkbChkZXYpOw0KPiAtCWludCBjb3VudCA9IHVkbC0+dXJicy5j
b3VudDsNCj4gICAJc3RydWN0IHVyYl9ub2RlICp1bm9kZTsNCj4gICAJc3RydWN0IHVyYiAq
dXJiOw0KPiAgIA0KPiAgIAlEUk1fREVCVUcoIldhaXRpbmcgZm9yIGNvbXBsZXRlcyBhbmQg
ZnJlZWluZyBhbGwgcmVuZGVyIHVyYnNcbiIpOw0KPiAgIA0KPiAgIAkvKiBrZWVwIHdhaXRp
bmcgYW5kIGZyZWVpbmcsIHVudGlsIHdlJ3ZlIGdvdCAnZW0gYWxsICovDQo+IC0Jd2hpbGUg
KGNvdW50LS0pIHsNCj4gLQkJdXJiID0gdWRsX2dldF91cmJfdGltZW91dChkZXYsIE1BWF9T
Q0hFRFVMRV9USU1FT1VUKTsNCj4gKwl3aGlsZSAodWRsLT51cmJzLmNvdW50KSB7DQo+ICsJ
CXNwaW5fbG9ja19pcnEoJnVkbC0+dXJicy5sb2NrKTsNCj4gKwkJdXJiID0gX191ZGxfZ2V0
X3VyYih1ZGwsIE1BWF9TQ0hFRFVMRV9USU1FT1VUKTsNCj4gKwkJdWRsLT51cmJzLmNvdW50
LS07DQo+ICsJCXNwaW5fdW5sb2NrX2lycSgmdWRsLT51cmJzLmxvY2spOw0KPiAgIAkJaWYg
KFdBUk5fT04oIXVyYikpDQo+ICAgCQkJYnJlYWs7DQo+ICAgCQl1bm9kZSA9IHVyYi0+Y29u
dGV4dDsNCj4gQEAgLTE2OSw3ICsxNzMsOCBAQCBzdGF0aWMgdm9pZCB1ZGxfZnJlZV91cmJf
bGlzdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQ0KPiAgIAkJdXNiX2ZyZWVfdXJiKHVyYik7
DQo+ICAgCQlrZnJlZSh1bm9kZSk7DQo+ICAgCX0NCj4gLQl1ZGwtPnVyYnMuY291bnQgPSAw
Ow0KPiArDQo+ICsJd2FrZV91cCgmdWRsLT51cmJzLnNsZWVwKTsNCg0KVGhlcmUncyBqdXN0
IG9uZSB3YWl0ZXIsIGJ1dCBpdCdzIHRoZSBzaHV0ZG93biBjb2RlLiBNYXliZSB3YWtlX3Vw
X2FsbCgpIA0Kd291bGQgbW9yZSBjbGVhcmx5IGNvbW11bmljYXRlIHRoZSBpbnRlbnRpb24u
DQoNCj4gICB9DQo+ICAgDQo+ICAgc3RhdGljIGludCB1ZGxfYWxsb2NfdXJiX2xpc3Qoc3Ry
dWN0IGRybV9kZXZpY2UgKmRldiwgaW50IGNvdW50LCBzaXplX3Qgc2l6ZSkNCj4gQEAgLTIz
MywzMyArMjM4LDQzIEBAIHN0YXRpYyBpbnQgdWRsX2FsbG9jX3VyYl9saXN0KHN0cnVjdCBk
cm1fZGV2aWNlICpkZXYsIGludCBjb3VudCwgc2l6ZV90IHNpemUpDQo+ICAgCXJldHVybiB1
ZGwtPnVyYnMuY291bnQ7DQo+ICAgfQ0KPiAgIA0KPiAtc3RydWN0IHVyYiAqdWRsX2dldF91
cmJfdGltZW91dChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBsb25nIHRpbWVvdXQpDQo+ICtz
dGF0aWMgc3RydWN0IHVyYiAqX191ZGxfZ2V0X3VyYihzdHJ1Y3QgdWRsX2RldmljZSAqdWRs
LCBsb25nIHRpbWVvdXQpDQoNCkkgdGhpbmsgaW4gRFJNLCB0aGUgY29ycmVjdCBuYW1lIGZv
ciB0aGlzIGZ1bmN0aW9uIHdvdWxkIGJlIA0KdWRsX2dldF91cmJfbG9ja2VkKCkuDQoNCj4g
ICB7DQo+IC0Jc3RydWN0IHVkbF9kZXZpY2UgKnVkbCA9IHRvX3VkbChkZXYpOw0KPiAtCXN0
cnVjdCB1cmJfbm9kZSAqdW5vZGUgPSBOVUxMOw0KPiArCXN0cnVjdCB1cmJfbm9kZSAqdW5v
ZGU7DQo+ICsNCj4gKwlhc3NlcnRfc3Bpbl9sb2NrZWQoJnVkbC0+dXJicy5sb2NrKTsNCj4g
ICANCj4gICAJaWYgKCF1ZGwtPnVyYnMuY291bnQpDQo+ICAgCQlyZXR1cm4gTlVMTDsNCj4g
ICANCj4gICAJLyogV2FpdCBmb3IgYW4gaW4tZmxpZ2h0IGJ1ZmZlciB0byBjb21wbGV0ZSBh
bmQgZ2V0IHJlLXF1ZXVlZCAqLw0KPiAtCXNwaW5fbG9ja19pcnEoJnVkbC0+dXJicy5sb2Nr
KTsNCj4gICAJaWYgKCF3YWl0X2V2ZW50X2xvY2tfaXJxX3RpbWVvdXQodWRsLT51cmJzLnNs
ZWVwLA0KPiAgIAkJCQkJICFsaXN0X2VtcHR5KCZ1ZGwtPnVyYnMubGlzdCksDQoNClRoZSB1
cmItZnJlZSBmdW5jdGlvbiB3aWxsIHdha2UgdXAgdGhpcyBjb2RlLCBidXQgdGhlIHVyYiBs
aXN0IHNob3VsZCBiZSANCmVtcHR5IHRoZW4uIFNob3VsZCB3ZSB1cGRhdGUgdGhlIGNvbmRp
dGlvbiB0byBzb21ldGhpbmcgbGlrZSANCid1ZGwtPnVyYnMuY291bnQgJiYgIWxpc3RfZW1w
dHkoKScgPw0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+ICAgCQkJCQkgdWRsLT51cmJz
LmxvY2ssIHRpbWVvdXQpKSB7DQo+ICAgCQlEUk1fSU5GTygid2FpdCBmb3IgdXJiIGludGVy
cnVwdGVkOiBhdmFpbGFibGU6ICVkXG4iLA0KPiAgIAkJCSB1ZGwtPnVyYnMuYXZhaWxhYmxl
KTsNCj4gLQkJZ290byB1bmxvY2s7DQo+ICsJCXJldHVybiBOVUxMOw0KPiAgIAl9DQo+ICAg
DQo+ICAgCXVub2RlID0gbGlzdF9maXJzdF9lbnRyeSgmdWRsLT51cmJzLmxpc3QsIHN0cnVj
dCB1cmJfbm9kZSwgZW50cnkpOw0KPiAgIAlsaXN0X2RlbF9pbml0KCZ1bm9kZS0+ZW50cnkp
Ow0KPiAgIAl1ZGwtPnVyYnMuYXZhaWxhYmxlLS07DQo+ICAgDQo+IC11bmxvY2s6DQo+IC0J
c3Bpbl91bmxvY2tfaXJxKCZ1ZGwtPnVyYnMubG9jayk7DQo+ICAgCXJldHVybiB1bm9kZSA/
IHVub2RlLT51cmIgOiBOVUxMOw0KPiAgIH0NCj4gICANCj4gKyNkZWZpbmUgR0VUX1VSQl9U
SU1FT1VUCUhaDQo+ICtzdHJ1Y3QgdXJiICp1ZGxfZ2V0X3VyYihzdHJ1Y3QgZHJtX2Rldmlj
ZSAqZGV2KQ0KPiArew0KPiArCXN0cnVjdCB1ZGxfZGV2aWNlICp1ZGwgPSB0b191ZGwoZGV2
KTsNCj4gKwlzdHJ1Y3QgdXJiICp1cmI7DQo+ICsNCj4gKwlzcGluX2xvY2tfaXJxKCZ1ZGwt
PnVyYnMubG9jayk7DQo+ICsJdXJiID0gX191ZGxfZ2V0X3VyYih1ZGwsIEdFVF9VUkJfVElN
RU9VVCk7DQo+ICsJc3Bpbl91bmxvY2tfaXJxKCZ1ZGwtPnVyYnMubG9jayk7DQo+ICsJcmV0
dXJuIHVyYjsNCj4gK30NCj4gKw0KPiAgIGludCB1ZGxfc3VibWl0X3VyYihzdHJ1Y3QgZHJt
X2RldmljZSAqZGV2LCBzdHJ1Y3QgdXJiICp1cmIsIHNpemVfdCBsZW4pDQo+ICAgew0KPiAg
IAlzdHJ1Y3QgdWRsX2RldmljZSAqdWRsID0gdG9fdWRsKGRldik7DQoNCi0tIA0KVGhvbWFz
IFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUg
U29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJn
LCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJl
cjogSXZvIFRvdGV2DQo=

--------------O0FlQpQtIQxi7Fgwuwk8FIM8--

--------------tykqsKa1tBnyipMnwsFI05g1
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMVtDcFAwAAAAAACgkQlh/E3EQov+B5
1Q//euNMVYeGEuQ1QqpB8W/0TefOlS18SgDz56rP7HHCpgOfRDfhvOgOOOv5P65bRr9TFSXBMtAx
+U12FOUBbgXVpFfUovDkiW0nrgh3PxRplThy5rbwx0lqR00GYsUqYuCnRu4RYuBlnnE4qFfQTYJb
1Ljr+mE6GPVhexqEiREnZX1gp1nPinXVtxLkEG0r+zo3ff7W5DeSW0IIs7jkcSETL7hoq+QPH7Gg
KIba0wDAnpgXDAigY6JRKEsru2fDjvLL26iV5RyCz7eHAbGRFr8cTNHsqAEE3B0FG0wU6XVUlZsj
0Oh3j0y5zc4Cr16KuAP495F8pnhuxcc4bE66MFFeZbdRJ+uNulLQo1orGNMtaOE+ataD4Gw6ipns
qcbkOKqv00dXcQhb02ZDs6XObuhaEl5zxQ+g75+twVHRUvrKj2wF5okhx3aP4KhUyUGt9I+NyfK2
7jMRAGNErBk5gfLjf0u56YuG3rnGee3gt4qP8lYDbfiAs8KCTwmpp9sXtZJZ2ThZpVrXUzlgCYa3
fQE/9e1xIlxpY1tfR7MfcUWxregqLLptFFIDymaMnfpIQStPMy/VaFsYZIPfWeXZpuxrQdFt7b8E
7/0ji6dSSiiu7E4GBFimQZq7yqUdwFgoWrXqs7xTreIFr8iudCQ6S9HxrNCvkOVNXg57pFj8iS87
vWM=
=eSTD
-----END PGP SIGNATURE-----

--------------tykqsKa1tBnyipMnwsFI05g1--
