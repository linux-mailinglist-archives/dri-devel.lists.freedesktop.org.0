Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB68A755EBC
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 10:49:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6794010E06E;
	Mon, 17 Jul 2023 08:48:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FEF010E06E
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 08:48:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id F2E831FD9A;
 Mon, 17 Jul 2023 08:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1689583736; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MPRiKHT+oedBwn1p6ofSt/hcWqOi/6EpZwqnp1LfEQs=;
 b=UtIVTE7638XHShjf3jyfImBuLmkltpLtQDdP9pOcfh422Xb/5sLAsIcoDofPc9D82bj1wL
 /gqhMyBXe5XVfwD2atro9WGbOg7Cx2sXMK1F/4OITYXMiRdNNxl3quXKKfHpZnqga7HZe5
 4DfOm2ARgwuP1Fy+T5e2TqLbGC6lPug=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1689583736;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MPRiKHT+oedBwn1p6ofSt/hcWqOi/6EpZwqnp1LfEQs=;
 b=yhpx7pNl7a7BWouY38HAcTRN8W+uLbCTbznihLM3Jqhk9KoLi+6pPKWdHL/sSUBJ4jlouz
 AiluiUFpjlGHEAAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D6B8513276;
 Mon, 17 Jul 2023 08:48:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id hfBHM3cAtWTMMQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 17 Jul 2023 08:48:55 +0000
Message-ID: <bbbb18e0-5de1-5155-c6b2-52a2b1d75898@suse.de>
Date: Mon, 17 Jul 2023 10:48:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] drm/ssd130x: Fix an oops when attempting to update a
 disabled plane
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20230713163213.1028952-1-javierm@redhat.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230713163213.1028952-1-javierm@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------4K60Jq0o0fwCetwZ0U0s6yw3"
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------4K60Jq0o0fwCetwZ0U0s6yw3
Content-Type: multipart/mixed; boundary="------------cxhBpQSNuM8gHz71bK6uXc6q";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Geert Uytterhoeven <geert@linux-m68k.org>
Message-ID: <bbbb18e0-5de1-5155-c6b2-52a2b1d75898@suse.de>
Subject: Re: [PATCH] drm/ssd130x: Fix an oops when attempting to update a
 disabled plane
References: <20230713163213.1028952-1-javierm@redhat.com>
In-Reply-To: <20230713163213.1028952-1-javierm@redhat.com>

