Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A68FE56D557
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 09:07:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D65198CF4B;
	Mon, 11 Jul 2022 07:07:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2ABA8CF4B
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 07:07:12 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4F37C20075;
 Mon, 11 Jul 2022 07:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1657523231; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5zUABuTBA2Q0LbnDJSIgzb3gJ2tdCAWK3WxEipWWv9o=;
 b=Tf6JRpsBPeYlAkqfNzyvY6/TjLE8jJQuo2Xa2rVurHn1cioRnpbJpYh3C/ULavFDsQfgWH
 SlHTlxcSSX1u/a0Id9oFBATD9VePHmFZBAtV2uieDN6RYaQDbC4/I1ddoM0nvJXACn/kiK
 u1xSWcznT/fspQ4/gQsXyHe8dgXRPkA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1657523231;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5zUABuTBA2Q0LbnDJSIgzb3gJ2tdCAWK3WxEipWWv9o=;
 b=TCpGAJtB/1zSG6U5HgArxovFbfmpoqYgaSYl0krV336PBrguoxHcS+NaoY38x/8PP4+wsJ
 ZRe2dDewVFXgw+CQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2DB8313524;
 Mon, 11 Jul 2022 07:07:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ctozCh/My2JVAQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 11 Jul 2022 07:07:11 +0000
Message-ID: <084fed74-d67a-c25a-9178-bdc944bba073@suse.de>
Date: Mon, 11 Jul 2022 09:07:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: drm-tip amdgpu not compiling, possible fix attached
Content-Language: en-US
To: Hans de Goede <hdegoede@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <0f6dcf69-9709-047c-9a06-bb3b3c507fad@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <0f6dcf69-9709-047c-9a06-bb3b3c507fad@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------u8wfTMNTTTwNUuiTsLUp3DZS"
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
--------------u8wfTMNTTTwNUuiTsLUp3DZS
Content-Type: multipart/mixed; boundary="------------neHABm30ccTijrBKDexQ5R8V";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Hans de Goede <hdegoede@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Message-ID: <084fed74-d67a-c25a-9178-bdc944bba073@suse.de>
Subject: Re: drm-tip amdgpu not compiling, possible fix attached
References: <0f6dcf69-9709-047c-9a06-bb3b3c507fad@redhat.com>
In-Reply-To: <0f6dcf69-9709-047c-9a06-bb3b3c507fad@redhat.com>

