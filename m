Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E77A96352BD
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 09:33:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F4F010E51A;
	Wed, 23 Nov 2022 08:33:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D512B10E51D;
 Wed, 23 Nov 2022 08:33:03 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 77FED220C6;
 Wed, 23 Nov 2022 08:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1669192382; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hNQlWKXs/MH91UsdigvjQBX+ylGHs8MNJsZNwJEJ8ZY=;
 b=MpA6Cwax6KZQ3hK0dtrtjCeccDrOqyirrz1389h/W8sJ6qvYnHOVJ9cHfEFBUGIUc4fIUv
 e2JcIWdNtnxIb0DG/vK3Fr0xrIa3hiO1if2rDOsaiBOas8YZANiql1yNTIEKY6CJm633bs
 DPt7GSjZdTfXyc0qvbN7tmixLLshtcA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1669192382;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hNQlWKXs/MH91UsdigvjQBX+ylGHs8MNJsZNwJEJ8ZY=;
 b=w2l6LYj2mIwzZg/UIyhpDoGioeUppLF6NgEWXcx9zYw0R1ySldNpwXcYRVAh3cc/vzvfKX
 uyo4gsDn0fpV3yCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 522D813A37;
 Wed, 23 Nov 2022 08:33:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 9n4vE77afWNPdQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 23 Nov 2022 08:33:02 +0000
Message-ID: <3332093f-4a9a-a7ca-aeba-22d3de383d0e@suse.de>
Date: Wed, 23 Nov 2022 09:33:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Content-Language: en-US
To: David Airlie <airlied@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>
References: <20221117183214.2473e745@canb.auug.org.au>
 <20221123162033.02910a5a@canb.auug.org.au>
 <CAMwc25pz4mBYJUK5_GX01X0_5CCCrzfrGS=HoFTtrVRrqF13kA@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAMwc25pz4mBYJUK5_GX01X0_5CCCrzfrGS=HoFTtrVRrqF13kA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0osnNQKmu45Fkg3R03W9zLh8"
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0osnNQKmu45Fkg3R03W9zLh8
Content-Type: multipart/mixed; boundary="------------jVie6nt74P5DO9SS0jrl9C36";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@redhat.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Message-ID: <3332093f-4a9a-a7ca-aeba-22d3de383d0e@suse.de>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
References: <20221117183214.2473e745@canb.auug.org.au>
 <20221123162033.02910a5a@canb.auug.org.au>
 <CAMwc25pz4mBYJUK5_GX01X0_5CCCrzfrGS=HoFTtrVRrqF13kA@mail.gmail.com>
In-Reply-To: <CAMwc25pz4mBYJUK5_GX01X0_5CCCrzfrGS=HoFTtrVRrqF13kA@mail.gmail.com>

