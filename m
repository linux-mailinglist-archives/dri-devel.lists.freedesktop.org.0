Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D60B5FC21C
	for <lists+dri-devel@lfdr.de>; Wed, 12 Oct 2022 10:39:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21B6210E3CB;
	Wed, 12 Oct 2022 08:39:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BDFD10E3C6
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Oct 2022 08:38:56 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 789E53200B46;
 Wed, 12 Oct 2022 04:38:51 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute3.internal (MEProxy); Wed, 12 Oct 2022 04:38:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1665563931; x=1665650331; bh=2eHbNNYC76
 Ff2rNSIFRyMcnh2drE4bgfrHDmOgKqE2I=; b=Tl/vrVXQnU6s4RXLnCcLEPSsod
 qCki2kWIaXTUv9xtHVT4iqBc3BPYJDYXroJTBC5/BGTcUDf1ZwuwbaJAn+3sK9Fc
 Hj1Ch7hiZZar3TK1S+iEygfvBICNc07iJxwYUPGlJQPD1XGsTVcSPwJFuFOahIcw
 3SUuzwNecL1UUUnvWgc39atvyX5Lhf0ctOy0tf8Izi8YxVwAU6ViZ+a9OwpUobLU
 Z5CF7Nbbs9aNJqRHp8jYs6BeTxuW/phmR6MYT5oQnxcKU0ZknPnDZ4II3gKIdZpC
 GpuVj8hLSIuPzKbSmgdKsE9GAW91HLkAAjn5aFY6xSdQnP0p/pfjqr+X+9ng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm3; t=1665563931; x=1665650331; bh=2eHbNNYC76Ff2rNSIFRyMcnh2drE
 4bgfrHDmOgKqE2I=; b=sL7z2hAzw076YF3FiU9Us/LAikO1eXIXh3VSmokARzom
 pal434HxRwyKDTx75O9o98r+ZkRkEan4LWR7SQnZb7+NCGqfHxzYDmPWJFo4sbJt
 IY6d4fy+n+zNwr+iiZSq2uuvA7pH2wOZ7paUHdPuywLOUlANzgOr1XV7EfWXURVs
 gQMt68VNbulIGRj6x9fjc+TR6OhQOuGJvtx3FQ57A7XQFUQF5FwnAi4z1yXwFn1J
 qYiCX95PBQlDkeN3+U7WqtQEsTbD7izaqFlm75dL6Eaa0XECcr7dxghws7Uu8Rmn
 AzUs6WSMC+QpE8Un98SfUl0gadfa8/TEjRNQ90eUvQ==
X-ME-Sender: <xms:Gn1GY17wUcc3zCHhlCtTqhfYn9DLyMH5Ts8hFHmy23CGsXhRjRTW8A>
 <xme:Gn1GYy7odd4JHGdRuwvWoHVRrL0GiA4z16Wtfxi2rmD5hDM6FoTjL5BGQiluiNfRu
 jMmeScxpjFZUN0WWoY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeejkedgtdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
 nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
 htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
 teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
 hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:Gn1GY8eHlYz1iaoU21KVs_vuLzpaHbXSkrdXC47zf-9LT9RCJwvclw>
 <xmx:Gn1GY-IF_zXYTqXVqCmOSb75Y1OH2uHX4hnPjFUuZuzDC2nnZwK3GA>
 <xmx:Gn1GY5JResEySmkemvAnjvtxQif7U-sXCyx8rzTGijjQSVRBSfKMsA>
 <xmx:G31GYwYG3Ee3TNuqcjx9wuUSnbSXkzUx6a3kDmMttMFGTE8Tr79GxA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 2D9A6B60086; Wed, 12 Oct 2022 04:38:50 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1047-g9e4af4ada4-fm-20221005.001-g9e4af4ad
Mime-Version: 1.0
Message-Id: <fc33ebf7-ecb7-4686-ac31-0118a40595f6@app.fastmail.com>
In-Reply-To: <c80a6e2d-a3b9-8186-cc95-97c4775171ed@suse.de>
References: <20220928105010.18880-1-tzimmermann@suse.de>
 <20220928105010.18880-6-tzimmermann@suse.de>
 <23333ff7-3ae1-494f-7abe-62da6698fd00@redhat.com>
 <83071743-a7f2-f761-baa3-da688f26b5e3@suse.de>
 <9162f41f-28c3-493c-ab54-b1c4a2fdf494@app.fastmail.com>
 <fda959d7-1bae-716f-f01b-66d9db9096e0@suse.de>
 <654e3cfe-80d7-46c9-8e5e-461846e4df35@app.fastmail.com>
 <866c7033-0d4e-7b5d-008c-8eb16f99498b@suse.de>
 <f26ca6a1-feb1-4822-ac96-bc484b22f8a0@app.fastmail.com>
 <c80a6e2d-a3b9-8186-cc95-97c4775171ed@suse.de>
Date: Wed, 12 Oct 2022 10:38:29 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Javier Martinez Canillas" <javierm@redhat.com>,
 "David Airlie" <airlied@linux.ie>, "Daniel Vetter" <daniel@ffwll.ch>,
 "Helge Deller" <deller@gmx.de>, "Maxime Ripard" <maxime@cerno.tech>,
 sam@ravnborg.org, "Michal Suchanek" <msuchanek@suse.de>,
 "Michael Ellerman" <mpe@ellerman.id.au>, benh@kernel.crashing.org,
 "Paul Mackerras" <paulus@samba.org>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>, mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v4 5/5] drm/ofdrm: Support big-endian scanout buffers
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
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 12, 2022, at 10:27 AM, Thomas Zimmermann wrote:
> Am 12.10.22 um 09:44 schrieb Arnd Bergmann:
>> On Wed, Oct 12, 2022, at 9:40 AM, Thomas Zimmermann wrote:
>>> Am 12.10.22 um 09:17 schrieb Arnd Bergmann:
>>>> On Wed, Oct 12, 2022, at 8:46 AM, Thomas Zimmermann wrote:
>>>
>>>> Does qemu mark the device has having a particular endianess then, or
>>>> does it switch the layout of the framebuffer to match what the CPU
>>>> does?
>>>
>>> The latter. On neither architecture does qemu expose this flag. The
>>> default endianess corresponds to the host.
>> 
>> "host" as in the machine that qemu runs on, or the machine that is
>> being emulated? I suppose it would be broken either way, but in the
>> latter case, we could get away with detecting that the machine is
>> running under qemu.
>
> Sorry, my mistake. I meant "guest": the endianess of the framebuffer 
> corresponds to the endianess of the emulated machine.  Given that many 
> graphics cards support LE and BE modes, I assume that this behavior 
> mimics real-hardware systems.

Not really: While the hardware may be able to switch between
the modes, something has to actively set some hardware registers up
that way, but the offb/ofdrm driver has no interface for interacting
with that register, and the bootloader or firmware code that knows
about the register has no information about what kernel it will
eventually run. This is a bit architecture dependent, as e.g. on
MIPS, a bi-endian hardware platform has to run a bootloader with the
same endianness as the kernel, but on arm and powerpc the bootloader
is usually fixed and the kernel switches to its configured endianness
in the first few instructions after it gets entered.

     Arnd
