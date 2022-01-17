Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4974909C2
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 14:51:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B1CE10E1F6;
	Mon, 17 Jan 2022 13:51:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1434010E1F6
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 13:51:10 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id AB9261F399;
 Mon, 17 Jan 2022 13:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1642427468; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0mK1vTdh/N1JGSY5RLEBdcoglPVme0D3aV+HDcYBmm8=;
 b=vi+8Dmi9KMQxUAlbbbEJkXgg0xPCHSnKQnYA5jU9G6QbAlF1HIXYf4HX5AqygOML7gS/od
 tjHMmR5GcXWl8nW9i17bpc4y+nA/NdcGegolk56jq3gXFA1zdDPdjZqTFozd8y5XksPycs
 fRyOAi+FETwecOp2P1ukbvrEk+ME/9E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1642427468;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0mK1vTdh/N1JGSY5RLEBdcoglPVme0D3aV+HDcYBmm8=;
 b=DmVqlP1Omwvlgfg60OiHiNeuVO8zyg8do0/v3Xvvn1SSOmQiKj99E71h568tzmCKhcc8s1
 2Mi3irK7umWxR+BQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 73D4B13D94;
 Mon, 17 Jan 2022 13:51:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id A+DTGkx05WHPUwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 17 Jan 2022 13:51:08 +0000
Message-ID: <70530b62-7b3f-db88-7f1a-f89b824e5825@suse.de>
Date: Mon, 17 Jan 2022 14:51:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <YeG8ydoJNWWkGrTb@ls3530>
 <CAKMK7uGdJckdM+fg+576iJXsqzCOUg20etPBMwRLB9U7GcG01Q@mail.gmail.com>
 <c80ed72c-2eb4-16dd-a7ad-57e9dde59ba1@gmx.de>
 <20220117125716.yjwxsze35j2ndn2i@sirius.home.kraxel.org>
 <CAMuHMdW=Zpp2mHbrBx7i0WN8PqY3XpK5qpyAyYxgf9n88edpug@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAMuHMdW=Zpp2mHbrBx7i0WN8PqY3XpK5qpyAyYxgf9n88edpug@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------KsZMdQUxiibxK2wrIo0AAOOd"
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, Helge Deller <deller@gmx.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------KsZMdQUxiibxK2wrIo0AAOOd
Content-Type: multipart/mixed; boundary="------------LDzgbro4DDuoxg4TzhAhBU08";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Cc: Helge Deller <deller@gmx.de>, Daniel Vetter <daniel@ffwll.ch>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>
Message-ID: <70530b62-7b3f-db88-7f1a-f89b824e5825@suse.de>
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
References: <YeG8ydoJNWWkGrTb@ls3530>
 <CAKMK7uGdJckdM+fg+576iJXsqzCOUg20etPBMwRLB9U7GcG01Q@mail.gmail.com>
 <c80ed72c-2eb4-16dd-a7ad-57e9dde59ba1@gmx.de>
 <20220117125716.yjwxsze35j2ndn2i@sirius.home.kraxel.org>
 <CAMuHMdW=Zpp2mHbrBx7i0WN8PqY3XpK5qpyAyYxgf9n88edpug@mail.gmail.com>
In-Reply-To: <CAMuHMdW=Zpp2mHbrBx7i0WN8PqY3XpK5qpyAyYxgf9n88edpug@mail.gmail.com>

