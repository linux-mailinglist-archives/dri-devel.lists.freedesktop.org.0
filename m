Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3819F76214F
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jul 2023 20:30:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 960BC10E3EE;
	Tue, 25 Jul 2023 18:30:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AD0D10E3EE
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jul 2023 18:30:25 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id ADCAE1FD68;
 Tue, 25 Jul 2023 18:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1690309823; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S826svsaPfMRwRLxYlPF8DuIM0qGHqTwTbsIE5uRIwE=;
 b=aU6IJG8oiUfPpCcyD1At5aIb7tQRqhRhcx/usVFDPhH1xcB07UeZpuBSawrovduB0lC5iv
 a1R314mffvxwh+SV8vCYd2aRbvHyFUa88e6HbrtrJHkqKYl9tdAZNQRalDkHFf7KhF8rjK
 ASzIrcW2SBF8dQ3H+Tzp6fXLpgjTVGk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1690309823;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=S826svsaPfMRwRLxYlPF8DuIM0qGHqTwTbsIE5uRIwE=;
 b=7gnJEvZXWOG44NDJJfRwbtj3ONhEXrOuW7DoKzF6ccbJxhT0MYxHjbjQO9Bp0YoOXoIdpd
 TGOHMAfVQ1YTGPDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 81D1D13487;
 Tue, 25 Jul 2023 18:30:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id DgG7Hr8UwGQ/dgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 25 Jul 2023 18:30:23 +0000
Message-ID: <c10d925b-8d37-caa0-8f66-a0206f948c69@suse.de>
Date: Tue, 25 Jul 2023 20:30:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] video: logo: LOGO should depend on FB_CORE i.s.o. FB
To: Javier Martinez Canillas <javierm@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
References: <5ab3d1fe7b67ab10e4bc1bdbc0fa7731f7960965.1690300189.git.geert+renesas@glider.be>
 <87a5vkj7qe.fsf@minerva.mail-host-address-is-not-set>
 <CAMuHMdWBznkqYxCWD2uwGtWLqXnBqX1Ycg31fBDc4cq2u8DkNQ@mail.gmail.com>
 <877cqoj5q5.fsf@minerva.mail-host-address-is-not-set>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <877cqoj5q5.fsf@minerva.mail-host-address-is-not-set>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Ihnd0X4BdvmaCj2zBQR900k9"
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
Cc: dri-devel@lists.freedesktop.org, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------Ihnd0X4BdvmaCj2zBQR900k9
Content-Type: multipart/mixed; boundary="------------izx5kFNS1CR1XwyjAzA0wvpZ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Helge Deller <deller@gmx.de>, Arnd Bergmann <arnd@arndb.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Message-ID: <c10d925b-8d37-caa0-8f66-a0206f948c69@suse.de>
Subject: Re: [PATCH] video: logo: LOGO should depend on FB_CORE i.s.o. FB
References: <5ab3d1fe7b67ab10e4bc1bdbc0fa7731f7960965.1690300189.git.geert+renesas@glider.be>
 <87a5vkj7qe.fsf@minerva.mail-host-address-is-not-set>
 <CAMuHMdWBznkqYxCWD2uwGtWLqXnBqX1Ycg31fBDc4cq2u8DkNQ@mail.gmail.com>
 <877cqoj5q5.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <877cqoj5q5.fsf@minerva.mail-host-address-is-not-set>

