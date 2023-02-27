Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECE36A3F3D
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 11:13:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE3EE10E3A9;
	Mon, 27 Feb 2023 10:13:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1C4710E3A9
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 10:13:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id A34041F8D9;
 Mon, 27 Feb 2023 10:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1677492800; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hyqifWMnIihxVxu2aPn4a3Z9GcWS0luycqzlGHRRrn4=;
 b=d99jIcOpEtbiAnyNLIW2t+4dcNOSiPw5s2BPeiNyG2wZ8zQooAvsYCllkmmG/Kv9XnwHBX
 2Cq0aCBQmVk3UrVOuT2O5lHOMePldqnP2ZNK9NCSQk4lH4o3imT5eI7RqpL2XjaW6uZ6Ch
 RiahWDs0D4OgKDEik82yeaA+8svcJXA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1677492800;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hyqifWMnIihxVxu2aPn4a3Z9GcWS0luycqzlGHRRrn4=;
 b=FdVyH4nsUYAmglJvx7okCMpVBiDDp8itsPAF/QNbzq1svc7Y+9eb88gsUpTHFEzN1gAHHI
 fnDegI1vKOVzVoAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 819F713A43;
 Mon, 27 Feb 2023 10:13:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Z9Z5HkCC/GM+bgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 27 Feb 2023 10:13:20 +0000
Message-ID: <2673f515-9516-de13-3e59-4d473165010d@suse.de>
Date: Mon, 27 Feb 2023 11:13:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] fbdev: chipsfb: Fix error codes in chipsfb_pci_init()
Content-Language: en-US
To: Dan Carpenter <error27@gmail.com>
References: <Y/yA53V/rW8g1Zlm@kili>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <Y/yA53V/rW8g1Zlm@kili>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------FdrI51bCTG0C9tJkYvxuMCBX"
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
Cc: linux-fbdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Yang Yingliang <yangyingliang@huawei.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------FdrI51bCTG0C9tJkYvxuMCBX
Content-Type: multipart/mixed; boundary="------------gW0bBC9K44XeVzYvFXtgy5Lj";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dan Carpenter <error27@gmail.com>
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 Yang Yingliang <yangyingliang@huawei.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Message-ID: <2673f515-9516-de13-3e59-4d473165010d@suse.de>
Subject: Re: [PATCH] fbdev: chipsfb: Fix error codes in chipsfb_pci_init()
References: <Y/yA53V/rW8g1Zlm@kili>
In-Reply-To: <Y/yA53V/rW8g1Zlm@kili>

