Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3F36D4260
	for <lists+dri-devel@lfdr.de>; Mon,  3 Apr 2023 12:42:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F66F10E3EA;
	Mon,  3 Apr 2023 10:42:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 107C210E3EA
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Apr 2023 10:42:07 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9910A21B66;
 Mon,  3 Apr 2023 10:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680518526; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fEc7S2hK90KviV06JbTXa9QIARshJripW9VtwndNc3U=;
 b=Y/sUZJ64xMRZgX0AcevlbmrzfK8u7yOxta8o16W1o7Oa/fGGy5KvbiY8qT+9pABpvYaELE
 m0ydiXWCeNmbycm2Z0tj2/2/FPgJ+WU7Tc9bTH0SCx72mOM5pN8JIbeBM1owznehZtLzhN
 8lEL3yLvL6zfB9YFJ0cQEnRP5/xXeOI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680518526;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fEc7S2hK90KviV06JbTXa9QIARshJripW9VtwndNc3U=;
 b=DwHPWJ+RkaKOmBRra8uV5hQZ0amjk4ZhRym1rbYv2p2oEznjsC9SoiOStbzXOrG1SECGT+
 USb9/vEfZbRKn5DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 69EAA1331A;
 Mon,  3 Apr 2023 10:42:06 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id r9viGH6tKmTvDgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 03 Apr 2023 10:42:06 +0000
Message-ID: <ffb0005d-d871-1317-8b16-d6fe3771a35e@suse.de>
Date: Mon, 3 Apr 2023 12:42:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [1/7] drm/tegra: Include <linux/of.h>
Content-Language: en-US
To: Sui Jingfeng <15330273260@189.cn>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, javierm@redhat.com, airlied@gmail.com, daniel@ffwll.ch
References: <20230330083607.12834-2-tzimmermann@suse.de>
 <14d8245f-d3ab-64a1-7cc0-52ec77dcd13f@189.cn>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <14d8245f-d3ab-64a1-7cc0-52ec77dcd13f@189.cn>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Cs1b5Oxi17jpsFR0JX2Go0sw"
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Cs1b5Oxi17jpsFR0JX2Go0sw
Content-Type: multipart/mixed; boundary="------------DbZpzGf8mG6QyD2xs4dpV5PN";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sui Jingfeng <15330273260@189.cn>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, javierm@redhat.com, airlied@gmail.com, daniel@ffwll.ch
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <ffb0005d-d871-1317-8b16-d6fe3771a35e@suse.de>
Subject: Re: [1/7] drm/tegra: Include <linux/of.h>
References: <20230330083607.12834-2-tzimmermann@suse.de>
 <14d8245f-d3ab-64a1-7cc0-52ec77dcd13f@189.cn>
In-Reply-To: <14d8245f-d3ab-64a1-7cc0-52ec77dcd13f@189.cn>

