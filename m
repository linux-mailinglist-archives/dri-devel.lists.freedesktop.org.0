Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F36A95ACD67
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 10:07:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A292910E1FE;
	Mon,  5 Sep 2022 08:07:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFF3210E1FE
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 08:07:11 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 55DF05FCC1;
 Mon,  5 Sep 2022 08:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662365230; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/NJNYr1ZZWkZlS/CIb8/BdZir7eBfNDShQAVYsGVnXI=;
 b=nTvaI4ZX47yHiHNtrHtVq/Nr74mNkIXIIYir6SOO/utoy0sHnDqSem6xWGa9RKed/CDnzS
 160+/R4q0SoGUCC0s2Cz/uIhaptLxxzMtfB7Aacr9jcomCFcWgsjeVo6uvdWFYYFUU6tlG
 Crl7yQdnIwJzczIWy8uPdVffhJtajtM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662365230;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/NJNYr1ZZWkZlS/CIb8/BdZir7eBfNDShQAVYsGVnXI=;
 b=yzEFg+8h1U7/Nu7qxMaf40eXxHmDMortzox6KS8RptzyKBqkSiYZj5UEO3iKKWf0w7ADql
 xv06lVN/hNeyvpAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3E04913A66;
 Mon,  5 Sep 2022 08:07:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sHs8Di6uFWP1AQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 05 Sep 2022 08:07:10 +0000
Message-ID: <4c9d7300-66b4-555a-84dd-b070664144cf@suse.de>
Date: Mon, 5 Sep 2022 10:07:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 04/12] Revert "drm/udl: Kill pending URBs at suspend and
 disconnect"
To: Takashi Iwai <tiwai@suse.de>
References: <20220816153655.27526-1-tiwai@suse.de>
 <20220816153655.27526-5-tiwai@suse.de>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220816153655.27526-5-tiwai@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------LPSQ13HLN6EPEyDgJ9wTLDk0"
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
--------------LPSQ13HLN6EPEyDgJ9wTLDk0
Content-Type: multipart/mixed; boundary="------------0pGCk0q5qI59oUFsYIn35qX3";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <4c9d7300-66b4-555a-84dd-b070664144cf@suse.de>
Subject: Re: [PATCH 04/12] Revert "drm/udl: Kill pending URBs at suspend and
 disconnect"
References: <20220816153655.27526-1-tiwai@suse.de>
 <20220816153655.27526-5-tiwai@suse.de>
In-Reply-To: <20220816153655.27526-5-tiwai@suse.de>

