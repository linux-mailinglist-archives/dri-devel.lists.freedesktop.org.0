Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2886944C28E
	for <lists+dri-devel@lfdr.de>; Wed, 10 Nov 2021 14:54:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73C736E4F8;
	Wed, 10 Nov 2021 13:54:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A2F16E4F8
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Nov 2021 13:54:40 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 798C71FD74;
 Wed, 10 Nov 2021 13:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1636552478; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8VUOWPq28Zr/dzCZjs3WDK3GbYBhLb5gkJbhc8O3Mt0=;
 b=AREqCHCfL/KqARISnEw0mHyKyuNavCV7jSggRazLzocvDUiz9nAn9OiVPz8KvNuCgTBzla
 H4JHUdE512Jk7uy+49z2Wl4OZqYVO3e15UJrB22vnRHrlBLOwnAaY7XkRwKCHveTzxN5gh
 zui/NWWpkYM9Kjar7P41/6Pf1kr3RqQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1636552478;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8VUOWPq28Zr/dzCZjs3WDK3GbYBhLb5gkJbhc8O3Mt0=;
 b=Z7TMCJP+xbozipeIMsKOqMJFYrlqg5dIdGxtg11ddu0StzT+CkH5E6j3sHQXgzgDnp/okB
 4liHNN446+7I6SCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 46D3413BFF;
 Wed, 10 Nov 2021 13:54:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id XaQAEB7Pi2HNLAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 10 Nov 2021 13:54:38 +0000
Message-ID: <887a15cb-3a3b-4ba2-aa0f-a241e70a19fa@suse.de>
Date: Wed, 10 Nov 2021 14:54:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v1 1/1] drm: Replace kernel.h with the necessary inclusions
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20211110102423.54282-1-andriy.shevchenko@linux.intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20211110102423.54282-1-andriy.shevchenko@linux.intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------kNnrg6100HvqdEZyDADWTlJs"
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
Cc: David Airlie <airlied@linux.ie>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------kNnrg6100HvqdEZyDADWTlJs
Content-Type: multipart/mixed; boundary="------------NAqjOnV40TzpAO02AzBOuA0P";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Message-ID: <887a15cb-3a3b-4ba2-aa0f-a241e70a19fa@suse.de>
Subject: Re: [PATCH v1 1/1] drm: Replace kernel.h with the necessary
 inclusions
References: <20211110102423.54282-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20211110102423.54282-1-andriy.shevchenko@linux.intel.com>

