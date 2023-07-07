Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4136274AC0C
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 09:38:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D8C410E521;
	Fri,  7 Jul 2023 07:38:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B70110E520
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 07:38:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 05B3F22487;
 Fri,  7 Jul 2023 07:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1688715491; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F36gO1AIjWSom4BofC9EDwp7MTdtMD0LArwcqibCWEs=;
 b=gu6aUFwaHz2F1nuOb94T3ubZp2ch0lw2m7gesT7r+zPsZP/fpkP2cujPdb1MFnXg50gHTD
 8lR68UJeFL4m+D9qRuYp+wSFcGj8W1KDDfDU5Z5SW8JucgvefMx6cBmoLRCnHN4U+HPMwg
 B3UeepOJDcWwg5TCSC7l/eFCP5uTbBo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1688715491;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=F36gO1AIjWSom4BofC9EDwp7MTdtMD0LArwcqibCWEs=;
 b=wcv9ZDcVXE5ddVLknCubPotGV5WRtkqSYmNb60AC3c9m0HklaUSH3a3fq/JYp1/yUioDwY
 bIJgyb7H01iCm9Aw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E0A08139E0;
 Fri,  7 Jul 2023 07:38:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id p7ztNeLAp2QsIgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 07 Jul 2023 07:38:10 +0000
Message-ID: <208dc0f5-0b7c-0ca9-665e-72d0e154226c@suse.de>
Date: Fri, 7 Jul 2023 09:38:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 01/10] fbdev/broadsheetfb: Select FB_SYS_HELPERS_DEFERRED
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, javierm@redhat.com
References: <20230706151432.20674-1-tzimmermann@suse.de>
 <20230706151432.20674-2-tzimmermann@suse.de>
 <57cd2e4b-fcfc-587d-4b1b-eefad5416b61@gmx.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <57cd2e4b-fcfc-587d-4b1b-eefad5416b61@gmx.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0HLmc2htMoWD3sXp4CD1cEgB"
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0HLmc2htMoWD3sXp4CD1cEgB
Content-Type: multipart/mixed; boundary="------------kNDiVmaVXCdRefq87bEjif9W";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Helge Deller <deller@gmx.de>, javierm@redhat.com
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <208dc0f5-0b7c-0ca9-665e-72d0e154226c@suse.de>
Subject: Re: [PATCH 01/10] fbdev/broadsheetfb: Select FB_SYS_HELPERS_DEFERRED
References: <20230706151432.20674-1-tzimmermann@suse.de>
 <20230706151432.20674-2-tzimmermann@suse.de>
 <57cd2e4b-fcfc-587d-4b1b-eefad5416b61@gmx.de>
In-Reply-To: <57cd2e4b-fcfc-587d-4b1b-eefad5416b61@gmx.de>

