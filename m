Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2694C1C6B
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 20:40:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E8B110EB36;
	Wed, 23 Feb 2022 19:40:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ACA910EB32
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 19:40:31 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5B4711F37E;
 Wed, 23 Feb 2022 19:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1645645230; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TQdQR1QsAdjXQt7JrztOQCAiqY/72PRrLZCvRbOPvx4=;
 b=rrpPvvwSNaX2d3E3XFt2An2C3vLZSbZVBBPMDY1Bm6yl53DFb/ha44NwYCSJAX+IRkZg7k
 qmvxzc7eHKRMqPipy2HNoxVqD4DlBGkXWO/FAOEmhlGuCjSWFq7YMFpdyz+oNDLZP3GUPc
 I8gdPl02MY0fWj//2ZAuqeuIkF6//OQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1645645230;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=TQdQR1QsAdjXQt7JrztOQCAiqY/72PRrLZCvRbOPvx4=;
 b=HTUQVlSBN0r6md2wxMYD7yoeAOhwp5KhshuyTYxnH5V3FJQSFHAy2Pjctk0P55QW8Bj8JQ
 FyH6CwobiKghHoBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2777F13C7B;
 Wed, 23 Feb 2022 19:40:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id rgn6B66NFmKPUwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 23 Feb 2022 19:40:30 +0000
Message-ID: <6335cf1d-41fc-1854-3916-2cdbd1337c1c@suse.de>
Date: Wed, 23 Feb 2022 20:40:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] drm/repaper: Use format helper for xrgb8888 to monochrome
 conversion
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20220223193735.213185-1-javierm@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220223193735.213185-1-javierm@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------p181beNo2AE1YkJcylZbk1Z6"
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
Cc: David Airlie <airlied@linux.ie>,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------p181beNo2AE1YkJcylZbk1Z6
Content-Type: multipart/mixed; boundary="------------JCQH3f06HLrW0ZxwNUZvbO0D";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <6335cf1d-41fc-1854-3916-2cdbd1337c1c@suse.de>
Subject: Re: [PATCH] drm/repaper: Use format helper for xrgb8888 to monochrome
 conversion
References: <20220223193735.213185-1-javierm@redhat.com>
In-Reply-To: <20220223193735.213185-1-javierm@redhat.com>