--------------LDzgbro4DDuoxg4TzhAhBU08
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTcuMDEuMjIgdW0gMTQ6Mjkgc2NocmllYiBHZWVydCBVeXR0ZXJob2V2ZW46
DQo+IEhpIEdlcmQsDQo+IA0KPiBPbiBNb24sIEphbiAxNywgMjAyMiBhdCAxOjU3IFBNIEdl
cmQgSG9mZm1hbm4gPGtyYXhlbEByZWRoYXQuY29tPiB3cm90ZToNCj4+PiBiKSB0byBpbmNs
dWRlIG5ldyBkcml2ZXJzIChmb3Igb2xkIGhhcmR3YXJlKSBpZiB0aGV5IGFycml2ZSAocHJv
YmFibHkgaGFwcGVucyByYXJlbHkgYnV0IHRoZXJlIGNhbiBiZSkuDQo+Pj4gICAgIEkga25v
dyBvZiBhdCBsZWFzdCBvbmUgZHJpdmVyIHdoaWNoIHdvbid0IGJlIGFibGUgdG8gc3VwcG9y
dCBEUk0uLi4uDQo+Pg0KPj4gSG1tPyAgSSBzZXJpb3VzbHkgZG91YnQgdGhhdC4gIFRoZXJl
IGlzIGFsd2F5cyB0aGUgb3B0aW9uIHRvIHVzZSBhDQo+PiBzaGFkb3cgZnJhbWVidWZmZXIs
IHRoZW4gY29udmVydCBmcm9tIHN0YW5kYXJkIGRybSBmb3JtYXRzIHRvIHdoYXRldmVyDQo+
PiBlc290ZXJpYyBwaXhlbCBmb3JtYXQgeW91ciBoYXJkd2FyZSBleHBlY3RzLg0KPj4NCj4+
IEJlZW4gdGhlcmUsIGRvbmUgdGhhdC4gIEhhdmUgYSBsb29rIGF0IHRoZSBjaXJydXMgZHJp
dmVyLiAgVGhlIHBoeXNpY2FsDQo+PiBoYXJkd2FyZSB3YXMgZGVzaWduZWQgaW4gdGhlIGVh
cmx5IDkwLWllcywgYWxtb3N0IDMwIHllYXJzIGFnby4gIFRoZXNlDQo+PiBkYXlzIGl0IGV4
aXN0cyBpbiB2aXJ0dWFsIGZvcm0gb25seSAocWVtdSBlbXVsYXRlcyBpdCkuICBUaGFua3Mg
dG8gdGhlDQo+PiBkcm0gZHJpdmVyIGl0IHJ1bnMgd2F5bGFuZCBqdXN0IGZpbmUgZXZlbiB0
aG91Z2ggaXQgaGFzIGEgYnVuY2ggb2YNCj4+IGNvbnN0cmFpbnMgZGljdGF0ZWQgYnkgdGhl
IGhhcmR3YXJlIGRlc2lnbi4NCj4gDQo+IFRoZSBDaXJydXMgRFJNIGRyaXZlciBzdXBwb3J0
cyBUcnVlQ29sb3IgKFJHQjU2NS84ODggYW5kIEFSR0I4ODg4KQ0KPiBtb2RlcyBvbmx5LiAg
VGhlIENpcnJ1cyBmYmRldiBkcml2ZXIgYWxzbyBzdXBwb3J0cyBtb2Nocm9tZSBhbmQgMjU2
DQo+IGNvbG9yIG1vZGVzLg0KPiANCj4gVGhlcmUgZXhpc3Qgc29tZSBEUk0gZHJpdmVycyB0
aGF0IGRvIHN1cHBvcnQgRFJNX0ZPUk1BVF9DOCwgYnV0IG5vbmUgb2YNCj4gdGhlICJ0aW55
IiBvbmVzIGRvLiBTYW1lIGZvciBEUk1fRk9STUFUX1JHQnszMzIsMjMzfS4gIFVzaW5nIGEg
c2hhZG93DQo+IGZyYW1lIGJ1ZmZlciB0byBjb252ZXJ0IGZyb20gdHJ1ZWNvbG9yIHRvIDI1
NiBjb2xvcnMgd291bGQgYmUgZG9hYmxlLA0KPiBidXQgd291bGQgZ2l2ZSBiYWQgcmVzdWx0
cy4gQW5kIHdoYXQgYWJvdXQgbGVzcyBjb2xvcnM/DQo+IEFkZGluZyBzdXBwb3J0IGZvciBl
LmcuIERSTV9GT1JNQVRfQzQgaXMgbm90IHN0cmFpZ2h0LWZvcndhcmQsIGFzDQo+IHRoZSBE
Uk0gY29yZSBhc3N1bWVzIGluIG1hbnkgcGxhY2VzIHRoYXQgYSBwaXhlbCBpcyBhdCBsZWFz
dCAxIGJ5dGUsDQo+IGFuZCB3b3VsZCBjcmFzaCBvdGhlcndpc2UgKHllcyBJIHRyaWVkKS4g
IE90aGVyIG1vZGVzIG5lZWRlZCBhcmUNCj4gRFJNX0ZPUk1BVF9ZNCBhbmQgRFJNX0ZPUk1B
VF97QlcsV0J9IChtb25vY2hyb21lKS4NCg0KV2UgZXhwb3J0IFhSR0IzMiBmcm9tIGVhY2gg
ZHJpdmVyLCBiZWNhdXNlIHVzZXJzcGFjZSBleHBlY3RzIGl0LiBCdXQgDQp0aGF0IGlzIG5v
dCBhIGhhcmQgcmVxdWlyZW1lbnQuIFVzZXJzcGFjZSBjYW4gdXNlIGFueSBmb3JtYXQuIEl0
J3MganVzdCANCnRoYXQgbm8gb25lIHNlZW1zIHRvIGhhdmUgYW55IHVzZSBjYXNlcyBzbyBm
YXIsIHNvIG5vIHdvcmsgaGFzIGJlZW4gDQpkb25lLiBUaGluayBvZiBYUkdCMzIgYXMgYSBm
YWxsYmFjay4NCg0KUGVyc29uYWxseSwgSSdkIG11Y2ggYXBwcmVjaWF0ZSBpZiB1c2Vyc3Bh
Y2Ugd291bGQgc3VwcG9ydCBtb3JlIG9mIHRoZSANCm5hdGl2ZSBmb3JtYXRzIGFuZCBub3Qg
cmVseSBvbiBYUkdCMzIuDQoNCg0KPiBUaGlzIG5vdCBvbmx5IHRvIHN1cHBvcnQgIm9sZCIg
aGFyZHdhcmUsIGJ1dCBhbHNvIG1vZGVybiBzbWFsbCBPTEVEDQo+IGFuZCBlLWluayBkaXNw
bGF5cy4NCg0KVGhlcmUncyBhIERSTSBkcml2ZXIgZm9yIFJlcGFwZXIgZS1JbmsgZGlzcGxh
eXMuIFNvIGl0IHNlZW1zIGRvYWJsZSBhdCANCmxlYXN0Lg0KDQpCZXN0IHJlZ2FyZHMNClRo
b21hcw0KDQo+IA0KPiBPbiB0aGUgcG9zaXRpdmUgc2lkZTogRFJNIHdvdWxkIGZvcmNlIGUu
Zy4gdGhlIEFtaWdhIGFuZCBBdGFyaQ0KPiBiaXRwbGFuZSBmb3JtYXRzIHRvIGJlY29tZSBp
bnRlcm5hbCB0byB0aGUga2VybmVsIGRyaXZlciwgd2l0aCB0aGUNCj4ga2VybmVsIGRyaXZl
ciBjb252ZXJ0aW5nIGZyb20gcGFja2VkIHBpeGVscyB0byBiaXRwbGFuZXMuICBIZW5jZQ0K
PiB1c2Vyc3BhY2Ugd291bGQgbm8gbG9uZ2VyIGhhdmUgdG8gY2FyZSBhYm91dCBiaXRwbGFu
ZXMuDQo+IA0KPiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBU
aGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5v
cmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVv
cGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQNCj4gd2hlbiBJJ20gdGFsa2luZyB0
byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlr
ZSB0aGF0Lg0KPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBU
b3J2YWxkcw0KDQotLSANClRob21hcyBaaW1tZXJtYW5uDQpHcmFwaGljcyBEcml2ZXIgRGV2
ZWxvcGVyDQpTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCk1heGZlbGRz
dHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQ0KKEhSQiAzNjgwOSwgQUcgTsO8cm5i
ZXJnKQ0KR2VzY2jDpGZ0c2bDvGhyZXI6IEl2byBUb3Rldg0K