--------------kNDiVmaVXCdRefq87bEjif9W
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDYuMDcuMjMgdW0gMjE6MTMgc2NocmllYiBIZWxnZSBEZWxsZXI6DQo+IE9u
IDcvNi8yMyAxNzowOCwgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6DQo+PiBUaGUgS2NvbmZp
ZyB0b2tlbiBGQl9TWVNfSEVMUEVSU19ERUZFUlJFRCBzZWxlY3RzIGV2ZXJ5dGhpbmcgdGhh
dA0KPj4gaXMgcmVxdWlyZWQgZm9yIGRlZmVycmVkIEkvTyBvbiBzeXN0ZW0tbWVtb3J5IGZy
YW1lYnVmZmVycy4gU2VsZWN0DQo+PiBpdCBmcm9tIEZCX0JST0FEU0hFRVQgaW4gZmF2b3Ig
b2YgdGhlIGV4aXN0aW5nIGlkZW50aWNhbCBzZWxlY3Rpb24uDQo+Pg0KPj4gU2lnbmVkLW9m
Zi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+IA0KPiBJ
J20gYWN0dWFsbHkgbm90IGEgZmFuIG9mIGRlZmVycmVkLUlPIGZvciBvbGRlciBkcml2ZXJz
LCBidXQNCj4gaW4gdGhpcyBjYXNlIHdoZXJlIHRoZSBkcml2ZXJzIG9wZXJhdGUgb24gc3lz
dGVtIG1lbW9yeSBhbnl3YXksDQo+IHRoaXMgaXMgdGhlIHJpZ2h0IGFwcHJvYWNoLg0KDQpZ
ZWFoLCBkZWZlcnJlZCBJL08gaGFzIGEgY2VydGFpbiBvdmVyaGVhZC4gQnV0IGZvciB0aGlz
IGtpbmQgb2YgaGFyZHdhcmUgDQp0aGVyZSdzIG5vIGdvb2Qgd2F5IHRvIG1ha2UgbW1hcCB3
b3JrIHJlbGlhYmx5IHdpdGhvdXQuIChXZWxsLCB0aGVyZSdzIA0KbXN5bmMoKSwgYnV0IHdo
byB1c2VzIHRoYXQ/KSBUaGVzZSBkcml2ZXJzIGFscmVhZHkgaW1wbGVtZW50IGRlZmlvLCBz
byANCml0J3Mgbm90IHJlYWxseSBhIGNoYW5nZSwganVzdCBhIGNsZWFudXAuDQoNCj4gDQo+
IFRoZSBzZXJpZXMgbG9va3MgZ29vZDoNCj4gDQo+IEFja2VkLWJ5OiBIZWxnZSBEZWxsZXIg
PGRlbGxlckBnbXguZGU+DQoNClRoYW5rcyBhIGxvdC4NCg0KQmVzdCByZWdhcmRzDQpUaG9t
YXMNCg0KPiANCj4gSGVsZ2UNCj4gDQo+PiAtLS0NCj4+IMKgIGRyaXZlcnMvdmlkZW8vZmJk
ZXYvS2NvbmZpZyB8IDYgKy0tLS0tDQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDUgZGVsZXRpb25zKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlk
ZW8vZmJkZXYvS2NvbmZpZyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvS2NvbmZpZw0KPj4gaW5k
ZXggZjE0MjI5NzU3MzExLi5mZDg2MmZhYWZlNjYgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJz
L3ZpZGVvL2ZiZGV2L0tjb25maWcNCj4+ICsrKyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvS2Nv
bmZpZw0KPj4gQEAgLTIxNzksMTEgKzIxNzksNyBAQCBjb25maWcgRkJfTVgzDQo+PiDCoCBj
b25maWcgRkJfQlJPQURTSEVFVA0KPj4gwqDCoMKgwqDCoCB0cmlzdGF0ZSAiRS1JbmsgQnJv
YWRzaGVldC9FcHNvbiBTMUQxMzUyMSBjb250cm9sbGVyIHN1cHBvcnQiDQo+PiDCoMKgwqDC
oMKgIGRlcGVuZHMgb24gRkIgJiYgKEFSQ0hfUFhBIHx8IENPTVBJTEVfVEVTVCkNCj4+IC3C
oMKgwqAgc2VsZWN0IEZCX1NZU19GSUxMUkVDVA0KPj4gLcKgwqDCoCBzZWxlY3QgRkJfU1lT
X0NPUFlBUkVBDQo+PiAtwqDCoMKgIHNlbGVjdCBGQl9TWVNfSU1BR0VCTElUDQo+PiAtwqDC
oMKgIHNlbGVjdCBGQl9TWVNfRk9QUw0KPj4gLcKgwqDCoCBzZWxlY3QgRkJfREVGRVJSRURf
SU8NCj4+ICvCoMKgwqAgc2VsZWN0IEZCX1NZU19IRUxQRVJTX0RFRkVSUkVEDQo+PiDCoMKg
wqDCoMKgIGhlbHANCj4+IMKgwqDCoMKgwqDCoMKgIFRoaXMgZHJpdmVyIGltcGxlbWVudHMg
c3VwcG9ydCBmb3IgdGhlIEUtSW5rIEJyb2Fkc2hlZXQNCj4+IMKgwqDCoMKgwqDCoMKgIGNv
bnRyb2xsZXIuIFRoZSByZWxlYXNlIG5hbWUgZm9yIHRoaXMgZGV2aWNlIHdhcyBFcHNvbiBT
MUQxMzUyMQ0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVy
IERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFu
a2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3Rl
diwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJC
IDM2ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------kNDiVmaVXCdRefq87bEjif9W--

--------------0HLmc2htMoWD3sXp4CD1cEgB
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSnwOIFAwAAAAAACgkQlh/E3EQov+B9
nQ//X4R+B6egBQh9Ua5bHteBe4gEJZZsW47tvRIM738uRmhxWV/FR152UDv4eNSV9wdfeDViUMD6
bF/UIU9B+Vy01UJw/YF6un7PtA6hFMXYh6rI7QcWz/M+448ubVVgtAmo56ZaZh0IH2ifP3vq4Wq7
/VwMN8kPJcm8mfufZWEDRnN6l01DbTgL5/7zlr0JyQurSRTh4aAe1QfrXncyBJAs1dn30DZU2GiV
unMU/GBUk1EdKGYAaTTuPrj83zGxl4g+2TnLaCPHWEWLGxgAsIJTMVW9V8M5lorZl1oHD2Yzf1QB
jV3lWDsi5sGhiDmkNGYL1uMyLQhDbRv/C3OIWZdn2lnCyOaWv3R1CbpEzYrhApjGKbuQTKc4nKZh
WeV5Wi/Au+JJfhs8Eje3aynmWDryY0cJEDnpPVUbXbVi+6TvjLyrGu7q7gZ0uCfjwUpwkIHISRzP
vaj42yIKbAbinb7quEa5UaoiWxw5F1vOT6OteynHMnk+5z6pwujcgMlZ+ZgGSBl4/nq0M+MUYIOu
ruDKaa4COAJuya/GUXz9hBnLSAbfy4bLOf6aJAn90AVrivb60iQNO4/u8gz9E2FNPjJkEZQyKOJt
2CLJLMTxEuZ8VqGKhxv1F3HtOmu1SR4gdrctwxHpfw73OfJsP8pG+5AEkXSLnsz3R6fsn09vhsvz
K5g=
=uz6b
-----END PGP SIGNATURE-----

--------------0HLmc2htMoWD3sXp4CD1cEgB--
