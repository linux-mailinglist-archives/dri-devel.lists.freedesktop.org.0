Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D00A5B6BF9
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 12:54:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0CB710E69C;
	Tue, 13 Sep 2022 10:54:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C70C310E69C;
 Tue, 13 Sep 2022 10:54:34 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7D35F34BA6;
 Tue, 13 Sep 2022 10:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663066473; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FdW1AqvRUt3+v84bGrYsTuhpsSGsB9wBPQ/lhfmIcXE=;
 b=XDh+ISmnShASCGPKpcVPnqDCB7K+8OFGNN0dMwIvBU8byil6Vcnx2VNKYD2s0Mh2gtdMWo
 XMZezyjISVZ9ux2r8qQxOE0iJkwZ/LCGrRuD8STUiRoJhMC9aflQdHusoGTrw94Q7OgY4b
 Qu/kjZ9JePlTfwXUIhi6goYeSAnhOPU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663066473;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FdW1AqvRUt3+v84bGrYsTuhpsSGsB9wBPQ/lhfmIcXE=;
 b=IlxxHs232ICv4Lqaojzmk9gmIaLt+05IDzzL5/jGh21iZHo6GrR+RJzN82OVWBz4e/oXPh
 ORwdiAxMBsB5PCDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4DD05139B3;
 Tue, 13 Sep 2022 10:54:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id pkbgEWlhIGNLVgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 13 Sep 2022 10:54:33 +0000
Message-ID: <a496bb39-982c-300a-efb5-918503783ca6@suse.de>
Date: Tue, 13 Sep 2022 12:54:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 0/4] Fixes for damage clips handling
Content-Language: en-US
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
References: <20220823112920.352563-1-jouni.hogander@intel.com>
 <YyBHkmeIy5VD36u1@intel.com>
 <f3ffd5df9d48222e459ff091961ea4ea7c4a411f.camel@intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <f3ffd5df9d48222e459ff091961ea4ea7c4a411f.camel@intel.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------ZwvUsJt5kEHWChE1Mf0bT3HY"
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
Cc: "Nikula, Jani" <jani.nikula@intel.com>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "Souza,
 Jose" <jose.souza@intel.com>, "mairacanal@riseup.net" <mairacanal@riseup.net>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Kahola,
 Mika" <mika.kahola@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------ZwvUsJt5kEHWChE1Mf0bT3HY
Content-Type: multipart/mixed; boundary="------------o4tnIX1ZnCyorJbgXgVmRgnr";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
Cc: "Nikula, Jani" <jani.nikula@intel.com>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "mairacanal@riseup.net" <mairacanal@riseup.net>,
 "Souza, Jose" <jose.souza@intel.com>, "Kahola, Mika" <mika.kahola@intel.com>
Message-ID: <a496bb39-982c-300a-efb5-918503783ca6@suse.de>
Subject: Re: [PATCH v2 0/4] Fixes for damage clips handling
References: <20220823112920.352563-1-jouni.hogander@intel.com>
 <YyBHkmeIy5VD36u1@intel.com>
 <f3ffd5df9d48222e459ff091961ea4ea7c4a411f.camel@intel.com>
In-Reply-To: <f3ffd5df9d48222e459ff091961ea4ea7c4a411f.camel@intel.com>

