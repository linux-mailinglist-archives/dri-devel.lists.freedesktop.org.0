Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2A02A98FF
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 17:03:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B2136E1BB;
	Fri,  6 Nov 2020 16:03:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 123F06E1BB
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 16:03:42 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4EF80208C7
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 16:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604678621;
 bh=k8bryvFui+YoGklp94RFUzRsPMzTAL7+JGvq9QXQg+s=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=hi/uyH5WXU66Rm2JLXwlxWHG0n5p4kipBD9wlwWxVHzvp+063vHGOKEpCMH1LUxHw
 e6nFQ2VQhcxRGFOrda2acrUwOn11TDLqOXP/if7jmiZILokM3y6FesB5nFRHKsUSI2
 +FGZE3vX2mkQrh666F9acUBGbYRDuZ6R+741q6o4=
Received: by mail-lf1-f46.google.com with SMTP id f9so2662383lfq.2
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Nov 2020 08:03:41 -0800 (PST)
X-Gm-Message-State: AOAM532JbvzfgkPSaanGDkXGA/UlnPNj3ppIAwjgHHvpX8uExDhPGNpJ
 ZxBVCPRXq+qBa+uonspktyvwoLqvBQ9L8TSWm6Q=
X-Google-Smtp-Source: ABdhPJy4L9sWNTrKjB39Lz4S8huMYtJ2miYTZnmYiCjhMmzPfT6Q8pHTbOo2LrWBLVMhDMAFLR/BADUAut2KfwSjmLs=
X-Received: by 2002:a19:c354:: with SMTP id t81mr562644lff.283.1604678619488; 
 Fri, 06 Nov 2020 08:03:39 -0800 (PST)
MIME-Version: 1.0
References: <20201106151411.321743-1-maxime@cerno.tech>
In-Reply-To: <20201106151411.321743-1-maxime@cerno.tech>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Sat, 7 Nov 2020 00:03:28 +0800
X-Gmail-Original-Message-ID: <CAGb2v66N1BF+ReqMwJOUPESvJOwm7w7exuc3T52GULxJHJqKzg@mail.gmail.com>
Message-ID: <CAGb2v66N1BF+ReqMwJOUPESvJOwm7w7exuc3T52GULxJHJqKzg@mail.gmail.com>
Subject: Re: [PATCH 0/7] sunxi: Remove the calls to dma_direct_set_offset
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: devel@driverdev.osuosl.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Yong Deng <yong.deng@magewell.com>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Hans Verkuil <hverkuil@xs4all.nl>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Nov 6, 2020 at 11:15 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi,
>
> Here's an attempt to removing the dma_direct_set_offset calls we have in
> numerous drivers and move all those quirks into a global notifier as suggested
> by Robin.
>
> Let me know what you think,
> Maxime
>
> Maxime Ripard (7):
>   drm/sun4i: backend: Fix probe failure with multiple backends
>   soc: sunxi: Deal with the MBUS DMA offsets in a central place
>   drm/sun4i: backend: Remove the MBUS quirks
>   media: sun4i: Remove the MBUS quirks
>   media: sun6i: Remove the MBUS quirks
>   media: cedrus: Remove the MBUS quirks
>   media: sun8i-di: Remove the call to of_dma_configure

Whole series looks good to me.

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

Now the question remaining is how do we merge this series so that
the notifier gets merged before all the code dealing with the MBUS
quirk gets removed.


>  drivers/gpu/drm/sun4i/sun4i_backend.c         |  13 --
>  .../platform/sunxi/sun4i-csi/sun4i_csi.c      |  27 ----
>  .../platform/sunxi/sun6i-csi/sun6i_csi.c      |  17 ---
>  .../media/platform/sunxi/sun8i-di/sun8i-di.c  |   4 -
>  drivers/soc/sunxi/Kconfig                     |   8 ++
>  drivers/soc/sunxi/Makefile                    |   1 +
>  drivers/soc/sunxi/sunxi_mbus.c                | 132 ++++++++++++++++++
>  drivers/staging/media/sunxi/cedrus/cedrus.c   |   1 -
>  drivers/staging/media/sunxi/cedrus/cedrus.h   |   3 -
>  .../staging/media/sunxi/cedrus/cedrus_hw.c    |  18 ---
>  10 files changed, 141 insertions(+), 83 deletions(-)
>  create mode 100644 drivers/soc/sunxi/sunxi_mbus.c
>
> --
> 2.28.0
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
