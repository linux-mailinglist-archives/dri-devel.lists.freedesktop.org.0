Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 121621F34EB
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jun 2020 09:35:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33B216E258;
	Tue,  9 Jun 2020 07:35:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A39C46E16F
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 05:29:26 +0000 (UTC)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49gzFJ1zhtz9sTw; Tue,  9 Jun 2020 15:29:07 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: monstr@monstr.eu, sfr@canb.auug.org.au,
 Michal Simek <michal.simek@xilinx.com>, linux-kernel@vger.kernel.org,
 maz@kernel.org, git@xilinx.com
In-Reply-To: <cover.1585575111.git.michal.simek@xilinx.com>
References: <cover.1585575111.git.michal.simek@xilinx.com>
Subject: Re: [PATCH v2 0/2] powerpc: Remove support for ppc405/440 Xilinx
 platforms
Message-Id: <159168034162.1381411.7450247221070569122.b4-ty@ellerman.id.au>
Date: Tue,  9 Jun 2020 15:29:07 +1000 (AEST)
X-Mailman-Approved-At: Tue, 09 Jun 2020 07:35:06 +0000
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
 Kate Stewart <kstewart@linuxfoundation.org>, linux-fbdev@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-doc@vger.kernel.org,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 Richard Fontana <rfontana@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Sasha Levin <sashal@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Michael Ellerman <mpe@ellerman.id.au>, Masahiro Yamada <masahiroy@kernel.org>,
 YueHaibing <yuehaibing@huawei.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Dmitry Vyukov <dvyukov@google.com>, Matt Porter <mporter@kernel.crashing.org>,
 devicetree@vger.kernel.org, Andrew Donnellan <ajd@linux.ibm.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Alistair Popple <alistair@popple.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Alexios Zavras <alexios.zavras@intel.com>,
 "Desnes A. Nunes do Rosario" <desnesn@linux.ibm.com>,
 Mark Brown <broonie@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Allison Randal <allison@lohutok.net>, linux-arm-kernel@lists.infradead.org,
 Enrico Weigelt <info@metux.net>, Wei Hu <weh@microsoft.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>, C hristophe Leroy <christophe.leroy@c-s.fr>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 30 Mar 2020 15:32:15 +0200, Michal Simek wrote:
> recently we wanted to update xilinx intc driver and we found that function
> which we wanted to remove is still wired by ancient Xilinx PowerPC
> platforms. Here is the thread about it.
> https://lore.kernel.org/linux-next/48d3232d-0f1d-42ea-3109-f44bbabfa2e8@xilinx.com/
> 
> I have been talking about it internally and there is no interest in these
> platforms and it is also orphan for quite a long time. None is really
> running/testing these platforms regularly that's why I think it makes sense
> to remove them also with drivers which are specific to this platform.
> 
> [...]

Applied to powerpc/next.

[1/2] sound: ac97: Remove sound driver for ancient platform
      https://git.kernel.org/powerpc/c/f16dca3e30c14aff545a834a7c1a1bb02b9edb48
[2/2] powerpc: Remove Xilinx PPC405/PPC440 support
      https://git.kernel.org/powerpc/c/7ade8495dcfd788a76e6877c9ea86f5207369ea4

cheers
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
