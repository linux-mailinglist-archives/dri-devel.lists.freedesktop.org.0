Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B301E3A16
	for <lists+dri-devel@lfdr.de>; Wed, 27 May 2020 09:16:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AC396E28E;
	Wed, 27 May 2020 07:15:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C69B26E1CE
 for <dri-devel@lists.freedesktop.org>; Tue, 26 May 2020 13:44:48 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49WZvT3QWTz9sPF;
 Tue, 26 May 2020 23:44:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1590500685;
 bh=niBO4BBw0xcWoDqxqo8yu/3cMlLVWMp9FLLaGmF8gxw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=dxxpYB0+X5QlW36UmtTVARIDzR1CMMOTHjqUytJ5Y8EcdYvKzpntJpTS0eF2qYCKV
 tFu9p0QyrNotbGnP0FIarnpWASfJypqNF0JGo2uPHkQhgXcBd7fw2LCyxmr8XYj99n
 R7GgB1c4IwyJybQkVD2IK3BXdrtuKnLcrvA4BJF8r4Xn4qwqcVdm6ziTtF5mFUyHh0
 xA3fcj2bw8YCg1RpB0cJMcIqtisxKB6qcetZVFXMmgZVv62vdxanb2Ov0h/6Lao8LQ
 egwMqUK6p/cS/T5awknnrpKdEjn6myr4LassPeBuXUc13nul3eaHWZFbRJ7DVjz1DH
 ddBSGGc3jFUYQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Michal Simek <monstr@monstr.eu>, Michal Simek <michal.simek@xilinx.com>,
 Takashi Iwai <tiwai@suse.de>
Subject: Re: [PATCH v2 0/2] powerpc: Remove support for ppc405/440 Xilinx
 platforms
In-Reply-To: <c22540fb-1c54-b718-9045-3ee645c30322@monstr.eu>
References: <cover.1585575111.git.michal.simek@xilinx.com>
 <87imikufes.fsf@mpe.ellerman.id.au>
 <12db51d6-d848-118e-5ec1-a4172bd47aa4@xilinx.com>
 <87y2rftrx7.fsf@mpe.ellerman.id.au> <s5hk12z4hj5.wl-tiwai@suse.de>
 <02e7f790-b105-de67-799c-0fe065e58320@xilinx.com>
 <c22540fb-1c54-b718-9045-3ee645c30322@monstr.eu>
Date: Tue, 26 May 2020 23:44:57 +1000
Message-ID: <87wo4yerom.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 27 May 2020 07:15:42 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Michal Simek <monstr@monstr.eu> writes:
> Hi Michael,
>
> On 01. 04. 20 13:30, Michal Simek wrote:
>> On 01. 04. 20 12:38, Takashi Iwai wrote:
>>> On Wed, 01 Apr 2020 12:35:16 +0200,
>>> Michael Ellerman wrote:
>>>>
>>>> Michal Simek <michal.simek@xilinx.com> writes:
>>>>> On 01. 04. 20 4:07, Michael Ellerman wrote:
>>>>>> Michal Simek <michal.simek@xilinx.com> writes:
>>>>>>> Hi,
>>>>>>>
>>>>>>> recently we wanted to update xilinx intc driver and we found that function
>>>>>>> which we wanted to remove is still wired by ancient Xilinx PowerPC
>>>>>>> platforms. Here is the thread about it.
>>>>>>> https://lore.kernel.org/linux-next/48d3232d-0f1d-42ea-3109-f44bbabfa2e8@xilinx.com/
>>>>>>>
>>>>>>> I have been talking about it internally and there is no interest in these
>>>>>>> platforms and it is also orphan for quite a long time. None is really
>>>>>>> running/testing these platforms regularly that's why I think it makes sense
>>>>>>> to remove them also with drivers which are specific to this platform.
>>>>>>>
>>>>>>> U-Boot support was removed in 2017 without anybody complain about it
>>>>>>> https://github.com/Xilinx/u-boot-xlnx/commit/98f705c9cefdfdba62c069821bbba10273a0a8ed
>>>>>>>
>>>>>>> Based on current ppc/next.
>>>>>>>
>>>>>>> If anyone has any objection about it, please let me know.
>>>>>>
>>>>>> Thanks for taking the time to find all this code and remove it.
>>>>>>
>>>>>> I'm not going to take this series for v5.7, it was posted too close to
>>>>>> the merge window, and doing so wouldn't give people much time to object,
>>>>>> especially given people are distracted at the moment.
>>>>>>
>>>>>> I'm happy to take it for v5.8, assuming there's no major objections.
>>>>>
>>>>> Sure. Just to let you know Christophe Leroy included this patch in his
>>>>> series about ppc405 removal. It should be the same.
>>>>>
>>>>> If you don't want to take that alsa patch I can send it separately and
>>>>> this patch can be taken from his series. I don't really mind but please
>>>>> let me know what way you prefer.
>>>>
>>>> It's better to keep it all together, so I'm happy take the alsa patch as
>>>> well, it's already been acked.
>
> Can you please take this series? I know that there is v5 from Christophe
> which has this 1/2 as 1/13. But I need this alsa patch too and I would
> like to close this because it is around for almost 2 months and none
> raised a concern about removing just these Xilinx platforms.

Sorry I meant to reply to your last mail.

I have Christophe's series in my testing branch, planning for it to be
in v5.8.

Even if the rest of his series doesn't make it for some reason, as you
say the Xilinx removal is uncontroversial so I'll keep that in.

I forgot about the sound patch, I'll pick that up as well.

cheers
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
