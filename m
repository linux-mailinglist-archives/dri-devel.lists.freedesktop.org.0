Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C9A475550
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 10:39:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ED5F10E26F;
	Wed, 15 Dec 2021 09:39:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABBD710E26F
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 09:39:05 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 57DB8212C5;
 Wed, 15 Dec 2021 09:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1639561144; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VKBUCSfk97Wnmljvv5WHimDqz8CHRNFwEGMUQ3GEua0=;
 b=IBvu/PBwrTdHVG4ohi0E8S06naWx0e72Ypj5SRdn46zYga24XCAB0SSybPDV3XmGzh9KW3
 UA1WGkws01Ugcab7JLxSMBYmbDkoXDV3fhuBiQZTkJrdG3uYJ7Orxvh3sD4Xt+MyNY7/1P
 6psu6Ejyd26EXtC/2HmjrecToqivzds=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1639561144;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VKBUCSfk97Wnmljvv5WHimDqz8CHRNFwEGMUQ3GEua0=;
 b=fdF0bEgKXpMueHQf3wwOI3SRQq2mDGORXlm+PMfqKKgFhn/9EL/g9h70RHdeYnYp1ecNx6
 m27bdqmfvVlTdjDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2D2B413B09;
 Wed, 15 Dec 2021 09:39:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id rMYCCri3uWFoWAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 15 Dec 2021 09:39:04 +0000
Message-ID: <36d2ca10-22ae-5c15-4ab1-6ff84507c0cb@suse.de>
Date: Wed, 15 Dec 2021 10:39:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 07/60] drm/etnaviv: Add support for the nomodeset kernel
 parameter
Content-Language: en-US
To: Lucas Stach <l.stach@pengutronix.de>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20211215010008.2545520-1-javierm@redhat.com>
 <20211215010008.2545520-8-javierm@redhat.com>
 <190d0eea4c134539a500a3fae514bb6e3025a7ec.camel@pengutronix.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <190d0eea4c134539a500a3fae514bb6e3025a7ec.camel@pengutronix.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------CrPmv8TekHgKGKQGQoKrdmwr"
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
Cc: Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------CrPmv8TekHgKGKQGQoKrdmwr
Content-Type: multipart/mixed; boundary="------------iJOLnnOvOMwRuQwqrM8nEBHr";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Lucas Stach <l.stach@pengutronix.de>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: Russell King <linux+etnaviv@armlinux.org.uk>,
 Maxime Ripard <mripard@kernel.org>
Message-ID: <36d2ca10-22ae-5c15-4ab1-6ff84507c0cb@suse.de>
Subject: Re: [PATCH 07/60] drm/etnaviv: Add support for the nomodeset kernel
 parameter
References: <20211215010008.2545520-1-javierm@redhat.com>
 <20211215010008.2545520-8-javierm@redhat.com>
 <190d0eea4c134539a500a3fae514bb6e3025a7ec.camel@pengutronix.de>
In-Reply-To: <190d0eea4c134539a500a3fae514bb6e3025a7ec.camel@pengutronix.de>

--------------iJOLnnOvOMwRuQwqrM8nEBHr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

