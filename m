Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B40649C64E
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 10:29:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C41A110E7D6;
	Wed, 26 Jan 2022 09:29:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4404410E7D6
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jan 2022 09:29:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DB78A1F393;
 Wed, 26 Jan 2022 09:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1643189372; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oZeU4OrDXuPpSxtI7HLA+OunMYbAnExjCYvzbfGyI9A=;
 b=nwCEBLV7SBb+1/YM7ET3uARAMDPK2VqhoReR+Q2qNjUjaiR73zQ3laM7mJFBg30iO5+sdv
 DKtPxHz/z3b5fsIThuAIgbHv6vpMgPBa0XidtmIfZzPHhuiwFh5ZUA8PZdpGY+BlC7RaG/
 oRa6rzKTBaHbaehj7Wt/MQQb3nCbEuU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1643189372;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oZeU4OrDXuPpSxtI7HLA+OunMYbAnExjCYvzbfGyI9A=;
 b=KLldP9fR7tYXLTcD0pNgsCdYea+FH5WPRk9U6U0XgKCOnAK1Y/TjFXo8jzYqnBio2s45Tp
 agTXta0hiHRt0+Aw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B82AD13B2B;
 Wed, 26 Jan 2022 09:29:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id jC7lK3wU8WGfSgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 26 Jan 2022 09:29:32 +0000
Message-ID: <d27bfd8a-a6af-475b-72f7-0ef8b770c82e@suse.de>
Date: Wed, 26 Jan 2022 10:29:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] Revert "drm/ast: Support 1600x900 with 108MHz PCLK"
Content-Language: en-US
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20220120040527.552068-1-airlied@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220120040527.552068-1-airlied@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------TL7NtcBuGYR4t9X8nX9stV8C"
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
--------------TL7NtcBuGYR4t9X8nX9stV8C
Content-Type: multipart/mixed; boundary="------------F6cTYKSgs1rugL0pqgswv7iA";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
Message-ID: <d27bfd8a-a6af-475b-72f7-0ef8b770c82e@suse.de>
Subject: Re: [PATCH] Revert "drm/ast: Support 1600x900 with 108MHz PCLK"
References: <20220120040527.552068-1-airlied@gmail.com>
In-Reply-To: <20220120040527.552068-1-airlied@gmail.com>

--------------F6cTYKSgs1rugL0pqgswv7iA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjAuMDEuMjIgdW0gMDU6MDUgc2NocmllYiBEYXZlIEFpcmxpZToNCj4gRnJv
bTogRGF2ZSBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4NCj4gDQo+IFRoaXMgcmV2ZXJ0
cyBjb21taXQgOWJiN2I2ODkyNzRiNjdlY2IzNjQxZTM5OWU3NmY4NGFkYzYyN2RmMS4NCj4g
DQo+IFRoaXMgY2F1c2VkIGEgcmVncmVzc2lvbiByZXBvcnRlZCB0byBSZWQgSGF0Lg0KPiAN
Cj4gRml4ZXM6IDliYjdiNjg5Mjc0YiAoImRybS9hc3Q6IFN1cHBvcnQgMTYwMHg5MDAgd2l0
aCAxMDhNSHogUENMSyIpDQo+IFNpZ25lZC1vZmYtYnk6IERhdmUgQWlybGllIDxhaXJsaWVk
QHJlZGhhdC5jb20+DQoNClRoYW5rcyBhIGxvdC4gTWVyZ2VkIGludG8gZHJtLW1pc2MtZml4
ZXMuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUv
ZHJtL2FzdC9hc3RfdGFibGVzLmggfCAyIC0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgZGVs
ZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3Rf
dGFibGVzLmggYi9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF90YWJsZXMuaA0KPiBpbmRleCBk
OWViMzUzYTRiZjAuLmRiZTFjYzYyMGY2ZSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FzdC9hc3RfdGFibGVzLmgNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3Rf
dGFibGVzLmgNCj4gQEAgLTI4Miw4ICsyODIsNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGFz
dF92Ymlvc19lbmh0YWJsZSByZXNfMTM2MHg3NjhbXSA9IHsNCj4gICB9Ow0KPiAgIA0KPiAg
IHN0YXRpYyBjb25zdCBzdHJ1Y3QgYXN0X3ZiaW9zX2VuaHRhYmxlIHJlc18xNjAweDkwMFtd
ID0gew0KPiAtCXsxODAwLCAxNjAwLCAyNCwgODAsIDEwMDAsICA5MDAsIDEsIDMsIFZDTEsx
MDgsCQkvKiA2MEh6ICovDQo+IC0JIChTeW5jUFAgfCBDaGFyeDhEb3QgfCBMaW5lQ29tcGFy
ZU9mZiB8IFdpZGVTY3JlZW5Nb2RlIHwgTmV3TW9kZUluZm8pLCA2MCwgMywgMHgzQSB9LA0K
PiAgIAl7MTc2MCwgMTYwMCwgNDgsIDMyLCA5MjYsIDkwMCwgMywgNSwgVkNMSzk3Xzc1LAkJ
LyogNjBIeiBDVlQgUkIgKi8NCj4gICAJIChTeW5jTlAgfCBDaGFyeDhEb3QgfCBMaW5lQ29t
cGFyZU9mZiB8IFdpZGVTY3JlZW5Nb2RlIHwgTmV3TW9kZUluZm8gfA0KPiAgIAkgIEFTVDI1
MDBQcmVDYXRjaENSVCksIDYwLCAxLCAweDNBIH0sDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1h
bm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25z
IEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55
DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRv
dGV2DQo=

--------------F6cTYKSgs1rugL0pqgswv7iA--

--------------TL7NtcBuGYR4t9X8nX9stV8C
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmHxFHwFAwAAAAAACgkQlh/E3EQov+A/
wA//Wys0OqLl4zHBy2Dow+Uouden4K6nTLtySiGlixTKoSqyWHQ2wz5v+/P59WtwQ3rOYrymsJmZ
IOSVu+Xjm0E8Z9qzqCB7QPMZmPKx0GtLMK95q3UOT8d/7YTTrfCc3mRuvXG/ZBARwXi8kAXgncUA
xxRbhsKeb396i5+rUou1PG5N2jWrej1/iYFd0pfeAzgAM3toleOv727WOkuCeFcgYS8uTopLROSw
S7PGfljve5yM9JRGQAfPNZT4ITmpL+hQcB0C9qPj2sdmoKfGfeNyoiIT3tLwsIDmc3z04Zxq6URH
u+QizsVbD5xiIsWSq+fAyJvJiUkF7ig+hLDBExQx36mHRGAeBxOP4t4ktj96jPz++Lh386saVjQq
fX77HAhtP80GB1mJMKczTQgKuafJ3JYZoNxsgJXE80043Qpkg4Xd1nORvtQmqlahkFvpvXhlZ+AV
DbA5aFcCfCUGjrcCXotCuxwaX+F5f644x1AnfioJ10A1GlyymtTVAdJBKudrn3c8xb927k0OROLg
QdhZy9Zxcc8RByBR++N1tYNic0dwUiTUouleD7UumwF0SIcw2BTF5FNJCjbDB5D8mx43rwaNFrBh
skMYX+7CbUBeZCkHLj0SEIiceAe8SZgD0SHDen2C+XrBj4Ci/3LdljBuBj//Ep47QRpGYRNRl04N
oL0=
=4bq/
-----END PGP SIGNATURE-----

--------------TL7NtcBuGYR4t9X8nX9stV8C--
