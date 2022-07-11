Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3354756D6D2
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 09:29:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7BF610E680;
	Mon, 11 Jul 2022 07:29:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1B5510E680
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 07:29:32 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 449BC22597;
 Mon, 11 Jul 2022 07:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1657524571; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s631Z929/d5gh5d4TmXC6Wvyls+VzRs6jkQg5sRAIXg=;
 b=bc2MyRV4Q0PkFWnlCP2UpzUPgxHgEL9uXIF58wk7ZQO2zLvCfzTxyY31Xa4XBa0S+GwQHq
 MIfdc/Z0hmyxL9S4cbq/QclEW383m0q6cWymCOkxLmocKWtz8M6zjpb3Dq71RvBMCWuIYx
 rkVEUdNHDkC7LHm2iqzzNOOiFcBHGxM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1657524571;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s631Z929/d5gh5d4TmXC6Wvyls+VzRs6jkQg5sRAIXg=;
 b=1puKeR/vN8d3l7jrl9+/b8w7ia3KxH0ek0r7/uu70YdsTERGATUkJBx1HTNNK5iL/6QMAc
 DxibgPMPasO8MRCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 1BFAC13524;
 Mon, 11 Jul 2022 07:29:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id jc/IBVvRy2I1CgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 11 Jul 2022 07:29:31 +0000
Message-ID: <c9535553-717d-b21b-676f-b771f49e4aef@suse.de>
Date: Mon, 11 Jul 2022 09:29:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 00/14] drm/mgag200: Move model-specific code into separate
 functions
Content-Language: en-US
To: Sam Ravnborg <sam@ravnborg.org>
References: <20220708093929.4446-1-tzimmermann@suse.de>
 <Yshn83t1ByD6Q6Qf@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <Yshn83t1ByD6Q6Qf@ravnborg.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------NcFhXH9nQZpLmhJY7kc6c7WD"
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
Cc: airlied@linux.ie, airlied@redhat.com, jfalempe@redhat.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------NcFhXH9nQZpLmhJY7kc6c7WD
Content-Type: multipart/mixed; boundary="------------ZT2IT0VF0ZBos0VN0PqE1cTQ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: airlied@linux.ie, airlied@redhat.com, jfalempe@redhat.com,
 dri-devel@lists.freedesktop.org
Message-ID: <c9535553-717d-b21b-676f-b771f49e4aef@suse.de>
Subject: Re: [PATCH 00/14] drm/mgag200: Move model-specific code into separate
 functions
References: <20220708093929.4446-1-tzimmermann@suse.de>
 <Yshn83t1ByD6Q6Qf@ravnborg.org>
In-Reply-To: <Yshn83t1ByD6Q6Qf@ravnborg.org>

