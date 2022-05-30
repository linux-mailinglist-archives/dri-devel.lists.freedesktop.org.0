Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE8253755E
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 09:26:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBA2010E7C3;
	Mon, 30 May 2022 07:26:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33F0410E7AD;
 Mon, 30 May 2022 07:26:16 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C4EB921AB5;
 Mon, 30 May 2022 07:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1653895574; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mJhMXK11Oy9OhbT6zRLVWRcJQzjCFhTldK+ScXnegQA=;
 b=GFazepm3++MQc+JvEX+nuoDzrGWvVKQtNGemVY6id7ald3HrjbGSJKqjYk7Dr+C2mKrezG
 7HUG+YsPdcW8WwKRTGbq6sThn/PB4b6lFbjBuVs9A5iJ9qLNVgLZyCxrEVafdJ9aO7N3jE
 uHp/9Fuxl5dw7JMnSY1Ky9tLsHyClUw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1653895574;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mJhMXK11Oy9OhbT6zRLVWRcJQzjCFhTldK+ScXnegQA=;
 b=pWMxiAVxkYR1ilH6EE+IPModiCqZn0R8C3qoYh/x6JLx5n2PoZstXcUn+AUta+rlpaK1b4
 Z0BqCUwAGnEwSTAQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9A7C913A84;
 Mon, 30 May 2022 07:26:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id FYujJJZxlGIJcwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 30 May 2022 07:26:14 +0000
Message-ID: <0bf230f4-c888-b9c9-f061-7450406baa4a@suse.de>
Date: Mon, 30 May 2022 09:26:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] drm/prime: Ensure mmap offset is initialized
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20220529162936.2539901-1-robdclark@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220529162936.2539901-1-robdclark@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------KAozOQ62OHty5tESxRwyUNjL"
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------KAozOQ62OHty5tESxRwyUNjL
Content-Type: multipart/mixed; boundary="------------WQ1cpBIzbW4zQgWTHfM76xLG";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>, freedreno@lists.freedesktop.org
Message-ID: <0bf230f4-c888-b9c9-f061-7450406baa4a@suse.de>
Subject: Re: [PATCH] drm/prime: Ensure mmap offset is initialized
References: <20220529162936.2539901-1-robdclark@gmail.com>
In-Reply-To: <20220529162936.2539901-1-robdclark@gmail.com>

