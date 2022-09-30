Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD495F0660
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 10:26:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C48CF10EBAE;
	Fri, 30 Sep 2022 08:26:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE9C710EBAE
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 08:26:04 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7A5511F8C9;
 Fri, 30 Sep 2022 08:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1664526363; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XG1j7h2Rqb+uAeDqhDWqB/3siS41xWqvoriAkKn2zts=;
 b=YzDpp75v31ouun7649trIpyXOlwz9q4rBaVAkuKqYIDjuwNzckZDw7PE7c/GWsEk0+MtGW
 FX6QLoMf5PB/qSL/ELvuNm15ehNQhaocO4A7T9RPEshgj3JPxsDuHQY6zfwWyzpZXMRAU0
 120xge8RG8xu04IT9sAgjXgZ7wi3Bvc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1664526363;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XG1j7h2Rqb+uAeDqhDWqB/3siS41xWqvoriAkKn2zts=;
 b=ofi+euSNhRKilIzjS9Hy2w6CrqGyQrzF7exWXre1/inonrfRJ89ZFoFuwZg/Bjkeg7qpCz
 XnuY1N+g/i3RVnDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5EB7513776;
 Fri, 30 Sep 2022 08:26:03 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id BrITFhuoNmOcQgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 30 Sep 2022 08:26:03 +0000
Message-ID: <a72d4736-74e1-1485-e952-f39909d94fbc@suse.de>
Date: Fri, 30 Sep 2022 10:26:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] drm/ssd130x: Iterate over damage clips instead of using a
 merged rect
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20220930080123.2441629-1-javierm@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220930080123.2441629-1-javierm@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0s57s0R9h03VUUATRyaHTiv0"
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
Cc: David Airlie <airlied@linux.ie>, Jocelyn Falempe <jfalempe@redhat.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0s57s0R9h03VUUATRyaHTiv0
Content-Type: multipart/mixed; boundary="------------fFNulouk5SvXp2wSZxoZD0Cx";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: Jocelyn Falempe <jfalempe@redhat.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org
Message-ID: <a72d4736-74e1-1485-e952-f39909d94fbc@suse.de>
Subject: Re: [PATCH] drm/ssd130x: Iterate over damage clips instead of using a
 merged rect
References: <20220930080123.2441629-1-javierm@redhat.com>
In-Reply-To: <20220930080123.2441629-1-javierm@redhat.com>

