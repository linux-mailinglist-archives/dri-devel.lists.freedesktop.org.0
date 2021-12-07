Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7103346B5AC
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 09:24:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74AA372E00;
	Tue,  7 Dec 2021 08:24:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9AAD6EEAB;
 Tue,  7 Dec 2021 08:24:29 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 4FA741FD2F;
 Tue,  7 Dec 2021 08:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1638865468; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W5jLcuZazUUuw7Whz1Rf5Umfdfm36PuIGLfkgkEGDdI=;
 b=NIr8H9om47imH9l6dS2YzZGMnR9CpiXsKX6idihqwLUo5nGE9CqVAgr40ej1lUO4z8My8l
 g3PzWRRQ2soAjftQemCR4KdI30I8ymXOdTIuwrTexjX7bP7MWPUvdGHLtlwYda6P+Kt700
 HtzrSd09YaEpYy6ALkFMPpBWdWoCaYs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1638865468;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W5jLcuZazUUuw7Whz1Rf5Umfdfm36PuIGLfkgkEGDdI=;
 b=CKnPnB/+/8UjuSviLRiL4ao7JDmKNE94EibNmxWuVAWK8LXz+lfsptjx5XD8kmckYSayZR
 aHXuiu7XWTFSKBBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0D23413524;
 Tue,  7 Dec 2021 08:24:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Wb0sAjwar2HpMgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 07 Dec 2021 08:24:28 +0000
Message-ID: <53405618-2e3d-c15b-d971-be2543c116f7@suse.de>
Date: Tue, 7 Dec 2021 09:24:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH] drm: Return error codes from struct
 drm_driver.gem_create_object
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@oracle.com>
References: <20211130095255.26710-1-tzimmermann@suse.de>
 <20211206104233.GD1978@kadam> <4fa29fcb-f936-b590-7691-90f0579a54ae@suse.de>
 <20211206144007.GE1978@kadam>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20211206144007.GE1978@kadam>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------YqtB29ll08H1k4R4vBHkaEMY"
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
Cc: emma@anholt.net, tomeu.vizoso@collabora.com, airlied@linux.ie,
 alyssa.rosenzweig@collabora.com, dri-devel@lists.freedesktop.org,
 steven.price@arm.com, gurchetansingh@chromium.org, kraxel@redhat.com,
 yuq825@gmail.com, virtualization@lists.linux-foundation.org,
 lima@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------YqtB29ll08H1k4R4vBHkaEMY
Content-Type: multipart/mixed; boundary="------------1XXEJVdHYUw0EmXVSVAtRq8S";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: kraxel@redhat.com, emma@anholt.net, tomeu.vizoso@collabora.com,
 airlied@linux.ie, dri-devel@lists.freedesktop.org, steven.price@arm.com,
 lima@lists.freedesktop.org, yuq825@gmail.com, gurchetansingh@chromium.org,
 virtualization@lists.linux-foundation.org, alyssa.rosenzweig@collabora.com
Message-ID: <53405618-2e3d-c15b-d971-be2543c116f7@suse.de>
Subject: Re: [PATCH] drm: Return error codes from struct
 drm_driver.gem_create_object
References: <20211130095255.26710-1-tzimmermann@suse.de>
 <20211206104233.GD1978@kadam> <4fa29fcb-f936-b590-7691-90f0579a54ae@suse.de>
 <20211206144007.GE1978@kadam>
In-Reply-To: <20211206144007.GE1978@kadam>