--------------WQ1cpBIzbW4zQgWTHfM76xLG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjkuMDUuMjIgdW0gMTg6Mjkgc2NocmllYiBSb2IgQ2xhcms6DQo+IEZyb206
IFJvYiBDbGFyayA8cm9iZGNsYXJrQGNocm9taXVtLm9yZz4NCj4gDQo+IElmIGEgR0VNIG9i
amVjdCBpcyBhbGxvY2F0ZWQsIGFuZCB0aGVuIGV4cG9ydGVkIGFzIGEgZG1hLWJ1ZiBmZCB3
aGljaCBpcw0KPiBtbWFwJ2QgYmVmb3JlIG9yIHdpdGhvdXQgdGhlIEdFTSBidWZmZXIgYmVp
bmcgZGlyZWN0bHkgbW1hcCdkLCB0aGUNCj4gdm1hX25vZGUgY291bGQgYmUgdW5pdGlhbGl6
ZWQuICBUaGlzIGxlYWRzIHRvIGEgc2l0dWF0aW9uIHdoZXJlIHRoZSBDUFUNCj4gbWFwcGlu
ZyBpcyBub3QgY29ycmVjdGx5IHRvcm4gZG93biBpbiBkcm1fdm1hX25vZGVfdW5tYXAoKS4N
Cg0KV2hpY2ggZHJpdmVycyBhcmUgYWZmZWN0ZWQgYnkgdGhpcyBwcm9ibGVtPw0KDQpJIGNo
ZWNrZWQgc2V2ZXJhbCBkcml2ZXJzIGFuZCBtb3N0IGFwcGVhciB0byBiZSBpbml0aWFsaXpp
bmcgdGhlIG9mZnNldCANCmR1cmluZyBvYmplY3QgY29uc3RydWN0aW9uLCBzdWNoIGFzIEdF
TSBTSE1FTS4gWzFdIFRUTS1iYXNlZCBkcml2ZXJzIA0KYWxzbyBzZWVtIHVuYWZmZWN0ZWQu
IFsyXQ0KDQogRnJvbSBhIHF1aWNrIGdyZXAsIG9ubHkgZXRuYXZpdiwgbXNtIGFuZCBvbWFw
ZHJtIGFwcGVhciB0byBiZSBhZmZlY3RlZD8gDQpUaGV5IG9ubHkgc2VlbSB0byBydW4gZHJt
X2dlbV9jcmVhdGVfbW1hcF9vZmZzZXQoKSBmcm9tIHRoZWlyIA0KaW9jdGwtaGFuZGxpbmcg
Y29kZS4NCg0KSWYgc28sIEknZCBzYXkgaXQncyBwcmVmZXJhYmxlIHRvIGZpeCB0aGVzZSBk
cml2ZXJzIGFuZCBwdXQgYSANCmRybV9XQVJOX09OQ0UoKSBpbnRvIGRybV9nZW1fcHJpbWVf
bW1hcCgpLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQpbMV0gDQpodHRwczovL2VsaXhp
ci5ib290bGluLmNvbS9saW51eC92NS4xOC9zb3VyY2UvZHJpdmVycy9ncHUvZHJtL2RybV9n
ZW1fc2htZW1faGVscGVyLmMjTDg1DQpbMl0gDQpodHRwczovL2VsaXhpci5ib290bGluLmNv
bS9saW51eC92NS4xOC9zb3VyY2UvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyNMMTAw
Mg0KDQo+IA0KPiBGaXhlczogZTU1MTY1NTM5OTlmICgiZHJtOiBjYWxsIGRybV9nZW1fb2Jq
ZWN0X2Z1bmNzLm1tYXAgd2l0aCBmYWtlIG9mZnNldCIpDQo+IFNpZ25lZC1vZmYtYnk6IFJv
YiBDbGFyayA8cm9iZGNsYXJrQGNocm9taXVtLm9yZz4NCj4gLS0tDQo+IE5vdGUsIGl0J3Mg
cG9zc2libGUgdGhlIGlzc3VlIGV4aXN0ZWQgaW4gc29tZSByZWxhdGVkIGZvcm0gcHJpb3Ig
dG8gdGhlDQo+IGNvbW1pdCB0YWdnZWQgd2l0aCBGaXhlcy4NCj4gDQo+ICAgZHJpdmVycy9n
cHUvZHJtL2RybV9wcmltZS5jIHwgNSArKysrKw0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA1IGlu
c2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3By
aW1lLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMNCj4gaW5kZXggZTNmMDlmMTgx
MTBjLi44NDllZWExNTRkZmMgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1f
cHJpbWUuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW1lLmMNCj4gQEAgLTcx
Niw2ICs3MTYsMTEgQEAgaW50IGRybV9nZW1fcHJpbWVfbW1hcChzdHJ1Y3QgZHJtX2dlbV9v
YmplY3QgKm9iaiwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpDQo+ICAgCXN0cnVjdCBm
aWxlICpmaWw7DQo+ICAgCWludCByZXQ7DQo+ICAgDQo+ICsJLyogRW5zdXJlIHRoYXQgdGhl
IHZtYV9ub2RlIGlzIGluaXRpYWxpemVkOiAqLw0KPiArCXJldCA9IGRybV9nZW1fY3JlYXRl
X21tYXBfb2Zmc2V0KG9iaik7DQo+ICsJaWYgKHJldCkNCj4gKwkJcmV0dXJuIHJldDsNCj4g
Kw0KPiAgIAkvKiBBZGQgdGhlIGZha2Ugb2Zmc2V0ICovDQo+ICAgCXZtYS0+dm1fcGdvZmYg
Kz0gZHJtX3ZtYV9ub2RlX3N0YXJ0KCZvYmotPnZtYV9ub2RlKTsNCj4gICANCg0KLS0gDQpU
aG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0
d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xy
bmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNm
w7xocmVyOiBJdm8gVG90ZXYNCg==

--------------WQ1cpBIzbW4zQgWTHfM76xLG--

--------------KAozOQ62OHty5tESxRwyUNjL
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmKUcZUFAwAAAAAACgkQlh/E3EQov+Bw
Rw//W0YImYzt681b9jeTvi99JxWCBN10xHjtXjt9frakEKCA6CbV3NfBp8bbJBpC92l7RQhgHkJn
A4fglQwVsZBFELAxjiv97XAf+2bNumGHvQCUVHBZZIA+ug7Q2QtEanZe/69C7PisFBJAgnU/2mU6
Y/UAfKU2fd0fW47khfuDyQrxE15OHHDA3YCnuj5kWl10BxgbcJTMpKFk0CuEculFDpg04ptBFSaK
y22kBGEAoRDxjlXSNJdsAVU//aeQDfdV1DwIQNsonj91VpSDrzDzcf+L+qFOGM0VCUi7Uh1QgIQ0
Z7wM2OLdJUQLfP1/BZpLZy4jo0rf85Qw9bP526apAcz3EVB4+oYnXlcZ7SEmiRr6UaihkOySLWbc
dmPbvG7UM2IFkkZsZK1aFQUeDxESXW3wltmvUjt6YwICZf/XSwqu4WFOPuJbbQEX0ykXCxf2ideE
kyG2jw3HF1OgEYUYpJsZRV5KbySOS+73kmRoQFptD3X4/L4ScBPPoWD6G6Cj3PeQJ2OK6VDIgCsH
VH4RKxzjspxDakcXM0TChx6S0ms4OhKUro9yNh1wwjBX+Ncc1ew/qBlJWfYvyol+zXk9FhBAOiUa
zzZfzlScYWwPg0+jUMKi2saSeKSv9qsx/BopsPQ1yzt3v46zcF+aBljQTGtWu8d19reoRxDMOy6j
Ngc=
=DPWT
-----END PGP SIGNATURE-----

--------------KAozOQ62OHty5tESxRwyUNjL--
