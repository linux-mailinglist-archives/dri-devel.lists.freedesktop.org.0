Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6E244A9D1
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 09:57:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B0E06E52E;
	Tue,  9 Nov 2021 08:57:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1BF16E519
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Nov 2021 08:57:15 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9C2F221AFF;
 Tue,  9 Nov 2021 08:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1636448234; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0VNHUlH3VYAA/YVgqfpmvkrrzMF6HEeagQZN2jsHXpE=;
 b=CxsIyIS0V53KS4nY0JEDNYztfLJToeuFcOTwPK64mZgpc7UJG7qhBwCz9/zModzkvKMEBm
 2ia0rhZLIlxwoSxHQNH0nuh5O3QVmxQ5N5Q7bHTScgMHvOp5H7k+ux4FOHGFGGKHRoOSNW
 4QXeGC0kOJP+ij5FDwcmgA2r/6lpdNw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1636448234;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0VNHUlH3VYAA/YVgqfpmvkrrzMF6HEeagQZN2jsHXpE=;
 b=xEBKhaA7eOTKbQ/J0Usa2TVuMz9Ga6E95SlZkUZde/JgetTP+AYJ9OHNesUZpnTpXuGQ+w
 GHyrnrRXgeOZRgDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 899AB13ADA;
 Tue,  9 Nov 2021 08:57:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id E4N4IOo3imF9QwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 09 Nov 2021 08:57:14 +0000
Message-ID: <32064794-8e85-e537-9f0a-926faf0db448@suse.de>
Date: Tue, 9 Nov 2021 09:57:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [Bug 214725] New: simpledrm and i915 both active after boot
Content-Language: en-US
To: dri-devel@lists.freedesktop.org, dennis.lissov@gmail.com
References: <bug-214725-2300@https.bugzilla.kernel.org/>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <bug-214725-2300@https.bugzilla.kernel.org/>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------Cvbl5GZXuqq5UbkAvOGcIUBk"
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
--------------Cvbl5GZXuqq5UbkAvOGcIUBk
Content-Type: multipart/mixed; boundary="------------PurJkmUvDyEzMzhfXQwVyv0w";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: dri-devel@lists.freedesktop.org, dennis.lissov@gmail.com
Message-ID: <32064794-8e85-e537-9f0a-926faf0db448@suse.de>
Subject: Re: [Bug 214725] New: simpledrm and i915 both active after boot
References: <bug-214725-2300@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214725-2300@https.bugzilla.kernel.org/>

