Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFC969043E
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 10:55:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2477610E975;
	Thu,  9 Feb 2023 09:55:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 747D810E975
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 09:55:26 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 31AC41FDEF;
 Thu,  9 Feb 2023 09:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1675936525; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cUyo2pGPYpcqq73yM642w82y5JfqlO4L/s9qdRpJSKk=;
 b=iI5gZ7+7PywQhOFohMfWc9njYDlCFZBamO92X6UfnS8eG7DDKlKa43aO5AoV4p1OGQloPm
 K7OaDg59dlWLsNTcmRKd/EOvCAdwIibz95liY+PrDzJwg9HtTCUut5YAb8pBaWVJcaw8mE
 S1PVpr+UdU2+eUYBZXqcJbo8n7n6QJI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1675936525;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cUyo2pGPYpcqq73yM642w82y5JfqlO4L/s9qdRpJSKk=;
 b=OtTsfw2goqdeUCFHHGi36oJYhDC2Gx3lPmXWzyOfijtK+utDjkGGCadysjZ9BwvCo0tNJO
 NkZv3WAgfTVQCrDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 10390138E4;
 Thu,  9 Feb 2023 09:55:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 0FYnAw3D5GOoFAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 09 Feb 2023 09:55:25 +0000
Message-ID: <76785a76-281d-f847-5904-d8df361aa0b4@suse.de>
Date: Thu, 9 Feb 2023 10:55:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3] drm/ast: Fix start address computation
Content-Language: en-US
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, kuohsiang_chou@aspeedtech.com, jammy_huang@aspeedtech.com
References: <20230209094417.21630-1-jfalempe@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230209094417.21630-1-jfalempe@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------a0JO0LyGSrGQWnLSu8ss3s7y"
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
--------------a0JO0LyGSrGQWnLSu8ss3s7y
Content-Type: multipart/mixed; boundary="------------N80Oloa0ZlEYc0vLl9hYmhzt";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, kuohsiang_chou@aspeedtech.com, jammy_huang@aspeedtech.com
Message-ID: <76785a76-281d-f847-5904-d8df361aa0b4@suse.de>
Subject: Re: [PATCH v3] drm/ast: Fix start address computation
References: <20230209094417.21630-1-jfalempe@redhat.com>
In-Reply-To: <20230209094417.21630-1-jfalempe@redhat.com>

