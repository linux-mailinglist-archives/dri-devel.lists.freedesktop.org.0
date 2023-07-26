Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB57E763AD3
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 17:21:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A895C10E489;
	Wed, 26 Jul 2023 15:21:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEEBD10E49D
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 15:21:29 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 95BA01F37F;
 Wed, 26 Jul 2023 15:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1690384888; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FdnPzGn9B0f/Cx9AbSZHxZ7ksBISDtJ506YihtTcJ4g=;
 b=Rv3wLLA06fA/tmzNjgJ9XaIwMa9KOuHjdBJA2VHiqQ/QlGRWpNdaouDfAPCmEa/xlwOkSN
 OVubpmoVofiwIJs1Fn519elnvylzhbOtV+HDDKUujQfnqWrTx+2NeD8UxwgxLwSHKGOUul
 71uqXFTkVh3FrYclIJJ2XUFFT6eKR5g=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1690384888;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FdnPzGn9B0f/Cx9AbSZHxZ7ksBISDtJ506YihtTcJ4g=;
 b=2pYLY4AHjzxQxkqD6u+7yUj0KgFh8EXFMZauYCfi6PcmJSpqq9aJFrKnRlGMVt1ge/CaGd
 ugNbKWpOfWkCZeAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 731E2139BD;
 Wed, 26 Jul 2023 15:21:28 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id hd8BG/g5wWQLJgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 26 Jul 2023 15:21:28 +0000
Message-ID: <890b699b-c351-7417-13d7-22f963975dbe@suse.de>
Date: Wed, 26 Jul 2023 17:21:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm/mgag200: Increase bandwidth for G200se A rev1
To: Roger Sewell <roger.sewell@cantab.net>,
 Jocelyn Falempe <jfalempe@redhat.com>
References: <20230717133037.25941-1-jfalempe@redhat.com>
 <69a9ee2e-bd03-2a63-6651-0680475d7025@suse.de>
 <4f5d262c-527f-0fa6-45e3-a75aa22fcf0d@suse.de>
 <20230724215746.10928@revelation.broadband>
 <ca6cd674-d268-6210-c66d-4750e28a5c77@suse.de>
 <20230725223127.4184@revelation.broadband>
 <4e470182-d8da-b727-d163-d9c45bd0dc47@redhat.com>
 <20230726111114.5287@revelation.broadband>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230726111114.5287@revelation.broadband>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------uz6spaPIAlYY5Bp00bIz1BG4"
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
Cc: airlied@redhat.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------uz6spaPIAlYY5Bp00bIz1BG4
Content-Type: multipart/mixed; boundary="------------0MLoKfRwjrCBE5YvuNxM6Dq6";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Roger Sewell <roger.sewell@cantab.net>,
 Jocelyn Falempe <jfalempe@redhat.com>
Cc: airlied@redhat.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org
Message-ID: <890b699b-c351-7417-13d7-22f963975dbe@suse.de>
Subject: Re: [PATCH] drm/mgag200: Increase bandwidth for G200se A rev1
References: <20230717133037.25941-1-jfalempe@redhat.com>
 <69a9ee2e-bd03-2a63-6651-0680475d7025@suse.de>
 <4f5d262c-527f-0fa6-45e3-a75aa22fcf0d@suse.de>
 <20230724215746.10928@revelation.broadband>
 <ca6cd674-d268-6210-c66d-4750e28a5c77@suse.de>
 <20230725223127.4184@revelation.broadband>
 <4e470182-d8da-b727-d163-d9c45bd0dc47@redhat.com>
 <20230726111114.5287@revelation.broadband>
In-Reply-To: <20230726111114.5287@revelation.broadband>