KGNjJ2luZyBNYXhpbWUpDQoNCkhpDQoNCkFtIDE1LjEyLjIxIHVtIDEwOjE4IHNjaHJpZWIg
THVjYXMgU3RhY2g6DQo+IEhpIEphdmllciwNCj4gDQo+IEFtIE1pdHR3b2NoLCBkZW0gMTUu
MTIuMjAyMSB1bSAwMTo1OSArMDEwMCBzY2hyaWViIEphdmllciBNYXJ0aW5leiBDYW5pbGxh
czoNCj4+IEFjY29yZGluZyB0byBkaXNhYmxlIERvY3VtZW50YXRpb24vYWRtaW4tZ3VpZGUv
a2VybmVsLXBhcmFtZXRlcnMudHh0LCB0aGlzDQo+PiBwYXJhbWV0ZXIgY2FuIGJlIHVzZWQg
dG8gZGlzYWJsZSBrZXJuZWwgbW9kZXNldHRpbmcuDQo+Pg0KPj4gRFJNIGRyaXZlcnMgd2ls
bCBub3QgcGVyZm9ybSBkaXNwbGF5LW1vZGUgY2hhbmdlcyBvciBhY2NlbGVyYXRlZCByZW5k
ZXJpbmcNCj4+IGFuZCBvbmx5IHRoZSBzeXN0ZXdtIHN5c3RlbSBmcmFtZWJ1ZmZlciB3aWxs
IGJlIGF2YWlsYWJsZSBpZiBpdCB3YXMgc2V0LXVwLg0KPj4NCj4gRXRuYXZpdiBpcyBhIHJl
bmRlci1vbmx5IGRyaXZlciwgc28gd2lsbCBubyBwZXJmb3JtIGFueSBtb2Rlc2V0dGluZyBv
bg0KPiBhIGRpc3BsYXkgZGV2aWNlLCBzbyBJJ20gbm90IHN1cmUgaWYgaXQncyBzZW5zaWJs
ZSB0byBjb3ZlciBpdCB1bmRlcg0KPiB0aGUgbm9tb2Rlc2V0IHBhcmFtZXRlci4gSSBzZWUg
dGhhdCBpdCBpcyBjb25zaXN0ZW50IHdpdGggdGhlIG90aGVyDQo+IGRyaXZlcnMgdGhhdCBk
ZWFsIHdpdGggYSBjb21iaW5lZCByZW5kZXIvZGlzcGxheSBkZXZpY2UsIHdoZXJlIHRoZQ0K
PiByZW5kZXIgZGV2aWNlIGFsc28gZ2V0cyBkaXNhYmxlZCB3aXRoIHRoZSBub21vZGVzZXQg
cGFyYW0sIGJ1dCBpdA0KPiBkb2Vzbid0IHJlYWxseSBtYXRjaCB0aGUgZGVzY3JpcHRpb24g
b2Ygd2hhdCB0aGUgcGFyYW1ldGVyIGlzIHN1cHBvc2VkDQo+IHRvIGRvLg0KPiANCj4gSSdt
IG5vdCBvcHBvc2VkIHRvIHRha2UgdGhpcyBwYXRjaCBmb3IgY29uc2lzdGVuY3kgcmVhc29u
cywgYnV0IEkgd291bGQNCj4gbGlrZSB0byBoZWFyIHNvbWUgbW9yZSBvcGluaW9ucyBmcm9t
IG90aGVyIERSTSBmb2xrcy4NCg0KT3VyIGFzc3VtcHRpb24gaXMgdGhhdCB3ZSB3YW50IHRv
IGRpc2FibGUgYWxsIERSTSBkcml2ZXJzOyBleGNlcHQgdGhvc2UgDQp0aGF0IG9wZXJhdGUg
b24gdGhlIGZpcm13YXJlJ3Mgb3JpZ2luYWwgZnJhbWVidWZmZXIuIFRoYXQncyB3aHkgdGhl
IHRoZSANCnRlc3QgaXMgY2FsbGVkIGRybV9maXJtd2FyZV9kcml2ZXJzX29ubHkoKS4NCg0K
V2Uga25vdyB0aGF0IG5vbW9kZXNldCBpcyBhIHRlcnJpYmxlIG5hbWUuIFdlIG9ubHkga2Vw
dCBpdCBiZWNhdXNlIGl0IA0Kd2FzIGFscmVhZHkgdGhlcmUsIHdpZGVseSB1c2VkLCBhbmQg
YWxyZWFkeSBkb2VzIHdoYXQgd2UgbmVlZC4NCg0KV2UgaGFkIHNpbWlsYXIgY29uY2VybnMg
d2l0aCB0aGUgdjNkIGRyaXZlciBvZiB2YzQuIEphdmllciwgbWF5YmUgd2UgDQpzaG91bGQg
bGVhdmUtb3V0IHN1Y2ggc3BlY2lhbCBjYXNlcyBmb3Igbm93IGFuZCBkaXNjdXNzIHRoZW0g
c2VwYXJhdGVseT8NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gUmVnYXJkcywN
Cj4gTHVjYXMNCj4gDQo+PiBCdXQgb25seSBhIGZldyBEUk0gZHJpdmVycyBjdXJyZW50bHkg
Y2hlY2sgZm9yIG5vbW9kZXNldCwgbWFrZSB0aGlzIGRyaXZlcg0KPj4gdG8gYWxzbyBzdXBw
b3J0IHRoZSBjb21tYW5kIGxpbmUgcGFyYW1ldGVyLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6
IEphdmllciBNYXJ0aW5leiBDYW5pbGxhcyA8amF2aWVybUByZWRoYXQuY29tPg0KPj4gLS0t
DQo+Pg0KPj4gICBkcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2Rydi5jIHwgMyAr
KysNCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQ0KPj4NCj4+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5hdml2X2Rydi5jIGIvZHJpdmVy
cy9ncHUvZHJtL2V0bmF2aXYvZXRuYXZpdl9kcnYuYw0KPj4gaW5kZXggN2RjYzYzOTI3OTJk
Li41OGIwOTIyNDhmN2IgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZXRuYXZp
di9ldG5hdml2X2Rydi5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZXRuYXZpdi9ldG5h
dml2X2Rydi5jDQo+PiBAQCAtNjM1LDYgKzYzNSw5IEBAIHN0YXRpYyBpbnQgX19pbml0IGV0
bmF2aXZfaW5pdCh2b2lkKQ0KPj4gICAJaW50IHJldDsNCj4+ICAgCXN0cnVjdCBkZXZpY2Vf
bm9kZSAqbnA7DQo+PiAgIA0KPj4gKwlpZiAoZHJtX2Zpcm13YXJlX2RyaXZlcnNfb25seSgp
KQ0KPj4gKwkJcmV0dXJuIC1FTk9ERVY7DQo+PiArDQo+PiAgIAlldG5hdml2X3ZhbGlkYXRl
X2luaXQoKTsNCj4+ICAgDQo+PiAgIAlyZXQgPSBwbGF0Zm9ybV9kcml2ZXJfcmVnaXN0ZXIo
JmV0bmF2aXZfZ3B1X2RyaXZlcik7DQo+IA0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFu
bg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMg
R2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkN
CihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90
ZXYNCg==

