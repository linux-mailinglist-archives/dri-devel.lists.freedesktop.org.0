Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E839D7E5FA3
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 22:07:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFDEB10E85B;
	Wed,  8 Nov 2023 21:07:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com
 [66.111.4.230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 250D610E85B
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Nov 2023 21:07:43 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailnew.nyi.internal (Postfix) with ESMTP id 5A16D580918;
 Wed,  8 Nov 2023 16:07:41 -0500 (EST)
Received: from imap51 ([10.202.2.101])
 by compute5.internal (MEProxy); Wed, 08 Nov 2023 16:07:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
 1699477661; x=1699484861; bh=D9PBCL8QJKdjrKS2aPJfuUQXeRbWRMeFHOK
 ckMk8fx4=; b=FzEkiJbbsOcjeyoGRwxvz+27m/0EEN52kEtbmSfnSLxjsunhTiL
 NfUpLQ2lMaNQM96rJSWMhX1vu2lvWTmYQ+94rPQoTRikLBiEjVkhx122mvhBFjKQ
 U5TGFlasJtrQz1D7CH1hVXq/4CUXHEmC0SXgOgbsxsmqVBXPjJ6IiWR1L/VYLFZD
 XaGxAnAinQklWeTyoPeeAGtYUUQIZX8H/zBze0un/GO9mbGPspFKceZcmPF+unL4
 kNNYqyz4Nnv3vLyDQfTWJAwW2so0MUevk7DJxqisp5Xl7R8/m+axDeNitBypskfX
 D8Rsn3kpcQJ2fu6hUerp+k7/Bpi8xmjAE2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1699477661; x=1699484861; bh=D9PBCL8QJKdjrKS2aPJfuUQXeRbWRMeFHOK
 ckMk8fx4=; b=LmqNAy3jRW8lY5IcykLYM+OvjkcYQjDv2Cd5j1qdrakTjXXA/j+
 /E3SAMCFGeXJAd+vBXJDuwGp38C0j3EBw7K0I7TFk+KdegquYjjlo+2qe+Ss6fEx
 vTFJPMC1jaxZ1RiQPNLyTH4/PtfJEIBJRBDr+VVRztDGI1MBoVaVcWj5nK9n57lT
 IBiw5NhM15aVUl9nTNk4GEH/jjyPtDc5nRFt1GtJMHbfoOK2CNQf2Dsq4mugP1kK
 dALzlNsXk+kultkDq6XTINxe/wKYr9lcblw8RuAMeZQf5KYd1CJy2yk9Lj+caD2x
 oxDrnMalA2nkjbwEcTlCPYvCvjr0Nrwhw/Q==
X-ME-Sender: <xms:m_hLZRjCM3LJYcd_H3Y5bpOYjbi1yqnza3xT2w7kP2rHPp5sCfzJDA>
 <xme:m_hLZWBQgSaXFHWT19d86A-NgdffQEOdIcOuYzVBH4zvXhu-7j9M2L00zWERZJgRe
 v8hgNLAyXZqY4agMGc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudduledgudegfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedf
 tehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrf
 grthhtvghrnhepgeefjeehvdelvdffieejieejiedvvdfhleeivdelveehjeelteegudek
 tdfgjeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 eprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:m_hLZRHRJeNeY1dqiPXQRyfkkAf70-rPEGX-6eg0F6Q137FpjKDzrQ>
 <xmx:m_hLZWS2fm-qbaVb5GtignMLAwFFSwCYf0sAO1wU3h5TQwBje9c7Gg>
 <xmx:m_hLZexERWmFNZFNunigpkMDJerei1oQtEjo173y5fN7JgbzFQPvUQ>
 <xmx:nfhLZaaJuDFNhR3nYwXvLB9jLUndDir4RaYg61Qk7sjjclFK2W-zJg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 48539B60089; Wed,  8 Nov 2023 16:07:39 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1108-g3a29173c6d-fm-20231031.005-g3a29173c
MIME-Version: 1.0
Message-Id: <e7753f82-c3de-48fc-955d-59773222aaa9@app.fastmail.com>
In-Reply-To: <CAMuHMdXgdn_cMq0YeqPu3sUeM5cEYbCoodxu8XwCGiRJ-vFsyw@mail.gmail.com>
References: <20231108125843.3806765-1-arnd@kernel.org>
 <20231108125843.3806765-11-arnd@kernel.org>
 <CAMuHMdXgdn_cMq0YeqPu3sUeM5cEYbCoodxu8XwCGiRJ-vFsyw@mail.gmail.com>
Date: Wed, 08 Nov 2023 22:07:18 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Arnd Bergmann" <arnd@kernel.org>
Subject: Re: [PATCH 10/22] microblaze: include linux/cpu.h for trap_init()
 prototype
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
 Vincent Guittot <vincent.guittot@linaro.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Masahiro Yamada <masahiroy@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Greg Ungerer <gerg@linux-m68k.org>,
 "linux-bcachefs@vger.kernel.org" <linux-bcachefs@vger.kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Vineet Gupta <vgupta@kernel.org>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Matt Turner <mattst88@gmail.com>,
 linux-snps-arc@lists.infradead.org, linux-trace-kernel@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, linux-kbuild@vger.kernel.org,
 Heiko Carstens <hca@linux.ibm.com>,
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

On Wed, Nov 8, 2023, at 21:42, Geert Uytterhoeven wrote:
>
> On Wed, Nov 8, 2023 at 2:01=E2=80=AFPM Arnd Bergmann <arnd@kernel.org>=
 wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> Microblaze runs into a single -Wmissing-prototypes warning when that =
is
>> enabled:
>>
>> arch/microblaze/kernel/traps.c:21:6: warning: no previous prototype f=
or 'trap_init' [-Wmissing-prototypes]
>>
>> Include the right header to avoid this.
>>
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> Thanks for your patch!
>
>>  arch/alpha/kernel/traps.c      | 1 +
>>  arch/csky/include/asm/traps.h  | 2 --
>>  arch/csky/kernel/traps.c       | 1 +
>>  arch/m68k/coldfire/vectors.c   | 3 +--
>>  arch/m68k/coldfire/vectors.h   | 3 ---
>
> Ah, so this is where the m68k changes listed in the cover letter are
> hiding ;-)
>
>>  arch/microblaze/kernel/traps.c | 1 +
>>  arch/sparc/kernel/traps_32.c   | 1 +
>>  arch/sparc/kernel/traps_64.c   | 1 +
>>  arch/x86/include/asm/traps.h   | 1 -
>>  arch/x86/kernel/traps.c        | 1 +
>>  10 files changed, 7 insertions(+), 8 deletions(-)
>>  delete mode 100644 arch/m68k/coldfire/vectors.h
>
> Obviously the non-microblaze changes should be spun off in separate
> patches.

I messed up one of my rebases here and accidentally sent
the wrong changelog text. My intention was to have the
combined patch but with this text:

    arch: include linux/cpu.h for trap_init() prototype
   =20
    some architectures run into a -Wmissing-prototypes warning
    for trap_init()
   =20
    arch/microblaze/kernel/traps.c:21:6: warning: no previous prototype =
for 'trap_init' [-Wmissing-prototypes]
   =20
    Include the right header to avoid this consistently, removing
    the extra declarations on m68k and x86 that were added as local
    workarounds already.
   =20
    Signed-off-by: Arnd Bergmann <arnd@arndb.de>


I made the same mistake with the "arch: add do_page_fault prototypes"
patch that was missing an explanation.

      Arnd
