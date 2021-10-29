Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CAB6440285
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 20:52:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D48C6EA34;
	Fri, 29 Oct 2021 18:51:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 440A76EA34
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 18:51:56 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D50A421974;
 Fri, 29 Oct 2021 18:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1635533513; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xZEEWsS0omfe6n+p9ZkN0+ncu/msq8vTIZqm5m52VmM=;
 b=D+3nhl8S82XEXqxv7QiTPQvxRdClW68MBEOVaosKePHLjVYypo9Vt8uj6gyhII7xIIoG1A
 1HDlDRchWsIuHUrbWRdwF35Ihn6qPf4CwIBAqokIUMPOq+oYKaBv3DXq3KbLAeznCFkKRR
 cqYV8tgtqAkKLPOyUnQdWuHO/pYDWXU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1635533513;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xZEEWsS0omfe6n+p9ZkN0+ncu/msq8vTIZqm5m52VmM=;
 b=RMLqy2873U+JC/l4Or23eqyU3hgFzwgjZn/tNlno2M9CzAk1RxJJ488bjTp4L6m6iKaq5l
 Zh5WvWEBkn7JCHDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6EE6F13F79;
 Fri, 29 Oct 2021 18:51:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ZeeeGclCfGGoFAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 29 Oct 2021 18:51:53 +0000
Message-ID: <2312b5c3-ffc9-b54e-a08b-2548e3837d83@suse.de>
Date: Fri, 29 Oct 2021 20:51:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2] drm: import DMA_BUF module namespace
Content-Language: en-US
To: Marcel Ziswiler <marcel@ziswiler.com>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Cc: Maxime Ripard <mripard@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linus Walleij <linus.walleij@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Linux Kernel Functional Testing <lkft@linaro.org>
References: <20211027212506.3418521-1-marcel@ziswiler.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20211027212506.3418521-1-marcel@ziswiler.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------9UoZI03OroPWbiDYMVeDgvmE"
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
--------------9UoZI03OroPWbiDYMVeDgvmE
Content-Type: multipart/mixed; boundary="------------2M4is0FbJj0AqLvyf1yxRAiS";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Marcel Ziswiler <marcel@ziswiler.com>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Cc: Maxime Ripard <mripard@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Linus Walleij <linus.walleij@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Linux Kernel Functional Testing <lkft@linaro.org>
Message-ID: <2312b5c3-ffc9-b54e-a08b-2548e3837d83@suse.de>
Subject: Re: [PATCH v2] drm: import DMA_BUF module namespace
References: <20211027212506.3418521-1-marcel@ziswiler.com>
In-Reply-To: <20211027212506.3418521-1-marcel@ziswiler.com>

