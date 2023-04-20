Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7BE6E9529
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 14:59:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38F0B10E2BD;
	Thu, 20 Apr 2023 12:59:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E471110E2BD
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Apr 2023 12:59:19 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DF9AE1FDBA;
 Thu, 20 Apr 2023 12:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1681995557; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DEGj41opAhdIvCdRlBTEBs0zP1XeW2Gj6H6gpuRHYkQ=;
 b=CUQS5+t4cUdS9r1q78kbhfp62M3cC6a92x1sc0dj8t2vCxFqW0F/aoeOuoFR8K1b3lq2Zm
 eCddnf9oOHZBFbcnx9dFFnY9P8BJcajXwKfLPenGqz/MZ56VoYmyFBga2wf9AcxqKgt5DV
 RiEKY+ECeZrWkXdOwnRDOa+gYG3DIhM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1681995557;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DEGj41opAhdIvCdRlBTEBs0zP1XeW2Gj6H6gpuRHYkQ=;
 b=yh4XmG2hOajy19+PImwlZtnncgRRn6sVqmmXrSJESFIV/WMAroxaoLmLu/N+7VIjng/kCV
 mymYxv3zsWidk2Cg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id ADE8C1333C;
 Thu, 20 Apr 2023 12:59:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 175kKSU3QWSGDAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 20 Apr 2023 12:59:17 +0000
Message-ID: <3d455074-bd51-51a0-7692-a0b4ca961355@suse.de>
Date: Thu, 20 Apr 2023 14:59:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v5] drm/fbdev-generic: prohibit potential out-of-bounds
 access
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20230420030500.1578756-1-suijingfeng@loongson.cn>
 <8ec3734b-4bc2-ad8f-fc17-3002f22d1fc9@suse.de>
 <12c8efaa-7266-5436-dc53-009a0d23b53f@suse.de>
 <4a0fdbe0-cd4f-9c87-f73a-6d27f5c497bb@189.cn>
 <f541018f-bb7f-ac58-bbb8-797069e49c3f@suse.de>
 <CAMuHMdVGtvgcQuTR9bfMh1cM86TYXSByxJzW5eJtF9A0ZLRF3w@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAMuHMdVGtvgcQuTR9bfMh1cM86TYXSByxJzW5eJtF9A0ZLRF3w@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------5DhebwLARl0HpDFRqz9Vb7lQ"
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
Cc: linux-fbdev@vger.kernel.org, Li Yi <liyi@loongson.cn>,
 Helge Deller <deller@gmx.de>, Lucas De Marchi <lucas.demarchi@intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sui Jingfeng <15330273260@189.cn>, loongson-kernel@lists.loongnix.cn
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------5DhebwLARl0HpDFRqz9Vb7lQ
Content-Type: multipart/mixed; boundary="------------yi8Lvwk9kZfir66Sw5gmggKi";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, linux-fbdev@vger.kernel.org,
 Li Yi <liyi@loongson.cn>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, Sui Jingfeng <15330273260@189.cn>,
 loongson-kernel@lists.loongnix.cn, dri-devel@lists.freedesktop.org
Message-ID: <3d455074-bd51-51a0-7692-a0b4ca961355@suse.de>
Subject: Re: [PATCH v5] drm/fbdev-generic: prohibit potential out-of-bounds
 access
References: <20230420030500.1578756-1-suijingfeng@loongson.cn>
 <8ec3734b-4bc2-ad8f-fc17-3002f22d1fc9@suse.de>
 <12c8efaa-7266-5436-dc53-009a0d23b53f@suse.de>
 <4a0fdbe0-cd4f-9c87-f73a-6d27f5c497bb@189.cn>
 <f541018f-bb7f-ac58-bbb8-797069e49c3f@suse.de>
 <CAMuHMdVGtvgcQuTR9bfMh1cM86TYXSByxJzW5eJtF9A0ZLRF3w@mail.gmail.com>
In-Reply-To: <CAMuHMdVGtvgcQuTR9bfMh1cM86TYXSByxJzW5eJtF9A0ZLRF3w@mail.gmail.com>

