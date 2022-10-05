Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 647565F5769
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 17:26:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0851310E6B6;
	Wed,  5 Oct 2022 15:26:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A768C10E6B5
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Oct 2022 15:26:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 346C02195D;
 Wed,  5 Oct 2022 15:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1664983593; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PKIKm1cdMC65a8Op/73bzESEz/KzEVTyZfNRFtS1/rI=;
 b=QRMi2xBbDPJ1Un/uFKKNMzxp/7+BD8riwa8gpS8shZHxaX1CHBU7Mt5Q6jjbT4TI699Sou
 oRYZ4134R3oNje+bm3C9lydzmkLjmjwm05hkOMx1u4UxB8zkXYnrfhOjBZ7pLpT2CwPmZA
 Z7AgMGZ/IyvEbEHINhrlkNR2D6Toix8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1664983593;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PKIKm1cdMC65a8Op/73bzESEz/KzEVTyZfNRFtS1/rI=;
 b=6kfZRFWUd85pj3mM8wi22/dHVSIfzeama1Ps4OQ6Wqc5QSnyCbRl30Y8YV26/zG7np38T6
 Bc5idO9Y0E0x21CQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 04D8C13ABD;
 Wed,  5 Oct 2022 15:26:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GR4wOyiiPWO5QAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 05 Oct 2022 15:26:32 +0000
Message-ID: <2b4e21f5-c5f8-f2cb-cee8-bd00b12f182e@suse.de>
Date: Wed, 5 Oct 2022 17:26:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 10/16] drm/udl: Use damage iterator
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, airlied@redhat.com,
 sean@poorly.run, daniel@ffwll.ch
References: <20220919130408.21486-1-tzimmermann@suse.de>
 <20220919130408.21486-11-tzimmermann@suse.de>
 <6af7645c-880f-b1d1-4d78-aa8642e6f7e9@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <6af7645c-880f-b1d1-4d78-aa8642e6f7e9@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------REKhM9S3FWfLgKHN8RLKhM0j"
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------REKhM9S3FWfLgKHN8RLKhM0j
Content-Type: multipart/mixed; boundary="------------9ASBUZtu0jBqEAHWvwy7tESG";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, airlied@redhat.com,
 sean@poorly.run, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org
Message-ID: <2b4e21f5-c5f8-f2cb-cee8-bd00b12f182e@suse.de>
Subject: Re: [PATCH 10/16] drm/udl: Use damage iterator
References: <20220919130408.21486-1-tzimmermann@suse.de>
 <20220919130408.21486-11-tzimmermann@suse.de>
 <6af7645c-880f-b1d1-4d78-aa8642e6f7e9@redhat.com>
In-Reply-To: <6af7645c-880f-b1d1-4d78-aa8642e6f7e9@redhat.com>

