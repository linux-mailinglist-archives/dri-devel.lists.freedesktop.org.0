Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C86E755F927
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 09:37:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E868010EEB6;
	Wed, 29 Jun 2022 07:37:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD94810EEB6
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 07:37:15 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7B16A1FED5;
 Wed, 29 Jun 2022 07:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1656488234; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c38rTmVRyrSx1oBNtL796f9BN9YxlYF09UiyRnUGgEI=;
 b=lBJFXln3F0xGZj6/bBnZqwTcRbQG1Oag4OGNgNgDT39wOdLBwV1w4t+fNQhAUNUbEqcEKx
 lHeelZj9wTwS807UtkDtd05mE97oXS8jJd7bDC8lGyaXRvS72iWueBUSe6j67XAA6knjiK
 5I3Gkc+NlszCBEOWqrTLo18hai0lDgE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1656488234;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=c38rTmVRyrSx1oBNtL796f9BN9YxlYF09UiyRnUGgEI=;
 b=3+6z5JWrjw3chFGrznX9D3CvJxTA0NRgu7h/i3L+l6H8p3UxOCSlpshzq8YK/prj38vFkC
 ln4eU55SodE3EmDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2A3C4133D1;
 Wed, 29 Jun 2022 07:37:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id fRd7CSoBvGLrVAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 29 Jun 2022 07:37:14 +0000
Message-ID: <a2c1e02a-46e1-5d4e-bdba-f89e2ca4e6d1@suse.de>
Date: Wed, 29 Jun 2022 09:37:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 0/4] KUnit tests for RGB565 conversion
Content-Language: en-US
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 javierm@redhat.com
References: <20220627161132.33256-1-jose.exposito89@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220627161132.33256-1-jose.exposito89@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------OR00scsW6DGn0c2BN1eh7yrW"
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
Cc: dri-devel@lists.freedesktop.org, davidgow@google.com,
 magalilemes00@gmail.com, airlied@linux.ie, maira.canal@usp.br,
 dlatypov@google.com, linux-kernel@vger.kernel.org, tales.aparecida@gmail.com,
 isabbasso@riseup.net, kunit-dev@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------OR00scsW6DGn0c2BN1eh7yrW
Content-Type: multipart/mixed; boundary="------------RxlC47capXm6ucMCkv2KhgjT";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?B?Sm9zw6kgRXhww7NzaXRv?= <jose.exposito89@gmail.com>,
 javierm@redhat.com
Cc: davidgow@google.com, dlatypov@google.com, mripard@kernel.org,
 daniel@ffwll.ch, airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 jani.nikula@linux.intel.com, maira.canal@usp.br, isabbasso@riseup.net,
 magalilemes00@gmail.com, tales.aparecida@gmail.com,
 dri-devel@lists.freedesktop.org, kunit-dev@googlegroups.com,
 linux-kernel@vger.kernel.org
Message-ID: <a2c1e02a-46e1-5d4e-bdba-f89e2ca4e6d1@suse.de>
Subject: Re: [PATCH 0/4] KUnit tests for RGB565 conversion
References: <20220627161132.33256-1-jose.exposito89@gmail.com>
In-Reply-To: <20220627161132.33256-1-jose.exposito89@gmail.com>