--------------izx5kFNS1CR1XwyjAzA0wvpZ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjUuMDcuMjMgdW0gMTg6NTAgc2NocmllYiBKYXZpZXIgTWFydGluZXogQ2Fu
aWxsYXM6DQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4ay5vcmc+IHdy
aXRlczoNCj4gDQo+PiBIaSBKYXZpZXIsDQo+Pg0KPj4gT24gVHVlLCBKdWwgMjUsIDIwMjMg
YXQgNjowN+KAr1BNIEphdmllciBNYXJ0aW5leiBDYW5pbGxhcw0KPj4gPGphdmllcm1AcmVk
aGF0LmNvbT4gd3JvdGU6DQo+Pj4gR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2Fz
QGdsaWRlci5iZT4gd3JpdGVzOg0KPj4+PiBJZiBDT05GSUdfRkJfQ09SRT15IGJ1dCBDT05G
SUdfRkI9biwgdGhlIGZyYW1lIGJ1ZmZlciBib290dXAgbG9nb3MgY2FuDQo+Pj4+IG5vIGxv
bmdlciBiZSBlbmFibGVkLiAgRml4IHRoaXMgYnkgbWFraW5nIENPTkZJR19MT0dPIGRlcGVu
ZCBvbg0KPj4+PiBDT05GSUdfRkJfQ09SRSBpbnN0ZWFkIG9mIENPTkZJR19GQiwgYXMgdGhl
cmUgaXMgbm8gZ29vZCByZWFzb24gZm9yIHRoZQ0KPj4+PiBsb2dvIGNvZGUgdG8gZGVwZW5k
IG9uIHRoZSBwcmVzZW5jZSBvZiByZWFsIGZyYW1lIGJ1ZmZlciBkZXZpY2UgZHJpdmVycy4N
Cj4+Pg0KPj4+IEluZGVlZC4NCj4+Pg0KPj4+PiBGaXhlczogNTViZmZjODE3MGJiNTgxMyAo
ImZiZGV2OiBTcGxpdCBmcmFtZSBidWZmZXIgc3VwcG9ydCBpbiBGQiBhbmQgRkJfQ09SRSBz
eW1ib2xzIikNCj4+Pj4gU2lnbmVkLW9mZi1ieTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVy
dCtyZW5lc2FzQGdsaWRlci5iZT4NCj4+Pj4gLS0tDQo+Pj4+ICAgZHJpdmVycy92aWRlby9L
Y29uZmlnICAgICAgfCAyICstDQo+Pj4+ICAgZHJpdmVycy92aWRlby9sb2dvL0tjb25maWcg
fCAyICstDQo+Pj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pDQo+Pj4+DQo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL0tjb25m
aWcgYi9kcml2ZXJzL3ZpZGVvL0tjb25maWcNCj4+Pj4gaW5kZXggZTViMWNjNTRjYWZhMTBk
NS4uYjY5NGQ3NjY5ZDMyMDBiMSAxMDA2NDQNCj4+Pj4gLS0tIGEvZHJpdmVycy92aWRlby9L
Y29uZmlnDQo+Pj4+ICsrKyBiL2RyaXZlcnMvdmlkZW8vS2NvbmZpZw0KPj4+PiBAQCAtNjMs
NyArNjMsNyBAQCBpZiBWVA0KPj4+PiAgICAgICAgc291cmNlICJkcml2ZXJzL3ZpZGVvL2Nv
bnNvbGUvS2NvbmZpZyINCj4+Pj4gICBlbmRpZg0KPj4+Pg0KPj4+PiAtaWYgRkIgfHwgU0dJ
X05FV1BPUlRfQ09OU09MRQ0KPj4+PiAraWYgRkJfQ09SRSB8fCBTR0lfTkVXUE9SVF9DT05T
T0xFDQo+Pj4+ICAgICAgICBzb3VyY2UgImRyaXZlcnMvdmlkZW8vbG9nby9LY29uZmlnIg0K
Pj4+Pg0KPj4+PiAgIGVuZGlmDQo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2xv
Z28vS2NvbmZpZyBiL2RyaXZlcnMvdmlkZW8vbG9nby9LY29uZmlnDQo+Pj4+IGluZGV4IDZk
NmY4YzA4NzkyZGM4OTcuLmI3ZDk0ZDFkZDE1ODVhODQgMTAwNjQ0DQo+Pj4+IC0tLSBhL2Ry
aXZlcnMvdmlkZW8vbG9nby9LY29uZmlnDQo+Pj4+ICsrKyBiL2RyaXZlcnMvdmlkZW8vbG9n
by9LY29uZmlnDQo+Pj4+IEBAIC01LDcgKzUsNyBAQA0KPj4+Pg0KPj4+PiAgIG1lbnVjb25m
aWcgTE9HTw0KPj4+PiAgICAgICAgYm9vbCAiQm9vdHVwIGxvZ28iDQo+Pj4+IC0gICAgIGRl
cGVuZHMgb24gRkIgfHwgU0dJX05FV1BPUlRfQ09OU09MRQ0KPj4+PiArICAgICBkZXBlbmRz
IG9uIEZCX0NPUkUgfHwgU0dJX05FV1BPUlRfQ09OU09MRQ0KPj4+PiAgICAgICAgaGVscA0K
Pj4+PiAgICAgICAgICBFbmFibGUgYW5kIHNlbGVjdCBmcmFtZSBidWZmZXIgYm9vdHVwIGxv
Z29zLg0KPj4+DQo+Pj4gU2hvdWxkIHRoZW4gbW92ZSB0aGlzIG9wdGlvbiB0byBkcml2ZXJz
L3ZpZGVvL2ZiZGV2L2NvcmUvS2NvbmZpZyA/DQo+Pg0KPj4gTm8sIGFsbCBsb2dvIG9wdGlv
bnMgYXJlIGluIHRoZWlyIG93biBmaWxlLg0KPj4NCj4gDQo+IFllcy4gSSBtZWFudCB0byBt
b3ZlIGRyaXZlcnMvdmlkZW8vbG9nby8gdG8gZHJpdmVycy9mYmRldi9jb3JlL2xvZ28gYW5k
IHRvDQo+IHNvdXJjZSBpdHMgS2NvbmZpZyBmcm9tIGRyaXZlcnMvZmJkZXYvY29yZS9LY29u
ZmlnLCBzaW5jZSBpdCBub3cgZGVwZW5kcw0KPiBvbiBGQl9DT1JFLg0KDQpObywgcGxlYXNl
IHJhdGhlciBsZWF2ZSBpdCB3aGVyZSBpdCBpcy4gVGhlcmUncyBubyBjb2RlIGRlcGVuZGVu
Y2llcyB0byANCnRoZSBmYmRldiBjb3JlOyBpdCBtZXJlbHkgZGVwZW5kcyBvbiB0aGUgS2Nv
bmZpZyB0b2tlbi4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gQnV0IEkgc2Vl
IG5vdyB0aGF0IGl0IGFsc28gZGVwZW5kcyBvbiBTR0lfTkVXUE9SVF9DT05TT0xFLCBzbyBo
YXZpbmcgdGhvc2UNCj4gaW4gZHJpdmVycy92aWRlby9sb2dvIG1ha2VzIHNlbnNlIGluZGVl
ZC4NCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZl
bG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KRnJhbmtlbnN0
cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCkdGOiBJdm8gVG90ZXYsIEFu
ZHJldyBNeWVycywgQW5kcmV3IE1jRG9uYWxkLCBCb3VkaWVuIE1vZXJtYW4NCkhSQiAzNjgw
OSAoQUcgTnVlcm5iZXJnKQ0K