--------------2M4is0FbJj0AqLvyf1yxRAiS
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjcuMTAuMjEgdW0gMjM6MjUgc2NocmllYiBNYXJjZWwgWmlzd2lsZXI6DQo+
IEZyb206IE1hcmNlbCBaaXN3aWxlciA8bWFyY2VsLnppc3dpbGVyQHRvcmFkZXguY29tPg0K
PiANCj4gVG9kYXkncyAtbmV4dCBmYWlscyBidWlsZGluZyBhcm02NCBkZWZjb25maWcgYXMg
Zm9sbG93czoNCj4gDQo+IEVSUk9SOiBtb2Rwb3N0OiBtb2R1bGUgZHJtX2NtYV9oZWxwZXIg
dXNlcyBzeW1ib2wgZG1hX2J1Zl92dW5tYXAgZnJvbQ0KPiAgIG5hbWVzcGFjZSBETUFfQlVG
LCBidXQgZG9lcyBub3QgaW1wb3J0IGl0Lg0KPiBFUlJPUjogbW9kcG9zdDogbW9kdWxlIGRy
bV9jbWFfaGVscGVyIHVzZXMgc3ltYm9sIGRtYV9idWZfdm1hcCBmcm9tDQo+ICAgbmFtZXNw
YWNlIERNQV9CVUYsIGJ1dCBkb2VzIG5vdCBpbXBvcnQgaXQuDQo+IA0KPiBSZXBvcnRlZC1i
eTogTGludXggS2VybmVsIEZ1bmN0aW9uYWwgVGVzdGluZyA8bGtmdEBsaW5hcm8ub3JnPg0K
PiBGaXhlczogY29tbWl0IDRiMmI1ZTE0MmZmNCAoImRybTogTW92ZSBHRU0gbWVtb3J5IG1h
bmFnZXJzIGludG8gbW9kdWxlcyIpDQo+IFNpZ25lZC1vZmYtYnk6IE1hcmNlbCBaaXN3aWxl
ciA8bWFyY2VsLnppc3dpbGVyQHRvcmFkZXguY29tPg0KDQpJIGFkZGVkIHRoaXMgZml4IGlu
dG8gZHJtLW1pc2MtbmV4dC4gVGhhbmtzIQ0KDQpIb3dldmVyLCBJIGhhZCB0byBpbXBvcnQg
bGludXgtbmV4dCB3aGlsZSBkb2luZyBzby4gJ0dpdCBhbScgZGlkIGEgMy13YXkgDQptZXJn
ZSwgd2hpY2ggbWF5IHJlc3VsdCBpbiBhIGNvbmZsaWN0IHdoZW4gdGhlIGZpeCByZWFjaGVz
IGxpbnV4LW5leHQgDQphZ2Fpbi4gSSBhbHNvIHVwZGF0ZWQgdGhlIGNvbW1pdCBkZXNjcmlw
dGlvbi4NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KPiANCj4gLS0tDQo+IA0KPiBDaGFu
Z2VzIGluIHYyOg0KPiAtIEFmdGVyIGNvbnN1bHRpbmcgdGhlIGRvY3VtZW50YXRpb24gbW92
ZSBpdCB0byB0aGUgYm90dG9tIG9mIHRoZSBmaWxlDQo+ICAgIHdoZXJlIHRoZSBvdGhlciBN
T0RVTEUgc3RhdGVtZW50cyBhcmUgYXMgc3VnZ2VzdGVkIGJ5IFRob21hcy4NCj4gLSBBbHNv
IG1vdmUgaXQgZG93biB0aGVyZSBmb3IgdGhlIGRybV9nZW1fc2htZW1faGVscGVyLmMgZmls
ZS4NCj4gDQo+ICAgZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fY21hX2hlbHBlci5jICAgfCAx
ICsNCj4gICBkcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9zaG1lbV9oZWxwZXIuYyB8IDMgKy0t
DQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fY21hX2hlbHBl
ci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fY21hX2hlbHBlci5jDQo+IGluZGV4IDZm
N2IzZjhlYzA0ZDMuLjJhMzQyNDFmZWUwMjUgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9kcm1fZ2VtX2NtYV9oZWxwZXIuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJt
X2dlbV9jbWFfaGVscGVyLmMNCj4gQEAgLTU4MSw0ICs1ODEsNSBAQCBkcm1fZ2VtX2NtYV9w
cmltZV9pbXBvcnRfc2dfdGFibGVfdm1hcChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LA0KPiAg
IEVYUE9SVF9TWU1CT0woZHJtX2dlbV9jbWFfcHJpbWVfaW1wb3J0X3NnX3RhYmxlX3ZtYXAp
Ow0KPiAgIA0KPiAgIE1PRFVMRV9ERVNDUklQVElPTigiRFJNIENNQSBtZW1vcnktbWFuYWdl
bWVudCBoZWxwZXJzIik7DQo+ICtNT0RVTEVfSU1QT1JUX05TKERNQV9CVUYpOw0KPiAgIE1P
RFVMRV9MSUNFTlNFKCJHUEwiKTsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9k
cm1fZ2VtX3NobWVtX2hlbHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fc2htZW1f
aGVscGVyLmMNCj4gaW5kZXggZjczMjQ1ODJhZmU3MS4uYTViNzQzYTgzY2U5OSAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmMNCj4gKysr
IGIvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmMNCj4gQEAgLTIyLDgg
KzIyLDYgQEANCj4gICAjaW5jbHVkZSA8ZHJtL2RybV9wcmltZS5oPg0KPiAgICNpbmNsdWRl
IDxkcm0vZHJtX3ByaW50Lmg+DQo+ICAgDQo+IC1NT0RVTEVfSU1QT1JUX05TKERNQV9CVUYp
Ow0KPiAtDQo+ICAgLyoqDQo+ICAgICogRE9DOiBvdmVydmlldw0KPiAgICAqDQo+IEBAIC03
NzksNCArNzc3LDUgQEAgZHJtX2dlbV9zaG1lbV9wcmltZV9pbXBvcnRfc2dfdGFibGUoc3Ry
dWN0IGRybV9kZXZpY2UgKmRldiwNCj4gICBFWFBPUlRfU1lNQk9MX0dQTChkcm1fZ2VtX3No
bWVtX3ByaW1lX2ltcG9ydF9zZ190YWJsZSk7DQo+ICAgDQo+ICAgTU9EVUxFX0RFU0NSSVBU
SU9OKCJEUk0gU0hNRU0gbWVtb3J5LW1hbmFnZW1lbnQgaGVscGVycyIpOw0KPiArTU9EVUxF
X0lNUE9SVF9OUyhETUFfQlVGKTsNCj4gICBNT0RVTEVfTElDRU5TRSgiR1BMIHYyIik7DQo+
IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVy
DQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUs
IDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0K
R2VzY2jDpGZ0c2bDvGhyZXI6IEZlbGl4IEltZW5kw7ZyZmZlcg0K