--------------JCQH3f06HLrW0ZxwNUZvbO0D
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjMuMDIuMjIgdW0gMjA6Mzcgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IFRoZXJlIGlzIG5vdyBhIGRybV9mYl94cmdiODg4OF90b19tb25vX3JldmVy
c2VkKCkgaGVscGVyIGZ1bmN0aW9uIHRvIGRvDQo+IGZvcm1hdCBjb252ZXJzaW9uIGZyb20g
WFJHQjg4ODggdG8gcmV2ZXJzZWQgbW9ub2Nocm9tZS4NCj4gDQo+IFVzZSB0aGF0IGhlbHBl
ciBhbmQgcmVtb3ZlIHRoZSBvcGVuIGNvZGVkIHZlcnNpb24gaW4gdGhlIHJlcGFwZXIgZHJp
dmVyLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSmF2aWVyIE1hcnRpbmV6IENhbmlsbGFzIDxq
YXZpZXJtQHJlZGhhdC5jb20+DQoNCkxvb2tzIGdvb2QuDQoNCkFja2VkLWJ5OiBUaG9tYXMg
WmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCg0KPiAtLS0NCj4gDQo+IFRoaXMg
d2FzIG9ubHkgYnVpbHQgdGVzdGVkIGJlY2F1c2UgSSBkb24ndCBoYXZlIGFjY2VzcyB0byB0
aGUgaGFyZHdhcmUuDQo+IA0KPiAgIGRyaXZlcnMvZ3B1L2RybS90aW55L3JlcGFwZXIuYyB8
IDI0ICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMjMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3RpbnkvcmVwYXBlci5jIGIvZHJpdmVycy9ncHUvZHJtL3RpbnkvcmVwYXBl
ci5jDQo+IGluZGV4IDk3YTc3NWM0OGNlYS4uNWM3NGUyMzZiMTZkIDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vdGlueS9yZXBhcGVyLmMNCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3RpbnkvcmVwYXBlci5jDQo+IEBAIC01MDgsMjYgKzUwOCw2IEBAIHN0YXRpYyB2b2lk
IHJlcGFwZXJfZ2V0X3RlbXBlcmF0dXJlKHN0cnVjdCByZXBhcGVyX2VwZCAqZXBkKQ0KPiAg
IAllcGQtPmZhY3RvcmVkX3N0YWdlX3RpbWUgPSBlcGQtPnN0YWdlX3RpbWUgKiBmYWN0b3Ix
MHggLyAxMDsNCj4gICB9DQo+ICAgDQo+IC1zdGF0aWMgdm9pZCByZXBhcGVyX2dyYXk4X3Rv
X21vbm9fcmV2ZXJzZWQodTggKmJ1ZiwgdTMyIHdpZHRoLCB1MzIgaGVpZ2h0KQ0KPiAtew0K
PiAtCXU4ICpncmF5OCA9IGJ1ZiwgKm1vbm8gPSBidWY7DQo+IC0JaW50IHksIHhiLCBpOw0K
PiAtDQo+IC0JZm9yICh5ID0gMDsgeSA8IGhlaWdodDsgeSsrKQ0KPiAtCQlmb3IgKHhiID0g
MDsgeGIgPCB3aWR0aCAvIDg7IHhiKyspIHsNCj4gLQkJCXU4IGJ5dGUgPSAweDAwOw0KPiAt
DQo+IC0JCQlmb3IgKGkgPSAwOyBpIDwgODsgaSsrKSB7DQo+IC0JCQkJaW50IHggPSB4YiAq
IDggKyBpOw0KPiAtDQo+IC0JCQkJYnl0ZSA+Pj0gMTsNCj4gLQkJCQlpZiAoZ3JheThbeSAq
IHdpZHRoICsgeF0gPj4gNykNCj4gLQkJCQkJYnl0ZSB8PSBCSVQoNyk7DQo+IC0JCQl9DQo+
IC0JCQkqbW9ubysrID0gYnl0ZTsNCj4gLQkJfQ0KPiAtfQ0KPiAtDQo+ICAgc3RhdGljIGlu
dCByZXBhcGVyX2ZiX2RpcnR5KHN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiKQ0KPiAgIHsN
Cj4gICAJc3RydWN0IGRybV9nZW1fY21hX29iamVjdCAqY21hX29iaiA9IGRybV9mYl9jbWFf
Z2V0X2dlbV9vYmooZmIsIDApOw0KPiBAQCAtNTYwLDEyICs1NDAsMTAgQEAgc3RhdGljIGlu
dCByZXBhcGVyX2ZiX2RpcnR5KHN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiKQ0KPiAgIAlp
ZiAocmV0KQ0KPiAgIAkJZ290byBvdXRfZnJlZTsNCj4gICANCj4gLQlkcm1fZmJfeHJnYjg4
ODhfdG9fZ3JheTgoYnVmLCAwLCBjbWFfb2JqLT52YWRkciwgZmIsICZjbGlwKTsNCj4gKwlk
cm1fZmJfeHJnYjg4ODhfdG9fbW9ub19yZXZlcnNlZChidWYsIDAsIGNtYV9vYmotPnZhZGRy
LCBmYiwgJmNsaXApOw0KPiAgIA0KPiAgIAlkcm1fZ2VtX2ZiX2VuZF9jcHVfYWNjZXNzKGZi
LCBETUFfRlJPTV9ERVZJQ0UpOw0KPiAgIA0KPiAtCXJlcGFwZXJfZ3JheThfdG9fbW9ub19y
ZXZlcnNlZChidWYsIGZiLT53aWR0aCwgZmItPmhlaWdodCk7DQo+IC0NCj4gICAJaWYgKGVw
ZC0+cGFydGlhbCkgew0KPiAgIAkJcmVwYXBlcl9mcmFtZV9kYXRhX3JlcGVhdChlcGQsIGJ1
ZiwgZXBkLT5jdXJyZW50X2ZyYW1lLA0KPiAgIAkJCQkJICBSRVBBUEVSX05PUk1BTCk7DQoN
Ci0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNV
U0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0
MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNj
aMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------JCQH3f06HLrW0ZxwNUZvbO0D--

--------------p181beNo2AE1YkJcylZbk1Z6
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmIWja0FAwAAAAAACgkQlh/E3EQov+DN
/A//VmgJS8XZJOZsaPRnxci5vIObjbmuEH4GNgjFfB7ewBlvBtw7v0wAijgaVuExffmihv9KNaB8
6QjQVXrBNDI+LUHMZ0YP/66KiynM54pQLA5z0dsYonsbx4Jx1OjKwvJV9KDXGdJW//23Y9H9qHy5
0T/4myWJ2vMxybo8udsU9DTipNhvnHtQl8BYn3LGJAZ7UCrhYZLf+6/HRAZURRMA7+B5gh9ibE1J
xhxJMjpEBJCYyJetKfskHlx+ov/UAVjnjfTa2RaojwqDyT5FDIU88+jn/jT5hOLfAuJ7AvuyY3iE
rUAfmk2ZMBq3h4nfOHhYT5e8jP9JWb5DDJ4Nl0+yBW+xYBwKIXeNTNDUZPO0VMevC3yiI4iSm4cH
eOnfaNCTid5pJX+ZSqJQd8AOp83TnqClZ+ZrpDzlUEj7r7QrG0hxLNpA0l5+HBNwivgJYdQ8/HBC
wtGRJFM1o75VYfq4j877WUOp69DRQYsry4navU/rguokU+teAhnrhE/e2zKUffLYlR5X3R1HkDGS
U6oq7VyO4+BNoXPD4ioQoBZMB8ESJBd6gB1L9vL6kfzJZSM3MeFBuBDgN3GF2yx+gy07gJ/NKfQv
KzAELMj7J27HBQ2eigUTADD6xTdeDS/AWS8s0LWL8NYBVkbdQZjMZ9NLcGPsP8ep+8oWr98Nul8A
mfg=
=j+JC
-----END PGP SIGNATURE-----

--------------p181beNo2AE1YkJcylZbk1Z6--
