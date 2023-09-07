Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FBA79709A
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 10:07:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBED810E78E;
	Thu,  7 Sep 2023 08:07:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B44610E78E
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Sep 2023 08:07:37 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 024511F750;
 Thu,  7 Sep 2023 08:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1694074056; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PsvtLQUWYQoBCQ8KPuCFKbR/Z9AhuXUIGbvtPOWlVJc=;
 b=Jiig+uSulhRjTNlhL/EkTV7lTiQoTgXNtj1iiDHtRjTtk5qyYdy1nFomlao6eo+wLs+JYX
 mAa+s73KdhTIQzyJYr8iiB7p80oLk+kEZlSl7D6PKWCmq4n64w/QU1UUbi6qXIHiPF8yKD
 QNJ4hPPfkx1kXDn1nel4IRsOFzQRBow=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1694074056;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PsvtLQUWYQoBCQ8KPuCFKbR/Z9AhuXUIGbvtPOWlVJc=;
 b=QVJeoV2tK3bxoiyaimtUjNGbB8Ex3FSx44jyUzkeLVmTTpCGCIb2zwit9XM2K1lOItRPJ+
 s+cwgNqY+840RtDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C5F39138FA;
 Thu,  7 Sep 2023 08:07:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id o3xbL8eE+WQ6CwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 07 Sep 2023 08:07:35 +0000
Message-ID: <e6a462cf-0650-6ed3-e106-e81933ee0dc3@suse.de>
Date: Thu, 7 Sep 2023 10:07:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 5/7] fbdev/core: Build fb_logo iff CONFIG_LOGO has been
 selected
Content-Language: en-US
To: Javier Martinez Canillas <javierm@redhat.com>, deller@gmx.de,
 daniel@ffwll.ch, sam@ravnborg.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20230829142109.4521-1-tzimmermann@suse.de>
 <20230829142109.4521-6-tzimmermann@suse.de>
 <87cyyv4nl6.fsf@minerva.mail-host-address-is-not-set>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <87cyyv4nl6.fsf@minerva.mail-host-address-is-not-set>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------0pBK2pBMmjkRep473N50bpTq"
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
Cc: linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------0pBK2pBMmjkRep473N50bpTq
Content-Type: multipart/mixed; boundary="------------2QREOpfwEcLtkIvDu9TaPfzt";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>, deller@gmx.de,
 daniel@ffwll.ch, sam@ravnborg.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Message-ID: <e6a462cf-0650-6ed3-e106-e81933ee0dc3@suse.de>
Subject: Re: [PATCH 5/7] fbdev/core: Build fb_logo iff CONFIG_LOGO has been
 selected
References: <20230829142109.4521-1-tzimmermann@suse.de>
 <20230829142109.4521-6-tzimmermann@suse.de>
 <87cyyv4nl6.fsf@minerva.mail-host-address-is-not-set>
In-Reply-To: <87cyyv4nl6.fsf@minerva.mail-host-address-is-not-set>

--------------2QREOpfwEcLtkIvDu9TaPfzt
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDA2LjA5LjIzIHVtIDEyOjEyIHNjaHJpZWIgSmF2aWVyIE1hcnRpbmV6IENhbmls
bGFzOg0KPiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4gd3JpdGVz
Og0KPiANCj4+IE9ubHkgYnVpbGQgZmJfbG9nby5jIGlmIENPTkZJR19MT0dPIGhhcyBiZWVu
IHNlbGVjdGVkLiBPdGhlcndpc2UNCj4+IHByb3ZpZGUgZW1wdHkgaW1wbGVtZW50YXRpb25z
IG9mIHRoZSBjb250YWluZWQgaW50ZXJmYWNlcyBhbmQgYXZvaWQNCj4+IHVzaW5nIHRoZSBl
eHBvcnRlZCB2YXJpYWJsZXMuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1l
cm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQo+IA0KPiBBaCEgWW91IGFyZSBkb2luZyBp
biB0aGlzIHBhdGNoIGV4YWN0bHkgd2hhdCBJIG1lbnRpb25lZCBpbiBteSBwcmV2aW91cw0K
PiBlbWFpbCA6KQ0KPiANCj4gSSB3b3VsZCBqdXN0IHNxdWFzaCB0aGlzIHBhdGNoIHdpdGgg
IzQsIGJ1dCB1cCB0byB5b3UuDQoNCkknbGwgcmVmYWN0b3IgdGhlc2UgcGF0Y2hlcyBzbGln
aHRseTogVGhlIHVuZXhwb3J0aW5nIG9mIHRoZSBoZWxwZXJzIA0KZ29lcyBpbnRvIGEgbmV3
IHBhdGNoIGFuZCB0aGUgcmVzdCBvZiBwYXRjaGVzIDQgYW5kIDUgd2lsbCBiZSBzcXVhc2hl
ZC4NCg0KPiANCj4gQWNrZWQtYnk6IEphdmllciBNYXJ0aW5leiBDYW5pbGxhcyA8amF2aWVy
bUByZWRoYXQuY29tPg0KPiANCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3Mg
RHJpdmVyIERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJI
DQpGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2
byBUb3RldiwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1h
bg0KSFJCIDM2ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------2QREOpfwEcLtkIvDu9TaPfzt--

--------------0pBK2pBMmjkRep473N50bpTq
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmT5hMcFAwAAAAAACgkQlh/E3EQov+DI
QBAAxkbbmRH+N7oYPjH6aFtXvzpdp6O33P1TzkHXx6/o0uN0q9i+Y7HejRS+Ck5Evz980C1IZiNy
47+D5b9twDEfPy/tuEJhdyKPoC9wC+sqqhWmVCKnLoJandE6LOBZISyUtgFczej4t7rWtC+2Ecy9
Uh+09XBloXAz1y3dp0yR+dCJ2N8Cge4e3nBazyCXDhkZbfExV8O5xEEDK9BKis8gMDBttRuHIcMo
o8wBsNfQn6r6bkDAVO8NPnkF7AgPs1Oft0OxQJ6+psOlJxPHrW9ubof9JMKgQq4HFEf6DISgDw+B
0RWl8XurDVBkSOCtgoM1U/4TbGT0V6J3K+ly2jaoSGPudVzvl3RNvBwe5ZjydVM8qcHw3VuC03Hi
4P/SVLJypW7C0rXxanDPMakbapP0tuS/m/qeeVqT00AuydzUlDCc7mbHpACWw9elQvifIKixS76I
RK3DBLThubsxbjjx4vJaJqKVKtow8T3YRrBUNYVSy4SzSjNyjURlfEJ0uYu7X5SpT9fhLHdujrbq
74Oj17oHGgzgNjY3+T980/Y409aTPUs/rfsKDR43XEGVrRCGW6DIsUa+82L3J4umMr89JqDVO51T
M3sdo4L60xxxBIPe+IxZnERiLYL1ikUZG3imB73CrswCEnhdDpnyzRFqbCRiAWWQa9nok7neUmZm
27Q=
=cK5I
-----END PGP SIGNATURE-----

--------------0pBK2pBMmjkRep473N50bpTq--
