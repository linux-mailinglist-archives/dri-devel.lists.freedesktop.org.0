Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EA788FF99
	for <lists+dri-devel@lfdr.de>; Thu, 28 Mar 2024 13:52:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0682810F291;
	Thu, 28 Mar 2024 12:52:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.b="lJeza5yy";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="Bb0RNIiz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh4-smtp.messagingengine.com
 (fhigh4-smtp.messagingengine.com [103.168.172.155])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48B7810F5FC
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Mar 2024 12:52:20 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id 521AA11400CB;
 Thu, 28 Mar 2024 08:52:19 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute5.internal (MEProxy); Thu, 28 Mar 2024 08:52:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:subject
 :subject:to:to; s=fm1; t=1711630339; x=1711716739; bh=Lh4MuWdYpt
 nETV0Wdnx8P7s+c4JMcLpkbpgMh56pLFU=; b=lJeza5yyYcri2tqJXpeirr9IYD
 QgEwfGN2RlgSUZc2rPDvxJhYxVV/089I5H8oqHMLkN1+FSFdvimIGpzJdybXiVd5
 2Hh7M3Fpr5K+u/YoqlSgteczcWUPaZe5PebEFQhsn8cz06VmU1/BTqmSG88UpbbW
 IRDHUvWeKM93m9tnIVFqW9PGvlFsvxcia5odqwnh/sOipC53vjPC915vrwXdf3ah
 NQDPw1x0KM/1Z6i113r4SH/r8f13MvPNNpADkwyEjH+JePCvmsqUsdRpbb4ui8li
 J45J5/3Dd68gaDOg4hUkS0HOa1RLi7A6iqh9EgTFdOh7UQ2jAtXzjQh8oNKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1711630339; x=1711716739; bh=Lh4MuWdYptnETV0Wdnx8P7s+c4JM
 cLpkbpgMh56pLFU=; b=Bb0RNIizRq1jBDXW2lq5jH171BDUGdtZOBg2yhJaGCQ5
 MBUTySW+5j/DdyxglMRP3qw/rYCu0oiLgYsbKnKkbNOTFRIfXop0TJU5J9/Nuwht
 IH+tgwf4DUiVeonklvbKjpPszY0PLMdnEchwigznQZzcjH99EbmiLLpg1qf34krT
 iJghoc6WkCjfz5VazuLrz8Gy/4B3LuUTJh7DtGLExpprxflXUKQ5u16km0VO9gz/
 /xIY+MDt7wkkOiFfd34Gcgjv5bdHKl97f1ijnvyK1q2AxPNwwE/+Te5MSHhM3YvC
 /1bTpCSbgPPNegyP+O+CzYBZP3dLsoFPbxV98O3B/Q==
X-ME-Sender: <xms:AWgFZudGwHi-Z_ipu-DAtsUL6gJmM5eGp3QTYrVOimzirRINehkvoQ>
 <xme:AWgFZoPWeyCXm0gz801Wq1t5hhpzKklxaM1TLa1qtwhXC7iwXRxMyw3onJxip2eAj
 WWQT6wPeOdpsid83Ls>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudduledggeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
 nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
 htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
 teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
 hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:AWgFZvhfmGntOEERrkeD9wQxbG3BBl0ymkFJFs1vm6jkXMFebhBQyQ>
 <xmx:AWgFZr8YnamA7dSxSPnNPmMKwDGtXJdBScUKn5dZp1VpBND1nJVyTQ>
 <xmx:AWgFZqvndgo1Vk3LX14Uj8eNF0kPqgRQgY7FmHK6m8-J_1U1eqBvWg>
 <xmx:AWgFZiHiTqUPJIypCNK7EW6Z8ridICdLObLwSNabIfJrzpIA_ulyaA>
 <xmx:A2gFZq2IF3v0r4kisD05XZs3sJZhIlR4o-eCVWP-cdF5aXis-a6QEw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 69BC9B6008D; Thu, 28 Mar 2024 08:52:17 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-333-gbfea15422e-fm-20240327.001-gbfea1542
MIME-Version: 1.0
Message-Id: <72e8aa58-c732-4a96-bcb1-32310ee041b3@app.fastmail.com>
In-Reply-To: <140d6bb3-5f44-49cb-846b-7141e551eedd@gmx.de>
References: <20240327204450.14914-1-tzimmermann@suse.de>
 <20240327204450.14914-4-tzimmermann@suse.de>
 <140d6bb3-5f44-49cb-846b-7141e551eedd@gmx.de>
Date: Thu, 28 Mar 2024 13:51:57 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Helge Deller" <deller@gmx.de>, "Thomas Zimmermann" <tzimmermann@suse.de>, 
 "Javier Martinez Canillas" <javierm@redhat.com>, sui.jingfeng@linux.dev
Cc: Linux-Arch <linux-arch@vger.kernel.org>, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-sh@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-snps-arc@lists.infradead.org,
 linux-kernel@vger.kernel.org, "Vineet Gupta" <vgupta@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, "Huacai Chen" <chenhuacai@kernel.org>,
 "WANG Xuerui" <kernel@xen0n.name>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Yoshinori Sato" <ysato@users.sourceforge.jp>,
 "Rich Felker" <dalias@libc.org>,
 "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 "David S . Miller" <davem@davemloft.net>,
 "Andreas Larsson" <andreas@gaisler.com>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH v2 3/3] arch: Rename fbdev header and source files
Content-Type: text/plain
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 28, 2024, at 13:46, Helge Deller wrote:
> On 3/27/24 21:41, Thomas Zimmermann wrote:

>> +++ b/arch/arc/include/asm/video.h
>> @@ -0,0 +1,8 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +
>> +#ifndef _ASM_VIDEO_H_
>> +#define _ASM_VIDEO_H_
>> +
>> +#include <asm-generic/video.h>
>> +
>> +#endif /* _ASM_VIDEO_H_ */
>
> I wonder, since that file simply #includes the generic version,
> wasn't there a possibility that kbuild could symlink
> the generic version for us?
> Does it need to be mandatory in include/asm-generic/Kbuild ?
> Same applies to a few other files below.

It should be enough to just remove the files entirely,
as kbuild will generate the same wrappers for mandatory files.

     Arnd
