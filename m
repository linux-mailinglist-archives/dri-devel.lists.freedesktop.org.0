Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 890ED7517E6
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 07:09:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CF4210E081;
	Thu, 13 Jul 2023 05:09:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6A3D10E08D
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 05:09:49 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 2DD7C1F45E;
 Thu, 13 Jul 2023 05:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1689224987; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xcjf2ODv0CRsbyDCjvt3ecfWATj9oRBr875dXYKNvi4=;
 b=r62qWf9nFA53h1qlar4ncJ8VEUVdDsZY6NjAaSGxbD26bIM1zAdmayW+eo4UJ3WdgPiRd6
 0p/0GX9xjR96TifnycHOtwtk+L5o15sY3by4mWUUmxfsBqAP0CxUpv5hKcpq9BZn+vRJpV
 /w0Adde6tp4AK07ynW4t//xw/kAbFVQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1689224987;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xcjf2ODv0CRsbyDCjvt3ecfWATj9oRBr875dXYKNvi4=;
 b=buENVq5pSw2VJ+85o5mvsEeI0QLb2yhyOjjjz1iq5aKh9kmcdzNxeIrg/yfO+dAjfXzw3n
 Aq/WI5wjUcbi6RDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0018513342;
 Thu, 13 Jul 2023 05:09:46 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 3EglOhqHr2RDIgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 13 Jul 2023 05:09:46 +0000
Message-ID: <69a71fab-2407-49ed-d445-5dccc126c64b@suse.de>
Date: Thu, 13 Jul 2023 07:09:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] drm/doc: document that PRIME import/export is always
 supported
To: Simon Ser <contact@emersion.fr>, dri-devel@lists.freedesktop.org
References: <20230712183156.191445-1-contact@emersion.fr>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230712183156.191445-1-contact@emersion.fr>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------owmOYhAGlJO0P5nBjV0O9uZW"
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Jeffrey Hugo <quic_jhugo@quicinc.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------owmOYhAGlJO0P5nBjV0O9uZW
Content-Type: multipart/mixed; boundary="------------3zcqZ0AFR0vbkbHa0t9ueX93";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Simon Ser <contact@emersion.fr>, dri-devel@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Jeffrey Hugo <quic_jhugo@quicinc.com>
Message-ID: <69a71fab-2407-49ed-d445-5dccc126c64b@suse.de>
Subject: Re: [PATCH] drm/doc: document that PRIME import/export is always
 supported
References: <20230712183156.191445-1-contact@emersion.fr>
In-Reply-To: <20230712183156.191445-1-contact@emersion.fr>

