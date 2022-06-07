Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 048B653F6A1
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 08:56:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62C5212AC49;
	Tue,  7 Jun 2022 06:56:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 030A712AC63;
 Tue,  7 Jun 2022 06:56:41 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 644031F974;
 Tue,  7 Jun 2022 06:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1654585000; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GtYnqqkMeCG+SdwABzSw7VDFtwge7SFqOX+iy7N9eNU=;
 b=eLwEsnDDYoCnXqAb+jFqP9/RFg+FI+S9Zub8CmAIV+YIC+Zxgx4JjAn4vnAMphALDYg6wz
 tPow/NWPkJvmhboqRIRYW4DaF3dBdBNDlLhfgOnK31/Gm5eUe2TNIixf6K1C6Q05tIpI9W
 Kjx1HVm7YFQQSMYscLiDkQG2F1KzDkU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1654585000;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GtYnqqkMeCG+SdwABzSw7VDFtwge7SFqOX+iy7N9eNU=;
 b=/cbUUaVSP6Ozv8pG8uH/ZZOZwZEQkKcjbhmsZVdVNw51JXcaKZnNzVu9DuT+4/IZ8vv7q7
 TtZlFlmX3If1FlCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2DFA313638;
 Tue,  7 Jun 2022 06:56:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ui5MCqj2nmIFcQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 07 Jun 2022 06:56:40 +0000
Message-ID: <34aacfa3-9eb9-d3d5-07b7-805fd1408bb7@suse.de>
Date: Tue, 7 Jun 2022 08:56:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 1/2] drm: Add DRM_GEM_FOPS
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20220606195432.1888346-1-robdclark@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220606195432.1888346-1-robdclark@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------xlw0dtzkO9vwXvWXs909mr81"
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------xlw0dtzkO9vwXvWXs909mr81
Content-Type: multipart/mixed; boundary="------------WPv3m0MaCPCi1nhPiH36UBtP";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Rob Clark <robdclark@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
Message-ID: <34aacfa3-9eb9-d3d5-07b7-805fd1408bb7@suse.de>
Subject: Re: [PATCH v2 1/2] drm: Add DRM_GEM_FOPS
References: <20220606195432.1888346-1-robdclark@gmail.com>
In-Reply-To: <20220606195432.1888346-1-robdclark@gmail.com>

