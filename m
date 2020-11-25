Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C762C3AA6
	for <lists+dri-devel@lfdr.de>; Wed, 25 Nov 2020 09:13:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F33C96E861;
	Wed, 25 Nov 2020 08:12:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 852 seconds by postgrey-1.36 at gabe;
 Wed, 25 Nov 2020 06:51:06 UTC
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC7BA6E82F
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Nov 2020 06:51:06 +0000 (UTC)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CgrlQ4mv8z9v4Wm;
 Wed, 25 Nov 2020 07:36:50 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 9WOu8jrGC870; Wed, 25 Nov 2020 07:36:50 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CgrlQ2P6pz9v1VN;
 Wed, 25 Nov 2020 07:36:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0A3DF8B7C1;
 Wed, 25 Nov 2020 07:36:51 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id NyjcLbCJ2q3z; Wed, 25 Nov 2020 07:36:50 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 710BA8B7B7;
 Wed, 25 Nov 2020 07:36:48 +0100 (CET)
Subject: Re: [PATCH 0/2] powerpc: Remove support for ppc405/440 Xilinx
 platforms
From: Christophe Leroy <christophe.leroy@csgroup.eu>
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
 <33b873a8-ded2-4866-fb70-c336fb325923@csgroup.eu>
Message-ID: <02a27887-55ce-2101-efce-b1236e164f15@csgroup.eu>
Date: Wed, 25 Nov 2020 07:36:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <33b873a8-ded2-4866-fb70-c336fb325923@csgroup.eu>
Content-Language: fr
X-Mailman-Approved-At: Wed, 25 Nov 2020 08:11:52 +0000
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
 YueHaibing <yuehaibing@huawei.com>, Michal Simek <michal.simek@xilinx.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Allison Randal <allison@lohutok.net>,
 Leonardo Bras <leonardo@linux.ibm.com>, DTML <devicetree@vger.kernel.org>,
 Andrew Donnellan <ajd@linux.ibm.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Marc Zyngier <marc.zyngier@arm.com>, Alistair Popple <alistair@popple.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Alexios Zavras <alexios.zavras@intel.com>,
 Mark Brown <broonie@kernel.org>, git@xilinx.com,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Christophe Leroy <christophe.leroy@c-s.fr>, Enrico Weigelt <info@metux.net>,
 Michal Simek <monstr@monstr.eu>, Wei Hu <weh@microsoft.com>,
 Christian Lamparter <chunkeey@gmail.com>,
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

