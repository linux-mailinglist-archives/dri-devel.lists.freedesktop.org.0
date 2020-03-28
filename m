Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8472019750B
	for <lists+dri-devel@lfdr.de>; Mon, 30 Mar 2020 09:12:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8BAA89F55;
	Mon, 30 Mar 2020 07:11:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1961 seconds by postgrey-1.36 at gabe;
 Sat, 28 Mar 2020 11:50:54 UTC
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A63B66EAD8
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Mar 2020 11:50:54 +0000 (UTC)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48qGRj63y9zB09ZW;
 Sat, 28 Mar 2020 12:18:09 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=kJCrULvp; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Aqeer9tOyAxc; Sat, 28 Mar 2020 12:18:09 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48qGRj4XtLzB09ZR;
 Sat, 28 Mar 2020 12:18:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1585394289; bh=VyBwgOCzEkUZrjyWnViNMulwr9dgKuVbNjydDE7N0r0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=kJCrULvpRXmm5Q3uP6c+IQAHQXHFkw9+Us6HF2mcW2XMH5WBcPUPhSF1avLjMqZTy
 EHlYoMQgjvfXBgtOc9qWFZnCf+4BPtaQRIP6sMw1o97qkggpKN2pDkxdIwj3MdqzMT
 2kv5P4RiMiZFEH9Z8pAGeoajZtpFJdyJEFPBiANM=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C74EE8B76C;
 Sat, 28 Mar 2020 12:18:10 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id UaW4AG2lp2bR; Sat, 28 Mar 2020 12:18:10 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0D1928B75B;
 Sat, 28 Mar 2020 12:18:06 +0100 (CET)
Subject: Re: [PATCH 0/2] powerpc: Remove support for ppc405/440 Xilinx
 platforms
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Michael Ellerman <mpe@ellerman.id.au>
References: <cover.1585311091.git.michal.simek@xilinx.com>
 <CAK8P3a2mKPRFbRE3MWScr9GSiL4cpLg0wqv1Q28XDCZVPWgHfg@mail.gmail.com>
 <20200327131026.GT1922688@smile.fi.intel.com>
 <20200327131531.GU1922688@smile.fi.intel.com>
 <CAK8P3a1Z+ZPTDzgAjdz0a7d85R62BhUqkdEWgrwXh-OnYe6rog@mail.gmail.com>
 <20200327141434.GA1922688@smile.fi.intel.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <b5adcc7a-9d10-d75f-50e3-9c150a7b4989@c-s.fr>
Date: Sat, 28 Mar 2020 12:17:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200327141434.GA1922688@smile.fi.intel.com>
Content-Language: fr
X-Mailman-Approved-At: Mon, 30 Mar 2020 07:11:44 +0000
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

