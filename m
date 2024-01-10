Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AFF829736
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 11:20:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDDF010E747;
	Wed, 10 Jan 2024 10:20:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BF6810E747
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 10:20:42 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.west.internal (Postfix) with ESMTP id 0F1522B005B2;
 Wed, 10 Jan 2024 05:20:33 -0500 (EST)
Received: from imap51 ([10.202.2.101])
 by compute5.internal (MEProxy); Wed, 10 Jan 2024 05:20:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1704882033;
 x=1704889233; bh=syE5UlqFQxkc/rlq6eSMNsD1Ft+dm/4kEwr9kygNnZw=; b=
 JP39xJs9nz7sao0Mw71uaZ/eiQXIoVplqugjUGZYhQ7guX3+bZhIuPn+FTIF0P/U
 kFKA5/KKnrvphnR9VVDqO7b9pSS6wICSG3UluT021gLpH5lthNGCLq13PQ9KJjEJ
 1ljadw2mqVer0c9AYE4e0vRLjHJbc6Ff1HjG1hJRNVl2d58ls4RnrwTbd1lVfNCT
 /p4Lj2EC6KAxjG6XjKrUccDBnfGAbkRQ9JltT0U4qRnMynNH4R98FTVJAThZmA9u
 jQBMWbwGpK+oalRypy9TC8j8qfMWGON+J6gzAN0ArgN5Lu7H51+TiItFXrD89wmd
 vZG/l4E5n8fT1+kO8ueizQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1704882033; x=
 1704889233; bh=syE5UlqFQxkc/rlq6eSMNsD1Ft+dm/4kEwr9kygNnZw=; b=U
 mPKqJXZVgmHnjEzCuKASxczr7emU7nTNeH25WN9+C8eCNew7DVr1bRr/+srzmGUM
 OLnTHQSNkb+EpmX50WeEu35xdXIziu96hJDuEpPD56diPrxIQi32vTaocnV2ckb1
 HD7aUd5o6s31cHFZPeyloB1t3fGS7jNWGPLq0zyRBeBaK7y25NpZqIyzw5gFDKsU
 pgPvYLFgWLau455DHxp57ybe58+CnFFt/AMqw12H893i5lWeRlqp9SNjB20pdoew
 +mPjKLaT3vdzJvpuSAYIlv2XgkShbWLlHqONIAN9nqEm1n8JAXEzEYFZ9iKC3jQK
 mYsm11bq3sdDv2qml7QSw==
X-ME-Sender: <xms:b2-eZV_KMr_PAO_kk0ge4HNc0mbJzBFnJKYHP3Wn5ArwwAHJiUgo6g>
 <xme:b2-eZZug-0NmwZ3_tB5EneosW6omYAdslyOjXGHW_SxmM98uPtte7R3mOTMO5r8vb
 U5elh8Vhr3nkMsPDkU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdeiuddgudegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
 rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
 htthgvrhhnpeegfeejhedvledvffeijeeijeeivddvhfeliedvleevheejleetgedukedt
 gfejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:b2-eZTD8snTlVFeWedik1H69gSlAKgK5Cfa5oODX4P9VlRv3yNVtaA>
 <xmx:b2-eZZfs69_EmPDsleKZW4CQjR8pVKQx5Y8bLR1JfUiKHCBXHCWmmA>
 <xmx:b2-eZaMqe5fTef3bZBI_1IiTCXh5CeSfqu9FYtz6ovkxTl1P8-0xSA>
 <xmx:cW-eZYGsc9qNXZdY9id5LaSUAgT20Cc4RFtJpxiSbqeKVbO3FhZS773eVF0>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 64819B6008D; Wed, 10 Jan 2024 05:20:31 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1364-ga51d5fd3b7-fm-20231219.001-ga51d5fd3
MIME-Version: 1.0
Message-Id: <fdf707b9-f39d-4f5a-a8bf-1bcb8cc6594f@app.fastmail.com>
In-Reply-To: <CAMuHMdV8uFKntiMfwwmnFpd4Dcx8vJDwS6r1iBLtkh40N71dbw@mail.gmail.com>
References: <20231108125843.3806765-1-arnd@kernel.org>
 <20231108125843.3806765-9-arnd@kernel.org>
 <CAMuHMdV8uFKntiMfwwmnFpd4Dcx8vJDwS6r1iBLtkh40N71dbw@mail.gmail.com>
Date: Wed, 10 Jan 2024 11:20:10 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Arnd Bergmann" <arnd@kernel.org>
Subject: Re: [PATCH 08/22] [v2] arch: consolidate arch_irq_work_raise
 prototypes
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Mark Rutland <mark.rutland@arm.com>, Juri Lelli <juri.lelli@redhat.com>,
 linux-fbdev@vger.kernel.org, x86@kernel.org, loongarch@lists.linux.dev,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, Netdev <netdev@vger.kernel.org>,
 guoren <guoren@kernel.org>,
 Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
 Helge Deller <deller@gmx.de>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Nicolas Schier <nicolas@fjasle.eu>, linux-s390@vger.kernel.org,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Masahiro Yamada <masahiroy@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Greg Ungerer <gerg@linux-m68k.org>,
 "linux-bcachefs@vger.kernel.org" <linux-bcachefs@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Vineet Gupta <vgupta@kernel.org>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Matt Turner <mattst88@gmail.com>,
 linux-snps-arc@lists.infradead.org, linux-trace-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@rivosinc.com>, Kees Cook <keescook@chromium.org>,
 linux-kbuild@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, linux-m68k@lists.linux-m68k.org,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Andy Lutomirski <luto@kernel.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 Timur Tabi <timur@kernel.org>, Geoff Levand <geoff@infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kent Overstreet <kent.overstreet@linux.dev>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Dinh Nguyen <dinguyen@kernel.org>, linux-usb@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 linux-alpha@vger.kernel.org, linux-mtd@lists.infradead.org,
 Andrew Morton <akpm@linux-foundation.org>,
 David Woodhouse <dwmw2@infradead.org>,
 "David S . Miller" <davem@davemloft.net>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 10, 2024, at 10:03, Geert Uytterhoeven wrote:
> On Wed, Nov 8, 2023 at 2:01=E2=80=AFPM Arnd Bergmann <arnd@kernel.org>=
 wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> The prototype was hidden in an #ifdef on x86, which causes a warning:
>>
>> kernel/irq_work.c:72:13: error: no previous prototype for 'arch_irq_w=
ork_raise' [-Werror=3Dmissing-prototypes]
>
> This issue is now present upstream.
>
>> Some architectures have a working prototype, while others don't.
>> Fix this by providing it in only one place that is always visible.
>>
>> Acked-by: Catalin Marinas <catalin.marinas@arm.com>
>> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
>> Acked-by: Guo Ren <guoren@kernel.org>
>> Reviewed-by: Alexander Gordeev <agordeev@linux.ibm.com>
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> Tested-by: Geert Uytterhoeven <geert@linux-m68k.org>

I've sent out the asm-generic pull request now,
that contains the fix. Thanks for the reminder.

      Arnd
