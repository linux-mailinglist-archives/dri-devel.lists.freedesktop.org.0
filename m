Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F0175E9A4E
	for <lists+dri-devel@lfdr.de>; Mon, 26 Sep 2022 09:16:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A60D10E588;
	Mon, 26 Sep 2022 07:16:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BA5E10E588
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Sep 2022 07:16:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 6EE3D2207D;
 Mon, 26 Sep 2022 07:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1664176595; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aDaSeZOalg/TV75KOdP7/kRZIqJIknJQXrhiYBILmJQ=;
 b=i9c4iozXofASG7biA+DE/aBYGzeHtoAmTD6bcZXLFz8xYW99BPaVyOMXVUvDr+bknia5Te
 wHw36GzpW+o3xkTimvHAhHLtYmhJD8TDAJUnGrc9lqZTlMzaP7XCNQgeNVjkzBEfIswl0X
 X+l8GYnkTo9quj1jIyRv989v51522C8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1664176595;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aDaSeZOalg/TV75KOdP7/kRZIqJIknJQXrhiYBILmJQ=;
 b=JP1YevKVOdgwri6oEETb8QTROF5aAUTNbp1+/qMFnSp+B/osbpDyQFXNo1pKpLnxsGjA8j
 vxrtD0ERUZBH4rDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4E7CE139BD;
 Mon, 26 Sep 2022 07:16:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ItQ7EtNRMWOXMwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 26 Sep 2022 07:16:35 +0000
Message-ID: <c6d0fb6f-6fc3-3123-ee7c-7edac211dbf3@suse.de>
Date: Mon, 26 Sep 2022 09:16:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH -next] drm/ast: make ast_modeset static
Content-Language: en-US
To: ruanjinjie <ruanjinjie@huawei.com>, airlied@redhat.com, airlied@linux.ie, 
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20220926023253.739699-1-ruanjinjie@huawei.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220926023253.739699-1-ruanjinjie@huawei.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------fNZSebB0BLXw1k7etBjVdJbv"
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
--------------fNZSebB0BLXw1k7etBjVdJbv
Content-Type: multipart/mixed; boundary="------------KIwDWSruBahZeHd0Gu0SzOlq";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: ruanjinjie <ruanjinjie@huawei.com>, airlied@redhat.com, airlied@linux.ie,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Message-ID: <c6d0fb6f-6fc3-3123-ee7c-7edac211dbf3@suse.de>
Subject: Re: [PATCH -next] drm/ast: make ast_modeset static
References: <20220926023253.739699-1-ruanjinjie@huawei.com>
In-Reply-To: <20220926023253.739699-1-ruanjinjie@huawei.com>

--------------KIwDWSruBahZeHd0Gu0SzOlq
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjYuMDkuMjIgdW0gMDQ6MzIgc2NocmllYiBydWFuamluamllOg0KPiBUaGUg
c3ltYm9sIGlzIG5vdCB1c2VkIG91dHNpZGUgb2YgdGhlIGZpbGUsIHNvIG1hcmsgaXQgc3Rh
dGljLg0KPiANCj4gRml4ZXMgdGhlIGZvbGxvd2luZyB3YXJuaW5nOg0KPiANCj4gZHJpdmVy
cy9ncHUvZHJtL2FzdC9hc3RfZHJ2LmM6NDI6NTogd2FybmluZzogc3ltYm9sICdhc3RfbW9k
ZXNldCcNCj4gd2FzIG5vdCBkZWNsYXJlZC4gU2hvdWxkIGl0IGJlIHN0YXRpYz8NCj4gDQo+
IFNpZ25lZC1vZmYtYnk6IHJ1YW5qaW5qaWUgPHJ1YW5qaW5qaWVAaHVhd2VpLmNvbT4NCg0K
VGhhbmsgeW91LiBBZGRlZCB0byBkcm0tbWlzYy1uZXh0Lg0KDQpCZXN0IHJlZ2FyZHMNClRo
b21hcw0KDQo+IC0tLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X2Rydi5jIHwgMiAr
LQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X2Rydi5jIGIvZHJp
dmVycy9ncHUvZHJtL2FzdC9hc3RfZHJ2LmMNCj4gaW5kZXggNzYwYjI3OTcxNTU3Li5iOTM5
MmYzMWU2MjkgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X2Rydi5j
DQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hc3QvYXN0X2Rydi5jDQo+IEBAIC0zOSw3ICsz
OSw3IEBADQo+ICAgDQo+ICAgI2luY2x1ZGUgImFzdF9kcnYuaCINCj4gICANCj4gLWludCBh
c3RfbW9kZXNldCA9IC0xOw0KPiArc3RhdGljIGludCBhc3RfbW9kZXNldCA9IC0xOw0KPiAg
IA0KPiAgIE1PRFVMRV9QQVJNX0RFU0MobW9kZXNldCwgIkRpc2FibGUvRW5hYmxlIG1vZGVz
ZXR0aW5nIik7DQo+ICAgbW9kdWxlX3BhcmFtX25hbWVkKG1vZGVzZXQsIGFzdF9tb2Rlc2V0
LCBpbnQsIDA0MDApOw0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2
ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1h
eGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcg
TsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------KIwDWSruBahZeHd0Gu0SzOlq--

--------------fNZSebB0BLXw1k7etBjVdJbv
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMxUdIFAwAAAAAACgkQlh/E3EQov+CG
7BAAg9CzSxw9ykvbHcJ+o8/xVv+Khyv5NwxaFcfxBBcBYunnqyHLu7FGO7v2D/6vQX6AgLlV1Jc8
Q6OAw0hOlNYHqEdvQkFnEi39UkeeLXJj8WwJIjhOh+ZtDjOdxI/C6FeLlAwWBzFxlPemRTEpJGaw
ADWn+R6Oh/Hb17EG7ij+/yl/mqUFvqb59WgbgbuizAj1HMeDrV2STVVxYRg1S+uxBRLgNUoKLIKJ
Y2JnzNwa4P11TfaLohwR0R2MI+6GUgzJtUKnhGYaqldce0RriQRCHdVFAwEAUkQU3MSrDEqfzUNW
Si7m2Px1VCDIYvTPQzn1frx9MecE6xLnooJnMMAAaatOP+kZ/aPrzXeAhtLr5dPUQmbcBwsEDl5u
XNjHRoN54mZJwNL3Tjt9VA7fHn9nC7uQ1Hxbom4XPOZM/6wcgGzpCMmCdnrw6GWM5mM9wlO0qiWh
Hidfx5jwFLxDkms0TdA/zUWVkHr8hsuVp7IIqUnLS8fmMFN3veWQBZ8/M45txD6eWNGst0IlXHtm
pf4znJ/v8cPd6jKKGqDNKIWq0N2e+14JfQLSzRNqYJ4Jq7/wXl2cb2LZCheR42JoBLQSXuo8ISLG
rBET5c/MXCUpFIdRIjqTtWm6ENFuX/EUDIA3jNxcb3ctYCKjrdQ+xMI2uL+oZwfMEfkRcoMR9ViU
Sf0=
=UDOc
-----END PGP SIGNATURE-----

--------------fNZSebB0BLXw1k7etBjVdJbv--