--------------2M4is0FbJj0AqLvyf1yxRAiS--

--------------9UoZI03OroPWbiDYMVeDgvmE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmF8QsgFAwAAAAAACgkQlh/E3EQov+CL
qRAAycQJlJBfMdyTGJf46MNjORkfrWlh7GAvn7ohXgbvd7vXvZjB7wO/xoZhsevjLPgKZJ0jdOaD
+mZW1hReUmiOFHUijkAs+JoRKDvhZ70a+N3y8qP8/I/D+qVqiiMgHoGFW9ZB1BdBDpN0pAB8lFtu
jLycKeogxwYAeocuHzIwc799f9zIwvo6W1lE99DYH0se86kmLwtcoiASDGB/J1Tlisq7Us8qECzJ
yJoM3p2LIBH2E2dxzvh8O97X/ec0nNPg2h/FawJUzrFSoXEsma6byTO59awwQRxo+T3FpALI4sxP
uvB7V0r+60QuT8nkDcJFVKlurSzXQPO0zUMCiVSdLxv2r+GiqWJC2qKL5JzGIDjmsiUCUtnJiGCh
2NzoDZjhbvC9BEPxii/GbjPeWKMfcQpkbs5t0DatYIMdN9dtQww/SrpwO0gZfVpBs4FJsWEZDQ7V
K5rJZqyuP/ZVlfK7s55dPGR0FoxgGXmRz/cPZ0O59fOL/s5zMIWMPsumc64JmcKYDK3BSLCrnXu7
oROaUGx5IO3cYyd04mIQPXb85hYsYt8/vBiovgLo+IgW7M5xKSY7otptaB5Ks7uORINKlKbcRFjo
R5ok0eQsTyEPApa1ElTzIZQ3AYsEc2c0C9bQ8cEsbzgzJH1f3NmSGSRNoqXVoXlI/FuRSLerp/6h
FAs=
=f6UX
-----END PGP SIGNATURE-----

--------------9UoZI03OroPWbiDYMVeDgvmE--