--------------1XXEJVdHYUw0EmXVSVAtRq8S
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDYuMTIuMjEgdW0gMTU6NDAgc2NocmllYiBEYW4gQ2FycGVudGVyOg0KPiBP
biBNb24sIERlYyAwNiwgMjAyMSBhdCAxMjoxNjoyNFBNICswMTAwLCBUaG9tYXMgWmltbWVy
bWFubiB3cm90ZToNCj4+IEhpDQo+Pg0KPj4gQW0gMDYuMTIuMjEgdW0gMTE6NDIgc2Nocmll
YiBEYW4gQ2FycGVudGVyOg0KPj4+IE9uIFR1ZSwgTm92IDMwLCAyMDIxIGF0IDEwOjUyOjU1
QU0gKzAxMDAsIFRob21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4+PiBHRU0gaGVscGVyIGxp
YnJhcmllcyB1c2Ugc3RydWN0IGRybV9kcml2ZXIuZ2VtX2NyZWF0ZV9vYmplY3QgdG8gbGV0
DQo+Pj4+IGRyaXZlcnMgb3ZlcnJpZGUgR0VNIG9iamVjdCBhbGxvY2F0aW9uLiBPbiBmYWls
dXJlLCB0aGUgY2FsbCByZXR1cm5zDQo+Pj4+IE5VTEwuDQo+Pj4+DQo+Pj4+IENoYW5nZSB0
aGUgc2VtYW50aWNzIHRvIG1ha2UgdGhlIGNhbGxzIHJldHVybiBhIHBvaW50ZXItZW5jb2Rl
ZCBlcnJvci4NCj4+Pj4gVGhpcyBhbGlnbnMgdGhlIGNhbGxiYWNrIHdpdGggaXRzIGNhbGxl
cnMuIEZpeGVzIHRoZSBpbmdlbmljIGRyaXZlciwNCj4+Pj4gd2hpY2ggYWxyZWFkeSByZXR1
cm5zIGFuIGVycm9yIHBvaW50ZXIuDQo+Pj4+DQo+Pj4+IEFsc28gdXBkYXRlIHRoZSBjYWxs
ZXJzIHRvIGhhbmRsZSB0aGUgaW52b2x2ZWQgdHlwZXMgbW9yZSBzdHJpY3RseS4NCj4+Pj4N
Cj4+Pj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1
c2UuZGU+DQo+Pj4+IC0tLQ0KPj4+PiBUaGVyZSBpcyBhbiBhbHRlcm5hdGl2ZSBwYXRjaCBh
dCBbMV0gdGhhdCB1cGRhdGVzIHRoZSB2YWx1ZSByZXR1cm5lZA0KPj4+PiBieSBpbmdlbmlj
cycgZ2VtX2NyZWF0ZV9vYmplY3QgdG8gTlVMTC4gRml4aW5nIHRoZSBpbnRlcmZhY2UgdG8g
cmV0dXJuDQo+Pj4+IGFuIGVycm5vIGNvZGUgaXMgbW9yZSBjb25zaXN0ZW50IHdpdGggdGhl
IHJlc3Qgb2YgdGhlIEdFTSBmdW5jdGlvbnMuDQo+Pj4+DQo+Pj4+IFsxXSBodHRwczovL2xv
cmUua2VybmVsLm9yZy9kcmktZGV2ZWwvMjAyMTExMTgxMTE1MjIuR0QxMTQ3QGtpbGkvDQo+
Pj4NCj4+PiBNeSBmaXggd2FzIGFscmVhZHkgYXBwbGllZCBhbmQgYmFja3BvcnRlZCB0byAt
c3RhYmxlIGV0Yy4uLiAgWW91cg0KPj4+IHBhdGNoIGlzIG5vdCBkZXZlbG9wZWQgYWdhaW5z
dCBhIGN1cnJlbnQgdHJlZSBzbyB5b3UgYnJva2UgaXQuDQo+Pg0KPj4gRG8geW91IGhhdmUg
YSBzcGVjaWZpYyBsaW5rPyBJIGp1c3QgY2hlY2tlZCB0aGUgc3RhYmxlIHRyZWUgYXQgWzFd
IGFuZCB0aGVyZQ0KPj4gbm8gdHJhY2Ugb2YgeW91ciBwYXRjaC4NCj4gDQo+IEl0J3MgaW4g
NS4xNS42IGFuZCBwcm9iYWJseSBhbGwgdGhlIG90aGVyIHN1cHBvcnRlZCAtc3RhYmxlIHRy
ZWVzLg0KPiANCj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5l
bC9naXQvc3RhYmxlL2xpbnV4LmdpdC90cmVlL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2Jv
LmM/aD12NS4xNS42I24zODcNCg0KSSdtIG5vdCBzdXJlIHRoYXQgSSB1bmRlcnN0YW5kIHRo
ZSBwcm9ibGVtLg0KDQpUaGUgVVJMIHBvaW50cyB0byB2YzQsIGJ1dCBteSBsaW5rIHdhcyB0
byB5b3VyIHBhdGNoIGZvciBpbmdlbmljLiB2YzQgaXMgDQpiZWluZyB1cGRhdGVkIGhlcmUg
YXMgd2VsbCB0byBFUlJfUFRSLiBUaGUgaW5nZW5pYyBwYXRjaCBuZXZlciBtYWRlIGl0IA0K
aW50byBhbnkgdHJlZS4gSXQgYWN0dWFsbHkgd2FzIHRoZSByZWFzb24gdG8gZml4IHRoZSBp
bnRlcmZhY2UuDQoNCldoZW4gdGhlIGN1cnJlbnQgcGF0Y2ggbWFrZXMgaXQgdGhyb3VnaCB0
aGUgdHJlZXMsIGl0IHNob3VsZCBmaXggYWxsIHRoZSANCmFmZmVjdGVkIGRyaXZlcnMuDQoN
CkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+Pg0KPj4gUGF0Y2hlcyBmb3IgRFJNIHNo
b3VsZCBnbyB0aHJvdWdoIHRocm91Z2ggRFJNIHRyZWVzOyBkcm0tbWlzYy1maXhlcyBpbiB0
aGlzDQo+PiBjYXNlLiBFeGNlcHRpb25zIHNob3VsZCBhdCBsZWFzdCBiZSBhbm5vdW5jZSBv
biBkcmktZGV2ZWwuIE5laXRoZXIgaXMgdGhlDQo+PiBjYXNlIGhlcmUuDQo+IA0KPiBZZWFo
LiAgVGhhdCdzIGEgZ29vZCBxdWVzdGlvbi4gIEkgZG9uJ3Qga25vdywgYmVjYXVzZSBJIGp1
c3Qgd29yaw0KPiBhZ2FpbnN0IGxpbnV4LW5leHQuLi4NCj4gDQo+IHJlZ2FyZHMsDQo+IGRh
biBjYXJwZW50ZXINCj4gDQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGlj
cyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdt
YkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgw
OSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------1XXEJVdHYUw0EmXVSVAtRq8S--

