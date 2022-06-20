Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A1D551D90
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 16:25:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E17910E1F7;
	Mon, 20 Jun 2022 14:25:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33A8A10E194
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 14:25:40 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D4CF321B76;
 Mon, 20 Jun 2022 14:25:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1655735138; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/dVBdHezxTQ7D4mqTPvLhXptn4i8LCSJrKsc107CvWs=;
 b=pTF67kJcCTftyAxLRnS9JruxW4JFlUZHA0YWAeHLAoj5/gjGsgHV6NCO+Q9t5vHNUs2aDh
 cIMkKMIHQwotfFi2IkuJvsQlMp2nSZ87jS672G1zU0zBqR6GfNqxeZGa0kAG9GDl19bSBN
 eFC3W9YFriui0x8jM1ThElZhYXxwHCc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1655735138;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/dVBdHezxTQ7D4mqTPvLhXptn4i8LCSJrKsc107CvWs=;
 b=vEyrm3SCi5aq5ZwqFFfUqloVOl5G2LoL36ZrANQMSVHMO0UaVwGUTYLWaNMzqZbGlrXyku
 6epT+w1I6ad9O2Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B616A134CA;
 Mon, 20 Jun 2022 14:25:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id LNeIK2KDsGLgXgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 20 Jun 2022 14:25:38 +0000
Message-ID: <92f5306c-3808-b140-4845-f744df4c92fc@suse.de>
Date: Mon, 20 Jun 2022 16:25:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 09/64] drm/simple: Introduce drmm_simple_encoder_init
Content-Language: en-US
To: Maxime Ripard <maxime@cerno.tech>
References: <20220610092924.754942-1-maxime@cerno.tech>
 <20220610092924.754942-10-maxime@cerno.tech>
 <657a856a-53d6-a35d-e591-9f53d7c3941f@suse.de>
 <20220620134823.oqjrbnlsce3erhum@houat>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20220620134823.oqjrbnlsce3erhum@houat>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0Jzms13RcagS70lmoRrHsBTg"
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0Jzms13RcagS70lmoRrHsBTg
Content-Type: multipart/mixed; boundary="------------3WcluQArQQlmX1ahphjgA0og";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>
Cc: Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Message-ID: <92f5306c-3808-b140-4845-f744df4c92fc@suse.de>
Subject: Re: [PATCH 09/64] drm/simple: Introduce drmm_simple_encoder_init
References: <20220610092924.754942-1-maxime@cerno.tech>
 <20220610092924.754942-10-maxime@cerno.tech>
 <657a856a-53d6-a35d-e591-9f53d7c3941f@suse.de>
 <20220620134823.oqjrbnlsce3erhum@houat>
In-Reply-To: <20220620134823.oqjrbnlsce3erhum@houat>