--------------gW0bBC9K44XeVzYvFXtgy5Lj
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjcuMDIuMjMgdW0gMTE6MDcgc2NocmllYiBEYW4gQ2FycGVudGVyOg0KPiBU
aGUgZXJyb3IgY29kZXMgYXJlIG5vdCBzZXQgb24gdGhlc2UgZXJyb3IgcGF0aHMuDQo+IA0K
PiBGaXhlczogMTQ1ZWVkNDhkZTI3ICgiZmJkZXY6IFJlbW92ZSBjb25mbGljdGluZyBkZXZp
Y2VzIG9uIFBDSSBidXMiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBEYW4gQ2FycGVudGVyIDxlcnJv
cjI3QGdtYWlsLmNvbT4NCg0KUmV2aWV3ZWQtYnk6IFRob21hcyBaaW1tZXJtYW5uIDx0emlt
bWVybWFubkBzdXNlLmRlPg0KDQp3aXRoIHRoZSBjb21tZW50cyBiZWxvdyBhZGRyZXNzZWQu
DQoNCj4gLS0tDQo+ICAgZHJpdmVycy92aWRlby9mYmRldi9jaGlwc2ZiLmMgfCAxNCArKysr
KysrKysrLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvY2hp
cHNmYi5jIGIvZHJpdmVycy92aWRlby9mYmRldi9jaGlwc2ZiLmMNCj4gaW5kZXggY2MzN2Vj
M2Y4ZmMxLi45ODM5ODc4OTUyOGEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvdmlkZW8vZmJk
ZXYvY2hpcHNmYi5jDQo+ICsrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvY2hpcHNmYi5jDQo+
IEBAIC0zNTgsMTYgKzM1OCwyMSBAQCBzdGF0aWMgaW50IGNoaXBzZmJfcGNpX2luaXQoc3Ry
dWN0IHBjaV9kZXYgKmRwLCBjb25zdCBzdHJ1Y3QgcGNpX2RldmljZV9pZCAqZW50KQ0KPiAg
IAlpZiAocmMpDQo+ICAgCQlyZXR1cm4gcmM7DQo+ICAgDQo+IC0JaWYgKHBjaV9lbmFibGVf
ZGV2aWNlKGRwKSA8IDApIHsNCj4gKwlyYyA9IHBjaV9lbmFibGVfZGV2aWNlKGRwKTsNCj4g
KwlpZiAocmMgPCAwKSB7DQo+ICAgCQlkZXZfZXJyKCZkcC0+ZGV2LCAiQ2Fubm90IGVuYWJs
ZSBQQ0kgZGV2aWNlXG4iKTsNCj4gICAJCWdvdG8gZXJyX291dDsNCj4gICAJfQ0KPiAgIA0K
PiAtCWlmICgoZHAtPnJlc291cmNlWzBdLmZsYWdzICYgSU9SRVNPVVJDRV9NRU0pID09IDAp
DQo+ICsJaWYgKChkcC0+cmVzb3VyY2VbMF0uZmxhZ3MgJiBJT1JFU09VUkNFX01FTSkgPT0g
MCkgew0KPiArCQlyYyA9IC1FSU5WQUw7DQoNCkkgdGhpbmsgRU5PREVWIGlzIG1vcmUgYXBw
cm9wcmlhdGUuIEFuZCBpdCdzIHRoZSBkZWZhdWx0IHZhbHVlIGZyb20gdGhlIA0Kb3JpZ2lu
YWwgY29kZS4NCg0KPiAgIAkJZ290byBlcnJfZGlzYWJsZTsNCj4gKwl9DQo+ICAgCWFkZHIg
PSBwY2lfcmVzb3VyY2Vfc3RhcnQoZHAsIDApOw0KPiAtCWlmIChhZGRyID09IDApDQo+ICsJ
aWYgKGFkZHIgPT0gMCkgew0KPiArCQlyYyA9IC1FSU5WQUw7DQoNClNhbWUgaGVyZS4NCg0K
QmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiAgIAkJZ290byBlcnJfZGlzYWJsZTsNCj4gKwl9
DQo+ICAgDQo+ICAgCXAgPSBmcmFtZWJ1ZmZlcl9hbGxvYygwLCAmZHAtPmRldik7DQo+ICAg
CWlmIChwID09IE5VTEwpIHsNCj4gQEAgLTQxNyw3ICs0MjIsOCBAQCBzdGF0aWMgaW50IGNo
aXBzZmJfcGNpX2luaXQoc3RydWN0IHBjaV9kZXYgKmRwLCBjb25zdCBzdHJ1Y3QgcGNpX2Rl
dmljZV9pZCAqZW50KQ0KPiAgIA0KPiAgIAlpbml0X2NoaXBzKHAsIGFkZHIpOw0KPiAgIA0K
PiAtCWlmIChyZWdpc3Rlcl9mcmFtZWJ1ZmZlcihwKSA8IDApIHsNCj4gKwlyYyA9IHJlZ2lz
dGVyX2ZyYW1lYnVmZmVyKHApOw0KPiArCWlmIChyYyA8IDApIHsNCj4gICAJCWRldl9lcnIo
JmRwLT5kZXYsIkMmVCA2NTU1MCBmcmFtZWJ1ZmZlciBmYWlsZWQgdG8gcmVnaXN0ZXJcbiIp
Ow0KPiAgIAkJZ290byBlcnJfdW5tYXA7DQo+ICAgCX0NCg0KLS0gDQpUaG9tYXMgWmltbWVy
bWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlv
bnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1h
bnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8g
VG90ZXYNCg==

--------------gW0bBC9K44XeVzYvFXtgy5Lj--

--------------FdrI51bCTG0C9tJkYvxuMCBX
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmP8gj8FAwAAAAAACgkQlh/E3EQov+Ch
aA/9GbcwRxWxkxz+JmD6gL6BryzEVqW4wkZXiqt2GKcu5eUz6LVa+29r1XpLtqUbpZ5a99+bCgau
tw0zaUD4ZHosZNmzXK3NfRCQTIpQzdyuaS4m3x/rhnsumQHlxvFtRzC5TlT62bmC6cwAErrEOWoG
vMQFJffgmogF5RlnvAg7UgMp/potuVqhzuh/GPsi7tq14NNLUSGs2j7FDWwt8iOzo6xhOIncFii8
dEHWJd1T/2cH+jasyrljoR3WRHo+dbp5xEmJX0ZJJwtA3X9HMUPeX+jH8GW0LIy85DJphkCG7aVY
woxMopK4qVx+WsS4SK2uTrA2nQFfrkxxnRyftl+HC72JXHUxIlQWKaxN3Argm1nTVgNm6kXCdluU
WINleE1YPUpo+FczxEtL3lXgun0oqJkb7YNgQjIeQ0uOX44ClPilmRL/VZj1SgNLcmpRg+1+LcZ6
yBtfIO1kskFo2uAREC7FmV4JttDk0n38/+B49ArZJFaM6g7ezk1osVOYMVqO7Bky5giDUWJHf3Z8
/GOp98ntyPijdlxGdeodX0ujT7WNa2u0tzALFLLHLbvLmW1DL94xkhZYQakdJ1vUoSsTqrOA6Hcl
z1mzJT9Wa6QHD24/BpYGKv8XiL7yoEp17JyRhWx02ylA/MgbBAIx7aIGGh5x0s40bcM7QtlLz0Yi
CqE=
=9rdz
-----END PGP SIGNATURE-----

--------------FdrI51bCTG0C9tJkYvxuMCBX--
