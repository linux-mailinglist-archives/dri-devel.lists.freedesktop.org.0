Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 296936BE566
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 10:20:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F4CB10EEA8;
	Fri, 17 Mar 2023 09:20:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DC2D10EEA8;
 Fri, 17 Mar 2023 09:20:18 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CFD5521A6A;
 Fri, 17 Mar 2023 09:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1679044816; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a3YLdNJ/GUKmOZE/JF1DZ8wfE2vhzraffPkYkzpGjZE=;
 b=yno3aeMKj/vdZkSWunQOydUd/IupUj5rLFjJjtEN0qLqj+yPk2ZgCIzWYt0ELpaCWVCqFq
 ynw25BK4OL+94Y02k7zG/kTuz+y3GhZXIlFa/+xWXyk9SdZIt1vFZsI7Ql8UQxBFCkVgcI
 YmuTgnuDilT/PpYhq/2ja8GK7AxVXF0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1679044816;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a3YLdNJ/GUKmOZE/JF1DZ8wfE2vhzraffPkYkzpGjZE=;
 b=2gCFmG2XqTvgAZyCOQaeQEa4fOdho5I56fBKu+NYc7mHe+ZFRYT6g4K5zUc2FlMqssq19L
 4SHfOhg0v0Dnz9CA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A312A13428;
 Fri, 17 Mar 2023 09:20:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id LoHLJtAwFGRUTAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 17 Mar 2023 09:20:16 +0000
Message-ID: <2d04d39a-ff1c-59b1-acde-4fef5870a260@suse.de>
Date: Fri, 17 Mar 2023 10:20:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 00/10] drm/radeon: Convert fbdev to DRM client
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 alexander.deucher@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, javierm@redhat.com
References: <20230316093738.28866-1-tzimmermann@suse.de>
 <e84bdd5b-6615-33c0-bfff-208d6165a183@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <e84bdd5b-6615-33c0-bfff-208d6165a183@amd.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------biA282WmOuFWxvR94FnnyDeR"
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
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------biA282WmOuFWxvR94FnnyDeR
Content-Type: multipart/mixed; boundary="------------paS6qyoWIwJmcPm1Kg9G2bRa";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 alexander.deucher@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, javierm@redhat.com
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Message-ID: <2d04d39a-ff1c-59b1-acde-4fef5870a260@suse.de>
Subject: Re: [PATCH 00/10] drm/radeon: Convert fbdev to DRM client
References: <20230316093738.28866-1-tzimmermann@suse.de>
 <e84bdd5b-6615-33c0-bfff-208d6165a183@amd.com>
In-Reply-To: <e84bdd5b-6615-33c0-bfff-208d6165a183@amd.com>

