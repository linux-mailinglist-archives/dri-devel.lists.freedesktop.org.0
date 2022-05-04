Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13803519C83
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 12:04:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D27F810EFBA;
	Wed,  4 May 2022 10:04:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1A6610EFBA
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 10:04:39 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 55C3D210DC;
 Wed,  4 May 2022 10:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1651658678; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Gi/1UL5Nv8cL+l5tbQnceZBeVchaaGZ6DwMytGPHXe8=;
 b=JqFd7k4n8ljawbLjHkvo0rWFaGY7pCO4nY9/oP0mwPo8HcWYVmQMsG9IXrlbFGdXkWkUk8
 k+by5W1iDV+WTQQ8Kgycohp+lJhKO8Wimu77UKf3KLRM4gBfmSvA+Y/8UPhN8MC9CCK+hY
 BaSq6bKksl5Zz6E9vd+9IYgH7yavC6Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1651658678;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Gi/1UL5Nv8cL+l5tbQnceZBeVchaaGZ6DwMytGPHXe8=;
 b=kkC9srnUE3pATHsQtPKGDAGtTqfl6HLZHMN6GD3gOV2xIyuJ55NSX7UJzpdnzvKUKOagFR
 lrd/SDz3MXo3nNAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 36999131BD;
 Wed,  4 May 2022 10:04:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id WYcbDLZPcmKjGQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 04 May 2022 10:04:38 +0000
Message-ID: <811b97ca-d7f0-184e-17f3-4c3398ca3794@suse.de>
Date: Wed, 4 May 2022 12:04:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 2/4] mgag200: Optimize damage clips
Content-Language: en-US
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org
References: <20220426164108.1051295-1-jfalempe@redhat.com>
 <20220426164108.1051295-3-jfalempe@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220426164108.1051295-3-jfalempe@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------JqypJvSV3SUUm80vb8apgc0s"
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
Cc: michel@daenzer.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------JqypJvSV3SUUm80vb8apgc0s
Content-Type: multipart/mixed; boundary="------------0iQjXG9OMlnCjI5uLULEo5lO";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org
Cc: michel@daenzer.net, lyude@redhat.com, jadahl@gmail.com
Message-ID: <811b97ca-d7f0-184e-17f3-4c3398ca3794@suse.de>
Subject: Re: [PATCH 2/4] mgag200: Optimize damage clips
References: <20220426164108.1051295-1-jfalempe@redhat.com>
 <20220426164108.1051295-3-jfalempe@redhat.com>
In-Reply-To: <20220426164108.1051295-3-jfalempe@redhat.com>

