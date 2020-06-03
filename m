Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 759B71EDDC7
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jun 2020 09:12:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76A106E26F;
	Thu,  4 Jun 2020 07:11:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 967C6892CF
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jun 2020 10:52:03 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49cQhG1cflz9sPF;
 Wed,  3 Jun 2020 20:51:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1591181513;
 bh=HEbuUuqzYKRzFAwS9qP/euNBCXXIojtAorAtB55RG+g=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=GI4BOJdI7R9phxlk9/LTfiVhHEoI1zIW/xMxkhszVjxonI1SySK9IBC78y3O/4vDf
 eDoCS1hCFhiIYou6IKgadBDdl5sdOlAMjQC1875eHFGwk92+YhsxEXxQeo65cXx+7q
 w4oK9KvmKJ1GhlrJO3nt+9OXCwfLwm5X2U9SOzYjAbNe0KzJOOKaMq1ONpfm0tBBM3
 fH45gWmBBXN7fZIiP0s3Sgnn2FkHp5kQh4anTXDctIZyBr8OZVRgP+1o8SdAdmUCX0
 gNwbf+nfmQfigEhG0OEKVTeNnYZzewHe51L+YkLeIayUTLrVNDdhXqJak/DOs8mdcD
 LbJXwhVjiT3UA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michal Simek <michal.simek@xilinx.com>, Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH v2 0/2] powerpc: Remove support for ppc405/440 Xilinx
 platforms
In-Reply-To: <aad5c6c5-b84a-7a6d-3f07-f45dd1dd85d1@csgroup.eu>
References: <cover.1585575111.git.michal.simek@xilinx.com>
 <87imikufes.fsf@mpe.ellerman.id.au>
 <12db51d6-d848-118e-5ec1-a4172bd47aa4@xilinx.com>
 <87y2rftrx7.fsf@mpe.ellerman.id.au> <s5hk12z4hj5.wl-tiwai@suse.de>
 <02e7f790-b105-de67-799c-0fe065e58320@xilinx.com>
 <c22540fb-1c54-b718-9045-3ee645c30322@monstr.eu>
 <87wo4yerom.fsf@mpe.ellerman.id.au>
 <4b807ebc-8d8f-ad76-f5e2-9ce8410dc70c@xilinx.com>
 <aad5c6c5-b84a-7a6d-3f07-f45dd1dd85d1@csgroup.eu>
