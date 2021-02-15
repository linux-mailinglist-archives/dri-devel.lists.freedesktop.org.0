Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C1F31B5D9
	for <lists+dri-devel@lfdr.de>; Mon, 15 Feb 2021 09:22:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5850D89E26;
	Mon, 15 Feb 2021 08:22:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DC466E0A2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Feb 2021 05:16:24 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id k13so3463609pfh.13
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Feb 2021 21:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TBkqrZBLcfDTB0/M+9n3lElFVq72Vy5NJAtkuckTGN4=;
 b=pm4fNvBwXWCxUC5cgUyImGLfR4w/yKZ/pflBxno08azXdHVjNAF7N/TiLY6z306gz/
 NwT40nkx/FTz+vU0BOctZuzk/kvqILDE4t19NPsl6Ny9Z7uIyTkIR9JcQevyZX/WlPso
 dlOleXIZSuXw82L96wMXWZUd9NvG8+qzzVBYdpFCPzJJflFd0uJaRuMlVBMGJ2JebX/G
 Qsu5+rhqLnv3pDiAVLF/86KcPk5OFYdMSGyqseOouuZHe0XxiFsKO9rjFl3bxkFJfC1R
 Lvh4o7KXBD+YBQLwSczpEhhLc1c0oP1BcrnMlNQ4x2yYjMZybNxD8GuFAaL3mTPjkB2Z
 oOxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TBkqrZBLcfDTB0/M+9n3lElFVq72Vy5NJAtkuckTGN4=;
 b=F6jXWKrW9oeXHIwrqLYlH5dZ+uINfjbxZlagmW3NPFFfVYIVCjlmBImI6l/rbQhImR
 LiJJoL07LK1P1THhpG0NL66m3FEKtvHwznSELil9SxyZcfZsdtLooOnxejKNbc5s32vG
 FFlnzxqBLTyb1qatzwxcpC6KOBp0tTa8zqzt9ndiNg2JIy9k5hQKWY+d6GNLsN+MnrQ9
 ZOWkiILOGeOYwPOcoblPJuhMhjPnLOLmBwT031/bfp9d6kzLJ6Mr34/B/t0mZP6uWjMI
 it/Kk6zEY84M9uZIhcBwXQ77AbgBIz4JiCTrL8vO/OUMzhO6vBZpnttWCkx9aHuhJszK
 Wmog==
X-Gm-Message-State: AOAM5300RvW/esXSal9qeSzAiW6XaS0PTLFGpKypQa9SlgJHUKcRz074
 GUZHeF7HAExzm60rclolz958fWjb1tO7qWuBahY=
X-Google-Smtp-Source: ABdhPJwOiZw4Qqqmjkha2m3NiVtY90y2KGeUq38HkrELdAMi1GmyuchWJQIojbLcrd0WcqkoeEZZMy7VUEb0HVASvmM=
X-Received: by 2002:a63:1519:: with SMTP id v25mr13584867pgl.217.1613366183592; 
 Sun, 14 Feb 2021 21:16:23 -0800 (PST)
MIME-Version: 1.0
References: <1608712499-24956-1-git-send-email-yongqiang.niu@mediatek.com>
 <1608712499-24956-2-git-send-email-yongqiang.niu@mediatek.com>
 <1610070485.1574.10.camel@mhfsdcap03>
In-Reply-To: <1610070485.1574.10.camel@mhfsdcap03>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 14 Feb 2021 23:16:13 -0600
Message-ID: <CABb+yY3JQUYf8b-mU_01eYR-4nswFRbBE42WS9fS8aSmk2rjmw@mail.gmail.com>
Subject: Re: [PATCH v2] soc: mediatek: cmdq: add address shift in jump
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
X-Mailman-Approved-At: Mon, 15 Feb 2021 08:22:01 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Devicetree List <devicetree@vger.kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 Dennis-YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Damon Chu <damon.chu@mediatek.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 7, 2021 at 7:48 PM Yongqiang Niu <yongqiang.niu@mediatek.com> wrote:
>
> On Wed, 2020-12-23 at 16:34 +0800, Yongqiang Niu wrote:
> > Add address shift when compose jump instruction
> > to compatible with 35bit format.
> >
> > Fixes: 0858fde496f8 ("mailbox: cmdq: variablize address shift in platform")
> >
> > Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> > Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>
> > ---
> >  drivers/mailbox/mtk-cmdq-mailbox.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
> > index 5665b6e..75378e3 100644
> > --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> > +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> > @@ -168,7 +168,8 @@ static void cmdq_task_insert_into_thread(struct cmdq_task *task)
> >       dma_sync_single_for_cpu(dev, prev_task->pa_base,
> >                               prev_task->pkt->cmd_buf_size, DMA_TO_DEVICE);
> >       prev_task_base[CMDQ_NUM_CMD(prev_task->pkt) - 1] =
> > -             (u64)CMDQ_JUMP_BY_PA << 32 | task->pa_base;
> > +             (u64)CMDQ_JUMP_BY_PA << 32 |
> > +             (task->pa_base >> task->cmdq->shift_pa);
> >       dma_sync_single_for_device(dev, prev_task->pa_base,
> >                                  prev_task->pkt->cmd_buf_size, DMA_TO_DEVICE);
> >
>
> hi jassi
>
> please confirm is there any question about this patch.
> if not, please apply this into next version, tks
>
I can't locate this patch in my inbox. And I can't fwd it from lkml to
myself. Please resend.

thnks.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