--------------PurJkmUvDyEzMzhfXQwVyv0w
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTUuMTAuMjEgdW0gMDE6Mjggc2NocmllYiBidWd6aWxsYS1kYWVtb25AYnVn
emlsbGEua2VybmVsLm9yZzoNCj4gaHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3df
YnVnLmNnaT9pZD0yMTQ3MjUNCj4gDQo+ICAgICAgICAgICAgICBCdWcgSUQ6IDIxNDcyNQ0K
PiAgICAgICAgICAgICBTdW1tYXJ5OiBzaW1wbGVkcm0gYW5kIGk5MTUgYm90aCBhY3RpdmUg
YWZ0ZXIgYm9vdA0KPiAgICAgICAgICAgICBQcm9kdWN0OiBEcml2ZXJzDQo+ICAgICAgICAg
ICAgIFZlcnNpb246IDIuNQ0KPiAgICAgIEtlcm5lbCBWZXJzaW9uOiA1LjE0LjExDQo+ICAg
ICAgICAgICAgSGFyZHdhcmU6IEFsbA0KPiAgICAgICAgICAgICAgICAgIE9TOiBMaW51eA0K
PiAgICAgICAgICAgICAgICBUcmVlOiBNYWlubGluZQ0KPiAgICAgICAgICAgICAgU3RhdHVz
OiBORVcNCj4gICAgICAgICAgICBTZXZlcml0eTogbm9ybWFsDQo+ICAgICAgICAgICAgUHJp
b3JpdHk6IFAxDQo+ICAgICAgICAgICBDb21wb25lbnQ6IFZpZGVvKERSSSAtIG5vbiBJbnRl
bCkNCj4gICAgICAgICAgICBBc3NpZ25lZTogZHJpdmVyc192aWRlby1kcmlAa2VybmVsLWJ1
Z3Mub3NkbC5vcmcNCj4gICAgICAgICAgICBSZXBvcnRlcjogZGVubmlzLmxpc3NvdkBnbWFp
bC5jb20NCj4gICAgICAgICAgUmVncmVzc2lvbjogTm8NCj4gDQo+IEdlbnRvbyBMaW51eCwg
Y3VzdG9tIGtlcm5lbCBidWlsZCwgNS4xNC4xMSB3aXRoDQo+IENPTkZJR19EUk1fU0lNUExF
RFJNPXkNCj4gQ09ORklHX0RSTV9JOTE1PXkNCj4gDQo+IFBsYXNtYSAod2F5bGFuZCkgc2Vl
cyB0d28gbW9uaXRvcnM6IHRoZSBsYXB0b3Agc2NyZWVuIGFuZCBhbiB1bmtub3duIG9uZS4g
VGhlDQo+IG9ubHkgbW9uaXRvciBwaHlzaWNhbGx5IHByZXNlbnQgaXMgdGhlIGxhcHRvcCBz
Y3JlZW4uIFRoaXMgZGlkIG5vdCBoYXBwZW4gYSBmZXcNCj4gbW9udGhzIGFnbyAocG9zc2li
bHkgc3RhcnRlZCB3aXRoIDUuMTQgdXBncmFkZSkuDQo+IA0KPiAkIGxzIC9zeXMvY2xhc3Mv
ZHJtLw0KPiBjYXJkMCAgY2FyZDAtZURQLTEgIGNhcmQxICBjYXJkMS1Vbmtub3duLTEgIGNh
cmQyICBjYXJkMi1EUC0xICBjYXJkMi1EUC0yDQo+IGNhcmQyLURQLTMgIHJlbmRlckQxMjgg
IHJlbmRlckQxMjkgIHZlcnNpb24NCj4gJCByZWFkbGluayAvc3lzL2NsYXNzL2RybS9jYXJk
MCAjIEludGVsIEdQVQ0KPiAuLi8uLi9kZXZpY2VzL3BjaTAwMDA6MDAvMDAwMDowMDowMi4w
L2RybS9jYXJkMA0KPiAkIHJlYWRsaW5rIC9zeXMvY2xhc3MvZHJtL2NhcmQxICMgU2ltcGxl
IERSTQ0KPiAuLi8uLi9kZXZpY2VzL3BsYXRmb3JtL3NpbXBsZS1mcmFtZWJ1ZmZlci4wL2Ry
bS9jYXJkMQ0KPiAkIHJlYWRsaW5rIC9zeXMvY2xhc3MvZHJtL2NhcmQyICMgTm91dmVhdSAo
bm90IHVzZWQgYXQgdGhlIG1vbWVudCkNCj4gLi4vLi4vZGV2aWNlcy9wY2kwMDAwOjAwLzAw
MDA6MDA6MDEuMC8wMDAwOjAxOjAwLjAvZHJtL2NhcmQyDQo+IA0KPiAkIGRtZXNnIHwgZWdy
ZXAgJyhzaW1wbGV8aTkxNSknDQo+IFsgICAgMC4wMDAwMDBdIENvbW1hbmQgbGluZTogQk9P
VF9JTUFHRT0va2VybmVsLTUuMTQuMTEgcm9vdD1bLi4uXSBybw0KPiBhY3BpX2JhY2tsaWdo
dD12aWRlbyByZXN1bWU9Wy4uLl0gaTkxNS5lbmFibGVfZ3Z0PTEgcXVpZXQNCj4gWyAgICAw
LjA2MDM0Ml0gS2VybmVsIGNvbW1hbmQgbGluZTogQk9PVF9JTUFHRT0va2VybmVsLTUuMTQu
MTEgcm9vdD1bLi4uXSBybw0KPiBhY3BpX2JhY2tsaWdodD12aWRlbyByZXN1bWU9Wy4uLl0g
aTkxNS5lbmFibGVfZ3Z0PTEgcXVpZXQNCj4gWyAgICAxLjA3Njk1N10gaTkxNSAwMDAwOjAw
OjAyLjA6IFtkcm1dIFZULWQgYWN0aXZlIGZvciBnZnggYWNjZXNzDQo+IFsgICAgMS4wNzY5
NjFdIGk5MTUgMDAwMDowMDowMi4wOiB2Z2FhcmI6IGRlYWN0aXZhdGUgdmdhIGNvbnNvbGUN
Cj4gWyAgICAxLjM4NzM1OV0gaTkxNSAwMDAwOjAwOjAyLjA6IERpcmVjdCBmaXJtd2FyZSBs
b2FkIGZvcg0KPiBpOTE1L2d2dC92aWRfMHg4MDg2X2RpZF8weDE5MWJfcmlkXzB4MDYuZ29s
ZGVuX2h3X3N0YXRlIGZhaWxlZCB3aXRoIGVycm9yIC0yDQo+IFsgICAgMS40MDQ0MThdIGk5
MTUgMDAwMDowMDowMi4wOiB2Z2FhcmI6IGNoYW5nZWQgVkdBIGRlY29kZXM6DQo+IG9sZGRl
Y29kZXM9aW8rbWVtLGRlY29kZXM9bm9uZTpvd25zPWlvK21lbQ0KPiBbICAgIDEuNDA0NTI1
XSBpOTE1IDAwMDA6MDA6MDIuMDogW2RybV0gRGlzYWJsaW5nIGZyYW1lYnVmZmVyIGNvbXBy
ZXNzaW9uIChGQkMpDQo+IHRvIHByZXZlbnQgc2NyZWVuIGZsaWNrZXIgd2l0aCBWVC1kIGVu
YWJsZWQNCj4gWyAgICAxLjQwNDkzMV0gaTkxNSAwMDAwOjAwOjAyLjA6IFtkcm1dIEZpbmlz
aGVkIGxvYWRpbmcgRE1DIGZpcm13YXJlDQo+IGk5MTUvc2tsX2RtY192ZXIxXzI3LmJpbiAo
djEuMjcpDQo+IFsgICAgMS40MjIxMjhdIFtkcm1dIEluaXRpYWxpemVkIGk5MTUgMS42LjAg
MjAyMDExMDMgZm9yIDAwMDA6MDA6MDIuMCBvbiBtaW5vcg0KPiAwDQo+IFsgICAgMS40MjUx
MjddIFtkcm1dIEluaXRpYWxpemVkIHNpbXBsZWRybSAxLjAuMCAyMDIwMDYyNSBmb3INCj4g
c2ltcGxlLWZyYW1lYnVmZmVyLjAgb24gbWlub3IgMQ0KPiBbICAgIDEuNDM3ODU5XSBzaW1w
bGUtZnJhbWVidWZmZXIgc2ltcGxlLWZyYW1lYnVmZmVyLjA6IFtkcm1dIGZiMDogc2ltcGxl
ZHJtDQo+IGZyYW1lIGJ1ZmZlciBkZXZpY2UNCj4gWyAgICAxLjQzODA1OF0gZmJjb246IGk5
MTUgKGZiMSkgaXMgcHJpbWFyeSBkZXZpY2UNCj4gWyAgICAyLjU3OTEzM10gaTkxNSAwMDAw
OjAwOjAyLjA6IFtkcm1dIGZiMTogaTkxNSBmcmFtZSBidWZmZXIgZGV2aWNlDQo+IFsgICAy
Mi4xNjI2MTJdIHNuZF9oZGFfaW50ZWwgMDAwMDowMDoxZi4zOiBib3VuZCAwMDAwOjAwOjAy
LjAgKG9wcw0KPiBpOTE1X2F1ZGlvX2NvbXBvbmVudF9iaW5kX29wcykNCj4gWyAgIDUyLjEw
NjA4NF0gc2ltcGxlLWZyYW1lYnVmZmVyIHNpbXBsZS1mcmFtZWJ1ZmZlci4wOiBzd2lvdGxi
IGJ1ZmZlciBpcyBmdWxsDQo+IChzejogODM4ODYwOCBieXRlcyksIHRvdGFsIDMyNzY4IChz
bG90cyksIHVzZWQgMCAoc2xvdHMpDQo+IA0KPiBMb29rcyBsaWtlIHRoZSBoYW5kLW92ZXIg
bWVjaGFuaXNtIGRvZXMgbm90IGNvcnJlY3RseSBoYW5kbGUgdGhpcyBjb21iaW5hdGlvbiwN
Cj4gcG9zc2libHkgZHVlIHRvIGk5MTUgbG9hZGluZyBiZWZvcmUgc2ltcGxlZHJtLg0KPiAN
Cg0KSW50ZXJlc3RpbmcuIFRoZXJlIGFyZSB0d28gd29ya2Fyb3VuZHM6DQoNCiAgKiBidWls
ZCBldmVyeSBkcml2ZXIgZXhjZXB0IHNpbXBsZWRybSBhcyBtb2R1bGUsIG9yDQogICogZG9u
J3QgYnVpbGQgc2ltcGxlZHJtIG9uIHl1ciBzeXN0ZW0gKGl0J3MgR2VudG9vKQ0KDQpJIGRv
bid0IHRoaW5rIHRoYXQgbGlua2luZyBhbGwgZHJpdmVyIGludG8gdGhlIGtlcm5lbCB3b3Jr
ZWQgYmVmb3JlIA0Kc2ltcGxlZHJtLiBCZWZvcmUgc2ltcGxlZHJtIHRoZXJlIHdvdWxkIGJl
IHNpbXBsZWZiLCBlZmlmYiBvciB2ZXNhZmIuIA0KVGhvc2UgZHJpdmVycyB1c2UgYSBzaW1p
bGFyIGhhbmRvdmVyIHNjaGVtZSwgd2hpY2ggd291bGQgaGF2ZSBmYWlsZWQgaW4gDQphIHNp
bWlsYXIgd2F5Lg0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQotLSANClRob21hcyBaaW1t
ZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0
aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2Vy
bWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2
byBUb3Rldg0K