--------------3WcluQArQQlmX1ahphjgA0og
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjAuMDYuMjIgdW0gMTU6NDggc2NocmllYiBNYXhpbWUgUmlwYXJkOg0KPiBI
aSwNCj4gDQo+IE9uIE1vbiwgSnVuIDIwLCAyMDIyIGF0IDEyOjQ0OjI0UE0gKzAyMDAsIFRo
b21hcyBaaW1tZXJtYW5uIHdyb3RlOg0KPj4gQW0gMTAuMDYuMjIgdW0gMTE6Mjggc2Nocmll
YiBNYXhpbWUgUmlwYXJkOg0KPj4+IFRoZSBEUk0tbWFuYWdlZCBmdW5jdGlvbiB0byByZWdp
c3RlciBhbiBlbmNvZGVyIGlzDQo+Pj4gZHJtbV9zaW1wbGVfZW5jb2Rlcl9hbGxvYygpIGFu
ZCBpdHMgdmFyaWFudHMsIHdoaWNoIHdpbGwgYWxsb2NhdGUgdGhlDQo+Pj4gdW5kZXJseWlu
ZyBzdHJ1Y3R1cmUgYW5kIGluaXRpYWxpc2F0aW9uIHRoZSBlbmNvZGVyLg0KPj4+DQo+Pj4g
SG93ZXZlciwgd2UgbWlnaHQgd2FudCB0byBzZXBhcmF0ZSB0aGUgc3RydWN0dXJlIGNyZWF0
aW9uIGFuZCB0aGUgZW5jb2Rlcg0KPj4+IGluaXRpYWxpc2F0aW9uLCBmb3IgZXhhbXBsZSBp
ZiB0aGUgc3RydWN0dXJlIGlzIHNoYXJlZCBhY3Jvc3MgbXVsdGlwbGUgRFJNDQo+Pj4gZW50
aXRpZXMsIGZvciBleGFtcGxlIGFuIGVuY29kZXIgYW5kIGEgY29ubmVjdG9yLg0KPj4+DQo+
Pj4gTGV0J3MgY3JlYXRlIGFuIGhlbHBlciB0byBvbmx5IGluaXRpYWxpc2UgYW4gZW5jb2Rl
ciB0aGF0IHdvdWxkIGJlIHBhc3NlZA0KPj4+IGFzIGFuIGFyZ3VtZW50Lg0KPj4+DQo+Pg0K
Pj4gVGhlcmUncyBub3RoaW5nIHdyb25nIHdpdGggdGhpcyBwYXRjaCwgYnV0IEkgaGF2ZSB0
byBhZG1pdCB0aGF0IGFkZGluZw0KPj4gZHJtX3NpbXBsZV9lbmNvZGVyX2luaXQoKSBldCBh
bCB3YXMgYSBtaXN0YWtlLg0KPiANCj4gV2h5IGRvIHlvdSB0aGluayBpdCB3YXMgYSBtaXN0
YWtlPw0KDQpUaGUgc2ltcGxlLWVuY29kZXIgc3R1ZmYgaXMgYW4gaW50ZXJmYWNlIHRoYXQg
bm8gb25lIHJlYWxseSBuZWVkcy4gDQpDb21wYXJlZCB0byBvcGVuLWNvZGluZyB0aGUgZnVu
Y3Rpb24sIGl0J3MgYmFyZWx5IGFuIGltcHJvdmVtZW50IGluIA0KTE9DcywgYnV0IG5vdGhp
bmcgZWxzZS4NCg0KQmFjayB3aGVuIEkgYWRkZWQgZHJtX3NpbXBsZV9lbmNvZGVyX2luaXQo
KSwgSSB3YW50ZWQgdG8gc2ltcGxpZnkgdGhlIA0KbWFueSBkcml2ZXJzIHRoYXQgaW5pdGlh
bGl6ZWQgdGhlIGVuY29kZXIgd2l0aCBhIGNsZWFudXAgY2FsbGJhY2sgYW5kIA0Kbm90aGlu
ZyBlbHNlLiAgSUlSQyBpdCB3YXMgYW4gaW1wcm92ZW1lbnQgYmFjayB0aGVuLiAgQnV0IG5v
dyB3ZSBhbHJlYWR5IA0KaGF2ZSBhIHJlbGF0ZWQgZHJtbV8gaGVscGVyIGFuZCBhIGRybW1f
YWxsb2NfIGhlbHBlci4gSWYgSSBoYWQgb25seSANCmFkZGVkIHRoZSBtYWNybyBiYWNrIHRo
ZW4sIHdlIGNvdWxkIHVzZSB0aGUgcmVndWxhciBlbmNvZGVyIGhlbHBlcnMuDQoNCj4gDQo+
PiBJdCB3b3VsZCBoYXZlIGJlZW4gYmV0dGVyIHRvIGFkZCBhbiBpbml0aWFsaXplciBtYWNy
byBsaWtlDQo+Pg0KPj4gI2RlZmluZSBEUk1fU1RBVElDX0VOQ09ERVJfREVGQVVMVF9GVU5D
UyBcDQo+PiAgICAuZGVzdHJveSA9IGRybV9lbmNvZGVyX2NsZWFudXANCj4+DQo+PiBJdCdz
IHdheSBtb3JlIGZsZXhpYmxlIGFuZCBzaW1pbGFybHkgZWFzeSB0byB1c2UuIEFueXdheS4u
Lg0KPiANCj4gV2UgY2FuIHN0aWxsIGhhdmUgdGhpcy4gSXQgd291bGQgc2ltcGxpZnkgdGhp
cyBzZXJpZXMgc28gSSBjb3VsZA0KPiBkZWZpbml0ZWx5IHNxdWVlemUgdGhhdCBwYXRjaCBp
biBhbmQgYWRkIGEgVE9ETyBpdGVtIC8gZGVwcmVjYXRpb24NCj4gbm90aWNlIGZvciBzaW1w
bGUgZW5jb2RlcnMgaWYgeW91IHRoaW5rIGl0J3MgbmVlZGVkDQoNCk5vdCBuZWNlc3Nhcnku
IEl0J3Mgbm90IHN1cGVyIGltcG9ydGFudC4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0K
PiANCj4gTWF4aW1lDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZl
ciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4
ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBO
w7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------3WcluQArQQlmX1ahphjgA0og--

--------------0Jzms13RcagS70lmoRrHsBTg
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmKwg2IFAwAAAAAACgkQlh/E3EQov+AB
DA//VpWvoqAnl3564EgdLKZkB58bGnhlsPNvfYCnkaWNCOUfajwqnjhBPmULBXG1uRdUC9jFWkf5
g+egj2GFTiXMlBem4avNM94z49JBXPPblvNuwCt5V/RIaw0c3LvXQ6gPceFBjLnDCYhJJjLhNLe1
AGumurw7FbQxzl/29XYyJGxv0ugegRmDoLOMJI/mn8f3XUxPxfWrkzlTlmtW5RuH/LyAh3VEdsdZ
NkapVKUJFDzIwgy0Mihe3i7VdRJQbOO4THtj99f2eS7mCi3wrftZ4jZkWPmKYb8iSbDMutW+TVur
KT7LwkKs6Bdi/Y1y6N7o72gIcXDnzqiM912nIaDEJ0hkZ3EYOqgGUyvGbzgraRsrbOu+RvhTxrQA
0w8GJMY47LmFhb+f4S5YjXJGrOKAAq4/o6TiePUWD6rM6mnpAUGc0Ib403OMMRfo7thXcrd1ImPC
X14tCOe0PH4XzT8D9ZsAO3t42jORTRmFYkfTvIkl1Fa3TZUYw4dZo8SPUWuBrUrQ7BrE1v15w9SU
3dh6IHH6hXbbLNPgdXvgP/ucmrPv8BIq34nvbZYJvhwbrKaiyH1vE0JyMiHYxSyHb1YKmRFH2vCq
xJb4aDl0JENMVyh0RNJ8HBXqAbX3hZ8I3XPehfliFoqvxPvISD94SBJ0o9+vqO8VZNCRsBtJysRJ
l2s=
=PxV1
-----END PGP SIGNATURE-----

--------------0Jzms13RcagS70lmoRrHsBTg--
