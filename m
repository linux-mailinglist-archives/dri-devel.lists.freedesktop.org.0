Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F95E19A5CE
	for <lists+dri-devel@lfdr.de>; Wed,  1 Apr 2020 09:04:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43BA36E8E7;
	Wed,  1 Apr 2020 07:03:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC38289346
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 10:30:52 +0000 (UTC)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48s5Fj5GHrz9v00R;
 Tue, 31 Mar 2020 12:30:49 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=AQY5F5Uq; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id S8JLe2keKhDM; Tue, 31 Mar 2020 12:30:49 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48s5Fj3r9Nz9txjH;
 Tue, 31 Mar 2020 12:30:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1585650649; bh=lg0dEGQkVMYO3xdocTZFtUVHqNWKpLHa9ZDNJ1sTU+U=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=AQY5F5UqINFsHhEp7XzZ+31ke+4liTXcYfFeFFx0PGehfJgxI+PytWjLREDOpMQyZ
 vJqhXf8SsUhqvrtb53aGHaZqCZnmDdrbIme++khpsH7B4QCFpWBD6lRmqnzrZh4j3p
 rZaWO0hxZmFYqwFbKEg2Eb9NbZXSkQlWeYCfukkE=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 960BE8B79C;
 Tue, 31 Mar 2020 12:30:50 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id FfRA8Pj3pOON; Tue, 31 Mar 2020 12:30:50 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 14F748B79A;
 Tue, 31 Mar 2020 12:30:44 +0200 (CEST)
Subject: Re: [PATCH 0/2] powerpc: Remove support for ppc405/440 Xilinx
 platforms
To: Michal Simek <michal.simek@xilinx.com>,
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
 <11765c82-bf1a-466c-760d-f9a4c4d1d5f1@c-s.fr>
 <adb18d3b-fd30-c328-cedd-bac5d8611fa2@xilinx.com>
 <a1212105-3894-c282-0f1e-a1ac9a35cd4e@c-s.fr>
 <12a1f423-7e54-6423-1c8c-33e221664272@c-s.fr>
 <d822c806-14c5-4ce7-b559-090b0685fa43@xilinx.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <8be8dfe5-c5e7-3cb0-f263-9fafa2f06c7a@c-s.fr>
Date: Tue, 31 Mar 2020 12:30:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <d822c806-14c5-4ce7-b559-090b0685fa43@xilinx.com>
Content-Language: fr
X-Mailman-Approved-At: Wed, 01 Apr 2020 07:03:42 +0000
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
 YueHaibing <yuehaibing@huawei.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Allison Randal <allison@lohutok.net>, Leonardo Bras <leonardo@linux.ibm.com>,
 DTML <devicetree@vger.kernel.org>, Andrew Donnellan <ajd@linux.ibm.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Marc Zyngier <marc.zyngier@arm.com>, Alistair Popple <alistair@popple.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Alexios Zavras <alexios.zavras@intel.com>,
 Mark Brown <broonie@kernel.org>, git@xilinx.com,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Enrico Weigelt <info@metux.net>, Michal Simek <monstr@monstr.eu>,
 Wei Hu <weh@microsoft.com>, Christian Lamparter <chunkeey@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Takashi Iwai <tiwai@suse.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Armijn Hemel <armijn@tjaldur.nl>, Rob Herring <robh+dt@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpMZSAzMS8wMy8yMDIwIMOgIDEyOjA0LCBNaWNoYWwgU2ltZWsgYSDDqWNyaXTCoDoKPiBPbiAz
