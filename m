Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 989116EA418
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 08:49:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF76210ED8C;
	Fri, 21 Apr 2023 06:49:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A07010ED8C
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 06:49:46 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A08C221A49;
 Fri, 21 Apr 2023 06:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1682059784; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0mL3bzad1QHRe9VCAioiPaObVOPkzy0anH65oXAYvDI=;
 b=rYmCIvDqzr2HAlMLS4LV+LM//AY2XWgNMZD8S3QLE1xStKCJ+aGtqWJZj8UObk8PSnm8iU
 780cBikny7GxXZdKrD1FnKjLYYVM60+rzcRyQ75UPBnYBHJFl8z+KoqYk9L1LP/LNatm1W
 YA7UCyjqeesVDtcBW2lUKIJPEoiga7w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1682059784;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0mL3bzad1QHRe9VCAioiPaObVOPkzy0anH65oXAYvDI=;
 b=JsBJ7D40m8PLBHHEh84apyF1ZfDunve0Vd2tmd2b3bHEQDgNRsUPh132+2Uz5if4cXxa3p
 MtclOkhWind2CNBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 694EE13456;
 Fri, 21 Apr 2023 06:49:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id JLLBGAgyQmQKegAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 21 Apr 2023 06:49:44 +0000
Message-ID: <b28f6831-3be1-305e-72a5-c4df4e5f6eba@suse.de>
Date: Fri, 21 Apr 2023 08:49:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] PCI: Add ASPEED vendor ID
To: Damien Le Moal <dlemoal@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>
References: <20230420191036.GA315493@bhelgaas>
 <6b7c1f22-2d97-bda9-affd-2e3a7a1d42ed@kernel.org>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <6b7c1f22-2d97-bda9-affd-2e3a7a1d42ed@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------NjQl9J8kFPXn1vl8muUvi8P0"
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
Cc: "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR AST SERVER GRAPHICS CHIPS"
 <dri-devel@lists.freedesktop.org>, linux-ide@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, Dave Airlie <airlied@redhat.com>,
 Patrick McLean <chutzpah@gentoo.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------NjQl9J8kFPXn1vl8muUvi8P0
Content-Type: multipart/mixed; boundary="------------uFQteqgvespC5dXpZUcsNmFJ";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Damien Le Moal <dlemoal@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>
Cc: "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR AST SERVER GRAPHICS CHIPS"
 <dri-devel@lists.freedesktop.org>, linux-ide@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, Dave Airlie <airlied@redhat.com>,
 Patrick McLean <chutzpah@gentoo.org>
Message-ID: <b28f6831-3be1-305e-72a5-c4df4e5f6eba@suse.de>
Subject: Re: [PATCH] PCI: Add ASPEED vendor ID
References: <20230420191036.GA315493@bhelgaas>
 <6b7c1f22-2d97-bda9-affd-2e3a7a1d42ed@kernel.org>
In-Reply-To: <6b7c1f22-2d97-bda9-affd-2e3a7a1d42ed@kernel.org>

