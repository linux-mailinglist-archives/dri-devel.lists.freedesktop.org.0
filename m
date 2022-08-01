Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBB05867C8
	for <lists+dri-devel@lfdr.de>; Mon,  1 Aug 2022 12:44:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6AED10FFAB;
	Mon,  1 Aug 2022 10:37:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C1F310FFAB
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Aug 2022 10:36:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2472E612C4;
 Mon,  1 Aug 2022 10:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1659350216; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yInT4qn+Uxk6qE9doIm98tym81QePdkoP+2xWEDI2ts=;
 b=l+xD6/WyZnjT2ywwbm0bHOe94YrU1KNGPvFezPmQ7dS0MOieCTL36ft9N8FO7osp/DCC2H
 dBbfzWw5xi8eWVnnmZHQG7xCEZrjfuTLSXQ9c5wd8kuFV1GoAENvJz/7HUxPxQ+BdqTn+3
 jcXRS+UApCwHk23xLn2gr83M5gLtIB4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1659350216;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yInT4qn+Uxk6qE9doIm98tym81QePdkoP+2xWEDI2ts=;
 b=ZIk4q8HC6qqfrJ2nyJVZOtGyTFebPQ9sQmPt+/8PdFX/4+miL0mX7RgysqPlxf+W+ZHX89
 YDPJUTjlOrw9A7DA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0DBB413A72;
 Mon,  1 Aug 2022 10:36:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id H1NiAsis52LUaQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 01 Aug 2022 10:36:56 +0000
Message-ID: <adae488f-9a26-c526-7c3a-5cad2c7bec07@suse.de>
Date: Mon, 1 Aug 2022 12:36:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 30/32] drm/via: Add Kconfig
Content-Language: en-US
To: Kevin Brace <kevinbrace@gmx.com>
References: <20220725235359.20516-1-kevinbrace@gmx.com>
 <20220725235359.20516-11-kevinbrace@gmx.com>
 <af72d22c-323d-abb9-dd77-b8b5eda4d7df@suse.de>
 <trinity-e13df8a2-fa37-4234-8787-8e57ce0d0881-1659232178771@3c-app-mailcom-bs13>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <trinity-e13df8a2-fa37-4234-8787-8e57ce0d0881-1659232178771@3c-app-mailcom-bs13>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------qKjTRABwkhk0OCRhkEjL6GnH"
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------qKjTRABwkhk0OCRhkEjL6GnH
Content-Type: multipart/mixed; boundary="------------RsM0ztpMQp2OUehzUyOupYtX";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Kevin Brace <kevinbrace@gmx.com>
Cc: dri-devel@lists.freedesktop.org
Message-ID: <adae488f-9a26-c526-7c3a-5cad2c7bec07@suse.de>
Subject: Re: [PATCH v3 30/32] drm/via: Add Kconfig
References: <20220725235359.20516-1-kevinbrace@gmx.com>
 <20220725235359.20516-11-kevinbrace@gmx.com>
 <af72d22c-323d-abb9-dd77-b8b5eda4d7df@suse.de>
 <trinity-e13df8a2-fa37-4234-8787-8e57ce0d0881-1659232178771@3c-app-mailcom-bs13>
In-Reply-To: <trinity-e13df8a2-fa37-4234-8787-8e57ce0d0881-1659232178771@3c-app-mailcom-bs13>

