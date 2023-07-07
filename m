Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EAD274B30F
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 16:33:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BFFA10E5A2;
	Fri,  7 Jul 2023 14:32:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCCC610E5A2
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 14:32:54 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id DF4AA5C0110;
 Fri,  7 Jul 2023 10:32:53 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute6.internal (MEProxy); Fri, 07 Jul 2023 10:32:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1688740373; x=1688826773; bh=a8
 gC4VrFLmC/qpOerDNkuWSQ8w0qNylgReMLmB5sIDo=; b=d1BcLo8CSCj2vEu4sq
 FKWaxyR2AN5b8VcvmmiC20KmbyIuYFF8AhTGijC4V0ua412/w5d/qLrDdg933k/f
 usKCtYCCDApg+v87ENqGQ61nnkWgTQpV1Wb1AGsQvwW/fYJVjzQjLFMkKyeU0YOZ
 s1hwmXO+RTft+W3JhiO6/m0TZDXug31wMUYR+VQEFI1sdjvIpxgueiDQt3xSFTG/
 ttmShmncqLpqp6iGI3twYl2GhLT+c1ex4gsnYzuVSSIvDqPOAgHL6kYFr5CsYUOZ
 NXbbLWdB7dAVRzLsfKXGFy7iz+vtg7g31z0DEWCa2cKD1agnmQIsieF+WVg0hT8I
 p6/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1688740373; x=1688826773; bh=a8gC4VrFLmC/q
 pOerDNkuWSQ8w0qNylgReMLmB5sIDo=; b=d/QtLAESgocsLBB4JMrqAXbDtF2bk
 cDqM0ZS1FhJCAGj2VlmVZJjUbZgnxsZJpQcUu2tSdPq/99Dy3HaXJWYhGCOfNkx9
 iuc2++SBlHplnSQHSdZvWdxQ6V2prPQdPcVg1kl6IN5npnoTIiadc3URbqXZh1fQ
 zFPqbXVCnZz2CxKl82+xr0U79oV3dTYSRtJJFMYOrLFAFlayBYSKB+udQHm/OkHE
 kBdRJACO/thHsOdY/rloq4gIMHf135R15M9Kt7/wo6CYV7qHAXRsxEnOBuuXWV63
 OviduagelG0BPSEovsf162AQOJHo++PWkG7R6JjrnMWuQy8zxDzhlmTbw==
X-ME-Sender: <xms:EiKoZGtXxcv48dTRTIIeJ8zLC1WMuKcLp_Cti7jnB55vTV9mea93bw>
 <xme:EiKoZLd2KrjvC-pS6i8CyevFdZf0zZZhxjSpUGOSjopB-lpJavBT_b4l6OcXPBIQM
 5dK8yBhXlP5mRVmiqM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrvddugdejjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
 ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
 gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
 ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
 hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:EiKoZBxO0aqWZ1EBdhkXXAoMHNpD0B1aYPO3vFtXpcqpB62RKYfzZw>
 <xmx:EiKoZBPW_lXo_1nEnV_hmVIRAIcJg1hE_4dqDtbwOXBOHMw9puaQWQ>
 <xmx:EiKoZG_8naHDpdvCKhjiB5IJ0nagswHWxs2OOcBlXT9OjmqZ9swtxg>
 <xmx:FSKoZIHhGZqhs0ZSwGNE4lwq2tbt5vI87UoN8uZSekAHk-MBzJlbjQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 55D6AB60089; Fri,  7 Jul 2023 10:32:50 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-531-gfdfa13a06d-fm-20230703.001-gfdfa13a0
Mime-Version: 1.0
Message-Id: <ff9bfcfa-fa3b-42d2-b429-059b5103bce2@app.fastmail.com>
In-Reply-To: <87jzvbyh4p.fsf@minerva.mail-host-address-is-not-set>
References: <20230707095415.1449376-1-arnd@kernel.org>
 <20230707095415.1449376-2-arnd@kernel.org>
 <87jzvbyh4p.fsf@minerva.mail-host-address-is-not-set>
Date: Fri, 07 Jul 2023 16:32:29 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Javier Martinez Canillas" <javierm@redhat.com>,
 "Arnd Bergmann" <arnd@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>
Subject: Re: [PATCH 2/4] vgacon: rework screen_info #ifdef checks
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
Cc: linux-fbdev@vger.kernel.org, linux-ia64@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 WANG Xuerui <kernel@xen0n.name>, Ard Biesheuvel <ardb@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Matt Turner <mattst88@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Richard Henderson <richard.henderson@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, loongarch@lists.linux.dev,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 7, 2023, at 15:40, Javier Martinez Canillas wrote:
>> diff --git a/arch/ia64/kernel/setup.c b/arch/ia64/kernel/setup.c
>> index 5a55ac82c13a4..0c09ff7fde46b 100644
>> --- a/arch/ia64/kernel/setup.c
>> +++ b/arch/ia64/kernel/setup.c
>> @@ -86,9 +86,11 @@ EXPORT_SYMBOL(local_per_cpu_offset);
>>  #endif
>>  unsigned long ia64_cycles_per_usec;
>>  struct ia64_boot_param *ia64_boot_param;
>> +#if defined(CONFIG_VGA_CONSOLE) || defined(CONFIG_EFI)
>>  struct screen_info screen_info;
>
> I think that only screen_info should be guarded by both symbols ?
>
>>  unsigned long vga_console_iobase;
>
> It seems this variable was never used since it was introduced by commit
> 66b7f8a30437 ("[IA64-SGI] pcdp: add PCDP pci interface support") ?
>
>>  unsigned long vga_console_membase;
>
> And this is only used by mdacon (not supported by ia64), vgacon and
> vga16fb (not supported by ia64 either).
>
> So this could just be guarded just by CONFIG_VGA_CONSOLE for ia64 ?

Right, I though about doing this more accurately, but in the end
went for the simplest change rather than spending much more time
trying to clean up the unused variables etc.

Let me know if you'd prefer me to respin this part, otherwise
I'd call the ia64 bit good enough for the purpose of the series.

     Arnd