--------------uFQteqgvespC5dXpZUcsNmFJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjEuMDQuMjMgdW0gMDA6MDQgc2NocmllYiBEYW1pZW4gTGUgTW9hbDoNCj4g
T24gNC8yMS8yMyAwNDoxMCwgQmpvcm4gSGVsZ2FhcyB3cm90ZToNCj4+IFsrY2MgRGFtaWVu
LCBsaW51eC1pZGVdDQo+Pg0KPj4gT24gVGh1LCBBcHIgMjAsIDIwMjMgYXQgMDk6MDg6NDhB
TSArMDIwMCwgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6DQo+Pj4gQW0gMTkuMDQuMjMgdW0g
MjA6Mzcgc2NocmllYiBCam9ybiBIZWxnYWFzOg0KPj4+PiBPbiBXZWQsIEFwciAxOSwgMjAy
MyBhdCAwOTowMDoxNUFNICswMjAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4+Pj4+
IEFtIDE5LjA0LjIzIHVtIDAwOjU3IHNjaHJpZWIgUGF0cmljayBNY0xlYW46DQo+Pj4+Pj4g
Q3VycmVudGx5IHRoZSBBU1BFRUQgUENJIHZlbmRvciBJRCBpcyBkZWZpbmVkIGluDQo+Pj4+
Pj4gZHJpdmVycy9ncHUvZHJtL2FzdC9hc3RfZHJ2LmMsIG1vdmUgdGhhdCB0byBpbmNsdWRl
L2xpbnV4L3BjaV9pZHMuaA0KPj4+Pj4+IHdpdGggYWxsIHRoZSByZXN0IG9mIHRoZSBQQ0kg
dmVuZG9yIElEIGRlZmluaXRpb25zLiBSZW5hbWUgdGhlIGRlZmluaXRpb24NCj4+Pj4+PiB0
byBmb2xsb3cgdGhlIGZvcm1hdCB0aGF0IHRoZSBvdGhlciBkZWZpbml0aW9ucyBmb2xsb3cu
DQo+Pj4+Pg0KPj4+Pj4gVGhhbmtzIGEgbG90LiBDYW4geW91IHBsZWFzZSBhbHNvIG1vdmUg
YW5kIHJlbmFtZSB0aGUgUENJIGRldmljZSBpZHM/IFsxXQ0KPj4+Pg0KPj4+PiBHZW5lcmFs
bHkgd2UgbW92ZSB0aGluZ3MgdG8gcGNpX2lkcy5oIG9ubHkgd2hlbiB0aGV5IGFyZSBzaGFy
ZWQNCj4+Pj4gYmV0d2VlbiBtdWx0aXBsZSBkcml2ZXJzLiAgVGhpcyBpcyBtb3N0bHkgdG8g
bWFrZSBiYWNrcG9ydHMgZWFzaWVyLg0KPj4+Pg0KPj4+PiBQQ0lfVkVORE9SX0lEX0FTUEVF
RCBpcyAob3Igd2lsbCBiZSkgdXNlZCBpbiBib3RoIGFzdF9kcnYuYyBhbmQNCj4+Pj4gbGli
YXRhLWNvcmUuYywgc28gaXQgcXVhbGlmaWVzLg0KPj4+Pg0KPj4+PiBJdCBkb2Vzbid0IGxv
b2sgbGlrZSBQQ0lfQ0hJUF9BU1QyMDAwIGFuZCBQQ0lfQ0hJUF9BU1QyMTAwIHdvdWxkDQo+
Pj4+IHF1YWxpZnkgc2luY2UgdGhleSdyZSBvbmx5IHVzZWQgaW4gYXN0X2Rydi5jIGFuZCBh
c3RfbWFpbi5jLCB3aGljaCBhcmUNCj4+Pj4gcGFydCBvZiB0aGUgc2FtZSBkcml2ZXIuDQo+
Pj4NCj4+PiBPaywgSSBzZWUuIENhbiBJIHRha2UgdGhlIHBhdGNoIGludG8gRFJNIHRyZWVz
Pw0KPj4NCj4+IFRoZSBmaXJzdCB0aW1lIGFyb3VuZCBJIGdvdCB0d28gcGF0Y2hlcyBbMl0u
ICBUaGlzIHRpbWUgSSBvbmx5IGdvdA0KPj4gdGhpcyBwYXRjaCwgYnV0IElJVUMgdGhlcmUg
YXJlIHN0aWxsIHR3byBwYXRjaGVzIGluIHBsYXkgaGVyZToNCj4+DQo+PiAgICAtIFRoaXMg
b25lLCB3aGljaCBtb3ZlcyBQQ0lfVkVORE9SX0lEX0FTUEVFRCB0byBwY2lfaWRzLmgsIGFu
ZA0KPj4gICAgLSBUaGUgbGliYXRhLWNvcmUgb25lIHRoYXQgYWRkcyBhIHVzZSBpbiBhdGFf
ZGV2X2NvbmZpZ19uY3EoKQ0KPj4NCj4+IFRob3NlIHNob3VsZCBnbyB0b2dldGhlciB2aWEg
dGhlIHNhbWUgdHJlZS4gIEkgc3VwcGxpZWQgbXkgYWNrIHRvDQo+PiBpbmRpY2F0ZSB0aGF0
IEknbSBub3QgZ29pbmcgdG8gbWVyZ2UgYW55dGhpbmcgbXlzZWxmLCBhbmQgSSBleHBlY3QN
Cj4+IHdob2V2ZXIgbWVyZ2VzIHRoZSBsaWJhdGEgcGF0Y2ggdG8gYWxzbyBtZXJnZSB0aGlz
IG9uZS4NCj4+DQo+PiBJZiBmb3Igc29tZSByZWFzb24gdGhlIGxpYmF0YS1jb3JlIHBhdGNo
IGRvZXNuJ3QgaGFwcGVuLCB0aGVuIHRoaXMNCj4+IHBhdGNoIHNob3VsZG4ndCBoYXBwZW4g
ZWl0aGVyLCBiZWNhdXNlIHRoZXJlIHdvdWxkIG5vIGxvbmdlciBiZSBhbnkNCj4+IHNoYXJp
bmcgYmV0d2VlbiBkcml2ZXJzIHRoYXQgd291bGQganVzdGlmeSBhIHBjaV9pZHMuaCBhZGRp
dGlvbi4NCj4gDQo+IEkgY2FuIHRha2UgYm90aCBwYXRjaGVzIHRocm91Z2ggdGhlIGxpYmF0
YSB0cmVlIGJ1dCB0aGVyZSB3ZXJlIGNvbW1lbnRzIG9uIHRoZQ0KPiBzZWNvbmQgcGF0Y2gg
Zm9yIGxpYmF0YSBhbmQgSSBoYXZlIG5vdCBzZWVuIHRoZXNlIGFkZHJlc3NlZCB5ZXQgKEkg
ZGlkIG5vdCBnZXQgYQ0KPiB2MikuIEFuZCBpbiB0aGUgbWVhbnRpbWUsIGl0IHNlZW1zIHRo
YXQgdGhlIFBDSSBJRCBwYXRjaCB3YXMgcmV3b3JrZWQgYXMgYQ0KPiBzaW5nbGUgcGF0Y2gu
Li4gTm90IHN1cmUgd2hhdCdzIGhhcHBlbmluZyBoZXJlLg0KDQpJIGRvbid0IHRoaW5rIEkn
dmUgZXZlbiBzZWVuIHRoZSBsaWJhdGEgcGF0Y2guIFBsZWFzZSB0YWtlIGJvdGggcGF0Y2hl
cyANCnRocm91Z2ggeW91ciB0cmVlIHdoZW4gdGhleSBhcmUgcmVhZHkuDQoNCkJlc3QgcmVn
YXJkcw0KVGhvbWFzDQoNCj4gDQo+IA0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFw
aGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55
IEdtYkgNCkZyYW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJnLCBHZXJtYW55DQpH
RjogSXZvIFRvdGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGllbiBN
b2VybWFuDQpIUkIgMzY4MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------uFQteqgvespC5dXpZUcsNmFJ--

