Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A62BC6EF1C2
	for <lists+dri-devel@lfdr.de>; Wed, 26 Apr 2023 12:15:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4563E10E064;
	Wed, 26 Apr 2023 10:15:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 434D410E064
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Apr 2023 10:15:42 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 259DD1FDCE;
 Wed, 26 Apr 2023 10:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1682504139; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xUQOciAxNAn/RGP49yIERgHT/jUv4drDTr+CHH2Ibvc=;
 b=XZF35shtUKQa7H9FmIKhoHKRFo0SOpW+pFQC+r6WLwz2/5iZyU39/jRIYp0YNQkA9vEiTI
 ghzArqLCPsAvVGw+IcS9A8blmhGwlAC1cNPZ4D8mK/Pq5x2hhddHBiD7vy4Gn4jwtveEB9
 Q8XdQ6srudKVYBQILEcqhzI2NFQAU+M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1682504139;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xUQOciAxNAn/RGP49yIERgHT/jUv4drDTr+CHH2Ibvc=;
 b=2z//qskBN3z/qq6pH3GtYuWplZX3ydVxOfkU771WhIuRgA3LQCNmGjhMtDOB4evm5oiX/Q
 qM5PoLSUEzKKZ7DQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 07CA713421;
 Wed, 26 Apr 2023 10:15:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id nRD+AMv5SGR9UwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 26 Apr 2023 10:15:39 +0000
Message-ID: <a8fde333-0e27-f0f4-44fa-9291927c4a3e@suse.de>
Date: Wed, 26 Apr 2023 12:15:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 07/14] drm/mgag200: Replace simple-KMS with regular atomic
 helpers
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kernel@linuxace.com
References: <7f770bc8-d79b-ca1c-21ba-aa888ace2153@suse.de>
 <20230425233952.5618-1-kernel@linuxace.com>
 <5a9ad6c8-9a0f-91fb-b7c8-ac9b98dc08db@suse.de>
In-Reply-To: <5a9ad6c8-9a0f-91fb-b7c8-ac9b98dc08db@suse.de>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------s3N6WJFVMFfGHUF9WZAxHM6Z"
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
Cc: jfalempe@redhat.com, sam@ravnborg.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------s3N6WJFVMFfGHUF9WZAxHM6Z
Content-Type: multipart/mixed; boundary="------------1bY3kxGqfpDsjPvp6UkYhfGo";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: kernel@linuxace.com
Cc: dri-devel@lists.freedesktop.org, jfalempe@redhat.com, sam@ravnborg.org
Message-ID: <a8fde333-0e27-f0f4-44fa-9291927c4a3e@suse.de>
Subject: Re: [PATCH 07/14] drm/mgag200: Replace simple-KMS with regular atomic
 helpers
References: <7f770bc8-d79b-ca1c-21ba-aa888ace2153@suse.de>
 <20230425233952.5618-1-kernel@linuxace.com>
 <5a9ad6c8-9a0f-91fb-b7c8-ac9b98dc08db@suse.de>
In-Reply-To: <5a9ad6c8-9a0f-91fb-b7c8-ac9b98dc08db@suse.de>

--------------1bY3kxGqfpDsjPvp6UkYhfGo
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

