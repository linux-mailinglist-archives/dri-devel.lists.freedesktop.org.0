Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 255F36355E1
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 10:26:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0655210E52E;
	Wed, 23 Nov 2022 09:26:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8F8A10E52E
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 09:26:48 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 1D4871F8B4;
 Wed, 23 Nov 2022 09:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1669195607; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fgvRFb/y8GVxVxwdyWF5xbeNbM3dWH9z3cvxEN0I6JI=;
 b=E++XaktYkVt+d8z8RQZ+LOEiiXNplfHExTkg6wx0pEDceXLJ9U+hiOxm1Y5cvRwdM6+P32
 K8pkXq/4SA0OQK/EBV9cSWIaTHXdS4GI/OhuldIbcXz34zGf1nI05zOqOShgt5uuIf/bGs
 uaWiHaKEATqU59yeJP2lmJMfGgTA9R0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1669195607;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fgvRFb/y8GVxVxwdyWF5xbeNbM3dWH9z3cvxEN0I6JI=;
 b=lNRULapQnxGxeayXvzWyfuMyLDmkAt18C5FdLrDnWRsjOWb0XSHo4kl7F0FfpNa8HVklAo
 SAC6hCVf0c57vEBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E879213A37;
 Wed, 23 Nov 2022 09:26:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GKnWN1bnfWOpDwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 23 Nov 2022 09:26:46 +0000
Message-ID: <95c61b48-f22d-c9e0-3864-bc979c28d5a7@suse.de>
Date: Wed, 23 Nov 2022 10:26:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 4/6] drm/gud: Split up gud_flush_work()
Content-Language: en-US
To: noralf@tronnes.org, stable@kernel.org, Dave Airlie <airlied@redhat.com>,
 dri-devel@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 Maxime Ripard <mripard@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>
References: <20221122-gud-shadow-plane-v1-0-9de3afa3383e@tronnes.org>
 <20221122-gud-shadow-plane-v1-4-9de3afa3383e@tronnes.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20221122-gud-shadow-plane-v1-4-9de3afa3383e@tronnes.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------cNfgxTHjdTTYTjhpf8Z1RThE"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------cNfgxTHjdTTYTjhpf8Z1RThE
Content-Type: multipart/mixed; boundary="------------LJYUwGT7QLY21Les7dbWQBNn";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: noralf@tronnes.org, stable@kernel.org, Dave Airlie <airlied@redhat.com>,
 dri-devel@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>,
 Maxime Ripard <mripard@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>
Message-ID: <95c61b48-f22d-c9e0-3864-bc979c28d5a7@suse.de>
Subject: Re: [PATCH 4/6] drm/gud: Split up gud_flush_work()
References: <20221122-gud-shadow-plane-v1-0-9de3afa3383e@tronnes.org>
 <20221122-gud-shadow-plane-v1-4-9de3afa3383e@tronnes.org>
In-Reply-To: <20221122-gud-shadow-plane-v1-4-9de3afa3383e@tronnes.org>

