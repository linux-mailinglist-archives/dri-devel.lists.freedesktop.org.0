Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF383CB356
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jul 2021 09:37:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 716886E931;
	Fri, 16 Jul 2021 07:37:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC1036E931
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 07:37:32 +0000 (UTC)
Received: by mail-il1-x135.google.com with SMTP id w1so7435113ilg.10
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jul 2021 00:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ANiQyDq/folOxbicLwy3YOWgSYI5J0bEHqTHjcfWpeE=;
 b=NZ/hguWCrTo//AU1Q0svGXlehzVRhlRy/nSls8iodhXXHgSEeCwbBTZ/daP8ru1+2y
 BxRBJiEgjMWnZOPOkNow345Owj7290E/vXITWK+0+xpPLDyrmWtEgAaLi1EYLiW0H96w
 NuqSZvzGC2Z4C51n2jOptN+DVowI83OLjjCDE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ANiQyDq/folOxbicLwy3YOWgSYI5J0bEHqTHjcfWpeE=;
 b=OrebohvOKq7q+x124RwipOxA2Pxd00jP7Nvi88b8nrMCnd5KND5T0ZvNTk9I4JDLAD
 Cw292XL537tIMm+OCAOhzBuBqgV4IvYk27DTwvHHU4sGGqszhH8VdhscGgHFnSi4YGWq
 91Y3X0zmq/SYsY78ZVnr3LuM9Cy9SAjzS9Y49MO0l19s3HDAxRgiSqhtOl1g9CI4MVnk
 UtNMirTY0R568qZDw0CoEuabj0NVdrqKGfB3TFOGJ+N4YarfSdIqg8cLnNlYlu2BlmZO
 ogXZu+yMrK9icqT8UrefMuBlFmsC5BFl/due1SL6/OyChG3/cs+6R/9ZCzDIuBvEAFjo
 kXdA==
X-Gm-Message-State: AOAM532we/jDEVT0u/Ni6WVKQ0ILVkE3ZWgNj/n9UP8m1pJbZdQEmEe0
 KA+opUxqaInqOwgyWYgKv52XOMPVYFAhgR0NKa9now==
X-Google-Smtp-Source: ABdhPJyT8V6x97LXNxXCsukgUCvYDKNceqkLDBqaokboRJb34I4xEcF3g0U8Zw6BQAhoQ5hGaStIUlO4jTjCi2i7VqY=
X-Received: by 2002:a92:d305:: with SMTP id x5mr5796115ila.150.1626421051833; 
 Fri, 16 Jul 2021 00:37:31 -0700 (PDT)
MIME-Version: 1.0
References: <1626418701-28467-1-git-send-email-yongqiang.niu@mediatek.com>
 <1626418701-28467-2-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1626418701-28467-2-git-send-email-yongqiang.niu@mediatek.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Fri, 16 Jul 2021 15:37:05 +0800
Message-ID: <CAJMQK-ghGCR3L89NzBx-6X6rJK-4VQYZT18DqdKM780r2bLvpA@mail.gmail.com>
Subject: Re: [PATCH v1] mailbox: cmdq: add instruction time-out interrupt
 support
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Devicetree List <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Jassi Brar <jassisinghbrar@gmail.com>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Dennis YC Hsieh <dennis-yc.hsieh@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 16, 2021 at 2:58 PM Yongqiang Niu
<yongqiang.niu@mediatek.com> wrote:
>
> add time-out cycle setting to make sure time-out interrupt irq
> will happened when instruction time-out for wait and poll
>
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>

Hi, it seems that this series is based on
https://patchwork.kernel.org/project/linux-mediatek/patch/1624440623-4585-4-git-send-email-yongqiang.niu@mediatek.com/?

Please state it if it's not based on linux-next, thanks!

> ---
>  drivers/mailbox/mtk-cmdq-mailbox.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
> index de4793e..9a76bcd 100644
> --- a/drivers/mailbox/mtk-cmdq-mailbox.c
> +++ b/drivers/mailbox/mtk-cmdq-mailbox.c
> @@ -35,6 +35,7 @@
>  #define CMDQ_THR_END_ADDR              0x24
>  #define CMDQ_THR_WAIT_TOKEN            0x30
>  #define CMDQ_THR_PRIORITY              0x40
> +#define CMDQ_THR_INSTN_TIMEOUT_CYCLES  0x50
>
>  #define GCE_GCTL_VALUE                 0x48
>
> @@ -53,6 +54,15 @@
>  #define CMDQ_JUMP_BY_OFFSET            0x10000000
>  #define CMDQ_JUMP_BY_PA                        0x10000001
>
> +/*
> + * instruction time-out
> + * cycles to issue instruction time-out interrupt for wait and poll instructions
> + * GCE axi_clock 156MHz
> + * 1 cycle = 6.41ns
> + * instruction time out 2^22*2*6.41ns = 53ms
> + */
> +#define CMDQ_INSTN_TIMEOUT_CYCLES      22
> +
>  struct cmdq_thread {
>         struct mbox_chan        *chan;
>         void __iomem            *base;
> @@ -368,6 +378,7 @@ static int cmdq_mbox_send_data(struct mbox_chan *chan, void *data)
>                 writel((task->pa_base + pkt->cmd_buf_size) >> cmdq->shift_pa,
>                        thread->base + CMDQ_THR_END_ADDR);
>
> +               writel(CMDQ_INSTN_TIMEOUT_CYCLES, thread->base + CMDQ_THR_INSTN_TIMEOUT_CYCLES);
>                 writel(thread->priority, thread->base + CMDQ_THR_PRIORITY);
>                 writel(CMDQ_THR_IRQ_EN, thread->base + CMDQ_THR_IRQ_ENABLE);
>                 writel(CMDQ_THR_ENABLED, thread->base + CMDQ_THR_ENABLE_TASK);
> --
> 1.8.1.1.dirty
>