--------------izx5kFNS1CR1XwyjAzA0wvpZ--

--------------Ihnd0X4BdvmaCj2zBQR900k9
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmTAFL4FAwAAAAAACgkQlh/E3EQov+C8
kA/8D6v5Ub/5BVDcrNs4cdI8N5yfQQvY+5tqLuUdIrtKk37bdb48Ldkivu1+0uP4TAMEeo9Bo+3t
HyZ7Mh0Y1EgfhSlI9Of7QO409IStKGyTc5XN/M95fRfUBGLRmjk5xrbqqnKaT8Sdpu3Er8SKAcel
n0+jObocwSf50Auk5u5YyDsYECEAZMVfpVwoQP04t5VpCnlYCAPz9fP4vMPkpvJCtm2fTUCoaWwJ
mUq2KWb1kUYiEWa09nAFtp24cJo1M81tfHNcawuCcNvg4+OHrvxFxGn48m3U3rqXEV2SDjah6xTJ
hL6AwN5htSgKUbtaFp8N2cMgRKE5fVgEl2kaEX3XPrHrPDMjqM+2pFNfklt0FBKcLcrvp6HlBU3K
qs0EXPFBKezDX15/2dEpOsGHxuKcHDRh5kRObySe+4fhcmkfx/AbW/xhDiXCgVPlPO6xEiLKqJvG
vVuiGzMwPSaQhpfCQR1MIpH0hymrRFHJ4y8ZRU3G6i2GNjL76q6lSuSHokmI9e+kcQmXgrpD79kg
+nvsMB4Pr5MMtaxfdUtGubRTpDZ/ABsW6oTK1xoO+Jc6uSQTvzQIyBWixWUJ88mnBdsGCRsJttBe
n6Jzpz3VT04T8BPAqjDQitQPT6G9mS+Wcy00zPtDc1rHHn0SJJv+ABhJyrJEbtkPIJL9nkY2fB2j
mo8=
=ydUH
-----END PGP SIGNATURE-----

--------------Ihnd0X4BdvmaCj2zBQR900k9--
