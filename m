Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD90E44EA6E
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 16:37:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 128086EE3C;
	Fri, 12 Nov 2021 15:37:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DF956EE3C
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Nov 2021 15:37:15 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 01B801FD3D;
 Fri, 12 Nov 2021 15:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1636731434; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=r1yhWqsl+cK2OoYODTVOK+XlJbh0AwQVrllNGym/R5A=;
 b=ObNXC4UD3wgsM0zBeUDfwtl5VyJH/SYxGvXvUfzWBdAaP+Myjxnli0k7qJFpHjnLAErf9f
 TuMYJfuAKSNO/OJB1Ym1YUvnOzXUh3vkms/9ljAv1wH7Jp4d2y7pHBelLmFtyVdi/VYl0h
 EB45gGkw39n1ZOBMv52pMxfTj6xASYc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1636731434;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=r1yhWqsl+cK2OoYODTVOK+XlJbh0AwQVrllNGym/R5A=;
 b=xFRK3IHAS51XY8dRtsfTFu78umQLWtQAKxSIZsvgTjhY+8JJNshMk9I8nXCfGrN9styTZl
 U6XmK8OdIcyzrEBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D6A2813C82;
 Fri, 12 Nov 2021 15:37:13 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 5gXWMimKjmHaYwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 12 Nov 2021 15:37:13 +0000
Message-ID: <4a21f548-d081-2298-02ec-fbdc5db859c2@suse.de>
Date: Fri, 12 Nov 2021 16:37:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH] drm/cma-helper: Release non-coherent memory with
 dma_free_noncoherent()
Content-Language: en-US
To: Paul Cercueil <paul@crapouillou.net>
References: <20210708175146.10618-1-tzimmermann@suse.de>
 <36f8fdd6-13dc-7a68-6365-ab2152337c33@suse.de>
 <IJTG2R.XL24166ZB1AM2@crapouillou.net>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <IJTG2R.XL24166ZB1AM2@crapouillou.net>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------43SSekIVF7YlJuJrXo3fODo5"
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------43SSekIVF7YlJuJrXo3fODo5
Content-Type: multipart/mixed; boundary="------------VIinFj99D4NHO6527UH5I0v6";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Paul Cercueil <paul@crapouillou.net>
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org
Message-ID: <4a21f548-d081-2298-02ec-fbdc5db859c2@suse.de>
Subject: Re: [PATCH] drm/cma-helper: Release non-coherent memory with
 dma_free_noncoherent()
References: <20210708175146.10618-1-tzimmermann@suse.de>
 <36f8fdd6-13dc-7a68-6365-ab2152337c33@suse.de>
 <IJTG2R.XL24166ZB1AM2@crapouillou.net>
In-Reply-To: <IJTG2R.XL24166ZB1AM2@crapouillou.net>

