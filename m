Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3799861EF57
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 10:43:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B28010E2AA;
	Mon,  7 Nov 2022 09:43:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD62310E2AA
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 09:42:57 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D4C3B1F88B;
 Mon,  7 Nov 2022 09:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1667814175; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QzEWdu6e7M4luD+tQt+9o9J2Cyj3obsCMGHykj3rMSQ=;
 b=fsm4Fmq+x0mBl7Wn7dSdkAeydNi5vC/4zF7oGcUg1FAciVsyZc4V7HQjWns6Si9qLytIWd
 tNUctiJyx8zGPTZJAYz4oVpwK0coJlqniM6SN1BeScLXP2Pk5nIesu2weCECagU8wIeiWg
 /JmXY87DqN48U1SAw5akNO0o3sHPCvA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1667814175;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QzEWdu6e7M4luD+tQt+9o9J2Cyj3obsCMGHykj3rMSQ=;
 b=c/CmwtQDeWJiofJCd7x9hoLE1LXF6W8jCybM7Fd86lJ4fucSKb1kkAZ5jp/X6GOIBa78w0
 ptnCHvC5LlVD/9Cw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 981D313AC7;
 Mon,  7 Nov 2022 09:42:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id gSxAJB/TaGNWVgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 07 Nov 2022 09:42:55 +0000
Message-ID: <555dc349-4838-3c24-b35e-38aa8afd9f1d@suse.de>
Date: Mon, 7 Nov 2022 10:42:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: Must-Pass Test Suite for KMS drivers
To: Maxime Ripard <maxime@cerno.tech>
References: <20221024124323.tfyxcadyd4nz56jz@houat>
 <f3341ef6-4634-39e4-9bbc-e49e0aa806ee@suse.de>
 <20221107093057.5w7kdc3pjq77upng@houat>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20221107093057.5w7kdc3pjq77upng@houat>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------zqR5mzhmUVw8ymEqjP9iQ7No"
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
Cc: Petri Latvala <petri.latvala@intel.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, Martin Roukala <martin.roukala@mupuf.org>,
 dri-devel@lists.freedesktop.org, igt-dev@lists.freedesktop.org,
 Arkadiusz Hiler <arek@hiler.eu>, Daniel Vetter <daniel.vetter@intel.com>,
 Phil Elwell <phil@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------zqR5mzhmUVw8ymEqjP9iQ7No
Content-Type: multipart/mixed; boundary="------------bnNkm0Bqwa7CFb02lq20reJW";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>
Cc: Petri Latvala <petri.latvala@intel.com>,
 Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@linux.ie>, Martin Roukala <martin.roukala@mupuf.org>,
 dri-devel@lists.freedesktop.org, igt-dev@lists.freedesktop.org,
 Arkadiusz Hiler <arek@hiler.eu>, Daniel Vetter <daniel.vetter@intel.com>,
 Phil Elwell <phil@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>
Message-ID: <555dc349-4838-3c24-b35e-38aa8afd9f1d@suse.de>
Subject: Re: Must-Pass Test Suite for KMS drivers
References: <20221024124323.tfyxcadyd4nz56jz@houat>
 <f3341ef6-4634-39e4-9bbc-e49e0aa806ee@suse.de>
 <20221107093057.5w7kdc3pjq77upng@houat>
In-Reply-To: <20221107093057.5w7kdc3pjq77upng@houat>

