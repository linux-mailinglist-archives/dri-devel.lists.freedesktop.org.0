Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 873D142066E
	for <lists+dri-devel@lfdr.de>; Mon,  4 Oct 2021 09:08:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 604FB89CF8;
	Mon,  4 Oct 2021 07:08:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB23289CF8
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Oct 2021 07:07:59 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 404D01FFC3;
 Mon,  4 Oct 2021 07:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1633331278; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=P7ccqQOFs0LjZy3F5wGLg1Zml4wdhQrmF5FOF2AP4xU=;
 b=XhOGE+MsCYY2xdcx8Mtyr/u6Z+OzxWFlAsdAHRwFX/QizwlcKAsHQwFv+3kVUrWG+YH8wc
 NAKtcdgEX0J9H4umqsxkMlqUKO7KgeUYl1RoGX8coXin+LlAh+opAjRT46ueWTk20Si8l2
 C9N6t3kCaFOz48al28zI4icHpxjMzq0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1633331278;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=P7ccqQOFs0LjZy3F5wGLg1Zml4wdhQrmF5FOF2AP4xU=;
 b=Q/i6K1EpHyd5hSHu3R2iD6OsApa3qoQfPneeaSLCByM2Mo5OuGvLx8/CMYMnBZd21v5pqQ
 1O/386CAsgmlNlCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 198C713B72;
 Mon,  4 Oct 2021 07:07:58 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Vg1ABE6oWmFXcQAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 04 Oct 2021 07:07:58 +0000
Message-ID: <eeaf6170-0aca-4466-c79c-b422cdf29179@suse.de>
Date: Mon, 4 Oct 2021 09:07:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: 572994bf18ff prevents system boot
Content-Language: en-US
To: Chuck Lever III <chuck.lever@oracle.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ainux Wang <ainux.wang@gmail.com>
References: <A194B6CE-AF77-422D-A92F-292ABD83BCCE@oracle.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <A194B6CE-AF77-422D-A92F-292ABD83BCCE@oracle.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------pkyDyYh678Uqzr03z5NXwRCs"
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
--------------pkyDyYh678Uqzr03z5NXwRCs
Content-Type: multipart/mixed; boundary="------------k6r2eveYWzBFiretA8lIqR0q";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Chuck Lever III <chuck.lever@oracle.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Ainux Wang <ainux.wang@gmail.com>
Message-ID: <eeaf6170-0aca-4466-c79c-b422cdf29179@suse.de>
Subject: Re: 572994bf18ff prevents system boot
References: <A194B6CE-AF77-422D-A92F-292ABD83BCCE@oracle.com>
In-Reply-To: <A194B6CE-AF77-422D-A92F-292ABD83BCCE@oracle.com>

--------------k6r2eveYWzBFiretA8lIqR0q
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

