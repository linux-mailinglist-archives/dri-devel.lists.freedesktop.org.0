Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBA25B6C09
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 12:57:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5635D10E69F;
	Tue, 13 Sep 2022 10:56:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C28710E69F;
 Tue, 13 Sep 2022 10:56:51 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 04FB45C262;
 Tue, 13 Sep 2022 10:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1663066610; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3Uj2f4po/yVkuzyLm5W7xgWZdiHTsR2hIKT29TexERo=;
 b=tRT8zOvmbl1q2Hqi8XHD3HntSMGcj/eRsWOEP402CovK7ax99EsBruDDW7mH+7vExj229A
 3mf142uF+5w2GQ8sEewQo8H0aGGjtizxFQGmlJ5Q3tRRsIflgqIyifH69GcIZ0pwRudmQz
 L9EFB8baDqqyDOgFsMWEWh03gAgmlOk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1663066610;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3Uj2f4po/yVkuzyLm5W7xgWZdiHTsR2hIKT29TexERo=;
 b=2L8UYznrGgOOCs/aqqHaDiWUZxezwWyZE7pdD8qgXqSbLmHQy0pUj8kCIhtQpDczdx3Gs1
 Yyyugk6Tt0nSpDBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CA560139B3;
 Tue, 13 Sep 2022 10:56:49 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 1j1yMPFhIGNuVwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 13 Sep 2022 10:56:49 +0000
Message-ID: <aae6e268-dff6-148d-b596-683add3220c2@suse.de>
Date: Tue, 13 Sep 2022 12:56:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 0/4] Fixes for damage clips handling
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
To: "Hogander, Jouni" <jouni.hogander@intel.com>,
 "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
References: <20220823112920.352563-1-jouni.hogander@intel.com>
 <YyBHkmeIy5VD36u1@intel.com>
 <f3ffd5df9d48222e459ff091961ea4ea7c4a411f.camel@intel.com>
 <a496bb39-982c-300a-efb5-918503783ca6@suse.de>
In-Reply-To: <a496bb39-982c-300a-efb5-918503783ca6@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------XQuN0Oehl0MlkI0UDx1040v2"
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
--------------XQuN0Oehl0MlkI0UDx1040v2
Content-Type: multipart/mixed; boundary="------------d7JRYu6qlQ1D7yZcZZl9XvYI";
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
Message-ID: <aae6e268-dff6-148d-b596-683add3220c2@suse.de>
Subject: Re: [PATCH v2 0/4] Fixes for damage clips handling
References: <20220823112920.352563-1-jouni.hogander@intel.com>
 <YyBHkmeIy5VD36u1@intel.com>
 <f3ffd5df9d48222e459ff091961ea4ea7c4a411f.camel@intel.com>
 <a496bb39-982c-300a-efb5-918503783ca6@suse.de>
In-Reply-To: <a496bb39-982c-300a-efb5-918503783ca6@suse.de>