MS4gMDMuIDIwIDExOjQ5LCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOgo+Pgo+Pgo+PiBMZSAzMS8w
My8yMDIwIMOgIDA5OjE5LCBDaHJpc3RvcGhlIExlcm95IGEgw6ljcml0wqA6Cj4+Pgo+Pj4KPj4+
IExlIDMxLzAzLzIwMjAgw6AgMDg6NTksIE1pY2hhbCBTaW1layBhIMOpY3JpdMKgOgo+Pj4+IE9u
IDMxLiAwMy4gMjAgODo1NiwgQ2hyaXN0b3BoZSBMZXJveSB3cm90ZToKPj4+Pj4KPj4+Pj4KPj4+
Pj4gTGUgMzEvMDMvMjAyMCDDoCAwNzozMCwgTWljaGFlbCBFbGxlcm1hbiBhIMOpY3JpdMKgOgo+
Pj4+Pj4gQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjLXMuZnI+IHdyaXRlczoK
Pj4+Pj4+PiBMZSAyNy8wMy8yMDIwIMOgIDE1OjE0LCBBbmR5IFNoZXZjaGVua28gYSDDqWNyaXTC
oDoKPj4+Pj4+Pj4gT24gRnJpLCBNYXIgMjcsIDIwMjAgYXQgMDI6MjI6NTVQTSArMDEwMCwgQXJu
ZCBCZXJnbWFubiB3cm90ZToKPj4+Pj4+Pj4+IE9uIEZyaSwgTWFyIDI3LCAyMDIwIGF0IDI6MTUg
UE0gQW5keSBTaGV2Y2hlbmtvCj4+Pj4+Pj4+PiA8YW5kcml5LnNoZXZjaGVua29AbGludXguaW50
ZWwuY29tPiB3cm90ZToKPj4+Pj4+Pj4+PiBPbiBGcmksIE1hciAyNywgMjAyMCBhdCAwMzoxMDoy
NlBNICswMjAwLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6Cj4+Pj4+Pj4+Pj4+IE9uIEZyaSwgTWFy
IDI3LCAyMDIwIGF0IDAxOjU0OjMzUE0gKzAxMDAsIEFybmQgQmVyZ21hbm4gd3JvdGU6Cj4+Pj4+
Pj4+Pj4+PiBPbiBGcmksIE1hciAyNywgMjAyMCBhdCAxOjEyIFBNIE1pY2hhbCBTaW1lawo+Pj4+
Pj4+Pj4+Pj4gPG1pY2hhbC5zaW1la0B4aWxpbnguY29tPiB3cm90ZToKPj4+Pj4+Pj4gLi4uCj4+
Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+PiBJdCBkb2VzIHJhaXNlIGEgZm9sbG93LXVwIHF1ZXN0aW9uIGFi
b3V0IHBwYzQweCB0aG91Z2g6IGlzIGl0Cj4+Pj4+Pj4+Pj4+PiB0aW1lIHRvCj4+Pj4+Pj4+Pj4+
PiByZXRpcmUgYWxsIG9mIGl0Pwo+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+PiBXaG8ga25vd3M/Cj4+
Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+IEkgaGF2ZSBpbiBwb3NzZXNzaW9uIG5pY2UgV0QgTXkgQm9v
ayBMaXZlLCBiYXNlZCBvbiB0aGlzCj4+Pj4+Pj4+Pj4+IGFyY2hpdGVjdHVyZSwgYW5kIEkKPj4+
Pj4+Pj4+Pj4gd29uJ3QgaXQgZ29uZSBmcm9tIG1vZGVybiBrZXJuZWwgc3VwcG9ydC4gT1RPSCBJ
IHVuZGVyc3RhbmQgdGhhdAo+Pj4+Pj4+Pj4+PiBhbW91bnQgb2YgcmVhbAo+Pj4+Pj4+Pj4+PiB1
c2VycyBub3QgdG9vIGJpZy4KPj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+ICtDYzogQ2hyaXN0aWFuIExh
bXBhcnRlciwgd2hvbSBJIG93ZSBmb3IgdGhhdCBXRCBib3guCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4g
QWNjb3JkaW5nIHRvIGh0dHBzOi8vb3BlbndydC5vcmcvdG9oL3dkL215Ym9va2xpdmUsIHRoYXQg
b25lIGlzCj4+Pj4+Pj4+PiBiYXNlZCBvbgo+Pj4+Pj4+Pj4gQVBNODIxODEvcHBjNDY0LCBzbyBp
dCBpcyBhYm91dCBzZXZlcmFsIGdlbmVyYXRpb25zIG5ld2VyIHRoYW4KPj4+Pj4+Pj4+IHdoYXQg
SQo+Pj4+Pj4+Pj4gYXNrZWQgYWJvdXQgKHBwYzQweCkuCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+PiBB
aCwgYW5kIEkgaGF2ZSBBbWlnYSBib2FyZCwgYnV0IHRoYXQgb25lIGlzIGJlaW5nIHVzZWQgb25s
eSBmb3IKPj4+Pj4+Pj4+Pj4gdGVzdGluZywgc28sCj4+Pj4+Pj4+Pj4+IEkgZG9uJ3QgY2FyZSBt
dWNoLgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IEkgdGhpbmsgdGhlcmUgYXJlIGEgY291cGxlIG9mIHBw
YzQ0MCBiYXNlZCBBbWlnYSBib2FyZHMsIGJ1dCBhZ2FpbiwKPj4+Pj4+Pj4+IG5vdCA0MDUKPj4+
Pj4+Pj4+IHRvIG15IGtub3dsZWRnZS4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gQWgsIHlvdSBhcmUgcmln
aHQuIE5vIG9iamVjdGlvbnMgZnJvbSBwcGM0MHggcmVtb3ZhbCEKPj4+Pj4+Pgo+Pj4+Pj4+IFJl
bW92aW5nIDQweCB3b3VsZCBoZWxwIGNsZWFuaW5nIHRoaW5ncyBhIGJpdC4gRm9yIGluc3RhbmNl
IDQweCBpcwo+Pj4+Pj4+IHRoZQo+Pj4+Pj4+IGxhc3QgcGxhdGZvcm0gc3RpbGwgaGF2aW5nIFBU
RV9BVE9NSUNfVVBEQVRFUy4gU28gaWYgd2UgY2FuIHJlbW92ZQo+Pj4+Pj4+IDQweAo+Pj4+Pj4+
IHdlIGNhbiBnZXQgcmlkIG9mIFBURV9BVE9NSUNfVVBEQVRFUyBjb21wbGV0ZWx5Lgo+Pj4+Pj4+
Cj4+Pj4+Pj4gSWYgbm8gb25lIG9iamVjdHMsIEkgY2FuIHByZXBhcmUgYSBzZXJpZXMgdG8gZHJv
cCBzdXBwb3J0IGZvciA0MHgKPj4+Pj4+PiBjb21wbGV0ZWx5Lgo+Pj4+Pj4+Cj4+Pj4+Pj4gTWlj
aGFlbCwgYW55IHRob3VnaHQgPwo+Pj4+Pj4KPj4+Pj4+IEkgaGF2ZSBubyBhdHRhY2htZW50IHRv
IDQweCwgYW5kIEknZCBjZXJ0YWlubHkgYmUgaGFwcHkgdG8gaGF2ZSBsZXNzCj4+Pj4+PiBjb2Rl
IGluIHRoZSB0cmVlLCB3ZSBzdHJ1Z2dsZSB0byBrZWVwIGV2ZW4gdGhlIG1vZGVybiBwbGF0Zm9y
bXMgd2VsbAo+Pj4+Pj4gbWFpbnRhaW5lZC4KPj4+Pj4+Cj4+Pj4+PiBBdCB0aGUgc2FtZSB0aW1l
IEkgZG9uJ3Qgd2FudCB0byByZW5kZXIgYW55b25lJ3MgaGFyZHdhcmUgb2Jzb2xldGUKPj4+Pj4+
IHVubmVjZXNzYXJpbHkuIEJ1dCBpZiB0aGVyZSdzIHJlYWxseSBubyBvbmUgdXNpbmcgNDB4IHRo
ZW4gd2Ugc2hvdWxkCj4+Pj4+PiByZW1vdmUgaXQsIGl0IGNvdWxkIHdlbGwgYmUgYnJva2VuIGFs
cmVhZHkuCj4+Pj4+Pgo+Pj4+Pj4gU28gSSBndWVzcyBwb3N0IGEgc2VyaWVzIHRvIGRvIHRoZSBy
ZW1vdmFsIGFuZCB3ZSdsbCBzZWUgaWYgYW55b25lCj4+Pj4+PiBzcGVha3MgdXAuCj4+Pj4+Pgo+
Pj4+Pgo+Pj4+PiBPaywgc2VyaWVzIHNlbnQgb3V0LCBzZWUKPj4+Pj4gaHR0cHM6Ly9wYXRjaHdv
cmsub3psYWJzLm9yZy9wcm9qZWN0L2xpbnV4cHBjLWRldi9saXN0Lz9zZXJpZXM9MTY3NzU3Cj4+
Pj4KPj4+PiBvay4gSSBzZWUgeW91IGhhdmUgZG9uZSBpdCBjb21wbGV0ZWx5IGluZGVwZW5kZW50
bHkgb2YgbXkgcGF0Y2hzZXQuCj4+Pj4gV291bGQgYmUgYmV0dGVyIGlmIHlvdSBjYW4gYmFzZSBp
dCBvbiB0aGUgdG9wIG9mIG15IDIgcGF0Y2hlcyBiZWNhdXNlCj4+Pj4gdGhleSBhcmUgaW4gY29u
ZmxpY3Qgbm93IGFuZCBJIG5lZWQgdG8gYWxzbyByZW1vdmUgdmlydGV4IDQ0eCBwbGF0Zm9ybQo+
Pj4+IGFsc28gd2l0aCBhbHNhIGRyaXZlci4KPj4+Pgo+Pj4KPj4+IEkgY2FuJ3Qgc2VlIHlvdXIg
Zmlyc3QgcGF0Y2gsIG9ubHkgdGhlIHNlY29uZCBvbmUgc2hvd3MgdXAgaW4gdGhlCj4+PiBzZXJp
ZXMsIHNlZQo+Pj4gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2xpbnV4cHBj
LWRldi9saXN0Lz9zZXJpZXM9MTY3NzU3Cj4+Pgo+Pgo+Pgo+PiBPaywgSSBmb3VuZCB5b3VyIGZp
cnN0IHBhdGNoIG9uIGFub3RoZXIgcGF0Y2h3b3JrLCBpdCBkb2Vzbid0IHRvdWNoIGFueQo+PiBm
aWxlIGluIGFyY2gvcG93ZXJwYy8KPiAKPiBUaGVyZSB3YXMganVzdCBkcml2ZXIgZGVwZW5kZW5j
eSBvbiBzeW1ib2wgd2hpY2ggaXMgcmVtb3ZlZCBieSAyLzIuCj4gTGV0J3Mgc2VlIHdoYXQgeW91
IGdldCBmcm9tIGtidWlsZCBpZiBhbnkgc3ltYm9sIGlzIHJlbW92ZWQgYnV0IHN0aWxsCj4gdXNl
ZCBpbiBkcml2ZXJzIGZvbGRlci4KCk5vdGhpbmcgYmFkIGFwcGFyZW50bHksIHNlZSBidWlsZCB0
ZXN0IGF0IApodHRwOi8va2lzc2tiLmVsbGVybWFuLmlkLmF1L2tpc3NrYi9oZWFkL2E0ODkwZTNm
YjA0Njk1MGU5YTYyZGMzZWZmNWIzNzQ2OTU1MWU4MjMvCgpDaHJpc3RvcGhlCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