--------------YqtB29ll08H1k4R4vBHkaEMY
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmGvGjsFAwAAAAAACgkQlh/E3EQov+Ab
gA//Rd8fa13VzfiH9eC9nn8ZqBlTTGyOWGNHPZNU0JpnWhs3jHRtcWdk8ZpfEu0j+zZFT73gZzda
9lAFCde81ZCzlBsz8iU9M8k4rT8Zt88Zy3BuNQen+cTVMAkzimMuxVg8i0prwIgJ2q8ZkQqBusC6
XP9sdcEyfDd65TxktaXWAoW5iy5kjkJxdEVhYHPJuj1ZnY1IwuU1PJY1+rUEHEcLCasjtDvMWd+G
mCOE9Ctsiz/Agtx8a2nd4Iwfd26GdNuAesx/OvJjHhEtu5YW5SdQ9nBlBkEhTyUat7VjrXpT8CjM
jsyN7oPGi4Tm4Uo1/tYhaTTCwozso8GAO+gMQiMUlwJJzOgkb7rGAmSXcAl7r45qU1dIMYdDfs4J
kdD8SZ1KqepKNa/9B6+qx2P8L7EHijd7IbovO1OJTdA4Bleqyyk6SfOvRfa8wQ+XrUXkdBRBg2D+
kk0NOqtqJ7veB3xsiHYxWTccQoRa7PdL+3hIU97905tajG3KFgfcUM6fyCptc/MCr/IapoJNUrCN
qySziCpuDZhKmpk39bQGthYdmfN//9lG9kJIXbmHET7+LCy8gxJ6PeYMKwBmSsIHuLbpNzEokVI2
sAM37xJXlHjqGtF6XHDW67UqEnIhz/nnWhl94IeO5KU7F89PWNLdlWSTRQbPFGL4QpPv7ETkgBRg
KK4=
=j7UY
-----END PGP SIGNATURE-----

--------------YqtB29ll08H1k4R4vBHkaEMY--
