Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A161EDDC9
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jun 2020 09:12:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12E586E286;
	Thu,  4 Jun 2020 07:11:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04B6B892B7
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jun 2020 08:13:47 +0000 (UTC)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49cM9z6GlJz9tycK;
 Wed,  3 Jun 2020 10:13:43 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id kZZBBVha9ZBm; Wed,  3 Jun 2020 10:13:43 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49cM9z5B8Xz9tycD;
 Wed,  3 Jun 2020 10:13:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 158828B884;
 Wed,  3 Jun 2020 10:13:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id pnmsigv9jAd0; Wed,  3 Jun 2020 10:13:44 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 86D058B76A;
 Wed,  3 Jun 2020 10:13:42 +0200 (CEST)
Subject: Re: [PATCH v2 0/2] powerpc: Remove support for ppc405/440 Xilinx
 platforms
To: Michal Simek <michal.simek@xilinx.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Takashi Iwai <tiwai@suse.de>
References: <cover.1585575111.git.michal.simek@xilinx.com>
 <87imikufes.fsf@mpe.ellerman.id.au>
 <12db51d6-d848-118e-5ec1-a4172bd47aa4@xilinx.com>
 <87y2rftrx7.fsf@mpe.ellerman.id.au> <s5hk12z4hj5.wl-tiwai@suse.de>
 <02e7f790-b105-de67-799c-0fe065e58320@xilinx.com>
 <c22540fb-1c54-b718-9045-3ee645c30322@monstr.eu>
 <87wo4yerom.fsf@mpe.ellerman.id.au>
 <4b807ebc-8d8f-ad76-f5e2-9ce8410dc70c@xilinx.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <aad5c6c5-b84a-7a6d-3f07-f45dd1dd85d1@csgroup.eu>
Date: Wed, 3 Jun 2020 10:13:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <4b807ebc-8d8f-ad76-f5e2-9ce8410dc70c@xilinx.com>
Content-Language: fr
X-Mailman-Approved-At: Thu, 04 Jun 2020 07:11:42 +0000
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
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-doc@vger.kernel.org,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>, Richard Fontana <rfontana@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Sasha Levin <sashal@kernel.org>, sfr@canb.auug.org.au,
 Jonathan Corbet <corbet@lwn.net>, maz@kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 YueHaibing <yuehaibing@huawei.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Allison Randal <allison@lohutok.net>,
 Matt Porter <mporter@kernel.crashing.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Alistair Popple <alistair@popple.id.au>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>, Alexios Zavras <alexios.zavras@intel.com>,
 Mark Brown <broonie@kernel.org>, git@xilinx.com, linux-fbdev@vger.kernel.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Dmitry Vyukov <dvyukov@google.com>, Christophe Leroy <christophe.leroy@c-s.fr>,
 Wei Hu <weh@microsoft.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Enrico Weigelt <info@metux.net>,
 "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpMZSAwMy8wNi8yMDIwIMOgIDEwOjEwLCBNaWNoYWwgU2ltZWsgYSDDqWNyaXTCoDoKPiBI
