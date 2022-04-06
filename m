Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A1E4F5B1E
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 12:41:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A31610E351;
	Wed,  6 Apr 2022 10:41:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61CFE10E351
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 10:41:16 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0D32621100;
 Wed,  6 Apr 2022 10:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1649241675; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qnaEOhayuYmWpbiHkr85IrGik5s2z8ve7Ojc95DbUes=;
 b=vIXWs/jmWU8n5NsN6sT0v2dhwV5U/Qfx1snuVcskPMYW+VYWT9vyCaU7V7UyiUCaejED+n
 RM2LbrU7oC3OBh+yfkBKwo0d+FaEvQWFbIGYmw2yhqgg6kFdhqrLdo5AZ7sFv9g2hcifuY
 N6PyL5Gi62xci+b9BQoM497a+MAjBs0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1649241675;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qnaEOhayuYmWpbiHkr85IrGik5s2z8ve7Ojc95DbUes=;
 b=hX9QGm/hNLiaUwxnaUJcg8mlPDIFg9YpBWfTWCxA/oz17b3LcqhbaNFgqaEWpLhZ8aP7Uq
 GRQsrqKj5A0vwlBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DC8B813A8E;
 Wed,  6 Apr 2022 10:41:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id x2vcNEpuTWKoKwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 06 Apr 2022 10:41:14 +0000
Message-ID: <4ae0c172-52f1-9e03-b150-7657eef331f7@suse.de>
Date: Wed, 6 Apr 2022 12:41:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v2 5/7] drm/vc4: hvs: Move the dlist setup to its own
 function
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org
References: <20220331143744.777652-1-maxime@cerno.tech>
 <20220331143744.777652-6-maxime@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220331143744.777652-6-maxime@cerno.tech>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------f0oDgWXQ07Ct3RDgruXLK7N6"
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------f0oDgWXQ07Ct3RDgruXLK7N6
Content-Type: multipart/mixed; boundary="------------iQuTWZ8ZRT3SghuhnUn3odfA";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>, dri-devel@lists.freedesktop.org
Cc: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <4ae0c172-52f1-9e03-b150-7657eef331f7@suse.de>
Subject: Re: [PATCH v2 5/7] drm/vc4: hvs: Move the dlist setup to its own
 function
References: <20220331143744.777652-1-maxime@cerno.tech>
 <20220331143744.777652-6-maxime@cerno.tech>
In-Reply-To: <20220331143744.777652-6-maxime@cerno.tech>

