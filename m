Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E40BB6FF1EA
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 14:53:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 057C010E1EC;
	Thu, 11 May 2023 12:53:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF2E810E1EC
 for <dri-devel@lists.freedesktop.org>; Thu, 11 May 2023 12:53:30 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E5A1A21C3E;
 Thu, 11 May 2023 12:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1683809608; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q57nowApJTPvcrb6Y7xTxsvUy6Mm+joXgzVju4TjPaw=;
 b=PlKZkUQoZoM9MK9T4uzUUp+RgSgqOJZw7HHmtL6dxkDQFqZxEkQ4DlP3EISHr0uvTjNX8F
 GTwIXbAjCWrz5b+ns5/tEsVvdT9reAr1hQIeE0wpclWiGL0ikJEdbnJV4N9qetSpIC2zq/
 9ummeVDbKaB4Xdxn2aw/+fZAq4A3Pt4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1683809608;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q57nowApJTPvcrb6Y7xTxsvUy6Mm+joXgzVju4TjPaw=;
 b=xo1O484x7t1DnQocRZWcr9pNMF2PBPPAV+J96qNVbWv8JE8+nEZPLq5qEjDDg1j+QUyxFI
 5Sj0HT6bSbgyTEAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CAC5C138FA;
 Thu, 11 May 2023 12:53:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ffigMEjlXGT7EgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 11 May 2023 12:53:28 +0000
Message-ID: <5a0a1ed1-3aa2-0026-52f7-60bd5dcba8b8@suse.de>
Date: Thu, 11 May 2023 14:53:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 00/15] fbdev: Remove trailing whitespaces
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, Javier Martinez Canillas <javierm@redhat.com>
References: <20230331092314.2209-1-tzimmermann@suse.de>
 <e2f54d17-debc-62f4-3644-8baea4a88b10@suse.de>
 <752f0e2b-e069-6221-1ee0-99306f2c718a@gmx.de>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <752f0e2b-e069-6221-1ee0-99306f2c718a@gmx.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------owcoLx6QOddydwDDgzsS5Q2f"
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------owcoLx6QOddydwDDgzsS5Q2f
Content-Type: multipart/mixed; boundary="------------QAGkNXj7Iw000KoTXyMj2rU5";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Message-ID: <5a0a1ed1-3aa2-0026-52f7-60bd5dcba8b8@suse.de>
Subject: Re: [PATCH 00/15] fbdev: Remove trailing whitespaces
References: <20230331092314.2209-1-tzimmermann@suse.de>
 <e2f54d17-debc-62f4-3644-8baea4a88b10@suse.de>
 <752f0e2b-e069-6221-1ee0-99306f2c718a@gmx.de>
In-Reply-To: <752f0e2b-e069-6221-1ee0-99306f2c718a@gmx.de>

