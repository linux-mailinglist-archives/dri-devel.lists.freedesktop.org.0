Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 492447428B0
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jun 2023 16:43:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D0E210E12D;
	Thu, 29 Jun 2023 14:43:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com
 [64.147.123.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EBAB10E12D
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jun 2023 14:43:06 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailnew.west.internal (Postfix) with ESMTP id 2C0362B000BB;
 Thu, 29 Jun 2023 10:43:04 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
 by compute6.internal (MEProxy); Thu, 29 Jun 2023 10:43:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm1; t=1688049783; x=1688056983; bh=tH
 SCuJbmuJlT+unyX4wdwm35F06LE8SCy+Og6X/m9DI=; b=FV9nO/j/Xdm5cnG6UB
 sO9u8qjWkG4zOqKUhXnhJ2RYfN1MZ3Kurqn85lEsJl7vkP5a/wdBWaFdfq4uSulg
 eD/TXf6t4GqPVAoNus5HnjtbA1vX8VrBrjgri2vE0OiP2BSb5Sz/Pa2C0OcILLNa
 uvFS7KDmA3Z+PSTaIcpOvOnZyAi2yVT1FzCqp7iRvA0LJt1+wRraHFLOR3jih5Cs
 jATcgblkM7OGPteVBvXmW3paY0tjSC/B5Xw7fxmwX1f73RjswI9pT+zjkQRu+TqM
 Zsrmd0IqOKzH2xm5FLjlXxLg/SYtjqX8WBuItuEotXdBlqMlSIKnBw9uSc0kSFc4
 WB+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1688049783; x=1688056983; bh=tHSCuJbmuJlT+
 unyX4wdwm35F06LE8SCy+Og6X/m9DI=; b=IEg6bOdqZ2fgoUmwXVc8pb/uyJ2CC
 MOuLn/CZcijB/QkegFpO4zpbp2YYMXm7i7Fu54Datj1E0vkDR3DKgAUxo6z+GWk3
 vXwluBuok2nikCjYscmpRjVF9aIs6Z3Xj7fdUsirXf+m9AdUwVoMNKOO0MYZ2R8w
 hgGHbzL0Ar9zadbigZQorDDjOWkOiah/gEi8RJBLof77Nwpm9iJ+r3Tp7gQ7XU3u
 cozoUBEjOyE8ENgbEKdyPutCHcAWlVtfgQdZBYVqqbmbh2K14vwZE6PMJ4Kx6p2+
 /+OkyxEaQgOqymqPNrwdxRUuj9S7LqeMaozoifwtEIa8O5rZRMCvumLJw==
X-ME-Sender: <xms:d5idZJS-d-u9H6tAL4MVNUn3dLrNSbL4IruMnHIE3CpKi0-H693WSQ>
 <xme:d5idZCw5mye3ObeRK8d2o0AvifT1I5cjzGyLezIYCpTQRj35g9ypte7NqWzs7GoN6
 8Sm_DjOg0zV1YdZSVw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrtdeggdektdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
 ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
 gvrhhnpeevveeggeffjeeuieduheefhfehgfdujeetjeelueejjeffueeiudefveffhffh
 ffenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:d5idZO03ZSZrR92W5cJwJ7vDJs6WpKIlFRy9Xhuyzbi0CT-ygNCtuw>
 <xmx:d5idZBAqt6Jponm39fmOqP5dZQFGbDIwwMJa-8NcLHlCdZdcXxv0nw>
 <xmx:d5idZCgNy7rtA7-MCt1uXVV-VTEogehRKv7jDtzZjAfQWu979t5spw>
 <xmx:d5idZD1uiRApbuVHCCuiXmm0gt_m0UjKra-phrbnLG5pdPkdVgK1VG-MnKk>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 44DBDB60086; Thu, 29 Jun 2023 10:43:03 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-499-gf27bbf33e2-fm-20230619.001-gf27bbf33
Mime-Version: 1.0
Message-Id: <ce4ddce0-ceea-426c-b348-d22468d7c402@app.fastmail.com>
In-Reply-To: <f9185435-74bb-a325-8fe6-3beb51a66e0a@suse.de>
References: <20230629121952.10559-1-tzimmermann@suse.de>
 <4d711508-c299-49f2-8691-e75d68f2485e@app.fastmail.com>
 <f9185435-74bb-a325-8fe6-3beb51a66e0a@suse.de>
Date: Thu, 29 Jun 2023 16:42:42 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Thomas Zimmermann" <tzimmermann@suse.de>, "Helge Deller" <deller@gmx.de>, 
 "Daniel Vetter" <daniel@ffwll.ch>, "Dave Airlie" <airlied@gmail.com>
Subject: Re: [PATCH 00/12] arch,fbdev: Move screen_info into arch/
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
Cc: Linux-Arch <linux-arch@vger.kernel.org>, linux-hyperv@vger.kernel.org,
 linux-efi@vger.kernel.org, linux-ia64@vger.kernel.org,
 loongarch@lists.linux.dev, linux-sh@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-alpha@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 29, 2023, at 16:15, Thomas Zimmermann wrote:
> Am 29.06.23 um 15:31 schrieb Arnd Bergmann:
>> On Thu, Jun 29, 2023, at 13:45, Thomas Zimmermann wrote:
>>> Future directions: with the patchset in place, it will become possible
>>> to provide screen_info and edid_info only if there are users. Some
>>> architectures do this by testing for CONFIG_VT, CONFIG_DUMMY_CONSOLE,
>>> etc. A more uniform approach would be nice. We should also attempt
>>> to minimize access to the global screen_info as much as possible. To
>>> do so, some drivers, such as efifb and vesafb, would require an update.
>>> The firmware's EDID data could possibly made available outside of fbdev.
>>> For example, the simpledrm and ofdrm drivers could provide such data
>>> to userspace compositors.
>> 
>> I suspect that most architectures that provide a screen_info only
>> have this in order to compile the framebuffer drivers, and provide
>> hardcoded data that does not even reflect any real hardware.
>
> That's quite possible. Only x86's bootparam and EFI code sets 
> screen_info from external data. The rest is hardcoded. A number of 
> architectures protect screen_info with CONFIG_VT, CONFIG_DUMMY_CONSOLE, 
> etc. In a later patchset, I wanted to change this such that these users 
> of screen_info would enable the feature via select in their Kconfig.
>
> Do you know the reason for this branch in dummycon:
>
> https://elixir.bootlin.com/linux/v6.4/source/drivers/video/console/dummycon.c#L21
>
> What is special about arm that dummycon uses the screeninfo?

I can only guess myself, but I see that the values are only ever
set from the old ATAGS data, and not from DT on any of the
modern ones, and my interpretation is that this is meant to
match whatever the vga console was set to on the three
platforms that support vgacon.
 
I see this was added in linux-2.1.111, just before the
corresponding sparc specific hack was removed, but I don't have
patch descriptions from that era. Russell might remember, or know
if that is actually still needed.

   Arnd