--------------NAqjOnV40TzpAO02AzBOuA0P
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTAuMTEuMjEgdW0gMTE6MjQgc2NocmllYiBBbmR5IFNoZXZjaGVua286DQo+
IFdoZW4ga2VybmVsLmggaXMgdXNlZCBpbiB0aGUgaGVhZGVycyBpdCBhZGRzIGEgbG90IGlu
dG8gZGVwZW5kZW5jeSBoZWxsLA0KPiBlc3BlY2lhbGx5IHdoZW4gdGhlcmUgYXJlIGNpcmN1
bGFyIGRlcGVuZGVuY2llcyBhcmUgaW52b2x2ZWQuDQo+IA0KPiBSZXBsYWNlIGtlcm5lbC5o
IGluY2x1c2lvbiB3aXRoIHRoZSBsaXN0IG9mIHdoYXQgaXMgcmVhbGx5IGJlaW5nIHVzZWQu
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBBbmR5IFNoZXZjaGVua28gPGFuZHJpeS5zaGV2Y2hl
bmtvQGxpbnV4LmludGVsLmNvbT4NCj4gLS0tDQo+ICAgaW5jbHVkZS9kcm0vZHJtX2dlbV90
dG1faGVscGVyLmggIHwgMiArLQ0KPiAgIGluY2x1ZGUvZHJtL2RybV9nZW1fdnJhbV9oZWxw
ZXIuaCB8IDIgKy0NCj4gICBpbmNsdWRlL2RybS9kcm1fbW0uaCAgICAgICAgICAgICAgfCA0
ICsrKy0NCj4gICAzIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlv
bnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fZ2VtX3R0bV9oZWxw
ZXIuaCBiL2luY2x1ZGUvZHJtL2RybV9nZW1fdHRtX2hlbHBlci5oDQo+IGluZGV4IGMxYWEw
MmJkNGM4OS4uNzgwNDBmNmNjNmYzIDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL2RybS9kcm1f
Z2VtX3R0bV9oZWxwZXIuaA0KPiArKysgYi9pbmNsdWRlL2RybS9kcm1fZ2VtX3R0bV9oZWxw
ZXIuaA0KPiBAQCAtMyw3ICszLDcgQEANCj4gICAjaWZuZGVmIERSTV9HRU1fVFRNX0hFTFBF
Ul9IDQo+ICAgI2RlZmluZSBEUk1fR0VNX1RUTV9IRUxQRVJfSA0KPiAgIA0KPiAtI2luY2x1
ZGUgPGxpbnV4L2tlcm5lbC5oPg0KPiArI2luY2x1ZGUgPGxpbnV4L2NvbnRhaW5lcl9vZi5o
Pg0KDQpJIGJ1aWx0IHRoaXMgcGF0Y2ggb24gYSByZWNlbnQgZHJtLW1pc2MtbmV4dCwgYnV0
IHRoZXJlJ3Mgbm8gDQpsaW51eC9jb250YWluZXJfb2YuaA0KDQpCZXN0IHJlZ2FyZHMNClRo
b21hcw0KDQo+ICAgDQo+ICAgI2luY2x1ZGUgPGRybS9kcm1fZGV2aWNlLmg+DQo+ICAgI2lu
Y2x1ZGUgPGRybS9kcm1fZ2VtLmg+DQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1f
Z2VtX3ZyYW1faGVscGVyLmggYi9pbmNsdWRlL2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmgN
Cj4gaW5kZXggZDNjZjA2YzlhZjY1Li5iNGNlMjdhNzI3NzMgMTAwNjQ0DQo+IC0tLSBhL2lu
Y2x1ZGUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuaA0KPiArKysgYi9pbmNsdWRlL2RybS9k
cm1fZ2VtX3ZyYW1faGVscGVyLmgNCj4gQEAgLTExLDggKzExLDggQEANCj4gICAjaW5jbHVk
ZSA8ZHJtL3R0bS90dG1fYm9fYXBpLmg+DQo+ICAgI2luY2x1ZGUgPGRybS90dG0vdHRtX2Jv
X2RyaXZlci5oPg0KPiAgIA0KPiArI2luY2x1ZGUgPGxpbnV4L2NvbnRhaW5lcl9vZi5oPg0K
PiAgICNpbmNsdWRlIDxsaW51eC9kbWEtYnVmLW1hcC5oPg0KPiAtI2luY2x1ZGUgPGxpbnV4
L2tlcm5lbC5oPiAvKiBmb3IgY29udGFpbmVyX29mKCkgKi8NCj4gICANCj4gICBzdHJ1Y3Qg
ZHJtX21vZGVfY3JlYXRlX2R1bWI7DQo+ICAgc3RydWN0IGRybV9wbGFuZTsNCj4gZGlmZiAt
LWdpdCBhL2luY2x1ZGUvZHJtL2RybV9tbS5oIGIvaW5jbHVkZS9kcm0vZHJtX21tLmgNCj4g
aW5kZXggOWI0MjkyZjIyOWM2Li5hYzMzYmExYjE4YmMgMTAwNjQ0DQo+IC0tLSBhL2luY2x1
ZGUvZHJtL2RybV9tbS5oDQo+ICsrKyBiL2luY2x1ZGUvZHJtL2RybV9tbS5oDQo+IEBAIC0z
OSwxMyArMzksMTUgQEANCj4gICAgKi8NCj4gICAjaW5jbHVkZSA8bGludXgvYnVnLmg+DQo+
ICAgI2luY2x1ZGUgPGxpbnV4L3JidHJlZS5oPg0KPiAtI2luY2x1ZGUgPGxpbnV4L2tlcm5l
bC5oPg0KPiArI2luY2x1ZGUgPGxpbnV4L2xpbWl0cy5oPg0KPiAgICNpbmNsdWRlIDxsaW51
eC9tbV90eXBlcy5oPg0KPiAgICNpbmNsdWRlIDxsaW51eC9saXN0Lmg+DQo+ICAgI2luY2x1
ZGUgPGxpbnV4L3NwaW5sb2NrLmg+DQo+ICAgI2lmZGVmIENPTkZJR19EUk1fREVCVUdfTU0N
Cj4gICAjaW5jbHVkZSA8bGludXgvc3RhY2tkZXBvdC5oPg0KPiAgICNlbmRpZg0KPiArI2lu
Y2x1ZGUgPGxpbnV4L3R5cGVzLmg+DQo+ICsNCj4gICAjaW5jbHVkZSA8ZHJtL2RybV9wcmlu
dC5oPg0KPiAgIA0KPiAgICNpZmRlZiBDT05GSUdfRFJNX0RFQlVHX01NDQo+IA0KDQotLSAN
ClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNv
ZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7D
vHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0
c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------NAqjOnV40TzpAO02AzBOuA0P--

--------------kNnrg6100HvqdEZyDADWTlJs
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmGLzx0FAwAAAAAACgkQlh/E3EQov+B/
RRAAs094WveDyBpl1gjBDkybhubiJOuKwc2MldCL0+nHuQ3zbCQ7reCqflbedhEUMO1cCXt1ZEhT
wzyUguUFFYCHi4atLRFF6ajOnJSz4DS3zYRnqWZeF/dVJeVsob5qXLYgdMT+xxosOYG+nt3tpAN6
EVDgMKgjg8Nh0qgkZ8dNN9AWqSZTJpKAoPtWY+Dx6F0PS42wkoSuKda87NVByaDDAikBu9BNx3Oh
AA2kPhPUkMZAdYmYunuDEuEq+0KL+MQnmfoCT0VbUT4cD6OPIgnJmENQmbYeqSWHh8F8za+Zvmod
PjzMJX3gHgCyLfT1PDvs3YvpnJakDrxILXx7mMRbURoxrpiOPpqiUmSPFxIxhab8pIIh6RLyHpZh
ZB/tXH8KSX32q5ZWNBESIWMz80TYH6FC/sfl9IivSY7joYDg53AA6dDRMTbY4d11V80cWcafx7rd
8Ksw0TvWOuQZOZs9w6jBUHJvf/+771uV20E2zRAUmqvEV19X2UFxazxV+BkH3EH/GDNk2DsqIDfN
vr/cQ/QBo2ZsRxdrUq/nE7xX47mGIh3x68nUlxaTNerngRKQ25b/Vc5wn6FobuuA45+gVkhMODAE
joUeueBjLxK+wfLkk78sCU/rbygJElty8eUbuyIMjyGr1q3aQ5tXMilHXrqF5lXNCLzIWkWNa2Te
3Eg=
=PvGj
-----END PGP SIGNATURE-----

--------------kNnrg6100HvqdEZyDADWTlJs--
