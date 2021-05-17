Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 144843823C3
	for <lists+dri-devel@lfdr.de>; Mon, 17 May 2021 07:46:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 588826E02B;
	Mon, 17 May 2021 05:46:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87CE46E02B
 for <dri-devel@lists.freedesktop.org>; Mon, 17 May 2021 05:46:18 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 21CCF6108D;
 Mon, 17 May 2021 05:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1621230378;
 bh=UssYIYbkL3qu2UXuoT41PmlhMhpzovvV5hj4VqQqw6c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Vna6C9/eXr0rr9wnsxamGgP6HY53+rapHkKqAnJK3sSoY631+u0j3cZ/Xjleivf8U
 lDAxln7hHa19MzfzYmHSkNzIK1K5pI/K/AyFyyommMzJ/FNr5UiqNJi1b78GTzBNCc
 OvydG874aqfpppXC7D0nP3i8lBieHyXygMg/IfKE=
Date: Mon, 17 May 2021 07:46:12 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Juerg Haefliger <juerg.haefliger@canonical.com>
Subject: Re: [PATCH] treewide: Remove leading spaces in Kconfig files
Message-ID: <YKIDJIfuufBrTQ4f@kroah.com>
References: <20210516132209.59229-1-juergh@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210516132209.59229-1-juergh@canonical.com>
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
 lee.jones@linaro.org, daniel.thompson@linaro.org, linux-scsi@vger.kernel.org,
 aaro.koskinen@iki.fi, Juerg Haefliger <juergh@canonical.com>,
 kadlec@netfilter.org, lvs-devel@vger.kernel.org, ja@ssi.bg,
 coreteam@netfilter.org, kuba@kernel.org, pablo@netfilter.org,
 jejb@linux.ibm.com, horms@verge.net.au, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, martin.petersen@oracle.com,
 jingoohan1@gmail.com, linux-usb@vger.kernel.org, fw@strlen.de,
 linux-kernel@vger.kernel.org, linux@prisktech.co.nz,
 netfilter-devel@vger.kernel.org, linux-crypto@vger.kernel.org,
 netdev@vger.kernel.org, linux-fsdevel@vger.kernel.org, davem@davemloft.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, May 16, 2021 at 03:22:09PM +0200, Juerg Haefliger wrote:
> There are a few occurences of leading spaces before tabs in a couple of
> Kconfig files. Remove them by running the following command:
> 
>   $ find . -name 'Kconfig*' | xargs sed -r -i 's/^[ ]+\t/\t/'
> 
> Signed-off-by: Juerg Haefliger <juergh@canonical.com>
> ---
>  arch/arm/mach-omap1/Kconfig     | 12 ++++++------
>  arch/arm/mach-vt8500/Kconfig    |  6 +++---
>  arch/arm/mm/Kconfig             | 10 +++++-----
>  drivers/char/hw_random/Kconfig  |  8 ++++----
>  drivers/net/usb/Kconfig         | 10 +++++-----
>  drivers/net/wan/Kconfig         |  4 ++--
>  drivers/scsi/Kconfig            |  2 +-
>  drivers/uio/Kconfig             |  2 +-
>  drivers/video/backlight/Kconfig | 10 +++++-----
>  drivers/virtio/Kconfig          |  2 +-
>  drivers/w1/masters/Kconfig      |  6 +++---
>  fs/proc/Kconfig                 |  4 ++--
>  init/Kconfig                    |  2 +-
>  net/netfilter/Kconfig           |  2 +-
>  net/netfilter/ipvs/Kconfig      |  2 +-
>  15 files changed, 41 insertions(+), 41 deletions(-)

Please break this up into one patch per subsystem and resend to the
proper maintainers that way.

thanks,

greg k-h
