Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B59198D16
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 09:38:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D279A6E59D;
	Tue, 31 Mar 2020 07:38:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B4296E264
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 06:56:32 +0000 (UTC)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48s0VM3SVRz9tyhf;
 Tue, 31 Mar 2020 08:56:27 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=IzqkH+Ku; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id ReBz4FGiQkHf; Tue, 31 Mar 2020 08:56:27 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48s0VM1wcxz9tyhY;
 Tue, 31 Mar 2020 08:56:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1585637787; bh=O/pdOKyQoI5LHkYhdMKFbk8RIr6wmY568X2mLktXspE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=IzqkH+Ku1APk6gjzsUC1/DYvNxm6x78Mwd6JqIoS5s436A82mfvQxm8s/m5Z2Lyws
 ow0hIhv79EifdRBUXao9CV/R0Uk7TDWZYkhfOIsFgdju+SK9MldU1u+Uj7wqIvniPn
 e+Jh4rXFLThvHszin622sllo1B12s2cdYGEu5A0c=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 354728B784;
 Tue, 31 Mar 2020 08:56:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id TyGeYMHs_2kl; Tue, 31 Mar 2020 08:56:28 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id AB6248B752;
 Tue, 31 Mar 2020 08:56:23 +0200 (CEST)
Subject: Re: [PATCH 0/2] powerpc: Remove support for ppc405/440 Xilinx
 platforms
To: Michael Ellerman <mpe@ellerman.id.au>,
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
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <11765c82-bf1a-466c-760d-f9a4c4d1d5f1@c-s.fr>
Date: Tue, 31 Mar 2020 08:56:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <87mu7xum41.fsf@mpe.ellerman.id.au>
Content-Language: fr
X-Mailman-Approved-At: Tue, 31 Mar 2020 07:37:59 +0000
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

