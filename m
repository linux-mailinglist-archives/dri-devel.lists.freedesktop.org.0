Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C431A303D
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 09:34:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E7FF6EB9F;
	Thu,  9 Apr 2020 07:33:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C9CE6E96E
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 07:09:30 +0000 (UTC)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48xwPg1PVNz9vBmp;
 Wed,  8 Apr 2020 09:09:27 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=YciLEzQc; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id qm163DxO4FIF; Wed,  8 Apr 2020 09:09:27 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48xwPg00DWz9txdM;
 Wed,  8 Apr 2020 09:09:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1586329767; bh=pUeE3SL5El2YFZ5sFHqfFXCAVMS+8JYvmMUNbR2W01c=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=YciLEzQcehZFGIvXSnJq/jjzJOffxI2B9Wb0pJ8YYb1TiUbEUWiegILdTGyiKDQ63
 BmGvTs967vstc709cUkGGe7SjAsGaj3J+NJsAjl+vU+N0LBCE4Vlggkx3lgUcfcTUB
 Z/3AmE7zIy4GUL9qhwixgdmO6VfaYlICZilZbP0A=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E20A88B7DF;
 Wed,  8 Apr 2020 09:09:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id X2_-UCI9h0Et; Wed,  8 Apr 2020 09:09:27 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 93D988B7D2;
 Wed,  8 Apr 2020 09:09:24 +0200 (CEST)
Subject: Re: [PATCH 0/2] powerpc: Remove support for ppc405/440 Xilinx
 platforms
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>
References: <cover.1585311091.git.michal.simek@xilinx.com>
 <CAK8P3a2mKPRFbRE3MWScr9GSiL4cpLg0wqv1Q28XDCZVPWgHfg@mail.gmail.com>
 <20200327131026.GT1922688@smile.fi.intel.com>
 <20200327131531.GU1922688@smile.fi.intel.com>
 <CAK8P3a1Z+ZPTDzgAjdz0a7d85R62BhUqkdEWgrwXh-OnYe6rog@mail.gmail.com>
 <20200327141434.GA1922688@smile.fi.intel.com>
 <b5adcc7a-9d10-d75f-50e3-9c150a7b4989@c-s.fr>
 <87mu7xum41.fsf@mpe.ellerman.id.au>
 <bac9af641140cf6df04e3532589a11c2f3bccd2f.camel@kernel.crashing.org>
 <87pncprwp9.fsf@mpe.ellerman.id.au>
 <5782f9a42ad8acd8b234fa9c15a09db93552dc6b.camel@kernel.crashing.org>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <7dead7f4-57e5-fa98-e9af-4beace2794a8@c-s.fr>
Date: Wed, 8 Apr 2020 09:09:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <5782f9a42ad8acd8b234fa9c15a09db93552dc6b.camel@kernel.crashing.org>
Content-Language: fr
X-Mailman-Approved-At: Thu, 09 Apr 2020 07:33:24 +0000
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Mark Rutland <mark.rutland@arm.com>,
 "Desnes A. Nunes do Rosario" <desnesn@linux.ibm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jaroslav Kysela <perex@perex.cz>,
 Richard Fontana <rfontana@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Sasha Levin <sashal@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Jonathan Corbet <corbet@lwn.net>, Masahiro Yamada <masahiroy@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, YueHaibing <yuehaibing@huawei.com>,
 Michal Simek <michal.simek@xilinx.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Leonardo Bras <leonardo@linux.ibm.com>,
 Matt Porter <mporter@kernel.crashing.org>, DTML <devicetree@vger.kernel.org>,
 Andrew Donnellan <ajd@linux.ibm.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Marc Zyngier <marc.zyngier@arm.com>, Alistair Popple <alistair@popple.id.au>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Nicholas Piggin <npiggin@gmail.com>, Alexios Zavras <alexios.zavras@intel.com>,
 Mark Brown <broonie@kernel.org>, git@xilinx.com,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>,
 Michal Simek <monstr@monstr.eu>, Wei Hu <weh@microsoft.com>,
 Christian Lamparter <chunkeey@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Armijn Hemel <armijn@tjaldur.nl>, Rob Herring <robh+dt@kernel.org>,
 Enrico Weigelt <info@metux.net>, "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpMZSAwOC8wNC8yMDIwIMOgIDAxOjMyLCBCZW5qYW1pbiBIZXJyZW5zY2htaWR0IGEgw6ljcml0
