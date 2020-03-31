Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1623819A5E2
	for <lists+dri-devel@lfdr.de>; Wed,  1 Apr 2020 09:04:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBA116E8FA;
	Wed,  1 Apr 2020 07:04:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56BDF6E5CD
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 09:50:01 +0000 (UTC)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48s4LZ3yKVz9tyZr;
 Tue, 31 Mar 2020 11:49:58 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=aQVEWiyu; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Cf4WW0wpLDfA; Tue, 31 Mar 2020 11:49:58 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48s4LZ28L2z9tyZp;
 Tue, 31 Mar 2020 11:49:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1585648198; bh=srXrYqzCH1hg+g0wk4ykKq94x2QKEpPXQgB3s6+yOa0=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=aQVEWiyuhGXssJQHYsDKM9lJ0zwWFlpR1SfeFies4tbleoUBJ0aaIx3OLZOCURDgm
 cjvcWpeFWNM0XTKg5T6t8GqKHugZs9Ho3NWXDyHrHu322TjowMK/3zb6Dj92t55nY6
 oYONjLE8jpJCRglIEf8V8NlGsPcvimvJ2w6bE6Hw=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 692CE8B78B;
 Tue, 31 Mar 2020 11:49:59 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id EQVaQ7Bcutlk; Tue, 31 Mar 2020 11:49:59 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3BC348B752;
 Tue, 31 Mar 2020 11:49:54 +0200 (CEST)
Subject: Re: [PATCH 0/2] powerpc: Remove support for ppc405/440 Xilinx
 platforms
From: Christophe Leroy <christophe.leroy@c-s.fr>
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
Message-ID: <12a1f423-7e54-6423-1c8c-33e221664272@c-s.fr>
Date: Tue, 31 Mar 2020 11:49:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <a1212105-3894-c282-0f1e-a1ac9a35cd4e@c-s.fr>
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