aSBNaWNoYWVsLAo+IAo+IE9uIDI2LiAwNS4gMjAgMTU6NDQsIE1pY2hhZWwgRWxsZXJtYW4gd3Jv
dGU6Cj4+IE1pY2hhbCBTaW1layA8bW9uc3RyQG1vbnN0ci5ldT4gd3JpdGVzOgo+Pj4gSGkgTWlj
aGFlbCwKPj4+Cj4+PiBPbiAwMS4gMDQuIDIwIDEzOjMwLCBNaWNoYWwgU2ltZWsgd3JvdGU6Cj4+
Pj4gT24gMDEuIDA0LiAyMCAxMjozOCwgVGFrYXNoaSBJd2FpIHdyb3RlOgo+Pj4+PiBPbiBXZWQs
IDAxIEFwciAyMDIwIDEyOjM1OjE2ICswMjAwLAo+Pj4+PiBNaWNoYWVsIEVsbGVybWFuIHdyb3Rl
Ogo+Pj4+Pj4KPj4+Pj4+IE1pY2hhbCBTaW1layA8bWljaGFsLnNpbWVrQHhpbGlueC5jb20+IHdy
aXRlczoKPj4+Pj4+PiBPbiAwMS4gMDQuIDIwIDQ6MDcsIE1pY2hhZWwgRWxsZXJtYW4gd3JvdGU6
Cj4+Pj4+Pj4+IE1pY2hhbCBTaW1layA8bWljaGFsLnNpbWVrQHhpbGlueC5jb20+IHdyaXRlczoK
Pj4+Pj4+Pj4+IEhpLAo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IHJlY2VudGx5IHdlIHdhbnRlZCB0byB1
cGRhdGUgeGlsaW54IGludGMgZHJpdmVyIGFuZCB3ZSBmb3VuZCB0aGF0IGZ1bmN0aW9uCj4+Pj4+
Pj4+PiB3aGljaCB3ZSB3YW50ZWQgdG8gcmVtb3ZlIGlzIHN0aWxsIHdpcmVkIGJ5IGFuY2llbnQg
WGlsaW54IFBvd2VyUEMKPj4+Pj4+Pj4+IHBsYXRmb3Jtcy4gSGVyZSBpcyB0aGUgdGhyZWFkIGFi
b3V0IGl0Lgo+Pj4+Pj4+Pj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbmV4dC80OGQz
MjMyZC0wZjFkLTQyZWEtMzEwOS1mNDRiYmFiZmEyZThAeGlsaW54LmNvbS8KPj4+Pj4+Pj4+Cj4+
Pj4+Pj4+PiBJIGhhdmUgYmVlbiB0YWxraW5nIGFib3V0IGl0IGludGVybmFsbHkgYW5kIHRoZXJl
IGlzIG5vIGludGVyZXN0IGluIHRoZXNlCj4+Pj4+Pj4+PiBwbGF0Zm9ybXMgYW5kIGl0IGlzIGFs
c28gb3JwaGFuIGZvciBxdWl0ZSBhIGxvbmcgdGltZS4gTm9uZSBpcyByZWFsbHkKPj4+Pj4+Pj4+
IHJ1bm5pbmcvdGVzdGluZyB0aGVzZSBwbGF0Zm9ybXMgcmVndWxhcmx5IHRoYXQncyB3aHkgSSB0
aGluayBpdCBtYWtlcyBzZW5zZQo+Pj4+Pj4+Pj4gdG8gcmVtb3ZlIHRoZW0gYWxzbyB3aXRoIGRy
aXZlcnMgd2hpY2ggYXJlIHNwZWNpZmljIHRvIHRoaXMgcGxhdGZvcm0uCj4+Pj4+Pj4+Pgo+Pj4+
Pj4+Pj4gVS1Cb290IHN1cHBvcnQgd2FzIHJlbW92ZWQgaW4gMjAxNyB3aXRob3V0IGFueWJvZHkg
Y29tcGxhaW4gYWJvdXQgaXQKPj4+Pj4+Pj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9YaWxpbngvdS1i
b290LXhsbngvY29tbWl0Lzk4ZjcwNWM5Y2VmZGZkYmE2MmMwNjk4MjFiYmJhMTAyNzNhMGE4ZWQK
Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBCYXNlZCBvbiBjdXJyZW50IHBwYy9uZXh0Lgo+Pj4+Pj4+Pj4K
Pj4+Pj4+Pj4+IElmIGFueW9uZSBoYXMgYW55IG9iamVjdGlvbiBhYm91dCBpdCwgcGxlYXNlIGxl
dCBtZSBrbm93Lgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBUaGFua3MgZm9yIHRha2luZyB0aGUgdGltZSB0
byBmaW5kIGFsbCB0aGlzIGNvZGUgYW5kIHJlbW92ZSBpdC4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gSSdt
IG5vdCBnb2luZyB0byB0YWtlIHRoaXMgc2VyaWVzIGZvciB2NS43LCBpdCB3YXMgcG9zdGVkIHRv
byBjbG9zZSB0bwo+Pj4+Pj4+PiB0aGUgbWVyZ2Ugd2luZG93LCBhbmQgZG9pbmcgc28gd291bGRu
J3QgZ2l2ZSBwZW9wbGUgbXVjaCB0aW1lIHRvIG9iamVjdCwKPj4+Pj4+Pj4gZXNwZWNpYWxseSBn
aXZlbiBwZW9wbGUgYXJlIGRpc3RyYWN0ZWQgYXQgdGhlIG1vbWVudC4KPj4+Pj4+Pj4KPj4+Pj4+
Pj4gSSdtIGhhcHB5IHRvIHRha2UgaXQgZm9yIHY1LjgsIGFzc3VtaW5nIHRoZXJlJ3Mgbm8gbWFq
b3Igb2JqZWN0aW9ucy4KPj4+Pj4+Pgo+Pj4+Pj4+IFN1cmUuIEp1c3QgdG8gbGV0IHlvdSBrbm93
IENocmlzdG9waGUgTGVyb3kgaW5jbHVkZWQgdGhpcyBwYXRjaCBpbiBoaXMKPj4+Pj4+PiBzZXJp
ZXMgYWJvdXQgcHBjNDA1IHJlbW92YWwuIEl0IHNob3VsZCBiZSB0aGUgc2FtZS4KPj4+Pj4+Pgo+
Pj4+Pj4+IElmIHlvdSBkb24ndCB3YW50IHRvIHRha2UgdGhhdCBhbHNhIHBhdGNoIEkgY2FuIHNl
bmQgaXQgc2VwYXJhdGVseSBhbmQKPj4+Pj4+PiB0aGlzIHBhdGNoIGNhbiBiZSB0YWtlbiBmcm9t
IGhpcyBzZXJpZXMuIEkgZG9uJ3QgcmVhbGx5IG1pbmQgYnV0IHBsZWFzZQo+Pj4+Pj4+IGxldCBt
ZSBrbm93IHdoYXQgd2F5IHlvdSBwcmVmZXIuCj4+Pj4+Pgo+Pj4+Pj4gSXQncyBiZXR0ZXIgdG8g
a2VlcCBpdCBhbGwgdG9nZXRoZXIsIHNvIEknbSBoYXBweSB0YWtlIHRoZSBhbHNhIHBhdGNoIGFz
Cj4+Pj4+PiB3ZWxsLCBpdCdzIGFscmVhZHkgYmVlbiBhY2tlZC4KPj4+Cj4+PiBDYW4geW91IHBs
ZWFzZSB0YWtlIHRoaXMgc2VyaWVzPyBJIGtub3cgdGhhdCB0aGVyZSBpcyB2NSBmcm9tIENocmlz
dG9waGUKPj4+IHdoaWNoIGhhcyB0aGlzIDEvMiBhcyAxLzEzLiBCdXQgSSBuZWVkIHRoaXMgYWxz
YSBwYXRjaCB0b28gYW5kIEkgd291bGQKPj4+IGxpa2UgdG8gY2xvc2UgdGhpcyBiZWNhdXNlIGl0
IGlzIGFyb3VuZCBmb3IgYWxtb3N0IDIgbW9udGhzIGFuZCBub25lCj4+PiByYWlzZWQgYSBjb25j
ZXJuIGFib3V0IHJlbW92aW5nIGp1c3QgdGhlc2UgWGlsaW54IHBsYXRmb3Jtcy4KPj4KPj4gU29y
cnkgSSBtZWFudCB0byByZXBseSB0byB5b3VyIGxhc3QgbWFpbC4KPj4KPj4gSSBoYXZlIENocmlz
dG9waGUncyBzZXJpZXMgaW4gbXkgdGVzdGluZyBicmFuY2gsIHBsYW5uaW5nIGZvciBpdCB0byBi
ZQo+PiBpbiB2NS44Lgo+Pgo+PiBFdmVuIGlmIHRoZSByZXN0IG9mIGhpcyBzZXJpZXMgZG9lc24n
dCBtYWtlIGl0IGZvciBzb21lIHJlYXNvbiwgYXMgeW91Cj4+IHNheSB0aGUgWGlsaW54IHJlbW92
YWwgaXMgdW5jb250cm92ZXJzaWFsIHNvIEknbGwga2VlcCB0aGF0IGluLgo+Pgo+PiBJIGZvcmdv
dCBhYm91dCB0aGUgc291bmQgcGF0Y2gsIEknbGwgcGljayB0aGF0IHVwIGFzIHdlbGwuCj4gCj4g
SSB0b29rIGEgbG9vayBhdCB5b3VyCj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xp
bnV4L2tlcm5lbC9naXQvcG93ZXJwYy9saW51eC5naXQgcmVwbwo+IGFuZCBJIGNhbid0IHNlZSBh
bnkgYnJhbmNoIHdpdGggbXkgcGF0Y2hlcy4KPiBBbHNvIHdhcyBjaGVja2luZyBsaW51eC1uZXh0
IGFuZCBteSBwYXRjaGVzIGFyZSBhbHNvIG5vdCB0aGVyZS4KPiBUaGF0J3Mgd2h5IEkgYW0gY3Vy
aW91cyBpZiB0aGlzIHdpbGwgYmUgZ28gdjUuOCBpbiBNVy4KCkkgc2VlIHRoZW0gaW4gCmh0dHBz
Oi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3Bvd2VycGMvbGludXgu
Z2l0IGluIApuZXh0LXRlc3QgYnJhbmNoLgoKQ2hyaXN0b3BoZQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
