Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55064545BE0
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 07:51:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C469912AFC5;
	Fri, 10 Jun 2022 05:51:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EDD212AFC5
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 05:51:24 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id EE1CC220BF;
 Fri, 10 Jun 2022 05:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1654840282; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i1CE2gqZBO3aHwj3VKwM4ZfmOqqHUeaIHIP+GD1WsrY=;
 b=FUUKGiWMV5dEvnqpKkNHQrBHmnQWISLLqTPhw0GAgfxoyW/5Dezd4JpfrOWdjzY7v+rra0
 daj5KvJPsZUauo20vduZQEPVGDvl5FL8sQy0sOD1zuHLVJX0PbAO7xYRHP3fHc7U1ULUuS
 B5Epp+Mbq3VG6cYeVah/vv3ck7qJVOU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1654840282;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i1CE2gqZBO3aHwj3VKwM4ZfmOqqHUeaIHIP+GD1WsrY=;
 b=tQIxqyGYv5jOA7PSNs60+oy6IpiqbYl03Wcpf5OfVyuyyUEaZlLZ2LVL5/8+lclCXrNDPp
 HTPNzd1JmxeG19Cw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BB206132F1;
 Fri, 10 Jun 2022 05:51:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id B+SeLNrbomKvEwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 10 Jun 2022 05:51:22 +0000
Message-ID: <97ef8e74-5d5d-2f6d-1be0-e566099e2853@suse.de>
Date: Fri, 10 Jun 2022 07:51:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] staging: olpc_dcon: mark driver as broken
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20220609223424.907174-1-javierm@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220609223424.907174-1-javierm@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------fCcYL6yVIILU5fq9llbNbYPZ"
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
Cc: Jerry Lin <wahahab11@gmail.com>, Jens Frederich <jfrederich@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Helge Deller <deller@gmx.de>,
 linux-staging@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sam Ravnborg <sam@ravnborg.org>, Jon Nettleton <jon.nettleton@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------fCcYL6yVIILU5fq9llbNbYPZ
Content-Type: multipart/mixed; boundary="------------uoErhsz0fH0XzfW7ZOt7uJrc";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Sam Ravnborg <sam@ravnborg.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Jerry Lin <wahahab11@gmail.com>, Helge Deller <deller@gmx.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jens Frederich <jfrederich@gmail.com>,
 Jon Nettleton <jon.nettleton@gmail.com>, linux-staging@lists.linux.dev
Message-ID: <97ef8e74-5d5d-2f6d-1be0-e566099e2853@suse.de>
Subject: Re: [PATCH] staging: olpc_dcon: mark driver as broken
References: <20220609223424.907174-1-javierm@redhat.com>
In-Reply-To: <20220609223424.907174-1-javierm@redhat.com>

