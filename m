Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2944549360E
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 09:17:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 336D010E523;
	Wed, 19 Jan 2022 08:16:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A32BC10E523
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 08:16:53 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 06A8C218E2;
 Wed, 19 Jan 2022 08:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1642580212; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4TU1CiJ7tdkDYwgvfbNzgHJ/RjE6eQLvj7ltFbUT0nQ=;
 b=QweqiBWesLRngwqfen3kputfxYdxiniLm/s/jozA3ds/yt77a4gJgVARDldXwQ1XzBteDI
 F6lflFHRbEtqSPC4GFBo1SJbCQji7V1QEkc2bZmrYhG35yJ6w5wwDtq/3KTu4ngYjRdsue
 aY//leyPpbdVNeZ8gDgiPCH0hwgGG98=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1642580212;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4TU1CiJ7tdkDYwgvfbNzgHJ/RjE6eQLvj7ltFbUT0nQ=;
 b=C7ax2Q7xIdrlHqmDw8l0SJg0eIzH8UUi99CKLa6+b2w7+s2dQfrWwnDkKpi1j09i4y1/h3
 d7ePuvG96X7+EIBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id DDE1E13B16;
 Wed, 19 Jan 2022 08:16:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id FMo9NfPI52EeewAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 19 Jan 2022 08:16:51 +0000
Message-ID: <4dbe5421-73bb-e22d-3f8a-28578fffc55f@suse.de>
Date: Wed, 19 Jan 2022 09:16:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] mgag200 fix memmapsl configuration in GCTL6 register
Content-Language: en-US
To: Lyude Paul <lyude@redhat.com>, Jocelyn Falempe <jfalempe@redhat.com>,
 dri-devel@lists.freedesktop.org
References: <20220114094754.522401-1-jfalempe@redhat.com>
 <20220114094754.522401-2-jfalempe@redhat.com>
 <8e2fed4af467f335def97232abbc22d86aff0617.camel@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <8e2fed4af467f335def97232abbc22d86aff0617.camel@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------CtcBFrC3wck3bCjuUwuzrVRt"
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
Cc: michel@daenzer.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------CtcBFrC3wck3bCjuUwuzrVRt
Content-Type: multipart/mixed; boundary="------------B9XJkuWB92BbCd70q7PifhYY";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Lyude Paul <lyude@redhat.com>, Jocelyn Falempe <jfalempe@redhat.com>,
 dri-devel@lists.freedesktop.org
Cc: michel@daenzer.net
Message-ID: <4dbe5421-73bb-e22d-3f8a-28578fffc55f@suse.de>
Subject: Re: [PATCH] mgag200 fix memmapsl configuration in GCTL6 register
References: <20220114094754.522401-1-jfalempe@redhat.com>
 <20220114094754.522401-2-jfalempe@redhat.com>
 <8e2fed4af467f335def97232abbc22d86aff0617.camel@redhat.com>
In-Reply-To: <8e2fed4af467f335def97232abbc22d86aff0617.camel@redhat.com>