CgpMZSAyMS8wNS8yMDIwIMOgIDEyOjM4LCBDaHJpc3RvcGhlIExlcm95IGEgw6ljcml0wqA6Cj4g
Cj4gCj4gTGUgMjEvMDUvMjAyMCDDoCAwOTowMiwgTWljaGFlbCBFbGxlcm1hbiBhIMOpY3JpdMKg
Ogo+PiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPiB3cml0ZXM6Cj4+PiArT24gV2VkLCBB
cHIgOCwgMjAyMCBhdCAyOjA0IFBNIE1pY2hhZWwgRWxsZXJtYW4gPG1wZUBlbGxlcm1hbi5pZC5h
dT4gd3JvdGU6Cj4+Pj4gQmVuamFtaW4gSGVycmVuc2NobWlkdCA8YmVuaEBrZXJuZWwuY3Jhc2hp
bmcub3JnPiB3cml0ZXM6Cj4+Pj4+IE9uIEZyaSwgMjAyMC0wNC0wMyBhdCAxNTo1OSArMTEwMCwg
TWljaGFlbCBFbGxlcm1hbiB3cm90ZToKPj4+Pj4+IEJlbmphbWluIEhlcnJlbnNjaG1pZHQgPGJl
bmhAa2VybmVsLmNyYXNoaW5nLm9yZz4gd3JpdGVzOgo+Pj4+PiBJQk0gc3RpbGwgcHV0IDQweCBj
b3JlcyBpbnNpZGUgUE9XRVIgY2hpcHMgbm8gPwo+Pj4+Cj4+Pj4gT2ggeWVhaCB0aGF0J3MgdHJ1
ZS4gSSBndWVzcyBtb3N0IGZvbGtzIGRvbid0IGtub3cgdGhhdCwgb3IgdGhhdCB0aGV5Cj4+Pj4g
cnVuIFJIRUwgb24gdGhlbS4KPj4+Cj4+PiBJcyB0aGVyZSBhIHJlYXNvbiBmb3Igbm90IGhhdmlu
ZyB0aG9zZSBkdHMgZmlsZXMgaW4gbWFpbmxpbmUgdGhlbj8KPj4+IElmIG5vdGhpbmcgZWxzZSwg
aXQgd291bGQgZG9jdW1lbnQgd2hhdCBtYWNoaW5lcyBhcmUgc3RpbGwgYmVpbmcKPj4+IHVzZWQg
d2l0aCBmdXR1cmUga2VybmVscy4KPj4KPj4gU29ycnkgdGhhdCBwYXJ0IHdhcyBhIGpva2UgOkTC
oCBUaG9zZSBjaGlwcyBkb24ndCBydW4gTGludXguCj4+Cj4gCj4gTmljZSB0byBrbm93IDopCj4g
Cj4gV2hhdCdzIHRoZSBwbGFuIHRoZW4sIGRvIHdlIHN0aWxsIHdhbnQgdG8ga2VlcCA0MHggaW4g
dGhlIGtlcm5lbCA/Cj4gCj4gSWYgeWVzLCBpcyBpdCBvayB0byBkcm9wIHRoZSBvbGRpZXMgYW55
d2F5IGFzIGRvbmUgaW4gbXkgc2VyaWVzIAo+IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcv
cHJvamVjdC9saW51eHBwYy1kZXYvbGlzdC8/c2VyaWVzPTE3MjYzMCA/Cj4gCj4gKE5vdGUgdGhh
dCB0aGlzIHNlcmllcyB3aWxsIGNvbmZsaWN0IHdpdGggbXkgc2VyaWVzIG9uIGh1Z2VwYWdlcyBv
biA4eHggZHVlIHRvIHRoZSAKPiBQVEVfQVRPTUlDX1VQREFURVMgc3R1ZmYuIEkgY2FuIHJlYmFz
ZSB0aGUgNDB4IG1vZGVybmlzYXRpb24gc2VyaWVzIG9uIHRvcCBvZiB0aGUgOHh4IGh1Z2VwYWdl
cyAKPiBzZXJpZXMgaWYgaXQgaXMgd29ydGggaXQpCj4gCgpEbyB3ZSBzdGlsbCB3YW50IHRvIGtl
ZXAgNDB4IGluIHRoZSBrZXJuZWwgPyBXZSBkb24ndCBldmVuIGhhdmUgYSBydW5uaW5nIDQweCBR
RU1VIG1hY2hpbmUgYXMgZmFyIGFzIApJIGtub3cuCgpJJ20gYXNraW5nIGJlY2F1c2UgSSdkIGxp
a2UgdG8gZHJvcCB0aGUgbm9uIENPTkZJR19WTUFQX1NUQUNLIGNvZGUgdG8gc2ltcGxpZnkgYW5k
IGVhc2Ugc3R1ZmYgKGNvZGUgCnRoYXQgd29ya3Mgd2l0aCB2bWFsbG9jJ2VkIHN0YWNrcyBhbHNv
IHdvcmtzIHdpdGggc3RhY2tzIGluIGxpbmVhciBtZW1vcnkpLCBidXQgSSBjYW4ndCBkbyBpdCAK
YmVjYXVzZSA0MHggZG9lc24ndCBoYXZlIFZNQVBfU1RBQ0sgYW5kIHNob3VsZCBJIGltcGxlbWVu
dCBpdCBmb3IgNDB4LCBJIGhhdmUgdG8gbWVhbnMgdG8gdGVzdCBpdC4KClNvIGl0IHdvdWxkIGVh
c2UgdGhpbmdzIGlmIHdlIGNvdWxkIGRyb3AgNDB4IGNvbXBsZXRlbHksIHVubGVzcyBzb21lb25l
IHRoZXJlIGhhcyBhIDQweCBwbGF0Zm9ybSB0byAKdGVzdCBzdHVmZi4KClRoYW5rcwpDaHJpc3Rv
cGhlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