--------------o4tnIX1ZnCyorJbgXgVmRgnr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTMuMDkuMjIgdW0gMTI6NDcgc2NocmllYiBIb2dhbmRlciwgSm91bmk6DQo+
IE9uIFR1ZSwgMjAyMi0wOS0xMyBhdCAxMjowNCArMDMwMCwgVmlsbGUgU3lyasOkbMOkIHdy
b3RlOg0KPj4gT24gVHVlLCBBdWcgMjMsIDIwMjIgYXQgMDI6Mjk6MTZQTSArMDMwMCwgSm91
bmkgSMO2Z2FuZGVyIHdyb3RlOg0KPj4+IEN1cnJlbnRseSBkYW1hZ2UgY2xpcHMgaGFuZGxp
bmcgaXMgYnJva2VuIGZvciBwbGFuZXMgd2hlbiB1c2luZyBiaWcNCj4+PiBmcmFtZWJ1ZmZl
ciArIG9mZnNldCBpbiBjYXNlIGttcyBkcml2ZXIgYWRqdXN0cyBkcm1fcGxhbmVfc3RhdGUu
c3JjDQo+Pj4gY29vcmRzLiBUaGlzIGlzIGJlY2F1c2UgZGFtYWdlIGNsaXBzIGFyZSB1c2lu
ZyBjb29yZHMgcmVsYXRpdmUgdG8NCj4+PiBvcmlnaW5hbCBjb29yZHMgZnJvbSB1c2VyLXNw
YWNlLg0KPj4+DQo+Pj4gVGhpcyBwYXRjaHNldCBpcyBmaXhpbmcgdGhpcyBieSB1c2luZyBv
cmlnaW5hbA0KPj4+IGNvb3JkcyBmcm9tIHVzZXItc3BhY2UgaW5zdGVhZCBvZiBkcm1fcGxh
bmVfc3RhdGUuc3JjIHdoZW4NCj4+PiBpdGVyYXRpbmcNCj4+PiBkYW1hZ2VfY2xpcHMuDQo+
Pj4NCj4+PiB2MjogTW9kaWZ5IGRybSB1bml0IHRlc3RzIGFjY29yZGluZ2x5DQo+Pj4NCj4+
PiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4NCj4+PiBDYzog
TWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4N
Cj4+PiBDYzogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4NCj4+PiBDYzog
VmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4NCj4+PiBD
YzogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+DQo+Pj4g
Q2M6IE1pa2EgS2Fob2xhIDxtaWthLmthaG9sYUBpbnRlbC5jb20+DQo+Pj4gQ2M6IE1hw61y
YSBDYW5hbCA8bWFpcmFjYW5hbEByaXNldXAubmV0Pg0KPj4+DQo+Pj4gSm91bmkgSMO2Z2Fu
ZGVyICg0KToNCj4+PiAgwqAgZHJtOiBVc2Ugb3JpZ2luYWwgc3JjIHJlY3Qgd2hpbGUgaW5p
dGlhbGl6aW5nIGRhbWFnZSBpdGVyYXRvcg0KPj4+ICDCoCBkcm0vaTkxNS9kaXNwbGF5OiBV
c2Ugb3JpZ2luYWwgc3JjIGluIHBzcjIgc2VsIGZldGNoIGFyZWENCj4+PiBjYWxjdWxhdGlv
bg0KPj4+ICDCoCBkcm0vaTkxNS9kaXNwbGF5OiBVc2UgZHJtIGhlbHBlciBpbnN0ZWFkIG9m
IG93biBsb29wIGZvciBkYW1hZ2UNCj4+PiBjbGlwcw0KPj4+ICDCoCBkcm0vdGVzdHM6IFNl
dCBhbHNvIG1vY2sgcGxhbmUgc3JjX3gsIHNyY195LCBzcmNfdyBhbmQgc3JjX2gNCj4+DQo+
PiBEbyB0aGVzZSBuZWVkIHRvIGJlIGFwcGxpZWQgaW50byB0aGUgc2FtZSB0cmVlLCBvciBj
YW4NCj4+IHRoZSBkcm0gdnMuIGk5MTUgc3R1ZmYgZ28gaW4gc2VwYXJhdGVseT8NCj4gDQo+
IFBhdGNoIDEgYW5kIDIgYXJlIG5lZWRlZCB0byBmaXggdGhhdCBiaWdmYiBoYW5kbGluZyBm
b3IgaTkxNS4gUGF0Y2ggNA0KPiBpcyBhbHNvIG5lZWRlZCB0byBwcmV2ZW50IGJyZWFraW5n
IHRlc3RzLiBQYXRjaCAzIGlzIG1vcmUgbGlrZSBjbGVhbnVwLg0KPiANCj4gSSB0aGluayBp
OTE1IHBhdGNoZXMgY291bGQgZ28gdmlhIGk5MTUgdHJlZS4gVGhpcyBqdXN0IG1lYW5zIHRo
YXQgaTkxNQ0KPiBiaWdmYiBoYW5kbGluZyBpc24ndCBmaXhlZCBieSBlaXRoZXIgb2YgdGhl
IHNldHMgYWxvbmUuDQoNCkkgaGF2ZSBhIG51bWJlciBvZiB1cGRhdGVzIGZvciBkYW1hZ2Ug
aGFuZGxpbmcgdGhhdCBJIHdhbnQgdG8gZ2V0IA0KcmV2aWV3ZWQgc29vbi4gQ291bGQgeW91
IHBsZWFzZSBtZXJnZSB5b3VyIHBhdGNoc2V0IHZpYSBkcm0tbWlzYy1uZXh0Pw0KDQpCZXN0
IHJlZ2FyZHMNClRob21hcw0KDQo+ICAgDQo+Pg0KPj4+DQo+Pj4gIMKgZHJpdmVycy9ncHUv
ZHJtL2RybV9kYW1hZ2VfaGVscGVyLmPCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDExICsrKysr
Ky0tLS0NCj4+PiAgwqBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bzci5j
wqDCoMKgwqDCoCB8IDIwICsrKysrKystLS0tLS0tLQ0KPj4+IC0tLS0NCj4+PiAgwqAuLi4v
Z3B1L2RybS90ZXN0cy9kcm1fZGFtYWdlX2hlbHBlcl90ZXN0LmPCoMKgwqAgfMKgIDUgKysr
KysNCj4+PiAgwqAzIGZpbGVzIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDE3IGRlbGV0
aW9ucygtKQ0KPj4+DQo+Pj4gLS0gDQo+Pj4gMi4zNC4xDQo+Pg0KPiANCg0KLS0gDQpUaG9t
YXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2Fy
ZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5MDQwOSBOw7xybmJl
cmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdlc2Now6RmdHNmw7xo
cmVyOiBJdm8gVG90ZXYNCg==