--------------9ASBUZtu0jBqEAHWvwy7tESG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDUuMTAuMjIgdW0gMDA6Mjggc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IE9uIDkvMTkvMjIgMTU6MDQsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0K
Pj4gVXNlIGEgZGFtYWdlIGl0ZXJhdG9yIHRvIHByb2Nlc3MgZGFtYWdlIGFyZWFzIGluZGl2
aWR1YWxseS4gTWVyZ2luZw0KPj4gZGFtYWdlIGFyZWFzIGNhbiByZXN1bCB0aW4gbGFyZ2Ug
dXBkYXRlcyBvZiB1bmNoYW5nZWQgZnJhbWVidWZmZXINCj4gDQo+IHJlc3VsdCBpbg0KPiAN
Cj4+IHJlZ2lvbnMuIEFzIFVTQiBpcyByYXRoZXIgc2xvdywgaXQncyBiZXR0ZXIgdG8gcHJv
Y2VzcyBkYW1hZ2UgYXJlYXMNCj4+IGluZGl2aWR1YWxseSBhbmQgaGVuY2UgbWluaW1pemUg
VVNCLXRyYW5zZmVyZWQgZGF0YS4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmlt
bWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4+IC0tLQ0KPiANCj4gUmV2aWV3ZWQt
Ynk6IEphdmllciBNYXJ0aW5leiBDYW5pbGxhcyA8amF2aWVybUByZWRoYXQuY29tPg0KPiAN
Cj4gYnV0IEkndmUgYSBjb21tZW50IGJlbG93Lg0KPiANCj4+ICAgDQo+PiAgIC8qDQo+PiBA
QCAtMzAxLDE2ICsyOTEsMjYgQEAgc3RhdGljIHZvaWQgdWRsX3ByaW1hcnlfcGxhbmVfaGVs
cGVyX2F0b21pY191cGRhdGUoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsDQo+PiAgIAlzdHJ1
Y3QgZHJtX3NoYWRvd19wbGFuZV9zdGF0ZSAqc2hhZG93X3BsYW5lX3N0YXRlID0gdG9fZHJt
X3NoYWRvd19wbGFuZV9zdGF0ZShwbGFuZV9zdGF0ZSk7DQo+PiAgIAlzdHJ1Y3QgZHJtX2Zy
YW1lYnVmZmVyICpmYiA9IHBsYW5lX3N0YXRlLT5mYjsNCj4+ICAgCXN0cnVjdCBkcm1fcGxh
bmVfc3RhdGUgKm9sZF9wbGFuZV9zdGF0ZSA9IGRybV9hdG9taWNfZ2V0X29sZF9wbGFuZV9z
dGF0ZShzdGF0ZSwgcGxhbmUpOw0KPj4gLQlzdHJ1Y3QgZHJtX3JlY3QgcmVjdDsNCj4+IC0J
aW50IGlkeDsNCj4+ICsJc3RydWN0IGRybV9hdG9taWNfaGVscGVyX2RhbWFnZV9pdGVyIGl0
ZXI7DQo+PiArCXN0cnVjdCBkcm1fcmVjdCBkYW1hZ2U7DQo+PiArCWludCByZXQsIGlkeDsN
Cj4+ICAgDQo+PiAtCWlmICghZHJtX2Rldl9lbnRlcihkZXYsICZpZHgpKQ0KPj4gKwlyZXQg
PSBkcm1fZ2VtX2ZiX2JlZ2luX2NwdV9hY2Nlc3MoZmIsIERNQV9GUk9NX0RFVklDRSk7DQo+
PiArCWlmIChyZXQpDQo+PiAgIAkJcmV0dXJuOw0KPj4NCj4gDQo+IFRoaXMgaXMgYW4gdW5y
ZWxhdGVkIGNoYW5nZS4gVGhlIHN5bmMgd2FzIG1hZGUgaW4gdWRsX2hhbmRsZV9kYW1hZ2Uo
KSBiZWZvcmUNCj4gYW5kIHlvdSBhcmUgbW92aW5nIHRvIHVkbF9wcmltYXJ5X3BsYW5lX2hl
bHBlcl9hdG9taWNfdXBkYXRlKCkgaW4gdGhpcyBwYXRjaC4NCj4gDQo+IEkgZG9uJ3QgaGF2
ZSBhIHN0cm9uZyBvcGluaW9uIGFuZCBJIHNlZSB0aGF0IHRoZXJlIGFyZSBkcml2ZXJzIHRo
YXQgZG8gb25jZQ0KPiBiZWZvcmUgaXRlcmF0aW5nIG92ZXIgdGhlIGRhbWFnZSBhcmVhcyBh
bmQgb3RoZXJzIGRvIHRoZSBzeW5jIGZvciBlYWNoIGRhbWFnZQ0KPiBhcmVhIHVwZGF0ZS4g
QnV0IGl0IHdvdWxkIGJlIGdvb2QgdG8gbWVudGlvbiB0aGF0IHRoaXMgY2hhbmdlIGlzIGRv
bmUgdG9vIGFuZA0KPiBwcm92aWRlZCBzb21lIGp1c3RpZmljYXRpb24uDQoNCk9LLCBJJ2xs
IGRvIHRoYXQuIFZlcnkgYnJpZWZseTsgaXQncyBmb3IgbWluaW1pemluZyB0aGUgb3Zlcmhl
YWRzIG9mIHRoZSANCnBvc3NpYmxlIGxvY2tpbmcgYW5kIHN5bmNocm9uaXphdGlvbiwgYW5k
IHRvIG1heWJlIGl0IGtlZXBzIHBvc3NpYmxlIA0Kd3JpdGVycyBvdXQgd2hpbGUgd2UgY29w
eSBmcm9tIHRoZSBidWZmZXIuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQoNCi0t
IA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0Ug
U29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkg
TsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOk
ZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------9ASBUZtu0jBqEAHWvwy7tESG--

--------------REKhM9S3FWfLgKHN8RLKhM0j
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmM9oigFAwAAAAAACgkQlh/E3EQov+Df
dg/+OjPORWFnlHumBxTtKLcL8ySa6CgN3G3w8lUriMy19KH3lep7+nZ4g/dTjqKtHhMMpOf8D3R1
v5OZJx5tWdN4N5amRq3IoVnEGcBIP9977WzgdNWegxXdBUkJXAhQO0cDX5YNxyHfEuxBWZu7D+b1
QvzzO6nZY03Hg9o4lMnF2kIaKTgulV0uNGesV389UNyyhimngsXWRsNp2LnC3Cs+cPYCLlyrOwOo
ceD9PPh07q5YCuObXTwrsU+rtVelCKxb+oLV03s0blzekuAhzsBCgB2H98VSkn9kvdWpR3QHCb4B
Dechk2XN8iIW9b3s944LeL890T+6IREsZ6J08Zw6gdPpfHWyABXaMQbPN1y+/Cv/zXaQXRTOH8yk
CWmGVRUtOUBTHnRlEvlKgYYKRAHWZzqj/iPCRDEURW2eJBUVkkrtqxIy3OhO6yRfjbIPS4OB6FvJ
bjYuWvnQeZiZjjUd7mmB/gKEJyz5FWhoWk/Z4WsjHS63r4GZuwq4MKCQkGRDwuHcicWgowavZsb4
enJe+9EgvjUcmaNnCQorWF7Wzq69qNKPbT8Bzh0wRrUodUrX2JaTwBrw7TdIBVe88t93CL7DNhZo
3/Ta3RCynKovbRquIIvv27vnA3sIUC6tX44NwwJ4SCNZFLahfXdhtq0ddIzriYUHxj8LYM4gBl+m
qoQ=
=3SW3
-----END PGP SIGNATURE-----

--------------REKhM9S3FWfLgKHN8RLKhM0j--