--------------0iQjXG9OMlnCjI5uLULEo5lO
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjYuMDQuMjIgdW0gMTg6NDEgc2NocmllYiBKb2NlbHluIEZhbGVtcGU6DQo+
IHdoZW4gdGhlcmUgYXJlIG11bHRpcGxlIGRhbWFnZSBjbGlwcywgcHJldmlvdXMgY29kZSBt
ZXJnZWQgdGhlbSBpbnRvIG9uZQ0KPiBiaWcgcmVjdGFuZ2xlLiBBcyB0aGUgTWF0cm94IG1l
bW9yeSBpcyB2ZXJ5IHNsb3csIGl0J3MgZmFzdGVyIHRvIGNvcHkgZWFjaA0KPiBkYW1hZ2Ug
Y2xpcC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEpvY2VseW4gRmFsZW1wZSA8amZhbGVtcGVA
cmVkaGF0LmNvbT4NCg0KUmV2aWV3ZWQtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVy
bWFubkBzdXNlLmRlPg0KDQpIb3cgZG8geW91IG1lYXN1cmUgdGhlIHBlcmZvcm1hbmNlPyBJ
dCBzZWVtcyBhcyBpZiBpdCBkZXBlbmRzIGEgbG90IG9uIA0KdGhlIG5hdHVyZSBvZiB0aGUg
c2NyZWVuIHVwZGF0ZS4gIEJ1dCBtYXliZSB1c2luZyB0aGF0IGxvb3AgaXMgZmFzdGVyIGlu
IA0KdGhlIGdlbmVyYWwgY2FzZSB3aXRoIG90aGVyIGRyaXZlcnMgYXMgd2VsbC4NCg0KQmVz
dCByZWdhcmRzDQpUaG9tYXMNCg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vbWdhZzIw
MC9tZ2FnMjAwX21vZGUuYyB8IDE1ICsrKysrKysrKystLS0tLQ0KPiAgIDEgZmlsZSBjaGFu
Z2VkLCAxMCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbW9kZS5jIGIvZHJpdmVycy9n
cHUvZHJtL21nYWcyMDAvbWdhZzIwMF9tb2RlLmMNCj4gaW5kZXggY2ZmMmU3NmYzZmEwLi4y
YmMzODBhODU5OTYgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21n
YWcyMDBfbW9kZS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBf
bW9kZS5jDQo+IEBAIC04NTUsMTAgKzg1NSw2IEBAIG1nYWcyMDBfaGFuZGxlX2RhbWFnZShz
dHJ1Y3QgbWdhX2RldmljZSAqbWRldiwgc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIsDQo+
ICAgDQo+ICAgCWRzdCArPSBkcm1fZmJfY2xpcF9vZmZzZXQoZmItPnBpdGNoZXNbMF0sIGZi
LT5mb3JtYXQsIGNsaXApOw0KPiAgIAlkcm1fZmJfbWVtY3B5X3RvaW8oZHN0LCBmYi0+cGl0
Y2hlc1swXSwgdm1hcCwgZmIsIGNsaXApOw0KPiAtDQo+IC0JLyogQWx3YXlzIHNjYW5vdXQg
aW1hZ2UgYXQgVlJBTSBvZmZzZXQgMCAqLw0KPiAtCW1nYWcyMDBfc2V0X3N0YXJ0YWRkKG1k
ZXYsICh1MzIpMCk7DQo+IC0JbWdhZzIwMF9zZXRfb2Zmc2V0KG1kZXYsIGZiKTsNCj4gICB9
DQo+ICAgDQo+ICAgc3RhdGljIHZvaWQNCj4gQEAgLTkwNCw2ICs5MDAsOSBAQCBtZ2FnMjAw
X3NpbXBsZV9kaXNwbGF5X3BpcGVfZW5hYmxlKHN0cnVjdCBkcm1fc2ltcGxlX2Rpc3BsYXlf
cGlwZSAqcGlwZSwNCj4gICAJbWdhZzIwMF9lbmFibGVfZGlzcGxheShtZGV2KTsNCj4gICAN
Cj4gICAJbWdhZzIwMF9oYW5kbGVfZGFtYWdlKG1kZXYsIGZiLCAmZnVsbHNjcmVlbiwgJnNo
YWRvd19wbGFuZV9zdGF0ZS0+ZGF0YVswXSk7DQo+ICsJLyogQWx3YXlzIHNjYW5vdXQgaW1h
Z2UgYXQgVlJBTSBvZmZzZXQgMCAqLw0KPiArCW1nYWcyMDBfc2V0X3N0YXJ0YWRkKG1kZXYs
ICh1MzIpMCk7DQo+ICsJbWdhZzIwMF9zZXRfb2Zmc2V0KG1kZXYsIGZiKTsNCj4gICB9DQo+
ICAgDQo+ICAgc3RhdGljIHZvaWQNCj4gQEAgLTk1OSwxMiArOTU4LDE4IEBAIG1nYWcyMDBf
c2ltcGxlX2Rpc3BsYXlfcGlwZV91cGRhdGUoc3RydWN0IGRybV9zaW1wbGVfZGlzcGxheV9w
aXBlICpwaXBlLA0KPiAgIAlzdHJ1Y3QgZHJtX3NoYWRvd19wbGFuZV9zdGF0ZSAqc2hhZG93
X3BsYW5lX3N0YXRlID0gdG9fZHJtX3NoYWRvd19wbGFuZV9zdGF0ZShzdGF0ZSk7DQo+ICAg
CXN0cnVjdCBkcm1fZnJhbWVidWZmZXIgKmZiID0gc3RhdGUtPmZiOw0KPiAgIAlzdHJ1Y3Qg
ZHJtX3JlY3QgZGFtYWdlOw0KPiArCXN0cnVjdCBkcm1fYXRvbWljX2hlbHBlcl9kYW1hZ2Vf
aXRlciBpdGVyOw0KPiAgIA0KPiAgIAlpZiAoIWZiKQ0KPiAgIAkJcmV0dXJuOw0KPiAgIA0K
PiAtCWlmIChkcm1fYXRvbWljX2hlbHBlcl9kYW1hZ2VfbWVyZ2VkKG9sZF9zdGF0ZSwgc3Rh
dGUsICZkYW1hZ2UpKQ0KPiArCWRybV9hdG9taWNfaGVscGVyX2RhbWFnZV9pdGVyX2luaXQo
Jml0ZXIsIG9sZF9zdGF0ZSwgc3RhdGUpOw0KPiArCWRybV9hdG9taWNfZm9yX2VhY2hfcGxh
bmVfZGFtYWdlKCZpdGVyLCAmZGFtYWdlKSB7DQo+ICAgCQltZ2FnMjAwX2hhbmRsZV9kYW1h
Z2UobWRldiwgZmIsICZkYW1hZ2UsICZzaGFkb3dfcGxhbmVfc3RhdGUtPmRhdGFbMF0pOw0K
PiArCX0NCj4gKwkvKiBBbHdheXMgc2Nhbm91dCBpbWFnZSBhdCBWUkFNIG9mZnNldCAwICov
DQo+ICsJbWdhZzIwMF9zZXRfc3RhcnRhZGQobWRldiwgKHUzMikwKTsNCj4gKwltZ2FnMjAw
X3NldF9vZmZzZXQobWRldiwgZmIpOw0KPiAgIH0NCj4gICANCj4gICBzdGF0aWMgc3RydWN0
IGRybV9jcnRjX3N0YXRlICoNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3Mg
RHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJI
DQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDks
IEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------0iQjXG9OMlnCjI5uLULEo5lO--