--------------3zcqZ0AFR0vbkbHa0t9ueX93
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTIuMDcuMjMgdW0gMjA6MzIgc2NocmllYiBTaW1vbiBTZXI6DQo+IFNpbmNl
IGNvbW1pdCA2Yjg1YWE2OGQ5ZDUgKCJkcm06IEVuYWJsZSBQUklNRSBpbXBvcnQvZXhwb3J0
IGZvciBhbGwNCj4gZHJpdmVycyIpLCBpbXBvcnQvZXhwb3J0IGlzIGFsd2F5cyBzdXBwb3J0
ZWQuIERvY3VtZW50IHRoaXMgc28gdGhhdA0KPiB1c2VyLXNwYWNlIGtub3dzIHdoYXQgdG8g
ZXhwZWN0Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogU2ltb24gU2VyIDxjb250YWN0QGVtZXJz
aW9uLmZyPg0KPiBDYzogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+
DQo+IENjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+DQo+IENj
OiBKZWZmcmV5IEh1Z28gPHF1aWNfamh1Z29AcXVpY2luYy5jb20+DQo+IENjOiBEYW5pZWwg
VmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPg0KPiAtLS0NCj4gICBpbmNsdWRlL3Vh
cGkvZHJtL2RybS5oIHwgNyArKysrKysrDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0
aW9ucygrKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9kcm0vZHJtLmggYi9p
bmNsdWRlL3VhcGkvZHJtL2RybS5oDQo+IGluZGV4IGE4N2JiYmJjYTJkNC4uNTZjMTk0ZGY1
MjdlIDEwMDY0NA0KPiAtLS0gYS9pbmNsdWRlL3VhcGkvZHJtL2RybS5oDQo+ICsrKyBiL2lu
Y2x1ZGUvdWFwaS9kcm0vZHJtLmgNCj4gQEAgLTY3Myw2ICs2NzMsOSBAQCBzdHJ1Y3QgZHJt
X2dlbV9vcGVuIHsNCj4gICAgKiBCaXRmaWVsZCBvZiBzdXBwb3J0ZWQgUFJJTUUgc2hhcmlu
ZyBjYXBhYmlsaXRpZXMuIFNlZSAmRFJNX1BSSU1FX0NBUF9JTVBPUlQNCj4gICAgKiBhbmQg
JkRSTV9QUklNRV9DQVBfRVhQT1JULg0KPiAgICAqDQo+ICsgKiBTdGFydGluZyBmcm9tIGtl
cm5lbCB2ZXJzaW9uIDYuNiwgYm90aCAmRFJNX1BSSU1FX0NBUF9JTVBPUlQgYW5kDQo+ICsg
KiAmRFJNX1BSSU1FX0NBUF9FWFBPUlQgYXJlIGFsd2F5cyBhZHZlcnRpc2VkLg0KPiArICoN
Cg0KV2hlbiBwZW9wbGUgcG9ydCB0aGVzZSBjaGFuZ2VzIGludG8gdGhlaXIgdHJlZXMgdGhl
IHZlcnNpb24gYmVjb21lcyANCm1lYW5pbmdsZXNzLiBUaGVyZSBhcmUgc28gbWFueSAiZW50
ZXJwcmlzZSBrZXJuZWxzIiB0aGF0IGNvbWJpbmUgd2hvbGUgDQpzdWJzeXN0ZW1zIGZyb20g
ZGlmZmVyZW50IHVwc3RyZWFtIHJlbGVhc2VzLg0KDQpUaGF0IG1ha2VzIG1lIHdvbmRlciBp
ZiBzdWNoIGRvY3VtZW50YXRpb24gbWFrZXMgc2Vuc2UuIFdlIHdhbnQgdG8gYXZvaWQgDQph
IHNpdHVhdGlvbiB3aGVyZSB1c2Vyc3BhY2UgZG9lcw0KDQppZiAodjYuNikNCiAgIGRvKCkN
CmVsc2UgaWYgKHRlc3RfZmxhZ3MoKSkNCiAgIGRvKCkNCg0KQmVzdCByZWdhcmRzDQpUaG9t
YXMNCg0KPiAgICAqIFBSSU1FIGJ1ZmZlcnMgYXJlIGV4cG9zZWQgYXMgZG1hLWJ1ZiBmaWxl
IGRlc2NyaXB0b3JzLiBTZWUNCj4gICAgKiBEb2N1bWVudGF0aW9uL2dwdS9kcm0tbW0ucnN0
LCBzZWN0aW9uICJQUklNRSBCdWZmZXIgU2hhcmluZyIuDQo+ICAgICovDQo+IEBAIC02ODIs
NiArNjg1LDggQEAgc3RydWN0IGRybV9nZW1fb3BlbiB7DQo+ICAgICoNCj4gICAgKiBJZiB0
aGlzIGJpdCBpcyBzZXQgaW4gJkRSTV9DQVBfUFJJTUUsIHRoZSBkcml2ZXIgc3VwcG9ydHMg
aW1wb3J0aW5nIFBSSU1FDQo+ICAgICogYnVmZmVycyB2aWEgdGhlICZEUk1fSU9DVExfUFJJ
TUVfRkRfVE9fSEFORExFIGlvY3RsLg0KPiArICoNCj4gKyAqIFN0YXJ0aW5nIGZyb20ga2Vy
bmVsIHZlcnNpb24gNi42LCB0aGlzIGJpdCBpcyBhbHdheXMgc2V0IGluICZEUk1fQ0FQX1BS
SU1FLg0KPiAgICAqLw0KPiAgICNkZWZpbmUgIERSTV9QUklNRV9DQVBfSU1QT1JUCQkweDEN
Cj4gICAvKioNCj4gQEAgLTY4OSw2ICs2OTQsOCBAQCBzdHJ1Y3QgZHJtX2dlbV9vcGVuIHsN
Cj4gICAgKg0KPiAgICAqIElmIHRoaXMgYml0IGlzIHNldCBpbiAmRFJNX0NBUF9QUklNRSwg
dGhlIGRyaXZlciBzdXBwb3J0cyBleHBvcnRpbmcgUFJJTUUNCj4gICAgKiBidWZmZXJzIHZp
YSB0aGUgJkRSTV9JT0NUTF9QUklNRV9IQU5ETEVfVE9fRkQgaW9jdGwuDQo+ICsgKg0KPiAr
ICogU3RhcnRpbmcgZnJvbSBrZXJuZWwgdmVyc2lvbiA2LjYsIHRoaXMgYml0IGlzIGFsd2F5
cyBzZXQgaW4gJkRSTV9DQVBfUFJJTUUuDQo+ICAgICovDQo+ICAgI2RlZmluZSAgRFJNX1BS
SU1FX0NBUF9FWFBPUlQJCTB4Mg0KPiAgIC8qKg0KDQotLSANClRob21hcyBaaW1tZXJtYW5u
DQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBH
ZXJtYW55IEdtYkgNCkZyYW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJnLCBHZXJt
YW55DQpHRjogSXZvIFRvdGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFsZCwgQm91
ZGllbiBNb2VybWFuDQpIUkIgMzY4MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------3zcqZ0AFR0vbkbHa0t9ueX93--