--------------paS6qyoWIwJmcPm1Kg9G2bRa
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgQ2hyaXN0aWFuDQoNCkFtIDE3LjAzLjIzIHVtIDA5OjUzIHNjaHJpZWIgQ2hyaXN0aWFu
IEvDtm5pZzoNCj4gQW0gMTYuMDMuMjMgdW0gMTA6Mzcgc2NocmllYiBUaG9tYXMgWmltbWVy
bWFubjoNCj4+IENvbnZlcnQgcmFkZW9uJ3MgZmJkZXYgY29kZSB0byBkcm1fY2xpZW50LiBS
ZXBsYWNlcyB0aGUgY3VycmVudA0KPj4gYWQtaG9jIGludGVncmF0aW9uLiBUaGUgY29udmVy
c2lvbiBpbmNsdWRlcyBhIG51bWJlciBvZiBjbGVhbnVwcy4NCj4+IE9ubHkgYnVpbGQgZmJk
ZXYgc3VwcG9ydCBpZiB0aGUgY29uZmlnIG9wdGlvbiBoYXMgYmVlbiBzZXQuDQo+IA0KPiBJ
J20gdG9ybiBhcGFydCBvbiB0aGF0LiBPbiB0aGUgb25lIGhhbmQgaXQgbG9va3MgbGlrZSBh
IHJlYWxseSBuaWNlIA0KPiBjbGVhbnVwIG9uIHRoZSBvdGhlciBoYW5kIHdlIGRvbid0IHJl
YWxseSB3YW50IHRvIHRvdWNoIHJhZGVvbiBhbnkgbW9yZS4NCg0KSXQncyBhIGRyaXZlciBp
biB0aGUgdXBzdHJlYW0ga2VybmVsLiBZb3UgaGF2ZSB0byBleHBlY3QgYXQgbGVhc3Qgc29t
ZSANCmNoYW5nZXMuDQoNCj4gDQo+IEFsZXggd2hhdCBkbyB5b3UgdGhpbms/IElzIHRoYXQg
d29ydGggdGhlIHJpc2sgb2YgYnJlYWtpbmcgc3R1ZmY/DQoNCk1vdmluZyBhbGwgZmJkZXYg
ZW11bGF0aW9uIHRvIHN0cnVjdCBkcm1fY2xpZW50IGlzIHJlcXVpcmVkIGZvciBuZXcgDQpp
bi1rZXJuZWwgRFJNIGNsaWVudHMsIHN1Y2ggYXMgYSBEUk0ga2VybmVsIGxvZ2dlciBvciBh
IGJvb3Qgc3BsYXNoLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiBDaHJpc3Rp
YW4uDQo+IA0KPj4NCj4+IFRob21hcyBaaW1tZXJtYW5uICgxMCk6DQo+PiDCoMKgIGRybS9y
YWRlb246IE1vdmUgcmFkZW9uX2FsaWduX3BpdGNoKCkgbmV4dCB0byBkdW1iLWJ1ZmZlciBo
ZWxwZXJzDQo+PiDCoMKgIGRybS9yYWRlb246IEltcHJvdmUgZmJkZXYgb2JqZWN0LXRlc3Qg
aGVscGVyDQo+PiDCoMKgIGRybS9yYWRlb246IFJlbW92ZSBzdHJ1Y3QgcmFkZW9uX2ZiZGV2
DQo+PiDCoMKgIGRybS9yYWRlb246IFJlbW92ZSB0ZXN0IGZvciAhc2NyZWVuX2Jhc2UgaW4g
ZmJkZXYgcHJvYmluZw0KPj4gwqDCoCBkcm0vcmFkZW9uOiBNb3ZlIGZiZGV2IG9iamVjdCBo
ZWxwZXJzIGJlZm9yZSBzdHJ1Y3QgZmJfb3BzIGV0IGFsDQo+PiDCoMKgIGRybS9yYWRlb246
IEZpeCBjb2Rpbmcgc3R5bGUgaW4gZmJkZXYgZW11bGF0aW9uDQo+PiDCoMKgIGRybS9yYWRl
b246IE1vdmUgZmJkZXYgY2xlYW51cCBjb2RlIGludG8gZmJfZGVzdHJveSBjYWxsYmFjaw0K
Pj4gwqDCoCBkcm0vcmFkZW9uOiBDb3JyZWN0bHkgY2xlYW4gdXAgZmFpbGVkIGRpc3BsYXkg
cHJvYmluZw0KPj4gwqDCoCBkcm0vcmFkZW9uOiBJbXBsZW1lbnQgY2xpZW50LWJhc2VkIGZi
ZGV2IGVtdWxhdGlvbg0KPj4gwqDCoCBkcm0vcmFkZW9uOiBPbmx5IGJ1aWxkIGZiZGV2IGlm
IERSTV9GQkRFVl9FTVVMQVRJT04gaXMgc2V0DQo+Pg0KPj4gwqAgZHJpdmVycy9ncHUvZHJt
L3JhZGVvbi9NYWtlZmlsZcKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMyArLQ0KPj4gwqAgZHJp
dmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb24uaMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMiAr
DQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kaXNwbGF5LmMgfMKgwqAg
NCAtDQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kcnYuY8KgwqDCoMKg
IHzCoMKgIDMgKy0NCj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rydi5o
wqDCoMKgwqAgfMKgwqAgMSAtDQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVv
bl9mYi5jwqDCoMKgwqDCoCB8IDQwMCAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQo+PiDCoCBk
cml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9mYmRldi5jwqDCoCB8IDQyMiArKysrKysr
KysrKysrKysrKysrKysrKysNCj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9u
X2dlbS5jwqDCoMKgwqAgfMKgIDI0ICsrDQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vcmFkZW9u
L3JhZGVvbl9rbXMuY8KgwqDCoMKgIHzCoCAxOCAtDQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0v
cmFkZW9uL3JhZGVvbl9tb2RlLmjCoMKgwqAgfMKgIDIwICstDQo+PiDCoCAxMCBmaWxlcyBj
aGFuZ2VkLCA0NjQgaW5zZXJ0aW9ucygrKSwgNDMzIGRlbGV0aW9ucygtKQ0KPj4gwqAgZGVs
ZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2ZiLmMNCj4+
IMKgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9m
YmRldi5jDQo+Pg0KPj4NCj4+IGJhc2UtY29tbWl0OiBlYzA3MDhlODQ2YjgxOWM4ZDViNjQy
ZGU0MjQ0OGE4N2Q3NTI2NTY0DQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFw
aGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55
IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAz
NjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------paS6qyoWIwJmcPm1Kg9G2bRa--

--------------biA282WmOuFWxvR94FnnyDeR
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQUMNAFAwAAAAAACgkQlh/E3EQov+Ai
gw/+POvyxCv8OgnC1B9H/WCABymyzQ0BdzhtBnnHWgVflUYagham9LBAUuUMW2+hCA0oNy0VzVKT
BS/AmwvFAOdtRSKSWClg5kbb/Lpc8o6qiKvd0MJuZLQMv7WQzAkgWrnVKddtKy2fjcgpETfRQoXg
wWA/IpXOQQ2+M6LyjPVgNPyIhI94Vhw8vCpItmt4nYWyAL5Bxmsc4vDmGBpRBZd4NvxK3MnB4Xz/
rVvbR38xzgKo5wTwg1BaSo/1vMItXCtNQYEwWkMquqIkxkVZAsDUbUpchZeP55kpcSgW68CA6weP
0GkMBXduUOmeBw/fiEH/QpyyaCiO0YGr977aFmV3Mu0z7MZ9rskqOAdnh4UYbPd69cuHZpjrdEqW
CWFWTV8xoLDUoRkCMT5USEn+/pKT7J3ihEbCW8Hvas+6/9KCu3PKUOnAL7iuW27cEbNrb/ML7b0/
YaZHr5rR9t9RdYNydQfSG/rHcwk5DaKnk0hlAAILv8Uc0KIUA4D5FruF8zqTGc+r+MTD80M/I/xl
jQaW3sMrNMk8KRVsVSGrUB/6WfpyXXs69GXs4t+wqLWlxxmRGPIiv7BgvvZqJqN+PPu9YZoDBXwV
YmJoF5cjK2WdeEMAU0iLkoeCvDJJ5keurE0g9tFUuU6Gjkd+UmxCnTgzAhNhQEajV7sXFMN8QPy3
DYs=
=b3Xt
-----END PGP SIGNATURE-----

--------------biA282WmOuFWxvR94FnnyDeR--