--------------N80Oloa0ZlEYc0vLl9hYmhzt
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDA5LjAyLjIzIHVtIDEwOjQ0IHNjaHJpZWIgSm9jZWx5biBGYWxlbXBlOg0KPiBE
dXJpbmcgdGhlIGRyaXZlciBjb252ZXJzaW9uIHRvIHNobWVtLCB0aGUgc3RhcnQgYWRkcmVz
cyBmb3IgdGhlDQo+IHNjYW5vdXQgYnVmZmVyIHdhcyBzZXQgdG8gdGhlIGJhc2UgUENJIGFk
ZHJlc3MuDQo+IEluIG1vc3QgY2FzZXMgaXQgd29ya3MgYmVjYXVzZSBvbmx5IHRoZSBsb3dl
ciAyNGJpdHMgYXJlIHVzZWQsIGFuZA0KPiBkdWUgdG8gYWxpZ25tZW50IGl0IHdhcyBhbG1v
c3QgYWx3YXlzIDAuDQo+IEJ1dCBvbiBzb21lIHVubHVja3kgaGFyZHdhcmUsIGl0J3Mgbm90
IHRoZSBjYXNlLCBhbmQgc29tZSB1bml0aWxpemVkDQoNCid1bmluaXRpYWxpemVkJw0KDQo+
IG1lbW9yeSBpcyBkaXNwbGF5ZWQgb24gdGhlIEJNQy4NCj4gV2l0aCBzaG1lbSwgdGhlIHBy
aW1hcnkgcGxhbmUgaXMgYWx3YXlzIGF0IG9mZnNldCAwIGluIEdQVSBtZW1vcnkuDQo+IA0K
PiAgICogdjI6IHJld3JpdGUgdGhlIHBhdGNoIHRvIHNldCB0aGUgb2Zmc2V0IHRvIDAuIChU
aG9tYXMgWmltbWVybWFubikNCj4gICAqIHYzOiBtb3ZlIHRoZSBjaGFuZ2UgdG8gcGxhbmVf
aW5pdCgpIGFuZCBhbHNvIGZpeCB0aGUgY3Vyc29yIHBsYW5lLg0KPiAgICAgICAgIChKYW1t
eSBIdWFuZykNCj4gDQo+IFRlc3RlZCBvbiBhIHNyNjQ1IGFmZmVjdGVkIGJ5IHRoaXMgYnVn
Lg0KPiANCj4gRml4ZXM6IGYyZmE1YTk5Y2E4MSAoImRybS9hc3Q6IENvbnZlcnQgYXN0IHRv
IFNITUVNIikNCj4gU2lnbmVkLW9mZi1ieTogSm9jZWx5biBGYWxlbXBlIDxqZmFsZW1wZUBy
ZWRoYXQuY29tPg0KDQpSZXZpZXdlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJt
YW5uQHN1c2UuZGU+DQoNCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbW9k
ZS5jIHwgNCArKy0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYXN0L2Fz
dF9tb2RlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tb2RlLmMNCj4gaW5kZXggYzc0
NDMzMTdjNzQ3Li42NmE0YTQxYzNmZTkgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hc3QvYXN0X21vZGUuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tb2Rl
LmMNCj4gQEAgLTcxNCw3ICs3MTQsNyBAQCBzdGF0aWMgaW50IGFzdF9wcmltYXJ5X3BsYW5l
X2luaXQoc3RydWN0IGFzdF9wcml2YXRlICphc3QpDQo+ICAgCXN0cnVjdCBhc3RfcGxhbmUg
KmFzdF9wcmltYXJ5X3BsYW5lID0gJmFzdC0+cHJpbWFyeV9wbGFuZTsNCj4gICAJc3RydWN0
IGRybV9wbGFuZSAqcHJpbWFyeV9wbGFuZSA9ICZhc3RfcHJpbWFyeV9wbGFuZS0+YmFzZTsN
Cj4gICAJdm9pZCBfX2lvbWVtICp2YWRkciA9IGFzdC0+dnJhbTsNCj4gLQl1NjQgb2Zmc2V0
ID0gYXN0LT52cmFtX2Jhc2U7DQo+ICsJdTY0IG9mZnNldCA9IDA7IC8qIHdpdGggc2htZW0s
IHRoZSBwcmltYXJ5IHBsYW5lIGlzIGFsd2F5cyBhdCBvZmZzZXQgMCAqLw0KPiAgIAl1bnNp
Z25lZCBsb25nIGN1cnNvcl9zaXplID0gcm91bmR1cChBU1RfSFdDX1NJWkUgKyBBU1RfSFdD
X1NJR05BVFVSRV9TSVpFLCBQQUdFX1NJWkUpOw0KPiAgIAl1bnNpZ25lZCBsb25nIHNpemUg
PSBhc3QtPnZyYW1fZmJfYXZhaWxhYmxlIC0gY3Vyc29yX3NpemU7DQo+ICAgCWludCByZXQ7
DQo+IEBAIC05NzIsNyArOTcyLDcgQEAgc3RhdGljIGludCBhc3RfY3Vyc29yX3BsYW5lX2lu
aXQoc3RydWN0IGFzdF9wcml2YXRlICphc3QpDQo+ICAgCQlyZXR1cm4gLUVOT01FTTsNCj4g
ICANCj4gICAJdmFkZHIgPSBhc3QtPnZyYW0gKyBhc3QtPnZyYW1fZmJfYXZhaWxhYmxlIC0g
c2l6ZTsNCj4gLQlvZmZzZXQgPSBhc3QtPnZyYW1fYmFzZSArIGFzdC0+dnJhbV9mYl9hdmFp
bGFibGUgLSBzaXplOw0KPiArCW9mZnNldCA9IGFzdC0+dnJhbV9mYl9hdmFpbGFibGUgLSBz
aXplOw0KPiAgIA0KPiAgIAlyZXQgPSBhc3RfcGxhbmVfaW5pdChkZXYsIGFzdF9jdXJzb3Jf
cGxhbmUsIHZhZGRyLCBvZmZzZXQsIHNpemUsDQo+ICAgCQkJICAgICAweDAxLCAmYXN0X2N1
cnNvcl9wbGFuZV9mdW5jcywNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3Mg
RHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJI
DQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDks
IEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------N80Oloa0ZlEYc0vLl9hYmhzt--

--------------a0JO0LyGSrGQWnLSu8ss3s7y
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmPkwwwFAwAAAAAACgkQlh/E3EQov+DA
4BAAu1DYD/cS7Iz2yvTpuUzYFxxKHTdTnwm4smB64KFNHTMUWdq3mnHqH8O2m2wKYtjeoFqxjZIE
bVSbdq+TuamiY08t5kzOT/v2dAsJ3NAbNICZVzCww4l5U9e0XPFfPouGbosueBPf6D7IQ3VxaTno
ANwAEj2fj1I/SjUEgU8S9sUc/8n2GrJrH+cuIxfOyroVdhb9y6ZmtbuxV9Ntu0AUNQiU3s0hNKqJ
4UrofL2i0clnlB6M9wzD97tSkfxys1L1wFpFi36NknKZcEOH32EObHnJE5LYLnYxq9rMDOuYgpzA
Evo/QyNN/VXaK6wsaz/tuE46vveNKTMKbPi7QxEQ8XORieBDnlelRx8amfNChW6G23bVZ5h+jem+
mlB54KJtBE9aHcYlJRLk8fLXSEgig97dy4yUoN7BzuThYkY+JKmUMiMSAtKjHPp2aI3sXkWOzR3b
Mv5LqFGlhcD8dLbL14iQXXH4IXk3NrHjFdnpLHBciz/NSNuAnA+j/DHz/u2JatGk5HvzGQ9zh5R7
ad5rBFNedx6HtW6JbfWWHKrZHchl9IibzvLdkwIuoIZLeohZlb23VTd+akfYxrFcJIqjj2N12SGo
kBSESDDN3XF3tM+cDYGygPxiFt9wqVxVqVpBjls4K49Lbkd75XLW4Gx5AV/OYXPRhwcGdnlzoApS
Hoo=
=oFdi
-----END PGP SIGNATURE-----

--------------a0JO0LyGSrGQWnLSu8ss3s7y--