--------------owmOYhAGlJO0P5nBjV0O9uZW
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmSvhxoFAwAAAAAACgkQlh/E3EQov+Ai
Yw/9EdmVh+FfpLegAz7fg/c+DmB3Aj4IY/2N4F/0QyiNa8nzic6Ezc0+imlbHP/JqNRvYP1mWgs5
BfEIqKyDNVn77IdNRqSvsZTbPcCKv2ul9FxUZOJUF1KH7kzvpILBq3Lp1RsNUMxoLFzRBLoLa4Wg
u3EBpd+qsPnGal1R8DhLfHGte3uYfLiAEMlu5CMjP2WbxxolewX11YhBbLpn+u6j/L8pApP7BfsP
klJIoiJAfvcKZAbMR4eMjnEydYZA9Hiz9pcRfzOEk8W6h9YOARCy7w0c8s/cHgxcfMv0yG6gr+TX
tumn1n5b8ak3HLhalgIEB8iy3PgI+YeC9WQdlTHfRBcieBgmtGcL74hzdWvjSYGRogj0wPxt2LZS
IKqBEOAMDleTEs/weUZBpXrLM1PnU5uMMU6+rHiz+G0xA4gaQHQWVS8rWT8IcF4xsfUUJIQtuiQm
B1PZQ07xRKV+xjLgGULF12h5hmQHHbCCqMsIb0fGxpT7q6W5YZpI9RnTL0vaVSqlkC0GZpYIQgz9
LImF0kmRbQ8BWSmTreF4taLR76CLie3mT1Qgfu77PfkrpvQ/s6d8EDKIL2PT+0qqqFSyNFw8TP11
85PFUMefKpqKBlJiC6DblNCEOkFDYLrHzkgu5cxSoGX2EUOZrGGgxlYrzsz7Ucbi6UxrmVa/Rmtq
5+Q=
=EYcE
-----END PGP SIGNATURE-----

--------------owmOYhAGlJO0P5nBjV0O9uZW--