CgpMZSAyNy8wMy8yMDIwIMOgIDE1OjE0LCBBbmR5IFNoZXZjaGVua28gYSDDqWNyaXTCoDoKPiBP
biBGcmksIE1hciAyNywgMjAyMCBhdCAwMjoyMjo1NVBNICswMTAwLCBBcm5kIEJlcmdtYW5uIHdy
b3RlOgo+PiBPbiBGcmksIE1hciAyNywgMjAyMCBhdCAyOjE1IFBNIEFuZHkgU2hldmNoZW5rbwo+
PiA8YW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPiB3cm90ZToKPj4+IE9uIEZyaSwg
TWFyIDI3LCAyMDIwIGF0IDAzOjEwOjI2UE0gKzAyMDAsIEFuZHkgU2hldmNoZW5rbyB3cm90ZToK
Pj4+PiBPbiBGcmksIE1hciAyNywgMjAyMCBhdCAwMTo1NDozM1BNICswMTAwLCBBcm5kIEJlcmdt
YW5uIHdyb3RlOgo+Pj4+PiBPbiBGcmksIE1hciAyNywgMjAyMCBhdCAxOjEyIFBNIE1pY2hhbCBT
aW1layA8bWljaGFsLnNpbWVrQHhpbGlueC5jb20+IHdyb3RlOgo+IAo+IC4uLgo+IAo+Pj4+PiBJ
dCBkb2VzIHJhaXNlIGEgZm9sbG93LXVwIHF1ZXN0aW9uIGFib3V0IHBwYzQweCB0aG91Z2g6IGlz
IGl0IHRpbWUgdG8KPj4+Pj4gcmV0aXJlIGFsbCBvZiBpdD8KPj4+Pgo+Pj4+IFdobyBrbm93cz8K
Pj4+Pgo+Pj4+IEkgaGF2ZSBpbiBwb3NzZXNzaW9uIG5pY2UgV0QgTXkgQm9vayBMaXZlLCBiYXNl
ZCBvbiB0aGlzIGFyY2hpdGVjdHVyZSwgYW5kIEkKPj4+PiB3b24ndCBpdCBnb25lIGZyb20gbW9k
ZXJuIGtlcm5lbCBzdXBwb3J0LiBPVE9IIEkgdW5kZXJzdGFuZCB0aGF0IGFtb3VudCBvZiByZWFs
Cj4+Pj4gdXNlcnMgbm90IHRvbyBiaWcuCj4+Pgo+Pj4gK0NjOiBDaHJpc3RpYW4gTGFtcGFydGVy
LCB3aG9tIEkgb3dlIGZvciB0aGF0IFdEIGJveC4KPj4KPj4gQWNjb3JkaW5nIHRvIGh0dHBzOi8v
b3BlbndydC5vcmcvdG9oL3dkL215Ym9va2xpdmUsIHRoYXQgb25lIGlzIGJhc2VkIG9uCj4+IEFQ
TTgyMTgxL3BwYzQ2NCwgc28gaXQgaXMgYWJvdXQgc2V2ZXJhbCBnZW5lcmF0aW9ucyBuZXdlciB0
aGFuIHdoYXQgSQo+PiBhc2tlZCBhYm91dCAocHBjNDB4KS4KPj4KPj4+PiBBaCwgYW5kIEkgaGF2
ZSBBbWlnYSBib2FyZCwgYnV0IHRoYXQgb25lIGlzIGJlaW5nIHVzZWQgb25seSBmb3IgdGVzdGlu
Zywgc28sCj4+Pj4gSSBkb24ndCBjYXJlIG11Y2guCj4+Cj4+IEkgdGhpbmsgdGhlcmUgYXJlIGEg
Y291cGxlIG9mIHBwYzQ0MCBiYXNlZCBBbWlnYSBib2FyZHMsIGJ1dCBhZ2Fpbiwgbm90IDQwNQo+
PiB0byBteSBrbm93bGVkZ2UuCj4gCj4gQWgsIHlvdSBhcmUgcmlnaHQuIE5vIG9iamVjdGlvbnMg
ZnJvbSBwcGM0MHggcmVtb3ZhbCEKPiAKClJlbW92aW5nIDQweCB3b3VsZCBoZWxwIGNsZWFuaW5n
IHRoaW5ncyBhIGJpdC4gRm9yIGluc3RhbmNlIDQweCBpcyB0aGUgCmxhc3QgcGxhdGZvcm0gc3Rp
bGwgaGF2aW5nIFBURV9BVE9NSUNfVVBEQVRFUy4gU28gaWYgd2UgY2FuIHJlbW92ZSA0MHggCndl
IGNhbiBnZXQgcmlkIG9mIFBURV9BVE9NSUNfVVBEQVRFUyBjb21wbGV0ZWx5LgoKCklmIG5vIG9u
ZSBvYmplY3RzLCBJIGNhbiBwcmVwYXJlIGEgc2VyaWVzIHRvIGRyb3Agc3VwcG9ydCBmb3IgNDB4
IApjb21wbGV0ZWx5LgoKTWljaGFlbCwgYW55IHRob3VnaHQgPwoKQ2hyaXN0b3BoZQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