--------------WPv3m0MaCPCi1nhPiH36UBtP
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDYuMDYuMjIgdW0gMjE6NTQgc2NocmllYiBSb2IgQ2xhcms6DQo+IEZyb206
IFJvYiBDbGFyayA8cm9iZGNsYXJrQGNocm9taXVtLm9yZz4NCj4gDQo+IFRoZSBERUZJTkVf
RFJNX0dFTV9GT1BTKCkgaGVscGVyIGlzIGEgYml0IGxpbWl0aW5nIGlmIGEgZHJpdmVyIHdh
bnRzIHRvDQo+IHByb3ZpZGUgYWRkaXRpb25hbCBmaWxlIG9wcywgbGlrZSBzaG93X2ZkaW5m
bygpLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21p
dW0ub3JnPg0KPiAtLS0NCj4gICBpbmNsdWRlL2RybS9kcm1fZ2VtLmggfCAyNiArKysrKysr
KysrKysrKysrKystLS0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25z
KCspLCA4IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2Ry
bV9nZW0uaCBiL2luY2x1ZGUvZHJtL2RybV9nZW0uaA0KPiBpbmRleCA5ZDdjNjFhMTIyZGMu
LmRjODhkNGEyY2RmNiAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2dlbS5oDQo+
ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9nZW0uaA0KPiBAQCAtMzE0LDYgKzMxNCwyMyBAQCBz
dHJ1Y3QgZHJtX2dlbV9vYmplY3Qgew0KPiAgIAljb25zdCBzdHJ1Y3QgZHJtX2dlbV9vYmpl
Y3RfZnVuY3MgKmZ1bmNzOw0KPiAgIH07DQo+ICAgDQo+ICsvKioNCj4gKyAqIERSTV9HRU1f
Rk9QUyAtIERlZmF1bHQgZHJtIEdFTSBmaWxlIG9wZXJhdGlvbnMNCj4gKyAqDQo+ICsgKiBU
aGlzIG1hY3JvIHByb3ZpZGVzIGEgc2hvcnRoYW5kIGZvciBzZXR0aW5nIHRoZSBHRU0gZmls
ZSBvcHMgaW4gdGhlDQo+ICsgKiAmZmlsZV9vcGVyYXRpb25zIHN0cnVjdHVyZS4gDQoNCkkg
d291bGQgYXBwcmVjaWF0ZSBhIHJlZmVyZW5jZSB0byBERUZJTkVfRFJNX0dFTV9GT1BTLiBT
b21ldGhpbmcgYWxvbmcgDQp0aGUgbGluZXMgb2YgJ2lmIGFsbCB5b3UgbmVlZCBhcmUgdGhl
IGRlZmF1bHQgb3BzLCB1c2UgREVGSU5FX0RSTV9HRU1fRk9QUycuDQoNCj4gKyAqLw0KPiAr
I2RlZmluZSBEUk1fR0VNX0ZPUFMgXA0KPiArCS5vcGVuCQk9IGRybV9vcGVuLFwNCj4gKwku
cmVsZWFzZQk9IGRybV9yZWxlYXNlLFwNCj4gKwkudW5sb2NrZWRfaW9jdGwJPSBkcm1faW9j
dGwsXA0KPiArCS5jb21wYXRfaW9jdGwJPSBkcm1fY29tcGF0X2lvY3RsLFwNCj4gKwkucG9s
bAkJPSBkcm1fcG9sbCxcDQo+ICsJLnJlYWQJCT0gZHJtX3JlYWQsXA0KPiArCS5sbHNlZWsJ
CT0gbm9vcF9sbHNlZWssXA0KPiArCS5tbWFwCQk9IGRybV9nZW1fbW1hcA0KPiArDQo+ICsN
Cg0KT25seSBvbmUgZW1wdHkgbGluZSBwbGVhc2UuDQoNCj4gICAvKioNCj4gICAgKiBERUZJ
TkVfRFJNX0dFTV9GT1BTKCkgLSBtYWNybyB0byBnZW5lcmF0ZSBmaWxlIG9wZXJhdGlvbnMg
Zm9yIEdFTSBkcml2ZXJzDQo+ICAgICogQG5hbWU6IG5hbWUgZm9yIHRoZSBnZW5lcmF0ZWQg
c3RydWN0dXJlDQo+IEBAIC0zMzAsMTQgKzM0Nyw3IEBAIHN0cnVjdCBkcm1fZ2VtX29iamVj
dCB7DQo+ICAgI2RlZmluZSBERUZJTkVfRFJNX0dFTV9GT1BTKG5hbWUpIFwNCj4gICAJc3Rh
dGljIGNvbnN0IHN0cnVjdCBmaWxlX29wZXJhdGlvbnMgbmFtZSA9IHtcDQo+ICAgCQkub3du
ZXIJCT0gVEhJU19NT0RVTEUsXA0KDQpJcyB0aGVyZSBhIHNwZWNpZmljIHJlYXNvbiB3aHkg
Lm93bmVyIGlzIHN0aWxsIHNldCBoZXJlPyBJIHN1c3BlY3QgdGhhdCANCkRSTV9HRU1fRk9Q
UyBpcyBzdHJpY3RseSBmb3IgY2FsbGJhY2sgZnVuY3Rpb25zPw0KDQpJbiBhbnkgY2FzZQ0K
DQpBY2tlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQoN
CkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gLQkJLm9wZW4JCT0gZHJtX29wZW4sXA0KPiAt
CQkucmVsZWFzZQk9IGRybV9yZWxlYXNlLFwNCj4gLQkJLnVubG9ja2VkX2lvY3RsCT0gZHJt
X2lvY3RsLFwNCj4gLQkJLmNvbXBhdF9pb2N0bAk9IGRybV9jb21wYXRfaW9jdGwsXA0KPiAt
CQkucG9sbAkJPSBkcm1fcG9sbCxcDQo+IC0JCS5yZWFkCQk9IGRybV9yZWFkLFwNCj4gLQkJ
Lmxsc2VlawkJPSBub29wX2xsc2VlayxcDQo+IC0JCS5tbWFwCQk9IGRybV9nZW1fbW1hcCxc
DQo+ICsJCURSTV9HRU1fRk9QUyxcDQo+ICAgCX0NCj4gICANCj4gICB2b2lkIGRybV9nZW1f
b2JqZWN0X3JlbGVhc2Uoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmopOw0KDQotLSANClRo
b21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3
YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJu
YmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bD
vGhyZXI6IEl2byBUb3Rldg0K

--------------WPv3m0MaCPCi1nhPiH36UBtP--

--------------xlw0dtzkO9vwXvWXs909mr81
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmKe9qcFAwAAAAAACgkQlh/E3EQov+DG
hQ//fkjGsZRzBkApq7GtenwYHJJUtBJ5BE9x6aEjkNYYZw1EJ6IdJBZudTX5B8f6SQpno4GCO+aQ
pQcp13X9YKBI3SZ/YNRuanCh5T1w7x34+z2MH6/hRBWmFSzBGUsQdXoxbe1n6eanY/BU1ZSsuc4r
dTmKVDD8iC3HLEiX8mOhmgG509HWtCgh4RVSE7/wmwO+ijH5WcCLhKm0crC480EDT1/vyHohJ6eH
eBbs1SdE9IR9ucAiarXfuS2NgEQw6uar24wTEYKXORHDsjrB8/aZV21fKU7oQSr6ZYqWq3P7rmAc
x7gXtF6hEoe/k/ixl8rj3Q4NuNMO90MBQDTQEGVJCQTtL8kXzA17rmLYaVlY2NdlPGnDNPvvHfq9
KJh3W3S8oAhm/831DHMRr902vu69zIX94wawYoHF/vG1n/jrxzMEKGAEFcX1r8PIUIN1B4EAgaQb
AVpvqrVo3kuulJPGZTFreEvwGniO4H23DBHdXBT6MEazzcu+x01UBvghHY/dAcQvy0+R+LW7bKcg
xK6uhuPdTwT/k70ZSAwGOD5yZ/2aIH9rS+seM5rLwCbqk7rimv+6aAXav1PxeaUchqfbWGSDKv4A
V+T+X/MaBW3bbPrJ1vau0O8rfLLJJL4KzWZH0b6WVqTt70E2zFTP9QaXnWxM05MLP7TM3UOZvzFB
GiE=
=JNib
-----END PGP SIGNATURE-----

--------------xlw0dtzkO9vwXvWXs909mr81--