CgpMZSAzMS8wMy8yMDIwIMOgIDA3OjMwLCBNaWNoYWVsIEVsbGVybWFuIGEgw6ljcml0wqA6Cj4g
Q2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjLXMuZnI+IHdyaXRlczoKPj4gTGUg
MjcvMDMvMjAyMCDDoCAxNToxNCwgQW5keSBTaGV2Y2hlbmtvIGEgw6ljcml0wqA6Cj4+PiBPbiBG
cmksIE1hciAyNywgMjAyMCBhdCAwMjoyMjo1NVBNICswMTAwLCBBcm5kIEJlcmdtYW5uIHdyb3Rl
Ogo+Pj4+IE9uIEZyaSwgTWFyIDI3LCAyMDIwIGF0IDI6MTUgUE0gQW5keSBTaGV2Y2hlbmtvCj4+
Pj4gPGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4+Pj4+IE9uIEZy
aSwgTWFyIDI3LCAyMDIwIGF0IDAzOjEwOjI2UE0gKzAyMDAsIEFuZHkgU2hldmNoZW5rbyB3cm90
ZToKPj4+Pj4+IE9uIEZyaSwgTWFyIDI3LCAyMDIwIGF0IDAxOjU0OjMzUE0gKzAxMDAsIEFybmQg
QmVyZ21hbm4gd3JvdGU6Cj4+Pj4+Pj4gT24gRnJpLCBNYXIgMjcsIDIwMjAgYXQgMToxMiBQTSBN
aWNoYWwgU2ltZWsgPG1pY2hhbC5zaW1la0B4aWxpbnguY29tPiB3cm90ZToKPj4+IC4uLgo+Pj4K
Pj4+Pj4+PiBJdCBkb2VzIHJhaXNlIGEgZm9sbG93LXVwIHF1ZXN0aW9uIGFib3V0IHBwYzQweCB0
aG91Z2g6IGlzIGl0IHRpbWUgdG8KPj4+Pj4+PiByZXRpcmUgYWxsIG9mIGl0Pwo+Pj4+Pj4KPj4+
Pj4+IFdobyBrbm93cz8KPj4+Pj4+Cj4+Pj4+PiBJIGhhdmUgaW4gcG9zc2Vzc2lvbiBuaWNlIFdE
IE15IEJvb2sgTGl2ZSwgYmFzZWQgb24gdGhpcyBhcmNoaXRlY3R1cmUsIGFuZCBJCj4+Pj4+PiB3
b24ndCBpdCBnb25lIGZyb20gbW9kZXJuIGtlcm5lbCBzdXBwb3J0LiBPVE9IIEkgdW5kZXJzdGFu
ZCB0aGF0IGFtb3VudCBvZiByZWFsCj4+Pj4+PiB1c2VycyBub3QgdG9vIGJpZy4KPj4+Pj4KPj4+
Pj4gK0NjOiBDaHJpc3RpYW4gTGFtcGFydGVyLCB3aG9tIEkgb3dlIGZvciB0aGF0IFdEIGJveC4K
Pj4+Pgo+Pj4+IEFjY29yZGluZyB0byBodHRwczovL29wZW53cnQub3JnL3RvaC93ZC9teWJvb2ts
aXZlLCB0aGF0IG9uZSBpcyBiYXNlZCBvbgo+Pj4+IEFQTTgyMTgxL3BwYzQ2NCwgc28gaXQgaXMg
YWJvdXQgc2V2ZXJhbCBnZW5lcmF0aW9ucyBuZXdlciB0aGFuIHdoYXQgSQo+Pj4+IGFza2VkIGFi
b3V0IChwcGM0MHgpLgo+Pj4+Cj4+Pj4+PiBBaCwgYW5kIEkgaGF2ZSBBbWlnYSBib2FyZCwgYnV0
IHRoYXQgb25lIGlzIGJlaW5nIHVzZWQgb25seSBmb3IgdGVzdGluZywgc28sCj4+Pj4+PiBJIGRv
bid0IGNhcmUgbXVjaC4KPj4+Pgo+Pj4+IEkgdGhpbmsgdGhlcmUgYXJlIGEgY291cGxlIG9mIHBw
YzQ0MCBiYXNlZCBBbWlnYSBib2FyZHMsIGJ1dCBhZ2Fpbiwgbm90IDQwNQo+Pj4+IHRvIG15IGtu
b3dsZWRnZS4KPj4+Cj4+PiBBaCwgeW91IGFyZSByaWdodC4gTm8gb2JqZWN0aW9ucyBmcm9tIHBw
YzQweCByZW1vdmFsIQo+Pgo+PiBSZW1vdmluZyA0MHggd291bGQgaGVscCBjbGVhbmluZyB0aGlu
Z3MgYSBiaXQuIEZvciBpbnN0YW5jZSA0MHggaXMgdGhlCj4+IGxhc3QgcGxhdGZvcm0gc3RpbGwg
aGF2aW5nIFBURV9BVE9NSUNfVVBEQVRFUy4gU28gaWYgd2UgY2FuIHJlbW92ZSA0MHgKPj4gd2Ug
Y2FuIGdldCByaWQgb2YgUFRFX0FUT01JQ19VUERBVEVTIGNvbXBsZXRlbHkuCj4+Cj4+IElmIG5v
IG9uZSBvYmplY3RzLCBJIGNhbiBwcmVwYXJlIGEgc2VyaWVzIHRvIGRyb3Agc3VwcG9ydCBmb3Ig
NDB4Cj4+IGNvbXBsZXRlbHkuCj4+Cj4+IE1pY2hhZWwsIGFueSB0aG91Z2h0ID8KPiAKPiBJIGhh
dmUgbm8gYXR0YWNobWVudCB0byA0MHgsIGFuZCBJJ2QgY2VydGFpbmx5IGJlIGhhcHB5IHRvIGhh
dmUgbGVzcwo+IGNvZGUgaW4gdGhlIHRyZWUsIHdlIHN0cnVnZ2xlIHRvIGtlZXAgZXZlbiB0aGUg
bW9kZXJuIHBsYXRmb3JtcyB3ZWxsCj4gbWFpbnRhaW5lZC4KPiAKPiBBdCB0aGUgc2FtZSB0aW1l
IEkgZG9uJ3Qgd2FudCB0byByZW5kZXIgYW55b25lJ3MgaGFyZHdhcmUgb2Jzb2xldGUKPiB1bm5l
Y2Vzc2FyaWx5LiBCdXQgaWYgdGhlcmUncyByZWFsbHkgbm8gb25lIHVzaW5nIDQweCB0aGVuIHdl
IHNob3VsZAo+IHJlbW92ZSBpdCwgaXQgY291bGQgd2VsbCBiZSBicm9rZW4gYWxyZWFkeS4KPiAK
PiBTbyBJIGd1ZXNzIHBvc3QgYSBzZXJpZXMgdG8gZG8gdGhlIHJlbW92YWwgYW5kIHdlJ2xsIHNl
ZSBpZiBhbnlvbmUKPiBzcGVha3MgdXAuCj4gCgpPaywgc2VyaWVzIHNlbnQgb3V0LCBzZWUgCmh0
dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9saW51eHBwYy1kZXYvbGlzdC8/c2Vy
aWVzPTE2Nzc1NwoKCldoaWxlIHdlIGFyZSBhdCBpdCwgY2FuIHdlIGFsc28gcmVtb3ZlIHRoZSA2
MDEgPyBUaGlzIG9uZSBpcyBhbHNvIGZ1bGwgCm9mIHdvcmthcm91bmRzIGFuZCBkaXZlcmdlcyBh
IGJpdCBmcm9tIG90aGVyIDZ4eC4KCkknbSB1bmFibGUgdG8gZmluZCBpdHMgZW5kIG9mIGxpZmUg
ZGF0ZSwgYnV0IGl0IHdhcyBvbiB0aGUgbWFya2V0IGluIAoxOTk0LCBzbyBJIGd1ZXNzIGl0IG11
c3QgYmUgb3V0ZGF0ZWQgYnkgbW9yZSB0aGFuIDEwLTE1IHlyIG9sZCBub3cgPwoKQ2hyaXN0b3Bo
ZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
