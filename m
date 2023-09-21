Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2E07A92D5
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 10:52:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52C5F10E58B;
	Thu, 21 Sep 2023 08:52:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83F2A10E58B
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 08:52:16 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 43C471F896;
 Thu, 21 Sep 2023 08:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1695286335; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=o0NOwzSQa3Pa2SpcHXwUu0UZoc7VtkIvvy2WMbZ3kvo=;
 b=L2kv7taxrSVvvvLd7zX5r60fIN+Mtr77BCpCp6TZAoiKmWRq3cO2+Gu0v7cUz4UpiTLhvi
 ASgfWvCLr9xZyee+NIZCO25HcRq51KN1Jt7aSqXETO3SZ4OLnMoWdl3FfGLR7gERYa6y1t
 ROLhcCa2T9rD4NuxjNpn2KS3oOKtN6s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1695286335;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=o0NOwzSQa3Pa2SpcHXwUu0UZoc7VtkIvvy2WMbZ3kvo=;
 b=4vOidfRBRjQFn1NCodNiy18GyVcZEh5s/CSx8AzmORBDOFnkFChT8zRQHEdTDIjTB17S3X
 FTlv53aPKE57XHAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 22D91134B0;
 Thu, 21 Sep 2023 08:52:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ZoerBz8EDGURJQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 21 Sep 2023 08:52:15 +0000
Message-ID: <d1f26dbd-5f32-4eb2-af16-f15fe95cc2ec@suse.de>
Date: Thu, 21 Sep 2023 10:52:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/ssd130x: Drop _helper prefix from struct
 drm_*_helper_funcs callbacks
Content-Language: en-US
To: Maxime Ripard <mripard@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>
References: <20230914195138.1518065-1-javierm@redhat.com>
 <f5620d32-2705-498b-a65c-7dc663340a6d@suse.de>
 <87wmwo3q50.fsf@minerva.mail-host-address-is-not-set>
 <552hpgr7qzbjxuyei3n5m7rsn7ekwbdgzv25oe5vy6qb35gf23@q4etussk5jwl>
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
In-Reply-To: <552hpgr7qzbjxuyei3n5m7rsn7ekwbdgzv25oe5vy6qb35gf23@q4etussk5jwl>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0g0fXN1cz6o1j6bRC2foj9Fh"
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0g0fXN1cz6o1j6bRC2foj9Fh
Content-Type: multipart/mixed; boundary="------------bbbG8C04OCexU0wEJt5Qiq00";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <mripard@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>
Cc: dri-devel@lists.freedesktop.org, Geert Uytterhoeven
 <geert@linux-m68k.org>, linux-kernel@vger.kernel.org
Message-ID: <d1f26dbd-5f32-4eb2-af16-f15fe95cc2ec@suse.de>
Subject: Re: [PATCH] drm/ssd130x: Drop _helper prefix from struct
 drm_*_helper_funcs callbacks
References: <20230914195138.1518065-1-javierm@redhat.com>
 <f5620d32-2705-498b-a65c-7dc663340a6d@suse.de>
 <87wmwo3q50.fsf@minerva.mail-host-address-is-not-set>
 <552hpgr7qzbjxuyei3n5m7rsn7ekwbdgzv25oe5vy6qb35gf23@q4etussk5jwl>
In-Reply-To: <552hpgr7qzbjxuyei3n5m7rsn7ekwbdgzv25oe5vy6qb35gf23@q4etussk5jwl>

