Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 603D74346C1
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 10:21:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84D2A6E8D6;
	Wed, 20 Oct 2021 08:21:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A4826E8D2;
 Wed, 20 Oct 2021 08:21:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 472C31FD9D;
 Wed, 20 Oct 2021 08:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1634718072; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/t5w3Oy5KHGFXvGLXI6TU0p3a/8pg5S2V/9clDUNR7A=;
 b=kFg1ajISOD0Aqy/Z3AH/HCGPRyeKZlsxz07Gbj6W2gqn3SkP9r4c24uLlNPOmxZltL7I58
 1q8nmnO9/+expMBceOeBIqYrUtYztv0omDBPF78rv6ceEdNzp5NqWzeNbu6b6rMvqsGz77
 0dYa0ES0y2VLnpz/bUqlnjzMWaJBdS8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1634718072;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/t5w3Oy5KHGFXvGLXI6TU0p3a/8pg5S2V/9clDUNR7A=;
 b=4nAQh3Mv5Llsp13EfLGAzX/TAbsEIZQ9N2W5h6I9U/sr12nMsNMf5zXMwYjxttP9PD97dJ
 eu8lnBmXWPBLjyCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1909A13F7C;
 Wed, 20 Oct 2021 08:21:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id h02RBHjRb2EMXgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 20 Oct 2021 08:21:12 +0000
Message-ID: <84ff2d86-345c-8bcf-81c6-467b9737f652@suse.de>
Date: Wed, 20 Oct 2021 10:21:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 03/13] drm: add Makefile support for drm buddy
Content-Language: en-US
To: Arunpravin <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: christian.koenig@amd.com, daniel@ffwll.ch, matthew.auld@intel.com,
 alexander.deucher@amd.com
References: <20211019225409.569355-1-Arunpravin.PaneerSelvam@amd.com>
 <20211019225409.569355-4-Arunpravin.PaneerSelvam@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20211019225409.569355-4-Arunpravin.PaneerSelvam@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------agyJ8GFf7ECqg7Ybaxwx8ly8"
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
--------------agyJ8GFf7ECqg7Ybaxwx8ly8
Content-Type: multipart/mixed; boundary="------------1oRyLfLhoa4yqL2KbIoqJ9fC";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Arunpravin <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: christian.koenig@amd.com, daniel@ffwll.ch, matthew.auld@intel.com,
 alexander.deucher@amd.com
Message-ID: <84ff2d86-345c-8bcf-81c6-467b9737f652@suse.de>
Subject: Re: [PATCH 03/13] drm: add Makefile support for drm buddy
References: <20211019225409.569355-1-Arunpravin.PaneerSelvam@amd.com>
 <20211019225409.569355-4-Arunpravin.PaneerSelvam@amd.com>
In-Reply-To: <20211019225409.569355-4-Arunpravin.PaneerSelvam@amd.com>

