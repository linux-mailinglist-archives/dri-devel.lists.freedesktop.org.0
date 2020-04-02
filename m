Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 968FD19BFCF
	for <lists+dri-devel@lfdr.de>; Thu,  2 Apr 2020 13:05:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B09C6EA50;
	Thu,  2 Apr 2020 11:05:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E129D6EA50
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Apr 2020 11:05:02 +0000 (UTC)
Received: from mail-qt1-f173.google.com ([209.85.160.173]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1N0WPK-1j5T4L0Zsq-00wX4K for <dri-devel@lists.freedesktop.org>; Thu, 02
 Apr 2020 13:05:01 +0200
Received: by mail-qt1-f173.google.com with SMTP id t9so2791687qto.9
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Apr 2020 04:05:00 -0700 (PDT)
X-Gm-Message-State: AGi0Pub+xd/7/w/I2FAZ5Np388r/2LeOwvWdRrHvhKJOVUU84bHkM/h6
 p0LCzl3vx+bQxS+g2iLdT048c5QPYJR/DXzu700=
X-Google-Smtp-Source: APiQypJsUlmA/o2DdIvGggdD9+ibIYF6moE63pjwvb5CKhqtgTpUSWQDa2hc05O2VxKKurX3JMWriCkgA7smRY8JaYo=
X-Received: by 2002:ac8:7292:: with SMTP id v18mr2220674qto.304.1585825499828; 
 Thu, 02 Apr 2020 04:04:59 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1585311091.git.michal.simek@xilinx.com>
 <CAK8P3a2mKPRFbRE3MWScr9GSiL4cpLg0wqv1Q28XDCZVPWgHfg@mail.gmail.com>
 <20200327131026.GT1922688@smile.fi.intel.com>
 <20200327131531.GU1922688@smile.fi.intel.com>
 <CAK8P3a1Z+ZPTDzgAjdz0a7d85R62BhUqkdEWgrwXh-OnYe6rog@mail.gmail.com>
 <20200327141434.GA1922688@smile.fi.intel.com>
 <b5adcc7a-9d10-d75f-50e3-9c150a7b4989@c-s.fr>
 <87mu7xum41.fsf@mpe.ellerman.id.au>
 <11765c82-bf1a-466c-760d-f9a4c4d1d5f1@c-s.fr>
 <20200331175123.GV22482@gate.crashing.org>
 <CAK8P3a34Tw+bH9bCBQ9HeDo4m4RE67fNOyL8cfUf-i09ur8seg@mail.gmail.com>
In-Reply-To: <CAK8P3a34Tw+bH9bCBQ9HeDo4m4RE67fNOyL8cfUf-i09ur8seg@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 2 Apr 2020 13:04:42 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2FJ+Pr_FfetWfJkWv8Z2BGuAmwr7DtoyrkmoHfpFgQVg@mail.gmail.com>
Message-ID: <CAK8P3a2FJ+Pr_FfetWfJkWv8Z2BGuAmwr7DtoyrkmoHfpFgQVg@mail.gmail.com>
Subject: Re: [PATCH 0/2] powerpc: Remove support for ppc405/440 Xilinx
 platforms
To: Segher Boessenkool <segher@kernel.crashing.org>
X-Provags-ID: V03:K1:aqegeisp88h3yYQS40nJrvpWn6H8HYlzFW9Hj6D336jVCqFjNTQ
 hkvctNtUPrf/BRHKT0MVwbE99nEXQ30+Vjb2+GrO6eck8h3j96/mKZWg7lim40iHciAg7+r
 So2XY1P469DDlG28xx44DQ0noskEiUbN5uHWZOmR9OyrZoW2Vx/dOH0ThtlYf3aD8z1X98s
 lhaVosX9QK+RHMTqoOTOA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:8/5+PIqz2mE=:S+vcoJ9+yg6VT7TbcFJCHJ
 8OdwJXkVHPtcfQYmHzT7GUgHDwtGdWTdlkzOTpBYBNkjewFcYa93ZyidDcbxHnvDe84uiM5R+
 23RkTYoQ07UpkPWtffL2aBlMx5REuRmjXlwa57Uxn7UuFxG7yFnTAOlo8iKtIemwQWH16OEUB
 xDFjOpM/IMq46AgzMxKggv+155vRLUgJf42zlSkLh1aE86nBGrTnfmYXDuaDGlHtFWq202hwd
 jDjd6qWmD10TaYe2+2lwbEwLuzEMOLhtcEnXdsTz+0hOPmuojvO+tHNhJx3Ey89mua8sdMt4G
 Kv/uLDUClESknKcjJvNW4sIgabMGYLCfQ9JxoMnU2/WKBpW6bEIazogEbEyc+FRkY//4FWtxp
 fZwPbTrcaMCr2yTMpQmQ99Hzr+M7LStT5BP9RzU8AaHQhQA0jWYTZCZN+vSzWFv+c5Vr/bw9a
 NekyCuAWjYnMN65ZycEBfR3ylD88/jNHDJineJKC84WukelKmKY+s62bguNDec845o0/vckRq
 Q7zspRCIPCwRf/uyvrXHqR09C717BpQGQp2exzj5Esk+Np1XT8XFcAxPYz9tPp2xukVrIM1GM
 rfJena1VmEEZZGXVDn3lsBhb8bzqhbuE3mhX0mob3cES0VpYL13vMC06YcUt/bdPr70MvVRp8
 xWwSSIwdieZekT22PSnxxBuAnbcJ6MhtPPiPDl52qxNQ172e3icNFlIV8bZyJ4aSkmf/1sGzR
 zMEnKD8WSTPFfJsr7WEXV1+Gr7+lDs0b0EvgpBBWPD1GiehqeIFfYY+7/heYTZ+2HkFN+gi0v
 Om449FYeV/cgVTofWfNxJgr7lmH0XBsqlIj0ixmOrUNJ44y9oE=
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Kate Stewart <kstewart@linuxfoundation.org>,
 "Desnes A. Nunes do Rosario" <desnesn@linux.ibm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jaroslav Kysela <perex@perex.cz>,
 Richard Fontana <rfontana@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Sasha Levin <sashal@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>,
 Jonathan Corbet <corbet@lwn.net>, Michael Ellerman <mpe@ellerman.id.au>,
 Masahiro Yamada <masahiroy@kernel.org>, YueHaibing <yuehaibing@huawei.com>,
 Michal Simek <michal.simek@xilinx.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Allison Randal <allison@lohutok.net>, Leonardo Bras <leonardo@linux.ibm.com>,
 DTML <devicetree@vger.kernel.org>, Andrew Donnellan <ajd@linux.ibm.com>,
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBBcHIgMSwgMjAyMCBhdCAxMTowNyBQTSBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRi
LmRlPiB3cm90ZToKPgo+IE9uIFR1ZSwgTWFyIDMxLCAyMDIwIGF0IDc6NTEgUE0gU2VnaGVyIEJv
ZXNzZW5rb29sCj4gPHNlZ2hlckBrZXJuZWwuY3Jhc2hpbmcub3JnPiB3cm90ZToKPiA+Cj4gPiBP
biBUdWUsIE1hciAzMSwgMjAyMCBhdCAwODo1NjoyM0FNICswMjAwLCBDaHJpc3RvcGhlIExlcm95
IHdyb3RlOgo+ID4gPiBXaGlsZSB3ZSBhcmUgYXQgaXQsIGNhbiB3ZSBhbHNvIHJlbW92ZSB0aGUg
NjAxID8gVGhpcyBvbmUgaXMgYWxzbyBmdWxsCj4gPiA+IG9mIHdvcmthcm91bmRzIGFuZCBkaXZl
cmdlcyBhIGJpdCBmcm9tIG90aGVyIDZ4eC4KPiA+ID4KPiA+ID4gSSdtIHVuYWJsZSB0byBmaW5k
IGl0cyBlbmQgb2YgbGlmZSBkYXRlLCBidXQgaXQgd2FzIG9uIHRoZSBtYXJrZXQgaW4KPiA+ID4g
MTk5NCwgc28gSSBndWVzcyBpdCBtdXN0IGJlIG91dGRhdGVkIGJ5IG1vcmUgdGhhbiAxMC0xNSB5
ciBvbGQgbm93ID8KPiA+Cj4gPiBUaGVyZSBwcm9iYWJseSBhcmUgc3RpbGwgc29tZSBwZW9wbGUg
cnVubmluZyBMaW51eCBvbiA2MDEgcG93ZXJtYWNzLgo+Cj4gSXQgY291bGQgYmUgbWFya2VkIGFz
ICJCUk9LRU4iIGZvciBhIHllYXIgdG8gZmluZCBvdXQgZm9yIHN1cmUgOy0pCj4KPiBBcHBhcmVu
dGx5IHRoZXJlIHdlcmUgb25seSB0d28gb3IgdGhyZWUgbW9kZWxzIHRoYXQgYXJlIG9sZCBlbm91
Z2ggdG8KPiBoYXZlIGEgNjAxIGFuZCBuZXcgZW5vdWdoIHRvIHJ1biBMaW51eCB3aXRoIFBDSSBh
bmQgT0Y6IDcyMDAvODIwMAo+IGFuZCA3NTAwLiBUaGVzZSB3ZXJlIHNvbGQgZm9yIGxlc3MgdGhh
biAxOCBtb250aHMgYXJvdW5kIDE5OTYsCj4gdGhvdWdoIG9uZSBjYW4gc3RpbGwgZmluZCB0aGVt
IG9uIGVCYXkuCgpBLiBXaWxjb3ggc2FpZCBvbiBJUkMgcmVnYXJkaW5nIDYwMSBzdXBwb3J0IGlu
IEFkw6lsaWUgTGludXg6CgoicmlnaHQgbm93IHdlIGFyZSBwcmltYXJpbHkgdGFyZ2V0aW5nIEcz
LCB0aG91Z2ggNjAzIHNob3VsZCBiZSBzdXBwb3J0ZWQuCjYwMS82MDFlIHN1cHBvcnQgaXMgcGxh
bm5lZCB0byBiZSBhZGRlZCBmb3IgMi4wIChuZXh0IHllYXIpLiIKCiAgICAgIEFybmQKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
