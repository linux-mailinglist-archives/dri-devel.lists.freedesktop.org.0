Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BB96D5EAD
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 13:08:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A07310E1CE;
	Tue,  4 Apr 2023 11:08:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EAB910E1CE
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 11:08:47 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B47BD2054A;
 Tue,  4 Apr 2023 11:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1680606525; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eQp2+ZkrkLyFVDUuOKrEQGz/vEMvHB61W6Nom/UO5Nc=;
 b=0LGvStjeD7p18YX1YMUVfYGpMQA/8mK/NDETaBkuENH0GGWgjII0VO9njhjG9fgD/IyFD7
 K75uucgZ1VAx45itF8CFw4rHuFLWqhVNNMsyctzK3vLQibCw0Yqxiq3Az79ZaYtB+cb5hC
 eK+G2GGTbfcPG77wo8YKeEdFgJdePJA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1680606525;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eQp2+ZkrkLyFVDUuOKrEQGz/vEMvHB61W6Nom/UO5Nc=;
 b=7F/QTBn1rQAnLBz/4jphWEFnf/MCLG28VeE8vGZTfsdKVJzyMthrRYVEyxGDkDnrwBEZ2i
 TRSbUveanzkKxDAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7443313920;
 Tue,  4 Apr 2023 11:08:45 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 5whlGz0FLGSVcgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 04 Apr 2023 11:08:45 +0000
Message-ID: <bf2aedc8-5055-a931-65bc-e153f74e737c@suse.de>
Date: Tue, 4 Apr 2023 13:08:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] video/aperture: fix typos
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>,
 Sui Jingfeng <suijingfeng@loongson.cn>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Li Yi <liyi@loongson.cn>, Christian Koenig <christian.koenig@amd.com>,
 Helge Deller <deller@gmx.de>, Lucas De Marchi <lucas.demarchi@intel.com>
References: <20230404040101.2165600-1-suijingfeng@loongson.cn>
 <0ad03743-0224-b154-a149-e3e4d54b252d@suse.de>
 <87355fex1f.fsf@minerva.mail-host-address-is-not-set>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <87355fex1f.fsf@minerva.mail-host-address-is-not-set>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------QjgX0S8Djl0gmC5dJU0tzbOC"
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------QjgX0S8Djl0gmC5dJU0tzbOC
Content-Type: multipart/mixed; boundary="------------RuVZdtasVFMi1nARy25z2lWY";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 Sui Jingfeng <suijingfeng@loongson.cn>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Li Yi <liyi@loongson.cn>, Christian Koenig <christian.koenig@amd.com>,
 Helge Deller <deller@gmx.de>, Lucas De Marchi <lucas.demarchi@intel.com>
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Message-ID: <bf2aedc8-5055-a931-65bc-e153f74e737c@suse.de>
Subject: Re: [PATCH] video/aperture: fix typos
References: <20230404040101.2165600-1-suijingfeng@loongson.cn>
 <0ad03743-0224-b154-a149-e3e4d54b252d@suse.de>
 <87355fex1f.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87355fex1f.fsf@minerva.mail-host-address-is-not-set>

