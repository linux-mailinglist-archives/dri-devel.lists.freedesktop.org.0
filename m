Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 131EF65E763
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 10:11:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5307A10E6C8;
	Thu,  5 Jan 2023 09:11:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 480E910E6C8
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 09:11:03 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D67E62656A;
 Thu,  5 Jan 2023 09:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1672909860; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X8Tsbfx4EUwNSoRBigBXaigcGNlH3D1LATrMb8hxNgs=;
 b=QZZnhT0+mdIejfGICiKUFRHG/3A9jJgALA16ke2UOpcdELP2o8K79KyHS8Vab4q2IwHV+D
 CLg2RVSLL8WAwtZN8iSDrS4IImURX8Z7zfbALOvZ7bkBSr3f/wETrvHmvMfCWncET4jPHo
 Y3yVpQFWGFiE82iyUiv4csFoZNWJ6+8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1672909860;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=X8Tsbfx4EUwNSoRBigBXaigcGNlH3D1LATrMb8hxNgs=;
 b=HdHkLtTcIlujv1oxrwJIgUTzUBHROc2E7s1i2NY28TmAMQ7OFak0Ext3VtdT3BigcfrJjW
 3oh+0Ca0VdLZ/1Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B581113273;
 Thu,  5 Jan 2023 09:11:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 7VhqKySUtmNpMAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 05 Jan 2023 09:11:00 +0000
Message-ID: <9228cf1f-d534-b5b4-a0ec-ea1f7f874f97@suse.de>
Date: Thu, 5 Jan 2023 10:11:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] drm/vc4: Start console with 32 bpp / 24 depth
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>
References: <20230105080734.23554-1-tzimmermann@suse.de>
 <20230105083609.ofeikov65kbv3gte@houat>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230105083609.ofeikov65kbv3gte@houat>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Hbxlk14vZmBvFXqlJ0o12c7B"
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
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>,
 Javier Martinez Canillas <javierm@redhat.com>, emma@anholt.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Hbxlk14vZmBvFXqlJ0o12c7B
Content-Type: multipart/mixed; boundary="------------qm83e3yc0OIi3VQWzMN0QjuO";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>
Cc: emma@anholt.net, =?UTF-8?Q?Ma=c3=adra_Canal?= <mcanal@igalia.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org
Message-ID: <9228cf1f-d534-b5b4-a0ec-ea1f7f874f97@suse.de>
Subject: Re: [PATCH] drm/vc4: Start console with 32 bpp / 24 depth
References: <20230105080734.23554-1-tzimmermann@suse.de>
 <20230105083609.ofeikov65kbv3gte@houat>
In-Reply-To: <20230105083609.ofeikov65kbv3gte@houat>