--------------o4tnIX1ZnCyorJbgXgVmRgnr--

--------------ZwvUsJt5kEHWChE1Mf0bT3HY
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMgYWgFAwAAAAAACgkQlh/E3EQov+CK
vw//WIzohnjJyYPY1lHD05R+ysTwT5K33p1UjI+/t1+xoExbZbxpRtMdDdVcc35DM48Mq3uj+Ipi
boyXIzKfM70UBserk00zfT79gLc9G7iBs7F9ML3d2GESngEtvQF3+yzCTydtIedm3sgcCneWmcB+
XqjReMrt+eX4aCWNaXg/CitumYTy5G9qFzoOF2BtrypG/T87bt5cU0LBl5nZxzz8YsHhlCHmhXSj
bCVqnsnmJTIDUEBinEAdVpJIGnzt4182L4TbQNsIskdwuxYGOUx1P0rN2dcY6vPvSjdJTVVW9CGm
/HJc7Z3OQA7b73psBkIVPvlF7rZa/msBqi9NSnZhQ+lxrGihgNA7oxFwWX26e/MWEQkLj7cBsTEc
LKqWqWc8Wd8RtJk8FqgaH3RNNaPwtKgLVUTpvGYaPzpfQcSFVkH+89jnyeko4LBG61R13qUSbU5s
dRbhvn4bSnnx8A2gZ0FfioDBLmcMnL7XhypsT5XFzeBg2aVKrVdpsaaQBqx+tdNjJMocqVz8LJxA
SwEasOMDaC9/+DHA1HC4oDBCGj5OJCmxLV5N5KLA6KkQ0UkFE+jjhnedq84E/rRheXFSIqRfU3dG
QkSmdi2eN4Mvn44iZpGI4GJnslBkU30KXDpL94ru757GtPmGALwdZYuhID3q3oL3u7Ix3s4AJpg2
tmk=
=Bb5P
-----END PGP SIGNATURE-----

--------------ZwvUsJt5kEHWChE1Mf0bT3HY--