--------------jVie6nt74P5DO9SS0jrl9C36
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjMuMTEuMjIgdW0gMDY6MzUgc2NocmllYiBEYXZpZCBBaXJsaWU6DQo+IE9u
IFdlZCwgTm92IDIzLCAyMDIyIGF0IDM6MjEgUE0gU3RlcGhlbiBSb3Rod2VsbCA8c2ZyQGNh
bmIuYXV1Zy5vcmcuYXU+IHdyb3RlOg0KPj4NCj4+IEhpIGFsbCwNCj4+DQo+PiBPbiBUaHUs
IDE3IE5vdiAyMDIyIDE4OjMyOjE0ICsxMTAwIFN0ZXBoZW4gUm90aHdlbGwgPHNmckBjYW5i
LmF1dWcub3JnLmF1PiB3cm90ZToNCj4+Pg0KPj4+IEFmdGVyIG1lcmdpbmcgdGhlIGRybS1t
aXNjIHRyZWUsIHRvZGF5J3MgbGludXgtbmV4dCBidWlsZCAocG93ZXJwYw0KPj4+IHBwYzQ0
eF9kZWZjb25maWcpIGZhaWxlZCBsaWtlIHRoaXM6DQo+Pj4NCj4+PiBsZDogZHJpdmVycy92
aWRlby9mYmRldi9jb3JlL2ZibW9uLm86IGluIGZ1bmN0aW9uIGBmYl9tb2Rlc2V0dGluZ19k
aXNhYmxlZCc6DQo+Pj4gZmJtb24uYzooLnRleHQrMHgxZTQpOiBtdWx0aXBsZSBkZWZpbml0
aW9uIG9mIGBmYl9tb2Rlc2V0dGluZ19kaXNhYmxlZCc7IGRyaXZlcnMvdmlkZW8vZmJkZXYv
Y29yZS9mYm1lbS5vOmZibWVtLmM6KC50ZXh0KzB4MWJhYyk6IGZpcnN0IGRlZmluZWQgaGVy
ZQ0KPj4+IGxkOiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJjbWFwLm86IGluIGZ1bmN0
aW9uIGBmYl9tb2Rlc2V0dGluZ19kaXNhYmxlZCc6DQo+Pj4gZmJjbWFwLmM6KC50ZXh0KzB4
NDc4KTogbXVsdGlwbGUgZGVmaW5pdGlvbiBvZiBgZmJfbW9kZXNldHRpbmdfZGlzYWJsZWQn
OyBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJtZW0ubzpmYm1lbS5jOigudGV4dCsweDFi
YWMpOiBmaXJzdCBkZWZpbmVkIGhlcmUNCj4+PiBsZDogZHJpdmVycy92aWRlby9mYmRldi9j
b3JlL2Zic3lzZnMubzogaW4gZnVuY3Rpb24gYGZiX21vZGVzZXR0aW5nX2Rpc2FibGVkJzoN
Cj4+PiBmYnN5c2ZzLmM6KC50ZXh0KzB4YjY0KTogbXVsdGlwbGUgZGVmaW5pdGlvbiBvZiBg
ZmJfbW9kZXNldHRpbmdfZGlzYWJsZWQnOyBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJt
ZW0ubzpmYm1lbS5jOigudGV4dCsweDFiYWMpOiBmaXJzdCBkZWZpbmVkIGhlcmUNCj4+PiBs
ZDogZHJpdmVycy92aWRlby9mYmRldi9jb3JlL21vZGVkYi5vOiBpbiBmdW5jdGlvbiBgZmJf
bW9kZXNldHRpbmdfZGlzYWJsZWQnOg0KPj4+IG1vZGVkYi5jOigudGV4dCsweDEyOWMpOiBt
dWx0aXBsZSBkZWZpbml0aW9uIG9mIGBmYl9tb2Rlc2V0dGluZ19kaXNhYmxlZCc7IGRyaXZl
cnMvdmlkZW8vZmJkZXYvY29yZS9mYm1lbS5vOmZibWVtLmM6KC50ZXh0KzB4MWJhYyk6IGZp
cnN0IGRlZmluZWQgaGVyZQ0KPj4+IGxkOiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJj
dnQubzogaW4gZnVuY3Rpb24gYGZiX21vZGVzZXR0aW5nX2Rpc2FibGVkJzoNCj4+PiBmYmN2
dC5jOigudGV4dCsweDApOiBtdWx0aXBsZSBkZWZpbml0aW9uIG9mIGBmYl9tb2Rlc2V0dGlu
Z19kaXNhYmxlZCc7IGRyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYm1lbS5vOmZibWVtLmM6
KC50ZXh0KzB4MWJhYyk6IGZpcnN0IGRlZmluZWQgaGVyZQ0KPj4+DQo+Pj4gQ2F1c2VkIGJ5
IGNvbW1pdA0KPj4+DQo+Pj4gICAgMGJhMmZhOGNiZDI5ICgiZmJkZXY6IEFkZCBzdXBwb3J0
IGZvciB0aGUgbm9tb2Rlc2V0IGtlcm5lbCBwYXJhbWV0ZXIiKQ0KPj4+DQo+Pj4gVGhpcyBi
dWlsZCBkb2VzIG5vdCBoYXZlIENPTkZJR19WSURFT19OT01PREVTRVQgc2V0Lg0KPj4+DQo+
Pj4gSSBhcHBsaWVkIHRoZSBmb2xsb3dpbmcgcGF0Y2ggZm9yIHRvZGF5Lg0KPj4+DQo+Pj4g
IEZyb20gNjNmOTU3YTA1MGM2MjQ3OGVkMTM0OGM1YjIwNGJjNjVjNjhkZjRkNyBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDENCj4+PiBGcm9tOiBTdGVwaGVuIFJvdGh3ZWxsIDxzZnJAY2Fu
Yi5hdXVnLm9yZy5hdT4NCj4+PiBEYXRlOiBUaHUsIDE3IE5vdiAyMDIyIDE4OjE5OjIyICsx
MTAwDQo+Pj4gU3ViamVjdDogW1BBVENIXSBmaXggdXAgZm9yICJmYmRldjogQWRkIHN1cHBv
cnQgZm9yIHRoZSBub21vZGVzZXQga2VybmVsIHBhcmFtZXRlciINCj4+Pg0KPj4+IFNpZ25l
ZC1vZmYtYnk6IFN0ZXBoZW4gUm90aHdlbGwgPHNmckBjYW5iLmF1dWcub3JnLmF1Pg0KPj4+
IC0tLQ0KPj4+ICAgaW5jbHVkZS9saW51eC9mYi5oIHwgMiArLQ0KPj4+ICAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+Pj4NCj4+PiBkaWZmIC0t
Z2l0IGEvaW5jbHVkZS9saW51eC9mYi5oIGIvaW5jbHVkZS9saW51eC9mYi5oDQo+Pj4gaW5k
ZXggM2E4MjJlNDM1N2IxLi5lYTQyMTcyNGY3MzMgMTAwNjQ0DQo+Pj4gLS0tIGEvaW5jbHVk
ZS9saW51eC9mYi5oDQo+Pj4gKysrIGIvaW5jbHVkZS9saW51eC9mYi5oDQo+Pj4gQEAgLTgw
Nyw3ICs4MDcsNyBAQCBleHRlcm4gaW50IGZiX2ZpbmRfbW9kZShzdHJ1Y3QgZmJfdmFyX3Nj
cmVlbmluZm8gKnZhciwNCj4+PiAgICNpZiBkZWZpbmVkKENPTkZJR19WSURFT19OT01PREVT
RVQpDQo+Pj4gICBib29sIGZiX21vZGVzZXR0aW5nX2Rpc2FibGVkKGNvbnN0IGNoYXIgKmRy
dm5hbWUpOw0KPj4+ICAgI2Vsc2UNCj4+PiAtYm9vbCBmYl9tb2Rlc2V0dGluZ19kaXNhYmxl
ZChjb25zdCBjaGFyICpkcnZuYW1lKQ0KPj4+ICtzdGF0aWMgaW5saW5lIGJvb2wgZmJfbW9k
ZXNldHRpbmdfZGlzYWJsZWQoY29uc3QgY2hhciAqZHJ2bmFtZSkNCj4+PiAgIHsNCj4+PiAg
ICAgICAgcmV0dXJuIGZhbHNlOw0KPj4+ICAgfQ0KPj4+IC0tDQo+Pj4gMi4zNS4xDQo+Pg0K
Pj4gVGhpcyBjb21taXQgd2VudCBhd2F5IGZvciBhIGNvdXBsZSBvZiBsaW51eC1uZXh0IHJl
bGVhc2VzLCBidXQgbm93IGhhcw0KPj4gcmVhcHBlYXJlZCBpbiB0aGUgZHJtIHRyZWUgOi0o
ICBXaGF0IHdlbnQgd3Jvbmc/DQo+IA0KPiBOb3RoaW5nIGdvbmUgd3JvbmcgYXMgc3VjaCwg
anVzdCB0aGUgZHJtLW1pc2MtbmV4dCBwdWxsIHJlcXVlc3Qgd2FzDQo+IHNlbnQgb24gYSBy
ZWd1bGFyIHdlZWtseSBjYWRlbmNlLCB0aGVuIEkgbWVyZ2VkIGl0IGEgZmV3IGRheXMgbGF0
ZXIuDQo+IFRoZSBmaXggZm9yIHRoaXMgaXMgc3RpbGwgaW4gdGhlIGRybS1taXNjLW5leHQg
cXVldWUgZm9yIHRoZSBuZXh0IFBSDQo+IHdoaWNoIEkgd2lsbCBnZXQgdGhpcyB3ZWVrLg0K
DQpUaGUgbmV4dCBQUiBzaG91bGQgYmUgZHJtLW1pc2MtbmV4dC1maXhlcy4gRllJIEkgZm9y
d2FyZGVkIHRoZSB0cmVlIGFuZCANCmNoZXJyeS1waWNrZWQgdGhlIHBhdGNoIGZyb20gZHJt
LW1pc2MtbmV4dC4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gRGF2ZS4NCj4g
DQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXIN
ClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwg
OTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpH
ZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------jVie6nt74P5DO9SS0jrl9C36--

