Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD066E8D62
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 10:57:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A58F110EBFA;
	Thu, 20 Apr 2023 08:57:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1587110EBFA
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 08:57:42 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id B235F1FDB3;
 Thu, 20 Apr 2023 08:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1681981060; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kc+idYJYpxh1ZMa1V5YjWqbC7KDsYG40oEExYHDrWNE=;
 b=iRGABP1FQvtKD37NoylsYr11L7RTy1s2zoPXD9mRqQEh6qEM/goUCtLksAlucf5zjV+GWs
 4PUDn1uNBc8Ghaf6kdVDf+8HZd3WLdmHDxbsnGEc7jqXyr0Usdo8W5Mqd91NR4Acr0WwU2
 d0CC2oKCltOxTssLeZhNzF5OmEICNVU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1681981060;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=kc+idYJYpxh1ZMa1V5YjWqbC7KDsYG40oEExYHDrWNE=;
 b=eVdVPn+6HePaNKr/G0+TXnZjXOvUKUbvJgcYd8XenZ/LBfcKg8L/Og1Dw1nQBd1UX61ti0
 OJMC3rUmxGb2QdDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 90DBB13584;
 Thu, 20 Apr 2023 08:57:40 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4RJiIoT+QGQzfwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 20 Apr 2023 08:57:40 +0000
Message-ID: <61edb9d3-11f5-42de-633d-6e6253ce021f@suse.de>
Date: Thu, 20 Apr 2023 10:57:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2] drm/ast: Fix ARM compatibility
Content-Language: en-US
To: Jammy Huang <jammy_huang@aspeedtech.com>, airlied@redhat.com
References: <20230420080947.27226-1-jammy_huang@aspeedtech.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230420080947.27226-1-jammy_huang@aspeedtech.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------S9VScJM8Q7xs00Ki6xKISzXB"
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
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------S9VScJM8Q7xs00Ki6xKISzXB
Content-Type: multipart/mixed; boundary="------------fv9yA3eZgk43qsZFOFTijQYs";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jammy Huang <jammy_huang@aspeedtech.com>, airlied@redhat.com
Cc: airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Message-ID: <61edb9d3-11f5-42de-633d-6e6253ce021f@suse.de>
Subject: Re: [PATCH v2] drm/ast: Fix ARM compatibility
References: <20230420080947.27226-1-jammy_huang@aspeedtech.com>
In-Reply-To: <20230420080947.27226-1-jammy_huang@aspeedtech.com>