--------------ZT2IT0VF0ZBos0VN0PqE1cTQ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgU2FtLA0KDQp0aGFua3MgZm9yIHJldmlld2luZy4NCg0KQW0gMDguMDcuMjIgdW0gMTk6
MjIgc2NocmllYiBTYW0gUmF2bmJvcmc6DQo+IEhpIFRob21hcywNCj4gDQo+IE9uIEZyaSwg
SnVsIDA4LCAyMDIyIGF0IDExOjM5OjE1QU0gKzAyMDAsIFRob21hcyBaaW1tZXJtYW5uIHdy
b3RlOg0KPj4gTWdhZzIwMCBzdGlsbCBtaXhlcyBtb2RlbC1zcGVjaWZpYyBjb2RlIGFuZCBn
ZW5lcmljIGNvZGUgaW4gdGhlIHNhbWUNCj4+IGZ1bmN0aW9ucy4gU2VwYXJhdGUgaXQgaW50
byBkaXN0aW5jdCBoZWxwZXJzLg0KPj4NCj4+IEFzIHBhcnQgb2YgdGhpcyBlZmZvcnQsIGNv
bnZlcnQgdGhlIGRyaXZlciBmcm9tIHNpbXBsZS1LTVMgaGVscGVycw0KPj4gdG8gcmVndWxh
ciBhdG9taWMgaGVscGVycy4gVGhlIGxhdHRlciBhcmUgd2F5IG1vcmUgZmxleGlibGUgYW5k
IGNhbg0KPj4gYmUgYWRhcHRlZCBlYXNpbHkgZm9yIGVhY2ggaGFyZHdhcmUgbW9kZWwuDQo+
Pg0KPj4gVGVzdGVkIG9uIE1hdHJveCBHMjAwIGFuZCBHMjAwRUggaGFyZHdhcmUuDQo+Pg0K
Pj4gVGhvbWFzIFppbW1lcm1hbm4gKDE0KToNCj4+ICAgIGRybS9tZ2FnMjAwOiBTcGxpdCBt
Z2FnMjAwX21vZGVzZXRfaW5pdCgpDQo+PiAgICBkcm0vbWdhZzIwMDogTW92ZSBEQUMtcmVn
aXN0ZXIgc2V0dXAgaW50byBtb2RlbC1zcGVjaWZpYyBjb2RlDQo+PiAgICBkbXIvbWdhZzIw
MDogTW92ZSBFUi9FVzMgcmVnaXN0ZXIgaW5pdGlhbGl6YXRpbm8gdG8gcGVyLW1vZGVsIGNv
ZGUNCj4+ICAgIGRybS9tZ2FnMjAwOiBBY3F1aXJlIEkvTy1yZWdpc3RlciBsb2NrIGluIGF0
b21pY19jb21taXRfdGFpbCBmdW5jdGlvbg0KPj4gICAgZHJtL21nYWcyMDA6IFN0b3JlIHBy
aW1hcnkgcGxhbmUncyBjb2xvciBmb3JtYXQgaW4gQ1JUQyBzdGF0ZQ0KPj4gICAgZHJtL21n
YWcyMDA6IFJlb3JnYW5pemUgYmVmb3JlIGRyb3BwaW5nIHNpbXBsZS1LTVMgaGVscGVycw0K
Pj4gICAgZHJtL21nYWcyMDA6IFJlcGxhY2Ugc2ltcGxlLUtNUyB3aXRoIHJlZ3VsYXIgYXRv
bWljIGhlbHBlcnMNCj4+ICAgIGRybS9tZ2FnMjAwOiBTZXQgU0NST0ZGIGluIHByaW1hcnkt
cGxhbmUgY29kZQ0KPj4gICAgZHJtL21nYWcyMDA6IEFkZCBwZXItZGV2aWNlIGNhbGxiYWNr
cw0KPj4gICAgZHJtL21nYWcyMDA6IFByb3ZpZGUgcGVyLWRldmljZSBjYWxsYmFja3MgZm9y
IEJNQyBzeW5jaHJvbml6YXRpb24NCj4+ICAgIGRybS9tZ2FnMjAwOiBQcm92aWRlIHBlci1k
ZXZpY2UgY2FsbGJhY2tzIGZvciBQSVhQTExDDQo+PiAgICBkcm0vbWdhZzIwMDogTW92ZSBt
b2RlLWNvbmZpZyB0byBtb2RlbC1zcGVjaWZpYyBjb2RlDQo+PiAgICBkcm0vbWdhZzIwMDog
TW92ZSBDUlRDIGF0b21pY19lbmFibGUgdG8gbW9kZWwtc3BlY2ZpYyBjb2RlDQo+PiAgICBk
cm0vbWdhZzIwMDogUmVtb3ZlIHR5cGUgZmllbGQgZnJvbSBzdHJ1Y3QgbWdhX2RldmljZQ0K
PiANCj4gSSBoYXZlIGJyb3dzZWQgdGhlIHBhdGNoZXMgYW5kIHRoZXkgbG9va2VkIGdvb2Qu
DQo+IEkgd2FzIGFib3V0IHRvIGNvbXBsYWluIGFib3V0IHNldmVyYWwgdGhpbmdzLCBsaWtl
IGJtYyBpbml0LCBidXQgdGhlbg0KPiBsYXRlciB0aGlzIGlzIGFsbCBuaWNlbHkgY2xlYW5l
ZCB1cC4NCj4gRXNwZWNpYWxseSB0aGUgcGxsIHNldHVwIHN0dWZmIGRpZCBub3QgZ2V0IG11
Y2ggc2NydW5pdHksIGFzIGl0IGxpa2UNCj4gbW9zdCBvZiB0aGUgcGF0Y2ggbG9va2VkIGxp
a2UgY29kZSBtb3ZlbWVudHMuDQoNCkluZGVlZC4gVGhlIHBhdGNoIG1vdmVzIGNvZGUgYW5k
IGFkYXB0cyB0aGUgZnVuY3Rpb25zJyBpbnRlcmZhY2VzIHRvIHRoZSANCm5ldyBjYWxsYmFj
a3MuIEJ1dCB0aGUgaW1wbGVtZW50YXRpb24gcmVtYWlucyB0aGUgc2FtZS4NCg0KPiANCj4g
QWxsIHBhdGNoZXMgZXhjZXB0ICJNb3ZlIERBQy1yZWdpc3RlciBzZXR1cCBpbnRvIG1vZGVs
LXNwZWNpZmljIGNvZGUiDQo+IGFyZToNCj4gQWNrZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2Ft
QHJhdm5ib3JnLm9yZz4NCj4gDQo+IA0KPj4gICAxNCBmaWxlcyBjaGFuZ2VkLCAyODA0IGlu
c2VydGlvbnMoKyksIDE1ODYgZGVsZXRpb25zKC0pDQo+IFRoaXMgaXMgbm90IGEgZGlmZnN0
YXQgdGhhdCBtYWtlcyBvbmUgZ28gLSB5eWlwZWVlLg0KPiBCdXQgdGhlIGltcHJvdmVtZW50
cyBtYWtlcyBpdCB3b3J0aHdoaWxlLg0KDQpZZWFoLiBJIGFjY2VwdCBhIGdyb3cgaW4gZHJp
dmVyIHNpemUgaW4gZXhjaGFuZ2UgZm9yIHRoZSBtb3JlIGNsZWFubHkgDQpzdHJ1Y3R1cmVk
IGNvZGUgYmFzZS4gSW4gbXkgcmVwbHkgdG8gdGhlIERBQyByZXZpZXcsIEkgb3V0bGluZSB3
YXlzIHRvIA0KcmUtc2hhcmUgc29tZSBvZiB0aGUgZHVwbGljYXRlZCBjb2RlLg0KDQpCZXN0
IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiAJU2FtDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1h
bm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25z
IEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55
DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRv
dGV2DQo=