--------------yi8Lvwk9kZfir66Sw5gmggKi
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMjAuMDQuMjMgdW0gMTQ6MjUgc2NocmllYiBHZWVydCBVeXR0ZXJob2V2ZW46
DQo+IEhpIFRob21hcywNCj4gDQo+IE9uIFRodSwgQXByIDIwLCAyMDIzIGF0IDE6MTDigK9Q
TSBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4gd3JvdGU6DQo+PiBB
bSAyMC4wNC4yMyB1bSAxMjowNCBzY2hyaWViIFN1aSBKaW5nZmVuZzoNCj4+PiBXaGF0IHdp
bGwgaGFwcGVuIGlmIHRoZSAnc2NyZWVuX3NpemUnIGlzIG5vdCBwYWdlX3NpemUgYWxpZ25l
ZCBhbmQgbW1hcA0KPj4+IHdpbGwgbWFwcGluZyBpbiB0aGUgZ3JhbnVsYXJpdHkgb2YgcGFn
ZXMgPw0KPj4NCj4+IFlvdSBuZWVkIHRvIG1hcCBhdCBwYWdlIGdyYW51bGFyaXR5LiBJZiBz
Y3JlZW5fc2l6ZSBpcyBub3QgcGFnZS1zaXplDQo+PiBhbGlnbmVkLCB0aGVyZSdzIHRoaXMg
dHJhaWxpbmcgYnVmZmVyIHRoYXQgaXMgYWNjZXNzaWJsZSwgYnV0IGNhbm5vdCBiZQ0KPj4g
ZGlzcGxheWVkLiBCdXQgdXNlcnNwYWNlIGhhcyBubyBkaXJlY3Qgd2F5IG9mIGtub3dpbmcg
dGhhdCwgc28gbGV0J3MNCj4+IGlnbm9yZSB0aGF0IHByb2JsZW0gZm9yIG5vdy4NCj4gDQo+
IFVzZXJzcGFjZSBjYW4ga25vdywgaWYgZmJfZml4X3NjcmVlbmluZm8uc21lbV97c3RhcnQs
bGVufSBtYXRjaA0KPiB0aGUgYWN0dWFsIG9mZnNldCBhbmQgc2l6ZS4NCg0KQ2FuIHlvdSBl
bGFib3JhdGU/IEhvdyBjYW4gdXNlcnNwYWNlIGRldGVjdC9jb21wdXRlIHRoZSBhY3R1YWxs
eSB1c2FibGUgDQpzcGFjZT8NCg0KIEZyb20gZ3JlcCdpbmcgZmJkZXYgZHJpdmVycywgc21l
bV9sZW4gYXBwZWFycyB0byBiZSBhIG11bHRpcGxlIG9mIHRoZSANCnBhZ2VzaXplLiAoPykg
c2NyZWVuX3NpemUgaXMgbm90IGV4cG9ydGVkIGFuZCBsaW5lX2xlbmd0aCBpbiB0aGUgZml4
ZWQgDQpwb3J0aW9uLiBPciBjYW4gbGluZV9sZW5ndGggY2hhbmdlIGJldHdlZW4gbW9kZXM/
IEluIHRoYXQgY2FzZSBpdCBzaG91bGQgDQpiZSAoeXJlc192aXJ0dWFsICogbGluZV9sZW5n
dGgpLCByaWdodD8NCg0KQmVzdCByZWdhcmRzDQpUaG9tYXMNCg0KDQo+IA0KPiBHcntvZXRq
ZSxlZXRpbmd9cywNCj4gDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydA0KPiAN
Cg0KLS0gDQpUaG9tYXMgWmltbWVybWFubg0KR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0K
U1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJIDQpGcmFua2Vuc3RyYXNzZSAx
NDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KR0Y6IEl2byBUb3RldiwgQW5kcmV3IE15
ZXJzLCBBbmRyZXcgTWNEb25hbGQsIEJvdWRpZW4gTW9lcm1hbg0KSFJCIDM2ODA5IChBRyBO
dWVybmJlcmcpDQo=

--------------yi8Lvwk9kZfir66Sw5gmggKi--

--------------5DhebwLARl0HpDFRqz9Vb7lQ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmRBNyUFAwAAAAAACgkQlh/E3EQov+CR
ShAAziz4j1u3V33PmhNJDF/Bzb9R1EABKp7Vweon2oLdgChJHqBvit4LBX+92CeLFtqY53hYmZSw
xjW2gYP7zjlt7xrm/0qAreEC1aKRfDb0L2i2MIZMS6YerUCJJlkRCCp+7WwvskcY3M8Qm5SjG1ca
re2G1JJKAa9U6NiYzwO43OYUT28yv1cEvX4xTJg5FbeHczs+GDpCd5HI8SSFDTlE4frEFFcDkOlf
dEfs+C11fppW68/DMDLg/Sgsi//2EED1lxF/vNpYKzw0XMCHZQsGUMXTcwnq2fZBMaIE9nm4U4Oq
z6JUeZX6HdgoMwJR2hM656f4VVMZC62NU+54OWgNGbBIDS6ooKXnazBqin6uqowUzIc+vZ0MCb4q
GwEZma3FypiKj0ZLUxQSu/v59B7KhjyFRZd8I2eJ00D1/UmrNe1VA9G/VLFyl0GWiAPvGxpkI5lJ
PQrUHPAD6YCieSlIUk3AsrAGd+dWZ3YmBkuPGqTaaWFJUplI/YE5OkaHmFLJTOQo+jXQUoXnHG2k
KZg4yTRb7MEslOfr6V2zNbOjilmLUjRWSlqg3guJu9V8ntF1eR89IX9skn+neQLG7eOWXdTHYA5Y
Gn5KtDnLHRqXJu0MrRgBuw6kfpNoD61DRWkpiYQ5MTYIWSB3Mc7Ff5kHUen9SwzIQ0o3Kj1P47MZ
mw8=
=40QI
-----END PGP SIGNATURE-----

--------------5DhebwLARl0HpDFRqz9Vb7lQ--
