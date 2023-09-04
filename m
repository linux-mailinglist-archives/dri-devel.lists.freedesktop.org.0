Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAF4791288
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 09:48:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6229110E2BE;
	Mon,  4 Sep 2023 07:48:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 896A910E2BE
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 07:48:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B24601F88F;
 Mon,  4 Sep 2023 07:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1693813710; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GuiFZRHRNFnWNdo5ljZLPkidflkGrg/cSdTKGA38BNU=;
 b=Y20ASZp4oGGr+VL9f17Quc5ssG1/P9LdBfwv1NT/kwssXdXguMf9CMB8TQpRZL6c4eIFjC
 EcOB94yM/DJjuGWPqDNd57pXp2G9J0emQXAmAqk+bYdhAhjTmoFuhx2lK8kbTlzp0iIjSh
 +QuDl/MBnYM15X1z9DakRIprj/Et0HE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1693813710;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=GuiFZRHRNFnWNdo5ljZLPkidflkGrg/cSdTKGA38BNU=;
 b=Td3yFXLxsEe24627gy3NWq+xR3WjGRtK8Lt3brMtcHML8HQNAljUpSAaxFiOrxnyGr/Odw
 x6s7JdWcWMYvhqBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 826D813425;
 Mon,  4 Sep 2023 07:48:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id chfJHs6L9WSmRgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 04 Sep 2023 07:48:30 +0000
Message-ID: <7efa674b-8934-4f6d-84fe-56d3577de396@suse.de>
Date: Mon, 4 Sep 2023 09:48:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2] drm: gm12u320: Fix the timeout usage for usb_bulk_msg()
Content-Language: en-US
To: Hans de Goede <hdegoede@redhat.com>, Jinjie Ruan <ruanjinjie@huawei.com>, 
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?=
 <noralf@tronnes.org>
References: <20230904021421.1663892-1-ruanjinjie@huawei.com>
 <6614854c-7408-362e-32fe-d1532a065361@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <6614854c-7408-362e-32fe-d1532a065361@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------IWtV9IKboc29NPjyMDPRgttx"
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
--------------IWtV9IKboc29NPjyMDPRgttx
Content-Type: multipart/mixed; boundary="------------7BIx9OcvXicl6haoSv8NYULA";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Hans de Goede <hdegoede@redhat.com>, Jinjie Ruan <ruanjinjie@huawei.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?=
 <noralf@tronnes.org>
Message-ID: <7efa674b-8934-4f6d-84fe-56d3577de396@suse.de>
Subject: Re: [PATCH v2] drm: gm12u320: Fix the timeout usage for
 usb_bulk_msg()
References: <20230904021421.1663892-1-ruanjinjie@huawei.com>
 <6614854c-7408-362e-32fe-d1532a065361@redhat.com>
In-Reply-To: <6614854c-7408-362e-32fe-d1532a065361@redhat.com>

