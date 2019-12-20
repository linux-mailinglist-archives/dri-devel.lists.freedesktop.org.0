Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 032191292D3
	for <lists+dri-devel@lfdr.de>; Mon, 23 Dec 2019 09:12:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11C9F6E21F;
	Mon, 23 Dec 2019 08:10:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB46E6E05D
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2019 13:28:05 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id z193so9378627iof.1
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2019 05:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Qro46RnVnbo2QgGtaf7fEzgqPFK2obp1dRKTpO96WCA=;
 b=dojB2citQDZZpDMYks9ZYnVZdw2jCW6bHd5wO8pPxVBgCrAJfNz7W4YS6MKfH8BsKD
 uFToiAW0Ul47Ri8E58KWo5s4bEHrJ5Nnv32l9d5hFMnE3Nt+uFQozfZJtzdikGVPRE6B
 fjmDRKq7hYTRQarkFqhgRgaZfIGpPno7iXiXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qro46RnVnbo2QgGtaf7fEzgqPFK2obp1dRKTpO96WCA=;
 b=VCbk+8uV6MFq/DrexmcBM1jmczSU7oo6xna0/H5ONkPO5CDGo6gQm3UYe2cA8LI24Z
 +t5njUEDrRBGQidLiyz5LleLd55GGEXmTsX11vtAecgMPdnlC+LyzH8jPiJnYbTakKbg
 2wWFVF51iRO0mhf0lo1sf5yopt68RwMTGCE+3nJDaRQxWJ1CCmsKtF5Gj0B8QMxT7ULb
 02W9hlsWLkmq6VwOkX1XFKF/r0VX7T1isIPjMlkGqv745PziU/Hw9UV+oC+letf9MhNA
 VOg/lBgn1Zd7Be2lPYifgoenMhHRO/iaj9esEJvzeywINaIoKETNo9uXB+Nu0dZA7sw8
 sz/A==
X-Gm-Message-State: APjAAAUkx3jGG+1x5oD0+db3uw9FhsyKpD4yvEdlE78fbRiYafKg35gV
 /8VORij3SqpUWnlUga/Aq+Rb378YvPJPwsS0McorgA==
X-Google-Smtp-Source: APXvYqx1z00p6iauoc4NZtcOA9AhAGNGQumLKZgKWsoylxv2/qOGV3v00MP2K8c3STB2yn62imhJmHfZ0XJiN+viMWY=
X-Received: by 2002:a5d:9c10:: with SMTP id 16mr9571305ioe.150.1576848485210; 
 Fri, 20 Dec 2019 05:28:05 -0800 (PST)
MIME-Version: 1.0
References: <20191210050526.4437-1-bibby.hsieh@mediatek.com>
 <20191210050526.4437-7-bibby.hsieh@mediatek.com>
In-Reply-To: <20191210050526.4437-7-bibby.hsieh@mediatek.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Fri, 20 Dec 2019 21:27:39 +0800
Message-ID: <CAJMQK-jdMwoC54XpWj-XYW_yZkM=TcGcJpy94DTdYBN2t1wqmw@mail.gmail.com>
Subject: Re: [PATCH v5 6/7] drm/mediatek: support CMDQ interface in ddp
 component
To: Bibby Hsieh <bibby.hsieh@mediatek.com>
X-Mailman-Approved-At: Mon, 23 Dec 2019 08:10:46 +0000
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
Cc: Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Tomasz Figa <tfiga@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>, linux-mediatek@lists.infradead.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 10, 2019 at 5:05 AM Bibby Hsieh <bibby.hsieh@mediatek.com> wrote:

>
> +void mtk_ddp_write(struct cmdq_pkt *cmdq_pkt, unsigned int value,
> +                  struct mtk_ddp_comp *comp, unsigned int offset)
> +{
> +#if IS_ENABLED(CONFIG_MTK_CMDQ)
Should we use #ifdef like in v4? https://patchwork.kernel.org/patch/11274439/

We got warnings while compiling kernels if CONFIG_MTK_CMDQ is not set,
since cmdq_pkt_write() would still be compiled.
Similar in other #if IS_ENABLED(CONFIG_MTK_CMDQ) (also in 7/7
https://patchwork.kernel.org/patch/11281349/)


> +       if (cmdq_pkt)
> +               cmdq_pkt_write(cmdq_pkt, comp->subsys,
> +                              comp->regs_pa + offset, value);
> +       else
> +#endif
> +               writel(value, comp->regs + offset);
> +}
> +
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