--------------iQuTWZ8ZRT3SghuhnUn3odfA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMzEuMDMuMjIgdW0gMTY6Mzcgc2NocmllYiBNYXhpbWUgUmlwYXJkOg0KPiBU
aGUgdmM0X2h2c191cGRhdGVfZGxpc3QgZnVuY3Rpb24gbW9zdGx5IGRlYWxzIHdpdGggc2V0
dGluZyB1cCB0aGUNCj4gdmJsYW5rIGV2ZW50cyBhbmQgc2V0dGluZyB1cCB0aGUgZGxpc3Qg
ZW50cnkgcG9pbnRlciB0byBvdXIgY3VycmVudA0KPiBhY3RpdmUgb25lLg0KPiANCj4gV2Un
bGwgd2FudCB0byBkbyB0aGUgZm9ybWVyIHNlcGFyYXRlbHkgZnJvbSB0aGUgdmJsYW5rIGhh
bmRsaW5nIGluIGxhdGVyDQo+IHBhdGNoZXMsIHNvIGxldCdzIG1vdmUgaXQgdG8gYSBmdW5j
dGlvbiBvZiBpdHMgb3duLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogTWF4aW1lIFJpcGFyZCA8
bWF4aW1lQGNlcm5vLnRlY2g+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS92YzQvdmM0
X2h2cy5jIHwgMTkgKysrKysrKysrKysrKystLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAx
NCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS92YzQvdmM0X2h2cy5jIGIvZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRf
aHZzLmMNCj4gaW5kZXggNzFhYTUwODFlYWEzLi4yZDU0MGZjMTEzNTcgMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2h2cy5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1
L2RybS92YzQvdmM0X2h2cy5jDQo+IEBAIC0zODIsMTAgKzM4MiwxOSBAQCBpbnQgdmM0X2h2
c19hdG9taWNfY2hlY2soc3RydWN0IGRybV9jcnRjICpjcnRjLCBzdHJ1Y3QgZHJtX2F0b21p
Y19zdGF0ZSAqc3RhdGUpDQo+ICAgCXJldHVybiAwOw0KPiAgIH0NCj4gICANCj4gK3N0YXRp
YyB2b2lkIHZjNF9odnNfaW5zdGFsbF9kbGlzdChzdHJ1Y3QgZHJtX2NydGMgKmNydGMpDQo+
ICt7DQo+ICsJc3RydWN0IGRybV9kZXZpY2UgKmRldiA9IGNydGMtPmRldjsNCj4gKwlzdHJ1
Y3QgdmM0X2RldiAqdmM0ID0gdG9fdmM0X2RldihkZXYpOw0KPiArCXN0cnVjdCB2YzRfY3J0
Y19zdGF0ZSAqdmM0X3N0YXRlID0gdG9fdmM0X2NydGNfc3RhdGUoY3J0Yy0+c3RhdGUpOw0K
PiArDQo+ICsJSFZTX1dSSVRFKFNDQUxFUl9ESVNQTElTVFgodmM0X3N0YXRlLT5hc3NpZ25l
ZF9jaGFubmVsKSwNCj4gKwkJICB2YzRfc3RhdGUtPm1tLnN0YXJ0KTsNCj4gK30NCj4gKw0K
PiAgIHN0YXRpYyB2b2lkIHZjNF9odnNfdXBkYXRlX2RsaXN0KHN0cnVjdCBkcm1fY3J0YyAq
Y3J0YykNCj4gICB7DQo+ICAgCXN0cnVjdCBkcm1fZGV2aWNlICpkZXYgPSBjcnRjLT5kZXY7
DQo+IC0Jc3RydWN0IHZjNF9kZXYgKnZjNCA9IHRvX3ZjNF9kZXYoZGV2KTsNCj4gICAJc3Ry
dWN0IHZjNF9jcnRjICp2YzRfY3J0YyA9IHRvX3ZjNF9jcnRjKGNydGMpOw0KPiAgIAlzdHJ1
Y3QgdmM0X2NydGNfc3RhdGUgKnZjNF9zdGF0ZSA9IHRvX3ZjNF9jcnRjX3N0YXRlKGNydGMt
PnN0YXRlKTsNCj4gICAJdW5zaWduZWQgbG9uZyBmbGFnczsNCj4gQEAgLTQwNSw5ICs0MTQs
NiBAQCBzdGF0aWMgdm9pZCB2YzRfaHZzX3VwZGF0ZV9kbGlzdChzdHJ1Y3QgZHJtX2NydGMg
KmNydGMpDQo+ICAgCQlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZkZXYtPmV2ZW50X2xvY2ss
IGZsYWdzKTsNCj4gICAJfQ0KPiAgIA0KPiAtCUhWU19XUklURShTQ0FMRVJfRElTUExJU1RY
KHZjNF9zdGF0ZS0+YXNzaWduZWRfY2hhbm5lbCksDQo+IC0JCSAgdmM0X3N0YXRlLT5tbS5z
dGFydCk7DQo+IC0NCj4gICAJc3Bpbl9sb2NrX2lycXNhdmUoJnZjNF9jcnRjLT5pcnFfbG9j
aywgZmxhZ3MpOw0KPiAgIAl2YzRfY3J0Yy0+Y3VycmVudF9kbGlzdCA9IHZjNF9zdGF0ZS0+
bW0uc3RhcnQ7DQo+ICAgCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJnZjNF9jcnRjLT5pcnFf
bG9jaywgZmxhZ3MpOw0KPiBAQCAtNDM0LDYgKzQ0MCw3IEBAIHZvaWQgdmM0X2h2c19hdG9t
aWNfZW5hYmxlKHN0cnVjdCBkcm1fY3J0YyAqY3J0YywNCj4gICAJc3RydWN0IHZjNF9jcnRj
ICp2YzRfY3J0YyA9IHRvX3ZjNF9jcnRjKGNydGMpOw0KPiAgIAlib29sIG9uZXNob3QgPSB2
YzRfY3J0Yy0+ZmVlZHNfdHhwOw0KPiAgIA0KPiArCXZjNF9odnNfaW5zdGFsbF9kbGlzdChj
cnRjKTsNCj4gICAJdmM0X2h2c191cGRhdGVfZGxpc3QoY3J0Yyk7DQo+ICAgCXZjNF9odnNf
aW5pdF9jaGFubmVsKHZjNCwgY3J0YywgbW9kZSwgb25lc2hvdCk7DQo+ICAgfQ0KPiBAQCAt
NTA5LDggKzUxNiwxMCBAQCB2b2lkIHZjNF9odnNfYXRvbWljX2ZsdXNoKHN0cnVjdCBkcm1f
Y3J0YyAqY3J0YywNCj4gICAJICogSWYgdGhlIENSVEMgaXMgYmVpbmcgZGlzYWJsZWQsIHRo
ZXJlJ3Mgbm8gcG9pbnQgaW4gdXBkYXRpbmcgdGhpcw0KPiAgIAkgKiBpbmZvcm1hdGlvbi4N
Cj4gICAJICovDQo+IC0JaWYgKGNydGMtPnN0YXRlLT5hY3RpdmUgJiYgb2xkX3N0YXRlLT5h
Y3RpdmUpDQo+ICsJaWYgKGNydGMtPnN0YXRlLT5hY3RpdmUgJiYgb2xkX3N0YXRlLT5hY3Rp
dmUpIHsNCj4gKwkJdmM0X2h2c19pbnN0YWxsX2RsaXN0KGNydGMpOw0KPiAgIAkJdmM0X2h2
c191cGRhdGVfZGxpc3QoY3J0Yyk7DQo+ICsJfQ0KDQpObyBuZWVkIGZvciBicmFjZXMgaGVy
ZS4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiAgIA0KPiAgIAlpZiAoY3J0Yy0+c3Rh
dGUtPmNvbG9yX21nbXRfY2hhbmdlZCkgew0KPiAgIAkJdTMyIGRpc3Bia2duZHggPSBIVlNf
UkVBRChTQ0FMRVJfRElTUEJLR05EWChjaGFubmVsKSk7DQoNCi0tIA0KVGhvbWFzIFppbW1l
cm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRp
b25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJt
YW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZv
IFRvdGV2DQo=