--------------7BIx9OcvXicl6haoSv8NYULA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDQuMDkuMjMgdW0gMDk6MjYgc2NocmllYiBIYW5zIGRlIEdvZWRlOg0KPiBI
aSwNCj4gDQo+IE9uIDkvNC8yMyAwNDoxNCwgSmluamllIFJ1YW4gd3JvdGU6DQo+PiBUaGUg
dGltZW91dCBhcmcgb2YgdXNiX2J1bGtfbXNnKCkgaXMgbXMgYWxyZWFkeSwgd2hpY2ggaGFz
IGJlZW4gY29udmVydGVkDQo+PiB0byBqaWZmaWVzIGJ5IG1zZWNzX3RvX2ppZmZpZXMoKSBp
biB1c2Jfc3RhcnRfd2FpdF91cmIoKS4gU28gZml4IHRoZSB1c2FnZQ0KPj4gYnkgcmVtb3Zp
bmcgdGhlIHJlZHVuZGFudCBtc2Vjc190b19qaWZmaWVzKCkgaW4gdGhlIG1hY3Jvcy4NCj4+
DQo+PiBBbmQgYXMgSGFucyBzdWdnZXN0ZWQsIGFsc28gcmVtb3ZlIG1zZWNzX3RvX2ppZmZp
ZXMoKSBmb3IgdGhlIElETEVfVElNRU9VVA0KPj4gbWFjcm8gdG8gbWFrZSBpdCBjb25zaXN0
ZW50IGhlcmUgYW5kIHNvIGNoYW5nZSBJRExFX1RJTUVPVVQgdG8NCj4+IG1zZWNzX3RvX2pp
ZmZpZXMoSURMRV9USU1FT1VUKSB3aGVyZSBpdCBpcyB1c2VkLg0KPj4NCj4+IEZpeGVzOiBl
NGY4NmU0MzcxNjQgKCJkcm06IEFkZCBHcmFpbiBNZWRpYSBHTTEyVTMyMCBkcml2ZXIgdjIi
KQ0KPj4gU2lnbmVkLW9mZi1ieTogSmluamllIFJ1YW4gPHJ1YW5qaW5qaWVAaHVhd2VpLmNv
bT4NCj4+IFN1Z2dlc3RlZC1ieTogSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNv
bT4NCj4+IC0tLQ0KPj4gdjI6DQo+PiAtIFJlbW92ZSB0aGUgbXNlY3NfdG9famlmZmllcygp
IGFsc28gZm9yIElETEVfVElNRU9VVC4NCj4+IC0gVXBkYXRlIHRoZSBmaXggdGFnLg0KPj4g
LSBVcGRhdGUgdGhlIGNvbW1pdCBtZXNzYWdlLg0KPiANCj4gVGhhbmtzLCBwYXRjaCBsb29r
cyBnb29kIHRvIG1lOg0KPiANCj4gUmV2aWV3ZWQtYnk6IEhhbnMgZGUgR29lZGUgPGhkZWdv
ZWRlQHJlZGhhdC5jb20+DQo+IA0KPiBOb3RlIEkgZG9uJ3QgZ2F2ZSB0aW1lIHRvIG1lcmdl
IHRoaXMgbXlzZWxmIGF0bS4NCj4gDQo+IElmIG9uZSBvZiB0aGUgZHJtLW1pc2MgbWFpbnRh
aW5lcnMgY2FuIHBpY2sgdGhpcyB1cCB0aGF0IHdvdWxkDQo+IGJlIGdyZWF0Lg0KDQpJJ2xs
IHRha2UgY2FyZSBvZiBpdC4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gUmVn
YXJkcywNCj4gDQo+IEhhbnMNCj4gDQo+IA0KPiANCj4+IC0tLQ0KPj4gICBkcml2ZXJzL2dw
dS9kcm0vdGlueS9nbTEydTMyMC5jIHwgMTAgKysrKystLS0tLQ0KPj4gICAxIGZpbGUgY2hh
bmdlZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vdGlueS9nbTEydTMyMC5jIGIvZHJpdmVycy9ncHUvZHJt
L3RpbnkvZ20xMnUzMjAuYw0KPj4gaW5kZXggYzViYjY4M2U0NDBjLi4wMTg3NTM5ZmY1ZWEg
MTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdGlueS9nbTEydTMyMC5jDQo+PiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vdGlueS9nbTEydTMyMC5jDQo+PiBAQCAtNzAsMTAgKzcw
LDEwIEBAIE1PRFVMRV9QQVJNX0RFU0MoZWNvX21vZGUsICJUdXJuIG9uIEVjbyBtb2RlIChs
ZXNzIGJyaWdodCwgbW9yZSBzaWxlbnQpIik7DQo+PiAgICNkZWZpbmUgUkVBRF9TVEFUVVNf
U0laRQkJMTMNCj4+ICAgI2RlZmluZSBNSVNDX1ZBTFVFX1NJWkUJCQk0DQo+PiAgIA0KPj4g
LSNkZWZpbmUgQ01EX1RJTUVPVVQJCQltc2Vjc190b19qaWZmaWVzKDIwMCkNCj4+IC0jZGVm
aW5lIERBVEFfVElNRU9VVAkJCW1zZWNzX3RvX2ppZmZpZXMoMTAwMCkNCj4+IC0jZGVmaW5l
IElETEVfVElNRU9VVAkJCW1zZWNzX3RvX2ppZmZpZXMoMjAwMCkNCj4+IC0jZGVmaW5lIEZJ
UlNUX0ZSQU1FX1RJTUVPVVQJCW1zZWNzX3RvX2ppZmZpZXMoMjAwMCkNCj4+ICsjZGVmaW5l
IENNRF9USU1FT1VUCQkJMjAwDQo+PiArI2RlZmluZSBEQVRBX1RJTUVPVVQJCQkxMDAwDQo+
PiArI2RlZmluZSBJRExFX1RJTUVPVVQJCQkyMDAwDQo+PiArI2RlZmluZSBGSVJTVF9GUkFN
RV9USU1FT1VUCQkyMDAwDQo+PiAgIA0KPj4gICAjZGVmaW5lIE1JU0NfUkVRX0dFVF9TRVRf
RUNPX0EJCTB4ZmYNCj4+ICAgI2RlZmluZSBNSVNDX1JFUV9HRVRfU0VUX0VDT19CCQkweDM1
DQo+PiBAQCAtMzg5LDcgKzM4OSw3IEBAIHN0YXRpYyB2b2lkIGdtMTJ1MzIwX2ZiX3VwZGF0
ZV93b3JrKHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykNCj4+ICAgCSAqIHN3aXRjaGVzIGJh
Y2sgdG8gc2hvd2luZyBpdHMgbG9nby4NCj4+ICAgCSAqLw0KPj4gICAJcXVldWVfZGVsYXll
ZF93b3JrKHN5c3RlbV9sb25nX3dxLCAmZ20xMnUzMjAtPmZiX3VwZGF0ZS53b3JrLA0KPj4g
LQkJCSAgIElETEVfVElNRU9VVCk7DQo+PiArCQkJICAgbXNlY3NfdG9famlmZmllcyhJRExF
X1RJTUVPVVQpKTsNCj4+ICAgDQo+PiAgIAlyZXR1cm47DQo+PiAgIGVycjoNCj4gDQoNCi0t
IA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0Ug
U29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5
MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywg
QW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5i
ZXJnKQ0K

