Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C808198D0F
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 09:38:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDC256E570;
	Tue, 31 Mar 2020 07:38:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECA8E6E532
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 05:31:03 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48rybT5bWHz9sQt;
 Tue, 31 Mar 2020 16:30:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1585632657;
 bh=wBZTBGwXUKd1W8rXBvklBLNI6VWNJG7y8+GiwKSfwyw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=OXuI0kpZye/5Qq3R/+8SAFSe9LUM7PwBmIdxrYytUIHSuRxmANIxjUadBh+6TrUAG
 0/scSdRqozxwIvGpx5YAoqaas6zyYNu1ofRUtDLL9xankqQA8NRoSKsovNe2d8T2ox
 EE+pYrp5vhw+njgE6sz4hE0xSoG5qd1kM70abPp0iLw+8xrK7rbT+X72WYJkdznwIR
 vylvZwmwhjEsCOYWDAkyokOTl5I0EDHTpAOQtvrJic+I553FsdUe6lUqqhTTKeOKtJ
 bEGAgXICIQ9Dnq442VWtcXsV5MEBEXK6DSfOfoTC1imS12aITD0LH3toDAD0wzjxgU
 0uub9n396MWgw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@c-s.fr>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 0/2] powerpc: Remove support for ppc405/440 Xilinx
 platforms
In-Reply-To: <b5adcc7a-9d10-d75f-50e3-9c150a7b4989@c-s.fr>
References: <cover.1585311091.git.michal.simek@xilinx.com>
 <CAK8P3a2mKPRFbRE3MWScr9GSiL4cpLg0wqv1Q28XDCZVPWgHfg@mail.gmail.com>
 <20200327131026.GT1922688@smile.fi.intel.com>
 <20200327131531.GU1922688@smile.fi.intel.com>
 <CAK8P3a1Z+ZPTDzgAjdz0a7d85R62BhUqkdEWgrwXh-OnYe6rog@mail.gmail.com>
 <20200327141434.GA1922688@smile.fi.intel.com>
 <b5adcc7a-9d10-d75f-50e3-9c150a7b4989@c-s.fr>
Date: Tue, 31 Mar 2020 16:30:54 +1100
Message-ID: <87mu7xum41.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
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
 Geert Uytterhoeven <geert+renesas@glider.be>, "open
 list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjLXMuZnI+IHdyaXRlczoKPiBMZSAy