--------------fFNulouk5SvXp2wSZxoZD0Cx
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMzAuMDkuMjIgdW0gMTA6MDEgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IFRoZSBkcm1fYXRvbWljX2hlbHBlcl9kYW1hZ2VfbWVyZ2VkKCkgaGVscGVy
IG1lcmdlcyBhbGwgdGhlIGRhbWFnZSBjbGlwcw0KPiBpbnRvIG9uZSByZWN0YW5nbGUuIElm
IHRoZXJlIGFyZSBtdWx0aXBsZSBkYW1hZ2UgY2xpcHMgdGhhdCBhcmVuJ3QgY2xvc2UNCj4g
dG8gZWFjaCBvdGhlciwgdGhlIHJlc3VsdGluZyByZWN0YW5nbGUgY291bGQgYmUgcXVpdGUg
YmlnLg0KPiANCj4gSW5zdGVhZCBvZiB1c2luZyB0aGF0IGZ1bmN0aW9uIGhlbHBlciwgaXRl
cmF0ZSBvdmVyIGFsbCB0aGUgZGFtYWdlIGNsaXBzDQo+IGFuZCB1cGRhdGUgdGhlbSBvbmUg
Ynkgb25lLg0KPiANCj4gU3VnZ2VzdGVkLWJ5OiBKb2NlbHluIEZhbGVtcGUgPGpmYWxlbXBl
QHJlZGhhdC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEphdmllciBNYXJ0aW5leiBDYW5pbGxh
cyA8amF2aWVybUByZWRoYXQuY29tPg0KPiAtLS0NCj4gDQo+ICAgZHJpdmVycy9ncHUvZHJt
L3NvbG9tb24vc3NkMTMweC5jIHwgMTggKysrKysrKysrKy0tLS0tLS0tDQo+ICAgMSBmaWxl
IGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3NvbG9tb24vc3NkMTMweC5jIGIvZHJpdmVycy9n
cHUvZHJtL3NvbG9tb24vc3NkMTMweC5jDQo+IGluZGV4IGJjNDFhNWFlODEwYS4uMjQyOGYx
ODEzYThkIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vc29sb21vbi9zc2QxMzB4
LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3NvbG9tb24vc3NkMTMweC5jDQo+IEBAIC01
NzgsMjEgKzU3OCwyMyBAQCBzdGF0aWMgdm9pZCBzc2QxMzB4X3ByaW1hcnlfcGxhbmVfaGVs
cGVyX2F0b21pY191cGRhdGUoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsDQo+ICAgCXN0cnVj
dCBkcm1fcGxhbmVfc3RhdGUgKnBsYW5lX3N0YXRlID0gZHJtX2F0b21pY19nZXRfbmV3X3Bs
YW5lX3N0YXRlKHN0YXRlLCBwbGFuZSk7DQo+ICAgCXN0cnVjdCBkcm1fcGxhbmVfc3RhdGUg
Km9sZF9wbGFuZV9zdGF0ZSA9IGRybV9hdG9taWNfZ2V0X29sZF9wbGFuZV9zdGF0ZShzdGF0
ZSwgcGxhbmUpOw0KPiAgIAlzdHJ1Y3QgZHJtX3NoYWRvd19wbGFuZV9zdGF0ZSAqc2hhZG93
X3BsYW5lX3N0YXRlID0gdG9fZHJtX3NoYWRvd19wbGFuZV9zdGF0ZShwbGFuZV9zdGF0ZSk7
DQo+ICsJc3RydWN0IGRybV9hdG9taWNfaGVscGVyX2RhbWFnZV9pdGVyIGl0ZXI7DQo+ICAg
CXN0cnVjdCBkcm1fZGV2aWNlICpkcm0gPSBwbGFuZS0+ZGV2Ow0KPiAtCXN0cnVjdCBkcm1f
cmVjdCBzcmNfY2xpcCwgZHN0X2NsaXA7DQo+ICsJc3RydWN0IGRybV9yZWN0IGRzdF9jbGlw
Ow0KPiArCXN0cnVjdCBkcm1fcmVjdCBkYW1hZ2U7DQo+ICAgCWludCBpZHg7DQo+ICAgDQo+
IC0JaWYgKCFkcm1fYXRvbWljX2hlbHBlcl9kYW1hZ2VfbWVyZ2VkKG9sZF9wbGFuZV9zdGF0
ZSwgcGxhbmVfc3RhdGUsICZzcmNfY2xpcCkpDQo+IC0JCXJldHVybjsNCj4gLQ0KPiAgIAlk
c3RfY2xpcCA9IHBsYW5lX3N0YXRlLT5kc3Q7DQo+IC0JaWYgKCFkcm1fcmVjdF9pbnRlcnNl
Y3QoJmRzdF9jbGlwLCAmc3JjX2NsaXApKQ0KPiAtCQlyZXR1cm47DQo+IC0NCj4gICAJaWYg
KCFkcm1fZGV2X2VudGVyKGRybSwgJmlkeCkpDQo+ICAgCQlyZXR1cm47DQo+ICAgDQo+IC0J
c3NkMTMweF9mYl9ibGl0X3JlY3QocGxhbmVfc3RhdGUtPmZiLCAmc2hhZG93X3BsYW5lX3N0
YXRlLT5kYXRhWzBdLCAmZHN0X2NsaXApOw0KPiArCWRybV9hdG9taWNfaGVscGVyX2RhbWFn
ZV9pdGVyX2luaXQoJml0ZXIsIG9sZF9wbGFuZV9zdGF0ZSwgcGxhbmVfc3RhdGUpOw0KPiAr
CWRybV9hdG9taWNfZm9yX2VhY2hfcGxhbmVfZGFtYWdlKCZpdGVyLCAmZGFtYWdlKSB7DQo+
ICsJCWlmICghZHJtX3JlY3RfaW50ZXJzZWN0KCZkc3RfY2xpcCwgJmRhbWFnZSkpDQo+ICsJ
CQljb250aW51ZTsNCg0KZHN0X2NsaXAgd2lsbCBiZSBvdmVyd3JpdHRlbiBoZXJlLiBTbyBu
ZWVkIHRvIGluaXQgaXQgd2l0aGluIHRoZSBsb29wIGZpcnN0Lg0KDQo+ICsNCj4gKwkJc3Nk
MTMweF9mYl9ibGl0X3JlY3QocGxhbmVfc3RhdGUtPmZiLCAmc2hhZG93X3BsYW5lX3N0YXRl
LT5kYXRhWzBdLCAmZGFtYWdlKTsNCg0KSW4gc2ltcGxlZHJtLCB3ZSBhZGp1c3QgdGhlIGRl
c3RpbmF0aW9uIGFkZHJlc3Mgd2l0aCBkc3RfY2xpcCBsaWtlIHRoaXM6DQoNCiAgIGlvc3lz
X21hcF9pbmNyKCZkc3QsIGRybV9mYl9jbGlwX29mZnNldChzZGV2LT5waXRjaCwgc2Rldi0+
Zm9ybWF0LCANCiZkc3RfY2xpcCkpOw0KDQpIb3cgZG9lcyB0aGlzIHdvcmsgaW4gc3NkMTMw
eD8gWW91IG5ldmVyIHVzZSBkc3RfY2xpcCB0byBhZGp1c3QgdG8gdGhlIA0KY2hhbmdlZCBs
b2NhdGlvbi4gV29uJ3QgeW91IGhhdmUgb3V0LW9mLWJvdW5kcyB3cml0ZXMgb24gdGhlIGRl
dmljZT8NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KDQo+ICsJfQ0KPiAgIA0KPiAgIAlk
cm1fZGV2X2V4aXQoaWR4KTsNCj4gICB9DQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdy
YXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1h
bnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJC
IDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=


