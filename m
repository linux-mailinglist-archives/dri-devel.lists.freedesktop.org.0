Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3576E5A62
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 09:24:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40E6D10E6B0;
	Tue, 18 Apr 2023 07:24:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F39E910E6AF
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 07:24:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1C15521A0F;
 Tue, 18 Apr 2023 07:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1681802681; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EZURIXmkh6vE12H0vdr0lfwPR+tF25YvQ0Zv24WkP3M=;
 b=n3eNXy7eeYFgS7nfg3J2zH51r+R38m8E7gYEdGLAydGv6NZwDij/XuadLw+JuYmt0nV3OA
 g795834d2gxTo+u/dZJEx/6Fh5uyGVg/VbuvykzkZLNDIEEwVYeoymrGlU7fFlpGgYjxs/
 Fk0453MDDVqoudQK3UYq8unjHE2PV9A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1681802681;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EZURIXmkh6vE12H0vdr0lfwPR+tF25YvQ0Zv24WkP3M=;
 b=Pm2tHdd6dX56SNHnUYbcvFNwfkKY1Oh/bXWALeBY0LaiSfQQrRjvJUxW81QpvefR4BLSQM
 bcmR/5bj9gSPiMAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E49B913581;
 Tue, 18 Apr 2023 07:24:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ER7lNrhFPmQYYAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 18 Apr 2023 07:24:40 +0000
Message-ID: <45255d15-6149-adbc-6b26-22e9d03634f3@suse.de>
Date: Tue, 18 Apr 2023 09:24:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] drm/ast: Fix ARM compatibility
Content-Language: en-US
To: Jammy Huang <jammy_huang@aspeedtech.com>, airlied@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch
References: <20230302021905.2777-1-jammy_huang@aspeedtech.com>
 <d72b0fd9-844e-a422-45b6-261d73dbad18@aspeedtech.com>
 <24987cff-02e4-aa4a-449f-fd48accf7365@suse.de>
 <c5fb047b-ed55-be1f-56ae-3b21b1d1dd29@aspeedtech.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <c5fb047b-ed55-be1f-56ae-3b21b1d1dd29@aspeedtech.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------3Q9eNZclWazjf2qkZ2aVLF6c"
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
Cc: giantl@nvidia.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------3Q9eNZclWazjf2qkZ2aVLF6c
Content-Type: multipart/mixed; boundary="------------slMJ0wC7yVo3xBw3KL3zNWVe";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jammy Huang <jammy_huang@aspeedtech.com>, airlied@redhat.com,
 airlied@gmail.com, daniel@ffwll.ch
Cc: giantl@nvidia.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Message-ID: <45255d15-6149-adbc-6b26-22e9d03634f3@suse.de>
Subject: Re: [PATCH] drm/ast: Fix ARM compatibility
References: <20230302021905.2777-1-jammy_huang@aspeedtech.com>
 <d72b0fd9-844e-a422-45b6-261d73dbad18@aspeedtech.com>
 <24987cff-02e4-aa4a-449f-fd48accf7365@suse.de>
 <c5fb047b-ed55-be1f-56ae-3b21b1d1dd29@aspeedtech.com>
In-Reply-To: <c5fb047b-ed55-be1f-56ae-3b21b1d1dd29@aspeedtech.com>