--------------VIinFj99D4NHO6527UH5I0v6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgUGF1bA0KDQpBbSAxMi4xMS4yMSB1bSAxNjoyNiBzY2hyaWViIFBhdWwgQ2VyY3VlaWw6
DQo+IEhpIFRob21hcywNCj4gDQo+IEkgbmV2ZXIgcmVjZWl2ZWQgdGhlIG9yaWdpbmFsIHBh
dGNoIGFuZCBJIGNhbid0IGZpbmQgaXQgb25saW5lIGVpdGhlcj8NCg0KSXQgd2FzIHBvc3Rl
ZCBhIHdoaWxlIGFnbyBbMV0gYW5kIGdvdCBsb3N0LiBJIHJlbWVtYmVyIHRoYXQgeW91IGhh
ZCBhIA0KcHJvYmxlbSB3aXRoIHlvdXIgZW1haWwgc2V0dXAuIE1heWJlIHRoYXQncyB3aHkg
eW91IGRpZG4ndCBzZWUgaXQuDQoNCj4gDQo+IEFueXdheToNCj4gQWNrZWQtYnk6IFBhdWwg
Q2VyY3VlaWwgPHBhdWxAY3JhcG91aWxsb3UubmV0Pg0KDQpUaGFua3MgYSBsb3QuDQoNCkJl
c3QgcmVnYXJkcw0KVGhvbWFzDQoNClsxXSANCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2Ry
aS1kZXZlbC8yMDIxMDcwODE3NTE0Ni4xMDYxOC0xLXR6aW1tZXJtYW5uQHN1c2UuZGUvDQoN
Cj4gDQo+IENoZWVycywNCj4gLVBhdWwNCj4gDQo+IA0KPiBMZSB2ZW4uLCBub3YuIDEyIDIw
MjEgYXQgMTY6MDU6NDcgKzAxMDAsIFRob21hcyBaaW1tZXJtYW5uIA0KPiA8dHppbW1lcm1h
bm5Ac3VzZS5kZT4gYSDDqWNyaXQgOg0KPj4gUGluZyBmb3IgcmV2aWV3Lg0KPj4NCj4+IEFt
IDA4LjA3LjIxIHVtIDE5OjUxIHNjaHJpZWIgVGhvbWFzIFppbW1lcm1hbm46DQo+Pj4gVGhl
IEdFTSBDTUEgaGVscGVycyBhbGxvY2F0ZSBub24tY29oZXJlbnQgKGkuZS4sIGNhY2hlZCkg
YmFja2luZyBzdG9yYWdlDQo+Pj4gd2l0aCBkbWFfYWxsb2Nfbm9uY29oZXJlbnQoKSwgYnV0
IHJlbGVhc2UgaXQgd2l0aCBkbWFfZnJlZV93YygpLiBGaXggDQo+Pj4gdGhpcw0KPj4+IHdp
dGggYSBjYWxsIHRvIGRtYV9mcmVlX25vbmNvaGVyZW50KCkuIFdyaXRlY29tYmluaW5nIHN0
b3JhZ2UgaXMgc3RpbGwNCj4+PiByZWxlYXNlZCB3aXRoIGRtYV9mcmVlX3djKCkuDQo+Pj4N
Cj4+PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3Vz
ZS5kZT4NCj4+PiBGaXhlczogY2Y4Y2NiYzcyZDYxICgiZHJtOiBBZGQgc3VwcG9ydCBmb3Ig
R0VNIGJ1ZmZlcnMgYmFja2VkIGJ5IA0KPj4+IG5vbi1jb2hlcmVudCBtZW1vcnkiKQ0KPj4+
IENjOiBQYXVsIENlcmN1ZWlsIDxwYXVsQGNyYXBvdWlsbG91Lm5ldD4NCj4+PiBDYzogTWFh
cnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4NCj4+
PiBDYzogTWF4aW1lIFJpcGFyZCA8bXJpcGFyZEBrZXJuZWwub3JnPg0KPj4+IENjOiBEYXZp
ZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+DQo+Pj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRh
bmllbEBmZndsbC5jaD4NCj4+PiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
Zw0KPj4+IC0tLQ0KPj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX2NtYV9oZWxwZXIu
YyB8IDkgKysrKysrKy0tDQo+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkNCj4+Pg0KPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vZHJtX2dlbV9jbWFfaGVscGVyLmMgDQo+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dl
bV9jbWFfaGVscGVyLmMNCj4+PiBpbmRleCBkNTMzODgxOTlmMzQuLjlkMDU2NzQ1NTBhNCAx
MDA2NDQNCj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9jbWFfaGVscGVyLmMN
Cj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9jbWFfaGVscGVyLmMNCj4+PiBA
QCAtMjEwLDggKzIxMCwxMyBAQCB2b2lkIGRybV9nZW1fY21hX2ZyZWVfb2JqZWN0KHN0cnVj
dCANCj4+PiBkcm1fZ2VtX29iamVjdCAqZ2VtX29iaikNCj4+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBkbWFfYnVmX3Z1bm1hcChnZW1fb2JqLT5pbXBvcnRfYXR0YWNoLT5kbWFi
dWYsICZtYXApOw0KPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBkcm1fcHJpbWVfZ2VtX2Rlc3Ry
b3koZ2VtX29iaiwgY21hX29iai0+c2d0KTsNCj4+PiDCoMKgwqDCoMKgIH0gZWxzZSBpZiAo
Y21hX29iai0+dmFkZHIpIHsNCj4+PiAtwqDCoMKgwqDCoMKgwqAgZG1hX2ZyZWVfd2MoZ2Vt
X29iai0+ZGV2LT5kZXYsIGNtYV9vYmotPmJhc2Uuc2l6ZSwNCj4+PiAtwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGNtYV9vYmotPnZhZGRyLCBjbWFfb2JqLT5wYWRkcik7DQo+
Pj4gK8KgwqDCoMKgwqDCoMKgIGlmIChjbWFfb2JqLT5tYXBfbm9uY29oZXJlbnQpDQo+Pj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZG1hX2ZyZWVfbm9uY29oZXJlbnQoZ2VtX29iai0+
ZGV2LT5kZXYsIGNtYV9vYmotPmJhc2Uuc2l6ZSwNCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNtYV9vYmotPnZhZGRyLCBjbWFfb2Jq
LT5wYWRkciwNCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIERNQV9UT19ERVZJQ0UpOw0KPj4+ICvCoMKgwqDCoMKgwqDCoCBlbHNlDQo+
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZG1hX2ZyZWVfd2MoZ2VtX29iai0+ZGV2LT5k
ZXYsIGNtYV9vYmotPmJhc2Uuc2l6ZSwNCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgY21hX29iai0+dmFkZHIsIGNtYV9vYmotPnBhZGRyKTsNCj4+PiDC
oMKgwqDCoMKgIH0NCj4+Pg0KPj4+IMKgwqDCoMKgwqAgZHJtX2dlbV9vYmplY3RfcmVsZWFz
ZShnZW1fb2JqKTsNCj4+Pg0KPj4NCj4+IC0tIA0KPj4gVGhvbWFzIFppbW1lcm1hbm4NCj4+
IEdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINCj4+IFNVU0UgU29mdHdhcmUgU29sdXRpb25z
IEdlcm1hbnkgR21iSA0KPj4gTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJt
YW55DQo+PiAoSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQo+PiBHZXNjaMOkZnRzZsO8aHJl
cjogSXZvIFRvdGV2DQo+IA0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhp
Y3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBH
bWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4
MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------VIinFj99D4NHO6527UH5I0v6--