--------------1oRyLfLhoa4yqL2KbIoqJ9fC
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjAuMTAuMjEgdW0gMDA6NTMgc2NocmllYiBBcnVucHJhdmluOg0KPiAtIElu
Y2x1ZGUgZHJtIGJ1ZGR5IHRvIERSTSByb290IE1ha2VmaWxlDQo+IC0gQWRkIGRybSBidWRk
eSBpbml0IGFuZCBleGl0IGZ1bmN0aW9uIGNhbGxzDQo+ICAgIHRvIGRybSBjb3JlDQoNCklz
IHRoZXJlIGEgaGFyZCByZXF1aXJlbWVudCB0byBoYXZlIHRoaXMgY29kZSBpbiB0aGUgY29y
ZT8NCg0KSU1ITyB0aGVyZSdzIGFscmVhZHkgdG9vIG11Y2ggY29kZSBpbiB0aGUgRFJNIGNv
cmUgdGhhdCBzaG91bGQgcmF0aGVyIGdvIA0KaW50byBoZWxwZXJzLiBUaGUgYWxsb2NhdG9y
IHNob3VsZCBsaXZlIGluIGl0J3Mgb3duIG1vZHVsZSBhbmQgZHJpdmVyIA0Kc2hvdWxkIGlu
aXQgaXQgaWYgbmVlZGVkLg0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBcnVucHJhdmluIDxB
cnVucHJhdmluLlBhbmVlclNlbHZhbUBhbWQuY29tPg0KPiAtLS0NCj4gICBkcml2ZXJzL2dw
dS9kcm0vTWFrZWZpbGUgIHwgMiArLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHJ2LmMg
fCAzICsrKw0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL01ha2VmaWxlIGIv
ZHJpdmVycy9ncHUvZHJtL01ha2VmaWxlDQo+IGluZGV4IDBkZmY0MGJiODYzYy4uZGM2MWU5
MWEzMTU0IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vTWFrZWZpbGUNCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL01ha2VmaWxlDQo+IEBAIC0xOCw3ICsxOCw3IEBAIGRybS15
ICAgICAgIDo9CWRybV9hcGVydHVyZS5vIGRybV9hdXRoLm8gZHJtX2NhY2hlLm8gXA0KPiAg
IAkJZHJtX2R1bWJfYnVmZmVycy5vIGRybV9tb2RlX2NvbmZpZy5vIGRybV92YmxhbmsubyBc
DQo+ICAgCQlkcm1fc3luY29iai5vIGRybV9sZWFzZS5vIGRybV93cml0ZWJhY2subyBkcm1f
Y2xpZW50Lm8gXA0KPiAgIAkJZHJtX2NsaWVudF9tb2Rlc2V0Lm8gZHJtX2F0b21pY191YXBp
Lm8gZHJtX2hkY3AubyBcDQo+IC0JCWRybV9tYW5hZ2VkLm8gZHJtX3ZibGFua193b3JrLm8N
Cj4gKwkJZHJtX21hbmFnZWQubyBkcm1fdmJsYW5rX3dvcmsubyBkcm1fYnVkZHkubw0KPiAg
IA0KPiAgIGRybS0kKENPTkZJR19EUk1fTEVHQUNZKSArPSBkcm1fYWdwc3VwcG9ydC5vIGRy
bV9idWZzLm8gZHJtX2NvbnRleHQubyBkcm1fZG1hLm8gXA0KPiAgIAkJCSAgICBkcm1fbGVn
YWN5X21pc2MubyBkcm1fbG9jay5vIGRybV9tZW1vcnkubyBkcm1fc2NhdHRlci5vIFwNCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHJ2LmMgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX2Rydi5jDQo+IGluZGV4IDdhNTA5NzQ2N2JhNS4uNjcwN2VlYzIxYmVmIDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Rydi5jDQo+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9kcm1fZHJ2LmMNCj4gQEAgLTQzLDYgKzQzLDcgQEANCj4gICAjaW5jbHVkZSA8
ZHJtL2RybV9tYW5hZ2VkLmg+DQo+ICAgI2luY2x1ZGUgPGRybS9kcm1fbW9kZV9vYmplY3Qu
aD4NCj4gICAjaW5jbHVkZSA8ZHJtL2RybV9wcmludC5oPg0KPiArI2luY2x1ZGUgPGRybS9k
cm1fYnVkZHkuaD4NCg0KSW4gYWxwaGFiZXRpY2FsIG9yZGVyIHBsZWFzZS4gSGVyZSBhbmQg
ZXZlcnl3aGVyZSBlbHNlLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+ICAgDQo+ICAg
I2luY2x1ZGUgImRybV9jcnRjX2ludGVybmFsLmgiDQo+ICAgI2luY2x1ZGUgImRybV9pbnRl
cm5hbC5oIg0KPiBAQCAtMTAzNCw2ICsxMDM1LDcgQEAgc3RhdGljIHZvaWQgZHJtX2NvcmVf
ZXhpdCh2b2lkKQ0KPiAgIAlkcm1fc3lzZnNfZGVzdHJveSgpOw0KPiAgIAlpZHJfZGVzdHJv
eSgmZHJtX21pbm9yc19pZHIpOw0KPiAgIAlkcm1fY29ubmVjdG9yX2lkYV9kZXN0cm95KCk7
DQo+ICsJZHJtX2J1ZGR5X21vZHVsZV9leGl0KCk7DQo+ICAgfQ0KPiAgIA0KPiAgIHN0YXRp
YyBpbnQgX19pbml0IGRybV9jb3JlX2luaXQodm9pZCkNCj4gQEAgLTEwNDMsNiArMTA0NSw3
IEBAIHN0YXRpYyBpbnQgX19pbml0IGRybV9jb3JlX2luaXQodm9pZCkNCj4gICAJZHJtX2Nv
bm5lY3Rvcl9pZGFfaW5pdCgpOw0KPiAgIAlpZHJfaW5pdCgmZHJtX21pbm9yc19pZHIpOw0K
PiAgIAlkcm1fbWVtY3B5X2luaXRfZWFybHkoKTsNCj4gKwlkcm1fYnVkZHlfbW9kdWxlX2lu
aXQoKTsNCj4gICANCj4gICAJcmV0ID0gZHJtX3N5c2ZzX2luaXQoKTsNCj4gICAJaWYgKHJl
dCA8IDApIHsNCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZl
ciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4
ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBO
w7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogRmVsaXggSW1lbmTDtnJmZmVyDQo=

--------------1oRyLfLhoa4yqL2KbIoqJ9fC--

--------------agyJ8GFf7ECqg7Ybaxwx8ly8
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmFv0XcFAwAAAAAACgkQlh/E3EQov+Dl
yQ//fkZdi4V/v4rsD40KuzqJHNaaYsyufS4uOp091GMQyAr5XQ2HssdXQiMMPrtedDady8Dd8kVm
EeUvOqEd9eXGzUVfiYK9n0whbepP+udBKjgAeQbL0g3kX4Q2yc0JopuhEFpo35mY68gxxReirqdX
MFNQv3SB/4Qv49Gq83KsJLQGy/npexSTB7VY1bGRGf45UdJoxau1RRKSC8Bv0glDSmbZu4EjYRFI
4kR8GhZqIomTiF/KWtBsVWDk88G2uMLeufnepIjSIQnwcMR4sIYvsdCBzEwhBxYiBhJQDxc6P6xR
XZVq5T/hd0RZTMytZca1nGeJ7bJgahxXSI/WsdHh0/y00fQMSNRgtjdLQ1gfNhY7D0lcWETE6PUE
VMaUz/pR+iFgQe0cdNds1OxgdAjrXJwl6E29MNvscy1Mo6uQh7eyURYraWwMsZWzi3AIRkj2RPSR
8RtXu49HgiNqPvPkhpeayuHYimlLpS1Y/TYPQCc9F5hxU7Efsb6/Lxv41HHrGwXnl4gCqaqaNFpx
0dsoyTWSwrZx7YjWFQLWO+swmFXkfe0PVq+l8eYlCRl2ZJBR+SAAFJjKZJYNogFD8KUbZjnunoeP
VflHgnimbmB+eGIM61UioXJCRqaAbCeirB10TOz203uw1BKZ0mWZn3N8uIz3GTPMIwFrnIe2ia+X
lcU=
=gOfK
-----END PGP SIGNATURE-----

--------------agyJ8GFf7ECqg7Ybaxwx8ly8--
