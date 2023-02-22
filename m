Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE87269F4CC
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 13:42:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7994F10E00A;
	Wed, 22 Feb 2023 12:42:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EBB510E00A;
 Wed, 22 Feb 2023 12:42:53 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E023A3369F;
 Wed, 22 Feb 2023 12:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1677069771; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=00fKa3Pg7xM7XyYXHDD0alYo5Cr5Wwhs1ZdIRCtzOAo=;
 b=r6dgcn7hpWErHQMXudknaO/recmTNduYyLxXPJcP26+8SE1HLCKcBWkziSH1917IJMQ4Ur
 Zc5/dBV/f/LL5rra1+Hi7Tmj4YIyL4/LZ+D3Lr3xJYAr+4YlmjLCNRsqg+nVYIGKmSsDra
 /PjUlFgq2vCzD3lY7IRRH220A4Kog9Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1677069771;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=00fKa3Pg7xM7XyYXHDD0alYo5Cr5Wwhs1ZdIRCtzOAo=;
 b=MJ5fak7t9ywrZn9AILbxZgzasxStB/h+Pfm3RF/A7Ps+fQc35z+NTpsNfD4UZMiJHKv8Jy
 ks3IO0EHQLH1aDDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B4D8F133E0;
 Wed, 22 Feb 2023 12:42:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id CNM0K8sN9mP6TAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 22 Feb 2023 12:42:51 +0000
Message-ID: <08e3340e-b459-0e60-4bba-30716b675e05@suse.de>
Date: Wed, 22 Feb 2023 13:42:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH] drm/msm: Fix possible uninitialized access in fbdev
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, javierm@redhat.com,
 robdclark@gmail.com, quic_abhinavk@quicinc.com
References: <20230222123712.5049-1-tzimmermann@suse.de>
 <c62e64e6-4114-2411-b80b-8cdc112a4393@linaro.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <c62e64e6-4114-2411-b80b-8cdc112a4393@linaro.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------LSb3CjLc6VCr1IIjjqgLfRSz"
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 kernel test robot <lkp@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------LSb3CjLc6VCr1IIjjqgLfRSz
Content-Type: multipart/mixed; boundary="------------lNm1QWZJ0CJmq6oVw8jTmvyg";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, javierm@redhat.com,
 robdclark@gmail.com, quic_abhinavk@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 kernel test robot <lkp@intel.com>, dri-devel@lists.freedesktop.org
Message-ID: <08e3340e-b459-0e60-4bba-30716b675e05@suse.de>
Subject: Re: [PATCH] drm/msm: Fix possible uninitialized access in fbdev
References: <20230222123712.5049-1-tzimmermann@suse.de>
 <c62e64e6-4114-2411-b80b-8cdc112a4393@linaro.org>
In-Reply-To: <c62e64e6-4114-2411-b80b-8cdc112a4393@linaro.org>

--------------lNm1QWZJ0CJmq6oVw8jTmvyg
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjIuMDIuMjMgdW0gMTM6Mzcgc2NocmllYiBEbWl0cnkgQmFyeXNoa292Og0K
PiBPbiAyMi8wMi8yMDIzIDE0OjM3LCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4+IERv
IG5vdCBydW4gZHJtX2ZiX2hlbHBlcl91bnByZXBhcmUoKSBpZiBmYmRldiBhbGxvY2F0aW9u
IGZhaWxzLiBBdm9pZHMNCj4+IGFjY2VzcyB0byBhbiB1bmluaXRpYWxpemVkIHBvaW50ZXIu
IE9yaWdpbmFsIGJ1ZyByZXBvcnQgaXMgYXQgWzFdLg0KPj4NCj4+IFJlcG9ydGVkLWJ5OiBr
ZXJuZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4NCj4+IFNpZ25lZC1vZmYtYnk6IFRo
b21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPj4gRml4ZXM6IDNmYjFm
NjJmODBhMSAoImRybS9mYi1oZWxwZXI6IFJlbW92ZSBkcm1fZmJfaGVscGVyX3VucHJlcGFy
ZSgpIA0KPj4gZnJvbSBkcm1fZmJfaGVscGVyX2ZpbmkoKSIpDQo+PiBMaW5rOiANCj4+IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL29lLWtidWlsZC1hbGwvMjAyMzAyMjIwODEwLjlkeW13
Q1E4LWxrcEBpbnRlbC5jb20vICMgMQ0KPj4gLS0tDQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0v
bXNtL21zbV9mYmRldi5jIHwgNCArKy0tDQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gUmV2aWV3ZWQtYnk6IERtaXRyeSBC
YXJ5c2hrb3YgPGRtaXRyeS5iYXJ5c2hrb3ZAbGluYXJvLm9yZz4NCj4gDQoNCkltcHJlc3Np
dmUgcmVzcG9uc2UgdGltZS4gVGhhbmtzIGEgbG90Lg0KDQpCZXN0IHJlZ2FyZHMNClRob21h
cw0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVy
DQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUs
IDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0K
R2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------lNm1QWZJ0CJmq6oVw8jTmvyg--

--------------LSb3CjLc6VCr1IIjjqgLfRSz
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmP2DcsFAwAAAAAACgkQlh/E3EQov+BL
hxAAl6st0LRpLjg3KU5IdcDPRSaISEUq50nS8wzGcNh5l/+6tPoelB9LDal17dwiazvw5OMzUJ0S
fOEc0W1ogtczIzhEZauJMXMP5szrb8OJWSY5+i+cwHtqWJeAnuMJ/yrKiqCKD98iY91ZmutMJpBW
vt/BxA1KR4yUpf6BuA0QI3R++r+ufOY08dSVLJxuDy9j1NXg4X0k3g8PYWC/54Sz8uwNXAP017DB
yox+2cWHTpMOTjrr5eGGolUSpLosCU56NBJzWwTYg73KUHr6/VqOdQnO4izla6HEjVf86EG8T/WY
jl2Y7jeIVwTHDp39UxfdxSbJAXh/SGTDWFMf8VYa1G7YiHjikwpVNi7rWBjTkLKdmCHTS/N/aktK
zLCFVWG9D8zBCDeuJ40fnwSjE9+aVY4vvwzpsVXp4vHPTGbqnB4nEl3PZxgav0cTLVEji/qnTCR/
IA6FAK1Q3cglR8DUtK095FiFXgai/OQJHUl+30r0e4muyMOgwdPK24UmAuAx2WVTMvDuundSbb4u
fY12Pxz2hOwjp8O0yikDlGcsJkG2XQ9kMIzCfFXBqYihjcYS/XaVmvlpv8r4/DCeXPL4J/1XE64/
tgUW88+NwwmWuteNX6+OeqWd9m7oS7uF2YQ+1IzDN5HRgDs5UaSO94CnOl1Xs5F0+xMEVjRPMobU
vNU=
=deyL
-----END PGP SIGNATURE-----

--------------LSb3CjLc6VCr1IIjjqgLfRSz--
