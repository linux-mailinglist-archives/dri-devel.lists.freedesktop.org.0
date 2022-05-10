Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8766520E3A
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 08:58:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 794C110E0D3;
	Tue, 10 May 2022 06:58:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E299A10E0D3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 May 2022 06:58:39 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7F9F31FA23;
 Tue, 10 May 2022 06:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1652165918; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m5u5PQE+fqfVZ30PjpB3yAofUSBh71P7s2BeFB5Y5Tg=;
 b=LGFl1XjJ02PoukoOOxqwdOWRLDZ/th9JBxfJD4hwqoWGPmQ8I/K/gNaAy0XL0xe4gMh+yN
 JP8teoy04ezOl+SvDbXRWWF79sTfF8pO7MKZV4luiYuuICXsETlHmcpN+z9lkQXRCUVKyg
 /6WAwvU7uW3E0nYRKF0rL//woElC2YY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1652165918;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m5u5PQE+fqfVZ30PjpB3yAofUSBh71P7s2BeFB5Y5Tg=;
 b=Wy+FEuc1os0Bj7aAyYdjDaOmwvDGfFwdLmw7qorO7aBcLLfCI20vMBZbVqaSDtCyLmbfAp
 qRulwtR7INEfxvDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 6354B13AA5;
 Tue, 10 May 2022 06:58:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id oeIbFx4NemIyaQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 10 May 2022 06:58:38 +0000
Message-ID: <5a443f2b-5960-c256-4e03-077bb01034b5@suse.de>
Date: Tue, 10 May 2022 08:58:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] mgag200: Enable atomic gamma lut update
Content-Language: en-US
To: Jocelyn Falempe <jfalempe@redhat.com>, michel.daenzer@mailbox.org,
 dri-devel@lists.freedesktop.org, lyude@redhat.com
References: <20220509094930.44613-1-jfalempe@redhat.com>
 <432710c7-04fd-7358-60c4-861cf3cfb5cf@suse.de>
 <6b7acc25-64b3-297d-7842-a8cd59c8d98d@daenzer.net>
 <0be47bc4-ae27-0293-eeb0-83010d0ab948@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <0be47bc4-ae27-0293-eeb0-83010d0ab948@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------wrV4uQ2YS0iHdNbgjkQKe4Ew"
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
--------------wrV4uQ2YS0iHdNbgjkQKe4Ew
Content-Type: multipart/mixed; boundary="------------8KgNX4v4h71Wg0x70I4TkLz0";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jocelyn Falempe <jfalempe@redhat.com>, michel.daenzer@mailbox.org,
 dri-devel@lists.freedesktop.org, lyude@redhat.com
Message-ID: <5a443f2b-5960-c256-4e03-077bb01034b5@suse.de>
Subject: Re: [PATCH] mgag200: Enable atomic gamma lut update
References: <20220509094930.44613-1-jfalempe@redhat.com>
 <432710c7-04fd-7358-60c4-861cf3cfb5cf@suse.de>
 <6b7acc25-64b3-297d-7842-a8cd59c8d98d@daenzer.net>
 <0be47bc4-ae27-0293-eeb0-83010d0ab948@redhat.com>
In-Reply-To: <0be47bc4-ae27-0293-eeb0-83010d0ab948@redhat.com>

