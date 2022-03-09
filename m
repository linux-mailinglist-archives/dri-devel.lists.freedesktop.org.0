Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2DF4D2B1A
	for <lists+dri-devel@lfdr.de>; Wed,  9 Mar 2022 09:59:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 830FF890BA;
	Wed,  9 Mar 2022 08:59:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B02D890BA
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Mar 2022 08:59:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CB9C81F382;
 Wed,  9 Mar 2022 08:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1646816359; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wLJltizetGHjLy0bZkVmUTitFEvO6Iw9LN4l/yyRS9g=;
 b=xJMU4JKBSqycf0f11ZqQDeTWq8g0sgu8sXlzxDvY3ymXsnEjo2mL3To6E1LhAjb3XPzIN3
 5CAUmI3rligO9NMeQ9QbqUSIZmntFRr7OlIAUumTmUJrFwRet1a4g1lgiy7C2ZmD7VVxmb
 FfE2tY0p/LbhZKpRBCZ7S8QXYzSmHqw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1646816359;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wLJltizetGHjLy0bZkVmUTitFEvO6Iw9LN4l/yyRS9g=;
 b=FVf+aJpycFvcYs5csUbOIGvtOk4h/lSiBWKtewL8ZuNuCp//g+2yxksSChU0hjt780ptOA
 X+8qpbgpPd8ebIBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 75B1F13B71;
 Wed,  9 Mar 2022 08:59:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id zqAWG2dsKGLzGAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 09 Mar 2022 08:59:19 +0000
Message-ID: <4ce1e172-799c-cba3-0a72-4a6fdf2c6d2f@suse.de>
Date: Wed, 9 Mar 2022 09:59:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH v1 0/5] Add memory shrinker to VirtIO-GPU DRM driver
Content-Language: en-US
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>
References: <20220308131725.60607-1-dmitry.osipenko@collabora.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220308131725.60607-1-dmitry.osipenko@collabora.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------m91zCDjNLtfE3G4JVLYLEQQq"
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Dmitry Osipenko <digetx@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------m91zCDjNLtfE3G4JVLYLEQQq
Content-Type: multipart/mixed; boundary="------------OBPBu7VXBcmaoAijlAdrHv6p";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@linux.ie>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 dri-devel@lists.freedesktop.org, Dmitry Osipenko <digetx@gmail.com>
Message-ID: <4ce1e172-799c-cba3-0a72-4a6fdf2c6d2f@suse.de>
Subject: Re: [PATCH v1 0/5] Add memory shrinker to VirtIO-GPU DRM driver
References: <20220308131725.60607-1-dmitry.osipenko@collabora.com>
In-Reply-To: <20220308131725.60607-1-dmitry.osipenko@collabora.com>