--------------bbbG8C04OCexU0wEJt5Qiq00
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjEuMDkuMjMgdW0gMDk6NDQgc2NocmllYiBNYXhpbWUgUmlwYXJkOg0KPiBI
aSwNCj4gDQo+IE9uIE1vbiwgU2VwIDE4LCAyMDIzIGF0IDA5OjE5OjA3QU0gKzAyMDAsIEph
dmllciBNYXJ0aW5leiBDYW5pbGxhcyB3cm90ZToNCj4+IFRob21hcyBaaW1tZXJtYW5uIDx0
emltbWVybWFubkBzdXNlLmRlPiB3cml0ZXM6DQo+Pg0KPj4+IEhpDQo+Pj4NCj4+PiBBbSAx
NC4wOS4yMyB1bSAyMTo1MSBzY2hyaWViIEphdmllciBNYXJ0aW5leiBDYW5pbGxhczoNCj4+
Pj4gVGhlIGRyaXZlciB1c2VzIGEgbmFtaW5nIGNvbnZlbnRpb24gd2hlcmUgZnVuY3Rpb25z
IGZvciBzdHJ1Y3QgZHJtXypfZnVuY3MNCj4+Pj4gY2FsbGJhY2tzIGFyZSBuYW1lZCBzc2Qx
MzB4XyRvYmplY3RfJG9wZXJhdGlvbiwgd2hpbGUgdGhlIGNhbGxiYWNrcyBmb3INCj4+Pj4g
c3RydWN0IGRybV8qX2hlbHBlcl9mdW5jcyBhcmUgbmFtZWQgc3NkMTMweF8kb2JqZWN0X2hl
bHBlcl8kb3BlcmF0aW9uLg0KPj4+Pg0KPj4+PiBUaGUgaWRlYSBpcyB0aGF0IHRoaXMgaGVs
cGVyXyBwcmVmaXggaW4gdGhlIGZ1bmN0aW9uIG5hbWVzIGRlbm90ZSB0aGF0IGFyZQ0KPj4+
PiBmb3Igc3RydWN0IGRybV8qX2hlbHBlcl9mdW5jcyBjYWxsYmFja3MuIFRoaXMgY29udmVu
dGlvbiB3YXMgY29waWVkIGZyb20NCj4+Pj4gb3RoZXIgZHJpdmVycywgd2hlbiBzc2QxMzB4
IHdhcyB3cml0dGVuIGJ1dCBNYXhpbWUgcG9pbnRlZCBvdXQgdGhhdCBpcyB0aGUNCj4+Pj4g
ZXhjZXB0aW9uIHJhdGhlciB0aGFuIHRoZSBub3JtLg0KPj4+DQo+Pj4gSSBndWVzcyB5b3Ug
Zm91bmQgdGhpcyBpbiBteSBjb2RlLiBJIHdhbnQgdG8gcG9pbnQgb3V0IHRoYXQgSSB1c2Ug
dGhlDQo+Pj4gX2hlbHBlciBpbmZpeCB0byBzaWduYWwgdGhhdCB0aGVzZSBhcmUgY2FsbGJh
Y2sgZm9yDQo+Pj4gZHJtX3ByaW1hcnlfcGxhbmVfaGVscGVyX2Z1bmNzIGFuZCAqbm90KiBk
cm1fcHJpbWFyeV9wbGFuZV9mdW5jcy4gVGhlDQo+Pj4gbmFtaW5nIGlzIGludGVudGlvbmFs
Lg0KPj4+DQo+Pg0KPj4gWWVzLCB0aGF0J3Mgd2hhdCB0cmllZCB0byBzYXkgaW4gdGhlIGNv
bW1pdCBtZXNzYWdlIGFuZCBpbmRlZWQgSSBnb3QgdGhlDQo+PiBjb252ZW50aW9uIGZyb20g
ZHJpdmVycyBpbiBkcml2ZXJzL2dwdS9kcm0vdGlueS4gSW4gZmFjdCBJIGJlbGlldmUgdGhl
c2UNCj4+IGZ1bmN0aW9uIG5hbWVzIGFyZSBzaW5jZSBmaXJzdCBpdGVyYXRpb24gb2YgdGhl
IGRyaXZlciwgd2hlbiB3YXMgbWVhbnQgdG8NCj4+IGJlIGEgdGlueSBkcml2ZXIuDQo+Pg0K
Pj4gQWNjb3JkaW5nIHRvIE1heGltZSBpdCdzIHRoZSBleGNlcHRpb24gcmF0aGVyIHRoYW4g
dGhlIHJ1bGUgYW5kIHN1Z2dlc3RlZA0KPj4gdG8gY2hhbmdlIGl0LCBJIGRvbid0IHJlYWxs
eSBoYXZlIGEgc3Ryb25nIG9waW5pb24gb24gZWl0aGVyIG5hbWluZyBUQkguDQo+IA0KPiBN
YXliZSB0aGF0J3MganVzdCBtZSwgYnV0IHRoZSBoZWxwZXIgaW4gdGhlIG5hbWUgaW5kZWVk
IHRocm93cyBtZSBvZmYuIEluIG15DQo+IG1pbmQsIGl0J3Mgc3VwcG9zZWQgdG8gYmUgdXNl
ZCBvbmx5IGZvciBoZWxwZXJzLCBub3QgZnVuY3Rpb25zIGltcGxlbWVudGluZyB0aGUNCj4g
aGVscGVycyBob29rcy4NCg0KVHlpbmcgdGhlIGZ1bmN0aW9uIG5hbWUgdG8gaXRzIF9mdW5j
cyBzdHJ1Y3R1cmUgbWFrZXMgcGVyZmVjdCBzZW5zZSB0byANCm1lLCBhcyBpdCBoZWxwcyB0
byBzdHJ1Y3R1cmUgdGhlIGRyaXZlciBjb2RlLiBTbyBJIGFsd2F5cyB1c2UgdGhlIA0KX2hl
bHBlcl8gaW5maXguDQoNCkluIGNvbnRyYXN0LCB0aGUgRFJNIGhlbHBlcnMgdGhhdCBpbXBs
ZW1lbnQgY2VydGFpbiBmdW5jdGlvbmFsaXR5IGRvZXMgDQpub3Qgc2VlbSB0byBmb2xsb3cg
YW55IG5hbWluZyBzY2hlbWUuIEZvciBleGFtcGxlIA0KZHJtX2F0b21pY19oZWxwZXJfY2hl
Y2soKSBpbXBsZW1lbnRzIHN0cnVjdCANCmRybV9tb2RlX2NvbmZpZ19mdW5jcy5hdG9taWNf
Y2hlY2suIFRvIG1lLCBpdCdzIG5vdCBvYnZpb3VzIHRoYXQgdGhlc2UgDQp0d28gYmVsb25n
IHRvZ2V0aGVyLiAgQW5kIGluIHRoZSBzYW1lIHN0cnVjdHVyZSwgdGhlcmUncyBmYl9jcmVh
dGUsIA0Kd2hpY2ggaXMgcHJvdmlkZWQgYnkgZHJtX2dlbV9mYl9jcmVhdGVfd2l0aF9kaXJ0
eSgpLiBUaGlzIG9uZSBkb2Vzbid0IA0KZXZlbiBtZW50aW9uIHRoYXQgaXQncyBhIGhlbHBl
ci4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gTWF4aW1lDQoNCi0tIA0KVGhv
bWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdh
cmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBO
dWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFuZHJldyBNeWVycywgQW5kcmV3
IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0K