--------------ZT2IT0VF0ZBos0VN0PqE1cTQ--

--------------NcFhXH9nQZpLmhJY7kc6c7WD
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmLL0VoFAwAAAAAACgkQlh/E3EQov+Ai
HxAA0QPimUZbOeMoIMJsFhoX1oZwnFT2m6uwLO2uk5G4A0K/M4ysRML9sjm2zdjSi7mzpNgdxMlc
snbeiyF+MTlFDekUjWqeSFqWrmAsX1616+oB7uYpATVaQ20+HGysq/3iYfH7qEa7uDd8LeYS8r+/
3+x4pNMWN1gAWtUJRbM1mpb5yvFXuhn9kt7+Hr0omGaAXwAEQPDcW+tp47n6jx93ijPbVcime6NV
kQZwirbvHbarclCD5hQMfPQN+7BJPbzmzA7IbviuSPj2miVcKXOvIG7yaM2881/cdjOamogZZGxw
7tMtyx9w/jpNEZcRxif9Skg0+2GmM/2HgNTdoKdrpOhOzL5wd2rEwcEqUjkW718dtvXHpvqYqNQ8
UU1L1Ci75xvjj7iBcDaL7j23VsmdYCW1J1JXsP+LDseRKGFsSpmZY/D3k6gL4WgLObz+kw++jDwo
Bs1T4ZQwcNzYKXI/uY/q9eKJHV+WGEbGS5q++ddkpWlVTrNw7AM2tDuF1+JiDtds4VQwb0RgaKcb
A1D8MhO67VYDp8vKAxY5smksuFx0CseUaagmbwqWT+7r9ElbALcoj1mh9Fv40hbFtc+TVkdeROkL
RSkniePv+L+MzWgU1qKtnR217Sj3/mcSCCOqZkNwF4stU9aGMk4tiou25EEr1Pxy9D5RMJfaEtvg
wms=
=wats
-----END PGP SIGNATURE-----

--------------NcFhXH9nQZpLmhJY7kc6c7WD--