--------------uoErhsz0fH0XzfW7ZOt7uJrc
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDEwLjA2LjIyIHVtIDAwOjM0IHNjaHJpZWIgSmF2aWVyIE1hcnRpbmV6IENhbmls
bGFzOg0KPiBUaGUgY29tbWl0IGVlY2IzZTRlNWQ5ZCAoInN0YWdpbmc6IG9scGNfZGNvbjog
YWRkIE9MUEMgZGlzcGxheSBjb250cm9sbGVyDQo+IChEQ09OKSBzdXBwb3J0IikgYWRkZWQg
dGhpcyBkcml2ZXIgaW4gMjAxMCwgYW5kIGhhcyBiZWVuIGluIHN0YWdpbmcgc2luY2UNCj4g
dGhlbi4gSXQgd2FzIG1hcmtlZCBhcyBicm9rZW4gYXQgc29tZSBwb2ludCBiZWNhdXNlIGl0
IGRpZG4ndCBldmVuIGJ1aWxkDQo+IGJ1dCB0aGF0IGdvdCByZW1vdmVkIG9uY2UgdGhlIGJ1
aWxkIGlzc3VlcyB3ZXJlIGFkZHJlc3NlZC4NCj4gDQo+IEJ1dCBpdCBzZWVtcyB0aGF0IHRo
ZSB3b3JrIHRvIG1vdmUgdGhpcyBkcml2ZXIgb3V0IG9mIHN0YWdpbmcgaGFzIHN0YWxsZWQs
DQo+IHRoZSBsYXN0IG5vbi10cml2aWFsIGNoYW5nZSB0byBmaXggb25lIG9mIHRoZSBpdGVt
cyBtZW50aW9uZWQgaW4gaXRzIHRvZG8NCj4gZmlsZSB3YXMgY29tbWl0IGU0MDIxOWQ1ZTRi
MiAoInN0YWdpbmc6IG9scGNfZGNvbjogYWxsb3cgc2ltdWx0YW5lb3VzIFhPLTENCj4gYW5k
IFhPLTEuNSBzdXBwb3J0IikgaW4gMjAxOS4NCj4gDQo+IEFuZCBldmVuIGlmIHdvcmsgdG8g
ZGVzdGFnZSB0aGUgZHJpdmVyIGlzIHJlc3VtZWQsIHRoZSBmYmRldiBzdWJzeXN0ZW0gaGFz
DQo+IGJlZW4gZGVwcmVjYXRlZCBmb3IgYSBsb25nIHRpbWUgYW5kIGluc3RlYWQgaXQgc2hv
dWxkIGJlIHBvcnRlZCB0byBEUk0uDQo+IA0KPiBOb3cgdGhpcyBkcml2ZXIgaXMgcHJldmVu
dGluZyB0byBsYW5kIGEga2VybmVsIHdpZGUgY2hhbmdlLCB0aGF0IG1ha2VzIHRoZQ0KPiBu
dW1fcmVnaXN0ZXJlZF9mYiBzeW1ib2wgdG8gYmUgcHJpdmF0ZSB0byB0aGUgZmJtZW0uYyBm
aWxlLg0KPiANCj4gU28gbGV0J3MganVzdCBtYXJrIHRoZSBkcml2ZXIgYXMgYnJva2VuLiBT
b21lb25lIGNhbiB0aGVuIHdvcmsgb24gbWFraW5nDQo+IGl0IG5vdCBkZXBlbmQgb24gdGhl
IG51bV9yZWdpc3RlcmVkX2ZiIHN5bWJvbCwgYWxsb3dpbmcgdG8gZHJvcCB0aGUgYnJva2Vu
DQo+IGRlcGVuZGVuY3kgYWdhaW4uDQo+IA0KPiBTdWdnZXN0ZWQtYnk6IFNhbSBSYXZuYm9y
ZyA8c2FtQHJhdm5ib3JnLm9yZz4NCj4gU2lnbmVkLW9mZi1ieTogSmF2aWVyIE1hcnRpbmV6
IENhbmlsbGFzIDxqYXZpZXJtQHJlZGhhdC5jb20+DQoNCkFja2VkLWJ5OiBUaG9tYXMgWmlt
bWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCg0KPiAtLS0NCj4gDQo+ICAgZHJpdmVy
cy9zdGFnaW5nL29scGNfZGNvbi9LY29uZmlnIHwgMiArLQ0KPiAgIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvc3RhZ2luZy9vbHBjX2Rjb24vS2NvbmZpZyBiL2RyaXZlcnMvc3RhZ2luZy9vbHBj
X2Rjb24vS2NvbmZpZw0KPiBpbmRleCBkMWEwZGVhMDllZjAuLmQwYmEzNGNjMzJmNyAxMDA2
NDQNCj4gLS0tIGEvZHJpdmVycy9zdGFnaW5nL29scGNfZGNvbi9LY29uZmlnDQo+ICsrKyBi
L2RyaXZlcnMvc3RhZ2luZy9vbHBjX2Rjb24vS2NvbmZpZw0KPiBAQCAtMSw3ICsxLDcgQEAN
Cj4gICAjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wDQo+ICAgY29uZmlnIEZC
X09MUENfRENPTg0KPiAgIAl0cmlzdGF0ZSAiT25lIExhcHRvcCBQZXIgQ2hpbGQgRGlzcGxh
eSBDT050cm9sbGVyIHN1cHBvcnQiDQo+IC0JZGVwZW5kcyBvbiBPTFBDICYmIEZCDQo+ICsJ
ZGVwZW5kcyBvbiBPTFBDICYmIEZCICYmIEJST0tFTg0KPiAgIAlkZXBlbmRzIG9uIEkyQw0K
PiAgIAlkZXBlbmRzIG9uIEdQSU9fQ1M1NTM1ICYmIEFDUEkNCj4gICAJc2VsZWN0IEJBQ0tM
SUdIVF9DTEFTU19ERVZJQ0UNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3Mg
RHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJI
DQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDks
IEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------uoErhsz0fH0XzfW7ZOt7uJrc--

--------------fCcYL6yVIILU5fq9llbNbYPZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmKi29oFAwAAAAAACgkQlh/E3EQov+Dn
ww//ZknGsqmIS/vMyC8OrM7AevAEYaiH4dsdI1FFONjUGV7fnL0XtS0T+raH2zM9Wxa9W2iV+bfx
8dPMXynHw9gEZEKfOvxi0uNT0Lor8T5y1qqEajrQ3j4bFqLVumhaaA99aex8UyHlbw1+S0fp8zSe
0cGo6PeGqR+8j7+lHrf9Q1vyQIWAqDrKLSXTcbPTGAtjA1WjHc04rm8Thh4+Xx8q4Arc2qE5KxzJ
du+QENFVEaIpOXoGoMPsw/F/CacSQs51LfDkj/5JL7C002baEK95/cpl1nUh1kgUxtT8XrCc7bqp
qCk6RSKJmKM7ZUb6ThaQ7SRjRoer1+c6UNSbgllg/Z5m+WB1fWF7cNdE7SVe78SL0RTLiTgbelvy
iOu7Q/FsQByc6jUWk1X6gSd6p7LlVilL+Uf2EBudU2QokoTnXofQINkz/qYhH+9oZKnzgwAcl0K3
SQuxkLTwVnVgJtw2VGOdFGgT/gZ3iwrIhOcXicGDhabAkupatvniE2gYL7ZIDlMhnZ2dnNjvW/bW
GYucBrsAqVjSdvaPImAEuPK29imoKOCKLZnouqx75V2nvCxHuyG/e76DkVEy3N+uAe+57vf4EIyC
sBU93Et8jYI9byGiFeRErZZloJmOeippt0NwEhSYGO8YNlUzPsImurPpj1neWGpHP+AbmhJ0z648
fus=
=oIn+
-----END PGP SIGNATURE-----

--------------fCcYL6yVIILU5fq9llbNbYPZ--
