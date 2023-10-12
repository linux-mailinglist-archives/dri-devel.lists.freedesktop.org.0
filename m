Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF59A7C6616
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 09:03:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C52710E420;
	Thu, 12 Oct 2023 07:03:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FEE310E420
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 07:03:38 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E97CB1F88C;
 Thu, 12 Oct 2023 07:03:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1697094216; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=jfipsLBlldXS3b0wL9teou6htWpC7RrLrxdWIeGnSQc=;
 b=Wt26iF5ZuURJryCxwL8m+GwoMZxYy34n2XVThydvN5CvAeVToHYutzUoaicEUuAAFIvCi8
 gvk36jMjpvaGXkLRXqIJTbIpUa7eO2CgBIqRUXvaclDfpwepAXiQl2UMJ2N/lWrET6nZSI
 ug6U6X54Q/q31ZkgnWXNHocnTljtq9I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1697094216;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=jfipsLBlldXS3b0wL9teou6htWpC7RrLrxdWIeGnSQc=;
 b=cSWfljvULt57VLz8WCXaBBtSZQtXh8AerAnJOolFmlW0XkUAk7slx/w5oXxAR5iBlH40mM
 /5ZSqyVrBa85uFDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D3CF4139ED;
 Thu, 12 Oct 2023 07:03:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id n72IMkiaJ2UsHwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 12 Oct 2023 07:03:36 +0000
Message-ID: <60a006cd-cf2e-4e72-9c77-369f3476c81d@suse.de>
Date: Thu, 12 Oct 2023 09:03:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: DRM FB emulation initialisation leaving the display disabled
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
References: <CAPY8ntCFbHff-Ac1DjFJhj4ghZ1wjemnc6PoT_n7zbjoWG3+aA@mail.gmail.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <CAPY8ntCFbHff-Ac1DjFJhj4ghZ1wjemnc6PoT_n7zbjoWG3+aA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------yAnGGPNeNv00ZWVglCHfwC60"
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------yAnGGPNeNv00ZWVglCHfwC60
Content-Type: multipart/mixed; boundary="------------RtqHWv60olPVfBz64ZirUy9M";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: DRI Development <dri-devel@lists.freedesktop.org>
Message-ID: <60a006cd-cf2e-4e72-9c77-369f3476c81d@suse.de>
Subject: Re: DRM FB emulation initialisation leaving the display disabled
References: <CAPY8ntCFbHff-Ac1DjFJhj4ghZ1wjemnc6PoT_n7zbjoWG3+aA@mail.gmail.com>
In-Reply-To: <CAPY8ntCFbHff-Ac1DjFJhj4ghZ1wjemnc6PoT_n7zbjoWG3+aA@mail.gmail.com>