Date: Wed, 03 Jun 2020 20:52:07 +1000
Message-ID: <87wo4oh160.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1PiB3cml0ZXM6Cj4g
SGksCj4KPiBMZSAwMy8wNi8yMDIwIMOgIDEwOjEwLCBNaWNoYWwgU2ltZWsgYSDDqWNyaXTCoDoK
Pj4gSGkgTWljaGFlbCwKPj4gCj4+IE9uIDI2LiAwNS4gMjAgMTU6NDQsIE1pY2hhZWwgRWxsZXJt
YW4gd3JvdGU6Cj4+PiBNaWNoYWwgU2ltZWsgPG1vbnN0ckBtb25zdHIuZXU+IHdyaXRlczoKPj4+
PiBIaSBNaWNoYWVsLAo+Pj4+Cj4+Pj4gT24gMDEuIDA0LiAyMCAxMzozMCwgTWljaGFsIFNpbWVr
IHdyb3RlOgo+Pj4+PiBPbiAwMS4gMDQuIDIwIDEyOjM4LCBUYWthc2hpIEl3YWkgd3JvdGU6Cj4+
Pj4+PiBPbiBXZWQsIDAxIEFwciAyMDIwIDEyOjM1OjE2ICswMjAwLAo+Pj4+Pj4gTWljaGFlbCBF
bGxlcm1hbiB3cm90ZToKPj4+Pj4+Pgo+Pj4+Pj4+IE1pY2hhbCBTaW1layA8bWljaGFsLnNpbWVr
QHhpbGlueC5jb20+IHdyaXRlczoKPj4+Pj4+Pj4gT24gMDEuIDA0LiAyMCA0OjA3LCBNaWNoYWVs
IEVsbGVybWFuIHdyb3RlOgo+Pj4+Pj4+Pj4gTWljaGFsIFNpbWVrIDxtaWNoYWwuc2ltZWtAeGls
aW54LmNvbT4gd3JpdGVzOgo+Pj4+Pj4+Pj4+IEhpLAo+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gcmVj
ZW50bHkgd2Ugd2FudGVkIHRvIHVwZGF0ZSB4aWxpbnggaW50YyBkcml2ZXIgYW5kIHdlIGZvdW5k
IHRoYXQgZnVuY3Rpb24KPj4+Pj4+Pj4+PiB3aGljaCB3ZSB3YW50ZWQgdG8gcmVtb3ZlIGlzIHN0
aWxsIHdpcmVkIGJ5IGFuY2llbnQgWGlsaW54IFBvd2VyUEMKPj4+Pj4+Pj4+PiBwbGF0Zm9ybXMu
IEhlcmUgaXMgdGhlIHRocmVhZCBhYm91dCBpdC4KPj4+Pj4+Pj4+PiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9saW51eC1uZXh0LzQ4ZDMyMzJkLTBmMWQtNDJlYS0zMTA5LWY0NGJiYWJmYTJlOEB4
aWxpbnguY29tLwo+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gSSBoYXZlIGJlZW4gdGFsa2luZyBhYm91
dCBpdCBpbnRlcm5hbGx5IGFuZCB0aGVyZSBpcyBubyBpbnRlcmVzdCBpbiB0aGVzZQo+Pj4+Pj4+
Pj4+IHBsYXRmb3JtcyBhbmQgaXQgaXMgYWxzbyBvcnBoYW4gZm9yIHF1aXRlIGEgbG9uZyB0aW1l
LiBOb25lIGlzIHJlYWxseQo+Pj4+Pj4+Pj4+IHJ1bm5pbmcvdGVzdGluZyB0aGVzZSBwbGF0Zm9y
bXMgcmVndWxhcmx5IHRoYXQncyB3aHkgSSB0aGluayBpdCBtYWtlcyBzZW5zZQo+Pj4+Pj4+Pj4+
IHRvIHJlbW92ZSB0aGVtIGFsc28gd2l0aCBkcml2ZXJzIHdoaWNoIGFyZSBzcGVjaWZpYyB0byB0
aGlzIHBsYXRmb3JtLgo+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gVS1Cb290IHN1cHBvcnQgd2FzIHJl
bW92ZWQgaW4gMjAxNyB3aXRob3V0IGFueWJvZHkgY29tcGxhaW4gYWJvdXQgaXQKPj4+Pj4+Pj4+
PiBodHRwczovL2dpdGh1Yi5jb20vWGlsaW54L3UtYm9vdC14bG54L2NvbW1pdC85OGY3MDVjOWNl
ZmRmZGJhNjJjMDY5ODIxYmJiYTEwMjczYTBhOGVkCj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+PiBCYXNl
ZCBvbiBjdXJyZW50IHBwYy9uZXh0Lgo+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4gSWYgYW55b25lIGhh
cyBhbnkgb2JqZWN0aW9uIGFib3V0IGl0LCBwbGVhc2UgbGV0IG1lIGtub3cuCj4+Pj4+Pj4+Pgo+
Pj4+Pj4+Pj4gVGhhbmtzIGZvciB0YWtpbmcgdGhlIHRpbWUgdG8gZmluZCBhbGwgdGhpcyBjb2Rl
IGFuZCByZW1vdmUgaXQuCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gSSdtIG5vdCBnb2luZyB0byB0YWtl
IHRoaXMgc2VyaWVzIGZvciB2NS43LCBpdCB3YXMgcG9zdGVkIHRvbyBjbG9zZSB0bwo+Pj4+Pj4+
Pj4gdGhlIG1lcmdlIHdpbmRvdywgYW5kIGRvaW5nIHNvIHdvdWxkbid0IGdpdmUgcGVvcGxlIG11
Y2ggdGltZSB0byBvYmplY3QsCj4+Pj4+Pj4+PiBlc3BlY2lhbGx5IGdpdmVuIHBlb3BsZSBhcmUg
ZGlzdHJhY3RlZCBhdCB0aGUgbW9tZW50Lgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IEknbSBoYXBweSB0
byB0YWtlIGl0IGZvciB2NS44LCBhc3N1bWluZyB0aGVyZSdzIG5vIG1ham9yIG9iamVjdGlvbnMu
Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IFN1cmUuIEp1c3QgdG8gbGV0IHlvdSBrbm93IENocmlzdG9waGUg
TGVyb3kgaW5jbHVkZWQgdGhpcyBwYXRjaCBpbiBoaXMKPj4+Pj4+Pj4gc2VyaWVzIGFib3V0IHBw
YzQwNSByZW1vdmFsLiBJdCBzaG91bGQgYmUgdGhlIHNhbWUuCj4+Pj4+Pj4+Cj4+Pj4+Pj4+IElm
IHlvdSBkb24ndCB3YW50IHRvIHRha2UgdGhhdCBhbHNhIHBhdGNoIEkgY2FuIHNlbmQgaXQgc2Vw
YXJhdGVseSBhbmQKPj4+Pj4+Pj4gdGhpcyBwYXRjaCBjYW4gYmUgdGFrZW4gZnJvbSBoaXMgc2Vy
aWVzLiBJIGRvbid0IHJlYWxseSBtaW5kIGJ1dCBwbGVhc2UKPj4+Pj4+Pj4gbGV0IG1lIGtub3cg
d2hhdCB3YXkgeW91IHByZWZlci4KPj4+Pj4+Pgo+Pj4+Pj4+IEl0J3MgYmV0dGVyIHRvIGtlZXAg
aXQgYWxsIHRvZ2V0aGVyLCBzbyBJJ20gaGFwcHkgdGFrZSB0aGUgYWxzYSBwYXRjaCBhcwo+Pj4+
Pj4+IHdlbGwsIGl0J3MgYWxyZWFkeSBiZWVuIGFja2VkLgo+Pj4+Cj4+Pj4gQ2FuIHlvdSBwbGVh
c2UgdGFrZSB0aGlzIHNlcmllcz8gSSBrbm93IHRoYXQgdGhlcmUgaXMgdjUgZnJvbSBDaHJpc3Rv
cGhlCj4+Pj4gd2hpY2ggaGFzIHRoaXMgMS8yIGFzIDEvMTMuIEJ1dCBJIG5lZWQgdGhpcyBhbHNh
IHBhdGNoIHRvbyBhbmQgSSB3b3VsZAo+Pj4+IGxpa2UgdG8gY2xvc2UgdGhpcyBiZWNhdXNlIGl0
IGlzIGFyb3VuZCBmb3IgYWxtb3N0IDIgbW9udGhzIGFuZCBub25lCj4+Pj4gcmFpc2VkIGEgY29u
Y2VybiBhYm91dCByZW1vdmluZyBqdXN0IHRoZXNlIFhpbGlueCBwbGF0Zm9ybXMuCj4+Pgo+Pj4g
U29ycnkgSSBtZWFudCB0byByZXBseSB0byB5b3VyIGxhc3QgbWFpbC4KPj4+Cj4+PiBJIGhhdmUg
Q2hyaXN0b3BoZSdzIHNlcmllcyBpbiBteSB0ZXN0aW5nIGJyYW5jaCwgcGxhbm5pbmcgZm9yIGl0
IHRvIGJlCj4+PiBpbiB2NS44Lgo+Pj4KPj4+IEV2ZW4gaWYgdGhlIHJlc3Qgb2YgaGlzIHNlcmll
cyBkb2Vzbid0IG1ha2UgaXQgZm9yIHNvbWUgcmVhc29uLCBhcyB5b3UKPj4+IHNheSB0aGUgWGls
aW54IHJlbW92YWwgaXMgdW5jb250cm92ZXJzaWFsIHNvIEknbGwga2VlcCB0aGF0IGluLgo+Pj4K
Pj4+IEkgZm9yZ290IGFib3V0IHRoZSBzb3VuZCBwYXRjaCwgSSdsbCBwaWNrIHRoYXQgdXAgYXMg
d2VsbC4KPj4gCj4+IEkgdG9vayBhIGxvb2sgYXQgeW91cgo+PiBodHRwczovL2dpdC5rZXJuZWwu
b3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9wb3dlcnBjL2xpbnV4LmdpdCByZXBvCj4+IGFu
ZCBJIGNhbid0IHNlZSBhbnkgYnJhbmNoIHdpdGggbXkgcGF0Y2hlcy4KPj4gQWxzbyB3YXMgY2hl
Y2tpbmcgbGludXgtbmV4dCBhbmQgbXkgcGF0Y2hlcyBhcmUgYWxzbyBub3QgdGhlcmUuCj4+IFRo
YXQncyB3aHkgSSBhbSBjdXJpb3VzIGlmIHRoaXMgd2lsbCBiZSBnbyB2NS44IGluIE1XLgo+Cj4g
SSBzZWUgdGhlbSBpbiAKPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2Vy
bmVsL2dpdC9wb3dlcnBjL2xpbnV4LmdpdCBpbiAKPiBuZXh0LXRlc3QgYnJhbmNoLgoKV2hpY2gg
PT0gdGhlIG5leHQgYnJhbmNoLCB3aGljaCBpcyB3aGF0IHdpbGwgZ28gaW50byB2NS44LCBhbGwg
Z29pbmcKd2VsbC4KCmNoZWVycwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