DQoNCkFtIDI2LjA0LjIzIHVtIDA5OjAxIHNjaHJpZWIgVGhvbWFzIFppbW1lcm1hbm46DQo+
IEhpDQo+IA0KPiBBbSAyNi4wNC4yMyB1bSAwMTozOSBzY2hyaWViIGtlcm5lbEBsaW51eGFj
ZS5jb206DQo+PiBJJ20gbm90IHN1cmUgaWYgdGhpcyBpbmZvcm1hdGlvbiBpcyB1c2VmdWws
IGJ1dCB3ZSBoYXZlIGZvdW5kIG9uZSANCj4+IHN5c3RlbSB3aGljaA0KPj4gd29ya3Mgd2l0
aCB0aGUgNi4xIGtlcm5lbC7CoCBJIGdyYWJiZWQgdGhlIGxzcGNpIG91dHB1dCBmcm9tIGEg
d29ya2luZyBhbmQNCj4+IG5vbi13b3JraW5nIHN5c3RlbSwgcGFzdGVkIGJlbG93LsKgIFNh
bWUga2VybmVsIGFuZCBzYW1lIGRpc3Ryby4NCj4+DQo+PiBCQUQgRGVsbCBSODE1IEFNRA0K
Pj4gMGE6MDMuMCBWR0EgY29tcGF0aWJsZSBjb250cm9sbGVyOiBNYXRyb3ggRWxlY3Ryb25p
Y3MgU3lzdGVtcyBMdGQuIE1HQSANCj4+IEcyMDBlVw0KPiANCj4gVGhhbmtzIGZvciB0aGlz
IGluZm8uIFRoYXQncyBhIEcyMDBlVywgd2hpY2ggdXNlcyBzbGlnaHRseSBkaWZmZXJlbnQg
DQo+IGNvZGUgd2l0aGluIHRoZSBkcml2ZXIuIEZyb20gdGhlIHRlc3Rpbmcgd2UndmUgZG9u
ZSwgd2UgZGlkbid0IHNlZSB0aGUgDQo+IGJ1ZyBlaXRoZXIuIFNvIGl0J3MgcHJvYmFibHkg
c29tZXRoaW5nIHZlcnkgc3BlY2lmaWMgdG8geW91ciBtYWNoaW5lIG9yIA0KPiB0aGUgRzIw
MEVIIG1vZGVsLg0KDQpPaCwgbm93IEkgZ290IGl0LiBUaGlzIEcyMDBlVyBpcyBicm9rZW4u
IFRoZSBvdGhlciBvbmUgaXMgZ29vZC4gQW5kIHRoZSANCmtlcm5lbCBpcyBhbHNvIGJyb2tl
biBvbiB0aGUgRzIwMEVIPw0KDQpCZXN0IHJlZ2FyZHMNClRob21hcw0KDQo+IA0KPiBCZXN0
IHJlZ2FyZHMNCj4gVGhvbWFzDQo+IA0KPj4gwqDCoMKgwqDCoMKgwqDCoCBXUENNNDUwIChy
ZXYgMGEpIChwcm9nLWlmIDAwIFtWR0EgY29udHJvbGxlcl0pDQo+PiDCoMKgwqDCoMKgwqDC
oCBEZXZpY2VOYW1lOiBFbWJlZGRlZCBWaWRlbw0KPj4gwqDCoMKgwqDCoMKgwqAgU3Vic3lz
dGVtOiBEZWxsIERldmljZSAwNDQ0DQo+PiDCoMKgwqDCoMKgwqDCoCBDb250cm9sOiBJL08r
IE1lbSsgQnVzTWFzdGVyKyBTcGVjQ3ljbGUtIE1lbVdJTlYtIFZHQVNub29wLSANCj4+IFBh
ckVyci0gU3RlcHBpbmctIFNFUlItIEZhc3RCMkItIERpc0lOVHgtDQo+PiDCoMKgwqDCoMKg
wqDCoCBTdGF0dXM6IENhcCsgNjZNSHotIFVERi0gRmFzdEIyQisgUGFyRXJyLSBERVZTRUw9
bWVkaXVtIA0KPj4gPlRBYm9ydC0gPFRBYm9ydC0gPE1BYm9ydC0gPlNFUlItIDxQRVJSLSBJ
TlR4LQ0KPj4gwqDCoMKgwqDCoMKgwqAgTGF0ZW5jeTogMzIgKDQwMDBucyBtaW4sIDgwMDBu
cyBtYXgpLCBDYWNoZSBMaW5lIFNpemU6IDY0IGJ5dGVzDQo+PiDCoMKgwqDCoMKgwqDCoCBJ
bnRlcnJ1cHQ6IHBpbiBBIHJvdXRlZCB0byBJUlEgNQ0KPj4gwqDCoMKgwqDCoMKgwqAgTlVN
QSBub2RlOiAwDQo+PiDCoMKgwqDCoMKgwqDCoCBJT01NVSBncm91cDogMTANCj4+IMKgwqDC
oMKgwqDCoMKgIFJlZ2lvbiAwOiBNZW1vcnkgYXQgZWM4MDAwMDAgKDMyLWJpdCwgcHJlZmV0
Y2hhYmxlKSBbc2l6ZT04TV0NCj4+IMKgwqDCoMKgwqDCoMKgIFJlZ2lvbiAxOiBNZW1vcnkg
YXQgZWY3ZmMwMDAgKDMyLWJpdCwgbm9uLXByZWZldGNoYWJsZSkgDQo+PiBbc2l6ZT0xNktd
DQo+PiDCoMKgwqDCoMKgwqDCoCBSZWdpb24gMjogTWVtb3J5IGF0IGVlODAwMDAwICgzMi1i
aXQsIG5vbi1wcmVmZXRjaGFibGUpIFtzaXplPThNXQ0KPj4gwqDCoMKgwqDCoMKgwqAgRXhw
YW5zaW9uIFJPTSBhdCAwMDBjMDAwMCBbdmlydHVhbF0gW2Rpc2FibGVkXSBbc2l6ZT0xMjhL
XQ0KPj4gwqDCoMKgwqDCoMKgwqAgQ2FwYWJpbGl0aWVzOiBbZGNdIFBvd2VyIE1hbmFnZW1l
bnQgdmVyc2lvbiAxDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgRmxhZ3M6
IFBNRUNsay0gRFNJKyBEMS0gRDItIEF1eEN1cnJlbnQ9MG1BIA0KPj4gUE1FKEQwLSxEMS0s
RDItLEQzaG90LSxEM2NvbGQtKQ0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IFN0YXR1czogRDAgTm9Tb2Z0UnN0LSBQTUUtRW5hYmxlLSBEU2VsPTAgRFNjYWxlPTAgUE1F
LQ0KPj4gMDA6IDJiIDEwIDMyIDA1IDA3IDAwIDkwIDAyIDBhIDAwIDAwIDAzIDEwIDIwIDAw
IDAwDQo+PiAxMDogMDggMDAgODAgZWMgMDAgYzAgN2YgZWYgMDAgMDAgODAgZWUgMDAgMDAg
MDAgMDANCj4+IDIwOiAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAwMCAyOCAx
MCA0NCAwNA0KPj4gMzA6IDAwIDAwIDAwIDAwIGRjIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDA1
IDAxIDEwIDIwDQo+Pg0KPj4gR09PRCBEZWxsIFI3MTAgSU5URUwNCj4+IDBhOjAzLjAgVkdB
IGNvbXBhdGlibGUgY29udHJvbGxlcjogTWF0cm94IEVsZWN0cm9uaWNzIFN5c3RlbXMgTHRk
LiBNR0EgDQo+PiBHMjAwZVcNCj4+IMKgwqDCoMKgwqDCoMKgwqAgV1BDTTQ1MCAocmV2IDBh
KSAocHJvZy1pZiAwMCBbVkdBIGNvbnRyb2xsZXJdKQ0KPj4gwqDCoMKgwqDCoMKgwqAgRGV2
aWNlTmFtZTogRW1iZWRkZWQgVmlkZW8NCj4+IMKgwqDCoMKgwqDCoMKgIFN1YnN5c3RlbTog
RGVsbCBQb3dlckVkZ2UgUjcxMCBNR0EgRzIwMGVXIFdQQ000NTANCj4+IMKgwqDCoMKgwqDC
oMKgIENvbnRyb2w6IEkvTysgTWVtKyBCdXNNYXN0ZXIrIFNwZWNDeWNsZS0gTWVtV0lOVi0g
VkdBU25vb3AtIA0KPj4gUGFyRXJyLSBTdGVwcGluZy0gU0VSUi0gRmFzdEIyQi0gRGlzSU5U
eC0NCj4+IMKgwqDCoMKgwqDCoMKgIFN0YXR1czogQ2FwKyA2Nk1Iei0gVURGLSBGYXN0QjJC
KyBQYXJFcnItIERFVlNFTD1tZWRpdW0gDQo+PiA+VEFib3J0LSA8VEFib3J0LSA8TUFib3J0
LSA+U0VSUi0gPFBFUlItIElOVHgtDQo+PiDCoMKgwqDCoMKgwqDCoCBMYXRlbmN5OiAzMiAo
NDAwMG5zIG1pbiwgODAwMG5zIG1heCksIENhY2hlIExpbmUgU2l6ZTogNjQgYnl0ZXMNCj4+
IMKgwqDCoMKgwqDCoMKgIEludGVycnVwdDogcGluIEEgcm91dGVkIHRvIElSUSAxMA0KPj4g
wqDCoMKgwqDCoMKgwqAgUmVnaW9uIDA6IE1lbW9yeSBhdCBkNTAwMDAwMCAoMzItYml0LCBw
cmVmZXRjaGFibGUpIFtzaXplPThNXQ0KPj4gwqDCoMKgwqDCoMKgwqAgUmVnaW9uIDE6IE1l
bW9yeSBhdCBkZWZmYzAwMCAoMzItYml0LCBub24tcHJlZmV0Y2hhYmxlKSANCj4+IFtzaXpl
PTE2S10NCj4+IMKgwqDCoMKgwqDCoMKgIFJlZ2lvbiAyOiBNZW1vcnkgYXQgZGYwMDAwMDAg
KDMyLWJpdCwgbm9uLXByZWZldGNoYWJsZSkgW3NpemU9OE1dDQo+PiDCoMKgwqDCoMKgwqDC
oCBFeHBhbnNpb24gUk9NIGF0IDAwMGMwMDAwIFt2aXJ0dWFsXSBbZGlzYWJsZWRdIFtzaXpl
PTEyOEtdDQo+PiDCoMKgwqDCoMKgwqDCoCBDYXBhYmlsaXRpZXM6IFtkY10gUG93ZXIgTWFu
YWdlbWVudCB2ZXJzaW9uIDENCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBG
bGFnczogUE1FQ2xrLSBEU0krIEQxLSBEMi0gQXV4Q3VycmVudD0wbUEgDQo+PiBQTUUoRDAt
LEQxLSxEMi0sRDNob3QtLEQzY29sZC0pDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgU3RhdHVzOiBEMCBOb1NvZnRSc3QtIFBNRS1FbmFibGUtIERTZWw9MCBEU2NhbGU9
MCBQTUUtDQo+PiAwMDogMmIgMTAgMzIgMDUgMDcgMDAgOTAgMDIgMGEgMDAgMDAgMDMgMTAg
MjAgMDAgMDANCj4+IDEwOiAwOCAwMCAwMCBkNSAwMCBjMCBmZiBkZSAwMCAwMCAwMCBkZiAw
MCAwMCAwMCAwMA0KPj4gMjA6IDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAwIDAw
IDI4IDEwIDM1IDAyDQo+PiAzMDogMDAgMDAgMDAgMDAgZGMgMDAgMDAgMDAgMDAgMDAgMDAg
MDAgMGEgMDEgMTAgMjANCj4+DQo+PiBQaGlsDQo+IA0KDQotLSANClRob21hcyBaaW1tZXJt
YW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9u
cyBHZXJtYW55IEdtYkgNCkZyYW5rZW5zdHJhc3NlIDE0NiwgOTA0NjEgTnVlcm5iZXJnLCBH
ZXJtYW55DQpHRjogSXZvIFRvdGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFsZCwg
Qm91ZGllbiBNb2VybWFuDQpIUkIgMzY4MDkgKEFHIE51ZXJuYmVyZykNCg==