--------------LDzgbro4DDuoxg4TzhAhBU08--

--------------KsZMdQUxiibxK2wrIo0AAOOd
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmHldEsFAwAAAAAACgkQlh/E3EQov+AH
Tg/7BhfzrXcUXwFax2XWiYFiFFGTavb4EbcPO3rUNNF7U1S2Oe1newd1hMxyk9OCE2aHc04GP1qn
5S/ifcVOWVUEmuX7qhdIR15NkiEW5atEdIL384OSKsPIg46ZmMCeMm346LPuOtivYY2khwMVmkz6
P7Sq1QU+DukWJMNFjHmeBKuN039fy+RXgCjAsLi90CZjz6qbFTs3cGZCCpJ7ch6tq/TRX064lUtC
dx+pRMhrRK3rzof3g+A/R829/dTvArNplNkP1dUI5mssqR0Cle9lkrT2EmSKW9KNAnyRHvZUMhy1
UcQQX0CqtXMf5ta9q+hadJS+TcyT/hJUHQCT7J1OnxphLRlEpnRKJXi47fl/ww6doLtjlQkF4o4I
rVa8vIAuokyS1HBc9/HI4H/Ia+dcJZuQ39d9xZ6HhyxoroZUakpR2R//fF19vCXem/HAKQMGh/nL
OnH3koMoTp57TbZsd5ceKtXSpLk+gzaKJ1yPRb7+Wgvo9sjjyZdp9DF+jFBWlUIZ1X/p/yjMHFyv
6fbBIFObigMPRtFXOjsAdd5t3meDrLSBd1c8um6nmOfZbMsIBklKnRcWu2iBoi8IPt2+TrDJvlsV
kYCIMHAQN9BJf8C24E2Pi29mo2m2EHUC23yCJx0suX7vWZ4JDTYPl0QKFWHAD7Y+SQo3ooPfavtE
7tM=
=3nPB
-----END PGP SIGNATURE-----

--------------KsZMdQUxiibxK2wrIo0AAOOd--