--------------iJOLnnOvOMwRuQwqrM8nEBHr--

--------------CrPmv8TekHgKGKQGQoKrdmwr
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmG5t7cFAwAAAAAACgkQlh/E3EQov+B/
QRAAkEcqjRo4AyTW00mrxTHCPjTQ/EZjaBYwIC5dlxrqygwGO55GJLucCyew8tGfRLDvkLkWqfIi
r3NQ0QISzxf9d+8q1P3iFvilzrMHffir5i5YB5FiiMxXBKD55ygjlp54sW3uVnE8rmgzt2Fryq9D
DLgFb7pBczeBy+NY2+dBJu/g+axItLrFKDVTAp23SKIoHimfBivEbuG9juR2xAdKm1/HGysdiz0/
TCbkYVwOkpYulSEq7MCLiOJ80Foish3EZ3L4idS7+IOwaCUYmyE3McgAJNqTir9HIMH2SNBqUgUk
SvNuIXxjki5XV1CgncEjHMSQtEWES19lm/fGEXYWvianxwLDQrqb8SzyLwTKILQbzjkXWoy8AxjE
TzFCkg+TujKERnpJhqL6M51sK3XS/R9povWVMLUecH4Ky++60qr/n4fAMpgzK4MO7mv1JcV6NtIv
tNXoPIjlHxBYtNmZDdcdZw3XabLmNKHWRtM2jBtlE9li/QPxgOwQP37MbFV7TxT43gQr29/I8AUv
IJiWxCmHtMW4b3mxY4sStvYcV0dRsdN0vDVB+207gnmG3pWzHDxvUM6wKWC8QmrXqu4EjtKlAxNl
XmPtoQbAO77O2yhUx7HR5LSD7FBQZ61mw6Sz6b7BLgP9ExTLmfV3E7LLOk36T8CmiqTWEECRuJcp
KsI=
=cq8K
-----END PGP SIGNATURE-----

--------------CrPmv8TekHgKGKQGQoKrdmwr--