Ny8wMy8yMDIwIMOgIDE1OjE0LCBBbmR5IFNoZXZjaGVua28gYSDDqWNyaXTCoDoKPj4gT24gRnJp
LCBNYXIgMjcsIDIwMjAgYXQgMDI6MjI6NTVQTSArMDEwMCwgQXJuZCBCZXJnbWFubiB3cm90ZToK
Pj4+IE9uIEZyaSwgTWFyIDI3LCAyMDIwIGF0IDI6MTUgUE0gQW5keSBTaGV2Y2hlbmtvCj4+PiA8
YW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPiB3cm90ZToKPj4+PiBPbiBGcmksIE1h
ciAyNywgMjAyMCBhdCAwMzoxMDoyNlBNICswMjAwLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6Cj4+
Pj4+IE9uIEZyaSwgTWFyIDI3LCAyMDIwIGF0IDAxOjU0OjMzUE0gKzAxMDAsIEFybmQgQmVyZ21h
bm4gd3JvdGU6Cj4+Pj4+PiBPbiBGcmksIE1hciAyNywgMjAyMCBhdCAxOjEyIFBNIE1pY2hhbCBT
aW1layA8bWljaGFsLnNpbWVrQHhpbGlueC5jb20+IHdyb3RlOgo+PiAuLi4KPj4gCj4+Pj4+PiBJ
dCBkb2VzIHJhaXNlIGEgZm9sbG93LXVwIHF1ZXN0aW9uIGFib3V0IHBwYzQweCB0aG91Z2g6IGlz
IGl0IHRpbWUgdG8KPj4+Pj4+IHJldGlyZSBhbGwgb2YgaXQ/Cj4+Pj4+Cj4+Pj4+IFdobyBrbm93
cz8KPj4+Pj4KPj4+Pj4gSSBoYXZlIGluIHBvc3Nlc3Npb24gbmljZSBXRCBNeSBCb29rIExpdmUs
IGJhc2VkIG9uIHRoaXMgYXJjaGl0ZWN0dXJlLCBhbmQgSQo+Pj4+PiB3b24ndCBpdCBnb25lIGZy
b20gbW9kZXJuIGtlcm5lbCBzdXBwb3J0LiBPVE9IIEkgdW5kZXJzdGFuZCB0aGF0IGFtb3VudCBv
ZiByZWFsCj4+Pj4+IHVzZXJzIG5vdCB0b28gYmlnLgo+Pj4+Cj4+Pj4gK0NjOiBDaHJpc3RpYW4g
TGFtcGFydGVyLCB3aG9tIEkgb3dlIGZvciB0aGF0IFdEIGJveC4KPj4+Cj4+PiBBY2NvcmRpbmcg
dG8gaHR0cHM6Ly9vcGVud3J0Lm9yZy90b2gvd2QvbXlib29rbGl2ZSwgdGhhdCBvbmUgaXMgYmFz
ZWQgb24KPj4+IEFQTTgyMTgxL3BwYzQ2NCwgc28gaXQgaXMgYWJvdXQgc2V2ZXJhbCBnZW5lcmF0
aW9ucyBuZXdlciB0aGFuIHdoYXQgSQo+Pj4gYXNrZWQgYWJvdXQgKHBwYzQweCkuCj4+Pgo+Pj4+
PiBBaCwgYW5kIEkgaGF2ZSBBbWlnYSBib2FyZCwgYnV0IHRoYXQgb25lIGlzIGJlaW5nIHVzZWQg
b25seSBmb3IgdGVzdGluZywgc28sCj4+Pj4+IEkgZG9uJ3QgY2FyZSBtdWNoLgo+Pj4KPj4+IEkg
dGhpbmsgdGhlcmUgYXJlIGEgY291cGxlIG9mIHBwYzQ0MCBiYXNlZCBBbWlnYSBib2FyZHMsIGJ1
dCBhZ2Fpbiwgbm90IDQwNQo+Pj4gdG8gbXkga25vd2xlZGdlLgo+PiAKPj4gQWgsIHlvdSBhcmUg
cmlnaHQuIE5vIG9iamVjdGlvbnMgZnJvbSBwcGM0MHggcmVtb3ZhbCEKPgo+IFJlbW92aW5nIDQw
eCB3b3VsZCBoZWxwIGNsZWFuaW5nIHRoaW5ncyBhIGJpdC4gRm9yIGluc3RhbmNlIDQweCBpcyB0
aGUgCj4gbGFzdCBwbGF0Zm9ybSBzdGlsbCBoYXZpbmcgUFRFX0FUT01JQ19VUERBVEVTLiBTbyBp
ZiB3ZSBjYW4gcmVtb3ZlIDQweCAKPiB3ZSBjYW4gZ2V0IHJpZCBvZiBQVEVfQVRPTUlDX1VQREFU
RVMgY29tcGxldGVseS4KPgo+IElmIG5vIG9uZSBvYmplY3RzLCBJIGNhbiBwcmVwYXJlIGEgc2Vy
aWVzIHRvIGRyb3Agc3VwcG9ydCBmb3IgNDB4IAo+IGNvbXBsZXRlbHkuCj4KPiBNaWNoYWVsLCBh
bnkgdGhvdWdodCA/CgpJIGhhdmUgbm8gYXR0YWNobWVudCB0byA0MHgsIGFuZCBJJ2QgY2VydGFp
bmx5IGJlIGhhcHB5IHRvIGhhdmUgbGVzcwpjb2RlIGluIHRoZSB0cmVlLCB3ZSBzdHJ1Z2dsZSB0
byBrZWVwIGV2ZW4gdGhlIG1vZGVybiBwbGF0Zm9ybXMgd2VsbAptYWludGFpbmVkLgoKQXQgdGhl
IHNhbWUgdGltZSBJIGRvbid0IHdhbnQgdG8gcmVuZGVyIGFueW9uZSdzIGhhcmR3YXJlIG9ic29s
ZXRlCnVubmVjZXNzYXJpbHkuIEJ1dCBpZiB0aGVyZSdzIHJlYWxseSBubyBvbmUgdXNpbmcgNDB4
IHRoZW4gd2Ugc2hvdWxkCnJlbW92ZSBpdCwgaXQgY291bGQgd2VsbCBiZSBicm9rZW4gYWxyZWFk
eS4KClNvIEkgZ3Vlc3MgcG9zdCBhIHNlcmllcyB0byBkbyB0aGUgcmVtb3ZhbCBhbmQgd2UnbGwg
c2VlIGlmIGFueW9uZQpzcGVha3MgdXAuCgpjaGVlcnMKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
