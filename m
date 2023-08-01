Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F8676AB8E
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 10:59:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D8F410E367;
	Tue,  1 Aug 2023 08:59:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA1E410E367
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 08:59:35 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8176A21DE3;
 Tue,  1 Aug 2023 08:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1690880374; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+n5FyM61czAC0cNQApOWBqsHom9yWlZFCtaioWuc11U=;
 b=X5/FMNpEswYuv0+kpUq7bmzjeGEeX7kgW/bMVqSU3Nj5IjMMsbE+i7IULO/cOCSBEZEq7Y
 Z4HlN5GaTPHjGH4r9WNggLn9O7LXX8IlKKj+26KZKkJ0z1Yh/zs8VNQlLDJHEtKe3ZfcZ7
 ZOosELtHMb2vJ8tTi4pbPtEydkdoniE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1690880374;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+n5FyM61czAC0cNQApOWBqsHom9yWlZFCtaioWuc11U=;
 b=SRO93G9RQUBzlaw2K3PuM0JnsVC8tNz0058QbCUqow/EXsZLz9HRvg7LNcm0jEqilewQeu
 Z7AibYscOsue7zDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4616413919;
 Tue,  1 Aug 2023 08:59:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id M2fxD3bJyGTFNAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 01 Aug 2023 08:59:34 +0000
Message-ID: <262a0b9d-5d9b-11cf-535d-5b00376ae223@suse.de>
Date: Tue, 1 Aug 2023 10:59:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH 00/47] fbdev: Use I/O helpers
To: Sam Ravnborg <sam@ravnborg.org>
References: <20230728182234.10680-1-tzimmermann@suse.de>
 <20230728183906.GB1144760@ravnborg.org>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <20230728183906.GB1144760@ravnborg.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------BzkB9EkYd4VfUqQscAQPwSQh"
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
Cc: linux-fbdev@vger.kernel.org, kvm@vger.kernel.org, deller@gmx.de,
 javierm@redhat.com, dri-devel@lists.freedesktop.org,
 linux-geode@lists.infradead.org, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------BzkB9EkYd4VfUqQscAQPwSQh
Content-Type: multipart/mixed; boundary="------------aTidrU0u0f9EzPXN2GV9xjyr";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: deller@gmx.de, javierm@redhat.com, linux-media@vger.kernel.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-geode@lists.infradead.org,
 linux-omap@vger.kernel.org, kvm@vger.kernel.org
Message-ID: <262a0b9d-5d9b-11cf-535d-5b00376ae223@suse.de>
Subject: Re: [PATCH 00/47] fbdev: Use I/O helpers
References: <20230728182234.10680-1-tzimmermann@suse.de>
 <20230728183906.GB1144760@ravnborg.org>
In-Reply-To: <20230728183906.GB1144760@ravnborg.org>