--------------0osnNQKmu45Fkg3R03W9zLh8
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmN92r0FAwAAAAAACgkQlh/E3EQov+Ao
yxAApV5Ale3PHGkNbZlm9ihzVELP7Y3Tr8w1wbTqIgfRuwimAewSl8calZhvtKZc+vzw1bef86dg
PEOmZh+GQSS/iPGoRpt6I1Nix8NjXHdYQrEoQMZ3B52LHhVxzANcKo9r9+GbWxoYTP0letPjX4op
CTvabCLikxW7LofJYZkV19pzqDHGScewOlCMvDFuKUC5H1D0TSv8c7WEkxJilTPXRWOUpNc4lFNh
ub6+yDems3UF1woqzqZ8kG4gMflkFh5dHSmRzv+CicA39mUqvwToCB404APWoMIHgQqIqAqFvsCJ
t8GxDukRf6+dBbkW5IvQ+dlqhtnmFBZpK9kbMnixffUgelNX7aTu4nZsIpQ6pa+T7MsEQL+r+p76
VsqwFoNVB5o5AvXi5Dsd93Qf6pN4TBIzkEtNC0IHrVuh52Za7OpeDnFqvkvjRXv3yKUydx/R8OoU
3crz3RlYDfHYg5DGt5SrA43ax6EeKqj4jGdR3k7r41K1S/3kgKBZ/HL+R1ykWoGzWIijyRtiPC8c
1UgGR4lU7a1Vl0GkMm1dqlU3yPJbBwbYhL/TOVJvOcpl3P3M3nXw6M9TZiCgV1O3FUZwy3ni1gQf
SChPBuX4RWS7xuhBkmTAXixkryrShDzxWpluNkBA5yHMS7zxQN33gUUUVLQ11wnEuNf4kqRAQ1C+
/lk=
=ilOZ
-----END PGP SIGNATURE-----

--------------0osnNQKmu45Fkg3R03W9zLh8--
