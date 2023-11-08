Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69AF57E5EDB
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 20:52:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCD1610E195;
	Wed,  8 Nov 2023 19:52:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 894 seconds by postgrey-1.36 at gabe;
 Wed, 08 Nov 2023 19:52:33 UTC
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com
 [66.111.4.229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0E4210E19A
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 19:52:32 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 687A25809A6;
 Wed,  8 Nov 2023 14:37:35 -0500 (EST)
Received: from imap51 ([10.202.2.101])
 by compute5.internal (MEProxy); Wed, 08 Nov 2023 14:37:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1699472255; x=1699479455; bh=TuAUBn+gwTzKKR6XAwbb0F/b3IHOZTvECkt
 LGe4hx4g=; b=MpP4b56x0KBMpvmmk34khrpdqgaPpulwL1SW5QZNpR0pZbL+1mC
 tkgP6Crt1QszVtxegS3rDdmsnyHC8byp5kRjx+SPeLzX2GG7rLCItkjcgz0EdNWv
 Gq69ZGou2LiNrtaC7FaZPkws+icIw7tlu8NlHzzqZz3F6/T5ke0CjNfT5CzOIzcO
 wlzgmN6+4r3Yu6FokdfkzE9zpJNYuZ8GtMHqVYbPQiP/PZAVr4gD+0R65k8mK/GL
 TQX5MFWouHszC2cFQ8cULo8TEtCwqpaexq/q002RFilA2NNtMFPjUwSQebD9k8jn
 wAX9oI/LiWUh39T8sqdrJKhCiLqAx/VKgpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1699472255; x=1699479455; bh=TuAUBn+gwTzKKR6XAwbb0F/b3IHOZTvECkt
 LGe4hx4g=; b=ehqYku5jaD5aa8sQ6H1yoT4VXUfRnaoNcziQHMGaIXhItKgqAj4
 Hlc3loXGRlRiaTOqNhvj2uKXLY0x/2v4YoUSCCZaMgxaprHVMVkWZ5QubLY/Jb+X
 slx1zHyanQdRJk3AaZ/kME5bd0gKMVHE7D5VkKqAr+Xs8yhTIy0LndSevkJ+DVIO
 GY0/rjRxikPPYllrW3ZRaUQb789TbLCQtJmdAQFz1vAnRgOar288487BsvpEsdTp
 LQ4scdpYhMDJ5fvQheRWQymSodK3voIoiRxGrKzWBgQzNoPaIhI2uKhQG9ZEbG8l
 N6PvxTQbZDJj1iMQzok8F85XOSQCTEIlBfw==
X-ME-Sender: <xms:feNLZbHQUcczMbInEIUBgObHjW0UpBNORQ7x_Y8Ypx4p7LG9PdI5tA>
 <xme:feNLZYX9doh1U8iuWa6zqM6NuELh7Qh3HEkQ0GZRN_NG1L1cqkPlAYPc3JWQwdwSK
 4EsvATv1wCBrLE6tmA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudduledguddvhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedf
 tehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrf
 grthhtvghrnhepgeefjeehvdelvdffieejieejiedvvdfhleeivdelveehjeelteegudek
 tdfgjeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:feNLZdLHawZeagz4RHPjBAOgtuv5RJQEfb3r_-W1NqPoLhX5l7zbZg>
 <xmx:feNLZZEs5icyy541jo03y-vdYpm91DiTp34yB-42NIzCdUT0--dexA>
 <xmx:feNLZRUE-9jBS0gJI7lscQ6-L93osWu88ZKWbrlbY3DvnbG8qPI9Xg>
 <xmx:f-NLZSv4fJ5MAT-ZrZwfcrNWEWa7rd7CJsHSMVq86iF4ZJzOEDo-5w>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 421A9B60089; Wed,  8 Nov 2023 14:37:33 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1108-g3a29173c6d-fm-20231031.005-g3a29173c
MIME-Version: 1.0
Message-Id: <d94de5b8-db92-4055-9484-f2666973c02a@app.fastmail.com>
In-Reply-To: <ecedb0f1-9543-35c6-18bd-723e6bf21173@csgroup.eu>
References: <20231108125843.3806765-1-arnd@kernel.org>
 <20231108125843.3806765-16-arnd@kernel.org>
 <ecedb0f1-9543-35c6-18bd-723e6bf21173@csgroup.eu>
Date: Wed, 08 Nov 2023 20:37:12 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Arnd Bergmann" <arnd@kernel.org>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Masahiro Yamada" <masahiroy@kernel.org>,
 "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH 15/22] arch: vdso: consolidate gettime prototypes
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
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>,
 "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Netdev <netdev@vger.kernel.org>, guoren <guoren@kernel.org>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Will Deacon <will@kernel.org>,
 Greg Ungerer <gerg@linux-m68k.org>, Nicolas Schier <nicolas@fjasle.eu>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>,
 Ard Biesheuvel <ardb@kernel.org>,
 "linux-bcachefs@vger.kernel.org" <linux-bcachefs@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Vineet Gupta <vgupta@kernel.org>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Matt Turner <mattst88@gmail.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>, Heiko Carstens <hca@linux.ibm.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Nicholas Piggin <npiggin@gmail.com>, Nathan Chancellor <nathan@kernel.org>,
 "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
 Steven Rostedt <rostedt@goodmis.org>, Andy Lutomirski <luto@kernel.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 Timur Tabi <timur@kernel.org>, Geoff Levand <geoff@infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kent Overstreet <kent.overstreet@linux.dev>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
 Dinh Nguyen <dinguyen@kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>,
 "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>,
 "David S . Miller" <davem@davemloft.net>,
 Alexander Viro <viro@zeniv.linux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 8, 2023, at 19:31, Christophe Leroy wrote:
> Le 08/11/2023 =C3=A0 13:58, Arnd Bergmann a =C3=A9crit=C2=A0:

> powerpc has functions doing more or less the same, they are called=20
> __c_kernel_clock_gettime() and alike with their prototypes siting in=20
> arch/powerpc/include/asm/vdso/gettimeofday.h
>
> Should those prototypes be moved to include/vdso/gettime.h too and=20
> eventually renamed, or are they considered too powerpc specific ?

I don't actually know, my initial interpretation was that
these function names are part of the user ABI for the vdso,
but I never looked closely enough at how vdso works to
be sure what the actual ABI is.

If __c_kernel_clock_gettime() etc are not part of the user-facing
ABI, I think renaming them for consistency with the other
architectures would be best.

     Arnd