--------------cxhBpQSNuM8gHz71bK6uXc6q
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTMuMDcuMjMgdW0gMTg6MzIgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IEdlZXJ0IHJlcG9ydHMgdGhhdCB0aGUgZm9sbG93aW5nIE5VTEwgcG9pbnRl
ciBkZXJlZmVyZW5jZSBoYXBwZW5zIGZvciBoaW0NCj4gYWZ0ZXIgY29tbWl0IDQ5ZDdkNTgx
Y2VhZiAoImRybS9zc2QxMzB4OiBEb24ndCBhbGxvY2F0ZSBidWZmZXJzIG9uIGVhY2gNCj4g
cGxhbmUgdXBkYXRlIik6DQo+IA0KPiAgICAgIFtkcm1dIEluaXRpYWxpemVkIHNzZDEzMHgg
MS4wLjAgMjAyMjAxMzEgZm9yIDAtMDAzYyBvbiBtaW5vciAwDQo+ICAgICAgc3NkMTMweC1p
MmMgMC0wMDNjOiBbZHJtXSBzdXJmYWNlIHdpZHRoKDEyOCksIGhlaWdodCgzMiksIGJwcCgx
KQ0KPiAgICAgIGFuZCBmb3JtYXQoUjEgICBsaXR0bGUtZW5kaWFuICgweDIwMjAzMTUyKSkN
Cj4gICAgICBVbmFibGUgdG8gaGFuZGxlIGtlcm5lbCBOVUxMIHBvaW50ZXIgZGVyZWZlcmVu
Y2UgYXQgdmlydHVhbCBhZGRyZXNzIDAwMDAwMDAwDQo+ICAgICAgT29wcyBbIzFdDQo+ICAg
ICAgQ1BVOiAwIFBJRDogMSBDb21tOiBzd2FwcGVyIE5vdCB0YWludGVkDQo+ICAgICAgNi41
LjAtcmMxLW9yYW5nZWNyYWItMDIyMTktZzBhNTI5YTFlNGJmNCAjNTY1DQo+ICAgICAgZXBj
IDogc3NkMTMweF91cGRhdGVfcmVjdC5pc3JhLjArMHgxM2MvMHgzNDANCj4gICAgICAgcmEg
OiBzc2QxMzB4X3VwZGF0ZV9yZWN0LmlzcmEuMCsweDJiYy8weDM0MA0KPiAgICAgIC4uLg0K
PiAgICAgIHN0YXR1czogMDAwMDAxMjAgYmFkYWRkcjogMDAwMDAwMDAgY2F1c2U6IDAwMDAw
MDBmDQo+ICAgICAgWzxjMDMwM2Q5MD5dIHNzZDEzMHhfdXBkYXRlX3JlY3QuaXNyYS4wKzB4
MTNjLzB4MzQwDQo+ICAgICAgWzxjMDMwNDIwMD5dIHNzZDEzMHhfcHJpbWFyeV9wbGFuZV9o
ZWxwZXJfYXRvbWljX3VwZGF0ZSsweDI2Yy8weDI4NA0KPiAgICAgIFs8YzAyZjhkNTQ+XSBk
cm1fYXRvbWljX2hlbHBlcl9jb21taXRfcGxhbmVzKzB4ZmMvMHgyN2MNCj4gICAgICBbPGMw
MmY5MzE0Pl0gZHJtX2F0b21pY19oZWxwZXJfY29tbWl0X3RhaWwrMHg1Yy8weGI0DQo+ICAg
ICAgWzxjMDJmOTRmYz5dIGNvbW1pdF90YWlsKzB4MTkwLzB4MWI4DQo+ICAgICAgWzxjMDJm
OTlmYz5dIGRybV9hdG9taWNfaGVscGVyX2NvbW1pdCsweDE5NC8weDFjMA0KPiAgICAgIFs8
YzAyYzVkMDA+XSBkcm1fYXRvbWljX2NvbW1pdCsweGE0LzB4ZTQNCj4gICAgICBbPGMwMmNj
ZTQwPl0gZHJtX2NsaWVudF9tb2Rlc2V0X2NvbW1pdF9hdG9taWMrMHgyNDQvMHgyNzgNCj4g
ICAgICBbPGMwMmNjZWYwPl0gZHJtX2NsaWVudF9tb2Rlc2V0X2NvbW1pdF9sb2NrZWQrMHg3
Yy8weDFiYw0KPiAgICAgIFs8YzAyY2QwNjQ+XSBkcm1fY2xpZW50X21vZGVzZXRfY29tbWl0
KzB4MzQvMHg2NA0KPiAgICAgIFs8YzAzMDFhNzg+XSBfX2RybV9mYl9oZWxwZXJfcmVzdG9y
ZV9mYmRldl9tb2RlX3VubG9ja2VkKzB4YzQvMHhlOA0KPiAgICAgIFs8YzAzMDM0MjQ+XSBk
cm1fZmJfaGVscGVyX3NldF9wYXIrMHgzOC8weDU4DQo+ICAgICAgWzxjMDI3YzQxMD5dIGZi
Y29uX2luaXQrMHgyOTQvMHg1MzQNCj4gICAgICAuLi4NCj4gDQo+IFRoZSBwcm9ibGVtIGlz
IHRoYXQgZmJjb24gY2FsbHMgZmJjb25faW5pdCgpIHdoaWNoIHRyaWdnZXJzIGEgRFJNIG1v
ZGVzZXQNCj4gYW5kIHRoaXMgbGVhZHMgdG8gZHJtX2F0b21pY19oZWxwZXJfY29tbWl0X3Bs
YW5lcygpIGF0dGVtcHRpbmcgdG8gY29tbWl0DQo+IHRoZSBhdG9taWMgc3RhdGUgZm9yIGFs
bCBwbGFuZXMsIGV2ZW4gdGhlIG9uZXMgd2hvc2UgQ1JUQyBpcyBub3QgZW5hYmxlZC4NCj4g
DQo+IFNpbmNlIHRoZSBwcmltYXJ5IHBsYW5lIGJ1ZmZlciBpcyBhbGxvY2F0ZWQgaW4gdGhl
IGVuY29kZXIgLmF0b21pY19lbmFibGUNCj4gY2FsbGJhY2ssIHRoaXMgaGFwcGVucyBhZnRl
ciB0aGF0IGluaXRpYWwgbW9kZXNldCBjb21taXQgYW5kIGxlYWRzIHRvIHRoZQ0KPiBtZW50
aW9uZWQgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNlLg0KPiANCj4gRml4IHRoaXMgYnkgbm90
IHVzaW5nIHRoZSBkZWZhdWx0IGRybV9hdG9taWNfaGVscGVyX2NvbW1pdF90YWlsKCkgaGVs
cGVyLA0KPiBidXQgaW5zdGVhZCB0aGUgZHJtX2F0b21pY19oZWxwZXJfY29tbWl0X3RhaWxf
cnBtKCkgZnVuY3Rpb24gdGhhdCBkb2Vzbid0DQo+IGF0dGVtcHQgdG8gY29tbWl0IHRoZSBh
dG9taWMgc3RhdGUgZm9yIHBsYW5lcyByZWxhdGVkIHRvIGluYWN0aXZlIENSVENzLg0KPiAN
Cj4gUmVwb3J0ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5v
cmc+DQo+IFNpZ25lZC1vZmYtYnk6IEphdmllciBNYXJ0aW5leiBDYW5pbGxhcyA8amF2aWVy
bUByZWRoYXQuY29tPg0KPiAtLS0NCj4gDQo+ICAgZHJpdmVycy9ncHUvZHJtL3NvbG9tb24v
c3NkMTMweC5jIHwgNSArKysrKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMo
KykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vc29sb21vbi9zc2QxMzB4
LmMgYi9kcml2ZXJzL2dwdS9kcm0vc29sb21vbi9zc2QxMzB4LmMNCj4gaW5kZXggYWZiMDhh
OGFhOWZjLi4xMjgyMGQxNmIxNWIgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9z
b2xvbW9uL3NzZDEzMHguYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vc29sb21vbi9zc2Qx
MzB4LmMNCj4gQEAgLTc5NSw2ICs3OTUsMTAgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1f
bW9kZV9jb25maWdfZnVuY3Mgc3NkMTMweF9tb2RlX2NvbmZpZ19mdW5jcyA9IHsNCj4gICAJ
LmF0b21pY19jb21taXQgPSBkcm1fYXRvbWljX2hlbHBlcl9jb21taXQsDQo+ICAgfTsNCj4g
ICANCj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX21vZGVfY29uZmlnX2hlbHBlcl9mdW5j
cyBzc2QxMzB4X21vZGVfY29uZmlnX2hlbHBlcnMgPSB7DQo+ICsJLmF0b21pY19jb21taXRf
dGFpbCA9IGRybV9hdG9taWNfaGVscGVyX2NvbW1pdF90YWlsX3JwbSwNCj4gK307DQo+ICsN
Cg0KQWZ0ZXIgc29tZSBkaXNjdXNzaW9uIG9uIElSQywgSSdkIHN1Z2dlc3QgdG8gYWxsb2Nh
dGUgdGhlIGJ1ZmZlciANCnNvbWV3aGVyZSB3aXRoaW4gcHJvYmUuIFNvIGl0IHdpbGwgYWx3
YXlzIGJlIHRoZXJlIHdoZW4gdGhlIHBsYW5lIGNvZGUgcnVucy4NCg0KQSBmdWxsIGZpeCB3
b3VsZCBiZSB0byBhbGxvY2F0ZSB0aGUgYnVmZmVyIG1lbW9yeSBhcyBwYXJ0IG9mIHRoZSBw
bGFuZSANCnN0YXRlIGFuZC9vciB0aGUgcGxhbmUncyBhdG9taWNfY2hlY2suIFRoYXQncyBh
IGJpdCBtb3JlIGNvbXBsaWNhdGVkIGlmIA0KeW91IHdhbnQgdG8gc2hhcmVkIHRoZSBidWZm
ZXIgbWVtb3J5IGFjcm9zcyBwbGFuZSB1cGRhdGVzLg0KDQpCZXN0IHJlZ2FyZHMNClRob21h
cw0KDQoNCj4gICBzdGF0aWMgY29uc3QgdWludDMyX3Qgc3NkMTMweF9mb3JtYXRzW10gPSB7
DQo+ICAgCURSTV9GT1JNQVRfWFJHQjg4ODgsDQo+ICAgfTsNCj4gQEAgLTkyMyw2ICs5Mjcs
NyBAQCBzdGF0aWMgaW50IHNzZDEzMHhfaW5pdF9tb2Rlc2V0KHN0cnVjdCBzc2QxMzB4X2Rl
dmljZSAqc3NkMTMweCkNCj4gICAJZHJtLT5tb2RlX2NvbmZpZy5tYXhfaGVpZ2h0ID0gbWF4
X2hlaWdodDsNCj4gICAJZHJtLT5tb2RlX2NvbmZpZy5wcmVmZXJyZWRfZGVwdGggPSAyNDsN
Cj4gICAJZHJtLT5tb2RlX2NvbmZpZy5mdW5jcyA9ICZzc2QxMzB4X21vZGVfY29uZmlnX2Z1
bmNzOw0KPiArCWRybS0+bW9kZV9jb25maWcuaGVscGVyX3ByaXZhdGUgPSAmc3NkMTMweF9t
b2RlX2NvbmZpZ19oZWxwZXJzOw0KPiAgIA0KPiAgIAkvKiBQcmltYXJ5IHBsYW5lICovDQo+
ICAgDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9w
ZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFz
c2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJl
dyBNeWVycywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAo
QUcgTnVlcm5iZXJnKQ0K