--------------neHABm30ccTijrBKDexQ5R8V
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTAuMDcuMjIgdW0gMjI6MDEgc2NocmllYiBIYW5zIGRlIEdvZWRlOg0KPiBI
aSBBbGwsDQo+IA0KPiBJJ3ZlIGJlZW4gcmViYXNpbmcgbXkgYmFja2xpZ2h0IHJlZmFjdG9y
IG9uIHRvcCBvZiBkcm0tdGlwIHRvIHN1Ym1pdA0KPiBhIG5ldyB2ZXJzaW9uIHVwc3RyZWFt
IGFuZCBJIG5vdGljZWQgdGhhdCBkcm0tdGlwIGRvZXMgbm90IGNvbXBpbGUuDQo+IA0KPiBU
aGlzIGlzIGNhdXNlZCBieSBhIG1pc21lcmdlIG9mOg0KPiANCj4gY29tbWl0IDkyNWI2ZTU5
MTM4Y2VmYTQ3Mjc1YzY3ODkxYzY1ZDQ4ZDMyNjZkNTcgKGRybS1taXNjL2Zvci1saW51eC1u
ZXh0LWZpeGVzLCBkcm0tbWlzYy9kcm0tbWlzYy1maXhlcywgZHJtLW1pc2MtZml4ZXMpU2Vs
dmFtIDxBcnVucHJhdmluLlBhbmVlclNlbHZhbUBhbWQuY29tPg0KPiBEYXRlOiAgIEZyaSBK
dWwgOCAwMjozMDo0NyAyMDIyIC0wNzAwDQo+ICAgICAgUmV2ZXJ0ICJkcm0vYW1kZ3B1OiBh
ZGQgZHJtIGJ1ZGR5IHN1cHBvcnQgdG8gYW1kZ3B1Ig0KPiAgICAgIA0KPiAgICAgIFRoaXMg
cmV2ZXJ0cyBjb21taXQgYzljYWQ5MzdjMGM1ODYxOGZlNWIwMzEwZmQ1MzlhODU0ZGMxYWU5
NS4NCj4gICAgICANCj4gICAgICBUaGlzIGlzIHBhcnQgb2YgYSByZXZlcnQgb2YgdGhlIGZv
bGxvd2luZyBjb21taXRzOg0KPiAgICAgIGNvbW1pdCA3MDhkMTlkOWYzNjIgKCJkcm0vYW1k
Z3B1OiBtb3ZlIGludGVybmFsIHZyYW1fbWdyIGZ1bmN0aW9uIGludG8gdGhlIEMgZmlsZSIp
DQo+ICAgICAgY29tbWl0IDVlM2YxZTc3MjllYyAoImRybS9hbWRncHU6IGZpeCBzdGFydCBj
YWxjdWxhdGlvbiBpbiBhbWRncHVfdnJhbV9tZ3JfbmV3IikNCj4gICAgICBjb21taXQgYzlj
YWQ5MzdjMGM1ICgiZHJtL2FtZGdwdTogYWRkIGRybSBidWRkeSBzdXBwb3J0IHRvIGFtZGdw
dSIpDQo+ICAgICAgDQo+ICAgICAgW1dIWV0NCj4gICAgICBGZXcgdXNlcnMgcmVwb3J0ZWQg
Z2FyYmFnZWQgZ3JhcGhpY3MgYXMgc29vbiBhcyB4IHN0YXJ0cywNCj4gICAgICByZXZlcnRp
bmcgdW50aWwgdGhpcyBjYW4gYmUgcmVzb2x2ZWQuDQo+ICAgICAgDQo+ICAgICAgU2lnbmVk
LW9mZi1ieTogQXJ1bnByYXZpbiBQYW5lZXIgU2VsdmFtIDxBcnVucHJhdmluLlBhbmVlclNl
bHZhbUBhbWQuY29tPg0KPiANCj4gIEZyb20gZHJtLW1pc2MvZm9yLWxpbnV4LW5leHQtZml4
ZXMgLyBkcm0tbWlzYy1maXhlcw0KPiANCj4gVGhlIGF0dGFjaGVkIHBhdGNoIG9uIHRvcCBv
ZiBkcm0tdGlwIGZpeGVzIHRoZSBtaXNtZXJnZS4gTm90ZSBjb21waWxlLXRlc3RlZA0KPiBv
bmx5IQ0KDQpUaGFuayB5b3UgZm9yIHRoZSB3b3JrYXJvdW5kLiBJIHJhbiBpbnRvIHRoZSBz
YW1lIHByb2JsZW0geWVzdGVyZGF5IA0KYWZ0ZXIgc3luY2hyb25pemluZyB3aXRoIGRybS10
aXAuIGFtZGdwdSBkb2Vzbid0IGJ1aWxkIG9uIGRybS10aXAuDQoNCkJlc3QgcmVnYXJkcw0K
VGhvbWFzDQoNCj4gDQo+IElmIHNvbWVvbmUgd2l0aCBtb3JlIHJlcmVyZSBleHBlcmllbmNl
IHRoZW4gbWUgY2FuIHVzZSB0aGlzIHRvIGZpeCB0aGluZ3MgdGhhdA0KPiB3b3VsZCBiZSBn
cmVhdC4NCj4gDQo+IFJlZ2FyZHMsDQo+IA0KPiBIYW5zDQoNCi0tIA0KVGhvbWFzIFppbW1l
cm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRp
b25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJt
YW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZv
IFRvdGV2DQo=

--------------neHABm30ccTijrBKDexQ5R8V--

--------------u8wfTMNTTTwNUuiTsLUp3DZS
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmLLzB4FAwAAAAAACgkQlh/E3EQov+AK
nhAAyh0QOy3v0hGuinvYsfQXiE4Rp0eEkV5T+SV589VRrSW4EZeMkMr/grL+uGcGcr5eV/rQr5WP
Y6NVwAsq5p2sevht611iqKHdVjd3qlKnHtWioaABhI/5ovvitP4z3eraTFcjWx4hSWqRkImG1VwP
t1i4DkEzeMTpTYdg0959wp+Xn1V3oV2Zg0jk5ZN8XkM3Rd/FE6ha0GkYtEDAjLXba5pa4JWaC8Yy
vQtGJCLQSjlJXDeZ7haMrHo8jKxtj7IOqSyK5QdO/rtIeElzatE66iTvmVSGTVmI7Rb2iCSJwAyc
snjkNuNmvrPJV6sutNXl9OQx847X6nC5fh3O6crACyIqYYkhoa5D3tWOnudHZArWgjiikxZQO1+/
e8AvB4foAtMVbmnvlts9kw9dwnFcYscHj9posrZ9Mjqv/VbeM+3jXvHVFFhd6OzsA6tNI/Ol8mBH
5lztZ4H0ciXhhsP9hBjbOV5Fv7o32MN63jpbxxNHEXXJVtea49KWYVCdtDXMZ0dmmvBMoWUmGJUV
uqNX2r4WimFQq6KW8TqBP/5aruu1gjOY0TQkH79XNNKFRFwME/09I/MlRzTz3WarOb+phHtv4ONw
WQwPz2uDw85iekX32623K98BuFDLw/CRFanDHNYbzoQZjXcRVR5kaC9oyqLQvdkquruvBXoMjOKx
Y94=
=tROD
-----END PGP SIGNATURE-----

--------------u8wfTMNTTTwNUuiTsLUp3DZS--
