Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E82981EBD6E
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jun 2020 15:59:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F29388697;
	Tue,  2 Jun 2020 13:59:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC50388697
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Jun 2020 13:59:10 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id r10so2051610vsa.12
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Jun 2020 06:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9owB6N5YoTr+QgRWYSW+w97CM/a02Li4ocdyLucMnlA=;
 b=Ze+ivp4cAFxyqk7NhiH/FgnYGbbWWGkjKQQY3TxEitCzQdk7p0Wu76o0FkjuBwXiVH
 2Dg5GkZntUYHmh7C7r68i/lLSdsF0OcuA1BfQ15WDPiUYtJHbjCzEhJEJ9F1fW4CSoBa
 khCoH7AF8Speu+33IkgkUZJNsl734DdLOmVBBUhwR0J5x8OL60XWZn6dVPDktK0uYZyY
 STfI+k0NDFh4ebSmg1x4NiORk3wVn8f8pbTx/cFFLCIJdycWBKOR9MKgZnroaxd6/GLI
 VygAjCvqQjJqWXgTeulGShbJMm30zj4FP81VlH6EQDYtPjzDPJbE9QL+kDGi985PaEAa
 KZEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9owB6N5YoTr+QgRWYSW+w97CM/a02Li4ocdyLucMnlA=;
 b=nRZWAGsrSd6u14zAm04lsG+qIy2J+cWvCuaWH2t1F2Nfm1J/gtQL/MZC6gvnXldiPO
 M1TnHjLhA6bNCrHSp6u5zQ5C3Bve4lEehk/jDRBFfGCj34zFYLDk+5Y5hLmzAo2J6uac
 wADaAi01rJRPZIbs1WDw/MDnVODwwdgyPGjCe3Im/9mtB0pWGYppwe+eDByO+ZaCceME
 qTW406vVrqW9EBVACzmkIYvs4VlCYR7SnsDdB/F1wO45+K1B2iYPv1hPha74qRna2wxN
 DKYTOLuvhYOPDOdWhdRjgptmo/V1SzRwZS6tCwSpa8MebvuZ/rZzPNrDZUn+mRrvcs/A
 aRCQ==
X-Gm-Message-State: AOAM533ei4bXcmabGnsugq9B3wwrMFlqD0X2rDCykfgbiGTscmO0xOJl
 TiYessV2aKp2i3vA3oiyLJEoeKCyy2lRcKlbvyM=
X-Google-Smtp-Source: ABdhPJwagcH+IMCLFpcz6CGUl5oYhyGNJls9L62J/M3CQCdOJiJr0Rvnef8YwBvKPwiyJDIDZDjyOZlJdWHq94p6Rm4=
X-Received: by 2002:a67:b149:: with SMTP id z9mr17006698vsl.85.1591106349968; 
 Tue, 02 Jun 2020 06:59:09 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1590982881.git.Sandor.yu@nxp.com>
 <d3d707cf37e7928a839071242c752779061cc094.1590982881.git.Sandor.yu@nxp.com>
In-Reply-To: <d3d707cf37e7928a839071242c752779061cc094.1590982881.git.Sandor.yu@nxp.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 2 Jun 2020 14:55:52 +0100
Message-ID: <CACvgo52NeUSQV5p8+4DkCjpkv12cs8fCkQqy4MFn8pVaorVaHg@mail.gmail.com>
Subject: Re: [PATCH 1/7] drm/rockchip: prepare common code for cdns and rk
 dpi/dp driver
To: sandor.yu@nxp.com
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>, Sandy Huang <hjc@rock-chips.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-rockchip <linux-rockchip@lists.infradead.org>, dkos@cadence.com,
 LAKML <linux-arm-kernel@lists.infradead.org>,
 NXP Linux Team <linux-imx@nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

HI Sandor Yu

On Mon, 1 Jun 2020 at 07:29, <sandor.yu@nxp.com> wrote:
>
> From: Sandor Yu <Sandor.yu@nxp.com>
>
> - Extracted common fields from cdn_dp_device to a new cdns_mhdp_device
>   structure which will be used by two separate drivers later on.
> - Moved some datatypes (audio_format, audio_info, vic_pxl_encoding_format,
>   video_info) from cdn-dp-core.c to cdn-dp-reg.h.
> - Changed prefixes from cdn_dp to cdns_mhdp
>     cdn -> cdns to match the other Cadence's drivers
>     dp -> mhdp to distinguish it from a "just a DP" as the IP underneath
>       this registers map can be a HDMI (which is internally different,
>       but the interface for commands, events is pretty much the same).
> - Modified cdn-dp-core.c to use the new driver structure and new function
>   names.
> - writel and readl are replaced by cdns_mhdp_bus_write and
>   cdns_mhdp_bus_read.
>
The high-level idea is great - split, refactor and reuse the existing drivers.

Although looking at the patches themselves - they seems to be doing
multiple things at once.
As indicated by the extensive list in the commit log.

I would suggest splitting those up a bit, roughly in line of the
itemisation as per the commit message.

Here is one hand wavy way to chunk this patch:
 1) use put_unalligned*
 2) 'use local variable dev' style of changes (as seem in cdn_dp_clk_enable)
 3) add writel/readl wrappers
 4) hookup struct cdns_mhdp_device, keep dp->mhdp detail internal.
The cdn-dp-reg.h function names/signatures will stay the same.
 5) finalize the helpers - use mhdp directly, rename

HTH
Emil

Examples:
4)
 static int cdn_dp_mailbox_read(struct cdn_dp_device *dp)
 {
+"  struct cdns_mhdp_device *mhdp = dp->mhdp;
   int val, ret;

-  ret = readx_poll_timeout(readl, dp->regs + MAILBOX_EMPTY_ADDR,
+  ret = readx_poll_timeout(readl, mhdp->regs_base + MAILBOX_EMPTY_ADDR,
...
   return fancy_readl(dp, MAILBOX0_RD_DATA) & 0xff;
 }

5)
-static int cdn_dp_mailbox_read(struct cdn_dp_device *dp)
+static int mhdp_mailbox_read(struct cdns_mhdp_device *mhdp)
 {
-  struct cdns_mhdp_device *mhdp = dp->mhdp;
   int val, ret;
...
-  return fancy_readl(dp, MAILBOX0_RD_DATA) & 0xff;
+  return cdns_mhdp_bus_read(mhdp, MAILBOX0_RD_DATA) & 0xff;
 }
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