--------------iQuTWZ8ZRT3SghuhnUn3odfA--

--------------f0oDgWXQ07Ct3RDgruXLK7N6
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJNbkoFAwAAAAAACgkQlh/E3EQov+Dt
sA//XxohWrcPjXxUD0o6eCNaDcKZxBK9C1BoWnxA1upvnZDA+MCqYpzLPrAqTjAzGEdHHD3lOKfd
euVDj6nkxGwDEGOaF1tMk4rLoidcyzp/9Cyv133/EA6spG3uXFSrF9aiUN7dwTvlO378lXmMtIKD
G+ANGYkMeqOp1GRJGIVkYIv41S4HUkL/Abke7hwEryKyEkcGWdpXkkmDQXgkpZrXpUM1hQ5+UWry
voQmE670EIKptX1i4+oQHj8pq/tBS1DXQOwfAGqhWur0M9PxOh+UUSAI/s/f9ejVQCcVs6ZbCq3D
mcOyFGn6C7Gn1q5FnnIADgDfPuNqcsbr1dWX8YMQodHAVFHmB330AfXMAyevi7atuNqUAXKQFXnS
RNb2gZlPAzi4giyrkDYn31kAyUiZ0NZYkIJLfsnyKVFj4v4F7jGOlfFdMVB9DY6mZyj/deoqhE79
tYYI618MU79IUmT/L0Xh/IFlHewC2qiS4Sd5SCUbXnTEHzyQjUqenRSO/ttCnhTmrn22uX4EN0iT
ZFH71xCsDWbiuXLOxLW+LIiomNcFKn1pnH20tKwS4bvR1f91VnuSuVrS1FtbBRA8fyQQwX6Ka4wG
O++4/+ut6wLB4ssDzC+YLNDjomXbUIY/hjtl46T6hgqD3ri5X9Jv5kHKrKNo+t71I6ituepSzrH7
s+c=
=LKX1
-----END PGP SIGNATURE-----

--------------f0oDgWXQ07Ct3RDgruXLK7N6--
