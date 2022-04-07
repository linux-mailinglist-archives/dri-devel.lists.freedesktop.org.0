Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9567B4F78C9
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 10:03:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFF8910E743;
	Thu,  7 Apr 2022 08:03:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BF1610E743
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 08:03:48 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 009601F85A;
 Thu,  7 Apr 2022 08:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1649318627; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6/jHcyBZYdgE36Q6D+mqVOd5Gan/NrhP/Y57aQJUIkg=;
 b=k/TKg+KCkUNUFVDLVkWDNlIu8ZMtAoi54w56BiWXsshwlyc4HMBM1nGO1CwEQxID81Fq4S
 Ud1gPirQH3J+AlBr+Aw9OPXQwFNdsM0gwRQzBDrm36JU9gfnjQgdYgvGP4zUsZE1ToC/oC
 IRqFVaRpq/jfDl0kMyDG+wzjTMXCTxY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1649318627;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6/jHcyBZYdgE36Q6D+mqVOd5Gan/NrhP/Y57aQJUIkg=;
 b=o4+ib/rBX3EEtwkgOUmSM9Lq2u8sOJV1c9bW/kkyWuz0oSs8Y+5K5f/oJyYG/G2ZPXKhRQ
 QmKJCKCUUcKxeqDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C15C613485;
 Thu,  7 Apr 2022 08:03:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id N8giLuKaTmLwAgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 07 Apr 2022 08:03:46 +0000
Message-ID: <824df12f-c8fd-91ee-58f5-3ea4e83aff32@suse.de>
Date: Thu, 7 Apr 2022 10:03:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 3/8] drm/display: Introduce a DRM display-helper module
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, daniel@ffwll.ch,
 airlied@linux.ie, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 jani.nikula@linux.intel.com, lyude@redhat.com
References: <20220322192743.14414-1-tzimmermann@suse.de>
 <20220322192743.14414-4-tzimmermann@suse.de>
 <e02eceb6-4bf5-3641-502e-9e5a246ae5fd@redhat.com>
 <b17ead61-b7f1-d57a-d51f-c961d8ad59a1@suse.de>
 <f6daa1b3-8267-72ee-182a-6ed61fe650cf@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <f6daa1b3-8267-72ee-182a-6ed61fe650cf@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------HGOoObU01wOYjg6dYQ3m7lAE"
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
--------------HGOoObU01wOYjg6dYQ3m7lAE
Content-Type: multipart/mixed; boundary="------------zICi8JlSLG2cBVK1SvAvRq5w";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, daniel@ffwll.ch,
 airlied@linux.ie, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 jani.nikula@linux.intel.com, lyude@redhat.com
Cc: dri-devel@lists.freedesktop.org
Message-ID: <824df12f-c8fd-91ee-58f5-3ea4e83aff32@suse.de>
Subject: Re: [PATCH 3/8] drm/display: Introduce a DRM display-helper module
References: <20220322192743.14414-1-tzimmermann@suse.de>
 <20220322192743.14414-4-tzimmermann@suse.de>
 <e02eceb6-4bf5-3641-502e-9e5a246ae5fd@redhat.com>
 <b17ead61-b7f1-d57a-d51f-c961d8ad59a1@suse.de>
 <f6daa1b3-8267-72ee-182a-6ed61fe650cf@redhat.com>
In-Reply-To: <f6daa1b3-8267-72ee-182a-6ed61fe650cf@redhat.com>