--------------8KgNX4v4h71Wg0x70I4TkLz0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMDkuMDUuMjIgdW0gMjM6MDAgc2NocmllYiBKb2NlbHluIEZhbGVtcGU6DQo+
IE9uIDA5LzA1LzIwMjIgMTg6MDQsIE1pY2hlbCBEw6RuemVyIHdyb3RlOg0KPj4gT24gMjAy
Mi0wNS0wOSAxNjoyMiwgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6DQo+Pj4NCj4+PiBJdCBt
aWdodCBhbHNvIG1ha2Ugc2Vuc2UgdG8gYWRqdXN0IHRoZSBzdGFydGluZyB2YWx1ZSBvZiB0
aGUgbHV0IA0KPj4+IHRhYmxlIHN1Y2ggdGhhdCBpdHMgZmluYWwgZW50cnkgaXMgdXNlZCBm
b3IgdGhlIGZpbmFsIGVudHJ5IGluIHRoZSBIVyANCj4+PiBwYWxldHRlLiBGb3IgdHlwaWNh
bCBnYW1tYSByYW1wcyB+MiwgdGhlIGN1cnZlIGlzIGZhaXJseSBmbGF0IGZvciANCj4+PiBz
bWFsbCB2YWx1ZXMgYW5kIGdvZXMgdXAgc3RlZXBseSBhdCBoaWdoIHZhbHVlcy4gKFBsZWFz
ZSBjb3JyZWN0IG1lIA0KPj4+IGlmIEknbSBtaXNpbnRlcnByZXRpbmcgdGhlIGdhbW1hIHJh
bXBzLikNCj4+DQo+PiBJIGRvbid0IHRoaW5rIHRoYXQncyBhY2N1cmF0ZS4gVGhlIG1vc3Qg
Y29tbW9uIHJhbXAgc2hvdWxkIGJlIGEgDQo+PiBzdHJhaWdodCBsaW5lIGZyb20gMCB0byB0
aGUgbWF4aW11bSB2YWx1ZSwgYW5kIG90aGVycyBtYXkgYmUgY3VydmVkIA0KPj4gdG93YXJk
IHRoZSB0b3Agb3IgYm90dG9tLg0KPj4NCj4+DQo+Pj4gRm9yIDE1LWJpdCBjYXNlIEknZCBk
byB0aGluZyBsaWtlIHRoaXMuDQo+Pj4NCj4+PiDCoMKgbHV0ICs9IDc7DQo+Pj4gwqDCoGZv
ciAoaSA8IDA7IGkgPCAzMjsgKytpLCBsdXQgKz0gOCkgew0KPj4+IMKgwqDCoMKgIC8vIHdy
aXRlwqAgbHV0DQo+Pj4gwqDCoH0NCj4+Pg0KPj4+IDE2LWJpdCBpcyBjb21wbGljYXRlZCBh
bmQgbWF5IGJldHRlciBiZSBkb25lIGluIDIgbG9vcHMNCj4+Pg0KPj4+IMKgwqBsdXRyICs9
IDc7DQo+Pj4gwqDCoGx1dGcgKz0gMzsNCj4+PiDCoMKgbHV0YiArPSA3Ow0KPj4+IMKgwqBm
b3IgKGkgPCAwOyBpIDwgMzI7ICsraSwgbHV0ciArPSA4LCBsdXRnICs9IDMsIGx1dGIgKz0g
OCkgew0KPj4+IMKgwqDCoCAvLyB3cml0ZcKgIHIvZy9iIGx1dA0KPj4+IMKgwqB9DQo+Pj4g
wqDCoGZvciAoOyBpIDwgNjQ7ICsraSwgbHV0ZyArPSAzKSB7DQo+Pj4gwqDCoMKgIC8vIHdy
aXRlwqAgMC9nLzAgbHV0DQo+Pj4gwqDCoH0NCj4+DQo+PiBUaGF0J2xsIGp1c3QgZHJvcCB0
aGUgZmlyc3QgMy03IGVudHJpZXMgb2YgdGhlIExVVCBpbnN0ZWFkIG9mIHRoZSBsYXN0IA0K
Pj4gb25lcywgaS5lLiBnZW5lcmFsbHkgdGhlIGZ1bGwgYmxhY2sgZW50cmllcyBpbnN0ZWFk
IG9mIHRoZSBmdWxsIHdoaXRlIA0KPj4gb25lcy4NCj4+DQo+PiBJZGVhbGx5LCB0aGUgbG9v
cCBzaG91bGQgc3RhcnQgYXQgMCBhbmQgdGhlbiBjb3VudCBhcyBldmVubHkgYXMgDQo+PiBw
b3NzaWJsZSB1cCB0byAyNTUvNjMvMzEuIEkgcmVhbGl6ZSB0aGF0J3MgdHJpY2t5IHRob3Vn
aCwgYW5kIEkgZG9uJ3QgDQo+PiBoYXZlIGFueSBzcGVjaWZpYyBzdWdnZXN0aW9ucyBmb3Ig
aG93IHRvIGFjaGlldmUgdGhpcyBvZmZoYW5kLg0KPj4NCj4+DQo+IA0KPiBJZiB5b3Ugd2Fu
dCAzMiB2YWx1ZXMgZnJvbSB0aGUgMjU2IHRhYmxlLCBzb21ldGhpbmcgbGlrZSB0aGlzIHNo
b3VsZCB3b3JrOg0KPiANCj4gZm9yIChpPTA7IGk8MzI7IGkrKykgew0KPiAgwqDCoCBsdXRf
aW5kZXggPSBpICogOCArIGkgLyA0Ow0KPiB9DQo+IA0KPiBsdXRfaW5kZXggd2lsbCBoYXZl
IHRoaXMgdmFsdWU6DQo+IA0KPiAwLCA4LCAxNiwgMjQsIDMzLCA0MSwgNDksIDU3LCA2Niwg
NzQsIDgyLCA5MCwgOTksIDEwNywgMTE1LCAxMjMsIDEzMiwgDQo+IDE0MCwgMTQ4LCAxNTYs
IDE2NSwgMTczLCAxODEsIDE4OSwgMTk4LCAyMDYsIDIxNCwgMjIyLCAyMzEsIDIzOSwgMjQ3
LCAyNTUNCg0KR3JlYXQuIFRoYXQncyBldmVuIGJldHRlci4NCg0KQmVzdCByZWdhcmRzDQpU
aG9tYXMNCg0KPiANCj4gDQoNCi0tIA0KVGhvbWFzIFppbW1lcm1hbm4NCkdyYXBoaWNzIERy
aXZlciBEZXZlbG9wZXINClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0K
TWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQooSFJCIDM2ODA5LCBB
RyBOw7xybmJlcmcpDQpHZXNjaMOkZnRzZsO8aHJlcjogSXZvIFRvdGV2DQo=

