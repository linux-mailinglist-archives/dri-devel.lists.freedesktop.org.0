Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 639781DE036
	for <lists+dri-devel@lfdr.de>; Fri, 22 May 2020 08:56:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B82EF6E33A;
	Fri, 22 May 2020 06:56:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 741 seconds by postgrey-1.36 at gabe;
 Thu, 21 May 2020 10:50:53 UTC
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A2406E16B
 for <dri-devel@lists.freedesktop.org>; Thu, 21 May 2020 10:50:53 +0000 (UTC)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49SR102ZPLz9v0p5;
 Thu, 21 May 2020 12:38:28 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id w7Io9G7iWYwQ; Thu, 21 May 2020 12:38:28 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49SR101Nj3z9v0DQ;
 Thu, 21 May 2020 12:38:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B51A38B786;
 Thu, 21 May 2020 12:38:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id H7PeBhUHP4Cr; Thu, 21 May 2020 12:38:29 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6AF188B778;
 Thu, 21 May 2020 12:38:26 +0200 (CEST)
Subject: Re: [PATCH 0/2] powerpc: Remove support for ppc405/440 Xilinx
 platforms
To: Michael Ellerman <mpe@ellerman.id.au>, Arnd Bergmann <arnd@arndb.de>
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
 <871roykwu6.fsf@mpe.ellerman.id.au>
 <CAK8P3a1XmeeP7FKfNwXZO8cXyJ_U_Jr0kjOaGZ6F=7OcoZ+0nw@mail.gmail.com>
 <87zha17otl.fsf@mpe.ellerman.id.au>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <33b873a8-ded2-4866-fb70-c336fb325923@csgroup.eu>
Date: Thu, 21 May 2020 12:38:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <87zha17otl.fsf@mpe.ellerman.id.au>
Content-Language: fr
X-Mailman-Approved-At: Fri, 22 May 2020 06:56:07 +0000
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
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Allison Randal <allison@lohutok.net>,
 Christophe Leroy <christophe.leroy@c-s.fr>, Michal Simek <monstr@monstr.eu>,
 Wei Hu <weh@microsoft.com>, Christian Lamparter <chunkeey@gmail.com>,
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

CgpMZSAyMS8wNS8yMDIwIMOgIDA5OjAyLCBNaWNoYWVsIEVsbGVybWFuIGEgw6ljcml0wqA6Cj4g
QXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4gd3JpdGVzOgo+PiArT24gV2VkLCBBcHIgOCwg
MjAyMCBhdCAyOjA0IFBNIE1pY2hhZWwgRWxsZXJtYW4gPG1wZUBlbGxlcm1hbi5pZC5hdT4gd3Jv
dGU6Cj4+PiBCZW5qYW1pbiBIZXJyZW5zY2htaWR0IDxiZW5oQGtlcm5lbC5jcmFzaGluZy5vcmc+
IHdyaXRlczoKPj4+PiBPbiBGcmksIDIwMjAtMDQtMDMgYXQgMTU6NTkgKzExMDAsIE1pY2hhZWwg
RWxsZXJtYW4gd3JvdGU6Cj4+Pj4+IEJlbmphbWluIEhlcnJlbnNjaG1pZHQgPGJlbmhAa2VybmVs
LmNyYXNoaW5nLm9yZz4gd3JpdGVzOgo+Pj4+IElCTSBzdGlsbCBwdXQgNDB4IGNvcmVzIGluc2lk
ZSBQT1dFUiBjaGlwcyBubyA/Cj4+Pgo+Pj4gT2ggeWVhaCB0aGF0J3MgdHJ1ZS4gSSBndWVzcyBt
b3N0IGZvbGtzIGRvbid0IGtub3cgdGhhdCwgb3IgdGhhdCB0aGV5Cj4+PiBydW4gUkhFTCBvbiB0
aGVtLgo+Pgo+PiBJcyB0aGVyZSBhIHJlYXNvbiBmb3Igbm90IGhhdmluZyB0aG9zZSBkdHMgZmls
ZXMgaW4gbWFpbmxpbmUgdGhlbj8KPj4gSWYgbm90aGluZyBlbHNlLCBpdCB3b3VsZCBkb2N1bWVu
dCB3aGF0IG1hY2hpbmVzIGFyZSBzdGlsbCBiZWluZwo+PiB1c2VkIHdpdGggZnV0dXJlIGtlcm5l
bHMuCj4gCj4gU29ycnkgdGhhdCBwYXJ0IHdhcyBhIGpva2UgOkQgIFRob3NlIGNoaXBzIGRvbid0
IHJ1biBMaW51eC4KPiAKCk5pY2UgdG8ga25vdyA6KQoKV2hhdCdzIHRoZSBwbGFuIHRoZW4sIGRv
IHdlIHN0aWxsIHdhbnQgdG8ga2VlcCA0MHggaW4gdGhlIGtlcm5lbCA/CgpJZiB5ZXMsIGlzIGl0
IG9rIHRvIGRyb3AgdGhlIG9sZGllcyBhbnl3YXkgYXMgZG9uZSBpbiBteSBzZXJpZXMgCmh0dHBz
Oi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9saW51eHBwYy1kZXYvbGlzdC8/c2VyaWVz
PTE3MjYzMCA/CgooTm90ZSB0aGF0IHRoaXMgc2VyaWVzIHdpbGwgY29uZmxpY3Qgd2l0aCBteSBz
ZXJpZXMgb24gaHVnZXBhZ2VzIG9uIDh4eCAKZHVlIHRvIHRoZSBQVEVfQVRPTUlDX1VQREFURVMg
c3R1ZmYuIEkgY2FuIHJlYmFzZSB0aGUgNDB4IG1vZGVybmlzYXRpb24gCnNlcmllcyBvbiB0b3Ag
b2YgdGhlIDh4eCBodWdlcGFnZXMgc2VyaWVzIGlmIGl0IGlzIHdvcnRoIGl0KQoKQ2hyaXN0b3Bo
ZQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
