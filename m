Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A89066A425B
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 14:13:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD1D110E00A;
	Mon, 27 Feb 2023 13:13:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFE7510E008
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 13:13:18 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7539A1FD65;
 Mon, 27 Feb 2023 13:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1677503597; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x2DEKGHfumA9lvpgWaY+ZCs9xLVwQt4ICEP1TCK1db8=;
 b=IWyBBMZUPQADRlItR8uZpaGOX4o0Vq/woNnvih4Y3vVSzhb/w66dqLXdcPFydRQ0ChU4vs
 E9TZVFRSuQCMCXT4B1K+9PnSBN6v6Rf4KzcLWCmtEtI1yduCReBgiVORmA8XqZrU4bZ8iT
 9vQixuPNWPcxR2wDFIpSf6X3bCkFrZc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1677503597;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=x2DEKGHfumA9lvpgWaY+ZCs9xLVwQt4ICEP1TCK1db8=;
 b=Ldr3Zj+AiJx+/5JFEVnsZ4FzRbxxip9FOVD2wZSg950YggyGVBlBcdi/3i+b9Y5oY3Dq/R
 m3Y7pTYZxesDvHDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4F6D413A43;
 Mon, 27 Feb 2023 13:13:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id eQObEm2s/GP2XAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 27 Feb 2023 13:13:17 +0000
Message-ID: <4a44a2a9-e78b-06e6-f3fb-f4bb7b09cd94@suse.de>
Date: Mon, 27 Feb 2023 14:13:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] drm/vram-helper: fix typos in vram helper doc
Content-Language: en-US
To: Luc Ma <onion0709@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <63fca451.170a0220.3cfe.698c@mx.google.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <63fca451.170a0220.3cfe.698c@mx.google.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------FSsx6t0dAzho60g0fYthybB0"
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
--------------FSsx6t0dAzho60g0fYthybB0
Content-Type: multipart/mixed; boundary="------------jWflPBaqu49ldgogVj80aTIF";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Luc Ma <onion0709@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Message-ID: <4a44a2a9-e78b-06e6-f3fb-f4bb7b09cd94@suse.de>
Subject: Re: [PATCH] drm/vram-helper: fix typos in vram helper doc
References: <63fca451.170a0220.3cfe.698c@mx.google.com>
In-Reply-To: <63fca451.170a0220.3cfe.698c@mx.google.com>

