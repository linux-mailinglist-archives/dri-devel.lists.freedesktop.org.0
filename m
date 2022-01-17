Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65502490AC8
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 15:53:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 468F910E2EE;
	Mon, 17 Jan 2022 14:53:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C65C10E2EE
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 14:53:35 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id B2620212BC;
 Mon, 17 Jan 2022 14:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1642431213; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/I60TRzGqM2Rnu7f2DTYAexCdlVVwBUVgjtIF3/qa+E=;
 b=fGZ7momd5m8UC6uZTi0otmOg5jF36MIvOxdGN1FTd5rt9lS3kgO3Qdc/hX6c2OT3BGCa0w
 RyZ/n7IGWzdjRmEZMtlRyM5YriCqegv0JTBYFknC93q4IjErPtIW6qhjaWfhittxTCIEp2
 1Uy0VoGvYip4XtvJaVN2WQvrmZ3YnkQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1642431213;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/I60TRzGqM2Rnu7f2DTYAexCdlVVwBUVgjtIF3/qa+E=;
 b=bw84tTQh5OLUxdnLS6BZ1vFNPvhr5j50np/dCdZWkJQrXgSWkiPq+QNWnpsHBr5M089cJd
 F8Fo+Sv3O3iho9BA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7804B13C0E;
 Mon, 17 Jan 2022 14:53:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cScrHO2C5WEjKwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Mon, 17 Jan 2022 14:53:33 +0000
Message-ID: <1e005f6b-3cac-b8f3-e5fd-e4c117d8986a@suse.de>
Date: Mon, 17 Jan 2022 15:53:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <YeG8ydoJNWWkGrTb@ls3530>
 <CAKMK7uGdJckdM+fg+576iJXsqzCOUg20etPBMwRLB9U7GcG01Q@mail.gmail.com>
 <c80ed72c-2eb4-16dd-a7ad-57e9dde59ba1@gmx.de>
 <20220117125716.yjwxsze35j2ndn2i@sirius.home.kraxel.org>
 <CAMuHMdW=Zpp2mHbrBx7i0WN8PqY3XpK5qpyAyYxgf9n88edpug@mail.gmail.com>
 <70530b62-7b3f-db88-7f1a-f89b824e5825@suse.de>
 <CAMuHMdW5M=zEuGEnQQc3JytDhoxCKRiq0QFw+HOPp0YMORzidw@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
In-Reply-To: <CAMuHMdW5M=zEuGEnQQc3JytDhoxCKRiq0QFw+HOPp0YMORzidw@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------A0AjPNV0nKMCzsHsKXoumNfW"
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
 Javier Martinez Canillas <javierm@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------A0AjPNV0nKMCzsHsKXoumNfW
Content-Type: multipart/mixed; boundary="------------kLLSmv7rsQiLi2as8kPPAykj";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Gerd Hoffmann <kraxel@redhat.com>, Helge Deller <deller@gmx.de>,
 Daniel Vetter <daniel@ffwll.ch>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "airlied@gmail.com" <airlied@gmail.com>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Javier Martinez Canillas <javierm@redhat.com>
Message-ID: <1e005f6b-3cac-b8f3-e5fd-e4c117d8986a@suse.de>
Subject: Re: [PATCH] MAINTAINERS: Add Helge as fbdev maintainer
References: <YeG8ydoJNWWkGrTb@ls3530>
 <CAKMK7uGdJckdM+fg+576iJXsqzCOUg20etPBMwRLB9U7GcG01Q@mail.gmail.com>
 <c80ed72c-2eb4-16dd-a7ad-57e9dde59ba1@gmx.de>
 <20220117125716.yjwxsze35j2ndn2i@sirius.home.kraxel.org>
 <CAMuHMdW=Zpp2mHbrBx7i0WN8PqY3XpK5qpyAyYxgf9n88edpug@mail.gmail.com>
 <70530b62-7b3f-db88-7f1a-f89b824e5825@suse.de>
 <CAMuHMdW5M=zEuGEnQQc3JytDhoxCKRiq0QFw+HOPp0YMORzidw@mail.gmail.com>