--------------OBPBu7VXBcmaoAijlAdrHv6p
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDguMDMuMjIgdW0gMTQ6MTcgc2NocmllYiBEbWl0cnkgT3NpcGVua286DQo+
IEhlbGxvLA0KPiANCj4gVGhpcyBwYXRjaHNldCBpbnRyb2R1Y2VzIG1lbW9yeSBzaHJpbmtl
ciBmb3IgdGhlIFZpcnRJTy1HUFUgRFJNIGRyaXZlci4NCj4gRHVyaW5nIE9PTSwgdGhlIHNo
cmlua2VyIHdpbGwgcmVsZWFzZSBCT3MgdGhhdCBhcmUgbWFya2VkIGFzICJub3QgbmVlZGVk
Ig0KPiBieSB1c2Vyc3BhY2UgdXNpbmcgdGhlIG5ldyBtYWR2aXNlIElPQ1RMLiBUaGUgdXNl
cnNwYWNlIGluIHRoaXMgY2FzZSBpcw0KPiB0aGUgTWVzYSBWaXJHTCBkcml2ZXIsIGl0IHdp
bGwgbWFyayB0aGUgY2FjaGVkIEJPcyBhcyAibm90IG5lZWRlZCIsDQo+IGFsbG93aW5nIGtl
cm5lbCBkcml2ZXIgdG8gcmVsZWFzZSBtZW1vcnkgb2YgdGhlIGNhY2hlZCBzaG1lbSBCT3Mg
b24gbG93bWVtDQo+IHNpdHVhdGlvbnMsIHByZXZlbnRpbmcgT09NIGtpbGxzLg0KDQpWaXJ0
aW8tZ3B1IGlzIGJ1aWxkIG9uIHRvcCBvZiBHRU0gc2htZW0gaGVscGVycy4gSSBoYXZlIGEg
cHJvdG90eXBlIA0KcGF0Y2hzZXQgdGhhdCBhZGRzIGEgc2hyaW5rZXIgdG8gdGhlc2UgaGVs
cGVycy4gSWYgeW91IHdhbnQgdG8gZ28gDQpmdXJ0aGVyLCB5b3UgY291bGQgaW1wbGVtZW50
IHNvbWV0aGluZyBsaWtlIHRoYXQgaW5zdGVhZC4gUGFuZnJvc3QgYW5kIA0KbGltYSBhbHNv
IGhhdmUgdGhlaXIgb3duIHNocmlua2VyIGFuZCBjb3VsZCBjZXJ0YWlubHkgYmUgY29udmVy
dGVkIHRvIA0KdGhlIGdlbS1zaG1lbSBzaHJpbmtlci4NCg0KQmVzdCByZWdhcmRzDQpUaG9t
YXMNCg0KPiANCj4gVGhpcyBwYXRjaHNldCBpbmNsdWRlcyBjb3VwbGUgZml4ZXMgZm9yIHBy
b2JsZW1zIEkgZm91bmQgd2hpbGUgd2FzIHdvcmtpbmcNCj4gb24gdGhlIHNocmlua2VyLCBp
dCBhbHNvIGluY2x1ZGVzIHByZXJlcXVpc2l0ZSBETUEgQVBJIHVzYWdlIGltcHJvdmVtZW50
DQo+IG5lZWRlZCBieSB0aGUgc2hyaW5rZXIuDQo+IA0KPiBUaGUgTWVzYSBhbmQgSUdUIHBh
dGNoZXMgd2lsbCBiZSBrZXB0IG9uIGhvbGQgdW50aWwgdGhpcyBrZXJuZWwgc2VyaWVzDQo+
IHdpbGwgYmUgYXBwcm92ZWQgYW5kIGFwcGxpZWQuDQo+IA0KPiBUaGlzIHBhdGNoc2V0IHdh
cyB0ZXN0ZWQgdXNpbmcgUWVtdSBhbmQgY3Jvc3ZtLCBpbmNsdWRpbmcgYm90aCBjYXNlcyBv
Zg0KPiBJT01NVSBvZmYvb24uDQo+IA0KPiBNZXNhOiBodHRwczovL2dpdGxhYi5mcmVlZGVz
a3RvcC5vcmcvZGlnZXR4L21lc2EvLS9jb21taXRzL3ZpcmdsLW1hZHZpc2UNCj4gSUdUOiAg
aHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL2RpZ2V0eC9pZ3QtZ3B1LXRvb2xzLy0v
dHJlZS92aXJ0aW8tbWFkdmlzZQ0KPiANCj4gRG1pdHJ5IE9zaXBlbmtvICg1KToNCj4gICAg
ZHJtL3ZpcnRpbzogQ29ycmVjdCBkcm1fZ2VtX3NobWVtX2dldF9zZ190YWJsZSgpIGVycm9y
IGhhbmRsaW5nDQo+ICAgIGRybS92aXJ0aW86IENoZWNrIHdoZXRoZXIgdHJhbnNmZXJyZWQg
MkQgQk8gaXMgc2htZW0NCj4gICAgZHJtL3ZpcnRpbzogVW5sb2NrIEdFTSByZXNlcnZhdGlv
bnMgaW4gZXJyb3IgY29kZSBwYXRoDQo+ICAgIGRybS92aXJ0aW86IEltcHJvdmUgRE1BIEFQ
SSB1c2FnZSBmb3Igc2htZW0gQk9zDQo+ICAgIGRybS92aXJ0aW86IEFkZCBtZW1vcnkgc2hy
aW5rZXINCj4gDQo+ICAgZHJpdmVycy9ncHUvZHJtL3ZpcnRpby9NYWtlZmlsZSAgICAgICAg
ICAgICAgIHwgICAzICstDQo+ICAgZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2Ry
di5jICAgICAgICAgIHwgIDIyICsrKy0NCj4gICBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3Zp
cnRncHVfZHJ2LmggICAgICAgICAgfCAgMzEgKysrKy0NCj4gICBkcml2ZXJzL2dwdS9kcm0v
dmlydGlvL3ZpcnRncHVfZ2VtLmMgICAgICAgICAgfCAgODQgKysrKysrKysrKysrDQo+ICAg
ZHJpdmVycy9ncHUvZHJtL3ZpcnRpby92aXJ0Z3B1X2dlbV9zaHJpbmtlci5jIHwgMTI0ICsr
KysrKysrKysrKysrKysrKw0KPiAgIGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9p
b2N0bC5jICAgICAgICB8ICAzNyArKysrKysNCj4gICBkcml2ZXJzL2dwdS9kcm0vdmlydGlv
L3ZpcnRncHVfa21zLmMgICAgICAgICAgfCAgMTcgKystDQo+ICAgZHJpdmVycy9ncHUvZHJt
L3ZpcnRpby92aXJ0Z3B1X29iamVjdC5jICAgICAgIHwgIDYzICsrKy0tLS0tLQ0KPiAgIGRy
aXZlcnMvZ3B1L2RybS92aXJ0aW8vdmlydGdwdV9wbGFuZS5jICAgICAgICB8ICAxNyArKy0N
Cj4gICBkcml2ZXJzL2dwdS9kcm0vdmlydGlvL3ZpcnRncHVfdnEuYyAgICAgICAgICAgfCAg
MzAgKysrLS0NCj4gICBpbmNsdWRlL3VhcGkvZHJtL3ZpcnRncHVfZHJtLmggICAgICAgICAg
ICAgICAgfCAgMTQgKysNCj4gICAxMSBmaWxlcyBjaGFuZ2VkLCAzNzMgaW5zZXJ0aW9ucygr
KSwgNjkgZGVsZXRpb25zKC0pDQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1
L2RybS92aXJ0aW8vdmlydGdwdV9nZW1fc2hyaW5rZXIuYw0KPiANCg0KLS0gDQpUaG9tYXMg
WmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBT
b2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcs
IEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVy
OiBJdm8gVG90ZXYNCg==