--------------0MLoKfRwjrCBE5YvuNxM6Dq6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjYuMDcuMjMgdW0gMTI6MTEgc2NocmllYiBSb2dlciBTZXdlbGw6DQo+IEpv
Y2VseW4sDQo+IA0KPj4+IEhvdyBjYW4gSSBjaGVjayBmb3Igc3VyZSB3aGV0aGVyIEkgYW0g
dXNpbmcgMjQgb3IgMzIgYml0cyBwZXIgcGl4ZWwNCj4+PiA/DQo+Pg0KPj4gVGhlIGVhc2ll
c3Qgc29sdXRpb24gaWYgeW91IGFscmVhZHkgcmVidWlsdCB5b3VyIGtlcm5lbCBpcyB0byBw
cmludA0KPj4gdGhlIHZhcmlhYmxlIGJwcCBoZXJlOg0KPj4NCj4+IGh0dHBzOi8vZWxpeGly
LmJvb3RsaW4uY29tL2xpbnV4L2xhdGVzdC9zb3VyY2UvZHJpdmVycy9ncHUvZHJtL21nYWcy
MDAvbWdhZzIwMF9tb2RlLmMjTDMyNg0KPj4NCj4+IHByX2luZm8oIm1nYWcyMDAgYnBwICVk
XG4iLCBicHApOw0KPiANCj4gRGlkIHRoYXQsIGFuZCBJIGdldCAibWdhZzIwMCBicHAgMzIi
Lg0KPiANCj4+IEFsc28gaWYgeW91IGNhbiBydW4gV2F5bGFuZCBhdCAxNDQweDkwMEA2MCwg
dGhhdCB3b3VsZCBtZWFuIHRoZQ0KPj4gaGFyZHdhcmUgaXMgaW5kZWVkIGFibGUgdG8gaGFu
ZGxlIGl0IGluIDMyYml0Lg0KPiANCj4gSSBjYW4gaW5kZWVkIHJ1biBXYXlsYW5kIGF0IDE0
NDB4OTAwQDYwLg0KPiANCj4gU28gSSB0aGluayBJJ20gcmlnaHQgaW4gc2F5aW5nIHRoYXQg
bXkgZ3JhcGhpY3MgY2hpcCBjYW4gaGFuZGxlDQo+IDE0NDB4OTAwQDYwIHdpdGggMzIgYml0
cyBwZXIgcGl4ZWwuDQoNCk9mIGNvdXJzZS4gWW91IG1vZGlmaWVkIHRoYXQgbGltaXQsIHNv
IHRoZSBwaXhlbCByYXRlIHJlbWFpbnMgYmVsb3cuDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFz
DQoNCj4gDQo+IEhvd2V2ZXIsIHdoaWxlIHNlYXJjaGluZyAvdmFyL2xvZy9tZXNzYWdlcyBm
b3IgdGhlIGJwcCBvdXRwdXQgYWJvdmUsIEkNCj4gYWxzbyBmb3VuZCB0aGVzZSB0d28gbGlu
ZXM6DQo+IA0KPiAvdXNyL2xpYmV4ZWMvZ2RtLXgtc2Vzc2lvblsyMzY2XTogKD09KSBtb2Rl
c2V0KDApOiBEZXB0aCAyNCwgKD09KSBmcmFtZWJ1ZmZlciBicHAgMzINCj4gL3Vzci9saWJl
eGVjL2dkbS14LXNlc3Npb25bMjM2Nl06ICg9PSkgbW9kZXNldCgwKTogUkdCIHdlaWdodCA4
ODgNCj4gDQo+IGluIGNhc2UgaXQgbWFrZXMgYSBkaWZmZXJlbmNlLg0KPiANCj4gVGhhbmtz
LA0KPiBSb2dlci4NCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVy
IERldmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFu
a2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3Rl
diwgQW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJC
IDM2ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------0MLoKfRwjrCBE5YvuNxM6Dq6--

--------------uz6spaPIAlYY5Bp00bIz1BG4
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmTBOfcFAwAAAAAACgkQlh/E3EQov+Bj
Dw/+JgbovxIQxQJ7wOiFxn3BEdAqJ71tXtACkrh8b60n6pPYBWmqUse/3LUKW0LjEf1IeAVZHnBz
sDGYSJzr1X1U6gsvaWHUjzcldg4KgCZcsLK44ycNiHxbeN/HtHezBGZdcI+TnCq7Wc0C6ayDp87U
jUvU4uwTGEF/aVWkOJOs8PzakOnU12T3sSWupTzWJGNKQb0vpwuIsQoZpydVbDcwAo85nmB4fwEE
UOc1EeRwhw8dn+7Z6G8Gbx0o9W1BzsraPTJkoP3NX0mfT26zwKdYniXWdQdFwI5ncSf8UKzG6QlF
pl62PsG+mt5l3Y1FJueBAj369FF88M0r3a4IlZmh1YjEwYORGSXqPfW3f3zuiLQ3EnPbOzwWIPOJ
fOm+Ph19dK3r/eedGRTAg+t7gWvt22FlaQZomQzaZN62oLIT3rennSHw1jm/3lFYzLm61CXR+m45
bXAndkeWZrH24pFntfS9lfB00wMOTSVUkYKr4BxXn458xEhuYIvNoc+WMF7zp2WMfzqn8NtQUBaG
M63Wk05Ux0R6MvugAU8/WZt+1Lrl/Adk6vLY3fJt46HdVHq9RXz1dDsBU9LW1N6+eQo7lwyryWqW
YFxIehY8olxwV3za8tKSz0SQf8uYgFWia8hFralZ47Fdvbv7Evg9tB0FMZ/uS8Zy8p0N63h47QDN
SvM=
=NTtv
-----END PGP SIGNATURE-----

--------------uz6spaPIAlYY5Bp00bIz1BG4--