--------------fv9yA3eZgk43qsZFOFTijQYs
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjAuMDQuMjMgdW0gMTA6MDkgc2NocmllYiBKYW1teSBIdWFuZzoNCj4gQVJN
IGFyY2hpdGVjdHVyZSBvbmx5IGhhcyAnbWVtb3J5Jywgc28gYWxsIGRldmljZXMgYXJlIGFj
Y2Vzc2VkIGJ5DQo+IE1NSU8gaWYgcG9zc2libGUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBK
YW1teSBIdWFuZyA8amFtbXlfaHVhbmdAYXNwZWVkdGVjaC5jb20+DQo+IC0tLQ0KPiAgIHYy
IGNoYW5nZXM6DQo+ICAgIC0gVXNlIE1NSU8gYWZ0ZXIgQVNUMjUwMCB3aGljaCBlbmFibGUg
TU1JTyBieSBkZWZhdWx0Lg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9t
YWluLmMgfCA5ICsrKysrLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMo
KyksIDQgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2FzdC9hc3RfbWFpbi5jIGIvZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfbWFpbi5jDQo+IGlu
ZGV4IGY4M2NlNzcxMjdjYi4uZDM4NGU4MTBmYTRkIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vYXN0L2FzdF9tYWluLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2FzdC9h
c3RfbWFpbi5jDQo+IEBAIC00MjUsMTEgKzQyNSwxMiBAQCBzdHJ1Y3QgYXN0X3ByaXZhdGUg
KmFzdF9kZXZpY2VfY3JlYXRlKGNvbnN0IHN0cnVjdCBkcm1fZHJpdmVyICpkcnYsDQo+ICAg
CQlyZXR1cm4gRVJSX1BUUigtRUlPKTsNCj4gICANCj4gICAJLyoNCj4gLQkgKiBJZiB3ZSBk
b24ndCBoYXZlIElPIHNwYWNlIGF0IGFsbCwgdXNlIE1NSU8gbm93IGFuZA0KPiAtCSAqIGFz
c3VtZSB0aGUgY2hpcCBoYXMgTU1JTyBlbmFibGVkIGJ5IGRlZmF1bHQgKHJldiAweDIwDQo+
IC0JICogYW5kIGhpZ2hlcikuDQo+ICsJICogQWZ0ZXIgQVNUMjUwMCwgTU1JTyBpcyBlbmFi
bGVkIGJ5IGRlZmF1bHQsIGFuZCBpdCBzaG91bGQgYmUgYWRhcHRlZA0KDQpCeSAnYWRhcHRl
ZCcsIHlvdSBtZWFuICdhZG9wdGVkJz8NCg0KQXBhcnQgZnJvbSB0aGF0Og0KDQpSZXZpZXdl
ZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+DQoNCkkgYWxz
byByYW4gdGhpcyBwYXRjaCBvbiBhbiBBU1QyMTAwLCB3aGljaCBzdGlsbCB3b3JrcyBhcyBi
ZWZvcmUuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gKwkgKiB0byBiZSBjb21wYXRp
YmxlIHdpdGggQXJtLg0KPiAgIAkgKi8NCj4gLQlpZiAoIShwY2lfcmVzb3VyY2VfZmxhZ3Mo
cGRldiwgMikgJiBJT1JFU09VUkNFX0lPKSkgew0KPiArCWlmIChwZGV2LT5yZXZpc2lvbiA+
PSAweDQwKSB7DQo+ICsJCWFzdC0+aW9yZWdzID0gYXN0LT5yZWdzICsgQVNUX0lPX01NX09G
RlNFVDsNCj4gKwl9IGVsc2UgaWYgKCEocGNpX3Jlc291cmNlX2ZsYWdzKHBkZXYsIDIpICYg
SU9SRVNPVVJDRV9JTykpIHsNCj4gICAJCWRybV9pbmZvKGRldiwgInBsYXRmb3JtIGhhcyBu
byBJTyBzcGFjZSwgdHJ5aW5nIE1NSU9cbiIpOw0KPiAgIAkJYXN0LT5pb3JlZ3MgPSBhc3Qt
PnJlZ3MgKyBBU1RfSU9fTU1fT0ZGU0VUOw0KPiAgIAl9DQo+IA0KPiBiYXNlLWNvbW1pdDog
ZTYyMjUyYmM1NWI2ZDRlZGRjNmMyYmRiZjk1YTQ0ODE4MGQ2YTA4ZA0KDQotLSANClRob21h
cyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJl
IFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCkZyYW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVl
cm5iZXJnLCBHZXJtYW55DQpHRjogSXZvIFRvdGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBN
Y0RvbmFsZCwgQm91ZGllbiBNb2VybWFuDQpIUkIgMzY4MDkgKEFHIE51ZXJuYmVyZykNCg==


--------------fv9yA3eZgk43qsZFOFTijQYs--

--------------S9VScJM8Q7xs00Ki6xKISzXB
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmRA/oQFAwAAAAAACgkQlh/E3EQov+Aa
2BAAzyUjiH1jxWXsdgutB91vAJgJAdM+6GojPBWVEDud6kGZKhUrN1mCAdeyW8pByqpOQUDQGkWR
SR3GAqeQfIYqcCyCHQ4+KJMKAlaUgVmuDWZr9ZSeqhhNfbZlfuHzNggRpSlhBBV4VEDt2r01nbah
K4u05H47FtltsYApQgtLsiyRDtb+0HkOMvfHU97r4U/GB3amFSrQnZ9jW99bx56BlhdCkiawTmkP
1P17dMJRXHC7WW99V/xOANDrLrWYcukAbtpWcvTXtr5exfT2DOOovCQQDAzOhDTy7ctaCiXIVSHz
FKlIljjrA7Z52pMntkFKWLKrT0NJhDbF9Oxz8hBt9mLcH9BJM78TnvXZ3f+NBSPzfIUJQK6ttwzF
6KHjeALPEiDNWDhGqjDHSBGcJReFB+DaPYl7axSqslXK8VnmN4FCqJyoyGmekrZZjBUyVs5AKGWq
wpVmwrzkAC+zCDauQaO0dclvob17keovTgfQkRRJL1j1TvHK43eTWyzH1n0b8E7eJV5SpLJ9MiM6
1AK1Z0vcGmmSXVxH7SAkivAoLnQDydBalE8WP5+WyDmcUGZp04juUzUj+3fkoeKTI+hnyljosWBk
H1K4UNkEipd6CwOLxDZE8D+z3BrbwMhdjAHMMCWzHN3Uj/OfeqeFZhReEXjZ/6G8PdrLxJQBtJ1w
s3c=
=Ze+j
-----END PGP SIGNATURE-----

--------------S9VScJM8Q7xs00Ki6xKISzXB--
