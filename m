Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02488565BA2
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jul 2022 18:20:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B614910E64F;
	Mon,  4 Jul 2022 16:15:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33BA110E04A
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jul 2022 12:30:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D6DE81FEE8;
 Mon,  4 Jul 2022 12:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1656937835; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jzAvWue2mD8LLe6p/Wz3cMVKIbvHu1J7k6b3g1wvm9U=;
 b=o2CL7GWzG5/4WZ+Ruc7Xuq6vV/XwCzx0WvvbgQDyl4YfdIMENp6hsZBYVBloaRpm/HLkKv
 L/ziurJPW3I0lVgSlcYOqMWjk9W7enW9tLX5N5oJ9TfYFE0sEb3jfB5hF0Avqgvc04jUBn
 ceh+vrX3ut5sTt/rWiFQ1Zwbhdcymq4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1656937835;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jzAvWue2mD8LLe6p/Wz3cMVKIbvHu1J7k6b3g1wvm9U=;
 b=g/yBTMo99ss/cNxRGFv90QN5WZD6yy1WuRPRK7OZiEHUzbcnB1MGj713tcYovUAghZRXbu
 MnIIg3pka8NOGHCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B79601342C;
 Mon,  4 Jul 2022 12:30:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id jSrRK2vdwmIyLQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 04 Jul 2022 12:30:35 +0000
Message-ID: <b90d5ae5-8629-8be8-6390-f22f97ec4f5e@suse.de>
Date: Mon, 4 Jul 2022 14:30:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/2] drm: Prevent drm_copy_field() to attempt copying a
 NULL pointer
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org
References: <20220701120755.2135100-1-javierm@redhat.com>
 <20220701120755.2135100-3-javierm@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220701120755.2135100-3-javierm@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------7fl45gdmarts0EtpUg1rXWqA"
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
Cc: David Airlie <airlied@linux.ie>, Peter Robinson <pbrobinson@gmail.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------7fl45gdmarts0EtpUg1rXWqA
Content-Type: multipart/mixed; boundary="------------JXFn07Kec09jcL7s06wenuGn";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Peter Robinson <pbrobinson@gmail.com>
Message-ID: <b90d5ae5-8629-8be8-6390-f22f97ec4f5e@suse.de>
Subject: Re: [PATCH 2/2] drm: Prevent drm_copy_field() to attempt copying a
 NULL pointer
References: <20220701120755.2135100-1-javierm@redhat.com>
 <20220701120755.2135100-3-javierm@redhat.com>
In-Reply-To: <20220701120755.2135100-3-javierm@redhat.com>

