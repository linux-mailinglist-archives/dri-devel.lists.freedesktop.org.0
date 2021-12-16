Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76276476E97
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 11:14:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CDE910E35F;
	Thu, 16 Dec 2021 10:14:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78A3510E35F
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 10:13:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E2F16212B6;
 Thu, 16 Dec 2021 10:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1639649637; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C9zkuW4vj62cZydLruN2DlMZ0uP/pbPyOAEvv0x7Vto=;
 b=XgDdaZaRgPQe0myadPEBt03inLUaM4d6UkSmYbqefe0d6NDTRj4H/RFJKYf2X/wwa1RrAK
 g46jV7m36MN/a36jvw28h4h0AWsn9dn5I7lpIoB8cLzT1ot+XlXdedTcgj6IwTKWjEZswP
 xx18SsWCjjwQ/1LX7UpOtK2bxGtvPw0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1639649637;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C9zkuW4vj62cZydLruN2DlMZ0uP/pbPyOAEvv0x7Vto=;
 b=IVC3mUjMjeQ2HsojqMFI0rqOxH35Qu2UsG+XbTzPRWkLGi/CGqjYD9qkhwYFn/mGfL168e
 +zzritYMgg/rUKBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A535C13DF8;
 Thu, 16 Dec 2021 10:13:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id zvhCJ2URu2FjGgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 16 Dec 2021 10:13:57 +0000
Message-ID: <1c7fc6c4-7941-682d-9675-425b04605f7f@suse.de>
Date: Thu, 16 Dec 2021 11:13:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v3 0/3] drm/simpledrm: Apple M1 / DT platform support fixes
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Hector Martin <marcan@marcan.st>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>
References: <20211212062407.138309-1-marcan@marcan.st>
 <4d16ff4b-4060-49df-805f-66d293ffa186@suse.de>
In-Reply-To: <4d16ff4b-4060-49df-805f-66d293ffa186@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------eYF1iziI7aQX0irnmnJKm7vw"
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
Cc: devicetree@vger.kernel.org, Javier Martinez Canillas <javier@dowhile0.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------eYF1iziI7aQX0irnmnJKm7vw
Content-Type: multipart/mixed; boundary="------------Z62ztZl0jHcNjlkYd7K00At9";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Hector Martin <marcan@marcan.st>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javier@dowhile0.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>
Message-ID: <1c7fc6c4-7941-682d-9675-425b04605f7f@suse.de>
Subject: Re: [PATCH v3 0/3] drm/simpledrm: Apple M1 / DT platform support
 fixes
References: <20211212062407.138309-1-marcan@marcan.st>
 <4d16ff4b-4060-49df-805f-66d293ffa186@suse.de>
In-Reply-To: <4d16ff4b-4060-49df-805f-66d293ffa186@suse.de>