--------------aTidrU0u0f9EzPXN2GV9xjyr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkgU2FtDQoNCkFtIDI4LjA3LjIzIHVtIDIwOjM5IHNjaHJpZWIgU2FtIFJhdm5ib3JnOg0K
PiBIaSBUaG9tYXMsDQo+IA0KPiBPbiBGcmksIEp1bCAyOCwgMjAyMyBhdCAwNjozOTo0M1BN
ICswMjAwLCBUaG9tYXMgWmltbWVybWFubiB3cm90ZToNCj4+IE1vc3QgZmJkZXYgZHJpdmVy
cyBvcGVyYXRlIG9uIEkvTyBtZW1vcnkuIEFuZCBtb3N0IG9mIHRob3NlIHVzZSB0aGUNCj4+
IGRlZmF1bHQgaW1wbGVtZW50YXRpb25zIGZvciBmaWxlIEkvTyBhbmQgY29uc29sZSBkcmF3
aW5nLiBDb252ZXJ0IGFsbA0KPj4gdGhlc2UgbG93LWhhbmdpbmcgZnJ1aXRzIHRvIHRoZSBm
Yl9vcHMgaW5pdGlhbGl6ZXIgbWFjcm8gYW5kIEtjb25maWcNCj4+IHRva2VuIGZvciBmYmRl
diBJL08gaGVscGVycy4NCj4+DQo+PiBUaGUgZmJkZXYgSS9PIGhlbHBlcnMgYXJlIGVhc2ls
eSBncmVwLWFibGUuIEluIGEgbGF0ZXIgcGF0Y2gsIHRoZXkgY2FuDQo+PiBiZSBsZWZ0IHRv
IGVtcHR5IHZhbHVlcyBpZiB0aGUgcnNwLiBmdW50aW9uYWxpdHksIHN1Y2ggYXMgZmlsZSBJ
L08gb3INCj4+IGNvbnNvbGUsIGhhcyBiZWVuIGRpc2FibGVkLg0KPiANCj4gRGlkIHlvdSBt
aXNzIHNtNzUwIG9yIHdhcyBpdCBsZWZ0IG91dCBvbiBwdXJwb3NlPw0KPiBBcyBpdCBoaWRl
IGluIHN0YWdpbmcgaXQgaXMgZWFzeSB0byBtaXNzLg0KDQpOb3cgSSByZW1lbWJlcmVkIHdo
eSBJIGxlZnQgb3V0IHNtNzUwZmIuIEl0IG1vZGlmaWVzIHRoZSBmdW5jdGlvbiANCnBvaW50
ZXJzIGF0IHNvbWUgcG9pbnQgYXQNCg0KaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGlu
dXgvbGF0ZXN0L3NvdXJjZS9kcml2ZXJzL3N0YWdpbmcvc203NTBmYi9zbTc1MC5jI0w3NDEN
Cg0KU28gdGhlIGRyaXZlciB1c2VzIGEgbm9uLXRyaXZpYWwgZmJfb3BzIHNldHVwIGFuZCBp
cyB3b3J0aCBhIGRpZmZlcmVudCBmaXguDQoNCkJlc3QgcmVnYXJkcw0KVGhvbWFzDQoNCj4g
DQo+IAlTYW0NCg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERl
dmVsb3Blcg0KU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vu
c3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3Rldiwg
QW5kcmV3IE15ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2
ODA5IChBRyBOdWVybmJlcmcpDQo=

--------------aTidrU0u0f9EzPXN2GV9xjyr--

--------------BzkB9EkYd4VfUqQscAQPwSQh
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmTIyXUFAwAAAAAACgkQlh/E3EQov+Bn
HQ/+ODtOPqObgHXWg2w+jOR71p47BMldUjo6XgKZkB828Vd59NnkIn6AHgfNkXjbARd3snAP0jSQ
wG5X1dHQeWH5lAJjmbWhXtmdS0h3bfKOIJvc9b+v4KpUmjqqg9t56Q9rQTBjRT3/9IvyO5wQsbiz
r7Nipp5Zmr+Q1xQtA5qEx2qPI1qpAC3koizWr6y9kVaUkgZFgHPHbkgjuI7EB64BXiOo33n70Cn/
m0gMmn9LHzwOi4qN20gtQkVAbPR5G4GXjaRYS9Rgm1zKb9gPP67oVCXvEUiTRkDOH0hW3cr18g/C
6wsi+8o+WpxpS5mGcfAL7JV8k+T95WCQKFyNuq1lZ1K9wekGwhvPYJOBsu/HfMtuQiiuH9nM132t
pn+dKRllAg2oWSEG4SgtwWudNqrY/IR20IjiATLz14Fr4LXkjuBMigwDLHhuHGvImYTP2/BYhm6G
LEhnqwo7nuPHJTqBfLWrC3hPdqYse65Nx4HqelsqTImGOG1tFosGRGhAgCYgt8lEYgXfvd2cHP1y
+3cwpix3VXZbgY2IvCDTWaDuLMCJrJGQ4cgAGWfa5qOocVEqvxV8af6QrvcevpO1/oNfdjZMICXL
S+BvnmOP1pjT8SBa4ghbmWeFmmruFRvU3PiFR+oW/hGfjIzqnQivj+6nD7AFnNoRpBpKemh2VSIz
2Kg=
=8Dsu
-----END PGP SIGNATURE-----

--------------BzkB9EkYd4VfUqQscAQPwSQh--