--------------bbbG8C04OCexU0wEJt5Qiq00--

--------------0g0fXN1cz6o1j6bRC2foj9Fh
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmUMBD4FAwAAAAAACgkQlh/E3EQov+Dd
Ng/8CjBynjHcTnMR2v4ZJ+79Txtn2lg00qOXovH4kqhSw+dhlYUd3Na6vaEQ5RxzUdcGl9L4sZJa
XJaHdr11JogKM+fUUwe9uBkq8xDYFfXmwaCTIzBsiwlwW01r/kUIjEnqgkvKlIGxCPXxPXK08SOW
0v5tFw0I1IQPr1LtJk8N84aTJDfJv3MQwfXGVZ7hUwivHbeqCwo1GYtxEbGXJk6pKs92MWgK1QCm
y0yhhdFfZMgbdNG3zG/ecLP5QBiJbqga/E3H0RQfmdaOE74Iv2V9QROXB/N7bRJFOpxnbw7yRfCc
KPnng7bHJ5MryQc84k5Ys4yZVFEG4Ea+/za08omsKZnqVRkzlY7Sg75lTqKwO6J5Qo/KTmZaYyBM
uIPBJBWcwHJeswFQoX9gydH5TAXWSCvG4xUUw9GpZSzge7O5/vCuYlQjeyRPulg2Ac8Zh3ADI8Vk
hPWCMm5jE0tZQS+IE/lp9vfku9yxc0DtGccnD6b4NBrhbK6K62VofanaSrc6WehRHn1WVL3xM7pA
kVFojnJbVJS+euYqua82jQ7pukhkh5SltxLvLQ8N0ldqZXwkA9/gFRwjFtAsKg//c4+GsnPYTprj
WQMyFimzF5cPDmeh/TZg87shaW0U0hfrlMHl+ylGZoUUZ4RO7DBbKscYOQRxxtpHrBkWc3CgGT42
QsE=
=Iw6T
-----END PGP SIGNATURE-----

--------------0g0fXN1cz6o1j6bRC2foj9Fh--