--------------JXFn07Kec09jcL7s06wenuGn
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDEuMDcuMjIgdW0gMTQ6MDcgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IFRoZSBkcm1fY29weV9maWVsZCgpIGhlbHBlciBpcyB1c2VkIHRvIGNvcHkg
c29tZSBzdHJ1Y3QgZHJtX2RyaXZlciBmaWVsZHMNCj4gdG8gdXNlcnNwYWNlIHRocm91Z2gg
dGhlIERSTV9JT0NUTF9WRVJTSU9OIGlvY3RsLiBCdXQgaXQgY291bGQgYmUgcG9zc2libGUN
Cj4gdGhhdCB0aGUgZHJpdmVyIGRpZG4ndCBzZXQgc29tZSBvZiB0aGUgZmllbGRzIGFuZCBh
cmUgaW5zdGVhZCBzZXQgdG8gTlVMTC4NCj4gDQo+IElmIHRoYXQgaXMgdGhlIGNhc2UsIHRo
ZSBkcm1fY29weV9maWVsZCgpIGF0dGVtcHRzIHRvIGNvcHkgYSBOVUxMIHBvaW50ZXI6DQo+
IA0KPiBbICsxMC4zOTU5NjZdIFVuYWJsZSB0byBoYW5kbGUga2VybmVsIGFjY2VzcyB0byB1
c2VyIG1lbW9yeSBvdXRzaWRlIHVhY2Nlc3Mgcm91dGluZXMgYXQgdmlydHVhbCBhZGRyZXNz
IDAwMDAwMDAwMDAwMDAwMDANCj4gWyAgKzAuMDEwOTU1XSBNZW0gYWJvcnQgaW5mbzoNCj4g
WyAgKzAuMDAyODM1XSAgIEVTUiA9IDB4MDAwMDAwMDA5NjAwMDAwNA0KPiBbICArMC4wMDM4
NzJdICAgRUMgPSAweDI1OiBEQUJUIChjdXJyZW50IEVMKSwgSUwgPSAzMiBiaXRzDQo+IFsg
ICswLjAwNTM5NV0gICBTRVQgPSAwLCBGblYgPSAwDQo+IFsgICswLjAwMzExM10gICBFQSA9
IDAsIFMxUFRXID0gMA0KPiBbICArMC4wMDMxODJdICAgRlNDID0gMHgwNDogbGV2ZWwgMCB0
cmFuc2xhdGlvbiBmYXVsdA0KPiBbICArMC4wMDQ5NjRdIERhdGEgYWJvcnQgaW5mbzoNCj4g
WyAgKzAuMDAyOTE5XSAgIElTViA9IDAsIElTUyA9IDB4MDAwMDAwMDQNCj4gWyAgKzAuMDAz
ODg2XSAgIENNID0gMCwgV25SID0gMA0KPiBbICArMC4wMDMwNDBdIHVzZXIgcGd0YWJsZTog
NGsgcGFnZXMsIDQ4LWJpdCBWQXMsIHBnZHA9MDAwMDAwMDExNWRhZDAwMA0KPiBbICArMC4w
MDY1MzZdIFswMDAwMDAwMDAwMDAwMDAwXSBwZ2Q9MDAwMDAwMDAwMDAwMDAwMCwgcDRkPTAw
MDAwMDAwMDAwMDAwMDANCj4gWyAgKzAuMDA2OTI1XSBJbnRlcm5hbCBlcnJvcjogT29wczog
OTYwMDAwMDQgWyMxXSBTTVANCj4gLi4uDQo+IFsgICswLjAxMTExM10gcHN0YXRlOiA4MDQw
MDAwNSAoTnpjdiBkYWlmICtQQU4gLVVBTyAtVENPIC1ESVQgLVNTQlMgQlRZUEU9LS0pDQo+
IFsgICswLjAwNzA2MV0gcGMgOiBfX3BpX3N0cmxlbisweDE0LzB4MTUwDQo+IFsgICswLjAw
Mzg5NV0gbHIgOiBkcm1fY29weV9maWVsZCsweDMwLzB4MWE0DQo+IFsgICswLjAwNDE1Nl0g
c3AgOiBmZmZmODAwMDA5NGIzYTUwDQo+IFsgICswLjAwMzM1NV0geDI5OiBmZmZmODAwMDA5
NGIzYTUwIHgyODogZmZmZjgwMDAwOTRiM2I3MCB4Mjc6IDAwMDAwMDAwMDAwMDAwNDANCj4g
WyAgKzAuMDA3MjQyXSB4MjY6IGZmZmY0NDM3NDNjMmJhMDAgeDI1OiAwMDAwMDAwMDAwMDAw
MDAwIHgyNDogMDAwMDAwMDAwMDAwMDA0MA0KPiBbICArMC4wMDcyNDNdIHgyMzogZmZmZjQ0
Mzc0M2MyYmEwMCB4MjI6IGZmZmY4MDAwMDk0YjNiNzAgeDIxOiAwMDAwMDAwMDAwMDAwMDAw
DQo+IFsgICswLjAwNzI0MV0geDIwOiAwMDAwMDAwMDAwMDAwMDAwIHgxOTogZmZmZjgwMDAw
OTRiM2I5MCB4MTg6IDAwMDAwMDAwMDAwMDAwMDANCj4gWyAgKzAuMDA3MjQxXSB4MTc6IDAw
MDAwMDAwMDAwMDAwMDAgeDE2OiAwMDAwMDAwMDAwMDAwMDAwIHgxNTogMDAwMGFhYWIxNGI5
YWY0MA0KPiBbICArMC4wMDcyNDFdIHgxNDogMDAwMDAwMDAwMDAwMDAwMCB4MTM6IDAwMDAw
MDAwMDAwMDAwMDAgeDEyOiAwMDAwMDAwMDAwMDAwMDAwDQo+IFsgICswLjAwNzIzOV0geDEx
OiAwMDAwMDAwMDAwMDAwMDAwIHgxMDogMDAwMDAwMDAwMDAwMDAwMCB4OSA6IGZmZmZhNTI0
YWQ2N2Q0ZDgNCj4gWyAgKzAuMDA3MjQyXSB4OCA6IDAxMDEwMTAxMDEwMTAxMDEgeDcgOiA3
ZjdmN2Y3ZjdmN2Y3ZjdmIHg2IDogNmM2ZTYyNjM2MDZlNzE0MQ0KPiBbICArMC4wMDcyMzld
IHg1IDogMDAwMDAwMDAwMDAwMDAwMCB4NCA6IDAwMDAwMDAwMDAwMDAwMDAgeDMgOiAwMDAw
MDAwMDAwMDAwMDAwDQo+IFsgICswLjAwNzI0MV0geDIgOiAwMDAwMDAwMDAwMDAwMDAwIHgx
IDogZmZmZjgwMDAwOTRiM2I5MCB4MCA6IDAwMDAwMDAwMDAwMDAwMDANCj4gWyAgKzAuMDA3
MjQwXSBDYWxsIHRyYWNlOg0KPiBbICArMC4wMDI0NzVdICBfX3BpX3N0cmxlbisweDE0LzB4
MTUwDQo+IFsgICswLjAwMzUzN10gIGRybV92ZXJzaW9uKzB4ODQvMHhhYw0KPiBbICArMC4w
MDM0NDhdICBkcm1faW9jdGxfa2VybmVsKzB4YTgvMHgxNmMNCj4gWyAgKzAuMDAzOTc1XSAg
ZHJtX2lvY3RsKzB4MjcwLzB4NTgwDQo+IFsgICswLjAwMzQ0OF0gIF9fYXJtNjRfc3lzX2lv
Y3RsKzB4YjgvMHhmYw0KPiBbICArMC4wMDM5NzhdICBpbnZva2Vfc3lzY2FsbCsweDc4LzB4
MTAwDQo+IFsgICswLjAwMzc5OV0gIGVsMF9zdmNfY29tbW9uLmNvbnN0cHJvcC4wKzB4NGMv
MHhmNA0KPiBbICArMC4wMDQ3NjddICBkb19lbDBfc3ZjKzB4MzgvMHg0Yw0KPiBbICArMC4w
MDMzNTddICBlbDBfc3ZjKzB4MzQvMHgxMDANCj4gWyAgKzAuMDAzMTg1XSAgZWwwdF82NF9z
eW5jX2hhbmRsZXIrMHgxMWMvMHgxNTANCj4gWyAgKzAuMDA0NDE4XSAgZWwwdF82NF9zeW5j
KzB4MTkwLzB4MTk0DQo+IFsgICswLjAwMzcxNl0gQ29kZTogOTI0MDJjMDQgYjIwMGMzZTgg
ZjEzZmMwOWYgNTQwMDA4OGMgKGE5NDAwYzAyKQ0KPiBbICArMC4wMDYxODBdIC0tLVsgZW5k
IHRyYWNlIDAwMDAwMDAwMDAwMDAwMDAgXS0tLQ0KPiANCj4gUmVwb3J0ZWQtYnk6IFBldGVy
IFJvYmluc29uIDxwYnJvYmluc29uQGdtYWlsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogSmF2
aWVyIE1hcnRpbmV6IENhbmlsbGFzIDxqYXZpZXJtQHJlZGhhdC5jb20+DQo+IC0tLQ0KPiAN
Cj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX2lvY3RsLmMgfCA0ICsrKysNCj4gICAxIGZpbGUg
Y2hhbmdlZCwgNCBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2RybV9pb2N0bC5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9pb2N0bC5jDQo+IGlu
ZGV4IGUxYjlhMDNlNjE5Yy4uZGFjYWRkYzU5YzgyIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vZHJtX2lvY3RsLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9pb2N0
bC5jDQo+IEBAIC00NzQsNiArNDc0LDEwIEBAIHN0YXRpYyBpbnQgZHJtX2NvcHlfZmllbGQo
Y2hhciBfX3VzZXIgKmJ1Ziwgc2l6ZV90ICpidWZfbGVuLCBjb25zdCBjaGFyICp2YWx1ZSkN
Cj4gICB7DQo+ICAgCXNpemVfdCBsZW47DQo+ICAgDQo+ICsJLyogZG9uJ3QgYXR0ZW1wdCB0
byBjb3B5IGEgTlVMTCBwb2ludGVyICovDQo+ICsJaWYgKFdBUk5fT05DRSghdmFsdWUsICJC
VUc6IHRoZSB2YWx1ZSB0byBjb3B5IHdhcyBub3Qgc2V0ISIpKQ0KPiArCQlyZXR1cm4gLUVJ
TlZBTDsNCj4gKw0KDQpXZSB1c3VhbGx5IGFzc3VtZSB0aGF0IHRoZSBjYWxsZXIgcGFzc2Vz
IHRoZSBjb3JyZWN0IGFyZ3VtZW50cy4gVGhpcyBpcyANCmRpZmZlcmVudCBmb3Igbm8gcmVh
c29ucy4gSSdkIHJhdGhlciBub3QgdGFrZSB0aGlzIHBhdGNoIHVubGVzcyB0aGVyZSdzIA0K
YSBzZWN1cml0eSBpbXBsaWNhdGlvbiB0byB0aGUgaW9jdGwgaW50ZXJmYWNlIChlLmcuLCBs
ZWFraW5nIGluZm9ybWF0aW9uIA0KYmVjYXVzZSBvZiB0aGlzIE5VTEwgcHRyKS4NCg0KQmVz
dCByZWdhcmRzDQpUaG9tYXMNCg0KDQo+ICAgCS8qIGRvbid0IG92ZXJmbG93IHVzZXJidWYg
Ki8NCj4gICAJbGVuID0gc3RybGVuKHZhbHVlKTsNCj4gICAJaWYgKGxlbiA+ICpidWZfbGVu
KQ0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVy
DQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUs
IDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0K
R2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------JXFn07Kec09jcL7s06wenuGn--