--------------Z62ztZl0jHcNjlkYd7K00At9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTUuMTIuMjEgdW0gMTQ6Mjkgc2NocmllYiBUaG9tYXMgWmltbWVybWFubjoN
Cj4gSGkNCj4gDQo+IEFtIDEyLjEyLjIxIHVtIDA3OjI0IHNjaHJpZWIgSGVjdG9yIE1hcnRp
bjoNCj4+IEhpIERSTSBmb2xrcywNCj4+DQo+PiBUaGlzIHNob3J0IHNlcmllcyBtYWtlcyBz
aW1wbGVkcm0gd29yayBvbiBBcHBsZSBNMSAoaW5jbHVkaW5nIFByby9NYXgpDQo+PiBwbGF0
Zm9ybXMgdGhlIHdheSBzaW1wbGVmYiBhbHJlYWR5IGRvZXMsIGJ5IGFkZGluZyBYUkdCMjEw
MTAxMCBzdXBwb3J0DQo+PiBhbmQgbWFraW5nIGl0IGJpbmQgdG8gZnJhbWVidWZmZXJzIGlu
IC9jaG9zZW4gdGhlIHNhbWUgd2F5IHNpbXBsZWZiDQo+PiBkb2VzLg0KPj4NCj4+IFRoaXMg
YXZvaWRzIGJyZWFraW5nIHRoZSBib290bG9hZGVyLXByb3ZpZGVkIGZyYW1lYnVmZmVyIGNv
bnNvbGUgd2hlbg0KPj4gc2ltcGxlZHJtIGlzIHNlbGVjdGVkIHRvIHJlcGxhY2Ugc2ltcGxl
ZmIsIGFzIHRoZXNlIEZCcyBhbHdheXMgc2VlbSB0bw0KPj4gYmUgMTAtYml0IChhdCBsZWFz
dCB3aGVuIGEgcmVhbCBzY3JlZW4gaXMgYXR0YWNoZWQpLg0KPiANCj4gSWYgdGhlcmUgYXJl
IG5vIGZ1cnRoZXIgY29tbWVudHMsIEknbSBnb2luZyB0byBhcHBseSB0aGUgc2VyaWVzIHRv
IA0KPiBkcm0tbWlzYy1uZXh0Lg0KDQpJJ3ZlIGFkZGVkIHRoZSBzZXJpZXMuDQoNCkJlc3Qg
cmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IEJlc3QgcmVnYXJkcw0KPiBUaG9tYXMNCj4gDQo+
Pg0KPj4gQ2hhbmdlcyBzaW5jZSB2MjoNCj4+IC0gTWFkZSAxMC1iaXQgY29udmVyc2lvbiBj
b2RlIGZpbGwgdGhlIExTQnMNCj4+IC0gQWRkZWQgQVJHQjIxMDEwMTAgdG8gc3VwcG9ydGVk
IGZvcm1hdHMgbGlzdA0KPj4gLSBTaW1wbGlmaWVkIE9GIGNvcmUgY29kZSBwZXIgcmV2aWV3
IGZlZWRiYWNrDQo+PiBIZWN0b3IgTWFydGluICgzKToNCj4+IMKgwqAgb2Y6IE1vdmUgc2lt
cGxlLWZyYW1lYnVmZmVyIGRldmljZSBoYW5kbGluZyBmcm9tIHNpbXBsZWZiIHRvIG9mDQo+
PiDCoMKgIGRybS9mb3JtYXQtaGVscGVyOiBBZGQgZHJtX2ZiX3hyZ2I4ODg4X3RvX3hyZ2Iy
MTAxMDEwX3RvaW8oKQ0KPj4gwqDCoCBkcm0vc2ltcGxlZHJtOiBBZGQgW0FYXVJHQjIxMDEw
MTAgZm9ybWF0cw0KPj4NCj4+IMKgIGRyaXZlcnMvZ3B1L2RybS9kcm1fZm9ybWF0X2hlbHBl
ci5jIHwgNjQgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4+IMKgIGRyaXZlcnMv
Z3B1L2RybS90aW55L3NpbXBsZWRybS5jwqDCoMKgIHzCoCA0ICstDQo+PiDCoCBkcml2ZXJz
L29mL3BsYXRmb3JtLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA0ICsrDQo+
PiDCoCBkcml2ZXJzL3ZpZGVvL2ZiZGV2L3NpbXBsZWZiLmPCoMKgwqDCoMKgIHwgMjEgKy0t
LS0tLS0tLQ0KPj4gwqAgaW5jbHVkZS9kcm0vZHJtX2Zvcm1hdF9oZWxwZXIuaMKgwqDCoMKg
IHzCoCAzICsrDQo+PiDCoCA1IGZpbGVzIGNoYW5nZWQsIDc0IGluc2VydGlvbnMoKyksIDIy
IGRlbGV0aW9ucygtKQ0KPj4NCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBo
aWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkg
R21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2
ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------Z62ztZl0jHcNjlkYd7K00At9--

--------------eYF1iziI7aQX0irnmnJKm7vw
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmG7EWUFAwAAAAAACgkQlh/E3EQov+DD
iQ//XUN/4mfxi9I+9sLedCoShvZeOFabZFjAcpa8LR9fKKetE5ZED9Obch0FBQUxuF/JwLY7sp8m
VZ+7cmN35w7JbsOjM3p0Vr4fm1E+1WfQo34XKknt+PMjZLonVtF53MAkFjkU4Oo/OKNmXCXVkTB/
4vMsonxEo3/xaY7NBjWFimoTDHg3RPBFadyyxp2rUvFeC/hMCJxaFaLijQk+NBHMq3PMv4ez6qIa
cSwYui652L8sQzFXYdD+FTZasrD0hGOz0CcuWf4DPpDtkwC+3s5RyYFw4ox+ol+r+d5ie+WV4Ga+
A4Zk3cIZn7ZogkLVFp8It+um/LeCtRfoIESYQETQCFFdvWTExLaQnCh2+4WOVTj4TI6sUzKOd37d
A6yLSIm0xm7rxBtoq90GrjvLu5CdmxeSZknYPtLi+Spibf0e1CqDEpTe+dUApbFFxjTqDOUsAQXw
up5dPd8mVIivygm5ttjWoT3aGSlQFrqX5qVf4uFgo3yKBe8Kh9P+cuJ+UZ3nFrF3HhxsBfzWp9iN
wcos4uMnwmKTmOOoEnct3ffOZMUGlEM3y2w0lM1hNWmXD1sZyLzOh6S+1fC2EXNoEZ1rgS721FUt
cdbWqXdlZ2CEUwHD7nLG2xb8MlcGczEd1ty3fKBii6JvpKgQf+tBSw4b/0NJjDC2Z1J2ZR6IdfdF
BRg=
=5jtR
-----END PGP SIGNATURE-----

--------------eYF1iziI7aQX0irnmnJKm7vw--