--------------slMJ0wC7yVo3xBw3KL3zNWVe
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTguMDQuMjMgdW0gMDM6MjMgc2NocmllYiBKYW1teSBIdWFuZzoNCj4gSGkg
VGhvbWFzLA0KPiANCj4gVGhlIEludGVsKHg4NikgQ1BVcyBoYXZlIGEgc2VwYXJhdGUgYWRk
cmVzcyBzcGFjZSBmb3IgIklPIiwgYnV0IHRoZSBBUk0gDQo+IGFyY2hpdGVjdHVyZSBvbmx5
IGhhcyAibWVtb3J5Iiwgc28gYWxsIElPIGRldmljZXMgYXJlIGFjY2Vzc2VkIGFzIGlmIA0K
PiB0aGV5IHdlcmUgbWVtb3J5LiBXaGljaCBtZWFucyBBUk0gZG9lcyBub3Qgc3VwcG9ydCBp
c29sYXRlZCBJTy4gSGVyZSBpcyANCj4gYSByZWxhdGVkIGRpc2N1c3Npb24gb24gQVJNJ3Mg
Zm9ydW0uDQo+IA0KPiBodHRwczovL2NvbW11bml0eS5hcm0uY29tL3N1cHBvcnQtZm9ydW1z
L2YvYXJjaGl0ZWN0dXJlcy1hbmQtcHJvY2Vzc29ycy1mb3J1bS81MjA0Ni9ob3ctdG8tcmVh
ZC13cml0ZS1hbi1pLW8tcG9ydC1pbi1hYXJjaDY0DQo+IA0KPiBUaHVzLCB3ZSB3YW50IHRv
IGFkYXB0IE1NSU8gb25seSBhZnRlciB0aGlzIHBhdGNoLg0KDQpXaGF0IEkgbWVhbiBpcyB0
aGF0IHRoZXJlJ3MgYSBjb21tZW50IHRoYXQgc2F5cyAiYXNzdW1lIHRoZSBjaGlwIGhhcyAN
Ck1NSU8gZW5hYmxlZCBieSBkZWZhdWx0IChyZXYgMHgyMCBhbmQgaGlnaGVyKSIuIFdlIGFs
c28gc3VwcG9ydCByZXZzIA0KYmVmb3JlIDB4MjAuIFdoYXQgaGFwcGVucyB0byB0aGVtPw0K
DQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiBPbiAyMDIzLzQvMTcg5LiL5Y2IIDA3
OjUxLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4+IEhpDQo+Pg0KPj4gQW0gMDcuMDQu
MjMgdW0gMDQ6MDkgc2NocmllYiBKYW1teSBIdWFuZzoNCj4+PiBIaSBUaG9tYXMsDQo+Pj4N
Cj4+PiBDb3VsZCB5b3UgaGVscCByZXZpZXcgdGhpcyBwYXRjaD8/DQo+Pj4NCj4+PiBXZSBt
ZXQgc29tZSBwcm9ibGVtIG9uIG52aWRpYSdzIEFSTSBwbGF0ZnJvbSBhbmQgbmVlZCB0aGlz
IHBhdGNoIHRvIA0KPj4+IGZpeCBpdC4NCj4+Pg0KPj4+IE9uIDIwMjMvMy8yIOS4iuWNiCAx
MDoxOSwgSmFtbXkgSHVhbmcgd3JvdGU6DQo+Pj4+IEFSTSBhcmNoaXRlY3R1cmUgb25seSBo
YXMgJ21lbW9yeScsIHNvIGFsbCBkZXZpY2VzIGFyZSBhY2Nlc3NlZCBieSANCj4+Pj4gTU1J
Ty4NCj4+Pj4NCj4+Pj4gU2lnbmVkLW9mZi1ieTogSmFtbXkgSHVhbmcgPGphbW15X2h1YW5n
QGFzcGVlZHRlY2guY29tPg0KPj4+PiAtLS0NCj4+Pj4gwqAgZHJpdmVycy9ncHUvZHJtL2Fz
dC9hc3RfbWFpbi5jIHwgMTcgKy0tLS0tLS0tLS0tLS0tLS0NCj4+Pj4gwqAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxNiBkZWxldGlvbnMoLSkNCj4+Pj4NCj4+Pj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X21haW4uYyANCj4+Pj4gYi9kcml2
ZXJzL2dwdS9kcm0vYXN0L2FzdF9tYWluLmMNCj4+Pj4gaW5kZXggNzk0ZmZkNGEyOWM1Li5m
ODZkMDFlOWYwMjQgMTAwNjQ0DQo+Pj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0
X21haW4uYw0KPj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tYWluLmMNCj4+
Pj4gQEAgLTQyNCwyMiArNDI0LDcgQEAgc3RydWN0IGFzdF9kZXZpY2UgKmFzdF9kZXZpY2Vf
Y3JlYXRlKGNvbnN0IA0KPj4+PiBzdHJ1Y3QgZHJtX2RyaXZlciAqZHJ2LA0KPj4+PiDCoMKg
wqDCoMKgIGlmICghYXN0LT5yZWdzKQ0KPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJu
IEVSUl9QVFIoLUVJTyk7DQo+Pj4+IC3CoMKgwqAgLyoNCj4+Pj4gLcKgwqDCoMKgICogSWYg
d2UgZG9uJ3QgaGF2ZSBJTyBzcGFjZSBhdCBhbGwsIHVzZSBNTUlPIG5vdyBhbmQNCj4+Pj4g
LcKgwqDCoMKgICogYXNzdW1lIHRoZSBjaGlwIGhhcyBNTUlPIGVuYWJsZWQgYnkgZGVmYXVs
dCAocmV2IDB4MjANCj4+Pj4gLcKgwqDCoMKgICogYW5kIGhpZ2hlcikuDQo+Pj4+IC3CoMKg
wqDCoCAqLw0KPj4+PiAtwqDCoMKgIGlmICghKHBjaV9yZXNvdXJjZV9mbGFncyhwZGV2LCAy
KSAmIElPUkVTT1VSQ0VfSU8pKSB7DQo+Pj4+IC3CoMKgwqDCoMKgwqDCoCBkcm1faW5mbyhk
ZXYsICJwbGF0Zm9ybSBoYXMgbm8gSU8gc3BhY2UsIHRyeWluZyBNTUlPXG4iKTsNCj4+Pj4g
LcKgwqDCoMKgwqDCoMKgIGFzdC0+aW9yZWdzID0gYXN0LT5yZWdzICsgQVNUX0lPX01NX09G
RlNFVDsNCj4+Pj4gLcKgwqDCoCB9DQo+Pj4+IC0NCj4+Pj4gLcKgwqDCoCAvKiAibWFwIiBJ
TyByZWdzIGlmIHRoZSBhYm92ZSBoYXNuJ3QgZG9uZSBzbyBhbHJlYWR5ICovDQo+Pj4+IC3C
oMKgwqAgaWYgKCFhc3QtPmlvcmVncykgew0KPj4+PiAtwqDCoMKgwqDCoMKgwqAgYXN0LT5p
b3JlZ3MgPSBwY2ltX2lvbWFwKHBkZXYsIDIsIDApOw0KPj4NCj4+IFdoYXQgaGFwcGVucyBv
biBzeXN0ZW1zIHRoYXQgdXNlIHRoaXMgYnJhbmNoPw0KPj4NCj4+IEJlc3QgcmVnYXJkcw0K
Pj4gVGhvbWFzDQo+Pg0KPj4+PiAtwqDCoMKgwqDCoMKgwqAgaWYgKCFhc3QtPmlvcmVncykN
Cj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIEVSUl9QVFIoLUVJTyk7DQo+
Pj4+IC3CoMKgwqAgfQ0KPj4+PiArwqDCoMKgIGFzdC0+aW9yZWdzID0gYXN0LT5yZWdzICsg
QVNUX0lPX01NX09GRlNFVDsNCj4+Pj4gwqDCoMKgwqDCoCBhc3RfZGV0ZWN0X2NoaXAoZGV2
LCAmbmVlZF9wb3N0KTsNCj4+Pj4NCj4+Pj4gYmFzZS1jb21taXQ6IDI1NDk4NmUzMjRhZGQ4
YTMwZDAwMTljNmRhNTlmODFhZGM4YjU2NWYNCj4+Pg0KPj4NCj4gLS0gDQo+IEJlc3QgUmVn
YXJkcw0KPiBKYW1teQ0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3Mg
RHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJI
DQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDks
IEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------slMJ0wC7yVo3xBw3KL3zNWVe--