--------------JqypJvSV3SUUm80vb8apgc0s
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJyT7UFAwAAAAAACgkQlh/E3EQov+DQ
eA//XiPB2xka3d1/2BthWKmctQy6ZgMGTFH0Q9chy1XfmljImsCjpAYotp53K32YLfaEMLIHp07r
zqzmyQUt+rFqngQAbE1VpfYK241JMyxM/+xQ6Kkj5NDogfSeKYMpfUepq3ncxf3yQvbaIT2KqmaN
r0DkCN4r1Yf6RaYTYJxOHXSCRIazb+6jDCa+a2S8cZJStkX6U/aDOsVZC5HfCkISXKT4hwFaWxdr
ZA4RrGgHLrdz+qt0YIa4PoJCQmkGnV4C+b5K4J8Z7KqVGa9lDL8C9QXNXO4jkrSSQXu6zL6+aSsM
n3p8DRhxH22zZmRePCv/Cms7ckhj8g6kdy/DWwfJfX03oogxLwKVy/yZt/NgfKeWybHACRxqztng
CHHc9Q4F/ZutvQus2e5E5iIqNuz8QvgELtgsibAvGRIzDHFyzThJShPVWn9eLp0pihNBumVPHsSY
Vc/9qs4KMnAPkscOFmrMCgIoPOL3kwW5U49PYSI1GDPongeq+6osd6WKdhiAGgNukLcmIENlIXhO
/2lT6YQ3jnX0rUzgHTal7IBc86ohQdqgfRro13txh1LSLJyQE4BmdPRSqJ6gXB/6N1oxEPnH7Nnd
wdqTvZ6hrytgst/fRxDZngynGgl+KH0Ckb9pHwk5seAfytuZ2pHLjJHepSIRK0d1btukackOk4lZ
uXY=
=DTa1
-----END PGP SIGNATURE-----

--------------JqypJvSV3SUUm80vb8apgc0s--