In-Reply-To: <CAMuHMdW5M=zEuGEnQQc3JytDhoxCKRiq0QFw+HOPp0YMORzidw@mail.gmail.com>

--------------kLLSmv7rsQiLi2as8kPPAykj
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: base64

SGkNCg0KQW0gMTcuMDEuMjIgdW0gMTU6MTAgc2NocmllYiBHZWVydCBVeXR0ZXJob2V2ZW46
DQo+IFsuLi5dICANCj4gV2hpY2ggdXNlcyBhbiBEUk1fRk9STUFUX1hSR0I4ODg4IGludGVy
bWVkaWF0ZSwgYW5kDQo+IGRybV9mYl94cmdiODg4OF90b19ncmF5OCgpIGFuZCByZXBhcGVy
X2dyYXk4X3RvX21vbm9fcmV2ZXJzZWQoKQ0KPiB0byBjb252ZXJ0IGZyb20gdHJ1ZWNvbG9y
IHRvIG1vbm9jaHJvbWUuICBJIGd1ZXNzIHRoYXQgd291bGQgd29yaywNCj4gYXMgdGhpcyBp
cyBhIHNsb3cgZS1pbmsgZGlzcGxheS4gIEhhdmUgZnVuIGFzIGEgdGV4dCBjb25zb2xlIDst
KQ0KDQpCdXQgdGhhdCdzIHJlYWxseSBqdXN0IGEgcXVlc3Rpb24gb2Ygb3B0aW1pemF0aW9u
LiBUaGUgY29uc29sZSBpcyANCnVzZXJzcGFjZS1pc2ggaW4gdGhhdCBubyBvbmUgaGFzIGFz
a2VkIGZvciBtb25vY2hyb21lIHN1cHBvcnQgeWV0LiBTbyANCml0J3Mgbm90IHRoZXJlLiBX
ZSBjb3VsZCBhZGQgaXQgaWYgaXQncyBldmVyIG5lZWRlZC4NCg0KQmVzdCByZWdhcmRzDQpU
aG9tYXMNCg0KPiANCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+IA0KPiAgICAgICAgICAgICAg
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

--------------kLLSmv7rsQiLi2as8kPPAykj--

--------------A0AjPNV0nKMCzsHsKXoumNfW
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmHlguwFAwAAAAAACgkQlh/E3EQov+DH
3RAAhyS7g1l+rdX7sGHUP+aGrCc2dFsAGBn9uNsJ2mWoPwJPW3u/ilU35je+kROU3dbyttqV3k+W
L2+WeoXj0xkundZVaNnEhg/WMHfW+23RYq1VfjItcKVDsaUPiM7/FMlpsVykesF/GueV45StxAD1
HpaqFW3m4TKEbOgzzOKFmgeYZmR4BDpeyI0Mn3Z4zTUhsNH7xyAFJFWp4c/3DRRZ04xhP+L4YUPS
C/CaCS/8MNEyokcTHo/l9oQWxAvUMty7C803fgu9KffFW5Af1MZg7tQFOchYBS5gl0AC3iHeHAZG
uruwCR46ZKza+LHOiDQCF1x0bRskX9ixJN74foVQzCNlLY93m+HFMQpUOd0VGUWhb4zssMwWOfUh
iLGD4/c5e6TN21bJpZHo5nXQdu5RjX++5bNSzbJA3X5fjJsijkoBfJaB3k175vSdc8EOLVU9d4bP
7KisNNrlrsBSwBtlsoFndRRehA08pB8MQ5aB5vP8CQGr0amjQZcBjwUPtnxWJVo3wtraC/SWR2DK
GxVHUmIsODgrDXRilFYXwjPryHjHNaNZrOYBNE0rzf80OAxiltQ/wHHa9XyAqWTMpwVuduH1YZdQ
3efQAm/UxcLcTFtZzieShtSkiYxcHe/qtDgwxARs9D4A+gCj/bp02yuJ/+1dackFkTarJaZUg5Tk
ylc=
=oJev
-----END PGP SIGNATURE-----

--------------A0AjPNV0nKMCzsHsKXoumNfW--
