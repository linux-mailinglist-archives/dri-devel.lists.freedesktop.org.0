Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9E919A5DF
	for <lists+dri-devel@lfdr.de>; Wed,  1 Apr 2020 09:04:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DCF56E8F7;
	Wed,  1 Apr 2020 07:04:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88CE36E542
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 07:20:04 +0000 (UTC)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48s11Y6fV3z9tyhY;
 Tue, 31 Mar 2020 09:20:01 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=tkse4wf5; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id ZrkTbL7_Ux86; Tue, 31 Mar 2020 09:20:01 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48s11Y5CJZz9tyhV;
 Tue, 31 Mar 2020 09:20:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1585639201; bh=BB2WAnR/RfA1f4Xoybmw0xokvJpghbjoh9sqycNr04c=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=tkse4wf5SpLn1GDdrvqyQylNxwZ4FqL1qATv602lU3gfO/TC7PzG+pT9caHFWpjVc
 gU4koLC0X4296XGphEDC310yYUl0j9pe/ocy7Vs/jqST78Cxq8T05ws/t0rvszVHVY
 FAYTcCfM2hZEFhmdht0cCGjZ51OXvS3xorw9y7lM=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7C1688B787;
 Tue, 31 Mar 2020 09:20:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id HPnYfWf4OHLz; Tue, 31 Mar 2020 09:20:02 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4B1E08B752;
 Tue, 31 Mar 2020 09:19:57 +0200 (CEST)
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
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <a1212105-3894-c282-0f1e-a1ac9a35cd4e@c-s.fr>
Date: Tue, 31 Mar 2020 09:19:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <adb18d3b-fd30-c328-cedd-bac5d8611fa2@xilinx.com>
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
 Takashi Iwai <tiwai@suse.com>, YueHaibing <yuehaibing@huawei.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
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