CgpMZSAzMS8wMy8yMDIwIMOgIDA5OjE5LCBDaHJpc3RvcGhlIExlcm95IGEgw6ljcml0wqA6Cj4g
Cj4gCj4gTGUgMzEvMDMvMjAyMCDDoCAwODo1OSwgTWljaGFsIFNpbWVrIGEgw6ljcml0wqA6Cj4+
IE9uIDMxLiAwMy4gMjAgODo1NiwgQ2hyaXN0b3BoZSBMZXJveSB3cm90ZToKPj4+Cj4+Pgo+Pj4g
TGUgMzEvMDMvMjAyMCDDoCAwNzozMCwgTWljaGFlbCBFbGxlcm1hbiBhIMOpY3JpdMKgOgo+Pj4+
IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAYy1zLmZyPiB3cml0ZXM6Cj4+Pj4+
IExlIDI3LzAzLzIwMjAgw6AgMTU6MTQsIEFuZHkgU2hldmNoZW5rbyBhIMOpY3JpdMKgOgo+Pj4+
Pj4gT24gRnJpLCBNYXIgMjcsIDIwMjAgYXQgMDI6MjI6NTVQTSArMDEwMCwgQXJuZCBCZXJnbWFu
biB3cm90ZToKPj4+Pj4+PiBPbiBGcmksIE1hciAyNywgMjAyMCBhdCAyOjE1IFBNIEFuZHkgU2hl
dmNoZW5rbwo+Pj4+Pj4+IDxhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+IHdyb3Rl
Ogo+Pj4+Pj4+PiBPbiBGcmksIE1hciAyNywgMjAyMCBhdCAwMzoxMDoyNlBNICswMjAwLCBBbmR5
IFNoZXZjaGVua28gd3JvdGU6Cj4+Pj4+Pj4+PiBPbiBGcmksIE1hciAyNywgMjAyMCBhdCAwMTo1
NDozM1BNICswMTAwLCBBcm5kIEJlcmdtYW5uIHdyb3RlOgo+Pj4+Pj4+Pj4+IE9uIEZyaSwgTWFy
IDI3LCAyMDIwIGF0IDE6MTIgUE0gTWljaGFsIFNpbWVrCj4+Pj4+Pj4+Pj4gPG1pY2hhbC5zaW1l
a0B4aWxpbnguY29tPiB3cm90ZToKPj4+Pj4+IC4uLgo+Pj4+Pj4KPj4+Pj4+Pj4+PiBJdCBkb2Vz
IHJhaXNlIGEgZm9sbG93LXVwIHF1ZXN0aW9uIGFib3V0IHBwYzQweCB0aG91Z2g6IGlzIGl0Cj4+
Pj4+Pj4+Pj4gdGltZSB0bwo+Pj4+Pj4+Pj4+IHJldGlyZSBhbGwgb2YgaXQ/Cj4+Pj4+Pj4+Pgo+
Pj4+Pj4+Pj4gV2hvIGtub3dzPwo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IEkgaGF2ZSBpbiBwb3NzZXNz
aW9uIG5pY2UgV0QgTXkgQm9vayBMaXZlLCBiYXNlZCBvbiB0aGlzCj4+Pj4+Pj4+PiBhcmNoaXRl
Y3R1cmUsIGFuZCBJCj4+Pj4+Pj4+PiB3b24ndCBpdCBnb25lIGZyb20gbW9kZXJuIGtlcm5lbCBz
dXBwb3J0LiBPVE9IIEkgdW5kZXJzdGFuZCB0aGF0Cj4+Pj4+Pj4+PiBhbW91bnQgb2YgcmVhbAo+
Pj4+Pj4+Pj4gdXNlcnMgbm90IHRvbyBiaWcuCj4+Pj4+Pj4+Cj4+Pj4+Pj4+ICtDYzogQ2hyaXN0
aWFuIExhbXBhcnRlciwgd2hvbSBJIG93ZSBmb3IgdGhhdCBXRCBib3guCj4+Pj4+Pj4KPj4+Pj4+
PiBBY2NvcmRpbmcgdG8gaHR0cHM6Ly9vcGVud3J0Lm9yZy90b2gvd2QvbXlib29rbGl2ZSwgdGhh
dCBvbmUgaXMKPj4+Pj4+PiBiYXNlZCBvbgo+Pj4+Pj4+IEFQTTgyMTgxL3BwYzQ2NCwgc28gaXQg
aXMgYWJvdXQgc2V2ZXJhbCBnZW5lcmF0aW9ucyBuZXdlciB0aGFuIAo+Pj4+Pj4+IHdoYXQgSQo+
Pj4+Pj4+IGFza2VkIGFib3V0IChwcGM0MHgpLgo+Pj4+Pj4+Cj4+Pj4+Pj4+PiBBaCwgYW5kIEkg
aGF2ZSBBbWlnYSBib2FyZCwgYnV0IHRoYXQgb25lIGlzIGJlaW5nIHVzZWQgb25seSBmb3IKPj4+
Pj4+Pj4+IHRlc3RpbmcsIHNvLAo+Pj4+Pj4+Pj4gSSBkb24ndCBjYXJlIG11Y2guCj4+Pj4+Pj4K
Pj4+Pj4+PiBJIHRoaW5rIHRoZXJlIGFyZSBhIGNvdXBsZSBvZiBwcGM0NDAgYmFzZWQgQW1pZ2Eg
Ym9hcmRzLCBidXQgYWdhaW4sCj4+Pj4+Pj4gbm90IDQwNQo+Pj4+Pj4+IHRvIG15IGtub3dsZWRn
ZS4KPj4+Pj4+Cj4+Pj4+PiBBaCwgeW91IGFyZSByaWdodC4gTm8gb2JqZWN0aW9ucyBmcm9tIHBw
YzQweCByZW1vdmFsIQo+Pj4+Pgo+Pj4+PiBSZW1vdmluZyA0MHggd291bGQgaGVscCBjbGVhbmlu
ZyB0aGluZ3MgYSBiaXQuIEZvciBpbnN0YW5jZSA0MHggaXMgdGhlCj4+Pj4+IGxhc3QgcGxhdGZv
cm0gc3RpbGwgaGF2aW5nIFBURV9BVE9NSUNfVVBEQVRFUy4gU28gaWYgd2UgY2FuIHJlbW92ZSA0
MHgKPj4+Pj4gd2UgY2FuIGdldCByaWQgb2YgUFRFX0FUT01JQ19VUERBVEVTIGNvbXBsZXRlbHku
Cj4+Pj4+Cj4+Pj4+IElmIG5vIG9uZSBvYmplY3RzLCBJIGNhbiBwcmVwYXJlIGEgc2VyaWVzIHRv
IGRyb3Agc3VwcG9ydCBmb3IgNDB4Cj4+Pj4+IGNvbXBsZXRlbHkuCj4+Pj4+Cj4+Pj4+IE1pY2hh
ZWwsIGFueSB0aG91Z2h0ID8KPj4+Pgo+Pj4+IEkgaGF2ZSBubyBhdHRhY2htZW50IHRvIDQweCwg
YW5kIEknZCBjZXJ0YWlubHkgYmUgaGFwcHkgdG8gaGF2ZSBsZXNzCj4+Pj4gY29kZSBpbiB0aGUg
dHJlZSwgd2Ugc3RydWdnbGUgdG8ga2VlcCBldmVuIHRoZSBtb2Rlcm4gcGxhdGZvcm1zIHdlbGwK
Pj4+PiBtYWludGFpbmVkLgo+Pj4+Cj4+Pj4gQXQgdGhlIHNhbWUgdGltZSBJIGRvbid0IHdhbnQg
dG8gcmVuZGVyIGFueW9uZSdzIGhhcmR3YXJlIG9ic29sZXRlCj4+Pj4gdW5uZWNlc3NhcmlseS4g
QnV0IGlmIHRoZXJlJ3MgcmVhbGx5IG5vIG9uZSB1c2luZyA0MHggdGhlbiB3ZSBzaG91bGQKPj4+
PiByZW1vdmUgaXQsIGl0IGNvdWxkIHdlbGwgYmUgYnJva2VuIGFscmVhZHkuCj4+Pj4KPj4+PiBT
byBJIGd1ZXNzIHBvc3QgYSBzZXJpZXMgdG8gZG8gdGhlIHJlbW92YWwgYW5kIHdlJ2xsIHNlZSBp
ZiBhbnlvbmUKPj4+PiBzcGVha3MgdXAuCj4+Pj4KPj4+Cj4+PiBPaywgc2VyaWVzIHNlbnQgb3V0
LCBzZWUKPj4+IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9saW51eHBwYy1k
ZXYvbGlzdC8/c2VyaWVzPTE2Nzc1Nwo+Pgo+PiBvay4gSSBzZWUgeW91IGhhdmUgZG9uZSBpdCBj
b21wbGV0ZWx5IGluZGVwZW5kZW50bHkgb2YgbXkgcGF0Y2hzZXQuCj4+IFdvdWxkIGJlIGJldHRl
ciBpZiB5b3UgY2FuIGJhc2UgaXQgb24gdGhlIHRvcCBvZiBteSAyIHBhdGNoZXMgYmVjYXVzZQo+
PiB0aGV5IGFyZSBpbiBjb25mbGljdCBub3cgYW5kIEkgbmVlZCB0byBhbHNvIHJlbW92ZSB2aXJ0
ZXggNDR4IHBsYXRmb3JtCj4+IGFsc28gd2l0aCBhbHNhIGRyaXZlci4KPj4KPiAKPiBJIGNhbid0
IHNlZSB5b3VyIGZpcnN0IHBhdGNoLCBvbmx5IHRoZSBzZWNvbmQgb25lIHNob3dzIHVwIGluIHRo
ZSAKPiBzZXJpZXMsIHNlZSAKPiBodHRwczovL3BhdGNod29yay5vemxhYnMub3JnL3Byb2plY3Qv
bGludXhwcGMtZGV2L2xpc3QvP3Nlcmllcz0xNjc3NTcKPiAKCgpPaywgSSBmb3VuZCB5b3VyIGZp
cnN0IHBhdGNoIG9uIGFub3RoZXIgcGF0Y2h3b3JrLCBpdCBkb2Vzbid0IHRvdWNoIGFueSAKZmls
ZSBpbiBhcmNoL3Bvd2VycGMvCgpJIHNlbnQgYSB2MiBzZXJpZXMgd2l0aCB5b3VyIHBvd2VycGMg
cGF0Y2ggYXMgcGF0Y2ggMi8xMQoKU2VlIGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJv
amVjdC9saW51eHBwYy1kZXYvbGlzdC8/c2VyaWVzPTE2Nzc2NgoKQ2hyaXN0b3BoZQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