--------------d7JRYu6qlQ1D7yZcZZl9XvYI
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDEzLjA5LjIyIHVtIDEyOjU0IHNjaHJpZWIgVGhvbWFzIFppbW1lcm1hbm46DQo+
IEhpDQo+IA0KPiBBbSAxMy4wOS4yMiB1bSAxMjo0NyBzY2hyaWViIEhvZ2FuZGVyLCBKb3Vu
aToNCj4+IE9uIFR1ZSwgMjAyMi0wOS0xMyBhdCAxMjowNCArMDMwMCwgVmlsbGUgU3lyasOk
bMOkIHdyb3RlOg0KPj4+IE9uIFR1ZSwgQXVnIDIzLCAyMDIyIGF0IDAyOjI5OjE2UE0gKzAz
MDAsIEpvdW5pIEjDtmdhbmRlciB3cm90ZToNCj4+Pj4gQ3VycmVudGx5IGRhbWFnZSBjbGlw
cyBoYW5kbGluZyBpcyBicm9rZW4gZm9yIHBsYW5lcyB3aGVuIHVzaW5nIGJpZw0KPj4+PiBm
cmFtZWJ1ZmZlciArIG9mZnNldCBpbiBjYXNlIGttcyBkcml2ZXIgYWRqdXN0cyBkcm1fcGxh
bmVfc3RhdGUuc3JjDQo+Pj4+IGNvb3Jkcy4gVGhpcyBpcyBiZWNhdXNlIGRhbWFnZSBjbGlw
cyBhcmUgdXNpbmcgY29vcmRzIHJlbGF0aXZlIHRvDQo+Pj4+IG9yaWdpbmFsIGNvb3JkcyBm
cm9tIHVzZXItc3BhY2UuDQo+Pj4+DQo+Pj4+IFRoaXMgcGF0Y2hzZXQgaXMgZml4aW5nIHRo
aXMgYnkgdXNpbmcgb3JpZ2luYWwNCj4+Pj4gY29vcmRzIGZyb20gdXNlci1zcGFjZSBpbnN0
ZWFkIG9mIGRybV9wbGFuZV9zdGF0ZS5zcmMgd2hlbg0KPj4+PiBpdGVyYXRpbmcNCj4+Pj4g
ZGFtYWdlX2NsaXBzLg0KPj4+Pg0KPj4+PiB2MjogTW9kaWZ5IGRybSB1bml0IHRlc3RzIGFj
Y29yZGluZ2x5DQo+Pj4+DQo+Pj4+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVy
QGZmd2xsLmNoPg0KPj4+PiBDYzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hv
cnN0QGxpbnV4LmludGVsLmNvbT4NCj4+Pj4gQ2M6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3Vs
YUBpbnRlbC5jb20+DQo+Pj4+IENjOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFA
bGludXguaW50ZWwuY29tPg0KPj4+PiBDYzogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9z
ZS5zb3V6YUBpbnRlbC5jb20+DQo+Pj4+IENjOiBNaWthIEthaG9sYSA8bWlrYS5rYWhvbGFA
aW50ZWwuY29tPg0KPj4+PiBDYzogTWHDrXJhIENhbmFsIDxtYWlyYWNhbmFsQHJpc2V1cC5u
ZXQ+DQo+Pj4+DQo+Pj4+IEpvdW5pIEjDtmdhbmRlciAoNCk6DQo+Pj4+IMKgwqAgZHJtOiBV
c2Ugb3JpZ2luYWwgc3JjIHJlY3Qgd2hpbGUgaW5pdGlhbGl6aW5nIGRhbWFnZSBpdGVyYXRv
cg0KPj4+PiDCoMKgIGRybS9pOTE1L2Rpc3BsYXk6IFVzZSBvcmlnaW5hbCBzcmMgaW4gcHNy
MiBzZWwgZmV0Y2ggYXJlYQ0KPj4+PiBjYWxjdWxhdGlvbg0KPj4+PiDCoMKgIGRybS9pOTE1
L2Rpc3BsYXk6IFVzZSBkcm0gaGVscGVyIGluc3RlYWQgb2Ygb3duIGxvb3AgZm9yIGRhbWFn
ZQ0KPj4+PiBjbGlwcw0KPj4+PiDCoMKgIGRybS90ZXN0czogU2V0IGFsc28gbW9jayBwbGFu
ZSBzcmNfeCwgc3JjX3ksIHNyY193IGFuZCBzcmNfaA0KPj4+DQo+Pj4gRG8gdGhlc2UgbmVl
ZCB0byBiZSBhcHBsaWVkIGludG8gdGhlIHNhbWUgdHJlZSwgb3IgY2FuDQo+Pj4gdGhlIGRy
bSB2cy4gaTkxNSBzdHVmZiBnbyBpbiBzZXBhcmF0ZWx5Pw0KPj4NCj4+IFBhdGNoIDEgYW5k
IDIgYXJlIG5lZWRlZCB0byBmaXggdGhhdCBiaWdmYiBoYW5kbGluZyBmb3IgaTkxNS4gUGF0
Y2ggNA0KPj4gaXMgYWxzbyBuZWVkZWQgdG8gcHJldmVudCBicmVha2luZyB0ZXN0cy4gUGF0
Y2ggMyBpcyBtb3JlIGxpa2UgY2xlYW51cC4NCj4+DQo+PiBJIHRoaW5rIGk5MTUgcGF0Y2hl
cyBjb3VsZCBnbyB2aWEgaTkxNSB0cmVlLiBUaGlzIGp1c3QgbWVhbnMgdGhhdCBpOTE1DQo+
PiBiaWdmYiBoYW5kbGluZyBpc24ndCBmaXhlZCBieSBlaXRoZXIgb2YgdGhlIHNldHMgYWxv
bmUuDQo+IA0KPiBJIGhhdmUgYSBudW1iZXIgb2YgdXBkYXRlcyBmb3IgZGFtYWdlIGhhbmRs
aW5nIHRoYXQgSSB3YW50IHRvIGdldCANCj4gcmV2aWV3ZWQgc29vbi4gQ291bGQgeW91IHBs
ZWFzZSBtZXJnZSB5b3VyIHBhdGNoc2V0IHZpYSBkcm0tbWlzYy1uZXh0Pw0KDQpPciBhdCBs
ZWFzdCBwYXRjaGVzIDEgYW5kIDQuDQoNCj4gDQo+IEJlc3QgcmVnYXJkcw0KPiBUaG9tYXMN
Cj4gDQo+Pj4NCj4+Pj4NCj4+Pj4gwqDCoGRyaXZlcnMvZ3B1L2RybS9kcm1fZGFtYWdlX2hl
bHBlci5jwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxMSArKysrKystLS0tDQo+Pj4+IMKgwqBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Bzci5jwqDCoMKgwqDCoCB8IDIw
ICsrKysrKystLS0tLS0tLQ0KPj4+PiAtLS0tDQo+Pj4+IMKgwqAuLi4vZ3B1L2RybS90ZXN0
cy9kcm1fZGFtYWdlX2hlbHBlcl90ZXN0LmPCoMKgwqAgfMKgIDUgKysrKysNCj4+Pj4gwqDC
oDMgZmlsZXMgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25zKC0pDQo+
Pj4+DQo+Pj4+IC0tIA0KPj4+PiAyLjM0LjENCj4+Pg0KPj4NCj4gDQoNCi0tIA0KVGhvbWFz
IFppbW1lcm1hbm4NCkdyYXBoaWNzIERyaXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUg
U29sdXRpb25zIEdlcm1hbnkgR21iSA0KTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJn
LCBHZXJtYW55DQooSFJCIDM2ODA5LCBBRyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJl
cjogSXZvIFRvdGV2DQo=

