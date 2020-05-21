Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE3F1DE04F
	for <lists+dri-devel@lfdr.de>; Fri, 22 May 2020 08:56:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9141E6E97E;
	Fri, 22 May 2020 06:56:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 376A46E21C
 for <dri-devel@lists.freedesktop.org>; Thu, 21 May 2020 13:53:42 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49SWKw5Zjyz9sRf;
 Thu, 21 May 2020 23:53:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1590069215;
 bh=x0gmE3z8OBKdaFX9xEcEKrvKpGE5oUxiR1vLxs+y9m0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=U1ummp7o80EpVG+XHrZ+kY4mdOMj66aPIDu5nh5DSYxAr90UFT/UjNp2Zv20PMhPq
 FutLYG1LwUbwvn8i0fOfPn08DRbaU4pDlYWcByEyHRHQYMEtctNRfa0WgmM8ZBaPhb
 uVYMYUTuMpgq+CMyGEULlRnrrJm9WVjrG4Du9vtHMQmANXcX+VE0M5rEEcE86PnsNS
 Mul59ND40j40D1g5t26BIV6SW9Xbe0Z428Ag6OFLi0HcS/10P0QKyszCzFH/9TqS9j
 6PfjFLvhroAJX5arEVgTI8cNrRF/utxBtxRY+bGX61fCFkKMLmUk28N+hRusHvh1j3
 LWzQ6uAZR8snA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 0/2] powerpc: Remove support for ppc405/440 Xilinx
 platforms
In-Reply-To: <33b873a8-ded2-4866-fb70-c336fb325923@csgroup.eu>
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
Date: Thu, 21 May 2020 23:53:45 +1000
Message-ID: <87o8qhgzrq.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1PiB3cml0ZXM6Cj4g
TGUgMjEvMDUvMjAyMCDDoCAwOTowMiwgTWljaGFlbCBFbGxlcm1hbiBhIMOpY3JpdMKgOgo+PiBB
cm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPiB3cml0ZXM6Cj4+PiArT24gV2VkLCBBcHIgOCwg
MjAyMCBhdCAyOjA0IFBNIE1pY2hhZWwgRWxsZXJtYW4gPG1wZUBlbGxlcm1hbi5pZC5hdT4gd3Jv
dGU6Cj4+Pj4gQmVuamFtaW4gSGVycmVuc2NobWlkdCA8YmVuaEBrZXJuZWwuY3Jhc2hpbmcub3Jn
PiB3cml0ZXM6Cj4+Pj4+IE9uIEZyaSwgMjAyMC0wNC0wMyBhdCAxNTo1OSArMTEwMCwgTWljaGFl
bCBFbGxlcm1hbiB3cm90ZToKPj4+Pj4+IEJlbmphbWluIEhlcnJlbnNjaG1pZHQgPGJlbmhAa2Vy
bmVsLmNyYXNoaW5nLm9yZz4gd3JpdGVzOgo+Pj4+PiBJQk0gc3RpbGwgcHV0IDQweCBjb3JlcyBp
bnNpZGUgUE9XRVIgY2hpcHMgbm8gPwo+Pj4+Cj4+Pj4gT2ggeWVhaCB0aGF0J3MgdHJ1ZS4gSSBn
dWVzcyBtb3N0IGZvbGtzIGRvbid0IGtub3cgdGhhdCwgb3IgdGhhdCB0aGV5Cj4+Pj4gcnVuIFJI
RUwgb24gdGhlbS4KPj4+Cj4+PiBJcyB0aGVyZSBhIHJlYXNvbiBmb3Igbm90IGhhdmluZyB0aG9z
ZSBkdHMgZmlsZXMgaW4gbWFpbmxpbmUgdGhlbj8KPj4+IElmIG5vdGhpbmcgZWxzZSwgaXQgd291
bGQgZG9jdW1lbnQgd2hhdCBtYWNoaW5lcyBhcmUgc3RpbGwgYmVpbmcKPj4+IHVzZWQgd2l0aCBm
dXR1cmUga2VybmVscy4KPj4gCj4+IFNvcnJ5IHRoYXQgcGFydCB3YXMgYSBqb2tlIDpEICBUaG9z
ZSBjaGlwcyBkb24ndCBydW4gTGludXguCj4+IAo+Cj4gTmljZSB0byBrbm93IDopCj4KPiBXaGF0
J3MgdGhlIHBsYW4gdGhlbiwgZG8gd2Ugc3RpbGwgd2FudCB0byBrZWVwIDQweCBpbiB0aGUga2Vy
bmVsID8KCkkgZ3Vlc3Mgd2Uga2VlcCBpdCBmb3Igbm93LgoKUGVyaGFwcyB3ZSBtYXJrIGl0IEJS
T0tFTiBmb3IgYSBmZXcgcmVsZWFzZXMgYW5kIHNlZSBpZiBhbnlvbmUKY29tcGxhaW5zPwoKPiBJ
ZiB5ZXMsIGlzIGl0IG9rIHRvIGRyb3AgdGhlIG9sZGllcyBhbnl3YXkgYXMgZG9uZSBpbiBteSBz
ZXJpZXMgCj4gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2xpbnV4cHBjLWRl
di9saXN0Lz9zZXJpZXM9MTcyNjMwID8KClllYWggbGV0J3MgZG8gaXQuIEkgd291bGQgbG92ZSB0
byBnZXQgcmlkIG9mIHRoYXQgaG9ycmlibGUKUFBDNDA1X0VSUjc3KCkgc3ByaW5rbGVkIGFsbCB0
aHJvdWdoIG91ciBhdG9taWNzLgoKPiAoTm90ZSB0aGF0IHRoaXMgc2VyaWVzIHdpbGwgY29uZmxp
Y3Qgd2l0aCBteSBzZXJpZXMgb24gaHVnZXBhZ2VzIG9uIDh4eCAKPiBkdWUgdG8gdGhlIFBURV9B
VE9NSUNfVVBEQVRFUyBzdHVmZi4gSSBjYW4gcmViYXNlIHRoZSA0MHggbW9kZXJuaXNhdGlvbiAK
PiBzZXJpZXMgb24gdG9wIG9mIHRoZSA4eHggaHVnZXBhZ2VzIHNlcmllcyBpZiBpdCBpcyB3b3J0
aCBpdCkKClllYWggaWYgeW91IGNhbiByZWJhc2UgdGhhdCB3b3VsZCBiZSBncmVhdC4KCmNoZWVy
cwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