--------------8KgNX4v4h71Wg0x70I4TkLz0--

--------------wrV4uQ2YS0iHdNbgjkQKe4Ew
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmJ6DR0FAwAAAAAACgkQlh/E3EQov+Do
MA//VrvkeuSLhp6cm+YT2hL4WTEUDJd154H6+P/rHJIf9e6VJeXn6Bi/jqVZ8hjlNgxXnHzjRT+P
8Sw7fYJsoeumXHaNRa0wo1HkSGpB99936zz3Ejy1ECIxK0/EsgDvb9u+eEIlf19Km/i1O/z+fI4I
h22ELI1C9OxUKN1rXhcOhIarupbCD8dyYEnZ93kP3DsRTGZMYzdKHgNUDU1Dba+1n55KfdthHKIo
NACNZYm1ceggFj4QqFr83snSVYOfGAiron/4S70dRO0sAsCn3xW7cHTM+LQbea5uKzOEyZkjdVJ2
diw8BurI3IR7G1R4C+E+vmtVUzSPuqvckrdpOWvcS8r33BI0BnmbWYan4Oto0tYxEj6d2CHyFK0D
Qt68D+izw+hIkIo6z5f9YbwNa4u/EVZ48eaJxwu7XIjn01awchJRL7xaQBjtuoRX+tVOn9ETB3g5
hSSHF2M8Ydc6sWkj0oShhE0QH4iF2WRcwLzdlpQSHvwRKsJe8av68TU7h6yvhuYyRP8OULfV3W24
Pxou69OhU/pXNYVPqS/vnAY8zHU4/Rxo4TSXIIkjI3hXoCGmwNuh+FLFTs8tBl+bJFI5dbRew7Zq
tejPpLr+z+3qMhDXX1BvnhhzYbC9hvbEO2QJo3DngnsXkNqywgAMxUxSOOM6JQJrvj9+prBwyzL+
YQ8=
=Cg3a
-----END PGP SIGNATURE-----

--------------wrV4uQ2YS0iHdNbgjkQKe4Ew--
