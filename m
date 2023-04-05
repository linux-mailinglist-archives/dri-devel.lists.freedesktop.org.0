Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02B886D76B2
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 10:20:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A480110E876;
	Wed,  5 Apr 2023 08:19:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 628D710E875;
 Wed,  5 Apr 2023 08:19:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E0A6920658;
 Wed,  5 Apr 2023 08:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680682795; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=L5t2E0KVfUfVbGju8ogxUh3rlkbNDru80vGqDvBPxA8=;
 b=pnakBZuyBdJnTW6lkSkHWiMhx/g9IiG9Brmpk+BmNgDdkI1d/WM0EUAOLXTnQb8qcSBk+K
 mY06sP2+Lg8pt6HcEhSfAuFIHdGg+k1P7pzzPSgDGv7Hi03idtJ+3TehvroyoKboe0kjyV
 hAp4KLJ2GUiev1DwTTl/Q39W+nzsN44=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680682795;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=L5t2E0KVfUfVbGju8ogxUh3rlkbNDru80vGqDvBPxA8=;
 b=zDDQix0EWyuKDN7uTsHGcSFxGz/qU1+3hm4Vhe+Ryn6nw8cf90rht5uzs1aR5Zj135ads6
 14ag2AIwDhPmOhDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BF5F113A10;
 Wed,  5 Apr 2023 08:19:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id m7d0LSsvLWSOPQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 05 Apr 2023 08:19:55 +0000
Message-ID: <846e2048-cb7f-660c-6ec8-6f9c7b368187@suse.de>
Date: Wed, 5 Apr 2023 10:19:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/8] drm/gma500: Use
 drm_aperture_remove_conflicting_pci_framebuffers
Content-Language: en-US
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
References: <20230404201842.567344-1-daniel.vetter@ffwll.ch>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230404201842.567344-1-daniel.vetter@ffwll.ch>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------doefAq5goN57wp35TfchzBWO"
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
Cc: Daniel Vetter <daniel.vetter@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------doefAq5goN57wp35TfchzBWO
Content-Type: multipart/mixed; boundary="------------SuDpUCEoTo3xvQ0C000vzmDM";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 DRI Development <dri-devel@lists.freedesktop.org>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Message-ID: <846e2048-cb7f-660c-6ec8-6f9c7b368187@suse.de>
Subject: Re: [PATCH 1/8] drm/gma500: Use
 drm_aperture_remove_conflicting_pci_framebuffers
References: <20230404201842.567344-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20230404201842.567344-1-daniel.vetter@ffwll.ch>

