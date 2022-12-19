Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BA9651016
	for <lists+dri-devel@lfdr.de>; Mon, 19 Dec 2022 17:15:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FD3D10E231;
	Mon, 19 Dec 2022 16:15:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71B1010E2C3
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Dec 2022 16:15:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id CC8DB5D160;
 Mon, 19 Dec 2022 16:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1671466500; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fcEWs24V4GQYuX6IlAnsDTTiinUov6gzWt2OSBl0ibg=;
 b=fwpK/UqXKyia5JRi6tKI+OiCScTP/bMLDV+2E9U5TLOwrGYUT1uq/Gkw4arZYu7wgevlfA
 3VAqT3p8TOKTYin4rIr7ZAEYrltlQAuEG4M+mYOxf1VFKDf+Y70UjgE0OPMjFbkrlfIbK3
 Lqe+ajA+IhaQz/dMhP92aNIdvzca1kQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1671466500;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fcEWs24V4GQYuX6IlAnsDTTiinUov6gzWt2OSBl0ibg=;
 b=Astx/XyuYH9GG+cL9b+xN/0zpVC0gol1t3UuJfcxGTAS9PlDUwpTNNLN+NgOygJ53SHwkR
 g8s+EIGoi0g992AA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A9BA213910;
 Mon, 19 Dec 2022 16:15:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gZu0KASOoGMeawAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 19 Dec 2022 16:15:00 +0000
Message-ID: <66e0d14a-bc95-72d6-b1a7-0337a9540579@suse.de>
Date: Mon, 19 Dec 2022 17:15:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] drm: Replace DRM_INFO() with pr_info()
Content-Language: en-US
To: Siddh Raman Pant <code@siddh.me>
References: <20221219142319.79827-1-code@siddh.me>
 <0693327a-4951-6864-12c6-88cfe81abd12@suse.de>
 <1852b054022.16e87c6b116450.6116081892972417758@siddh.me>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <1852b054022.16e87c6b116450.6116081892972417758@siddh.me>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------JCaajjOZnvsJ6YOtWAg0ZMvS"
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
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------JCaajjOZnvsJ6YOtWAg0ZMvS
Content-Type: multipart/mixed; boundary="------------P0u0E37vgk196KORx010DQw4";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Siddh Raman Pant <code@siddh.me>
Cc: maarten lankhorst <maarten.lankhorst@linux.intel.com>,
 maxime ripard <mripard@kernel.org>, david airlie <airlied@gmail.com>,
 daniel vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Message-ID: <66e0d14a-bc95-72d6-b1a7-0337a9540579@suse.de>
Subject: Re: [PATCH] drm: Replace DRM_INFO() with pr_info()
References: <20221219142319.79827-1-code@siddh.me>
 <0693327a-4951-6864-12c6-88cfe81abd12@suse.de>
 <1852b054022.16e87c6b116450.6116081892972417758@siddh.me>
In-Reply-To: <1852b054022.16e87c6b116450.6116081892972417758@siddh.me>