--------------OBPBu7VXBcmaoAijlAdrHv6p--

--------------m91zCDjNLtfE3G4JVLYLEQQq
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmIobGYFAwAAAAAACgkQlh/E3EQov+Aw
Xw/+NZ6+Z4Hl4awSRJX+RCgDRUdZJFYUtQZRGGoyqG9NxUsqZDkH5VWiCEXdj23sf+yR5fk1lI/Y
Ofo7kkmJ7UOSkDgtsi3H9W20kawjK191fopEOL64v7eSvLfOOGzMM6h77c3rrWhclcoVsTD/pQCL
XH3hRYI/SMN8yO13tuzFEvcVBUIFDXPR/4+WeFzc3WiscvLM8QhvgtfoQUz3A15JYJ/e9r2YBSyQ
Ohw3bsomzQa+5HZRabVbYaZWjn+VP49s9F+gltcFTt6y6uRpRMulGOjpOBkEty8JwxK0kguLLnKE
QLNfleigSzzE5IdAtWirJHX8BCLf2CZaK8Vk2tT0EiE7IM5exJ3KxPzhvuT62JJ0cK5MCtNhjBY6
VtmJDJrYD10KgEBLu3R+7iXD61wZ/mw7LvJFjxQ06u9eicmzInFMZE1pgTuynj4apjqy2SQYck4P
1bjpr1tRxC/60NIJ87DNkQAT1aRhRs2guYNNMgoTSQzjVgjRqRAnaAQ1OfHgOSjuYBqEjdoWgh2p
MfwAdsf17+JrA9fwifgUqiAXZTZens8sH2TILyOkzQ3tcKCpt567iaytn6jn/3Cb2xqNDTwD7BKC
8dkEeoi3sVGuUMfqncGrYzx7EABPmZltDU3fnemEf1XOAyevBg/msIx75tXIO0B+ndtd62VP4b8E
zOg=
=c7Ll
-----END PGP SIGNATURE-----

--------------m91zCDjNLtfE3G4JVLYLEQQq--