--------------0pGCk0q5qI59oUFsYIn35qX3
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTYuMDguMjIgdW0gMTc6MzYgc2NocmllYiBUYWthc2hpIEl3YWk6DQo+IFRo
aXMgcmV2ZXJ0cyB0aGUgcmVjZW50IGZpeCBjb21taXQNCj4gICAgZTI1ZDU5NTQyNjRkICgi
ZHJtL3VkbDogS2lsbCBwZW5kaW5nIFVSQnMgYXQgc3VzcGVuZCBhbmQgZGlzY29ubmVjdCIp
DQo+IGFzIGl0IHR1cm5lZCBvdXQgdG8gbGVhZCB0byBwb3RlbnRpYWwgaGFuZ3VwIGF0IGEg
ZGlzY29ubmVjdGlvbiwgYW5kDQo+IGl0IGRvZXNuJ3QgaGVscCBtdWNoIGZvciBzdXNwZW5k
L3Jlc3VtZSBwcm9ibGVtLCBlaXRoZXIuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBUYWthc2hp
IEl3YWkgPHRpd2FpQHN1c2UuZGU+DQoNCkFja2VkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8
dHppbW1lcm1hbm5Ac3VzZS5kZT4NCg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vdWRs
L3VkbF9kcnYuaCAgICAgfCAgMiAtLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX21h
aW4uYyAgICB8IDI1ICsrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4gICBkcml2ZXJzL2dw
dS9kcm0vdWRsL3VkbF9tb2Rlc2V0LmMgfCAgMiAtLQ0KPiAgIDMgZmlsZXMgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCAyNiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9kcnYuaCBiL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRs
X2Rydi5oDQo+IGluZGV4IDM3YzE0YjBmZjFmYy4uNTkyM2QyZTAyYmM4IDEwMDY0NA0KPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9kcnYuaA0KPiArKysgYi9kcml2ZXJzL2dw
dS9kcm0vdWRsL3VkbF9kcnYuaA0KPiBAQCAtMzksNyArMzksNiBAQCBzdHJ1Y3QgdXJiX25v
ZGUgew0KPiAgIA0KPiAgIHN0cnVjdCB1cmJfbGlzdCB7DQo+ICAgCXN0cnVjdCBsaXN0X2hl
YWQgbGlzdDsNCj4gLQlzdHJ1Y3QgbGlzdF9oZWFkIGluX2ZsaWdodDsNCj4gICAJc3Bpbmxv
Y2tfdCBsb2NrOw0KPiAgIAl3YWl0X3F1ZXVlX2hlYWRfdCBzbGVlcDsNCj4gICAJaW50IGF2
YWlsYWJsZTsNCj4gQEAgLTg1LDcgKzg0LDYgQEAgc3RhdGljIGlubGluZSBzdHJ1Y3QgdXJi
ICp1ZGxfZ2V0X3VyYihzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQ0KPiAgIA0KPiAgIGludCB1
ZGxfc3VibWl0X3VyYihzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCBzdHJ1Y3QgdXJiICp1cmIs
IHNpemVfdCBsZW4pOw0KPiAgIGludCB1ZGxfc3luY19wZW5kaW5nX3VyYnMoc3RydWN0IGRy
bV9kZXZpY2UgKmRldik7DQo+IC12b2lkIHVkbF9raWxsX3BlbmRpbmdfdXJicyhzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGV2KTsNCj4gICB2b2lkIHVkbF91cmJfY29tcGxldGlvbihzdHJ1Y3Qg
dXJiICp1cmIpOw0KPiAgIA0KPiAgIGludCB1ZGxfaW5pdChzdHJ1Y3QgdWRsX2RldmljZSAq
dWRsKTsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX21haW4uYyBi
L2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX21haW4uYw0KPiBpbmRleCA3ZDFlNmJiYzE2NWMu
LmE5ZjZiNzEwYjI1NCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxf
bWFpbi5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX21haW4uYw0KPiBAQCAt
MTM1LDcgKzEzNSw3IEBAIHZvaWQgdWRsX3VyYl9jb21wbGV0aW9uKHN0cnVjdCB1cmIgKnVy
YikNCj4gICAJdXJiLT50cmFuc2Zlcl9idWZmZXJfbGVuZ3RoID0gdWRsLT51cmJzLnNpemU7
IC8qIHJlc2V0IHRvIGFjdHVhbCAqLw0KPiAgIA0KPiAgIAlzcGluX2xvY2tfaXJxc2F2ZSgm
dWRsLT51cmJzLmxvY2ssIGZsYWdzKTsNCj4gLQlsaXN0X21vdmUoJnVub2RlLT5lbnRyeSwg
JnVkbC0+dXJicy5saXN0KTsNCj4gKwlsaXN0X2FkZF90YWlsKCZ1bm9kZS0+ZW50cnksICZ1
ZGwtPnVyYnMubGlzdCk7DQo+ICAgCXVkbC0+dXJicy5hdmFpbGFibGUrKzsNCj4gICAJc3Bp
bl91bmxvY2tfaXJxcmVzdG9yZSgmdWRsLT51cmJzLmxvY2ssIGZsYWdzKTsNCj4gICANCj4g
QEAgLTE4MCw3ICsxODAsNiBAQCBzdGF0aWMgaW50IHVkbF9hbGxvY191cmJfbGlzdChzdHJ1
Y3QgZHJtX2RldmljZSAqZGV2LCBpbnQgY291bnQsIHNpemVfdCBzaXplKQ0KPiAgIHJldHJ5
Og0KPiAgIAl1ZGwtPnVyYnMuc2l6ZSA9IHNpemU7DQo+ICAgCUlOSVRfTElTVF9IRUFEKCZ1
ZGwtPnVyYnMubGlzdCk7DQo+IC0JSU5JVF9MSVNUX0hFQUQoJnVkbC0+dXJicy5pbl9mbGln
aHQpOw0KPiAgIA0KPiAgIAlpbml0X3dhaXRxdWV1ZV9oZWFkKCZ1ZGwtPnVyYnMuc2xlZXAp
Ow0KPiAgIAl1ZGwtPnVyYnMuY291bnQgPSAwOw0KPiBAQCAtMjQ3LDcgKzI0Niw3IEBAIHN0
cnVjdCB1cmIgKnVkbF9nZXRfdXJiX3RpbWVvdXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwg
bG9uZyB0aW1lb3V0KQ0KPiAgIAl9DQo+ICAgDQo+ICAgCXVub2RlID0gbGlzdF9maXJzdF9l
bnRyeSgmdWRsLT51cmJzLmxpc3QsIHN0cnVjdCB1cmJfbm9kZSwgZW50cnkpOw0KPiAtCWxp
c3RfbW92ZSgmdW5vZGUtPmVudHJ5LCAmdWRsLT51cmJzLmluX2ZsaWdodCk7DQo+ICsJbGlz
dF9kZWxfaW5pdCgmdW5vZGUtPmVudHJ5KTsNCj4gICAJdWRsLT51cmJzLmF2YWlsYWJsZS0t
Ow0KPiAgIA0KPiAgIHVubG9jazoNCj4gQEAgLTI4MSw3ICsyODAsNyBAQCBpbnQgdWRsX3N5
bmNfcGVuZGluZ191cmJzKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpDQo+ICAgCXNwaW5fbG9j
a19pcnEoJnVkbC0+dXJicy5sb2NrKTsNCj4gICAJLyogMiBzZWNvbmRzIGFzIGEgc2FuZSB0
aW1lb3V0ICovDQo+ICAgCWlmICghd2FpdF9ldmVudF9sb2NrX2lycV90aW1lb3V0KHVkbC0+
dXJicy5zbGVlcCwNCj4gLQkJCQkJIGxpc3RfZW1wdHkoJnVkbC0+dXJicy5pbl9mbGlnaHQp
LA0KPiArCQkJCQkgdWRsLT51cmJzLmF2YWlsYWJsZSA9PSB1ZGwtPnVyYnMuY291bnQsDQo+
ICAgCQkJCQkgdWRsLT51cmJzLmxvY2ssDQo+ICAgCQkJCQkgbXNlY3NfdG9famlmZmllcygy
MDAwKSkpDQo+ICAgCQlyZXQgPSAtRVRJTUVET1VUOw0KPiBAQCAtMjg5LDIzICsyODgsNiBA
QCBpbnQgdWRsX3N5bmNfcGVuZGluZ191cmJzKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpDQo+
ICAgCXJldHVybiByZXQ7DQo+ICAgfQ0KPiAgIA0KPiAtLyoga2lsbCBwZW5kaW5nIFVSQnMg
Ki8NCj4gLXZvaWQgdWRsX2tpbGxfcGVuZGluZ191cmJzKHN0cnVjdCBkcm1fZGV2aWNlICpk
ZXYpDQo+IC17DQo+IC0Jc3RydWN0IHVkbF9kZXZpY2UgKnVkbCA9IHRvX3VkbChkZXYpOw0K
PiAtCXN0cnVjdCB1cmJfbm9kZSAqdW5vZGU7DQo+IC0NCj4gLQlzcGluX2xvY2tfaXJxKCZ1
ZGwtPnVyYnMubG9jayk7DQo+IC0Jd2hpbGUgKCFsaXN0X2VtcHR5KCZ1ZGwtPnVyYnMuaW5f
ZmxpZ2h0KSkgew0KPiAtCQl1bm9kZSA9IGxpc3RfZmlyc3RfZW50cnkoJnVkbC0+dXJicy5p
bl9mbGlnaHQsDQo+IC0JCQkJCSBzdHJ1Y3QgdXJiX25vZGUsIGVudHJ5KTsNCj4gLQkJc3Bp
bl91bmxvY2tfaXJxKCZ1ZGwtPnVyYnMubG9jayk7DQo+IC0JCXVzYl9raWxsX3VyYih1bm9k
ZS0+dXJiKTsNCj4gLQkJc3Bpbl9sb2NrX2lycSgmdWRsLT51cmJzLmxvY2spOw0KPiAtCX0N
Cj4gLQlzcGluX3VubG9ja19pcnEoJnVkbC0+dXJicy5sb2NrKTsNCj4gLX0NCj4gLQ0KPiAg
IGludCB1ZGxfaW5pdChzdHJ1Y3QgdWRsX2RldmljZSAqdWRsKQ0KPiAgIHsNCj4gICAJc3Ry
dWN0IGRybV9kZXZpY2UgKmRldiA9ICZ1ZGwtPmRybTsNCj4gQEAgLTM1NCw3ICszMzYsNiBA
QCBpbnQgdWRsX2Ryb3BfdXNiKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpDQo+ICAgew0KPiAg
IAlzdHJ1Y3QgdWRsX2RldmljZSAqdWRsID0gdG9fdWRsKGRldik7DQo+ICAgDQo+IC0JdWRs
X2tpbGxfcGVuZGluZ191cmJzKGRldik7DQo+ICAgCXVkbF9mcmVlX3VyYl9saXN0KGRldik7
DQo+ICAgCXB1dF9kZXZpY2UodWRsLT5kbWFkZXYpOw0KPiAgIAl1ZGwtPmRtYWRldiA9IE5V
TEw7DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9tb2Rlc2V0LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9tb2Rlc2V0LmMNCj4gaW5kZXggMTg3YWJhMmQ3
ODI1Li5jMzRkNTY0NzczYTMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS91ZGwv
dWRsX21vZGVzZXQuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9tb2Rlc2V0
LmMNCj4gQEAgLTM5OCw4ICszOTgsNiBAQCB1ZGxfc2ltcGxlX2Rpc3BsYXlfcGlwZV9kaXNh
YmxlKHN0cnVjdCBkcm1fc2ltcGxlX2Rpc3BsYXlfcGlwZSAqcGlwZSkNCj4gICAJc3RydWN0
IHVyYiAqdXJiOw0KPiAgIAljaGFyICpidWY7DQo+ICAgDQo+IC0JdWRsX2tpbGxfcGVuZGlu
Z191cmJzKGRldik7DQo+IC0NCj4gICAJdXJiID0gdWRsX2dldF91cmIoZGV2KTsNCj4gICAJ
aWYgKCF1cmIpDQo+ICAgCQlyZXR1cm47DQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdy
YXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1h
bnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJC
IDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=