--------------qm83e3yc0OIi3VQWzMN0QjuO
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDUuMDEuMjMgdW0gMDk6MzYgc2NocmllYiBNYXhpbWUgUmlwYXJkOg0KPiBI
aSwNCj4gDQo+IE9uIFRodSwgSmFuIDA1LCAyMDIzIGF0IDA5OjA3OjM0QU0gKzAxMDAsIFRo
b21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4gSW52b2tlIHRoZSBnZW5lcmljIGNvbnNvbGUg
ZW11bGF0aW9uIHdpdGggYSAzMiBiaXRzIHBlciBwaXhlbC4gVGhlDQo+PiBwcmVmZXJyZWQg
Y29sb3IgZGVwdGggaXMgMjQsIHNvIHRoZSBjdXJyZW50IHZhbHVlIG9mIDE2IGJwcCBpcyB0
b28NCj4+IHNtYWxsLiBUaGlzIHJlc3VsdHMgaW4gdGhlIGZvbGxvd2luZyBlcnJvciBtZXNz
YWdlDQo+Pg0KPj4gdmM0LWRybSBncHU6IFtkcm1dIGJwcC9kZXB0aCB2YWx1ZSBvZiAxNi8y
NCBub3Qgc3VwcG9ydGVkDQo+PiB2YzQtZHJtIGdwdTogW2RybV0gTm8gY29tcGF0aWJsZSBm
b3JtYXQgZm91bmQNCj4+IC0tLS0tLS0tLS0tLVsgY3V0IGhlcmUgXS0tLS0tLS0tLS0tLQ0K
Pj4gV0FSTklORzogQ1BVOiAyIFBJRDogNjYgYXQgZHJpdmVycy9ncHUvZHJtL2RybV9hdG9t
aWMuYzoxNjA0IF9fZHJtX2F0b21pY19oZWxwZXJfc2V0X2NvbmZpZysweDJlOC8weDMxNCBb
ZHJtXQ0KPj4NCj4+IFRoZSBwcm9ibGVtIGhhcyBiZWVuIHByZXNlbnQgZm9yIGEgbG9uZywg
YnV0IGhhcyBvbmx5IG5vdyBzdXJmYWNlZA0KPj4gYXMgY29tbWl0IDM3YzkwZDU4OWRjMCAo
ImRybS9mYi1oZWxwZXI6IEZpeCBzaW5nbGUtcHJvYmUgY29sb3ItZm9ybWF0DQo+PiBzZWxl
Y3Rpb24iKSBhdHRlbXB0cyB0byBpbXByb3ZlIHNlbGVjdGlvbiBvZiB0aGUgY29sb3IgZm9y
bWF0Lg0KPj4NCj4+IFNlZSBbMV0gZm9yIHRoZSBpbml0aWFsIGJ1ZyByZXBvcnQuDQo+Pg0K
Pj4gUmVwb3J0ZWQtYnk6IE1hw61yYSBDYW5hbCA8bWNhbmFsQGlnYWxpYS5jb20+DQo+PiBT
aWduZWQtb2ZmLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4N
Cj4+IFRlc3RlZC1ieTogTWHDrXJhIENhbmFsIDxtY2FuYWxAaWdhbGlhLmNvbT4NCj4+IEZp
eGVzOiAzN2M5MGQ1ODlkYzAgKCJkcm0vZmItaGVscGVyOiBGaXggc2luZ2xlLXByb2JlIGNv
bG9yLWZvcm1hdCBzZWxlY3Rpb24iKQ0KPj4gQ2M6IFRob21hcyBaaW1tZXJtYW5uIDx0emlt
bWVybWFubkBzdXNlLmRlPg0KPj4gQ2M6IEphdmllciBNYXJ0aW5leiBDYW5pbGxhcyA8amF2
aWVybUByZWRoYXQuY29tPg0KPj4gQ2M6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxh
bmtob3JzdEBsaW51eC5pbnRlbC5jb20+DQo+PiBDYzogTWF4aW1lIFJpcGFyZCA8bXJpcGFy
ZEBrZXJuZWwub3JnPg0KPj4gTGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvZHJpLWRl
dmVsLzIwMjMwMTAyMTEyOTI3LjI2NTY1LTEtdHppbW1lcm1hbm5Ac3VzZS5kZS9ULyNtYjA5
ZWI2ZjYxNWY0YjAzMDJjNzhmMjUwYjQyNDFlZTQ4ZDE5MTVmOCAjIDENCj4+IC0tLQ0KPj4g
ICBkcml2ZXJzL2dwdS9kcm0vdmM0L3ZjNF9kcnYuYyB8IDIgKy0NCj4+ICAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+Pg0KPj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL3Zj
NC92YzRfZHJ2LmMNCj4+IGluZGV4IDBjY2FlZTU3ZmU5YS4uNjQ0MjNiNzk5ODJmIDEwMDY0
NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfZHJ2LmMNCj4+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS92YzQvdmM0X2Rydi5jDQo+PiBAQCAtMzg3LDcgKzM4Nyw3IEBAIHN0
YXRpYyBpbnQgdmM0X2RybV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldikNCj4+ICAgCWlmIChy
ZXQgPCAwKQ0KPj4gICAJCWdvdG8gdW5iaW5kX2FsbDsNCj4+ICAgDQo+PiAtCWRybV9mYmRl
dl9nZW5lcmljX3NldHVwKGRybSwgMTYpOw0KPj4gKwlkcm1fZmJkZXZfZ2VuZXJpY19zZXR1
cChkcm0sIDMyKTsNCj4gDQo+IFRoaXMgaXMgZXNzZW50aWFsbHkgYSByZXZlcnQgb2YgZjc0
MWIyOGZiMjk5Lg0KPiANCj4gSXQncyBub3QgY2xlYXIgdG8gbWUgd2hhdCBzZXRzIHRoZSBk
ZXB0aCBwcmVmZXJlbmNlIHRvIDI0LCBiZWNhdXNlIEknZA0KPiByYXRoZXIgY2hhbmdlIHRo
YXQuDQoNCkkgc2VlLiBXZSBzaG91bGQgcmVkdWNlIHRoZSBwcmVmZXJyZWQgY29sb3IgZGVw
dGggdG8gMTYgdGhlbi4gWzFdDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNClsxXSANCmh0
dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L2xhdGVzdC9zb3VyY2UvZHJpdmVycy9n
cHUvZHJtL3ZjNC92YzRfa21zLmMjTDEwNDgNCg0KPiANCj4gTWF4aW1lDQoNCi0tIA0KVGhv
bWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdh
cmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5i
ZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8
aHJlcjogSXZvIFRvdGV2DQo=

--------------qm83e3yc0OIi3VQWzMN0QjuO--

--------------Hbxlk14vZmBvFXqlJ0o12c7B
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmO2lCQFAwAAAAAACgkQlh/E3EQov+Az
Jw/+M4spgQCPA1tc0OtwBknki/R1p8HHvf1uUmKX3k2Q+bUX7MH3kenpg6WtZQKvDJF29QUdvwLw
X1TcFgSxOdOlKzDjHRD4Lqu6UkRZCkACVlle+Ly1oUllyWjlWu8krXNrlMe7bZ6IpRaj+x9W5/Xc
LKIwtOKR38l6J6FsbbJRCLuPsDVtnq7x5DJ68q0tWY7RXZRMhCpM9JEzqMTuY66OFfVbQTANrp+c
12wOPFMnzObb46c4tXwvrUaMeS3vcOa0v/i7MbQI1xmsgEZrcXZcgTTT0q7PuNvHo0e/c3lKUtrg
6SKQXJXRW82Qb4I1RZzLl9AHfxHXou1R3o9gDnnq+S3mjivT0FXJNG0rdlG4ct5wnXX6sdGYvTvF
1p2q4SzYiADsU0TEHesKwoVkOOlNnDpJkM7yN0adIYwfQC558za2gP2z4R8qrHqDLzc7bNHP2Sa9
FqucIv872x4tcI5E2sES07thNiHdGIeia98aQE/XH/RTc861OVF3jY90xVCYcd972yQBTW2ImFlx
fTP/1/ZF/sS8etfJkIo6/KsJBVHWDFdr/ppuQIkyVKFHUZg0J2GY+H73bzdpOh82Gg2y9Nvd28mN
TC78+TkVH7z5wpWpZB8Go1bldeM2xSp5sqhj2PPCZIMhCZ4SWWyFFP74TEqJUxN5aRniUWeckZmP
6y4=
=PIzk
-----END PGP SIGNATURE-----

--------------Hbxlk14vZmBvFXqlJ0o12c7B--