--------------RsM0ztpMQp2OUehzUyOupYtX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMzEuMDcuMjIgdW0gMDM6NDkgc2NocmllYiBLZXZpbiBCcmFjZToNCj4gSGkg
VGhvbWFzLA0KPiANCj4gSW4gZ2VuZXJhbCwgSSBhbSBva2F5IHdpdGggdGhlIGlkZWEgb2Yg
a2VlcGluZyBEUkkxIGJhc2VkIFZJQSBEUk0gZm9yIG5vdy4NCj4gUGVyc29uYWxseSwgSSBh
bSBub3QgdGhhdCBpbnRlcmVzdGVkIGluIGtlZXBpbmcgaXQsIGJ1dCBJIGFtIG5vdCBhZ2Fp
bnN0IGtlZXBpbmcgaXQsIGVpdGhlci4NCg0KWWVhaCwgSSBzZWUgeW91ciBwb2ludC4gIE5v
IG9uZSByZWFsbHkgd2FudHMgdG8ga2VlcCB0aGUgRFJJMSBjb2RlLCBidXQgDQp0aGVyZSBt
aWdodCBiZSB1c2VycyBvdXQgdGhlcmUsIHdobyBzdGlsbCByZWx5IG9uIGl0LiAgVGhleSB1
c3VhbGx5IG9ubHkgDQpzaG93IHVwIHdoZW4gdGhpbmdzIGJyZWFrLiAgSXQncyByZWFsbHkg
aGFyZCB0byByZW1vdmUgYW55dGhpbmcgb25jZSANCml0J3MgaW4gdGhlIGtlcm5lbC4NCg0K
QmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiBDb21pbmcgdXAgd2l0aCBhIHNjaGVtZSB0byBr
ZWVwIHRoZSBEUkkxIGJhc2VkIFZJQSBEUk0gaXMgc29ydCBvZiBiZXlvbmQgbXkgc2tpbGwg
bGV2ZWwsICBzbyBJIGFtIGdsYWQgeW91IGFuZCBTYW0gY2FtZSB1cCB3aXRoIGEgc2NoZW1l
IHRvIGtlZXAgaXQuDQo+IEkgdGhpbmsgd2Ugd2lsbCByZXVzZSB0aGlzIHNjaGVtZSB3aGVu
IEkgZmluYWxseSBoYXZlIHRoZSB0aW1lIHRvIGdldCBhcm91bmQgYWRkaW5nIEtNUyBzdXBw
b3J0IHRvIG90aGVyIHNpbWlsYXIgbGVnYWN5IERSSTEgYmFzZWQgRFJNIG1vZHVsZXMuDQo+
IA0KPiBSZWdhcmRzLA0KPiANCj4gS2V2aW4gQnJhY2UNCj4gQnJhY2UgQ29tcHV0ZXIgTGFi
b3JhdG9yeSBibG9nDQo+IGh0dHBzOi8vYnJhY2Vjb21wdXRlcmxhYi5jb20NCj4gDQo+IA0K
Pj4gU2VudDogVHVlc2RheSwgSnVseSAyNiwgMjAyMiBhdCAxMjoyOCBBTQ0KPj4gRnJvbTog
IlRob21hcyBaaW1tZXJtYW5uIiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4NCj4+IFRvOiAiS2V2
aW4gQnJhY2UiIDxrZXZpbmJyYWNlQGdteC5jb20+LCBkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnDQo+PiBDYzogIktldmluIEJyYWNlIiA8a2V2aW5icmFjZUBicmFjZWNvbXB1
dGVybGFiLmNvbT4NCj4+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMzAvMzJdIGRybS92aWE6
IEFkZCBLY29uZmlnDQo+Pg0KPj4gSGkNCj4+DQo+PiBBbSAyNi4wNy4yMiB1bSAwMTo1MyBz
Y2hyaWViIEtldmluIEJyYWNlOg0KPj4+IEZyb206IEtldmluIEJyYWNlIDxrZXZpbmJyYWNl
QGJyYWNlY29tcHV0ZXJsYWIuY29tPg0KPj4+DQo+Pj4gU2lnbmVkLW9mZi1ieTogS2V2aW4g
QnJhY2UgPGtldmluYnJhY2VAYnJhY2Vjb21wdXRlcmxhYi5jb20+DQo+Pj4gLS0tDQo+Pj4g
ICAgZHJpdmVycy9ncHUvZHJtL3ZpYS9LY29uZmlnIHwgOSArKysrKysrKysNCj4+PiAgICAx
IGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspDQo+Pj4gICAgY3JlYXRlIG1vZGUgMTAw
NjQ0IGRyaXZlcnMvZ3B1L2RybS92aWEvS2NvbmZpZw0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS92aWEvS2NvbmZpZyBiL2RyaXZlcnMvZ3B1L2RybS92aWEvS2Nv
bmZpZw0KPj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+Pj4gaW5kZXggMDAwMDAwMDAwMDAw
Li43YzQ2NTZhMWQ0NzMNCj4+PiAtLS0gL2Rldi9udWxsDQo+Pj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL3ZpYS9LY29uZmlnDQo+Pj4gQEAgLTAsMCArMSw5IEBADQo+Pj4gK2NvbmZpZyBE
Uk1fT1BFTkNIUk9NRQ0KPj4NCj4+IEkgd291bGQga2VlcCB0aGUgZHJpdmVyIG9wdGlvbiBu
YW1lZCBEUk1fVklBLCBhcyBpdCBoYXMgYmVlbiBzbyBmYXIuIFRvDQo+PiBidWlsZCB0aGUg
ZXhpc3RpbmcgRFJJMSBkcml2ZXIsIHJhdGhlciBpbnRyb2R1Y2UgYSBuZXcgY29uZmlnIHN5
bWJvbA0KPj4gdGhhdCBlbmFibGVzIGl0LiBUaGUgcnVsZSBsb29rcyBzb21ldGhpbmcgbGlr
ZSB0aGlzOg0KPj4NCj4+ICAgICBjb25maWcgRFJNX1ZJQV9EUkkxDQo+PiAgICAgYm9vbGVh
biAiRFJJMSBzdXBwb3J0Ig0KPj4gICAgICAgZGVwZW5kcyBvbiBEUk1fVklBICYmIERSTV9M
RUdBQ1kNCj4+ICAgICAgIGhlbHANCj4+ICAgICAgICAgQnVpbGQgZm9yIERSSTEtYmFzZWQg
dXNlcnNwYWNlIGRyaXZlcnMuDQo+Pg0KPj4gSXQgd2lsbCBzaG93IHVwIGFzIGFuIG9wdGlv
biBpZiB0aGUgdXNlciBzZWxlY3RzIGJvdGggRFJNX1ZJQSBhbmQNCj4+IERSTV9MRUdBQ1ku
DQo+Pg0KPj4gQmVzdCByZWdhcmRzDQo+PiBUaG9tYXMNCj4+DQo+Pg0KPj4+ICsJdHJpc3Rh
dGUgIk9wZW5DaHJvbWUgKFZJQSBUZWNobm9sb2dpZXMgQ2hyb21lKSINCj4+PiArCWRlcGVu
ZHMgb24gRFJNICYmIFBDSSAmJiBYODYNCj4+PiArCXNlbGVjdCBEUk1fS01TX0hFTFBFUg0K
Pj4+ICsJc2VsZWN0IERSTV9UVE0NCj4+PiArCWhlbHANCj4+PiArCSAgQ2hvb3NlIHRoaXMg
b3B0aW9uIGlmIHlvdSBoYXZlIFZJQSBUZWNobm9sb2dpZXMgVW5pQ2hyb21lIG9yDQo+Pj4g
KwkgIENocm9tZTkgaW50ZWdyYXRlZCBncmFwaGljcy4gSWYgTSBpcyBzZWxlY3RlZCB0aGUg
bW9kdWxlIHdpbGwNCj4+PiArCSAgYmUgY2FsbGVkIHZpYS4NCj4+PiAtLQ0KPj4+IDIuMzUu
MQ0KPj4+DQo+Pg0KPj4gLS0gDQo+PiBUaG9tYXMgWmltbWVybWFubg0KPj4gR3JhcGhpY3Mg
RHJpdmVyIERldmVsb3Blcg0KPj4gU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBH
bWJIDQo+PiBNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCj4+IChI
UkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCj4+IEdlc2Now6RmdHNmw7xocmVyOiBJdm8gVG90
ZXYNCj4+DQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZl
bG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0
ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJl
cmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------RsM0ztpMQp2OUehzUyOupYtX--

