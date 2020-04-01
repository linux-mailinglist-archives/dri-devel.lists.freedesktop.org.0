Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9665719A5E1
	for <lists+dri-devel@lfdr.de>; Wed,  1 Apr 2020 09:04:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 340436E8F8;
	Wed,  1 Apr 2020 07:04:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34CF76E8C5
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Apr 2020 02:08:04 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48sV2t09Dpz9sRf;
 Wed,  1 Apr 2020 13:07:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1585706881;
 bh=5Eij0H0oCxuYHXBpvkwU455sMVKeqXD4R0I88w1ezf0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=G5WMbSF/9RnD0WcjjTHkS89KfsK9z+Ul8eGUnDsHox4hY9Wd27IV+efsEM5A9xjXL
 MJ3dPXyUs/OslGrGeTglaohlf/wYAVoh/U7KCAKNEj6mI0qw8p8s0DbLpfhEqbeTyV
 t+Z1PWfRsrZVOiig4zjml/SlgGTfF8dmLnlxwp4jR2OT0YJWje5TtJp9EyWGnGTtyt
 grLGNGb3RPjPP8ZdiSyn4fr0jKkcQTDoMnc1TF1TdR0djqWEVFIFD2ft5P+1t2b600
 wnHLbfV/yqq+RjKSWNFJ/1ksfFPLeqv7ZDLciDyZKTGuY6XmvCvgpcIIt+dSQbWZZd
 wg3zBk4OWnJcw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Michal Simek <michal.simek@xilinx.com>, linux-kernel@vger.kernel.org,
 monstr@monstr.eu, michal.simek@xilinx.com, git@xilinx.com,
 sfr@canb.auug.org.au, maz@kernel.org
Subject: Re: [PATCH v2 0/2] powerpc: Remove support for ppc405/440 Xilinx
 platforms
In-Reply-To: <cover.1585575111.git.michal.simek@xilinx.com>
References: <cover.1585575111.git.michal.simek@xilinx.com>
Date: Wed, 01 Apr 2020 13:07:55 +1100
Message-ID: <87imikufes.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
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
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-doc@vger.kernel.org,
 alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 Jaroslav Kysela <perex@perex.cz>, Richard Fontana <rfontana@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Sasha Levin <sashal@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Masahiro Yamada <masahiroy@kernel.org>, YueHaibing <yuehaibing@huawei.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Allison Randal <allison@lohutok.net>,
 Matt Porter <mporter@kernel.crashing.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Alistair Popple <alistair@popple.id.au>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>, Alexios Zavras <alexios.zavras@intel.com>,
 Mark Brown <broonie@kernel.org>, linux-fbdev@vger.kernel.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Dmitry Vyukov <dvyukov@google.com>, Christophe Leroy <christophe.leroy@c-s.fr>,
 Wei Hu <weh@microsoft.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>, Enrico Weigelt <info@metux.net>,
 "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Michal Simek <michal.simek@xilinx.com> writes:
> Hi,
>
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
> U-Boot support was removed in 2017 without anybody complain about it
> https://github.com/Xilinx/u-boot-xlnx/commit/98f705c9cefdfdba62c069821bbba10273a0a8ed
>
> Based on current ppc/next.
>
> If anyone has any objection about it, please let me know.

Thanks for taking the time to find all this code and remove it.

I'm not going to take this series for v5.7, it was posted too close to
the merge window, and doing so wouldn't give people much time to object,
especially given people are distracted at the moment.

I'm happy to take it for v5.8, assuming there's no major objections.

cheers
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