--------------43SSekIVF7YlJuJrXo3fODo5
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmGOiigFAwAAAAAACgkQlh/E3EQov+DK
CxAAuq1i8lJOvpacHVc7ZVm5c1A/0PfgtSXeXa8Zd2YvwcdfCvLbyCcKIhfUZqFfU0DmRQfF7fic
YghRQeNGtLgR319DgVi6Myl0F5afHM9gRYJBxQ7QAJYBNhEP0f+cbptNkCSOmj78X+DSubxgWW3Y
d98Ls2+0X3kbO/hRpZ4lVmCT90y4ovMJT40x7rwu5sIxuQ3TMQrPVgupwn8HZwKdCIz/EwTJY037
R0Hs78zfYH+Y2gzqhRO+hoZdy0eOHLmy6YxKqPhU1TWONXn/TPRStjtDyTb3EvvzO24+FZoNYGyq
CXTtYdisY/I1QmgMLqmifCh/kEcljwk+SBAC6JjYtLNYK94jJbrSj81qtCwySnYh4LRh1biiLkYt
CGBbdx9SU+zMYz4C7UwjknO02RlduTgE36RTrpg8bcWNLpk4ZrNVJ+Gb1KMYNL2z0S4WC1ygtAss
0G7Wl3LyOMxcxtM/K97b5epoH9cANhGiJIGYPtaL7VAkvnS4by4FX8h2Hlla1N2y0vkVJoqpKj/Z
PSrs8WiG7bODyR9vBVY0ZiAx6MOD3kjIsFHkZAw7XEdu4fY1+iO9cEUVLlmaI8txV5eQJODTsp2a
1O9xCg6OUbaF8x+xByYI3iaBQK+aQ4LECbqRra3TzeXiAcqVGARwmnPwe2sou5Pc6WzZcJqj8Fii
Pvc=
=rbl+
-----END PGP SIGNATURE-----

--------------43SSekIVF7YlJuJrXo3fODo5--