--------------B9XJkuWB92BbCd70q7PifhYY
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTguMDEuMjIgdW0gMjA6MDYgc2NocmllYiBMeXVkZSBQYXVsOg0KPiBXZSBz
aG91bGQgcHJvYmFibHkgIENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnIHRoaXMgYXMgd2Vs
bCwgc2VlOg0KPiANCj4gaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvaHRtbC9sYXRlc3Qv
cHJvY2Vzcy9zdGFibGUta2VybmVsLXJ1bGVzLmh0bWwgZm9yDQo+IG1vcmUgaW5mby4gQXMg
d2VsbCwgc29tZSB1c2VmdWwgdG9vbHMgZm9yIGFkZGluZyB0aGUgYXBwcm9wcmlhdGUgRml4
ZXM6IHRhZ3M6DQo+IA0KPiBodHRwczovL2RybS5wYWdlcy5mcmVlZGVza3RvcC5vcmcvbWFp
bnRhaW5lci10b29scy9kaW0uaHRtbA0KPiANCj4gQXQgbGVhc3Qgb24gbXkgZW5kIHRoaXMg
aXM6DQo+IA0KPiBBY2tlZC1ieTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4NCj4g
DQo+IEknZCB2ZXJ5IG11Y2ggbGlrZSBUaG9tYXMgWmltbWVybWFuIHRvIHZlcmlmeSB0aGF0
IHRoaXMgcGF0Y2ggaXMgT0sgdGhvdWdoDQo+IHdpdGggYW4gUi1iIGJlZm9yZSB3ZSBwdXNo
IGFueXRoaW5nIHVwc3RyZWFtLg0KDQpZZXAsIEknbGwgZ2l2ZSBpdCBhIHRyeSBvbiBteSB0
ZXN0IHN5c3RlbS4gSSdsbCBhbHNvIGFkZCBhIFRPRE8gY29tbWVudCANCnRoYXQgc3VtbWFy
aXplcyB0aGUgc2l0dWF0aW9uLg0KDQpBIHJlYWwgZml4IHdvdWxkIGRldGVjdCB0aGF0IHRo
ZSBrZHVtcCBrZXJuZWwgaXMgcnVubmluZyBhbmQgbm90IHVzZSB0aGUgDQpkaXNwbGF5IHRo
ZW4uDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4gDQo+IE9uIEZyaSwgMjAyMi0wMS0x
NCBhdCAxMDo0NyArMDEwMCwgSm9jZWx5biBGYWxlbXBlIHdyb3RlOg0KPj4gT24gc29tZSBz
ZXJ2ZXIgd2l0aCBNR0EgRzIwMGUgKHJldiA0MiksIGJvb3Rpbmcgd2l0aCBMZWdhY3kgQklP
UywNCj4+IFRoZSBoYXJkd2FyZSBoYW5ncyB3aGVuIHVzaW5nIGtkdW1wIGFuZCBrZXhlYyBp
bnRvIHRoZSBrZHVtcCBrZXJuZWwuDQo+PiBUaGlzIGhhcHBlbnMgd2hlbiB0aGUgdW5jb21w
cmVzcyBjb2RlIHRyaWVzIHRvIHdyaXRlICJEZWNvbXByZXNzaW5nIExpbnV4Ig0KPj4gdG8g
dGhlIFZHQSBDb25zb2xlLg0KPj4NCj4+IEl0IGNhbiBiZSByZXByb2R1Y2VkIGJ5IHdyaXRp
bmcgdG8gdGhlIFZHQSBjb25zb2xlICgweEI4MDAwKSBhZnRlcg0KPj4gYm9vdGluZyB0byBn
cmFwaGljIG1vZGUsIGl0IGdlbmVyYXRlcyB0aGUgZm9sbG93aW5nIGVycm9yOg0KPj4NCj4+
IGtlcm5lbDpOTUk6IFBDSSBzeXN0ZW0gZXJyb3IgKFNFUlIpIGZvciByZWFzb24gYTAgb24g
Q1BVIDAuDQo+PiBrZXJuZWw6RGF6ZWQgYW5kIGNvbmZ1c2VkLCBidXQgdHJ5aW5nIHRvIGNv
bnRpbnVlDQo+Pg0KPj4gVGhlIHJvb3QgY2F1c2UgaXMgYSBiYWQgY29uZmlndXJhdGlvbiBv
ZiB0aGUgTUdBIEdDVEw2IHJlZ2lzdGVyDQo+Pg0KPj4gQWNjb3JkaW5nIHRvIHRoZSBHQ1RM
NiByZWdpc3RlciBkb2N1bWVudGF0aW9uOg0KPj4NCj4+IGJpdCAwIGlzIGdjZ3Jtb2RlOg0K
Pj4gIMKgwqDCoCAwOiBFbmFibGVzIGFscGhhIG1vZGUsIGFuZCB0aGUgY2hhcmFjdGVyIGdl
bmVyYXRvciBhZGRyZXNzaW5nIHN5c3RlbSBpcw0KPj4gYWN0aXZhdGVkLg0KPj4gIMKgwqDC
oCAxOiBFbmFibGVzIGdyYXBoaWNzIG1vZGUsIGFuZCB0aGUgY2hhcmFjdGVyIGFkZHJlc3Np
bmcgc3lzdGVtIGlzIG5vdA0KPj4gdXNlZC4NCj4+DQo+PiBiaXQgMSBpcyBjaGFpbm9kZCBl
dmVuOg0KPj4gIMKgwqDCoCAwOiBUaGUgQTAgc2lnbmFsIG9mIHRoZSBtZW1vcnkgYWRkcmVz
cyBidXMgaXMgdXNlZCBkdXJpbmcgc3lzdGVtIG1lbW9yeQ0KPj4gIMKgwqDCoCBhZGRyZXNz
aW5nLg0KPj4gIMKgwqDCoCAxOiBBbGxvd3MgQTAgdG8gYmUgcmVwbGFjZWQgYnkgZWl0aGVy
IHRoZSBBMTYgc2lnbmFsIG9mIHRoZSBzeXN0ZW0NCj4+IGFkZHJlc3MgKGlmDQo+PiAgwqDC
oMKgIG1lbW1hcHNsIGlzIOKAmDAw4oCZKSwgb3IgYnkgdGhlIGhwZ29kZGV2IChNSVNDPDU+
LCBvZGQvZXZlbiBwYWdlIHNlbGVjdCkNCj4+IGZpZWxkLA0KPj4gIMKgwqDCoCBkZXNjcmli
ZWQgb24gcGFnZSAzLTI5NCkuDQo+Pg0KPj4gYml0IDMtMiBhcmUgbWVtbWFwc2w6DQo+PiAg
wqDCoMKgIE1lbW9yeSBtYXAgc2VsZWN0IGJpdHMgMSBhbmQgMC4gVkdBLg0KPj4gIMKgwqDC
oCBUaGVzZSBiaXRzIHNlbGVjdCB3aGVyZSB0aGUgdmlkZW8gbWVtb3J5IGlzIG1hcHBlZCwg
YXMgc2hvd24gYmVsb3c6DQo+PiAgwqDCoMKgwqDCoMKgwqAgMDAgPT4gQTAwMDBoIC0gQkZG
RkZoDQo+PiAgwqDCoMKgwqDCoMKgwqAgMDEgPT4gQTAwMDBoIC0gQUZGRkZoDQo+PiAgwqDC
oMKgwqDCoMKgwqAgMTAgPT4gQjAwMDBoIC0gQjdGRkZoDQo+PiAgwqDCoMKgwqDCoMKgwqAg
MTEgPT4gQjgwMDBoIC0gQkZGRkZoDQo+Pg0KPj4gYml0IDctNCBhcmUgcmVzZXJ2ZWQuDQo+
Pg0KPj4gQ3VycmVudCBkcml2ZXIgY29kZSBzZXQgaXQgdG8gMHgwNSA9PiBtZW1tYXBzbCB0
byBiMDEgPT4gMHhBMDAwMA0KPj4gYnV0IG9uIHg4NiwgdGhlIFZHQSBjb25zb2xlIGlzIGF0
IDB4QjgwMDANCj4+IGFyY2gveDg2L2Jvb3QvY29tcHJlc3NlZC9taXNjLmMgZGVmaW5lIHZp
ZG1lbSB0byAweGI4MDAwIGluIGV4dHJhY3Rfa2VybmVsKCkNCj4+IHNvIGl0J3MgYmV0dGVy
IHRvIGNvbmZpZ3VyZSBpdCB0byBiMTENCj4+IFRodXMgY2hhbmdpbmcgdGhlIHZhbHVlIDB4
MDUgdG8gMHgwZA0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEpvY2VseW4gRmFsZW1wZSA8amZh
bGVtcGVAcmVkaGF0LmNvbT4NCj4+IC0tLQ0KPj4gIMKgZHJpdmVycy9ncHUvZHJtL21nYWcy
MDAvbWdhZzIwMF9tb2RlLmMgfCAyICstDQo+PiAgwqAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL21nYWcyMDAvbWdhZzIwMF9tb2RlLmMNCj4+IGIvZHJpdmVycy9ncHUvZHJtL21n
YWcyMDAvbWdhZzIwMF9tb2RlLmMNCj4+IGluZGV4IGI5ODM1NDFhNGM1My4uYzdmNjM2MTBi
Mjc4IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL21nYWcyMDAvbWdhZzIwMF9t
b2RlLmMNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZ2FnMjAwL21nYWcyMDBfbW9kZS5j
DQo+PiBAQCAtNTI5LDcgKzUyOSw3IEBAIHN0YXRpYyB2b2lkIG1nYWcyMDBfc2V0X2Zvcm1h
dF9yZWdzKHN0cnVjdCBtZ2FfZGV2aWNlDQo+PiAqbWRldiwNCj4+ICDCoMKgwqDCoMKgwqDC
oMKgV1JFR19HRlgoMywgMHgwMCk7DQo+PiAgwqDCoMKgwqDCoMKgwqDCoFdSRUdfR0ZYKDQs
IDB4MDApOw0KPj4gIMKgwqDCoMKgwqDCoMKgwqBXUkVHX0dGWCg1LCAweDQwKTsNCj4+IC3C
oMKgwqDCoMKgwqDCoFdSRUdfR0ZYKDYsIDB4MDUpOw0KPj4gK8KgwqDCoMKgwqDCoMKgV1JF
R19HRlgoNiwgMHgwZCk7DQo+PiAgwqDCoMKgwqDCoMKgwqDCoFdSRUdfR0ZYKDcsIDB4MGYp
Ow0KPj4gIMKgwqDCoMKgwqDCoMKgwqBXUkVHX0dGWCg4LCAweDBmKTsNCj4+ICAgDQo+IA0K
DQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpT
VVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkw
NDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2Vz
Y2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------B9XJkuWB92BbCd70q7PifhYY--

