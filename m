Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5305E745C2A
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jul 2023 14:23:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1D1110E211;
	Mon,  3 Jul 2023 12:23:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E22910E211
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 12:23:50 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 3301D1FE04;
 Mon,  3 Jul 2023 12:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1688387026; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cEwdhD/n1Nx72ImgbdEIvjpn3giyL22vCP3qre0aSDM=;
 b=TT/5vfmH7AUufSolN0r/Da0EBIfjSiWOwvMTHDucQOG9vvZx6ZXWw/zI+y0DlfYAJCsR9B
 RJnS2Y8qfWd1io52UDJTDYyh8WAh4nIACklnH5vhryXrT9PsNgBde68m8Ekoz2joHkCCUo
 I6g/JaXoh8dCnaqOC9OKXz9yNO0rWPY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1688387026;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=cEwdhD/n1Nx72ImgbdEIvjpn3giyL22vCP3qre0aSDM=;
 b=8rdsKNzS7jGs4THcL976LmDl/VcsZEfS9aShgTT4hQ+MxYv5YG9Xmt833VwvIqQD4Do9wY
 EpVGCmEHUd1RDrDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F38FA138FC;
 Mon,  3 Jul 2023 12:23:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id EoHeOdG9omS5dAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 03 Jul 2023 12:23:45 +0000
Message-ID: <81c65106-cabf-1f44-fdd2-6c716ab2ba32@suse.de>
Date: Mon, 3 Jul 2023 14:23:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 03/24] drm/gud: use vmalloc_array and vcalloc
Content-Language: en-US
To: Julia Lawall <Julia.Lawall@inria.fr>, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?=
 <noralf@tronnes.org>
References: <20230627144339.144478-1-Julia.Lawall@inria.fr>
 <20230627144339.144478-4-Julia.Lawall@inria.fr>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230627144339.144478-4-Julia.Lawall@inria.fr>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------095I0EuT7U9cVQFoiTUQRAmv"
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
Cc: keescook@chromium.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 christophe.jaillet@wanadoo.fr, kuba@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------095I0EuT7U9cVQFoiTUQRAmv
Content-Type: multipart/mixed; boundary="------------57yg0V02n09MrsJfOg0ySq0p";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Julia Lawall <Julia.Lawall@inria.fr>, =?UTF-8?Q?Noralf_Tr=c3=b8nnes?=
 <noralf@tronnes.org>
Cc: keescook@chromium.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 christophe.jaillet@wanadoo.fr, kuba@kernel.org
Message-ID: <81c65106-cabf-1f44-fdd2-6c716ab2ba32@suse.de>
Subject: Re: [PATCH v2 03/24] drm/gud: use vmalloc_array and vcalloc
References: <20230627144339.144478-1-Julia.Lawall@inria.fr>
 <20230627144339.144478-4-Julia.Lawall@inria.fr>
In-Reply-To: <20230627144339.144478-4-Julia.Lawall@inria.fr>