--------------QAGkNXj7Iw000KoTXyMj2rU5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTEuMDUuMjMgdW0gMTQ6NTEgc2NocmllYiBIZWxnZSBEZWxsZXI6DQo+IEhp
IFRob21hcywNCj4gDQo+IE9uIDUvMTEvMjMgMTQ6MDgsIFRob21hcyBaaW1tZXJtYW5uIHdy
b3RlOg0KPj4gSSB0aG91Z2h0IHRoZXNlIHBhdGNoZXMgd291bGQgZ28gdGhyb3VnaCB0aGUg
ZmJkZXYgdHJlZSwgYnV0IEkgY291bGQNCj4+IG5vdCBmaW5kIHRoZW0gdjYuNC1yYzEuIFBs
ZWFzZSByZXZpZXcgdGhlIHJlbWFpbmluZyBvbmVzLCBzbyB0aGF0IEkNCj4+IGNhbiBtZXJn
ZSB0aGVtIHZpYSBkcm0tbWlzYy4NCj4gDQo+IFNvcnJ5LCBJIHRob3VnaHQgeW91IGhhZCBw
bGFubmVkIHRvIHRha2UgdGhlbSB0aHJvdWdoIGRybS1taXNjIGFueXdheSwNCj4gc28gSSBk
aWRuJ3QgYXBwbGllZCB0aGVtLg0KPiANCj4gSSBqdXN0IHJldmlld2VkIHRoZW0gYWdhaW4s
IGFuZCB5b3UgbWF5IGFkZCBteQ0KPiBBY2tlZC1ieTogSGVsZ2UgRGVsbGVyIDxkZWxsZXJA
Z214LmRlPg0KPiANCj4gQWx0ZXJuYXRpdmVseSBJIGNhbiBhcHBseSB0aGVtIG5vdyB0byBm
YmRldiBhbmQgc2VuZCB0aGVtIGZvciAtcmMyLg0KPiBKdXN0IGxldCBtZSBrbm93IHlvdXIg
cHJlZmVyZW5jZS4NCg0KUGxlYXNlIGRvLiBIYXZpbmcgdGhlbSBpbiAtcmMyIGlzIGV2ZW4g
YmV0dGVyLg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiBIZWxnZQ0KPiANCj4g
DQo+Pg0KPj4gQmVzdCByZWdhcmRzDQo+PiBUaG9tYXMNCj4+DQo+PiBBbSAzMS4wMy4yMyB1
bSAxMToyMiBzY2hyaWViIFRob21hcyBaaW1tZXJtYW5uOg0KPj4+IFRoZSB0cmFpbGluZyB3
aGl0ZXNwYWNlcyBhcmUgYW5ub3lpbmcuIFNvIHJlbW92ZSB0aGVtLiBObw0KPj4+IGZ1bmN0
aW9uYWwgY2hhbmdlcy4gU29tZSBvZiB0aGUgcGF0Y2hlcyBoYXMgYWxyZWFkeSBiZWVuDQo+
Pj4gYWNrZWQgYnkgSGVsZ2UuDQo+Pj4NCj4+PiBUaG9tYXMgWmltbWVybWFubiAoMTUpOg0K
Pj4+IMKgwqAgZmJkZXYvNjgzMjhmYjogUmVtb3ZlIHRyYWlsaW5nIHdoaXRlc3BhY2VzDQo+
Pj4gwqDCoCBmYmRldi9hdG1lbF9sY2RmYjogUmVtb3ZlIHRyYWlsaW5nIHdoaXRlc3BhY2Vz
DQo+Pj4gwqDCoCBmYmRldi9jZzE0OiBSZW1vdmUgdHJhaWxpbmcgd2hpdGVzcGFjZXMNCj4+
PiDCoMKgIGZiZGV2L2NvbnRyb2xmYjogUmVtb3ZlIHRyYWlsaW5nIHdoaXRlc3BhY2VzDQo+
Pj4gwqDCoCBmYmRldi9nMzY0ZmI6IFJlbW92ZSB0cmFpbGluZyB3aGl0ZXNwYWNlcw0KPj4+
IMKgwqAgZmJkZXYvaGdhZmI6IFJlbW92ZSB0cmFpbGluZyB3aGl0ZXNwYWNlcw0KPj4+IMKg
wqAgZmJkZXYvaHBmYjogUmVtb3ZlIHRyYWlsaW5nIHdoaXRlc3BhY2VzDQo+Pj4gwqDCoCBm
YmRldi9tYWNmYjogUmVtb3ZlIHRyYWlsaW5nIHdoaXRlc3BhY2VzDQo+Pj4gwqDCoCBmYmRl
di9tYXhpbmVmYjogUmVtb3ZlIHRyYWlsaW5nIHdoaXRlc3BhY2VzDQo+Pj4gwqDCoCBmYmRl
di9wOTEwMDogUmVtb3ZlIHRyYWlsaW5nIHdoaXRlc3BhY2VzDQo+Pj4gwqDCoCBmYmRldi9w
bGF0aW51bWZiOiBSZW1vdmUgdHJhaWxpbmcgd2hpdGVzcGFjZXMNCj4+PiDCoMKgIGZiZGV2
L3NhMTEwMGZiOiBSZW1vdmUgdHJhaWxpbmcgd2hpdGVzcGFjZXMNCj4+PiDCoMKgIGZiZGV2
L3N0aWZiOiBSZW1vdmUgdHJhaWxpbmcgd2hpdGVzcGFjZXMNCj4+PiDCoMKgIGZiZGV2L3Zh
bGt5cmllZmI6IFJlbW92ZSB0cmFpbGluZyB3aGl0ZXNwYWNlcw0KPj4+IMKgwqAgZmJkZXYv
dmZiOiBSZW1vdmUgdHJhaWxpbmcgd2hpdGVzcGFjZXMNCj4+Pg0KPj4+IMKgIGRyaXZlcnMv
dmlkZW8vZmJkZXYvNjgzMjhmYi5jwqDCoMKgwqAgfMKgIDEyICstLQ0KPj4+IMKgIGRyaXZl
cnMvdmlkZW8vZmJkZXYvYXRtZWxfbGNkZmIuYyB8wqDCoCAyICstDQo+Pj4gwqAgZHJpdmVy
cy92aWRlby9mYmRldi9jZzE0LmPCoMKgwqDCoMKgwqDCoCB8wqDCoCAyICstDQo+Pj4gwqAg
ZHJpdmVycy92aWRlby9mYmRldi9jb250cm9sZmIuY8KgwqAgfMKgIDM0ICsrKy0tLS0NCj4+
PiDCoCBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2czNjRmYi5jwqDCoMKgwqDCoCB8wqDCoCA2ICst
DQo+Pj4gwqAgZHJpdmVycy92aWRlby9mYmRldi9oZ2FmYi5jwqDCoMKgwqDCoMKgIHzCoCAz
NiArKystLS0tDQo+Pj4gwqAgZHJpdmVycy92aWRlby9mYmRldi9ocGZiLmPCoMKgwqDCoMKg
wqDCoCB8wqDCoCA4ICstDQo+Pj4gwqAgZHJpdmVycy92aWRlby9mYmRldi9tYWNmYi5jwqDC
oMKgwqDCoMKgIHzCoCAxMCArLQ0KPj4+IMKgIGRyaXZlcnMvdmlkZW8vZmJkZXYvbWF4aW5l
ZmIuY8KgwqDCoCB8wqDCoCAyICstDQo+Pj4gwqAgZHJpdmVycy92aWRlby9mYmRldi9wOTEw
MC5jwqDCoMKgwqDCoMKgIHzCoMKgIDQgKy0NCj4+PiDCoCBkcml2ZXJzL3ZpZGVvL2ZiZGV2
L3BsYXRpbnVtZmIuY8KgIHzCoCAzMCArKystLS0NCj4+PiDCoCBkcml2ZXJzL3ZpZGVvL2Zi
ZGV2L3NhMTEwMGZiLmPCoMKgwqAgfMKgIDMyICsrKy0tLQ0KPj4+IMKgIGRyaXZlcnMvdmlk
ZW8vZmJkZXYvc3RpZmIuY8KgwqDCoMKgwqDCoCB8IDE1NiArKysrKysrKysrKysrKystLS0t
LS0tLS0tLS0tLS0NCj4+PiDCoCBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3ZhbGt5cmllZmIuY8Kg
IHzCoCAxNCArLS0NCj4+PiDCoCBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3ZmYi5jwqDCoMKgwqDC
oMKgwqDCoCB8wqAgMTAgKy0NCj4+PiDCoCAxNSBmaWxlcyBjaGFuZ2VkLCAxNzkgaW5zZXJ0
aW9ucygrKSwgMTc5IGRlbGV0aW9ucygtKQ0KPj4+DQo+Pg0KPiANCg0KLS0gDQpUaG9tYXMg
WmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBT
b2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJu
YmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3RldiwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNE
b25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------QAGkNXj7Iw000KoTXyMj2rU5--