--------------RtqHWv60olPVfBz64ZirUy9M
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgRGF2ZQ0KDQpBbSAxMS4xMC4yMyB1bSAxNzo1MiBzY2hyaWViIERhdmUgU3RldmVuc29u
Og0KPiBIaSBUaG9tYXMgKGFuZCBldmVyeW9uZSBlbHNlKQ0KPiANCj4gTWF4aW1lIGhhcyBz
dWdnZXN0ZWQgeW91J3JlIHRoZSBwZXJzb24gZm9yIERSTSBmcmFtZWJ1ZmZlciBlbXVsYXRp
b24uDQo+IA0KPiBJJ20gZ2V0dGluZyBzb21lIHVuZXhwZWN0ZWQgYmVoYXZpb3VyIHdoZW4g
dGhlcmUgYXJlIG11bHRpcGxlIERSTQ0KPiBkcml2ZXJzIGluIHBsYXkuIEluIHRoaXMgY2Fz
ZSBpdCBoYXBwZW5zIHRvIGJlIHZjNCBhbmQgdGhlIHRpbnkNCj4gaHg4MzU3ZCBTUEkgZGlz
cGxheSBkcml2ZXIsIGJ1dCB0aGlzIGFmZmVjdHMgbW9zdCBvZiB0aGUgdGlueSBEUk0NCj4g
ZHJpdmVycyBhbmQgYWxzbyB0aGUgRFNJIGFuZCBEUEkgb3V0cHV0cyBvbiB0aGUgUGk1Lg0K
PiBXZSBnZXQgZGlmZmVyZW50IGJlaGF2aW91ciBkZXBlbmRpbmcgb24gd2hldGhlciB2YzQg
b3IgaHg4MzU3ZA0KPiBpbml0aWFsaXNlcyBmaXJzdC4NCj4gDQo+IElmIGh4ODM1N2QgbG9h
ZHMgZmlyc3QgYW5kIHJlZ2lzdGVycyBhcyAvZGV2L2ZiMCB0aHJvdWdoIHRoZSBmYg0KPiBl
bXVsYXRpb24sIHRoZW4gd2UgZ2V0IGZiY29uIGVuYWJsaW5nIHRoZSBkaXNwbGF5IGFuZCBw
dXR0aW5nIHRoZQ0KPiBlbXVsYXRlZCBmcmFtZWJ1ZmZlciBvbiBpdC4gdmM0IHRoZW4gbG9h
ZHMsIHJlZ2lzdGVycyAvZGV2L2ZiMSwgYW5kDQo+IHRocm91Z2ggdGhlIGhvdHBsdWcgaGFu
ZGxlciBpdCBlbmFibGVzIHRoZSBkaXNwbGF5DQo+IChkcm1fZmJfaGVscGVyX2hvdHBsdWdf
ZXZlbnQgY2FsbHMsIGRybV9mYl9oZWxwZXJfc2V0X3Bhciwgd2hpY2ggY2FsbHMNCj4gX19k
cm1fZmJfaGVscGVyX3Jlc3RvcmVfZmJkZXZfbW9kZV91bmxvY2tlZCkuDQo+IA0KPiBJZiB2
YzQgbG9hZHMgZmlyc3QgYW5kIGNsYWltcyAvZGV2L2ZiMCwgZmJjb24gaW5pdGFsaXNlcyBh
bmQgZW5hYmxlcw0KPiB0aGUgZGlzcGxheS4gaHg4MzU3ZCB0aGVuIGxvYWRzIGFuZCByZWdp
c3RlcnMgYXMgL2Rldi9mYjEuIGZiY29uIGlzDQo+IG5vdCBjb25maWd1cmVkIGZvciB0aGF0
IGZiLCBhbmQgdGhlcmUgaXMgbm8gc3Vic2VxdWVudCBob3RwbHVnIGV2ZW50DQo+IChTUEkg
ZGlzcGxheXMgYXJlbid0IGhvdHBsdWdnYWJsZSksIHNvIHdlIGhhdmUgYSBmdWxseSBjb25m
aWd1cmVkDQo+IGZyYW1lYnVmZmVyIGV4cG9zZWQgdG8gdXNlcnNwYWNlIGJ1dCB0aGUgZGlz
cGxheSBpdHNlbGYgaXNuJ3QgZW5hYmxlZA0KPiBzbyB3ZSBkb24ndCBzZWUgYW55dGhpbmcg
Oi0oDQo+IE9wZW4gYW5kIGNsb3NlIC9kZXYvZHJpL2NhcmQxIGFuZCB0aGUgbGFzdGNsb3Nl
IGhvb2sgY2FsbHMNCj4gZHJtX2ZiX2hlbHBlcl9yZXN0b3JlX2ZiZGV2X21vZGVfdW5sb2Nr
ZWQgYW5kIHdlIGdldCB0aGUgZGlzcGxheQ0KPiBlbmFibGVkLg0KDQpXaGF0IHlvdSdyZSBk
ZXNjcmliaW5nIHNvdW5kcyBsaWtlIHRoZSByZWNlbnQgYnVnIHJlcG9ydCBhdA0KDQogICBo
dHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL2FtZC8tL2lzc3Vlcy8yNjQ5DQoN
CndoaWNoIGhhZCBzaW1pbGFyIHN5bXB0b21zIHdpdGggYW1kZ3B1LiBJSVJDIHRoZSBjb25z
b2xlIGRpZG4ndCANCmluaXRpYWxpemUgaWYgdGhlIERSTSBob3RwbHVnZ2luZyBldmVudCBo
YXBwZW5lZCBiZWZvcmUgZmJkZXYgZW11bGF0aW9uIA0Kd2FzIHJlYWR5LiBEUk0ncyBmYmRl
diBjb2RlIHdvdWxkIHRoZW4gbm90IHNlZSB0aGUgaG90cGx1Z2dlZCBjb25uZWN0b3IuDQoN
CkRvIHlvdSBoYXZlIGNvbW1pdCAyNzY1NWI5YmI5ZjAgKCJkcm0vY2xpZW50OiBTZW5kIGhv
dHBsdWcgZXZlbnQgYWZ0ZXIgDQpyZWdpc3RlcmluZyBhIGNsaWVudCIpIGluIHlvdXIgdHJl
ZT8gKEl0J3MgYmVlbiBwb3J0ZWQgaW50byB2YXJpb3VzIA0Kc3RhYmxlIGJyYW5jaGVzIGFz
IHdlbGwuKQ0KDQpCZXN0IHJlZ2FyZA0KVGhvbWFzDQoNCj4gDQo+IElzIGl0IGludGVudGlv
bmFsIHRoYXQgd2UncmUgbGVmdCBpbiB0aGlzIGxpbWJvIHN0YXRlIHdpdGggdGhlIGRpc3Bs
YXkNCj4gbm90IGVuYWJsZWQgaWYgZmJjb24gaXNuJ3QgZW5hYmxlZCBvbiBhIGZyYW1lYnVm
ZmVyPw0KPiANCj4gV2UncmUgdHJ5aW5nIHRvIGdldCBwZW9wbGUgdG8gdHJhbnNpdGlvbiBm
cm9tIHRoZSBmYmRldiBkcml2ZXJzIHRvIERSTQ0KPiBlcXVpdmFsZW50cywgYnV0IHRoaXMg
c2VlbXMgdG8gYmUgYSBiYWNrd2FyZHMgc3RlcCBpZiB0aGVyZSBpcyBhbg0KPiBleHRyYSBz
dGVwIHJlcXVpcmVkIHRvIGdldCB0aGUgZGlzcGxheSBlbmFibGVkLiBNYW55IHVzZXJzIGFy
ZSBzdGlsbA0KPiBqdXN0IHVzaW5nIHRoZSBmcmFtZWJ1ZmZlci4NCj4gDQo+IEFueSBpbnB1
dCBpcyBtdWNoIGFwcHJlY2lhdGVkLg0KPiANCj4gVGhhbmtzLA0KPiAgICBEYXZlDQoNCi0t
IA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0Ug
U29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5
MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywg
QW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5i
ZXJnKQ0K

