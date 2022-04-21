Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB385509B4F
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 10:57:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0909A10FA95;
	Thu, 21 Apr 2022 08:57:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 482DB10FA98
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 08:57:29 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E0FDD21115;
 Thu, 21 Apr 2022 08:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1650531447; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DQMRNyatEv4p5zjM9nOpXv5bZbFECSBRChsvwSeN8TY=;
 b=KC387zdqv9GlxNilFfiJ5WGcPRWh+SqtFGuRBcJCykmwIX4r9SmlkPirVNPmzMK9McxUsQ
 EmBW6J/lKZK8JTwZ5tex9lWdUlynNKSC98oPDWeUukIkR4Phs/17hUdS759/iIsdiqH532
 cMZGMHdAfnIBNsJQ8bN62U5lK//dAPs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1650531447;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DQMRNyatEv4p5zjM9nOpXv5bZbFECSBRChsvwSeN8TY=;
 b=tWqnZ9HCUUWa5pUrAySTs91wkXeoT9bfCM31bQLCVMcFGcPpwLrZPm/9hqiASuf9KONPsh
 oW4EdK5+Bjo+pPDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id AC07713446;
 Thu, 21 Apr 2022 08:57:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ycvaKHccYWJLNwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 21 Apr 2022 08:57:27 +0000
Message-ID: <408884e9-f462-b0e4-9ddc-88111d13c84d@suse.de>
Date: Thu, 21 Apr 2022 10:57:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/2] drm/nvdla: Add driver support for NVDLA
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Cai Huoqing <cai.huoqing@linux.dev>
References: <20220419135908.39606-1-cai.huoqing@linux.dev>
 <20220419135908.39606-3-cai.huoqing@linux.dev>
 <2aeee5a2-b5a5-348e-ccf7-04f49e1119da@suse.de>
 <b34fa2a5-58b4-6270-2d19-2ad591e3e250@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <b34fa2a5-58b4-6270-2d19-2ad591e3e250@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------7VdpEByIe2aE28cDYy6CuHaZ"
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------7VdpEByIe2aE28cDYy6CuHaZ
Content-Type: multipart/mixed; boundary="------------XPvcyx2WwfroujAdNHDrBaAE";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Cai Huoqing <cai.huoqing@linux.dev>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Message-ID: <408884e9-f462-b0e4-9ddc-88111d13c84d@suse.de>
Subject: Re: [PATCH 2/2] drm/nvdla: Add driver support for NVDLA
References: <20220419135908.39606-1-cai.huoqing@linux.dev>
 <20220419135908.39606-3-cai.huoqing@linux.dev>
 <2aeee5a2-b5a5-348e-ccf7-04f49e1119da@suse.de>
 <b34fa2a5-58b4-6270-2d19-2ad591e3e250@amd.com>
In-Reply-To: <b34fa2a5-58b4-6270-2d19-2ad591e3e250@amd.com>