--------------qKjTRABwkhk0OCRhkEjL6GnH
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmLnrMcFAwAAAAAACgkQlh/E3EQov+AS
1w//ZM/UeXlBvqbcGs6zNqNcjBKvrdKRofO+sbUKMgQcPjK00WbcA18p+fBzukLylb7JcOvyX7lT
82HweQ5FmjZebcBBy2UrhWWVwXbopF77CDkuCyzEcCl7dhOkT0ERutC5sROIUHrAzUWkIOiYAMTB
/qCuPocgS2LDfIBPeXOd9v8eimj/MxWEO5HiZPaaIwLquhmZ226cKMp0fI9p+6oW0RTzbR3dLt2A
L6ebYGEl/crESIMQoiNBSh6lJl02WIgvXEIZG64dHaEkwcM1IYyPmSnVImfhudcegMLOIS4TPYX2
X/ZN5qZnJh0DW5BdRAyFwTnoipdgAS/TolbJVn0+QmR1z34inldi8GgoU961l2ZCnXG/nVNCoZgM
gU5m6lJD9XYDLyMq4JFreT1iJPqk77nLW8pIUvJOPUOiGJtrkCyqlxsKmcVo5FV6CI4OR46SrXDe
mDC7abUGbwPcRgeEscvXAyoZ5YIavRSYlUlN2Fe4uahz7T0BYfmvgCbnTlgXab8Z9Jo6mtcyDxyk
tMZbXYsYjmlmFgSfpvg6Ka9JQ3Bp1I1l2kq9DR45IJKxmnKhfHk8m8bDH9JzvO/jkbHLi6RaLWcE
OOJyX1tgb6ALc7gvvB2uL/XCotGiVvSyN6qV6CqXM/rtKy25HgSvJE/YQIlYhOn+k4+O6L982R7u
2BE=
=nucg
-----END PGP SIGNATURE-----

--------------qKjTRABwkhk0OCRhkEjL6GnH--