KGNjOiBhaW51eC53YW5nQGdtYWlsLmNvbSkNCg0KSGkNCg0KQW0gMDMuMTAuMjEgdW0gMjA6
MDkgc2NocmllYiBDaHVjayBMZXZlciBJSUk6DQo+IEhpLQ0KPiANCj4gQWZ0ZXIgdXBkYXRp
bmcgb25lIG9mIG15IHRlc3Qgc3lzdGVtcyB0byB2NS4xNS1yYywgSSBmb3VuZCB0aGF0IGl0
DQo+IGJlY29tZXMgdW5yZXNwb25zaXZlIGR1cmluZyB0aGUgbGF0ZXIgcGFydCBvZiB0aGUg
Ym9vdCBwcm9jZXNzLiBBDQo+IHBvd2VyLW9uIHJlc2V0IGlzIG5lY2Vzc2FyeSB0byByZWNv
dmVyLg0KPiANCj4gSSBiaXNlY3RlZCB0byB0aGlzIGNvbW1pdDoNCj4gDQo+IDU3Mjk5NGJm
MThmZiAoImRybS9hc3Q6IFplcm8gaXMgbWlzc2luZyBpbiBkZXRlY3QgZnVuY3Rpb24iKQ0K
DQpZb3UgZG9uJ3QgaGF2ZSBhIG1vbml0b3IgY29ubmVjdGVkLCBJIGd1ZXNzPyBJbiB0aGF0
IGNhc2UsIHdlIG5vdyANCnRyaWdnZXIgdGhlIGhlbHBlcnMgdGhhdCBwb2xsIGZvciBjb25u
ZWN0ZWQgbW9uaXRvcnMuIEhvd2V2ZXIsIHRoZSANCm92ZXJoZWFkIHNlZW1zIHJhdGhlciBl
eHRyZW1lLg0KDQpJJ2xsIGhhdmUgdG8gdHJ5IHRvIHJlcHJvZHVjZSB0aGlzLCBvciBvdGhl
cndpc2Ugd2UgY2FuIHJldmVydCB0aGUgY29tbWl0Lg0KDQpCZXN0IHJlZ2FyZHMNClRob21h
cw0KDQo+IA0KPiBDaGVja2luZyBvdXQgdjUuMTUtcmMzIGFuZCByZXZlcnRpbmcgdGhpcyBj
b21taXQgZW5hYmxlcyB0aGUgc3lzdGVtDQo+IHRvIGJvb3QgYWdhaW4uDQo+IA0KPiAwYjow
MC4wIFZHQSBjb21wYXRpYmxlIGNvbnRyb2xsZXI6IEFTUEVFRCBUZWNobm9sb2d5LCBJbmMu
IEFTUEVFRCBHcmFwaGljcyBGYW1pbHkgKHJldiAzMCkgKHByb2ctaWYgMDAgW1ZHQSBjb250
cm9sbGVyXSkNCj4gICAgICAgICAgRGV2aWNlTmFtZTogIEFTUEVFRCBWaWRlbyBBU1QyNDAw
DQo+ICAgICAgICAgIFN1YnN5c3RlbTogU3VwZXIgTWljcm8gQ29tcHV0ZXIgSW5jIFgxMFNS
TC1GDQo+ICAgICAgICAgIENvbnRyb2w6IEkvTysgTWVtKyBCdXNNYXN0ZXItIFNwZWNDeWNs
ZS0gTWVtV0lOVi0gVkdBU25vb3AtIFBhckVyci0gU3RlcHBpbmctIFNFUlItIEZhc3RCMkIt
IERpc0lOVHgtDQo+ICAgICAgICAgIFN0YXR1czogQ2FwKyA2Nk1Iei0gVURGLSBGYXN0QjJC
LSBQYXJFcnItIERFVlNFTD1tZWRpdW0gPlRBYm9ydC0gPFRBYm9ydC0gPE1BYm9ydC0gPlNF
UlItIDxQRVJSLSBJTlR4LQ0KPiAgICAgICAgICBJbnRlcnJ1cHQ6IHBpbiBBIHJvdXRlZCB0
byBJUlEgMTgNCj4gICAgICAgICAgUmVnaW9uIDA6IE1lbW9yeSBhdCBmYTAwMDAwMCAoMzIt
Yml0LCBub24tcHJlZmV0Y2hhYmxlKSBbc2l6ZT0xNk1dDQo+ICAgICAgICAgIFJlZ2lvbiAx
OiBNZW1vcnkgYXQgZmIwMDAwMDAgKDMyLWJpdCwgbm9uLXByZWZldGNoYWJsZSkgW3NpemU9
MTI4S10NCj4gICAgICAgICAgUmVnaW9uIDI6IEkvTyBwb3J0cyBhdCBjMDAwIFtzaXplPTEy
OF0NCj4gICAgICAgICAgRXhwYW5zaW9uIFJPTSBhdCAwMDBjMDAwMCBbdmlydHVhbF0gW2Rp
c2FibGVkXSBbc2l6ZT0xMjhLXQ0KPiAgICAgICAgICBDYXBhYmlsaXRpZXM6IFs0MF0gUG93
ZXIgTWFuYWdlbWVudCB2ZXJzaW9uIDMNCj4gICAgICAgICAgICAgICAgICBGbGFnczogUE1F
Q2xrLSBEU0ktIEQxKyBEMisgQXV4Q3VycmVudD0zNzVtQSBQTUUoRDArLEQxKyxEMissRDNo
b3QrLEQzY29sZCspDQo+ICAgICAgICAgICAgICAgICAgU3RhdHVzOiBEMCBOb1NvZnRSc3Qt
IFBNRS1FbmFibGUtIERTZWw9MCBEU2NhbGU9MCBQTUUtDQo+ICAgICAgICAgIENhcGFiaWxp
dGllczogWzUwXSBNU0k6IEVuYWJsZS0gQ291bnQ9MS80IE1hc2thYmxlLSA2NGJpdCsNCj4g
ICAgICAgICAgICAgICAgICBBZGRyZXNzOiAwMDAwMDAwMDAwMDAwMDAwICBEYXRhOiAwMDAw
DQo+ICAgICAgICAgIEtlcm5lbCBkcml2ZXIgaW4gdXNlOiBhc3QNCj4gICAgICAgICAgS2Vy
bmVsIG1vZHVsZXM6IGFzdA0KPiANCj4gLS0NCj4gQ2h1Y2sgTGV2ZXINCj4gDQo+IA0KPiAN
Cg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0K
U1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpNYXhmZWxkc3RyLiA1LCA5
MDQwOSBOw7xybmJlcmcsIEdlcm1hbnkNCihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCkdl
c2Now6RmdHNmw7xocmVyOiBGZWxpeCBJbWVuZMO2cmZmZXINCg==