--------------RuVZdtasVFMi1nARy25z2lWY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDQuMDQuMjMgdW0gMTI6NTUgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPiB3cml0
ZXM6DQo+IA0KPiBIZWxsbyBUaG9tYXMsDQo+IA0KPiBTb3JyeSwgSSBqdXN0IGFwcGxpZWQg
dGhpcyBwYXRjaCBhbmQgZGlkbid0IHNlZSB5b3VyIGVtYWlsIGJlZm9yZS4uLg0KPiANCj4+
IEhpDQo+Pg0KPj4gQW0gMDQuMDQuMjMgdW0gMDY6MDEgc2NocmllYiBTdWkgSmluZ2Zlbmc6
DQo+Pj4gICAgRUZJIEZCLCBWRVNBIEZCIG9yIFZHQSBGQiBldGMgYXJlIGJlbG9uZyB0byBm
aXJtd2FyZSBiYXNlZCBmcmFtZWJ1ZmZlcg0KPj4+ICAgIGRyaXZlci4NCj4+DQo+PiBObyB3
aGl0ZXNwYWNlcyBhdCB0aGUgYmVnaW5uaW5nIG9mIHRoZSBsaW5lcy4NCj4+DQo+IA0KPiBJ
IGZpeGVkIHRoYXQgYmVmb3JlIGFwcGx5aW5nLCBhbHNvIHJlbW92ZWQgdGhlICJhcmUiIGlu
IHRoZSBzZW50ZW5jZQ0KPiBhYm92ZSwgc2luY2UgaXQgc291bmRlZCBvZmYgYW5kIHJlcGhh
cnNlZCBzdWJqZWN0IGxpbmUgYXMgIkZpeCB0eXBvcw0KPiBpbiBjb21tZW50cyIuDQo+IA0K
PiBbLi4uXQ0KPiANCj4+PiAgICAJLyoNCj4+PiAgICAJICogUmVtb3ZlIHRoZSBkZXZpY2Ug
ZnJvbSB0aGUgZGV2aWNlIGhpZXJhcmNoeS4gVGhpcyBpcyB0aGUgcmlnaHQgdGhpbmcNCj4+
PiAtCSAqIHRvIGRvIGZvciBmaXJtd2FyZS1iYXNlZCBEUk0gZHJpdmVycywgc3VjaCBhcyBF
RkksIFZFU0Egb3IgVkdBLiBBZnRlcg0KPj4+ICsJICogdG8gZG8gZm9yIGZpcm13YXJlLWJh
c2VkIGZiIGRyaXZlcnMsIHN1Y2ggYXMgRUZJLCBWRVNBIG9yIFZHQS4gQWZ0ZXINCj4+DQo+
PiBUaGF0IHNlbnRlbmNlcyBpcyBub3Qgd2VsbCBwaHJhc2VkLiBNYXliZSBzYXkgJ1RoaXMg
aXMgcmVxdWlyZWQgZm9yDQo+PiBmaXJtd2FyZS1wcm92aWRlZCBncmFwaGljcywgc3VjaCBh
cyBFRkksIFZFU0Egb3IgVkdBLicNCj4+DQo+IA0KPiBHcmFwaGljIGRyaXZlcnMgb3IgZGlz
cGxheSBkcml2ZXJzIHdvdWxkIGluZGVlZCBiZSBtb3JlIGFjY3VyYXRlIGhlcmUuIEJ1dA0K
PiBJIHRoaW5rIHRoYXQgImZiIGRyaXZlcnMiIGlzIHN0aWxsIHdlbGwgcGhhcnNlZCBzaW5j
ZSB0aGUgYXJlIG90aGVyIHBsYWNlcw0KPiB3aGVyZSBlaXRoZXIgZmJkZXYgb3IgRFJNIGRy
aXZlcnMgZm9yIGZpcm13YXJlLXByb3ZpZGVkIGZyYW1lYnVmZmVycyBhcmUNCj4gbmFtZWQg
bGlrZSB0aGF0Lg0KDQpJIG1lYW50IG15IG9yaWdpbmFsIGNvbW1lbnQgd2hlbiBJIHNhaWQg
J25vdCB3ZWxsIHBocmFzZWQnLiBJdCdzIG5vdCANCkppbmdmZW5nJ3MgZmF1bHQsIGJ1dCBp
biBteSBvcmlnaW5hbCB0ZXh0LiBSZW1vdmluZyB0aGUgZGV2aWNlIGlzIA0KcmVxdWlyZWQg
Zm9yIHNjYW5vdXQgYnVmZmVycyB0aGF0IGhhdmUgYmVlbiBwcm92aWRlZCBieSB0aGUgZmly
bXdhcmUuIA0KVGhlIGF0dGFjaGVkIGdyYXBoaWNzIGRyaXZlciBpcyBzZWNvbmRhcnkgdG8g
dGhpcy4gQnV0IEknbSBzdHJ1Z2dsaW5nIHRvIA0KZmluZCBhIHNpbXBsZSBzZW50ZW5jZSB0
byBleHByZXNzIHRoaXMuIDovDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IEZv
ciBleGFtcGxlLCBpbiB0aGUgc3lzZmIgcGxhdGZvcm0gY29kZSBhbmQgS2NvbmZpZyBzeW1i
b2wgaGVscCB0ZXh0Lg0KPiANCj4+IEJlc3QgcmVnYXJkcw0KPj4gVGhvbWFzDQo+Pg0KPiAN
Cg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0K
U1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5
MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdl
c2Now6RmdHNmw7xocmVyOiBJdm8gVG90ZXYNCg==

--------------RuVZdtasVFMi1nARy25z2lWY--

--------------QjgX0S8Djl0gmC5dJU0tzbOC
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmQsBT0FAwAAAAAACgkQlh/E3EQov+B1
txAAjm62li/0mEB1aT6gsNUdRSUmqAHhz0JXnF8ld+2RFSzHSG1CTD76VjHRHWUAFQY5zMxzD0NB
fDaOLTMRx1b4Ybci17iCaYfW77VhCMjRe3RcRSkJK3ZdKvQwW5SBbuMTOcwh50gi9kTEPdxzyJT6
4nWSX2VR08wDM9nh+AByPiMFxPoSQXaeeCy9ZUBJsketCJXAT5UoU+TR1dPNwpnW+e1y4qJGq+DD
D0QORAbQVkgce+jCHfxJ7Ijd7e9Kurskt9FqZuy1MZXjMBZeW6uDvuVWSO7KAX10pFwhiabVjbz7
2wggBLeECNtX02QJZEe9Bocd83fPpTgV8VLwy9+GZ+opb1nWuTcqv/+d3ivrzSQXn2+Rq62Cd4oc
+ng98lGk+gy2QwRkBN9PmavMDOMu2CuUujTqEdzlXipfknRGfMV51a2N9e9yx/Kp0nfXg//jYh9P
V1wM/UbjBa6NtTEpdWXyS7ogXRIkV7e2U7zDGSxbAgee9NeBISDp4+CcYvuuMy/EbGvL2Z4qy0Xr
6RgG5Dlnjyd7ZqbHC+nrT8wiAkk9H4pZgSwMjj0ha4bbjwFt9x29FjHPZSBxmZMEK1+BT3XkSCQP
W0xpvFYkJJsuHK/Ur27XbnFs7Hd9UHC7Krr9IYBFu/y+D+98cxm1pka99IckY3p8hqRekNK+JBW5
FWs=
=+YjY
-----END PGP SIGNATURE-----

--------------QjgX0S8Djl0gmC5dJU0tzbOC--