--------------RxlC47capXm6ucMCkv2KhgjT
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjcuMDYuMjIgdW0gMTg6MTEgc2NocmllYiBKb3PDqSBFeHDDs3NpdG86DQo+
IEhlbGxvIGV2ZXJ5b25lLA0KPiANCj4gVGhpcyBzZXJpZXMgaXMgYSBmb2xsb3cgdXAgb2Yg
dGhlIFhSR0I4ODg4IHRvIFJHQjMzMiBjb252ZXJzaW9uIEtVbml0IHRlc3RzLg0KPiANCj4g
VGhlIGZpcnN0IDMgcGF0Y2hlcyByZWZhY3RvciB0aGUgZXhpc3RpbmcgdGVzdCB0byBtYWtl
IHRoZW0gYWdub3N0aWMgb2YgdGhlIHRhcmdldCBmb3JtYXQgYW5kIGFkZCBzdXBwb3J0IGZv
ciAic3dhYiIuDQo+IA0KPiBUaGUgbGFzdCBwYXRjaCBhZGRzIHRoZSBSR0I1NjUgY29udmVy
c2lvbiB2YWx1ZXMsIGFuZCBzaG93cyBob3cgbW9yZSBmb3JtYXRzIHdpbGwgYmUgZWFzaWx5
IGFkZGVkIGluIHRoZSBmdXR1cmUuDQoNClRoYW5rcyBmb3IgeW91ciBwYXRjaGVzLiBJIGhh
ZCBvbmUgY29tbWVudCBmb3IgdGhlIGZpbmFsIG9uZS4gV2l0aCB0aGlzIA0KZml4ZWQsIHlv
dSBjYW4gYWRkDQoNCkFja2VkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5A
c3VzZS5kZT4NCg0KdG8gdGhlIHNlcmllcy4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0K
PiANCj4gVGhhbmsgeW91IHZlcnkgbXVjaCBpbiBhZHZhbmNlIGZvciB5b3VyIGZlZWRiYWNr
LA0KPiBKb3PDqSBFeHDDs3NpdG8NCj4gDQo+IEpvc8OpIEV4cMOzc2l0byAoNCk6DQo+ICAg
IGRybS9mb3JtYXQtaGVscGVyOiBSZW5hbWUgdGVzdCBjYXNlcyB0byBtYWtlIHRoZW0gbW9y
ZSBnZW5lcmljDQo+ICAgIGRybS9mb3JtYXQtaGVscGVyOiBUcmFuc2Zvcm0gdGVzdHMgdG8g
YmUgYWdub3N0aWMgb2YgdGFyZ2V0IGZvcm1hdA0KPiAgICBkcm0vZm9ybWF0LWhlbHBlcjog
QWRkIHN1cHBvcnQgZm9yIGNvbnZlcnNpb24gZnVuY3Rpb25zIHdpdGggc3dhYg0KPiAgICBk
cm0vZm9ybWF0LWhlbHBlcjogQWRkIEtVbml0IHRlc3RzIGZvciBkcm1fZmJfeHJnYjg4ODhf
dG9fcmdiNTY1KCkNCj4gDQo+ICAgLi4uL2dwdS9kcm0vdGVzdHMvZHJtX2Zvcm1hdF9oZWxw
ZXJfdGVzdC5jICAgIHwgMjMxICsrKysrKysrKysrKysrKy0tLQ0KPiAgIDEgZmlsZSBjaGFu
Z2VkLCAxOTYgaW5zZXJ0aW9ucygrKSwgMzUgZGVsZXRpb25zKC0pDQo+IA0KPiANCj4gYmFz
ZS1jb21taXQ6IDZmZGU4ZWVjNzE3OTZmMzUzNGYwYzI3NDA2Njg2MjgyOTgxM2IyMWYNCj4g
cHJlcmVxdWlzaXRlLXBhdGNoLWlkOiA4YTE2ZjRjODAwNGQ2MTYxMDM1ZWFlYTI3NWM4ZWFm
YWEwYWM5MjdlDQo+IHByZXJlcXVpc2l0ZS1wYXRjaC1pZDogNTNmZGVkMmE0OWU2MjEyYjU0
NmRiNzZlYzUyNTYzYTY4Mzc1MmU2NQ0KPiBwcmVyZXF1aXNpdGUtcGF0Y2gtaWQ6IDI5NGIw
Y2EyN2E2ZWU1NzA5NmM4ZjA5N2MwNTcyMzM2YjhhMmQ1ODMNCj4gcHJlcmVxdWlzaXRlLXBh
dGNoLWlkOiA1ZTA1YmZjNTI4N2QxNmMyMDdiZmM2MTZiMjc3NmFkNzJlYjRhYjI5DQo+IHBy
ZXJlcXVpc2l0ZS1wYXRjaC1pZDogZTk0NTYwYmU4NWRmZmI2MmE1YjNjZjU4ZDFmMGZjM2Qy
NzhhZDgwNg0KPiBwcmVyZXF1aXNpdGUtcGF0Y2gtaWQ6IGE0NzFkZjM5YzdiMzJjNjlkZDJi
MTM4YTdkMGFmMDE1ZWE0MmUwMGENCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhp
Y3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBH
bWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4
MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------RxlC47capXm6ucMCkv2KhgjT--

--------------OR00scsW6DGn0c2BN1eh7yrW
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmK8ASkFAwAAAAAACgkQlh/E3EQov+Am
ghAApBcDFBDGX6r60lgjmBOeVSEOKgxXLkj41Hf9XSr7dJTiFfRVRASxmxayPDrZatlVyQvTL858
iiiHS5ZkiFX6CiM99AFU9FGNSSjGaoUHxwBiPY6VK/WuBDz+CYwygaF4X0nMh0RTuNq+VKISVrob
SmxK0ihvr5SvAQh/AIAKftb8Ec2PM8+CCBwXl713TveNg/i82S+KKSqoXj4DMcoWL0GhHUoOAMnY
xoJJNHLvAvgdL8EMBw0GnRL2WeXClgmHDsqc+o1x2PJYLepN3e5QTRm7SlEqtQvEC7JvZ+AUwCnj
+Ybxl/YYpOlVmpp3T1xvKXCZfv9mYbMHflBJTVc/rfecBBpvMS2/b/G7KB8dkPt1764b+xgJ6h0t
8GQyROTNFfuLzbXRqA05YRjmvoZFN9Dty0Sxjxp5sYQU8TN5cZ4+5k7XjbkguJqHe3Tv37nWhb+C
99ySrt74MeDKPa40vsSKJ3f/oeLp8W51E3o/6MqXqIszPxH3BxmATeKylF5Bvb6R2k6AGzgm0qaJ
y+y7sYNPAG+Cnf3LSiAU761BRaMbGppsbEtjj3p+KZeIf+80yj1yOHMpRY/WF7MVhVEV064IxayL
FylNgbcFI1Ab/PvEgcLUynPpHBqtZJFjo8KnTbRejBoOjxbLGhVrHoP3vmlCkkasrIfickvPSbER
/Mc=
=XYLY
-----END PGP SIGNATURE-----

--------------OR00scsW6DGn0c2BN1eh7yrW--