--------------jWflPBaqu49ldgogVj80aTIF
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KdGhhbmtzIGZvciB0aGUgZml4LiBBIGZldyB0aGluZ3MgY291bGQgYmUgaW1wcm92
ZWQuDQoNClRoZSBzdWJqZWN0IGxpbmUgc2hvdWxkIHNheSAnZml4IGZ1bmN0aW9uIG5hbWVz
JyBpbnN0ZWFkIG9mICdmaXggdHlwb3MnLiANClRoZSBwYXRjaCBhbHNvIGRlc2VydmVzIGF0
IGxlYXN0IGEgbWluaW1hbCBkZXNjcmlwdGlvbiBpZiB0aGUgY2hhbmdlLiANClNvbWV0aGlu
ZyBsaWtlICdSZWZlciB0byBkcm1tX3ZyYW1faGVscGVyX2luaXQoKSBpbnN0ZWFkIG9mIHRo
ZSANCm5vbi1leGlzdGVudCBkcm1tX3ZyYW1faGVscGVyX2FsbG9jX21tKCkuJyBJZiBzb21l
b25lIGxhdGVyIHNlYXJjaGVzIHRoZSANCmdpdCBoaXN0b3J5IGZvciBzdWNoIGNoYW5nZXMs
IGl0J3MgaGVscGZ1bCB0byBoYXZlIHRoZSBmdW5jdGlvbiBuYW1lcyANCm1lbnRpb25lZC4N
Cg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KQW0gMjcuMDIuMjMgdW0gMTM6Mzggc2Nocmll
YiBMdWMgTWE6DQo+IEZpeGVzOiBhNWYyM2E3MjM1NWQgKCJkcm0vdnJhbS1oZWxwZXI6IE1h
bmFnZWQgdnJhbSBoZWxwZXJzIikNCj4gU2lnbmVkLW9mZi1ieTogTHVjIE1hIDxsdWNAc2ll
dGl1bS5jb20+DQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVs
cGVyLmMgfCA2ICsrKy0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyks
IDMgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ry
bV9nZW1fdnJhbV9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVs
cGVyLmMNCj4gaW5kZXggZDQwYjNlZGI1MmQwLi5mMTUzOWQ0NDQ4YzYgMTAwNjQ0DQo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMNCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuYw0KPiBAQCAtNDUsNyArNDUsNyBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9nZW1fb2JqZWN0X2Z1bmNzIGRybV9nZW1fdnJh
bV9vYmplY3RfZnVuY3M7DQo+ICAgICogdGhlIGZyYW1lJ3Mgc2Nhbm91dCBidWZmZXIgb3Ig
dGhlIGN1cnNvciBpbWFnZS4gSWYgdGhlcmUncyBubyBtb3JlIHNwYWNlDQo+ICAgICogbGVm
dCBpbiBWUkFNLCBpbmFjdGl2ZSBHRU0gb2JqZWN0cyBjYW4gYmUgbW92ZWQgdG8gc3lzdGVt
IG1lbW9yeS4NCj4gICAgKg0KPiAtICogVG8gaW5pdGlhbGl6ZSB0aGUgVlJBTSBoZWxwZXIg
bGlicmFyeSBjYWxsIGRybW1fdnJhbV9oZWxwZXJfYWxsb2NfbW0oKS4NCj4gKyAqIFRvIGlu
aXRpYWxpemUgdGhlIFZSQU0gaGVscGVyIGxpYnJhcnkgY2FsbCBkcm1tX3ZyYW1faGVscGVy
X2luaXQoKS4NCj4gICAgKiBUaGUgZnVuY3Rpb24gYWxsb2NhdGVzIGFuZCBpbml0aWFsaXpl
cyBhbiBpbnN0YW5jZSBvZiAmc3RydWN0IGRybV92cmFtX21tDQo+ICAgICogaW4gJnN0cnVj
dCBkcm1fZGV2aWNlLnZyYW1fbW0gLiBVc2UgJkRSTV9HRU1fVlJBTV9EUklWRVIgdG8gaW5p
dGlhbGl6ZQ0KPiAgICAqICZzdHJ1Y3QgZHJtX2RyaXZlciBhbmQgICZEUk1fVlJBTV9NTV9G
SUxFX09QRVJBVElPTlMgdG8gaW5pdGlhbGl6ZQ0KPiBAQCAtNzMsNyArNzMsNyBAQCBzdGF0
aWMgY29uc3Qgc3RydWN0IGRybV9nZW1fb2JqZWN0X2Z1bmNzIGRybV9nZW1fdnJhbV9vYmpl
Y3RfZnVuY3M7DQo+ICAgICoJCS8vIHNldHVwIGRldmljZSwgdnJhbSBiYXNlIGFuZCBzaXpl
DQo+ICAgICoJCS8vIC4uLg0KPiAgICAqDQo+IC0gKgkJcmV0ID0gZHJtbV92cmFtX2hlbHBl
cl9hbGxvY19tbShkZXYsIHZyYW1fYmFzZSwgdnJhbV9zaXplKTsNCj4gKyAqCQlyZXQgPSBk
cm1tX3ZyYW1faGVscGVyX2luaXQoZGV2LCB2cmFtX2Jhc2UsIHZyYW1fc2l6ZSk7DQo+ICAg
ICoJCWlmIChyZXQpDQo+ICAgICoJCQlyZXR1cm4gcmV0Ow0KPiAgICAqCQlyZXR1cm4gMDsN
Cj4gQEAgLTg2LDcgKzg2LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZ2VtX29iamVj
dF9mdW5jcyBkcm1fZ2VtX3ZyYW1fb2JqZWN0X2Z1bmNzOw0KPiAgICAqIHRvIHVzZXJzcGFj
ZS4NCj4gICAgKg0KPiAgICAqIFlvdSBkb24ndCBoYXZlIHRvIGNsZWFuIHVwIHRoZSBpbnN0
YW5jZSBvZiBWUkFNIE1NLg0KPiAtICogZHJtbV92cmFtX2hlbHBlcl9hbGxvY19tbSgpIGlz
IGEgbWFuYWdlZCBpbnRlcmZhY2UgdGhhdCBpbnN0YWxscyBhDQo+ICsgKiBkcm1tX3ZyYW1f
aGVscGVyX2luaXQoKSBpcyBhIG1hbmFnZWQgaW50ZXJmYWNlIHRoYXQgaW5zdGFsbHMgYQ0K
PiAgICAqIGNsZWFuLXVwIGhhbmRsZXIgdG8gcnVuIGR1cmluZyB0aGUgRFJNIGRldmljZSdz
IHJlbGVhc2UuDQo+ICAgICoNCj4gICAgKiBGb3IgZHJhd2luZyBvciBzY2Fub3V0IG9wZXJh
dGlvbnMsIHJzcC4gYnVmZmVyIG9iamVjdHMgaGF2ZSB0byBiZSBwaW5uZWQNCg0KLS0gDQpU
aG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0
d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xy
bmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNm
w7xocmVyOiBJdm8gVG90ZXYNCg==

--------------jWflPBaqu49ldgogVj80aTIF--

--------------FSsx6t0dAzho60g0fYthybB0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmP8rGwFAwAAAAAACgkQlh/E3EQov+Bf
6A//YmczZOIclfTUfSaiOENwvdOnjSEgx3bFE43YRLoyQW6aIBKhFO7zrDXnIgftrtPTGdPpXjPD
RWd8qE0xFhfojvblFg5qmwWRAkc0y2MDU8dk7/ERGD8RieeRhWGZIRqTvs4ABgzT6aTe9PMHXJGP
2cFY8Eirfedv1Zg4Mk7B0zanuf4YDyH22d41sXRzDEaoeeH2ONWhuvnNYdubFlZAtspPzXTrjJzO
Gcqk/M07zmuuP0zgPzK/5PXCc1caXsoX9DqKfItfS6pSyeACaYmdTgLOeBlxJPtfE8t7vbLMzcrk
mYSPYPMxuq82/t5n8cSRmAjVvqEbfxuoGoEyVA6fNmxzfrK2R88fjUJQjs3quKHMkBgSpHkcd0tf
leolAJbAy/GRTR77xVjy0G2eYhx3zqjc4iRb8r2IXiN/A+OB4DDaKPRBobENlPBOES4jO64so1gJ
/iyOXgYlQKy4PIdKyHBE1aIqYIyA6qizxbElCfQIFOZyxUA480ByFruocSfe5eJOGHOCvn/8DUeE
2HO02W2fhLQ6OEO8nsD2i9094Ow6SR8XfTThKaJnK/HEBU569PIuC0TZULdYIgT4lzTYpTLUouQt
/Cfb1yMBNivjqF59H5DH006ZTP6a7HdPeZWJHUMy+Omrdmi8q2cBOiIMjqqi0YdscvfpTW5f3Ceg
9+4=
=wVP0
-----END PGP SIGNATURE-----

--------------FSsx6t0dAzho60g0fYthybB0--