--------------0pGCk0q5qI59oUFsYIn35qX3--

--------------LPSQ13HLN6EPEyDgJ9wTLDk0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMVri0FAwAAAAAACgkQlh/E3EQov+BZ
lRAAps71lhwY+FMEe+d8OdFbtnYP4CzCQPpz6/0QZEDV6oJtGuDjp+VrnKwGbi3cCrBcWrcYB/4k
jbEEbhYqd8Siec69Dqu0syoK73ruKa5ODwbPatL3eNrSZRkA6vL07ooRf2HFokqka2591I4h4kl5
IB3dI+Tn90uLTGEHx0Didlc7EZNlNGIXKg21mFwWgYOnOn6kK516NGxrnqcQWjia9TFda2osw3Mq
w61p9ObIwmT4B5EBYfEtqkT0eHo/GL5MmekbsZ1L08jwIeDw5ic6quRuKCn4RjbU8spkH5Wnq6Xm
QatC88jYi6DkGi47jncvBGRxtxS6gAHiPY+zlnM6v4xGIiaqUMLJRYrLeP5ic0RZ7IwR7l7xL8ob
V5JNZD9I/QI5E/xGV6AjKZLRpjGXTOwnZ1RsOtj3IOjSaGQDA/u7diDJdC1mvPkYn4mG4TUR2GXW
Bkl/A6f56caG5jij3FxtUxIQF4n6PpBr6pREF1sizN0jdEeIpyDT5mhX4ys1FqlVI6hRq6r1UDlm
tFA+x27qPsKJQ0/HuAqa/OcoN9k37Cm/jt1dnjUqqmUnZMjRLwlU1Zs7XfTUvK1sLOEHczRkimCp
h2izLHY6NRqXQD+C0p+A78JxSPXydkDzKun1FnSkbUWR4TStCi7ud7srStmZolvtzU3v3wNNKpvc
HEM=
=5TmK
-----END PGP SIGNATURE-----

--------------LPSQ13HLN6EPEyDgJ9wTLDk0--