--------------7fl45gdmarts0EtpUg1rXWqA
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmLC3WsFAwAAAAAACgkQlh/E3EQov+BN
Lw/+OMfvZ/NgIcQB78CtiGjXxPFVdVUikj/7TAG+yjezBmwZyZtktNx6D1QloIIYVddiwKQK/RzF
RbbM9Pza6/PSr129ckzuANfPMnvBdbWLY1V4w3adN1nxPLwHmhpt868cCrjDu4XS17OwvJ4FWM/0
4ynANZCt52eC4lO716pqVwFgaYi/HN7j0de5Hi+gRlIpByyjrSCZWd9EGD2TJJ/k7xYZrhKgGoRb
3P0tXaKQj9PEU5iqYvm7KNgB3ggxWIs5jNyPd7KF2kXZR6De7V6c9iABqSySmS62uWbyMn7AWsfO
pj54RfMB7RyFdfucgOmFbiusXNYe29nid+tOnD/o6LKwLDWnz/YXeKcK4zDGP56AZT/c+2OPtlyl
oYaMIgPteLsfHhcroBLsoAQZMqeRVwzfjEue1d8wrn0aJjSkkFwxP9fC5CS84HzO2qrulYfInm/W
AtJ3SYYUJKC4212YBmjiBWLMjC/0CpFrYFUzjOWJmaOC2g6LJB8ZzRpOWlChaateytQzGZVcBGYW
0ZXSJL9EIeYBEKr4k7etaQk2Lgq9jE7JwUBEwYfOR1FZEurx+kgPXUPGHEdT2dEc7ewB8cOEcG6t
4IzfxYXUDxKuav8vuCDl58PQq4hxxys0e5AimtGnYHXCubNPgQAG7Yv0Dcoea1n5ELkJuaRBCrN5
a6A=
=NJaL
-----END PGP SIGNATURE-----

--------------7fl45gdmarts0EtpUg1rXWqA--