--------------LJYUwGT7QLY21Les7dbWQBNn
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDIyLjExLjIyIHVtIDIxOjU4IHNjaHJpZWIgTm9yYWxmIFRyw7hubmVzIHZpYSBC
NCBTdWJtaXNzaW9uIEVuZHBvaW50Og0KPiBGcm9tOiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFs
ZkB0cm9ubmVzLm9yZz4NCj4gDQo+IEluIHByZXBhcmF0aW9uIGZvciBpbmxpbmluZyBzeW5j
aHJvbm91cyBmbHVzaGluZyBzcGxpdCBvdXQgdGhlIHBhcnQgb2YNCj4gZ3VkX2ZsdXNoX3dv
cmsoKSB0aGF0IGNhbiBiZSBzaGFyZWQgYnkgdGhlIHN5bmMgYW5kIGFzeW5jIGNvZGUgcGF0
aHMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9u
bmVzLm9yZz4NCg0KUmV2aWV3ZWQtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFu
bkBzdXNlLmRlPg0KDQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9ndWQvZ3VkX3BpcGUu
YyB8IDcyICsrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAg
IDEgZmlsZSBjaGFuZ2VkLCAzOSBpbnNlcnRpb25zKCspLCAzMyBkZWxldGlvbnMoLSkNCj4g
DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZ3VkL2d1ZF9waXBlLmMgYi9kcml2
ZXJzL2dwdS9kcm0vZ3VkL2d1ZF9waXBlLmMNCj4gaW5kZXggZmYxMzU4ODE1YWY1Li5kMmFm
OTk0NzQ5NGYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ndWQvZ3VkX3BpcGUu
Yw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZ3VkL2d1ZF9waXBlLmMNCj4gQEAgLTMzMywx
NSArMzMzLDQ5IEBAIHZvaWQgZ3VkX2NsZWFyX2RhbWFnZShzdHJ1Y3QgZ3VkX2RldmljZSAq
Z2RybSkNCj4gICAJZ2RybS0+ZGFtYWdlLnkyID0gMDsNCj4gICB9DQo+ICAgDQo+ICtzdGF0
aWMgdm9pZCBndWRfZmx1c2hfZGFtYWdlKHN0cnVjdCBndWRfZGV2aWNlICpnZHJtLCBzdHJ1
Y3QgZHJtX2ZyYW1lYnVmZmVyICpmYiwNCj4gKwkJCSAgICAgc3RydWN0IGRybV9yZWN0ICpk
YW1hZ2UpDQo+ICt7DQo+ICsJY29uc3Qgc3RydWN0IGRybV9mb3JtYXRfaW5mbyAqZm9ybWF0
Ow0KPiArCXVuc2lnbmVkIGludCBpLCBsaW5lczsNCj4gKwlzaXplX3QgcGl0Y2g7DQo+ICsJ
aW50IHJldDsNCj4gKw0KPiArCWZvcm1hdCA9IGZiLT5mb3JtYXQ7DQo+ICsJaWYgKGZvcm1h
dC0+Zm9ybWF0ID09IERSTV9GT1JNQVRfWFJHQjg4ODggJiYgZ2RybS0+eHJnYjg4ODhfZW11
bGF0aW9uX2Zvcm1hdCkNCj4gKwkJZm9ybWF0ID0gZ2RybS0+eHJnYjg4ODhfZW11bGF0aW9u
X2Zvcm1hdDsNCj4gKw0KPiArCS8qIFNwbGl0IHVwZGF0ZSBpZiBpdCdzIHRvbyBiaWcgKi8N
Cj4gKwlwaXRjaCA9IGRybV9mb3JtYXRfaW5mb19taW5fcGl0Y2goZm9ybWF0LCAwLCBkcm1f
cmVjdF93aWR0aChkYW1hZ2UpKTsNCj4gKwlsaW5lcyA9IGRybV9yZWN0X2hlaWdodChkYW1h
Z2UpOw0KPiArDQo+ICsJaWYgKGdkcm0tPmJ1bGtfbGVuIDwgbGluZXMgKiBwaXRjaCkNCj4g
KwkJbGluZXMgPSBnZHJtLT5idWxrX2xlbiAvIHBpdGNoOw0KPiArDQo+ICsJZm9yIChpID0g
MDsgaSA8IERJVl9ST1VORF9VUChkcm1fcmVjdF9oZWlnaHQoZGFtYWdlKSwgbGluZXMpOyBp
KyspIHsNCj4gKwkJc3RydWN0IGRybV9yZWN0IHJlY3QgPSAqZGFtYWdlOw0KPiArDQo+ICsJ
CXJlY3QueTEgKz0gaSAqIGxpbmVzOw0KPiArCQlyZWN0LnkyID0gbWluX3QodTMyLCByZWN0
LnkxICsgbGluZXMsIGRhbWFnZS0+eTIpOw0KPiArDQo+ICsJCXJldCA9IGd1ZF9mbHVzaF9y
ZWN0KGdkcm0sIGZiLCBmb3JtYXQsICZyZWN0KTsNCj4gKwkJaWYgKHJldCkgew0KPiArCQkJ
aWYgKHJldCAhPSAtRU5PREVWICYmIHJldCAhPSAtRUNPTk5SRVNFVCAmJg0KPiArCQkJICAg
IHJldCAhPSAtRVNIVVRET1dOICYmIHJldCAhPSAtRVBST1RPKQ0KPiArCQkJCWRldl9lcnJf
cmF0ZWxpbWl0ZWQoZmItPmRldi0+ZGV2LA0KPiArCQkJCQkJICAgICJGYWlsZWQgdG8gZmx1
c2ggZnJhbWVidWZmZXI6IGVycm9yPSVkXG4iLCByZXQpOw0KPiArCQkJZ2RybS0+cHJldl9m
bHVzaF9mYWlsZWQgPSB0cnVlOw0KPiArCQkJYnJlYWs7DQo+ICsJCX0NCj4gKwl9DQo+ICt9
DQo+ICsNCj4gICB2b2lkIGd1ZF9mbHVzaF93b3JrKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29y
aykNCj4gICB7DQo+ICAgCXN0cnVjdCBndWRfZGV2aWNlICpnZHJtID0gY29udGFpbmVyX29m
KHdvcmssIHN0cnVjdCBndWRfZGV2aWNlLCB3b3JrKTsNCj4gLQljb25zdCBzdHJ1Y3QgZHJt
X2Zvcm1hdF9pbmZvICpmb3JtYXQ7DQo+ICAgCXN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZi
Ow0KPiAgIAlzdHJ1Y3QgZHJtX3JlY3QgZGFtYWdlOw0KPiAtCXVuc2lnbmVkIGludCBpLCBs
aW5lczsNCj4gLQlpbnQgaWR4LCByZXQgPSAwOw0KPiAtCXNpemVfdCBwaXRjaDsNCj4gKwlp
bnQgaWR4Ow0KPiAgIA0KPiAgIAlpZiAoIWRybV9kZXZfZW50ZXIoJmdkcm0tPmRybSwgJmlk
eCkpDQo+ICAgCQlyZXR1cm47DQo+IEBAIC0zNTYsMzUgKzM5MCw3IEBAIHZvaWQgZ3VkX2Zs
dXNoX3dvcmsoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQ0KPiAgIAlpZiAoIWZiKQ0KPiAg
IAkJZ290byBvdXQ7DQo+ICAgDQo+IC0JZm9ybWF0ID0gZmItPmZvcm1hdDsNCj4gLQlpZiAo
Zm9ybWF0LT5mb3JtYXQgPT0gRFJNX0ZPUk1BVF9YUkdCODg4OCAmJiBnZHJtLT54cmdiODg4
OF9lbXVsYXRpb25fZm9ybWF0KQ0KPiAtCQlmb3JtYXQgPSBnZHJtLT54cmdiODg4OF9lbXVs
YXRpb25fZm9ybWF0Ow0KPiAtDQo+IC0JLyogU3BsaXQgdXBkYXRlIGlmIGl0J3MgdG9vIGJp
ZyAqLw0KPiAtCXBpdGNoID0gZHJtX2Zvcm1hdF9pbmZvX21pbl9waXRjaChmb3JtYXQsIDAs
IGRybV9yZWN0X3dpZHRoKCZkYW1hZ2UpKTsNCj4gLQlsaW5lcyA9IGRybV9yZWN0X2hlaWdo
dCgmZGFtYWdlKTsNCj4gLQ0KPiAtCWlmIChnZHJtLT5idWxrX2xlbiA8IGxpbmVzICogcGl0
Y2gpDQo+IC0JCWxpbmVzID0gZ2RybS0+YnVsa19sZW4gLyBwaXRjaDsNCj4gLQ0KPiAtCWZv
ciAoaSA9IDA7IGkgPCBESVZfUk9VTkRfVVAoZHJtX3JlY3RfaGVpZ2h0KCZkYW1hZ2UpLCBs
aW5lcyk7IGkrKykgew0KPiAtCQlzdHJ1Y3QgZHJtX3JlY3QgcmVjdCA9IGRhbWFnZTsNCj4g
LQ0KPiAtCQlyZWN0LnkxICs9IGkgKiBsaW5lczsNCj4gLQkJcmVjdC55MiA9IG1pbl90KHUz
MiwgcmVjdC55MSArIGxpbmVzLCBkYW1hZ2UueTIpOw0KPiAtDQo+IC0JCXJldCA9IGd1ZF9m
bHVzaF9yZWN0KGdkcm0sIGZiLCBmb3JtYXQsICZyZWN0KTsNCj4gLQkJaWYgKHJldCkgew0K
PiAtCQkJaWYgKHJldCAhPSAtRU5PREVWICYmIHJldCAhPSAtRUNPTk5SRVNFVCAmJg0KPiAt
CQkJICAgIHJldCAhPSAtRVNIVVRET1dOICYmIHJldCAhPSAtRVBST1RPKQ0KPiAtCQkJCWRl
dl9lcnJfcmF0ZWxpbWl0ZWQoZmItPmRldi0+ZGV2LA0KPiAtCQkJCQkJICAgICJGYWlsZWQg
dG8gZmx1c2ggZnJhbWVidWZmZXI6IGVycm9yPSVkXG4iLCByZXQpOw0KPiAtCQkJZ2RybS0+
cHJldl9mbHVzaF9mYWlsZWQgPSB0cnVlOw0KPiAtCQkJYnJlYWs7DQo+IC0JCX0NCj4gLQ0K
PiAtCQlnZHJtLT5wcmV2X2ZsdXNoX2ZhaWxlZCA9IGZhbHNlOw0KPiAtCX0NCj4gKwlndWRf
Zmx1c2hfZGFtYWdlKGdkcm0sIGZiLCAmZGFtYWdlKTsNCj4gICANCj4gICAJZHJtX2ZyYW1l
YnVmZmVyX3B1dChmYik7DQo+ICAgb3V0Og0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFu
bg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMg
R2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkN
CihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90
ZXYNCg==