wqA6Cj4gT24gRnJpLCAyMDIwLTA0LTAzIGF0IDE1OjU5ICsxMTAwLCBNaWNoYWVsIEVsbGVybWFu
IHdyb3RlOgo+PiBCZW5qYW1pbiBIZXJyZW5zY2htaWR0IDxiZW5oQGtlcm5lbC5jcmFzaGluZy5v
cmc+IHdyaXRlczoKPj4+IE9uIFR1ZSwgMjAyMC0wMy0zMSBhdCAxNjozMCArMTEwMCwgTWljaGFl
bCBFbGxlcm1hbiB3cm90ZToKPj4+PiBJIGhhdmUgbm8gYXR0YWNobWVudCB0byA0MHgsIGFuZCBJ
J2QgY2VydGFpbmx5IGJlIGhhcHB5IHRvIGhhdmUKPj4+PiBsZXNzCj4+Pj4gY29kZSBpbiB0aGUg
dHJlZSwgd2Ugc3RydWdnbGUgdG8ga2VlcCBldmVuIHRoZSBtb2Rlcm4gcGxhdGZvcm1zCj4+Pj4g
d2VsbAo+Pj4+IG1haW50YWluZWQuCj4+Pj4KPj4+PiBBdCB0aGUgc2FtZSB0aW1lIEkgZG9uJ3Qg
d2FudCB0byByZW5kZXIgYW55b25lJ3MgaGFyZHdhcmUKPj4+PiBvYnNvbGV0ZQo+Pj4+IHVubmVj
ZXNzYXJpbHkuIEJ1dCBpZiB0aGVyZSdzIHJlYWxseSBubyBvbmUgdXNpbmcgNDB4IHRoZW4gd2UK
Pj4+PiBzaG91bGQKPj4+PiByZW1vdmUgaXQsIGl0IGNvdWxkIHdlbGwgYmUgYnJva2VuIGFscmVh
ZHkuCj4+Pj4KPj4+PiBTbyBJIGd1ZXNzIHBvc3QgYSBzZXJpZXMgdG8gZG8gdGhlIHJlbW92YWwg
YW5kIHdlJ2xsIHNlZSBpZgo+Pj4+IGFueW9uZQo+Pj4+IHNwZWFrcyB1cC4KPj4+Cj4+PiBXZSBz
aG91bGRuJ3QgcmVtb3ZlIDQweCBjb21wbGV0ZWx5LiBKdXN0IHJlbW92ZSB0aGUgWGlsaW54IDQw
NQo+Pj4gc3R1ZmYuCj4+Cj4+IENvbmdyYXR1bGF0aW9ucyBvbiBiZWNvbWluZyB0aGUgNDB4IG1h
aW50YWluZXIhCj4gCj4gRGlkbid0IEkgZ2l2ZSB5b3UgbXkgbGFzdCA0MHggc3lzdGVtID8gOi0p
IElCTSBzdGlsbCBwdXQgNDB4IGNvcmVzCj4gaW5zaWRlIFBPV0VSIGNoaXBzIG5vID8KPiAKCkFj
Y29yZGluZyB0byBXaWtpcGVkaWEgKGh0dHBzOi8vZW4ud2lraXBlZGlhLm9yZy93aWtpL1Bvd2Vy
UENfNDAwKSwgNDA1IApjb3JlcyBhcmUgdXNlZCBpbiBtb2Rlcm4gZXF1aXBtZW50cyAoaG93IG1v
ZGVybiA/KSwgaG93ZXZlciA0MDMgaGFzIApuZXZlciByZWFjaGVkIHRoZSBtYXJrZXQuCgpDYW4g
d2Ugc3RhcnQgcmVtb3ZpbmcgNDAzIHN0dWZmID8gVGhhdCdzIG5vdCBhIGxvdCwgYnV0IHN0aWxs
LgoKRG9lcyBhbnlib2R5IGtub3dzIGFueXRoaW5nIGFib3V0IHRoaXMgRVJSQVRVTSA3NyBzdHVm
ZiA/IElzIHRoYXQgc3RpbGwgCmFuIGlzc3VlIHdpdGggYWxsIDQwNSBjb3JlcyBvciBoYXMgdGhp
cyBiZWVuIGZpeGVkIGxvbmcgdGltZSBhZ28gYW5kIGNhbiAKYmUgcmVtb3ZlZCA/CgpDaHJpc3Rv
cGhlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
