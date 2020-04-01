Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F041419B77B
	for <lists+dri-devel@lfdr.de>; Wed,  1 Apr 2020 23:20:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 680E16E9A3;
	Wed,  1 Apr 2020 21:20:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 758 seconds by postgrey-1.36 at gabe;
 Wed, 01 Apr 2020 21:20:14 UTC
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBA266E9A3
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Apr 2020 21:20:14 +0000 (UTC)
Received: from mail-qk1-f169.google.com ([209.85.222.169]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MyK9S-1j7t3y3uGq-00ygC3 for <dri-devel@lists.freedesktop.org>; Wed, 01
 Apr 2020 23:07:35 +0200
Received: by mail-qk1-f169.google.com with SMTP id q188so1654908qke.8
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Apr 2020 14:07:34 -0700 (PDT)
X-Gm-Message-State: AGi0PuaUDTPtYxxQO4074KcTcXwJrCNnzG/Rv9gmGduiXDMCWkOgOYLm
 jL/wTctSygykp5WlRWb+E6eYah2dZVcsmSHdgRo=
X-Google-Smtp-Source: APiQypK2VxbgsBQWN5zZRldfRvjgPaI6APWLNh/n01B0qErpj4ZP7Mfk8XFNqdw3+ssCzEIWikyHqTkJEucg147IwkM=
X-Received: by 2002:a37:d85:: with SMTP id 127mr236136qkn.3.1585775253692;
 Wed, 01 Apr 2020 14:07:33 -0700 (PDT)
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
In-Reply-To: <20200331175123.GV22482@gate.crashing.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 1 Apr 2020 23:07:16 +0200
X-Gmail-Original-Message-ID: <CAK8P3a34Tw+bH9bCBQ9HeDo4m4RE67fNOyL8cfUf-i09ur8seg@mail.gmail.com>
Message-ID: <CAK8P3a34Tw+bH9bCBQ9HeDo4m4RE67fNOyL8cfUf-i09ur8seg@mail.gmail.com>
Subject: Re: [PATCH 0/2] powerpc: Remove support for ppc405/440 Xilinx
 platforms
To: Segher Boessenkool <segher@kernel.crashing.org>
X-Provags-ID: V03:K1:ZkdRYGw0hTofixdQeUD1gcyLgNZ4kiXAPHjbMBSJnBXmpTrx+O7
 v6xXggdzbiN408HvUkcAtK15dZYbsLZhXuZmwemVLvzHlbJ91V3QgZ+2mIXbysSlRARcCYL
 O3OPWTaWlfM7gZwYKWBg+Fjtxg6WGIedNPmglp1jhmdAdWD2jSyl7bofZwFZyNf1wZXcp2l
 Jbj5QNEip+t1qGtHcaRmQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:sDl5wl2LDdU=:Pawalw4lDAnFj3p+KrvHe7
 oTz3IFzaRmKHnU/bECTiahYjWnJd2kXFne/jxIS2xxhSTm2AHDVM9GNLIsECFMipgZhEsxHRl
 euviDMJWMXGTNrtm1bVqQpDJ1y7il0GFZU/oZLHxtUq3J4SG9wB7djgsEMHrVf5vlhui+HY6d
 hnj9qSMnjASFm28P+AsZavxVG3r5nl32MHPnb5U0IS5SCHYRx0wwFziryJJXe7Rf17+5iG5D7
 G4hFdPKflC1tuFosUKBse6rGCW0IZt1Ux0EWR7QRiT/7dgsYtjPMH8/C2H2dHU+h3JYKH9P+W
 lptt8A9DVeg2supoPVaKDdB1K6zpdalFcbd+SnjPOUarayeG9i8F6pIKxrknLFKtuWQ3r2a3+
 bzy0tyV3Rl99hdhXg2GzjG3azIceOFNt/9QJIVQGoeZyVFWGzRV6rp2dyM4Rw3l6kLlgb4kOu
 qWqOVnPP0Ag6CzilFs0Rx7pMuc+S4GdX5wnzGGEmhWdGtJNKHrqg0MH+IGpbmupa+s20IYFNx
 5Ygf57koGi2tVlDEBcYaeI/VruxDvs5HNF0iixOEtE7Mipc0oSFQDRDfsK6FIJ6L0x92kgpMj
 UOcDYcFRJaYrbpSEe1wDG9n7u3LFUOIqIiFqZgtSzw5xhdXGsJX0/WwELaa/kpSD5F4UCHJLr
 JiibbiOuQ2B3uXVbmma1OlbTV3T3/TH7yz7UacSjyl4Of7zQQkNL1YdrxNMpV1LiPN5tkpjwC
 xG5dp0qUOKhmdlmumwtcHbYQbtnejYe2G7bRKisdk5OxuVXJBWSyYeYnTX0D9WioKxFb6s31J
 i9IENA8H7yz6XJ9oZjOxUsLn6LNqZqre55RN+/nbdi+mZ1fCGL7RIl+tQvuYX+a+rMLTUYm1s
 7oSaCtMqFD25/V/PNEwNO7AMkjrdlYmkHUkkft1FyF2VDBAgn1N4HKoFeYk76jcpWv2bc0J5y
 F3RS6JRw+kpseyPqunuiZmS3Pje5sSrWGpnJEdrRbcBenW2WkjDAtgdG7hWubGkvJ24k4dLTC
 Q3Gas5B6mQiaO1g0DecYdlQ=
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 31, 2020 at 7:51 PM Segher Boessenkool
<segher@kernel.crashing.org> wrote:
>
> On Tue, Mar 31, 2020 at 08:56:23AM +0200, Christophe Leroy wrote:
> > While we are at it, can we also remove the 601 ? This one is also full
> > of workarounds and diverges a bit from other 6xx.
> >
> > I'm unable to find its end of life date, but it was on the market in
> > 1994, so I guess it must be outdated by more than 10-15 yr old now ?
>
> There probably are still some people running Linux on 601 powermacs.

It could be marked as "BROKEN" for a year to find out for sure ;-)

Apparently there were only two or three models that are old enough to
have a 601 and new enough to run Linux with PCI and OF: 7200/8200
and 7500. These were sold for less than 18 months around 1996,
though one can still find them on eBay.

           Arnd
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
