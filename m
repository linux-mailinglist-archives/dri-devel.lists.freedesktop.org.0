Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 937191D21E7
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 00:21:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 643826E109;
	Wed, 13 May 2020 22:20:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe41.google.com (mail-vs1-xe41.google.com
 [IPv6:2607:f8b0:4864:20::e41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C89AC6E109
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 22:20:58 +0000 (UTC)
Received: by mail-vs1-xe41.google.com with SMTP id 62so817119vsi.2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 15:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Febjjj5+WWTqUCbI65lFaOFBjwVkcmzD8E9a3lP4Uv4=;
 b=MdNrrrwcMt5bs37DshmUmoyIMjjh7CB+k9Wk9SQHhdVkyuYOcacp3SASS2JGHQkFZW
 6P6GOR6UyQqrQRzKsmKoQSVSn7Da1sS+IwByJS+VlE4ZThLUdat3cJX4oYY+x1vwVDhw
 NmSmxRfrdXNGNnbQoAWb8hoQ2cIcKtJQ1wkp7+KFnJyqi23qBsaYS/ixGdP3ELSYcwwX
 s3ql3bAdCqGCUM/QoI9AMgSpIlwTlRO9nzyXflHlPNHCw0QL3jewdGahAjnXxpi6JuVJ
 r1cotSeMPSwWva2uv4VGiN7NKdQlUDyGwkvenaCmnDDpOr3mIi1vo8nCILZTJWYz4Zy8
 b4qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Febjjj5+WWTqUCbI65lFaOFBjwVkcmzD8E9a3lP4Uv4=;
 b=F23WPRW/F5I6FfEWn7xYeyfZXyCjCFoQGkMEN7m2GDL6v3CV642gfYEC+iyt0Vq4R9
 y61lPt4c6YSR1dtJ2EeZ8jm7Jnc5gYITevghriAvi0HWNySngvWzDWE1AJdrR3fCyYMZ
 jo4Ka4XVZnEBtK02X/h1NWi3fc2MqCuSfKazU0geiuOWyDiOsx7U2iaIPHpYQ8EkxqTN
 LVm9U8BYbF3Px4TEI3KhN3hHtBpleams1bU57+AKGDWISwc7AzXwWTdalrWZaOXoe2cq
 OnnidPNRZKIzgK1L6yua3+fuPOypf7E1hIHtew8AYcYY+s8roG6OEFTwf4UdB33a4Lrq
 1Uzg==
X-Gm-Message-State: AOAM531cKcWKX9TcmhrdIE4Hk17FyS2/AC8CYLdhYzaLS+UebbvaJoqv
 8/ctYarRlQgHPX66YRLcCDSQmc+ysFXDUE52Og4=
X-Google-Smtp-Source: ABdhPJxo9EuLqhoKWxflAPUvXZF3mOIP4Fla676O86ZIxPbhYie0qT8N7NxiarKZvsbsx8aJvfTXSAykTIcU6rJym2E=
X-Received: by 2002:a67:c482:: with SMTP id d2mr1227981vsk.37.1589408457816;
 Wed, 13 May 2020 15:20:57 -0700 (PDT)
MIME-Version: 1.0
References: <20190731124349.4474-1-gregkh@linuxfoundation.org>
 <20190731131045.GB147138@dtor-ws> <20190802104633.GA14823@kroah.com>
In-Reply-To: <20190802104633.GA14823@kroah.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Wed, 13 May 2020 23:18:15 +0100
Message-ID: <CACvgo52+Uqx4GJFwadJoFzzt5EMc69HcW-+K9uxv9t25TtSDBg@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] drivers, provide a way to add sysfs groups easily
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
Cc: platform-driver-x86@vger.kernel.org,
 linux-fbdev <linux-fbdev@vger.kernel.org>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Sudeep Holla <sudeep.holla@arm.com>, Tony Prisk <linux@prisktech.co.nz>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Borislav Petkov <bp@alien8.de>,
 linux-input@vger.kernel.org, Darren Hart <dvhart@infradead.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, LAKML <linux-arm-kernel@lists.infradead.org>,
 Richard Gong <richard.gong@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Greg,

On Fri, 2 Aug 2019 at 11:46, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:

>
> I have now done this with patch 1/10.  Here's the pull info if any
> subsystem maintainer wants to suck this into their tree to provide the
> ability for drivers to add/remove attribute groups easily.
>
> This is part of my driver-core tree now, and will go to Linus for
> 5.4-rc1, along with a few platform drivers that have been acked by their
> various subsystem maintainers that convert them to use this new
> functionality.
>
> If anyone has any questions about this, please let me know.
>
> thanks,
>
> greg k-h
>
> -------------------
>
> The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:
>
>   Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git tags/dev_groups_all_drivers
>
> for you to fetch changes up to 23b6904442d08b7dbed7622ed33b236d41a3aa8b:
>
>   driver core: add dev_groups to all drivers (2019-08-02 12:37:53 +0200)
>
> ----------------------------------------------------------------
> dev_groups added to struct driver
>
> Persistent tag for others to pull this branch from
>
> This is the first patch in a longer series that adds the ability for the
> driver core to create and remove a list of attribute groups
> automatically when the device is bound/unbound from a specific driver.
>
> See:
>         https://lore.kernel.org/r/20190731124349.4474-2-gregkh@linuxfoundation.org
> for details on this patch, and examples of how to use it in other
> drivers.
>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>
> ----------------------------------------------------------------
> Dmitry Torokhov (1):
>       driver core: add dev_groups to all drivers
>
>  drivers/base/dd.c      | 14 ++++++++++++++
>  include/linux/device.h |  3 +++
>  2 files changed, 17 insertions(+)
> _______________________________________________

Was planning to re-spin DRM a series which uses .dev_groups, although
I cannot see the core patch.
Did the it get reverted or simply fell though the cracks?

-Emil
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