--------------DbZpzGf8mG6QyD2xs4dpV5PN
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDMwLjAzLjIzIHVtIDE0OjUxIHNjaHJpZWIgU3VpIEppbmdmZW5nOg0KPiANCj4g
UmV2aWV3ZWQtYnk6IFN1aSBKaW5nZmVuZyA8c3VpamluZ2ZlbmdAbG9vbmdzb24uY24gDQo+
IDxtYWlsdG86c3VpamluZ2ZlbmdAbG9vbmdzb24uY24+Pg0KDQpUaGFua3MgYSBsb3QuDQoN
Cj4gDQo+IA0KPiBPbiAyMDIzLzMvMzAgMTY6MzYsIFRob21hcyBaaW1tZXJtYW5uIHdyb3Rl
Og0KPj4gSW5jbHVkZSA8bGludXgvb2YuaD4gdG8gZ2V0IHRoZSBjb250YWluZWQgZGVjbGFy
YXRpb25zLiBObyBmdW5jdGlvbmFsDQo+PiBjaGFuZ2VzLg0KPj4NCj4+IFNpZ25lZC1vZmYt
Ynk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPj4gLS0tDQo+
PiDCoCBkcml2ZXJzL2dwdS9kcm0vdGVncmEvb3V0cHV0LmMgfCAyICsrDQo+PiDCoCBkcml2
ZXJzL2dwdS9kcm0vdGVncmEvcmdiLmPCoMKgwqAgfCAxICsNCj4+IMKgIDIgZmlsZXMgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS90ZWdyYS9vdXRwdXQuYyANCj4+IGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL291dHB1
dC5jDQo+PiBpbmRleCBhODkyNWRjZDdlZGQuLmQzMWM4N2Y0OGRhMCAxMDA2NDQNCj4+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9vdXRwdXQuYw0KPj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL3RlZ3JhL291dHB1dC5jDQo+PiBAQCAtNCw2ICs0LDggQEANCj4+IMKgwqAgKiBD
b3B5cmlnaHQgKEMpIDIwMTIgTlZJRElBIENPUlBPUkFUSU9OLsKgIEFsbCByaWdodHMgcmVz
ZXJ2ZWQuDQo+PiDCoMKgICovDQo+PiArI2luY2x1ZGUgPGxpbnV4L29mLmg+DQo+PiArDQo+
PiDCoCAjaW5jbHVkZSA8ZHJtL2RybV9hdG9taWNfaGVscGVyLmg+DQo+PiDCoCAjaW5jbHVk
ZSA8ZHJtL2RybV9vZi5oPg0KPj4gwqAgI2luY2x1ZGUgPGRybS9kcm1fcGFuZWwuaD4NCj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvcmdiLmMgYi9kcml2ZXJzL2dw
dS9kcm0vdGVncmEvcmdiLmMNCj4+IGluZGV4IGZmOGZjZTM2ZDJhYS4uM2YwNjAyODJjZDhk
IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL3JnYi5jDQo+PiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvcmdiLmMNCj4+IEBAIC01LDYgKzUsNyBAQA0KPj4g
wqDCoCAqLw0KPj4gwqAgI2luY2x1ZGUgPGxpbnV4L2Nsay5oPg0KPj4gKyNpbmNsdWRlIDxs
aW51eC9vZi5oPg0KPj4gwqAgI2luY2x1ZGUgPGRybS9kcm1fYXRvbWljX2hlbHBlci5oPg0K
Pj4gwqAgI2luY2x1ZGUgPGRybS9kcm1fYnJpZGdlX2Nvbm5lY3Rvci5oPg0KDQotLSANClRo
b21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3
YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJu
YmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bD
vGhyZXI6IEl2byBUb3Rldg0K

--------------DbZpzGf8mG6QyD2xs4dpV5PN--

--------------Cs1b5Oxi17jpsFR0JX2Go0sw
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQqrX4FAwAAAAAACgkQlh/E3EQov+An
Fg/+KNNxM3qSQ5Hbg/Ykeoq+ESe6IX7oTy3DtvOMmLG3VbElFVxIPsgU/2VrOoITUEDrE6i6kE5w
Dz+JHr43kpz/4oC4GpdFC2pbNY2UF5Pyh5viq2Zs8d+m6H6+onLAxW/Jnxu1iLknS5C5uzFF0Euc
Oi9rtPJF6uc9QDfhhwOIoOC2hCQQzzmYKqC2uKCWt/N/QrYwyLAB0AUznsACTN2QNg80blv/1jMt
6yEESDGVdzQRnXBpt8kcKaG6e7bIc3eZ0r/bxzzNPz6Wld1VUBUXTuw9q8OfMgyfa/ZGJuQKIcNX
oYYXPJuFbYHz4IhwPJ2qfWgm3xSoh2MD/lwJc/a5D1NahghWxcaKFTqfD548FhZG/d1sGQWeRcd1
ljhVn+vpOdXX3hZm+a08nZ0yzs3XtvmH5fzTbxdAbNt/2v0+TRiyQVRTjq4Mj2z6OPm67io3HM3s
Urw4UQ4oJ2JRP4v/PTlQBas/IJ25VjoexY6rp8052Yr1e6P3zTxm0MSEPzL2bmboX17x9kE9mhRg
4GpARwq1ycJXjFl6ffD7OGZaZHmmKwnsVbP0VenxiZZ/vORW4DnvR+D7SgCGs6XdI773kf/XwFl3
EyJYXayt0tFNEE8x0/Xj2d32BNi2fi5ZZxO2UBZiwrjcm68LxwQdoJ/cnTuqbeu6sA1PG+AdMz2h
n8E=
=0nFu
-----END PGP SIGNATURE-----

--------------Cs1b5Oxi17jpsFR0JX2Go0sw--