--------------owcoLx6QOddydwDDgzsS5Q2f
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmRc5UgFAwAAAAAACgkQlh/E3EQov+C2
oxAAr6Q/jY6ryrXBsi9dl6MxuYYCxMgZHPi2Nzu/QDBr8lI1rYUwFawJh+9PILqJX+5i9lRkrgGR
GrJ70WWAB/f2mBAZrT2Xa0xaJLYt9tJsPtvGRkWX1rCgUvUMhJho5xze6Zz4umysW33DILM2QzLE
N1aRpodLiaMM9TlEBEc8UZ1SLRyVo1CeDtWcaJFmk63BqaQ1tFVQYm7nwHkRbqeU8rtARWzulGxF
QOCBQGCjtSHec1ugJp5eSGGMtBmUto0xTT8FNl7po8MxuSNY1PF7phB7hkzxNRIhesJBwIcgcjW+
gHUFUeiZoJtN/u0N1asyQrlX55IjlrXMnTGwhCI+n2r3U2pMOjYaeEPU4PYmIj+bUAtnZ3hweSOO
6Fxx7YoDl6OzwlM0+8C2K3b5/0A82cRckifkleqSGQazCSNK1k8nMIPIikC+1lP9r9ttgify7ZbL
B7W1lXvi40LWhTzOYruUFaJYjG+WvjL+QY//oJeW5f64yeHTkh0Ufkoc9m7XZOwb1r9mh2ycYRoV
w2m3dB2uqoivmOrDKwZAufG45czraYGguZxxR8wI3JEpQ3k8Dbtl5x7ReKKhvpRKXteAzLQJ6M8Z
y3ndk208+x9CMsw/D6pJl6flTx/PsPu1ZM0Yvp329eRQ+1fwn6/Q9VgOciou/OqnelyTx3uoqnQ9
0go=
=DKnt
-----END PGP SIGNATURE-----

--------------owcoLx6QOddydwDDgzsS5Q2f--