--------------P0u0E37vgk196KORx010DQw4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTkuMTIuMjIgdW0gMTY6MzQgc2NocmllYiBTaWRkaCBSYW1hbiBQYW50Og0K
PiBPbiBNb24sIDE5IERlYyAyMDIyIDIwOjI3OjQ1ICswNTMwLCBUaG9tYXMgWmltbWVybWFu
biB3cm90ZToNCj4+IEhpDQo+Pg0KPj4gQW0gMTkuMTIuMjIgdW0gMTU6MjMgc2NocmllYiBT
aWRkaCBSYW1hbiBQYW50Og0KPj4+IExpbmUgNTM2IG9mIGRybV9wcmludC5oIHNheXMgRFJN
X0lORk8oKSBpcyBkZXByZWNhdGVkDQo+Pj4gaW4gZmF2b3Igb2YgcHJfaW5mbygpLg0KPj4N
Cj4+IFRoYXQncyBhIG1pc2xlYWRpbmcgY29tbWVudC4gRFJNX0lORk8oKSBpcyBkZXByZWNh
dGVkIGZvciBkcm1faW5mbygpLg0KPj4gcHJfaW5mbygpIGV0IGFsIGlzIG9ubHkgdG8gYmUg
dXNlZCBvZiB5b3UgZG9uJ3QgaGF2ZSBhIGRldiBwb2ludGVyLg0KPj4NCj4+IEJlc3QgcmVn
YXJkcw0KPj4gVGhvbWFzDQo+IA0KPiBNYXliZSB5b3UgYXJlIGNvbmZ1c2luZyBpdCB3aXRo
IERSTV9ERVZfSU5GTz8gSXQgdGFrZXMgdGhlIGRldiBwb2ludGVyLA0KPiBhbmQgaXMgaW5k
ZWVkIHRvbGQgdG8gYmUgZGVwcmVjYXRlZCBpbiBmYXZvdXIgb2YgZHJtX2luZm8oKSBpbiB0
aGUNCj4gY29tbWVudHMgKHNlZSBsaW5lIDM5NCkuDQo+IA0KPiBEUk1fSU5GTyBpcyBhIHNl
cGFyYXRlIG1hY3JvIGZvciBwcmludGluZyBzdHVmZiwgYW5kIGRvZXMgbm90IHRha2UgdGhl
DQo+IGRldiBwb2ludGVyLiBUaGV5IHNlZW0gdG8gYmUgZWFybHkgd3JhcHBlcnMgZm9yIHBy
aW50aywgSSBndWVzcyB3aGVuDQo+IHByX2luZm8gZGlkIG5vdCBleGlzdC4gQW5kIGFsbCB0
aGV5IGRvIGRpZmZlcmVudCBmcm9tIHByX2luZm8gaXMgdG8gYWRkDQo+IERSTV9OQU1FICh3
aGljaCBzZWVtcyB0byBiZSBqdXN0ICJkcm0iKSBpbiBmcm9udCBvZiB0aGUgc3RyaW5nLg0K
DQpUaGUgRFJNXyBwcmludCBtYWNyb3MgaW4gY2FwaXRhbCBsZXR0ZXJzIGFyZSBkZXByZWNh
dGVkIEFGQUlLLiBJbiBjYXNlcyANCndoZXJlIGEgZGV2IHBvaW50ZXIgaXMgYXZhaWxhYmxl
LCB1c2luZyBkcm1faW5mbygpIGV0IGFsLiBpcyBwcmVmZXJyZWQgDQpvdmVyIHByX2luZm8o
KS4NCg0KSW4gdGhlIGNvbnRleHQgb2YgeW91ciBwYXRjaCwgeW91IHNob3VsZCB1c2UgZHJt
X2luZm8oKSBpbiANCmRybV9jbGllbnRfdGFyZ2V0X2Nsb25lZCgpLCBhcyBpcyBnZXRzIGEg
ZGV2IHBvaW50ZXIgYXMgaXRzIGZpcnN0IA0KYXJndW1lbnQuIEluIG1vc3QgdGhlIG90aGVy
IGNhc2VzIGZyb20geW91ciBwYXRjaCwgeW91IGNhbiBnZXQgdGhlIGRldiANCnBvaW50ZXIg
ZnJvbSBjb25uZWN0b3ItPmRldi4NCg0KVGhlIGZpbmFsIGNhc2UsIGRybV9sZWdhY3lfcGNp
X2V4aXQoKSwgdGhlcmUncyBubyBkZXYgcG9pbnRlciwgc28geW91IA0KY2FuIHVzZSBwcl9p
bmZvKCkgdGhlcmUuIEknZCByZW1vdmUgJ1tkcm1dJyBmcm9tIHRoZSBzdHJpbmcuIFdlIGRv
bid0IA0KdXNlIHRoaXMgbXVjaCBlbHNld2hlcmUuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFz
DQoNCj4gDQo+IFRoYW5rcywNCj4gU2lkZGgNCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0K
R3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2Vy
bWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihI
UkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYN
Cg==

--------------P0u0E37vgk196KORx010DQw4--

--------------JCaajjOZnvsJ6YOtWAg0ZMvS
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmOgjgQFAwAAAAAACgkQlh/E3EQov+B/
ZQ/+LvsArqHVgP5+e5AYjR5IYxN//bcatJebYVhbJB4gRGpoa+ElyTgYKc6rB+JHoR++oL0btvdO
lH7Ag/qcW3ZzxT9LqW5j3kiE1e6LQkioHZD6mIJq+vDu2nb4cx/liDqBWM7gE6oIqBUBcNsa9vZM
eSLph21pE7bOetHu1q1t74kk5Y7tCu8lFa6ylm8vkYJM6MiAdXuZcqkuuxaw1ZkJPzf/zraAUJjE
L+z3XKlH9y6ncgptEvWh+2e3YjCAkbhoSi+bUAHgLFRAOQNiLYaeWyAyq+C5JL4TdWPBxQosOZjw
IDB6qGnPwU9k7TLDWLcmEBaeJ2MLo8R/i3wvo6orO9h3Rj3vYzmZAcB2RaJCLolPDNBPT1LAWIZp
IogNf+FbCms4EeGTnf8KTiTrrawD+hJabp2y3+eRptAN2pBzpQfz/hZThmZrTvoo3VKUozbFUr5N
DtUrGgvSEokQrz9ztWd9y4PRahqrWCjMdfMBkb+pZ+TINE5gP2jfs1zHrsFxZWjxE5IGJWUNEe1N
mtfTAleaYzMkFDQRO8uLfHNlreInnGQJdnHJUeXGIBCxBuscVLODeDbSYXt9J2GYaVV7SOBGgDqT
0om3n6aSibaN9Vtyo2lTNrNHgrcOxuoPoePosmSEPSM2S7/MZy98MM0kLY6oczGf/UCC+lQxnFGb
H1c=
=7PGE
-----END PGP SIGNATURE-----

--------------JCaajjOZnvsJ6YOtWAg0ZMvS--