--------------1bY3kxGqfpDsjPvp6UkYhfGo--

--------------s3N6WJFVMFfGHUF9WZAxHM6Z
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmRI+coFAwAAAAAACgkQlh/E3EQov+Ae
mQ//RWtp/rWlq7TLt5nfV+76+9CECYcH37Gydo10MpBgHUc+WnCBkotgZvPAUJUYsmNTl4O3RnnU
DFPa8Ez3hse5S46YlycecGCwCXEpEJb7fPMNhCQGOaAEUm6RWLGGAS4VaaSi3eiRXPG578fZPcCd
6oADGEM+NwK6S8lzY6CS6sCfI2DV66Z+eyy2G5oSDh1a1ImfwDTMdlv18yKbMnZq9v8yWM8PxIw7
VCZAqrVW/jnOKEXG6astUuB5dhVX4/pLWp27yju+SNEGhebvrNYil4c8Ukz2po+Hfz8r4CL64jHq
6vRNVLa8t6AvvHPlBBvLqmnevV/ICvlM/bSAaNXlxyWDsWwARVuHAqzD1RDwv1e5SN3qIWarse9d
2xfBJVnP/ll2PbydBbkH1b9AaGsRCOEMRtmT5bwfelO5sJc8AvvRu7YNV06QCHvoiUmuNVZMVJ9p
Uky3sCqPJjb0i7wEs3/rBAckz9JmV0D+haRd5ngqMD+OWw0n/yWzuM+4Pslie04LDh9XAsDhAhdD
G5C3TSVlSAjUDORNRofTtHVhxHO7V2AZyXCZkws/AT6uyNZ3PfnDEpumfLpMSbrHZxMu0OZSaNjF
QPlzHzA7TzeWiVLlt2XuX6OrAKf/itppGbPmLoED+xpB5W8lJLmFDeCeA74CBELML17JwhMgQaG0
+IM=
=YzU0
-----END PGP SIGNATURE-----

--------------s3N6WJFVMFfGHUF9WZAxHM6Z--