--------------bnNkm0Bqwa7CFb02lq20reJW
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDcuMTEuMjIgdW0gMTA6MzAgc2NocmllYiBNYXhpbWUgUmlwYXJkOg0KPiBI
aSBUaG9tYXMsDQo+IA0KPiBPbiBGcmksIE9jdCAyOCwgMjAyMiBhdCAwOTozMTozOEFNICsw
MjAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4+IEFtIDI0LjEwLjIyIHVtIDE0OjQz
IHNjaHJpZWIgbWF4aW1lQGNlcm5vLnRlY2g6DQo+Pj4gSSd2ZSBkaXNjdXNzaW5nIHRoZSBp
ZGVhIGZvciB0aGUgcGFzdCB5ZWFyIHRvIGFkZCBhbiBJR1QgdGVzdCBzdWl0ZSB0aGF0DQo+
Pj4gYWxsIHdlbGwtYmVoYXZlZCBLTVMgZHJpdmVycyBtdXN0IHBhc3MuDQo+Pj4NCj4+PiBU
aGUgbWFpbiBpZGVhIGJlaGluZCBpdCBjb21lcyBmcm9tIHY0bDItY29tcGxpYW5jZSBhbmQg
Y2VjLWNvbXBsaWFuY2UsDQo+Pj4gdGhhdCBhcmUgYmVpbmcgdXNlZCB0byB2YWxpZGF0ZSB0
aGF0IHRoZSBkcml2ZXJzIGFyZSBzYW5lLg0KPj4+DQo+Pj4gV2Ugc2hvdWxkIHByb2JhYmx5
IHN0YXJ0IGJ1aWxkaW5nIHVwIHRoZSB0ZXN0IGxpc3QsIGFuZCBldmVudHVhbGx5DQo+Pj4g
bWFuZGF0ZSB0aGF0IGFsbCB0ZXN0cyBwYXNzIGZvciBhbGwgdGhlIG5ldyBLTVMgZHJpdmVy
cyB3ZSB3b3VsZCBtZXJnZQ0KPj4+IGluIHRoZSBrZXJuZWwsIGFuZCBiZSBydW4gYnkgS0Np
IG9yIHNpbWlsYXIuDQo+Pj4NCj4+PiBJIGRpZCBhIGZpcnN0IHBhc3MgdG8gY3JlYXRlIGEg
ZHJhZnQgb2Ygc3VjaCBhIHRlc3Qtc3VpdGUsIHdoaWNoIHdvdWxkDQo+Pj4gY29udGFpbjoN
Cj4+Pg0KPj4+IGlndEBjb3JlX2F1dGhAYmFzaWMtYXV0aA0KPj4+IGlndEBjb3JlX2F1dGhA
Z2V0Y2xpZW50LW1hc3Rlci1kcm9wDQo+Pj4gaWd0QGNvcmVfYXV0aEBnZXRjbGllbnQtc2lt
cGxlDQo+Pj4gaWd0QGNvcmVfYXV0aEBtYW55LW1hZ2ljcw0KPj4+IGlndEBjb3JlX2dldGNs
aWVudA0KPj4+IGlndEBjb3JlX2dldHN0YXRzDQo+Pj4gaWd0QGNvcmVfZ2V0dmVyc2lvbg0K
Pj4+IGlndEBjb3JlX2hvdHVucGx1Z0Bob3RyZWJpbmQtbGF0ZWNsb3NlDQo+Pj4gaWd0QGNv
cmVfaG90dW5wbHVnQGhvdHVuYmluZC1yZWJpbmQNCj4+PiBpZ3RAY29yZV9ob3R1bnBsdWdA
dW5iaW5kLXJlYmluZA0KPj4+IGlndEBjb3JlX3NldG1hc3Rlcg0KPj4+IGlndEBjb3JlX3Nl
dG1hc3Rlcl92c19hdXRoDQo+Pj4gaWd0QGRldmljZV9yZXNldEB1bmJpbmQtcmVzZXQtcmVi
aW5kDQo+Pj4gaWd0QGRybV9yZWFkDQo+Pj4gaWd0QGR1bWJfYnVmZmVyDQo+Pj4gaWd0QGZi
ZGV2DQo+Pg0KPj4gTWF5YmUgd2UgbWFrZSB0aGlzIHRlc3Qgb3B0aW9uYWw/IEF0IGxlYXN0
IHNwcmQgZGVjaWRlZCB0byBub3Qgc3VwcG9ydCBmYmRldg0KPj4gYXQgYWxsLg0KPiANCj4g
SSdtIG5vdCBzdXJlIHdlIG5lZWQgdG8gbWFrZSB0aGF0IHRlc3Qgb3B0aW9uYWwsIG9yIGF0
IGxlYXN0LCB3ZSBzaG91bGQNCj4gcnVuIGl0IGFsbCB0aGUgdGltZSwgYnV0IHNraXAgaXQg
aWYgdGhlcmUncyBubyBmYmRldiBlbXVsYXRpb24sIGFuZCBub3QNCj4gcmVwb3J0IGl0IGFz
IGEgZmFpbHVyZT8NCg0KU3VyZS4gSSBqdXN0IG1lYW50IHRoYXQgZmJkZXYgc3VwcG9ydCBz
aG91bGRuJ3QgYmUgYSBibG9ja2VyLiBJZiB0aGVyZSwgDQppdCBzaG91bGQgd29yayBvZiBj
b3Vyc2UuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IE1heGltZQ0KDQotLSAN
ClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNv
ZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7D
vHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0
c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------bnNkm0Bqwa7CFb02lq20reJW--

--------------zqR5mzhmUVw8ymEqjP9iQ7No
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmNo0x4FAwAAAAAACgkQlh/E3EQov+BC
Bg//a6I/uQxFvzzNQE7zTF07BhkKKAaI/KROOhV0gG+M1Uyzznx47MXZg/6wak4t5xVEZ0+DuCt4
GwfR+XiR6c+OY7jk7SomrDL5iDWOoP++pvDs09+ifHH62oFH+W5dpRCLneBo+UucibhQyoVcyiuV
OGXjCjHa0ZevJtK41yOZlTYKUTxrPQ/PU1Rzqr0CPhjnsZE+SMLLfcPVOXD0DmVx9SicejVWx8jO
Mak0l+svXdOOz5kbblQCY4s4fC54T2ELdwa8Ti/JfoxikqcPAQKZ2kIijv/gfRxBDOA8ZVg/zZQd
V6b+ARHJ6hk4jT+3BwOlQvjVbK9g1TaSsYaM1I1Bgi8ACQxF/dzKn3fKv/2VTzt4d8YTtc0Ov4m8
rS/E3veLwMuceFg77hlbuARF0lvtECpunfG9r5fbP0LUizP4mXBpFutsaOHLqL+/cDlJNZtx/eX1
3tftmIDhmJfKc+laEuV7xrx+kHHArvnpvh7CzxcK04pwIOxPlZC3jpGHLFpXO9iaTCP3eoazLIsb
zxzwk9m88rr82lzuA4H6yLbjrnoXwxiaWTiRruQ/PAKWt1ykkkgXpMiMmye29vkwln5x8ZvBVcv/
H6vNnXieLD8KEixKdlOB799aquZcNwr+5ZvnYwhclnmhJ2eVairvoXhY4mpqKTMshxhgb0WnIwVa
LTo=
=z4VL
-----END PGP SIGNATURE-----

--------------zqR5mzhmUVw8ymEqjP9iQ7No--