--------------SuDpUCEoTo3xvQ0C000vzmDM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDQuMDQuMjMgdW0gMjI6MTggc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBU
aGlzIG9uZSBudWtlcyBhbGwgZnJhbWVidWZmZXJzLCB3aGljaCBpcyBhIGJpdCBtdWNoLiBJ
biByZWFsaXR5DQo+IGdtYTUwMCBpcyBpZ3B1IGFuZCBuZXZlciBzaGlwcGVkIHdpdGggYW55
dGhpbmcgZGlzY3JldGUsIHNvIHRoZXJlIHNob3VsZA0KPiBub3QgYmUgYW55IGRpZmZlcmVu
Y2UuDQoNCkkgZG8gb3duIGFuIEludGVsIEROMjgwME1UIGJvYXJkIHdpdGggZ21hNTAwIGhh
cmR3YXJlLiBbMV0gSXQgaGFzIGEgUENJZSANCngxIHNsb3QuIEkgbmV2ZXIgdHJpZWQsIGJ1
dCBpbiBwcmluY2lwbGUsIHRoZXJlIGNvdWxkIGJlIGFub3RoZXIgDQpncmFwaGljcyBjYXJk
IGluIHRoZSBzeXN0ZW0uIFRoZSBsaW5rZWQgc3BlYyBzYXkgJ0Rpc2NyZXRlOiBOb25lJy4g
SSANCmRvbid0IGtub3cgd2hhdCB0aGF0IG1lYW5zIGV4YWN0bHkuDQoNCkJlc3QgcmVnYXJk
cw0KVGhvbWFzDQoNClsxXSANCmh0dHBzOi8vYXJrLmludGVsLmNvbS9jb250ZW50L3d3dy91
cy9lbi9hcmsvcHJvZHVjdHMvNTY0NTUvaW50ZWwtZGVza3RvcC1ib2FyZC1kbjI4MDBtdC5o
dG1sDQoNCj4gDQo+IHYyOiBVbmZvcnR1bmF0ZWx5IHRoZSBmcmFtZWJ1ZmZlciBzaXRzIG91
dHNpZGUgb2YgdGhlIHBjaSBiYXJzIGZvcg0KPiBnbWE1MDAsIGFuZCBzbyBvbmx5IHVzaW5n
IHRoZSBwY2kgaGVscGVycyB3b24ndCBiZSBlbm91Z2guIE90b2ggaWYgd2UNCj4gb25seSB1
c2Ugbm9uLXBjaSBoZWxwZXIsIHRoZW4gd2UgZG9uJ3QgZ2V0IHRoZSB2Z2EgaGFuZGxpbmcs
IGFuZA0KPiBzdWJzZXF1ZW50IHJlZmFjdG9yaW5nIHRvIHVudGFuZ2xlIHRoZXNlIHNwZWNp
YWwgY2FzZXMgd29uJ3Qgd29yay4NCj4gDQo+IEl0J3Mgbm90IHByZXR0eSwgYnV0IHRoZSBz
aW1wbGVzdCBmaXggKHNpbmNlIGdtYTUwMCByZWFsbHkgaXMgdGhlIG9ubHkNCj4gcXVpcmt5
IHBjaSBkcml2ZXIgbGlrZSB0aGlzIHdlIGhhdmUpIGlzIHRvIGp1c3QgaGF2ZSBib3RoIGNh
bGxzLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRl
ckBpbnRlbC5jb20+DQo+IENjOiBQYXRyaWsgSmFrb2Jzc29uIDxwYXRyaWsuci5qYWtvYnNz
b25AZ21haWwuY29tPg0KPiBDYzogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1
c2UuZGU+DQo+IENjOiBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXMgPGphdmllcm1AcmVkaGF0
LmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9wc2JfZHJ2LmMgfCA5
ICsrKysrKystLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9w
c2JfZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vZ21hNTAwL3BzYl9kcnYuYw0KPiBpbmRleCAy
Y2U5NmIxYjljNzQuLmYxZTBlZWQ4ZmVhNCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2dtYTUwMC9wc2JfZHJ2LmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9w
c2JfZHJ2LmMNCj4gQEAgLTQyMiwxMiArNDIyLDE3IEBAIHN0YXRpYyBpbnQgcHNiX3BjaV9w
cm9iZShzdHJ1Y3QgcGNpX2RldiAqcGRldiwgY29uc3Qgc3RydWN0IHBjaV9kZXZpY2VfaWQg
KmVudCkNCj4gICANCj4gICAJLyoNCj4gICAJICogV2UgY2Fubm90IHlldCBlYXNpbHkgZmlu
ZCB0aGUgZnJhbWVidWZmZXIncyBsb2NhdGlvbiBpbiBtZW1vcnkuIFNvDQo+IC0JICogcmVt
b3ZlIGFsbCBmcmFtZWJ1ZmZlcnMgaGVyZS4NCj4gKwkgKiByZW1vdmUgYWxsIGZyYW1lYnVm
ZmVycyBoZXJlLiBOb3RlIHRoYXQgd2Ugc3RpbGwgd2FudCB0aGUgcGNpIHNwZWNpYWwNCj4g
KwkgKiBoYW5kbGluZyB0byBraWNrIG91dCB2Z2Fjb24uDQo+ICAgCSAqDQo+ICAgCSAqIFRP
RE86IFJlZmFjdG9yIHBzYl9kcml2ZXJfbG9hZCgpIHRvIG1hcCB2ZGNfcmVnIGVhcmxpZXIu
IFRoZW4gd2UNCj4gICAJICogICAgICAgbWlnaHQgYmUgYWJsZSB0byByZWFkIHRoZSBmcmFt
ZWJ1ZmZlciByYW5nZSBmcm9tIHRoZSBkZXZpY2UuDQo+ICAgCSAqLw0KPiAtCXJldCA9IGRy
bV9hcGVydHVyZV9yZW1vdmVfZnJhbWVidWZmZXJzKHRydWUsICZkcml2ZXIpOw0KPiArCXJl
dCA9IGRybV9hcGVydHVyZV9yZW1vdmVfZnJhbWVidWZmZXJzKGZhbHNlLCAmZHJpdmVyKTsN
Cj4gKwlpZiAocmV0KQ0KPiArCQlyZXR1cm4gcmV0Ow0KPiArDQo+ICsJcmV0ID0gZHJtX2Fw
ZXJ0dXJlX3JlbW92ZV9jb25mbGljdGluZ19wY2lfZnJhbWVidWZmZXJzKHBkZXYsICZkcml2
ZXIpOw0KPiAgIAlpZiAocmV0KQ0KPiAgIAkJcmV0dXJuIHJldDsNCj4gICANCg0KLS0gDQpU
aG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0
d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xy
bmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNm
w7xocmVyOiBJdm8gVG90ZXYNCg==

--------------SuDpUCEoTo3xvQ0C000vzmDM--

--------------doefAq5goN57wp35TfchzBWO
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQtLysFAwAAAAAACgkQlh/E3EQov+Ds
4Q//d1XAHYT8eqN3ZpRsjPqfKgJRQokkohRyDVIdvYNPk9VeO+vB2Q1PiJqRhHXpeX2j1lnu6jxm
ufDPLO7iHAxW4+Fm0wIcp3Ic4Gj+/SwuHnk/JHWuz7kKm4gSaigcLLCBfGgyMriK1YKtSblll+YL
shuAC5ucpPu0WBZCSKjk4FwbXcxHpLfTnVuyKcOuSYrFNX/3vLYeoNq9vVj5kB6D2q4hsS3FQ/t3
5p9Y0ZpdRNN1jOCafTgNVy6nSx19eFAqBfpb06B+V9F9rT6mW1apWrv2OF4+zGNqwJlmP9OdJfFn
Na/07Xk0j3bEPx06rOnr/DOG6WbaGMlWGN45dYbdyOtLyK/VEpHVmC9mGlnGA8IX8v2iIjiw6970
mXR0wQW57+OyKetyNogApD52n+rP+5CXsG2bLChzq9iainwuQplvKYs0ISAEJb04QJ76BiQZSMak
0oHhAuV3YDLAF7NWezOAFKkHje97gWaT8/TIdLvvkkqmyUhnkE5pJAngVH2jFhcst2t++wwyPpUL
yBnWF5V66w/57hwKs9U7E5vLA6Qau3Cqu3AmORd5sWTQO2N9OrcY4RoSTyUDH494sW0voVSUVhFw
QWSMiTgeUOi0/8tBnckTBG120PUZKn7xkxntfXCcHEQ10ezgOIuH8zlwWYBzeLESkA6Q1C0uDCOX
FfQ=
=bPnq
-----END PGP SIGNATURE-----

--------------doefAq5goN57wp35TfchzBWO--