--------------RtqHWv60olPVfBz64ZirUy9M--

--------------yAnGGPNeNv00ZWVglCHfwC60
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmUnmkgFAwAAAAAACgkQlh/E3EQov+A4
zw/+L23+aGze3lTmPYalggp1q4VLNpDcwJpIo6ztatDOhne7NVQ9ncq7ZYBlgvo/PcXbMizLVHTp
8zJk8+EWkAhWqp6v/y7EQFRFdi2Ggi7hVyUVl9Zt35bgg4mGdf2JNuhwKSdERginZ/JM3I4jLVSk
8ADzdvPmak8fnnm4/k4LaNiriQZBAwWC6iDy2Wffi9XRwH97YPV0MWqLzdgG+AmP4LpEHc7bMEl+
p7/n+ScDZbdRYWTASp0AtKoTPMx/oZwgg0wwwuRXMjl7zF2Trp8CHtO8Rdyve1Ea3aefMmMzDpAz
b3nGHDJwvusudJfZhU8flxPF0ny2AsnyACY9RU846yCbm7LZ9G7nqvApqX93fnR057uqcL0JLxYS
iFtsc9wzoJictKMAyN8H7dsne9Vmhn0ACS724VrsXdfp/fu1UuJyV8KxQuAUNLJumcnZad1YBoIu
tf4Qn/zUZdFjHto+akhF1Wi53ucyfhEITgwUr1DZjQDC4HKYsaUw/4D4ynzW2TUlo5qtF3axORrd
i35kmteJTFyOABIBwazvbwe58jZqDP9spSnQjiDbPha0pO8vWy75nvM1fgIJBtU9k6EuxieGIXzW
Y9OFW6uejRpzuEP7WEOG+GKzhs2Io81APUzBdPTtPJNaBXJGMd5U+sLRkNp7aj1RuigpRIozMs3G
fWQ=
=G2Jw
-----END PGP SIGNATURE-----

--------------yAnGGPNeNv00ZWVglCHfwC60--