--------------CtcBFrC3wck3bCjuUwuzrVRt
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmHnyPMFAwAAAAAACgkQlh/E3EQov+DW
UQ//Re7S178ig2i67GhqyrRDunhaGkNJFrk4sILxefbFcw1QCUUm5+4rZ6SnhzETeIkeQKGTKfP8
P8JaNWi7JsCMgedlZXVeXaxTI1vdFFkzwpzBW3KbAZFmREj6P+neA3vTpwaiuAiF+9nUEO6oepGb
qbBfiwm6j6UhOggEZzQv1Ksrqs5XL2lRVeuvPMuwy44aX2FcuVksgv4AHkjvIu6jwlWL+CNpvYxN
rTb7Qw4u9IzC3/favUSjELnxURpyMMuNtEdb0+5vtvJ2r2/Gfm7nM98lJJrsn5VpD+OLN7fkBh/+
AL76bbFp9JDrqoNxbxkEWnwXimq96V7JnEMWP6VDeHF43BsQwxNWX6w6DOpLdKDaUfwgbmSJqSyh
saYdxfPOPaNXZO136yUOAsUhj60G7gT4I370zclQvs95i6y3jV/DXEDrZciO0jpJwz9tMiU7zGVT
satCVKQ3U237QJcSs5dXaEapnfzEb/5R6XoLqIEu3rH1tceCAUu7roKqo7dYWOpYKVKJjU2VXihe
Uz/lV6g+n0KFlLIkl1SN2HxiNEbtOLS3KJkBGF4PNjZTf9jfWfJ+KiHT72Qd9esc0xxx6IJCgp+Q
ovBULjPOCn8E5C9m+oiRJ7duv3YYpyBEDKw1JkhvYdHd3SCPEA5NIFHcKOYiqnyD2UEcFDJ0L+EN
8kk=
=BmNh
-----END PGP SIGNATURE-----

--------------CtcBFrC3wck3bCjuUwuzrVRt--