--------------NjQl9J8kFPXn1vl8muUvi8P0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmRCMgcFAwAAAAAACgkQlh/E3EQov+BT
9Q//VJW3pNtxksnkx4pGQy966g4XWUFPRr0ZaPDwdE/sJKXIfvsfQ7RifTIeUPb9IwVatm27hS3N
JkDb//auhJmxfRFcf75bJwt2DbjnfsLjjQGu6qaGFz2e2vbzT+YzMt/8WXuhHKCtMLLbYd0fPU3N
fSm5VxMZaRda+dqBbEGxNsblURfCz1Kv7/RkKNHzVsP6fjpcn2PTO8nRbnPhASm6k6S6+tqBGcfp
mvzbrR+DsE00ju4chdjb7TZgMYiT56djz4mem0i81CMK/CYw6AetDFcmqFrgLUOFHPkpD/0lW/4w
ya++7VGwFEvq48hEFm31yUqcutLePHQtlKYiC6ZeWY+0bP6q+UXcy8XhQCsJVC4dLVnd11dZAenn
zSnV1a/JkEgPEhAUbSKmnXw23z9iIMoeSDecOBHcTlTWOxXsC/X2uwUwwStmhl9zD9oasSV22Esv
DPaDArxX7jTYgXUV6W8SR5msxziL742DeMvCQDkGwrCWNxy8B4OLbZ55dX4iTXTjYQrp7CDQm3ib
w1egNvY8p3P+cz5dMxS3lO3YAdKMmzRjSvtsm9+NwFkChufZPLE37PNQXRdnS83/yDy6Og89TdrN
m9sw6RSp22xx+X6Jhn1h86ZvTnvob8cYjSoYIHijscIltndz7ByZ/GvgqT0rN0FSpPa9B7afL6UC
+Xs=
=8LDA
-----END PGP SIGNATURE-----

--------------NjQl9J8kFPXn1vl8muUvi8P0--