--------------cxhBpQSNuM8gHz71bK6uXc6q--

--------------4K60Jq0o0fwCetwZ0U0s6yw3
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmS1AHcFAwAAAAAACgkQlh/E3EQov+DJ
Jw//U68dck+YAnMde40ANk4vLKi2PY9LhRVE+xvorBme8h/Oo6t//DTidt/5Fb0GhLddn370pc4j
zFjPaGnkFllZJRcKXNo1h4ikpsvBD/pYVoGx6ycx9srO5DZQ6eMI+1kAcQovfKFbAMFuLhqPvR3z
vlRc33/j223xYlwuld0dcY8bbyc84GyOnbHJskLhPUvRoKHFkKIge5MLzWjK2rSX4kmd+bp1jRNk
jmYT5KOaIRPg8MBnhw18l/CUoLz0OjBXzyt329OE3I4YPOMZZ2rkFMyuhMOqsMmKhe/blYAPa55j
/4WtePLzdZbtXj1VQaz18Vv4uiXY1U8Lh4BDl5VDZUuOCBe4GBNK2CgKQ7BZqa4n9eJCmyDjYqHE
Sl9iYAm5TYbZrn+u4+3uLo+ItG6t6siAQiayViPLczStXK7NucbcjRFRd/pKIzJUybz6gGJuuXJz
GNV6bfeRwLLnAIvQmLbAaXDBAgKsrDXaybQ0vf/mbay+pG9cX0xlk2+RywCb1zWhL/xRgyvQl2RW
e0HzjiBGUb41J/HyxEfPKIVKjD4SoO9W8FbBHMT/pQTPPfAESzU5id8oHecriB4hikoy0ogXk1jw
NWdI+b/VTWrs3kzZbXRQ29HJEAdW1QH5BpUbOubDJdgJWsihhxdJtOMxkOK6+AgZLnnwyyIHT3UE
QnY=
=90aF
-----END PGP SIGNATURE-----

--------------4K60Jq0o0fwCetwZ0U0s6yw3--