--------------7BIx9OcvXicl6haoSv8NYULA--

--------------IWtV9IKboc29NPjyMDPRgttx
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmT1i80FAwAAAAAACgkQlh/E3EQov+CG
UQ/+J2+UfTuQpTVySDI4wX+kz8Uy64Vygo8QhVrZERi3qODBLDjPwB5OGogBvxgeGLYBymPj0ccN
6aVR+qRooaBMQAEW4HsG1TFx9PRPT9nIm6yU+CklIGi//vHacXqNWqAFdBPZRiIRcojk1hDy5GA5
Bb4HfkFZDq+5Vum3fcoRPF+ZpVbpPKMYTJlHlkqG6bkoMeVU4o/pAJCi6xmGx1C4Rto75yMHq5OW
9bJbPQwOISNSF8pYcv8VNU/QmPYskCRSopOt2+fp4VNDkYxoNehn+/h9uQJTfMcOmUTs+rPv00+D
V5tT8ZH0n48IQghYg2cOkb6AtubSp3KTsZ8M9O5iY+CqzJ1QS83JOvLYNJf4YFVv/xWXuP7jJRxZ
SX443mlanjiS2iMDpycUVzfjs+vAA2oorH3ga1ecB3BuL6CfzohrkbKGQFLoEjMBG/jMP4SOR7yL
Qkcz3JRWxCdGXQgRbyWe2Nc4aeY7JKXB8XoOYVXxlbiTS2cDbiAPyeVzCyoWl6+ou8FTbqd6SQoP
LYgpD7why+Iwfcf4vBMx9drVob+l81bRatAe2SQHRNm4JcjrPA2lR1mj/hI3wiCQf8pM4mSguJSk
3dW7C64dApC2v/rRgo0w3fHnmUZpGSZR4n2HrQ2GAN9fiILXEWRiNCq2GWPs6oifzTQ8zRvX4SSu
uHc=
=tEih
-----END PGP SIGNATURE-----

--------------IWtV9IKboc29NPjyMDPRgttx--