--------------zICi8JlSLG2cBVK1SvAvRq5w
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgSmF2aWVyDQoNCkFtIDA3LjA0LjIyIHVtIDA5OjQzIHNjaHJpZWIgSmF2aWVyIE1hcnRp
bmV6IENhbmlsbGFzOg0KPiBPbiA0LzYvMjIgMjE6MDgsIFRob21hcyBaaW1tZXJtYW5uIHdy
b3RlOg0KPj4gSGkgSmF2aWVyDQo+Pg0KPj4gQW0gMzAuMDMuMjIgdW0gMTE6MjMgc2Nocmll
YiBKYXZpZXIgTWFydGluZXogQ2FuaWxsYXM6DQo+Pj4gT24gMy8yMi8yMiAyMDoyNywgVGhv
bWFzIFppbW1lcm1hbm4gd3JvdGU6DQo+Pj4+IFJlcGxhY2UgdGhlIERQLWhlbHBlciBtb2R1
bGUgd2l0aCBhIGRpc3BsYXktaGVscGVyIG1vZHVsZS4gVXBkYXRlDQo+Pj4+IGFsbCByZWxh
dGVkIEtjb25maWcgYW5kIE1ha2VmaWxlIHJ1bGVzLg0KPj4+Pg0KPj4+PiBCZXNpZGVzIHRo
ZSBleGlzdGluZyBjb2RlIGZvciBEaXNwbGF5UG9ydCwgdGhlIG5ldyBtb2R1bGUgd2lsbA0K
Pj4+PiBjb250YWluIGhlbHBlcnMgZm9yIG90aGVyIHZpZGVvLW91dHB1dCBzdGFuZGFyZHMs
IHN1Y2ggYXMgSERNSS4NCj4+Pj4gRHJpdmVycyB3aWxsIHN0aWxsIGJlIGFibGUgdG8gc2Vs
ZWN0IHRoZSByZXF1aXJlZCB2aWRlby1vdXRwdXQNCj4+Pj4gaGVscGVycy4gTGlua2luZyBh
bGwgc3VjaCBjb2RlIGludG8gYSBzaW5nbGUgbW9kdWxlIGF2b2lkcyB0aGUNCj4+Pj4gcHJv
bGlmZXJhdGlvbiBvZiBzbWFsbCBrZXJuZWwgbW9kdWxlcy4NCj4+Pj4NCj4+Pj4gU2lnbmVk
LW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+Pj4+
IC0tLQ0KPj4+DQo+Pj4gW3NuaXBdDQo+Pj4NCj4+Pj4gK2NvbmZpZyBEUk1fRElTUExBWV9I
RUxQRVINCj4+Pj4gKwl0cmlzdGF0ZQ0KPj4+PiArCWRlcGVuZHMgb24gRFJNDQo+Pj4+ICsJ
aGVscA0KPj4+PiArCSAgRFJNIGhlbHBlcnMgZm9yIGRpc3BsYXkgYWRhcHRlcnMuDQo+Pj4+
ICsNCj4+Pj4gICAgY29uZmlnIERSTV9EUF9IRUxQRVINCj4+Pj4gICAgCXRyaXN0YXRlDQo+
Pj4+ICAgIAlkZXBlbmRzIG9uIERSTQ0KPj4+PiArCXNlbGVjdCBEUk1fRElTUExBWV9IRUxQ
RVINCj4+Pj4gICAgCWhlbHANCj4+Pj4gICAgCSAgRFJNIGhlbHBlcnMgZm9yIERpc3BsYXlQ
b3J0Lg0KPj4+Pg0KPj4+DQo+Pj4gSSB3YXMgYWJvdXQgdG8gYXNrIHdoeSB0aGlzIHdvdWxk
IHN0aWxsIGJlIG5lZWRlZCBidXQgdGhlbiByZS1yZWFkIHRoZQ0KPj4+IGNvbW1pdCBtZXNz
YWdlIHRoYXQgc2F5cyBkcml2ZXJzIHdpbGwgc3RpbGwgYmUgYWJsZSB0byBzZWxlY3QgcmVx
dWlyZWQNCj4+PiB2aWRlby1vdXRwdXQgaGVscGVycy4NCj4+Pg0KPj4+IFRoYXQgbWFrZXMg
c2Vuc2Ugc2luY2UgdGhlIGZhY3QgdGhhdCBhbGwgaGVscGVycyB3aWxsIGJlIGluIHRoZSBz
YW1lIG1vZHVsZQ0KPj4+IHdvdWxkIGJlIHRyYW5zcGFyZW50IHRvIGRyaXZlcnMuDQo+Pg0K
Pj4gQWZ0ZXIgc29tZSBtb3JlIHRlc3RpbmcsIGl0IHR1cm5zIG91dCB0byBiZSBub3Qgc28g
ZWFzeS4gRm9yIGV4YW1wbGUsIGlmDQo+PiB3ZSBoYXZlIERQX0hFTFBFUj1tIGFuZCBIRE1J
X0hFTFBFUj15LCB0aGVuIERJU1BMQVlfSEVMUEVSIHdvdWxkIGJlDQo+PiBhdXRvLXNlbGVj
dGVkIGFzICd5Jy4gVGhlIGNvZGUgZm9yIERQX0hFTFBFUiB3b3VsZCBub3QgYmUgbGlua2Vk
IGNvcnJlY3RseS4NCj4+DQo+PiBJJ20gZ29pbmcgdG8gbWFrZSBkcml2ZXJzIHNlbGVjdCBE
SVNQTEFZX0hFTFBFUiBhbmQgdGhlIHJzcCBoZWxwZXJzDQo+PiBleHBsaWNpdGx5LiBUaGUg
aW5kaXZpZHVhbCBoZWxwZXJzIHdvdWxkIGJlIGNvdmVyZWQgYm9vbGVhbiBvcHRpb25zIHRo
YXQNCj4+IGVuYWJsZSB0aGUgZmVhdHVyZSBpbiB0aGUgZGlzcGxheS1oZWxwZXIgbGlicmFy
eS4NCj4+DQo+PiBJZiB5b3Uga25vdyBzb21lIEtjb25maWcgbWFnaWMgdG8gZW5hYmxlIHRo
ZSBvcmlnaW5hbCBkZXNpZ24sIGxldCBtZSBrbm93Lg0KPj4NCj4gDQo+IEkgZG8gbm90LiBC
dXQgSSB3b25kZXIgaWYgdGhlIHByb2JsZW0gaGVyZSBpcyB0aGUgdXNhZ2Ugb2Ygc2VsZWN0
IHJhdGhlciB0aGFuDQo+IGRlcGVuZHMgYW5kIGlmIHdpdGggdGhlIGxhdGVyIHRoZSBvcmln
aW5hbCBkZXNpZ24gY291bGQgc3RpbGwgYmUgYWNoaWV2ZWQuLi4NCg0KV2l0aCAnZGVwZW5k
cyBEUk1fRElTUExBWV9IRUxQRVInIHVzZXJzIHdvdWxkIG5lZWQgdG8gZXhwbGljdGx5IGVu
YWJsZSANCkRSTV9ESVNQTEFZX0hFTFBFUiwgSSB0aGluay4NCg0KPiANCj4gQnV0IHllcywg
cHJvYmFibHkgdGhlIG9ubHkgd2F5IHRvIHByZXZlbnQgdGhhdCBpc3N1ZSBpcyB0byBtYWtl
IHRoZSBkcml2ZXJzDQo+IHRvIGV4cGxpY2l0bHkgc2VsZWN0IGJvdGggRFJNX0RJU1BMQVlf
SEVMUEVSIGFuZCByZXNwZWN0aXZlIGhlbHBlcnMgc3ltYm9sLg0KDQpJJ2xsIHJlbWFrZSB0
aGUgcGF0Y2hlcyB3aXRoIHRoZSBuZXcgc3R5bGUuDQoNCkkgdGhpbmsgYW5vdGhlciBpZGVh
IHRoYXQgY291bGQgd29yayBpcyB0byB1c2UgYW4gaW50ZXJtZWRpYXRlIHN5bWJvbC4gDQpG
b3IgRFAsIGRyaXZlcnMgd291bGQgc2VsZWN0IHRoZSB0cmlzdGF0ZSBEUF9IRUxQRVIsIHdo
aWNoIGluIHR1cm4gDQpzZWxlY3RzIHRyaXN0YXRlIERJU1BMQVlfSEVMUEVSIGFuZCBib29s
ZWFuIERJU1BMQVlfRFBfSEVMUEVSLiAgQnV0IHRoaXMgDQp3b3VsZCByZXF1aXJlIGEgJ3Vz
ZWxlc3MnIHN5bWJvbCBEUF9IRUxQRVIgb25seSBmb3IgY29udmVuaWVuY2UuICBJdCdzIA0K
YW4gZXZlbiBsZXNzIG9wdGltYWwgc29sdXRpb24sIGl0IHNlZW1zLg0KDQpCZXN0IHJlZ2Fy
ZHMNClRob21hcw0KDQo+ICAgLS0NCj4gQmVzdCByZWdhcmRzLA0KPiANCj4gSmF2aWVyIE1h
cnRpbmV6IENhbmlsbGFzDQo+IExpbnV4IEVuZ2luZWVyaW5nDQo+IFJlZCBIYXQNCj4gDQoN
Ci0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNV
U0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0
MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNj
aMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------zICi8JlSLG2cBVK1SvAvRq5w--