--------------k6r2eveYWzBFiretA8lIqR0q--

--------------pkyDyYh678Uqzr03z5NXwRCs
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmFaqEwFAwAAAAAACgkQlh/E3EQov+D2
7xAApmbao3QPxrePUsG2S4m9Gza55TXzD2moCKAd/8k6XQgMw5tDdu9Lmwl33NhRTB8RhaVqAST9
PEsoQrZAaSQ+ivBpsM/a+SVyivaflL/nxsXZYYefKxxirKooSM0weWBqtGcUCXhbVAlYadH7LNSH
9JrUMFiMuGLLc835tANhvrMcXoUZQ2k+JYFdH3zLBkaCfo7IMKo/bkbXprz48sdRO+27bAixZfKg
+6VXxVSJ2mPcGIDpZQz3CkX2P0ZLjUlUc2FfrOop3KyKgBkWLZKtQa6EbYAFPC4jxEAGgcmGkssQ
7kLfBI+r4Xh8yRjZui8NdvDM9pCnZRSviXX33lmwV2jLMeaEahIuFRkb6hnt43QZc49L8oTICxcr
iUZeyruMZ07GLEi9T0T1d+prHOs6TtWYgXMSJBgIsj3tvY0PYH9SLeWcDkNAvgMM6LJmHFA+92tb
wTpGwdHKWy64zXUaIbJ4idY2RoasMFAxUE1J3FJ/xqPs48acp/+Fk+DygXahhWa0IZGLS/Zc7sp+
2mQh1i43Uw3oOHU+gbrUR3ylJJoEDTgWwqSE2XHPzJou52HEj8Uo8LOSGiaRNRyaxn1LtbWO+k4v
uBD8r21ZMIGgf4xDf+zhMRF7i/uCYZOVBiu1ptitxCcgRcJKlF8mYDE46VcKqnmkxuBHMjaY51ft
jgE=
=p3en
-----END PGP SIGNATURE-----

--------------pkyDyYh678Uqzr03z5NXwRCs--
