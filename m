Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC91436188
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 14:22:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 016276E454;
	Thu, 21 Oct 2021 12:22:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAA116E454
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 12:21:58 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1637E219C3;
 Thu, 21 Oct 2021 12:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1634818917; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ucz1Y3aAdKkcDG3ip+Plp+tSC8uDb2R83+A2ivydyXs=;
 b=mlFjB8Col/hxKBm7XVqGpA2ISKHEcDF7pRa7ksPAzkYbegzzQctXIZ1pqa4loR7gYjAaST
 siVuSu03t4jEa9vgixhjiof+zgawFqxvQwAIFnESG3fsjJfns+/ChzlQEGJygiWsSIXb+j
 Q3r5E1lbtKmuvWpM85moXlayTeVKSJ8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1634818917;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ucz1Y3aAdKkcDG3ip+Plp+tSC8uDb2R83+A2ivydyXs=;
 b=onJujf/wLCvw2WA9NCFpLplpCuwHA1+rpgIqf2cDRpm6r8BeUml//Qdd401Ck22g0qEhZf
 mE5AKiqbVFFFH4Bg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E89B6133A6;
 Thu, 21 Oct 2021 12:21:56 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ANvON2RbcWGMfgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 21 Oct 2021 12:21:56 +0000
Message-ID: <28ca3e87-4fbb-d7bb-d5ce-520981e7ee2d@suse.de>
Date: Thu, 21 Oct 2021 14:21:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 0/3] drm: Move several files from DRM core into modules
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org
References: <20211020131941.15367-1-tzimmermann@suse.de>
 <YXFUe355D41ebf8q@phenom.ffwll.local>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <YXFUe355D41ebf8q@phenom.ffwll.local>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------5qnLhFtaGlJfaxV1ivaK80m2"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------5qnLhFtaGlJfaxV1ivaK80m2
Content-Type: multipart/mixed; boundary="------------1E0HSTMAOFXqIl3BnEnZph1x";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 dri-devel@lists.freedesktop.org
Message-ID: <28ca3e87-4fbb-d7bb-d5ce-520981e7ee2d@suse.de>
Subject: Re: [PATCH 0/3] drm: Move several files from DRM core into modules
References: <20211020131941.15367-1-tzimmermann@suse.de>
 <YXFUe355D41ebf8q@phenom.ffwll.local>
In-Reply-To: <YXFUe355D41ebf8q@phenom.ffwll.local>