--------------LJYUwGT7QLY21Les7dbWQBNn--

--------------cNfgxTHjdTTYTjhpf8Z1RThE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmN951YFAwAAAAAACgkQlh/E3EQov+An
Wg//eGmR2MHTWySqffU1IkHXgKwuKAKE9mMRYDcL8ZtRXlxVY3GqblVoPp1COLTytfl2Qz6RRoWH
dI00AMO/97z+7WPJOvdoLPZSuyfgQTTTNsIQORNYQiEAtd+85rP00OxIUC4Ug7XR7xhWu+Ar5CM9
z/BvDH3XWqGN7jZSLYSU+t9daKEZadojypdVSVWQPCm4b0fpc0NOO6eHumAy0Hq937VevhvHTg7t
tjVIUX8erAA1ErKu7laLth4XAqfcpaW2bEa8l6wEhLm8wbzGJ2HVXJGnZjECKTqQGCOwFUp34w+y
JSZ77d1r56ngJdlCKiOUoUdH0lGb6fuRnlmVO/Q9eOn4drEn+pYdizF2tfa6rmW5INgSQ2lMfUci
0v2thdBkseyNyhaxl20wp7V3VY9JsjohhMlOLcIePuxE+vMBSqPC3Z6V9K2W4gsvcYgAVp4WYSi8
qKQfdMUCCfow5F18RzO7GR61BRm7HAGppau02jhn6lX/Y+9in+iYPDPyI20ytOALZdT+scbBs63a
6CIx7+xYwt7A58dNXmbnPQspk/Piqoiq42RW3rldSOVB7lulmVm/eVdQnAwJhTIso5JGD2s8p+hY
isL1Jr6je7ESCRj51fEwojoUm7jGzqJCvl49uYLYA9AxIKAuqj/mh0q5AicG3iEeeTMhbPaV3oTG
3qs=
=e/Gm
-----END PGP SIGNATURE-----

--------------cNfgxTHjdTTYTjhpf8Z1RThE--