--------------d7JRYu6qlQ1D7yZcZZl9XvYI--

--------------XQuN0Oehl0MlkI0UDx1040v2
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmMgYfEFAwAAAAAACgkQlh/E3EQov+Ct
eA/7Bochik4+BfeqcxmHRpaDYJuAXRnahJZCsL/lgRg4ZItd2nHEvpCUb5pF7xr6Iy58U1iSsUnC
25YeL7B+QWqeIf0BuECMd2FRaNXrYr96ix37HFh++d+k2w4zc1FTF8TSc9bJMObaqcXMgQHqBLaj
XwPwhg8pzw7AjvhpVJqeiTLfLvs1tspEg1yBIbBgx9Y+QWKV8kNKrPrlBAFxZndaW+KLNgMGo7yt
Bz7b5nv/VWiCuwyE43kxijApPMRY/ZLFfv37bx2NUrNqJMlc9v3PVb4YjU0QO54c9uXR+XUZbUWF
6RIeMSHpV0gOVbhFsE9CzXTnZ/ZkoeXWAMchAVvSwWv9LaKpW4wjv7KiSI2DeRmex9azGfXaNmrp
rQ8x3+Zxb5w1a6wH2leTAITLa9CDCMQ0oPfRk5kxLFWlH+hiBtoBw9JthsdnCueu+kepGgtGQXnZ
ESsPDuufeGI3svxVMBMlyi9Ua445riqoUoFJbOLregHX/uwkBow/Eac9nDEmMks1T8sVJE/wuKoA
MIu6XgfvHS3QkkJOtDF55L406Oq9jNIquIcLhfCecwyD1LOdxS2jbV7DSA87Dwk6MQf9x/4O4Xj9
86o6jsISRGnBMrKcNlUqWMt372jkALY/ajZk7nnkgSiTiOWN214b91pH4Nfxpc00SpZ6dGC+SDrE
H0E=
=EN/p
-----END PGP SIGNATURE-----

--------------XQuN0Oehl0MlkI0UDx1040v2--