--------------1E0HSTMAOFXqIl3BnEnZph1x
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjEuMTAuMjEgdW0gMTM6NTIgc2NocmllYiBEYW5pZWwgVmV0dGVyOg0KPiBP
biBXZWQsIE9jdCAyMCwgMjAyMSBhdCAwMzoxOTozOFBNICswMjAwLCBUaG9tYXMgWmltbWVy
bWFubiB3cm90ZToNCj4+IE1vdmUgYSBudW1iZXIgb2YgZmlsZXMgaW50byBtb2R1bGVzIGFu
ZCBiZWhpbmQgY29uZmlnIG9wdGlvbnMuDQo+Pg0KPj4gU28gZmFyLCBlYXJseSBib290IGdy
YXBoaWNzIHdhcyBwcm92aWRlZCBieSBmYmRldi4gV2l0aCBzaW1wbGVkcm0sIGFuZA0KPj4g
cG9zc2libHkgb3RoZXIgZ2VuZXJpYyBEUk0gZHJpdmVycywgaXQncyBub3cgcG9zc2libGUg
dG8gaGF2ZSBnZW5lcmFsDQo+PiBlYXJseS1ib290IG91dHB1dCB3aXRoIERSTS4gVGhpcyBy
ZXF1aXJlcyB0aGUgRFJNIGNvcmUgdG8gYmUgbGlua2VkIGludG8NCj4+IHRoZSBrZXJuZWwg
YmluYXJ5IGltYWdlLg0KPj4NCj4+IFRoZSByZWR1Y3Rpb24gaW4gc2l6ZSBoZXJlIGlzIG9u
bHkgfjElLCBidXQgdGhlIHBhdGNoc2V0IGlzIHBhcnQgb2YgYQ0KPj4gbGFyZ2VyIGVmZm9y
dCB0byByZWR1Y2UgdGhlIHNpemUgb2YgdGhlIERSTSBjb3JlIG1vZHVsZS4NCj4+DQo+PiBU
aG9tYXMgWmltbWVybWFubiAoMyk6DQo+PiAgICBkcm06IEJ1aWxkIGRybV9pcnEubyBvbmx5
IGlmIENPTkZJR19EUk1fTEVHQUNZIGhhcyBiZWVuIHNldA0KPj4gICAgZHJtOiBMaW5rIHNl
dmVyYWwgb2JqZWN0IGZpbGVzIGludG8gZHJtX2ttc19oZWxwZXIua28NCj4+ICAgIGRybTog
TW92ZSBHRU0gbWVtb3J5IG1hbmFnZXJzIGludG8gbW9kdWxlcw0KPiANCj4gQXNzdW1pbmcg
aXQgYWxsIGNvbXBpbGVzIHN0aWxsIGluIGFsbCBjb21ib3MsIG9uIHRoZSBzZXJpZXM6DQo+
IA0KPiBBY2tlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4N
Cg0KVGhhbmtzIGZvciB0aGUgQS1iLiBJIGJ1aWx0IHdpdGggRFJNX0xFR0FDWSBzZXQgYW5k
IHVuc2V0Lg0KDQpUaGUgR0VNIGNoYW5nZXMgc2hvdWxkbid0IGJlIGFmZmVjdGVkIGJ5IHRo
ZSBjb25maWcuIFdpdGggdGhlIENNQSANCmhlbHBlcnMgaW4gYSBzZXBhcmF0ZSBtb2R1bGUs
IHdlIGNvdWxkIG1heWJlIHJlbW92ZSANCkNPTkZJR19EUk1fS01TX0NNQV9IRUxQRVIgYW5k
IGxpbmsgZHJtX2ZiX2NtYV9oZWxwZXIubyBpZiANCkNPTkZJR19EUk1fS01TX0hFTFBFUiBo
YXMgYmVlbiBzZWxlY3RlZC4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPj4NCj4+ICAg
ZHJpdmVycy9ncHUvZHJtL0tjb25maWcgICAgICAgICAgICAgICAgfCAgNCArKy0tDQo+PiAg
IGRyaXZlcnMvZ3B1L2RybS9NYWtlZmlsZSAgICAgICAgICAgICAgIHwgMjYgKysrKysrKysr
KysrKysrLS0tLS0tLS0tLS0NCj4+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fY21hX2hl
bHBlci5jICAgfCAgNCArKysrDQo+PiAgIGRyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3NobWVt
X2hlbHBlci5jIHwgIDQgKysrKw0KPj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX2lycS5jICAg
ICAgICAgICAgICB8ICAyIC0tDQo+PiAgIDUgZmlsZXMgY2hhbmdlZCwgMjUgaW5zZXJ0aW9u
cygrKSwgMTUgZGVsZXRpb25zKC0pDQo+Pg0KPj4gLS0NCj4+IDIuMzMuMA0KPj4NCj4gDQoN
Ci0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNV
U0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0
MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNj
aMOkZnRzZsO8aHJlcjogRmVsaXggSW1lbmTDtnJmZmVyDQo=

--------------1E0HSTMAOFXqIl3BnEnZph1x--

--------------5qnLhFtaGlJfaxV1ivaK80m2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmFxW2QFAwAAAAAACgkQlh/E3EQov+C8
xA/+ML/I3qLuP0ldarMIxlGNHFFAJC/OlG7hTpK2EfUN+CcQ+7LfIs2Lx4vxVTtS5YV930NSiWMm
NfPmn+YJBCSDIKoBVwPy8DF8QnaSpy0l+imtgFxKnXaK6KdjzBHalXInobRYValMNDsisKUTW2pC
e1GXgU29L2g6cR141ovH5hzVo7EDcy6RG74uHac0Yc146lMqrruMdAT6R1odh4ATFfq5KOVZ3CBR
Mp9ghoyV7nNsy5YeEKHegJv/ZZj1pIbgKtI/5NhsFGnMocVVdkPs3CQ79QwZ6oVM7nCH3ZzpkP7R
az9skbEGuZV5RlUJ0NI+cUBPCK2JwB7bLT52NA5Tb5lhEGuvfHGyrlejaWNTBbSVODPIZMvzDDBY
6RsJK7knRtitJr4nlmFS4UDH6Xw+O6OIelWTANyhrWLaJrUEoC//wciGnNSkVVKcYaUogyhzGiXL
L93OiqZmAipvFF4ldxWT73uZUcW+dNzmm06jjN9/rafRxcQzarJEKRHKjYo+ndxmZ34SKp1hBQl6
mYKpl0xuST7ZUVmpZgGXc8pqgN5gRzT9CJ1WgzAmIA0Po17CsqpJy87oTwojh++0bWLwSqCvwWia
lggQPsH6aaX822sHNvkn6j6hxtoTf+pM3gN39it7379HiJ2WSKjHsBSLyMOet3rPD7lPGLUCfVbT
B8Y=
=3bhV
-----END PGP SIGNATURE-----

--------------5qnLhFtaGlJfaxV1ivaK80m2--