--------------XPvcyx2WwfroujAdNHDrBaAE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjEuMDQuMjIgdW0gMTA6MzQgc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOg0K
PiBBbSAyMS4wNC4yMiB1bSAxMDozMCBzY2hyaWViIFRob21hcyBaaW1tZXJtYW5uOg0KPj4g
KFJlc2VuZGluZywgYXMgc29tZSBNTHMgZGlkbid0IGxpa2UgdGhlIHNpemUgb2YgdGhlIG9y
aWduaW5hbCBtYWlsLikNCj4+DQo+PiBIaSwNCj4+DQo+PiB0aGFua3MgZm9yIHlvdXIgc3Vi
bWlzc2lvbi4gU29tZSBnZW5lcmFsIGNvbW1lbnRzOg0KPj4NCj4+IMKgICogc29tZSBmdW5j
dGlvbnMgYXJlIHByZWZpeGVkIHdpdGggZGxhXywgb3RoZXJzIHVzZSBudmRsYV8uIEl0IHNl
ZW1zIA0KPj4gYXJiaXRyYXJ5IHRvIG1lLiBQbGVhc2UgdXNlIG52ZGxhXyBjb25zaXN0ZW50
bHkgdGhyb3VnaG91dCB0aGUgc291cmNlIA0KPj4gY29kZS4NCj4+DQo+PiDCoCAqIEZvciBy
ZXBvcnRpbmcgZXJyb3JzLCBwbGVhc2UgdXNlIGRybV9lcnIoKSwgZHJtX3dhcm4oKSwgZXRj
LiBJIA0KPj4gc3VnZ2VzdCB0byByZWFycmFuZ2UgdGhlIGVycm9yIG1lc3NhZ2VzIHRvIG5v
dCBiZSBsb2NhdGVkIGluIHRoZSANCj4+IGlubmVybW9zdCBmdW5jdGlvbnMuDQo+IA0KPiBJ
ZiB5b3UgcGxhbiB0byBoYXZlIG11bHRpcGxlIGluc3RhbmNlcyBvZiB0aGUgZHJpdmVyIGxv
YWRlZCBhdCB0aGUgc2FtZSANCj4gdGltZSwgdXNpbmcgZHJtX2Rldl9lcnIoKSwgZHJtX2Rl
dl93YXJuKCkgZXRjLi4gd291bGQgYmUgZXZlbiBiZXR0ZXIuDQoNCkkgdGhpbmsgdGhhdCdz
IHdoYXQgSSBtZWFuLiBUaGFua3MgZm9yIHBvaW50aW5nIHRoaXMgb3V0Lg0KDQpCZXN0IHJl
Z2FyZHMNClRob21hcw0KDQo+IA0KPiBCVFc6IEknbSBzdGlsbCBhYnNvbHV0ZWx5IG5vdCBr
ZWVuIHRvIGVuZm9yY2luZyBkcm1fKiBsb2cgZnVuY3Rpb25zLiBTbyANCj4gaWYgeW91IHBy
ZWZlciB0byBzdGljayB3aXRoIHByX2VycigpIGFuZCBkZXZfZXJyKCkgd2UgY291bGQgZGlz
Y3VzcyB0aGF0IA0KPiBvbmNlIG1vcmUuDQo+IA0KPiBSZWdhcmRzLA0KPiBDaHJpc3RpYW4u
DQo+IA0KPj4NCj4+IMKgICogQ291bGQgeW91IHBsZWFzZSBzcGxpdCB0aGlzIHBhdGNoIGlu
dG8gc21hbGxlciBwaWVjZXM/IEl0IA0KPj4gY3VycmVudGx5IGhpdHMgc2l6ZSBsaW1pdHMg
b2Ygc29tZSBtYWlsaW5nIGxpc3RzLiBNYXliZSBhZGQgdGhlIA0KPj4gcmVnaXN0ZXIgY29u
c3RhbnRzIHNlcGFyYXRlbHkuDQo+Pg0KPj4gUGxlYXNlIGZpbmQgbW9yZSByZXZpZXcgY29t
bWVudHMgYmVsb3cuIEl0J3Mgbm90IGEgZnVsbCByZXZpZXcsIGJ1dCBhdCANCj4+IGxlYXN0
IHNvbWV0aGluZyB0byBzdGFydCB3aXRoLg0KPj4NCj4+IEJlc3QgcmVnYXJkcw0KPj4gVGhv
bWFzDQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2
ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRz
dHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5i
ZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------XPvcyx2WwfroujAdNHDrBaAE--

--------------7VdpEByIe2aE28cDYy6CuHaZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJhHHcFAwAAAAAACgkQlh/E3EQov+B0
mRAAiRGFh/gAJekCs+VxLcmXZNglTHZJ2AWjklMzvQxZCbI9//kfToODwIAGhE9sO7f+Kf6tJd+G
BovBHr0HEsf1cLz0AhPg/DL+d3TZV2tS+jHBFdIt9Qm5LChTA4ARQRGQ3ESt2wnYkVZgJVip7qLH
xj0kXLNXDnGbKFFZlZm5b0Lc3yj4ZFAKrULw5yH6oHPlmJI+10pQz3NPBr6QSHhC4fmmZF9oSdVc
SIrthIYg3A5fJ4hOI9L6DU0vmSL1pPhM4ptmp0FB7cLQ/nGQu9aCn/xgMZAn1zA3HguQ+lvE+4TO
rTNivNVLLZn/KcpKQDEt0NF62uqBREM6eivNQAb05BIb0WP9ikjPieXYmNBzY7OdpQ+Dx/E05Cbj
OQ/niafHZm01OJWOEhRu2V6ZwbqIE5KegC0sqYnIXnOE6snDYUsvEPtAm4gxGgM0jpEdVHMk1JHW
6TNP89f/lxV4poaF1vDPhELPxQXSGLKhY36vwvSIM/Bk28pA+sqZAhneO2JMqEG+UZClWPN0M3g0
CE4kt5+UPb0iSlePtPnIM+vkwtmNWcGbj4OkCFEtfsgThxnK7+ojrTcfjiProKrId7ftvybD77O4
lCw5z5c2qzwHLpQT+3vjRTvBWWTNC3aYcFS2fyFfDRGiMFbsVRtWUkflyrRtWlruz+g+rbWeAtNt
4xM=
=XF9H
-----END PGP SIGNATURE-----

--------------7VdpEByIe2aE28cDYy6CuHaZ--
