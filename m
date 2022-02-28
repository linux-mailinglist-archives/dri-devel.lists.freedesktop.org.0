Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D654D4C84CD
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 08:18:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A36C710E509;
	Tue,  1 Mar 2022 07:18:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BE6A10E665;
 Mon, 28 Feb 2022 12:07:02 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id p14so24251520ejf.11;
 Mon, 28 Feb 2022 04:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=mpq6EOSgaJN9TDHyutZ1vk7Ts/tQX7VWZG2tuQLEVnE=;
 b=P6Qm9QV+tKwfj02RvG70Y6RM578oBE7xk1h9xLRDl0Phoeno/cOg2X5jGG320h7a80
 51RqQzzCwbkind1CCh/PsD+YJ2xLuw3nTu9DY+Zris5SVOV1FI+8DsU52Jy5KlVydcNu
 G0XxThLJxiMxymk0pHTiYIUYA6Uj3RhvFK2FvOkFF3qdetV9R5zYggWzNl+ojj1OXKZf
 MkNjwD1Q29EHNb+3aSEEQSq9r3HlkkV49QyRIpbAEX1BAYg/I0l3VyVoctyp9PVfLMdm
 3mwm8jDaSc7WWe042oo4mIB/QOs4nHzHS6+i8MWcrLd/SBvvylJKxoeMQwrp3MTt3slq
 2wxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=mpq6EOSgaJN9TDHyutZ1vk7Ts/tQX7VWZG2tuQLEVnE=;
 b=BkQqAJVfGBiUlkXXC7pj94bVj7M7J5Qc1H3GpquqHDngiYRIKlQ/3aYElfpxxqPp8h
 RldeuXZ0RFmp3Vqd2vN3MPHJVWElMpmShUlkYx9sGODBV/Z1OaST5kYmkvbZPKzmrX2z
 /IJrAC6LzWTJx6IA9RSbHEVfoACcc2tmUKv/gsiRd/+hNit9RiS4903pJe1MhVl1jZLB
 VGbPgPNuFqExsTAu/ZrwM7oNphAgThvodW0omqJufss9OtWvN0CQwUwtEDaF0VlA1mpL
 7tw8ZHcnF999+8V2aGbzwEGGunrttURAWZSx+kOXSsOsv39Ncqou3aEuypWVA7ck0pZC
 H1Xg==
X-Gm-Message-State: AOAM532tjrjv5Y9HX0upi13dvhHWvqowtQsofsuAfiev2rQysnw7rwRG
 tYyANQq37qquF/9NTCHZvGvYRd/uOsoiVUsFVz3kGQ==
X-Google-Smtp-Source: ABdhPJw3Wj1NaKaNlFGnSPXqnbDgppea1F4wGZoXZbWDfwDJgXssQhrPLcI1GM9ROPIg4DuPtt07Tg==
X-Received: by 2002:a17:907:248a:b0:6ce:e03c:e1df with SMTP id
 zg10-20020a170907248a00b006cee03ce1dfmr14689906ejb.258.1646050020495; 
 Mon, 28 Feb 2022 04:07:00 -0800 (PST)
Received: from smtpclient.apple ([2a02:8109:9d80:3f6c:957a:1d13:c949:d1f3])
 by smtp.gmail.com with ESMTPSA id
 d23-20020a1709067a1700b006d0ebe4af89sm4282959ejo.20.2022.02.28.04.06.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 28 Feb 2022 04:07:00 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.60.0.1.1\))
Subject: Re: [PATCH 2/6] treewide: remove using list iterator after loop body
 as a ptr
From: Jakob Koschel <jakobkoschel@gmail.com>
In-Reply-To: <Yhyv42ONIxTj04mg@kroah.com>
Date: Mon, 28 Feb 2022 13:06:57 +0100
Content-Transfer-Encoding: 7bit
Message-Id: <79FCD5F4-0EBA-4E3F-8B3F-D450BBA10367@gmail.com>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-3-jakobkoschel@gmail.com> <Yhyv42ONIxTj04mg@kroah.com>
To: Greg KH <gregkh@linuxfoundation.org>
X-Mailer: Apple Mail (2.3693.60.0.1.1)
X-Mailman-Approved-At: Tue, 01 Mar 2022 07:18:19 +0000
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
Cc: alsa-devel@alsa-project.org, linux-aspeed@lists.ozlabs.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-iio@vger.kernel.org,
 nouveau@lists.freedesktop.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel@lists.freedesktop.org, Cristiano Giuffrida <c.giuffrida@vu.nl>,
 amd-gfx@lists.freedesktop.org, samba-technical@lists.samba.org,
 linux1394-devel@lists.sourceforge.net, drbd-dev@lists.linbit.com,
 linux-arch <linux-arch@vger.kernel.org>, linux-cifs@vger.kernel.org,
 kvm@vger.kernel.org, linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-staging@lists.linux.dev, "Bos, H.J." <h.j.bos@vu.nl>,
 Jason Gunthorpe <jgg@ziepe.ca>, intel-wired-lan@lists.osuosl.org,
 kgdb-bugreport@lists.sourceforge.net, bcm-kernel-feedback-list@broadcom.com,
 Dan Carpenter <dan.carpenter@oracle.com>, linux-media@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Arnd Bergman <arnd@arndb.de>,
 linux-pm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, linux-fsdevel@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 v9fs-developer@lists.sourceforge.net, linux-tegra@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-sgx@vger.kernel.org,
 linux-block@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, tipc-discussion@lists.sourceforge.net,
 linux-crypto@vger.kernel.org, netdev@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



> On 28. Feb 2022, at 12:20, Greg KH <gregkh@linuxfoundation.org> wrote:
> 
> On Mon, Feb 28, 2022 at 12:08:18PM +0100, Jakob Koschel wrote:
>> If the list does not contain the expected element, the value of
>> list_for_each_entry() iterator will not point to a valid structure.
>> To avoid type confusion in such case, the list iterator
>> scope will be limited to list_for_each_entry() loop.
>> 
>> In preparation to limiting scope of a list iterator to the list traversal
>> loop, use a dedicated pointer to point to the found element.
>> Determining if an element was found is then simply checking if
>> the pointer is != NULL.
>> 
>> Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
>> ---
>> arch/x86/kernel/cpu/sgx/encl.c       |  6 +++--
>> drivers/scsi/scsi_transport_sas.c    | 17 ++++++++-----
>> drivers/thermal/thermal_core.c       | 38 ++++++++++++++++++----------
>> drivers/usb/gadget/configfs.c        | 22 ++++++++++------
>> drivers/usb/gadget/udc/max3420_udc.c | 11 +++++---
>> drivers/usb/gadget/udc/tegra-xudc.c  | 11 +++++---
>> drivers/usb/mtu3/mtu3_gadget.c       | 11 +++++---
>> drivers/usb/musb/musb_gadget.c       | 11 +++++---
>> drivers/vfio/mdev/mdev_core.c        | 11 +++++---
>> 9 files changed, 88 insertions(+), 50 deletions(-)
> 
> The drivers/usb/ portion of this patch should be in patch 1/X, right?

I kept them separate since it's a slightly different case.
Using 'ptr' instead of '&ptr->other_member'. Regardless, I'll split
this commit up as you mentioned.

> 
> Also, you will have to split these up per-subsystem so that the
> different subsystem maintainers can take these in their trees.

Thanks for the feedback.
To clarify I understand you correctly:
I should do one patch set per-subsystem with every instance/(file?)
fixed as a separate commit?

If I understand correctly, I'll repost accordingly.

> 
> thanks,
> 
> greg k-h

thanks,
Jakob Koschel

