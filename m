Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F27D93827BE
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 11:04:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33F4C6E913;
	Mon, 17 May 2021 09:04:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 169576E8E7
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 08:07:56 +0000 (UTC)
Received: from mail-lf1-f70.google.com ([209.85.167.70])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <juerg.haefliger@canonical.com>) id 1liYI7-0002iJ-Cb
 for dri-devel@lists.freedesktop.org; Mon, 17 May 2021 08:07:55 +0000
Received: by mail-lf1-f70.google.com with SMTP id
 q14-20020a19f20e0000b02901daf8ea9b7aso744432lfh.2
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 01:07:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2nfOfJbiW4LP47Os6SKNJii3XzVzNGlTqIy0yN4oc5s=;
 b=pQg8kUhraxDVB4LhrDRIxf74O1nBKswNf1IzmRcFDY+dzWNQViwJqxuQORHz7WjWk6
 lAF/ssv5/vOy5HvP1z/DuaQUhjYqeYYONTHnjqUmM6E0sAYrtpMUA4Dn6D/UK4df0uEy
 RMqkG4hIiYffHmyQLqjQA7eMJMDtGwGFPTpucFNx0T5fujEdfsP93dB0JHuCdwU0z5UG
 sP43ncnMxX7wxdGg8WCMDYk1dmbqtU3U3JU2Kcnf3f/SWx114GVlQAo+hZUN7FFoKNgl
 502kn//hkOQDRy8daoojHVXa+PRFJlsmwAw0d4Ok5KM3oZhpkd6EAf01P2jJkyOEPloQ
 lEbQ==
X-Gm-Message-State: AOAM533Qena9jqU3YLtlkfVsQwtFWR6jK4eXJexIYynkuib5h4taKBMx
 0Y1h4IGKjjDWODuR0b3hfjSQrZR3FPCEsUdgqM8lxVS9l5jdOseukYq7RmozgRTL0pHXkaofYf4
 DpWKUHMOyyLGMx4Uuti6NLfXHNTiO7BXEysivtzUVU61w7pkI04NxRsp1WpyJ6Q==
X-Received: by 2002:a05:6512:22c5:: with SMTP id
 g5mr7249778lfu.540.1621238874887; 
 Mon, 17 May 2021 01:07:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLtpww2uPvpXvqqFSrHjVtl5+PaUMtX5la3CRUKSXX9w5roG0JSHKvA7LN99mpG0HgsEAdcu8ZL6lhlLJqIdM=
X-Received: by 2002:a05:6512:22c5:: with SMTP id
 g5mr7249760lfu.540.1621238874702; 
 Mon, 17 May 2021 01:07:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210516132209.59229-1-juergh@canonical.com>
 <YKIDJIfuufBrTQ4f@kroah.com>
In-Reply-To: <YKIDJIfuufBrTQ4f@kroah.com>
From: Juerg Haefliger <juerg.haefliger@canonical.com>
Date: Mon, 17 May 2021 10:07:43 +0200
Message-ID: <CAB2i3ZgszsUVDuK2fkUXtD72tPSgrycnDawM4VAuGGPJiA9+cA@mail.gmail.com>
Subject: Re: [PATCH] treewide: Remove leading spaces in Kconfig files
To: Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 17 May 2021 09:04:21 +0000
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
Cc: linux-fbdev@vger.kernel.org, mst@redhat.com, tony@atomide.com,
 jasowang@redhat.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, zbr@ioremap.net,
 Lee Jones <lee.jones@linaro.org>, Daniel Thompson <daniel.thompson@linaro.org>,
 linux-scsi@vger.kernel.org, aaro.koskinen@iki.fi,
 Juerg Haefliger <juergh@canonical.com>, kadlec@netfilter.org,
 lvs-devel@vger.kernel.org, ja@ssi.bg, coreteam@netfilter.org, kuba@kernel.org,
 pablo@netfilter.org, jejb@linux.ibm.com, horms@verge.net.au,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 martin.petersen@oracle.com, jingoohan1@gmail.com, linux-usb@vger.kernel.org,
 fw@strlen.de, LKML <linux-kernel@vger.kernel.org>, linux@prisktech.co.nz,
 netfilter-devel@vger.kernel.org, linux-crypto@vger.kernel.org,
 netdev <netdev@vger.kernel.org>, linux-fsdevel@vger.kernel.org,
 David Miller <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 17, 2021 at 7:46 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Sun, May 16, 2021 at 03:22:09PM +0200, Juerg Haefliger wrote:
> > There are a few occurences of leading spaces before tabs in a couple of
> > Kconfig files. Remove them by running the following command:
> >
> >   $ find . -name 'Kconfig*' | xargs sed -r -i 's/^[ ]+\t/\t/'
> >
> > Signed-off-by: Juerg Haefliger <juergh@canonical.com>
> > ---
> >  arch/arm/mach-omap1/Kconfig     | 12 ++++++------
> >  arch/arm/mach-vt8500/Kconfig    |  6 +++---
> >  arch/arm/mm/Kconfig             | 10 +++++-----
> >  drivers/char/hw_random/Kconfig  |  8 ++++----
> >  drivers/net/usb/Kconfig         | 10 +++++-----
> >  drivers/net/wan/Kconfig         |  4 ++--
> >  drivers/scsi/Kconfig            |  2 +-
> >  drivers/uio/Kconfig             |  2 +-
> >  drivers/video/backlight/Kconfig | 10 +++++-----
> >  drivers/virtio/Kconfig          |  2 +-
> >  drivers/w1/masters/Kconfig      |  6 +++---
> >  fs/proc/Kconfig                 |  4 ++--
> >  init/Kconfig                    |  2 +-
> >  net/netfilter/Kconfig           |  2 +-
> >  net/netfilter/ipvs/Kconfig      |  2 +-
> >  15 files changed, 41 insertions(+), 41 deletions(-)
>
> Please break this up into one patch per subsystem and resend to the
> proper maintainers that way.

Hmm... How is my patch different from other treewide Kconfig cleanup
patches like:
a7f7f6248d97 ("treewide: replace '---help---' in Kconfig files with 'help'")
8636a1f9677d ("treewide: surround Kconfig file paths with double quotes")
83fc61a563cb ("treewide: Fix typos in Kconfig")
769a12a9c760 ("treewide: Kconfig: fix wording / spelling")
f54619f28fb6 ("treewide: Fix typos in Kconfig")

...Juerg


> thanks,
>
> greg k-h