--------------fFNulouk5SvXp2wSZxoZD0Cx--

--------------0s57s0R9h03VUUATRyaHTiv0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmM2qBsFAwAAAAAACgkQlh/E3EQov+C2
ew/+PJZfSxvCjop/wOtaRoYwKHu2qt51pfL98AIxSVMDkGVbGBWzP/6fGFMESNvwyLL8QbGNb/Jz
uRmUrCNQc6e3Dk+N336knqzXKEgCFTea8aBPUkTRhwvvel8hziflwPdAOz8mJ3Gee5dnReOtpBoj
F8Q2AENmT6UeEQLgcJGFmGKWOTC7mHXUhhinioay8ypT9Zl+C1m9cy+VjGNYnZor6Ua5+YO/oYJG
60T2I3yUZ4hYTloxzZ7C6gtVO2iHNeFSr3pmeTSIhdT1qUABlbXuI6hC4Q2FPj0cTtTYHezyud0o
LJbgKbdut4tWGqRuZSN7c24hvtSKLUS/aw1z4GJilLY3ONJEW4S8Lw8qdih4vTIn1hw2UmfQkziU
sjSK6Wl6OvUj1hur8WSSvIJfpPaqcdYxN9S4tsFV9Y/Wte7RbVSZoPYGxIXtz46Q9miFna3FeARW
/4fLd5zcQMgEy/987197fBc8bnEVFV+WcliB9lvNW9QgzXtVOebbgDZ/skEQ3edROmjkhqMeAqGz
UkbR+RnxOAzmSZ1eowohAv9TIri0lbytdlMHLuyJyP5dzmAPL7OplvzS6fIKhsYRbo59zJ4AXHgr
j+nNYufuucmYmKlKmbLwwS5LfVB9yShOoCx+0q8kV2dJyp7Gnt82TPCRYbadGtr8z1SQJUJDb1gL
Ris=
=I0Op
-----END PGP SIGNATURE-----

--------------0s57s0R9h03VUUATRyaHTiv0--