CgpMZSAzMS8wMy8yMDIwIMOgIDA4OjU5LCBNaWNoYWwgU2ltZWsgYSDDqWNyaXTCoDoKPiBPbiAz
MS4gMDMuIDIwIDg6NTYsIENocmlzdG9waGUgTGVyb3kgd3JvdGU6Cj4+Cj4+Cj4+IExlIDMxLzAz
LzIwMjAgw6AgMDc6MzAsIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoKPj4+IENocmlzdG9w
aGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAYy1zLmZyPiB3cml0ZXM6Cj4+Pj4gTGUgMjcvMDMv
MjAyMCDDoCAxNToxNCwgQW5keSBTaGV2Y2hlbmtvIGEgw6ljcml0wqA6Cj4+Pj4+IE9uIEZyaSwg
TWFyIDI3LCAyMDIwIGF0IDAyOjIyOjU1UE0gKzAxMDAsIEFybmQgQmVyZ21hbm4gd3JvdGU6Cj4+
Pj4+PiBPbiBGcmksIE1hciAyNywgMjAyMCBhdCAyOjE1IFBNIEFuZHkgU2hldmNoZW5rbwo+Pj4+
Pj4gPGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6Cj4+Pj4+Pj4gT24g
RnJpLCBNYXIgMjcsIDIwMjAgYXQgMDM6MTA6MjZQTSArMDIwMCwgQW5keSBTaGV2Y2hlbmtvIHdy
b3RlOgo+Pj4+Pj4+PiBPbiBGcmksIE1hciAyNywgMjAyMCBhdCAwMTo1NDozM1BNICswMTAwLCBB
cm5kIEJlcmdtYW5uIHdyb3RlOgo+Pj4+Pj4+Pj4gT24gRnJpLCBNYXIgMjcsIDIwMjAgYXQgMTox
MiBQTSBNaWNoYWwgU2ltZWsKPj4+Pj4+Pj4+IDxtaWNoYWwuc2ltZWtAeGlsaW54LmNvbT4gd3Jv
dGU6Cj4+Pj4+IC4uLgo+Pj4+Pgo+Pj4+Pj4+Pj4gSXQgZG9lcyByYWlzZSBhIGZvbGxvdy11cCBx
dWVzdGlvbiBhYm91dCBwcGM0MHggdGhvdWdoOiBpcyBpdAo+Pj4+Pj4+Pj4gdGltZSB0bwo+Pj4+
Pj4+Pj4gcmV0aXJlIGFsbCBvZiBpdD8KPj4+Pj4+Pj4KPj4+Pj4+Pj4gV2hvIGtub3dzPwo+Pj4+
Pj4+Pgo+Pj4+Pj4+PiBJIGhhdmUgaW4gcG9zc2Vzc2lvbiBuaWNlIFdEIE15IEJvb2sgTGl2ZSwg
YmFzZWQgb24gdGhpcwo+Pj4+Pj4+PiBhcmNoaXRlY3R1cmUsIGFuZCBJCj4+Pj4+Pj4+IHdvbid0
IGl0IGdvbmUgZnJvbSBtb2Rlcm4ga2VybmVsIHN1cHBvcnQuIE9UT0ggSSB1bmRlcnN0YW5kIHRo
YXQKPj4+Pj4+Pj4gYW1vdW50IG9mIHJlYWwKPj4+Pj4+Pj4gdXNlcnMgbm90IHRvbyBiaWcuCj4+
Pj4+Pj4KPj4+Pj4+PiArQ2M6IENocmlzdGlhbiBMYW1wYXJ0ZXIsIHdob20gSSBvd2UgZm9yIHRo
YXQgV0QgYm94Lgo+Pj4+Pj4KPj4+Pj4+IEFjY29yZGluZyB0byBodHRwczovL29wZW53cnQub3Jn
L3RvaC93ZC9teWJvb2tsaXZlLCB0aGF0IG9uZSBpcwo+Pj4+Pj4gYmFzZWQgb24KPj4+Pj4+IEFQ
TTgyMTgxL3BwYzQ2NCwgc28gaXQgaXMgYWJvdXQgc2V2ZXJhbCBnZW5lcmF0aW9ucyBuZXdlciB0
aGFuIHdoYXQgSQo+Pj4+Pj4gYXNrZWQgYWJvdXQgKHBwYzQweCkuCj4+Pj4+Pgo+Pj4+Pj4+PiBB
aCwgYW5kIEkgaGF2ZSBBbWlnYSBib2FyZCwgYnV0IHRoYXQgb25lIGlzIGJlaW5nIHVzZWQgb25s
eSBmb3IKPj4+Pj4+Pj4gdGVzdGluZywgc28sCj4+Pj4+Pj4+IEkgZG9uJ3QgY2FyZSBtdWNoLgo+
Pj4+Pj4KPj4+Pj4+IEkgdGhpbmsgdGhlcmUgYXJlIGEgY291cGxlIG9mIHBwYzQ0MCBiYXNlZCBB
bWlnYSBib2FyZHMsIGJ1dCBhZ2FpbiwKPj4+Pj4+IG5vdCA0MDUKPj4+Pj4+IHRvIG15IGtub3ds
ZWRnZS4KPj4+Pj4KPj4+Pj4gQWgsIHlvdSBhcmUgcmlnaHQuIE5vIG9iamVjdGlvbnMgZnJvbSBw
cGM0MHggcmVtb3ZhbCEKPj4+Pgo+Pj4+IFJlbW92aW5nIDQweCB3b3VsZCBoZWxwIGNsZWFuaW5n
IHRoaW5ncyBhIGJpdC4gRm9yIGluc3RhbmNlIDQweCBpcyB0aGUKPj4+PiBsYXN0IHBsYXRmb3Jt
IHN0aWxsIGhhdmluZyBQVEVfQVRPTUlDX1VQREFURVMuIFNvIGlmIHdlIGNhbiByZW1vdmUgNDB4
Cj4+Pj4gd2UgY2FuIGdldCByaWQgb2YgUFRFX0FUT01JQ19VUERBVEVTIGNvbXBsZXRlbHkuCj4+
Pj4KPj4+PiBJZiBubyBvbmUgb2JqZWN0cywgSSBjYW4gcHJlcGFyZSBhIHNlcmllcyB0byBkcm9w
IHN1cHBvcnQgZm9yIDQweAo+Pj4+IGNvbXBsZXRlbHkuCj4+Pj4KPj4+PiBNaWNoYWVsLCBhbnkg
dGhvdWdodCA/Cj4+Pgo+Pj4gSSBoYXZlIG5vIGF0dGFjaG1lbnQgdG8gNDB4LCBhbmQgSSdkIGNl
cnRhaW5seSBiZSBoYXBweSB0byBoYXZlIGxlc3MKPj4+IGNvZGUgaW4gdGhlIHRyZWUsIHdlIHN0
cnVnZ2xlIHRvIGtlZXAgZXZlbiB0aGUgbW9kZXJuIHBsYXRmb3JtcyB3ZWxsCj4+PiBtYWludGFp
bmVkLgo+Pj4KPj4+IEF0IHRoZSBzYW1lIHRpbWUgSSBkb24ndCB3YW50IHRvIHJlbmRlciBhbnlv
bmUncyBoYXJkd2FyZSBvYnNvbGV0ZQo+Pj4gdW5uZWNlc3NhcmlseS4gQnV0IGlmIHRoZXJlJ3Mg
cmVhbGx5IG5vIG9uZSB1c2luZyA0MHggdGhlbiB3ZSBzaG91bGQKPj4+IHJlbW92ZSBpdCwgaXQg
Y291bGQgd2VsbCBiZSBicm9rZW4gYWxyZWFkeS4KPj4+Cj4+PiBTbyBJIGd1ZXNzIHBvc3QgYSBz
ZXJpZXMgdG8gZG8gdGhlIHJlbW92YWwgYW5kIHdlJ2xsIHNlZSBpZiBhbnlvbmUKPj4+IHNwZWFr
cyB1cC4KPj4+Cj4+Cj4+IE9rLCBzZXJpZXMgc2VudCBvdXQsIHNlZQo+PiBodHRwczovL3BhdGNo
d29yay5vemxhYnMub3JnL3Byb2plY3QvbGludXhwcGMtZGV2L2xpc3QvP3Nlcmllcz0xNjc3NTcK
PiAKPiBvay4gSSBzZWUgeW91IGhhdmUgZG9uZSBpdCBjb21wbGV0ZWx5IGluZGVwZW5kZW50bHkg
b2YgbXkgcGF0Y2hzZXQuCj4gV291bGQgYmUgYmV0dGVyIGlmIHlvdSBjYW4gYmFzZSBpdCBvbiB0
aGUgdG9wIG9mIG15IDIgcGF0Y2hlcyBiZWNhdXNlCj4gdGhleSBhcmUgaW4gY29uZmxpY3Qgbm93
IGFuZCBJIG5lZWQgdG8gYWxzbyByZW1vdmUgdmlydGV4IDQ0eCBwbGF0Zm9ybQo+IGFsc28gd2l0
aCBhbHNhIGRyaXZlci4KPiAKCkkgY2FuJ3Qgc2VlIHlvdXIgZmlyc3QgcGF0Y2gsIG9ubHkgdGhl
IHNlY29uZCBvbmUgc2hvd3MgdXAgaW4gdGhlIApzZXJpZXMsIHNlZSAKaHR0cHM6Ly9wYXRjaHdv
cmsub3psYWJzLm9yZy9wcm9qZWN0L2xpbnV4cHBjLWRldi9saXN0Lz9zZXJpZXM9MTY3NzU3CgpD
aHJpc3RvcGhlCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