--------------57yg0V02n09MrsJfOg0ySq0p
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDI3LjA2LjIzIHVtIDE2OjQzIHNjaHJpZWIgSnVsaWEgTGF3YWxsOg0KPiBVc2Ug
dm1hbGxvY19hcnJheSBhbmQgdmNhbGxvYyB0byBwcm90ZWN0IGFnYWluc3QNCj4gbXVsdGlw
bGljYXRpb24gb3ZlcmZsb3dzLg0KPiANCj4gVGhlIGNoYW5nZXMgd2VyZSBkb25lIHVzaW5n
IHRoZSBmb2xsb3dpbmcgQ29jY2luZWxsZQ0KPiBzZW1hbnRpYyBwYXRjaDoNCj4gDQo+IC8v
IDxzbXBsPg0KPiBAaW5pdGlhbGl6ZTpvY2FtbEANCj4gQEANCj4gDQo+IGxldCByZW5hbWUg
YWxsb2MgPQ0KPiAgICBtYXRjaCBhbGxvYyB3aXRoDQo+ICAgICAgInZtYWxsb2MiIC0+ICJ2
bWFsbG9jX2FycmF5Ig0KPiAgICB8ICJ2emFsbG9jIiAtPiAidmNhbGxvYyINCj4gICAgfCBf
IC0+IGZhaWx3aXRoICJ1bmtub3duIg0KPiANCj4gQEANCj4gICAgICBzaXplX3QgZTEsZTI7
DQo+ICAgICAgY29uc3RhbnQgQzEsIEMyOw0KPiAgICAgIGV4cHJlc3Npb24gRTEsIEUyLCBD
T1VOVCwgeDEsIHgyLCB4MzsNCj4gICAgICB0eXBlZGVmIHU4Ow0KPiAgICAgIHR5cGVkZWYg
X191ODsNCj4gICAgICB0eXBlIHQgPSB7dTgsX191OCxjaGFyLHVuc2lnbmVkIGNoYXJ9Ow0K
PiAgICAgIGlkZW50aWZpZXIgYWxsb2MgPSB7dm1hbGxvYyx2emFsbG9jfTsNCj4gICAgICBm
cmVzaCBpZGVudGlmaWVyIHJlYWxsb2MgPSBzY3JpcHQ6b2NhbWwoYWxsb2MpIHsgcmVuYW1l
IGFsbG9jIH07DQo+IEBADQo+IA0KPiAoDQo+ICAgICAgICBhbGxvYyh4MSp4Mip4MykNCj4g
fA0KPiAgICAgICAgYWxsb2MoQzEgKiBDMikNCj4gfA0KPiAgICAgICAgYWxsb2MoKHNpemVv
Zih0KSkgKiAoQ09VTlQpLCAuLi4pDQo+IHwNCj4gLSAgICAgYWxsb2MoKGUxKSAqIChlMikp
DQo+ICsgICAgIHJlYWxsb2MoZTEsIGUyKQ0KPiB8DQo+IC0gICAgIGFsbG9jKChlMSkgKiAo
Q09VTlQpKQ0KPiArICAgICByZWFsbG9jKENPVU5ULCBlMSkNCj4gfA0KPiAtICAgICBhbGxv
YygoRTEpICogKEUyKSkNCj4gKyAgICAgcmVhbGxvYyhFMSwgRTIpDQo+ICkNCj4gLy8gPC9z
bXBsPg0KPiANCj4gU2lnbmVkLW9mZi1ieTogSnVsaWEgTGF3YWxsIDxKdWxpYS5MYXdhbGxA
aW5yaWEuZnI+DQoNClJldmlld2VkLWJ5OiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1h
bm5Ac3VzZS5kZT4NCg0KPiANCj4gLS0tDQo+IHYyOiBVc2Ugdm1hbGxvY19hcnJheSBhbmQg
dmNhbGxvYyBpbnN0ZWFkIG9mIGFycmF5X3NpemUuDQo+IFRoaXMgYWxzbyBsZWF2ZXMgYSBt
dWx0aXBsaWNhdGlvbiBvZiBhIGNvbnN0YW50IGJ5IGEgc2l6ZW9mDQo+IGFzIGlzLiAgVHdv
IHBhdGNoZXMgYXJlIHRodXMgZHJvcHBlZCBmcm9tIHRoZSBzZXJpZXMuDQo+IA0KPiAgIGRy
aXZlcnMvZ3B1L2RybS9ndWQvZ3VkX3BpcGUuYyB8ICAgIDIgKy0NCj4gICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRpZmYgLXUgLXAg
YS9kcml2ZXJzL2dwdS9kcm0vZ3VkL2d1ZF9waXBlLmMgYi9kcml2ZXJzL2dwdS9kcm0vZ3Vk
L2d1ZF9waXBlLmMNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2d1ZC9ndWRfcGlwZS5jDQo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9ndWQvZ3VkX3BpcGUuYw0KPiBAQCAtMzkwLDcgKzM5
MCw3IEBAIHN0YXRpYyBpbnQgZ3VkX2ZiX3F1ZXVlX2RhbWFnZShzdHJ1Y3QgZ3UNCj4gICAJ
bXV0ZXhfbG9jaygmZ2RybS0+ZGFtYWdlX2xvY2spOw0KPiAgIA0KPiAgIAlpZiAoIWdkcm0t
PnNoYWRvd19idWYpIHsNCj4gLQkJZ2RybS0+c2hhZG93X2J1ZiA9IHZ6YWxsb2MoZmItPnBp
dGNoZXNbMF0gKiBmYi0+aGVpZ2h0KTsNCj4gKwkJZ2RybS0+c2hhZG93X2J1ZiA9IHZjYWxs
b2MoZmItPnBpdGNoZXNbMF0sIGZiLT5oZWlnaHQpOw0KPiAgIAkJaWYgKCFnZHJtLT5zaGFk
b3dfYnVmKSB7DQo+ICAgCQkJbXV0ZXhfdW5sb2NrKCZnZHJtLT5kYW1hZ2VfbG9jayk7DQo+
ICAgCQkJcmV0dXJuIC1FTk9NRU07DQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpH
cmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJt
YW55IEdtYkgNCkZyYW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJnLCBHZXJtYW55
DQpHRjogSXZvIFRvdGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGll
biBNb2VybWFuDQpIUkIgMzY4MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------57yg0V02n09MrsJfOg0ySq0p--

--------------095I0EuT7U9cVQFoiTUQRAmv
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSivdEFAwAAAAAACgkQlh/E3EQov+Cb
ug/+Lqmo8Vy3nHNfsOi8C6S16t6VbjNlBN8Y/3h0Fy2jBxvnu90znhH20dlZfDv4jpeXxU/8eTn7
ZDfZFjoWvkr4rM9xw/zsCmDDllKk8+HukOyK+ApnW5dG9tRnIB9dgHGK0az/Lpb7VShyRRW2CSjs
bAjqfKvSEBIbxzVCszdrQT0etgnrC6hqfTZrjJ5lVNUzql0JVwMOjOVYzXCun28dyPiye0FM6L8W
bbFPQbNZ2gIfFAkMNpAwdBoYLOWQBIScyBVpdhK6mnjDYoJJBPgL0eg4/VPx8LSB9Vj/LH38SSlS
cKxmDe2H8ctmBIZgd2p3TBshtVVnWtlnO//cA1Jomo6t/dEMOgTVXB4lUCnPSVlqa6p52kASBRxt
AsnqXGGUFLt6u3hjDg4mps/QG5H/KvVKZCHhTxQw/KmBMC7vKFVROiaLC3cyoMS1aPw9X2PJNH4r
8QqeDTYCLHvc6BnUt0XEBCIgyZYV4JjAf/O3szGx5Tf6YkP1eTeeyJCfRPbdZnZLSGvDoHGx0YRi
TRHNEYzDuX5zpHk4SMw3CzXW9xXfH2QgN2dKhIHg+OXDUAV9sc86xLsj+H2HS0vyYx9QQm7fhe5S
7EDdpQCwE7QVHeSGfNBf/sWCuHtKaxfZ7EBw/d5ZXy+omsEzTdQwTaDe47f9ZZUop+l6D5hf9a2n
lAc=
=E9kM
-----END PGP SIGNATURE-----

--------------095I0EuT7U9cVQFoiTUQRAmv--