--------------PurJkmUvDyEzMzhfXQwVyv0w--

--------------Cvbl5GZXuqq5UbkAvOGcIUBk
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmGKN+kFAwAAAAAACgkQlh/E3EQov+Dx
KA/8CREtjkMLBuHNmKwyYUOYO+ALY+MV4DM6CQesXk/9rIVqnoytYsD5oPL30Ste7ct2Lj6qBTXK
wZF69qV7CGVz6sYkoNMKoJdXRBVjrixZxO1j7hJmDVrmuyeS/a1zCwbNqvKv97C5paiA7CH0SoIP
NZ+BT3f5WzX8lIP96LATSCj/sJeDM5IDviQTshMB85NCgwZx5wXEA3i0b9kcN/BabI9vBHfJPePE
11MwE74KxA4LdY3wOPWlBDaaKPemzhIpFlVkQzs1YPq0UOuTdjlYs/8jL1MU5szdfuJOMeeB7XJn
Ib0AKQH8NlP6fKbqhmqhuyLTPeggewrJt++w8K6a5/+icv5BS4rTsGxGxfLkSWasNx3GNwwIlpaD
vmM8PKOSBhHR4RRoDh4Mhy2kGvAVlHmwweTCxaWaNU/nEbH3y/nWP8XHO9fu3xRpUXpc7kBE374p
ZZRPlzv3MvJG/0jqsi/hm+nJEJLyxz3AtLVUGbg1KBGeQPRwAKCcm0lx+1TMkpgLwmZ/fb89EA21
8oL4sw2gz0kdQLZysEVQ6VOhM4d2DGIu4R/xWROnyB9ya9x2COXzcCRQG2z2fTBXOyuJS13b+LpB
y8YdGLXTY05gIcOk090CcXwADOzViBLakH+egZotcotKuosFMeClaha9j9hzTcDiZSGiaFyhE91R
1uI=
=DCn7
-----END PGP SIGNATURE-----

--------------Cvbl5GZXuqq5UbkAvOGcIUBk--
