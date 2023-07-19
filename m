Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 997A07598E9
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jul 2023 16:58:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3BB410E4C3;
	Wed, 19 Jul 2023 14:58:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47E2C10E4C3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jul 2023 14:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de;
 s=s31663417; t=1689778659; x=1690383459; i=deller@gmx.de;
 bh=iQUnHGbic8gu+ig2/dvuRMVZ9NdHOWOrYR1bIcIdEEI=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=Oj76ZDbvIWlVeT7RknkMQBRZveyGPeaavM/7Hd2yo0VaxgBreq1RYAEB0hFfewqVvvghv6Q
 bodOrVr550D5HZlqDgB3YLfPOrTCQM3TCjKHDB2dJOZHoIa71786MQxwB1NbvycigzSKOxAXb
 6ZzEXcDb9k3UgAEfth7TfHSLA58vvfzUv6ulGW71L5xNw0gixI8MKF5gnbT3fhbWS+ATeYNKt
 ieCK2TFKuSXE/ozWDwJJy++aTZ0SBnrY/ovnKdb81Uk7xmvoS7C6bZynPoMyxlk0tyc4eBPNb
 ugz85t+iHLpPDHwe2/OJ0aXdRz0Qd8Wj5Gm6vVqKd6ptYS3WJ2ZA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.20.60] ([94.134.145.157]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N1Obb-1pwrjE0tCd-012rpb; Wed, 19
 Jul 2023 16:57:39 +0200
Message-ID: <6c9be40f-0970-3eb5-899f-b69aa09d7f97@gmx.de>
Date: Wed, 19 Jul 2023 16:57:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 0/9] video: screen_info cleanups
Content-Language: en-US
To: Arnd Bergmann <arnd@kernel.org>, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Javier Martinez Canillas <javierm@redhat.com>
References: <20230719123944.3438363-1-arnd@kernel.org>
From: Helge Deller <deller@gmx.de>
In-Reply-To: <20230719123944.3438363-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:YKbXr21JZgKRkgbsGmVJDM40tJR1qBdCxKWfG2/2zM1Hz5g95nU
 PY0FOmI/L2j9W1vGyLYbMi9ABDdfgWOPRCMO8zMry116yimj9tsvXc4s6fjnjRwkYdIoPKa
 n+9JxJJXhDMP2Ce+c3fQIz1wcyEzeBExDfucEwj81ZYLXufdZhN/dpMjy+bzjb7TNdOFqgM
 Ief2UkK3zX3uAV0dVEamQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:egu7CabpTFY=;cUfSSNb5FGDxvZd6PLuSysdSDvD
 ls5ct71ZsXDBRiFkda5EH38/nQ/EcAqCJZsUD40cSH/+igFVbthR3XF2Po8lNk1cqs1EYQCIm
 M/bNP4mwkBL0U5cBk8a7oo/RnMLCbsMCOBYccP1D8xm88u/QaFKZ8Q3yphrv+yPohojv/cdhw
 9uc+JLy6730Il4w/FO8mbH++J/ftKfmDZ1Sofwp3BC74D/cPKVNtj6MJKCnmxBufOnI6SmYoB
 2S/yrdA0s4catYwxtpxHM3qw3ad+06jWcK6vyHiCRvOom/FhPAW2DOqNBRgfVRjVqNNkCK1T+
 R+kY3p3qGKi67yqmoP7PyYbgt8ozyAYza5uml8XRMAO8h8HnG9PhpbBTMgJMCWcoNmhPGARkd
 39g8HecgJijqw57SdgghEDepDk7sJruagdtGZ2868LrRd1+i+TchHaii2BcwWpiYsWC/1Jg1p
 MiBZSrab+b4o06BLX/KJqYTcugazeV/g3/6FNIaPyOApN+Tqmv0kbjPi9aEso0ZaDYDcGEfEp
 UGyUC4NAS8Vk6cdQkMzuvtDIwy0Lfam4D/ERNFlqdybQ6k+vYPc/d1m2lyrpiCArcJh9w8iZv
 BydvWmnjmdvnxQ/ozWK++LnqAT+6AjTXLjpmtlM4YyYIR+y0DCsuhbJVefrYaIcexS9LB+1d9
 kxc7jGoCqjyFvgc6zNOKsUiGZwOLTDLjuUyUACf/QIUSqdRrjRHPw8VRISdmCJF3qXEqGku22
 PRBqA4Yt3B3/+1CHDZZA4kapOF9ZTTCQwBk3hy7mq/9XRQYULEAyX2HX9iJE0snjLeQjHi7TG
 CAebdhtQzKSHSt6891NcXCQyAntbr1DR+vZDS02S62uxQ=
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
Cc: linux-hyperv@vger.kernel.org, x86@kernel.org, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>,
 Will Deacon <will@kernel.org>, linux-efi@vger.kernel.org,
 Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 WANG Xuerui <kernel@xen0n.name>, "K. Y. Srinivasan" <kys@microsoft.com>,
 Ard Biesheuvel <ardb@kernel.org>, Wei Liu <wei.liu@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Huacai Chen <chenhuacai@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Russell King <linux@armlinux.org.uk>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Deepak Rawat <drawat.floss@gmail.com>, Ingo Molnar <mingo@redhat.com>,
 Matt Turner <mattst88@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 Haiyang Zhang <haiyangz@microsoft.com>, Nicholas Piggin <npiggin@gmail.com>,
 Borislav Petkov <bp@alien8.de>, loongarch@lists.linux.dev,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Khalid Aziz <khalid@gonehiking.org>, Brian Cain <bcain@quicinc.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Dinh Nguyen <dinguyen@kernel.org>, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-alpha@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/19/23 14:39, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> I refreshed the first four patches that I sent before with very minor
> updates, and then added some more to further disaggregate the use
> of screen_info:
>
>   - I found that powerpc wasn't using vga16fb any more
>
>   - vgacon can be almost entirely separated from the global
>     screen_info, except on x86
>
>   - similarly, the EFI framebuffer initialization can be
>     kept separate, except on x86.

Nice cleanup, Arnd!

You may add a
Acked-by: Helge Deller <deller@gmx.de>
to the series.


> I did extensive build testing on arm/arm64/x86 and the normal built bot
> testing for the other architectures.

> Which tree should this get merged through?

I suggest drm-misc or fbdev. Either is fine for me.

Since it applies cleanly onto git head, I can put it a few days into
the fbdev git tree to see if some builds break. Just let me know.

Helge