--------------HGOoObU01wOYjg6dYQ3m7lAE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJOmuIFAwAAAAAACgkQlh/E3EQov+Cg
NA/9EDSzFaefXsrl5N6XTZKcHDsUOcbiF76Nzsjbhlx5twJZGwoYjVhV1HPhJCtiyOY8Ez6spWDS
MzfqzrnwhewYWlRZn5Qc4vtf0d0V/kdgTWKwm7jjcRR5JDClrQc7EqGUBqJxo1C4BMWh7pZIRKgE
y7jmCu/rEZFdd36atIKp+RyX+C9F++4bGOy0VVC+cKZgI3CqKAt7e5wgNI4DcWcw5WVC1xN/b1ev
S35O3HwqHs+Buv6g0T03V4f5lZl7Xvb82+uA8E0+1KwocOCjQtsKNeDolEbN/FWw3JPULyW7XuuN
HYM6DD2Bu1qUOgkb1yzGhCvFyd34U2BK3DZgkSLs34Aj3R46FGAUjT63XAFqg7QzHCVIAbSggoNL
dFxug426PQJ8bPKR674sKTZB8NcgjNtA+UNvoPSu/9rQ5CwXFD9zTfbFb9hhgFl2SbltGnp1mWjf
M6hn4kI2Ru0MqZ5AjalTIDFFVDBemKTLbrxjMkqu7rR+fgGX5bv2HzGtfCVK62WpRWr7faiO1WOT
NSkYWQVs7OLSrVVDMarD0PmJbQg654BuVNB5nrsRrSGKyTJz9Wsye6PTIf50dE4r1W+cMH40ju6M
PIVG2/VAWsqCiJsbK5x3KT5xu8A0c/9PS4yWxRTKZE7bS71hD3GmKERudiOUHw4Uqrur5gwqpB00
4K4=
=ER34
-----END PGP SIGNATURE-----

--------------HGOoObU01wOYjg6dYQ3m7lAE--