--------------3Q9eNZclWazjf2qkZ2aVLF6c
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQ+RbgFAwAAAAAACgkQlh/E3EQov+C0
fw/+Pw/Eb7R8Df/ouHb7KGbLti45AQpvseR1WqGqAO46y535LZXm5r78s+X3ZnHYa1ck1Q7aJza+
gvoscqIgyS6coZA9ELItMfH91eDOCIcGfDC8ad/jaJZHqisBiGPNdwyBFNv/Nl+4SpcdkwPdN89n
UHUuqj4EeSUF2tCjhpPSKRz2Xbn+jzLm74pFIt5SasO8aOf9B9K0UKIdjslgro86mi+3ocpwAML/
uaf3O1zmTYeZk3EFqoKjoQ4y1H1pj2ULnxKsiHZDKHGxZHzdbydwn+W2HKvcWrUZwGSnshcidz5k
nRtjH+yWnYyTpwCIt9HW3vgfXA2dJWsXOvd8tX6EuJTDIapp1IigrULuapjZ7CSEFcTodereZYfK
aZ+cwa38cJAmQYQq1gRZHevZh8+12hAKTJrtNvJ6qasZ/r2IrxLbF+jlHLjCf7ayD8afNTqrB6HQ
9VMkTgEYvhSSvfJohg6JqdqEgKNGKNKhp2CK+qERJvAQbHlgiYF0VnjI91ATq+k3Cqs9O8OEur19
SNThA1IVhwnDqVyqckil1zDl8jDPd9lxNzetp72gmSbahWFLOi1HVJLn/Spiy4iucv2EoVaxD0ev
fwX97DtcyHDG4jvmkrf/H60I/HuRn7w8GXY2HhGwyeChrYl7BKqHFp/Jq5Q3fo+uGczeWunhSvCA
22k=
=PWjJ
-----END PGP SIGNATURE-----

--------------3Q9eNZclWazjf2qkZ2aVLF6c--
