Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4190A153A03
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2020 22:18:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05B326EA05;
	Wed,  5 Feb 2020 21:18:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B1F26EA01;
 Wed,  5 Feb 2020 21:18:45 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id e10so3612789edv.9;
 Wed, 05 Feb 2020 13:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HwPPuPnmVEwZ6aDLR6Qux/8T5vpoODzKg3MxR8eUbtI=;
 b=uaLEGuO51KXNG6vo70c0VJas4nlwIgWh3AIlvLVPa+k6MIC61WrmeJiOV6irU8bBJn
 FMojQR6awRUvBofxnnvbPG5tfA21oxc2TXBUJ6n97ia0GLOM200Yns8ZkWjGba70+vuv
 40g2Fi6yHD3PGwqGCFSiSc7GhCMS0Bp0kFyKhiuzt0QVh19vfF1LH05eaUVyEEd+9TNj
 w7XFGFlfMhgupGDb8bUcmBivE1qoji1UkhO01xM5OVTHZz/g2INx308WQLwgj+MqbUW0
 jDvMaRlP6xbYqTj5hNszoUaUC7Lu5NbGwyvL1WFgkCkxLcfkmJDdUeaAzOrY04InCdIb
 hkcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HwPPuPnmVEwZ6aDLR6Qux/8T5vpoODzKg3MxR8eUbtI=;
 b=KC25EyrBTUcZqj3S5DzWBCeEPjXuGfQlh8R/hN6Sj5BgUz2ad3a0SdhRjaVsSQwjWT
 c3qnwUrqKP/EqgkmU2mf3D09M+Ng3+t+jiwH3+tgJiIj9+dG+aNKyF9bb5r9t4x9Y0dD
 94Nx6V28xyy+WQcOPPN+lZ3OCGmqZb5/uMbaCMGtGB13VoA3mPiM0G2l8LQb1Lnw2vFU
 q7YTygh/fybfxe4B8bdUmvGnNL4HiHgmDxCCvtiyfyh7zw6yrAKXBMFxgVhWTnfOlZ20
 RBJT/Ay2+M+6OYy6Vl2mcLaJNkWuOPJxdU3ozb/5AKlDN9kpTrh9Pds59wN1PqsqyuNB
 oSZQ==
X-Gm-Message-State: APjAAAULEX1qsQkdk8Pfi4Yu2Tsabcs/U1dJPY5mbFvO6XpaUIxIZhOg
 j+rl5LrmWAa0J8HSpffz7aVexnLCJjHK/kY0ESc=
X-Google-Smtp-Source: APXvYqwwgRaj4ECfGfJoTZ8YyHexZeS1MvdlVz7PnDwj0THon8h0EODB3kHzoiQQoG1OEnlQsrBRRd2OhNZ8owrKaT8=
X-Received: by 2002:a17:906:6d03:: with SMTP id m3mr18262ejr.39.1580937524119; 
 Wed, 05 Feb 2020 13:18:44 -0800 (PST)
MIME-Version: 1.0
References: <1580922081-25177-1-git-send-email-jcrouse@codeaurora.org>
In-Reply-To: <1580922081-25177-1-git-send-email-jcrouse@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 5 Feb 2020 13:18:33 -0800
Message-ID: <CAF6AEGv4z=XBuiNdnga2LofubRLjZ40O6chpjGorqeZJz2YQXw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: Update the GMU bus tables for sc7180
To: Jordan Crouse <jcrouse@codeaurora.org>
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Douglas Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Feb 5, 2020 at 9:01 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> Fixup the GMU bus table values for the sc7180 target.
>
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>

I suspect that we'll need to figure out a better way to get these
values from the interconnect driver in the long run, esp. since there
are several different SoCs with a618.. but for now, this looks
reasonable

Reviewed-by: Rob Clark <robdclark@gmail.com>
Fixes: e812744c5f95 ("drm: msm: a6xx: Add support for A618")


> ---
>
>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 85 ++++++++++++++++++++++++-----------
>  1 file changed, 60 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> index eda11ab..e450e0b 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> @@ -7,6 +7,7 @@
>
>  #include "a6xx_gmu.h"
>  #include "a6xx_gmu.xml.h"
> +#include "a6xx_gpu.h"
>
>  #define HFI_MSG_ID(val) [val] = #val
>
> @@ -216,48 +217,82 @@ static int a6xx_hfi_send_perf_table(struct a6xx_gmu *gmu)
>                 NULL, 0);
>  }
>
> -static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
> +static void a618_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
>  {
> -       struct a6xx_hfi_msg_bw_table msg = { 0 };
> +       /* Send a single "off" entry since the 618 GMU doesn't do bus scaling */
> +       msg->bw_level_num = 1;
> +
> +       msg->ddr_cmds_num = 3;
> +       msg->ddr_wait_bitmask = 0x01;
> +
> +       msg->ddr_cmds_addrs[0] = 0x50000;
> +       msg->ddr_cmds_addrs[1] = 0x5003c;
> +       msg->ddr_cmds_addrs[2] = 0x5000c;
> +
> +       msg->ddr_cmds_data[0][0] =  0x40000000;
> +       msg->ddr_cmds_data[0][1] =  0x40000000;
> +       msg->ddr_cmds_data[0][2] =  0x40000000;
>
>         /*
> -        * The sdm845 GMU doesn't do bus frequency scaling on its own but it
> -        * does need at least one entry in the list because it might be accessed
> -        * when the GMU is shutting down. Send a single "off" entry.
> +        * These are the CX (CNOC) votes - these are used by the GMU but the
> +        * votes are known and fixed for the target
>          */
> +       msg->cnoc_cmds_num = 1;
> +       msg->cnoc_wait_bitmask = 0x01;
> +
> +       msg->cnoc_cmds_addrs[0] = 0x5007c;
> +       msg->cnoc_cmds_data[0][0] =  0x40000000;
> +       msg->cnoc_cmds_data[1][0] =  0x60000001;
> +}
>
> -       msg.bw_level_num = 1;
> +static void a6xx_build_bw_table(struct a6xx_hfi_msg_bw_table *msg)
> +{
> +       /* Send a single "off" entry since the 630 GMU doesn't do bus scaling */
> +       msg->bw_level_num = 1;
>
> -       msg.ddr_cmds_num = 3;
> -       msg.ddr_wait_bitmask = 0x07;
> +       msg->ddr_cmds_num = 3;
> +       msg->ddr_wait_bitmask = 0x07;
>
> -       msg.ddr_cmds_addrs[0] = 0x50000;
> -       msg.ddr_cmds_addrs[1] = 0x5005c;
> -       msg.ddr_cmds_addrs[2] = 0x5000c;
> +       msg->ddr_cmds_addrs[0] = 0x50000;
> +       msg->ddr_cmds_addrs[1] = 0x5005c;
> +       msg->ddr_cmds_addrs[2] = 0x5000c;
>
> -       msg.ddr_cmds_data[0][0] =  0x40000000;
> -       msg.ddr_cmds_data[0][1] =  0x40000000;
> -       msg.ddr_cmds_data[0][2] =  0x40000000;
> +       msg->ddr_cmds_data[0][0] =  0x40000000;
> +       msg->ddr_cmds_data[0][1] =  0x40000000;
> +       msg->ddr_cmds_data[0][2] =  0x40000000;
>
>         /*
>          * These are the CX (CNOC) votes.  This is used but the values for the
>          * sdm845 GMU are known and fixed so we can hard code them.
>          */
>
> -       msg.cnoc_cmds_num = 3;
> -       msg.cnoc_wait_bitmask = 0x05;
> +       msg->cnoc_cmds_num = 3;
> +       msg->cnoc_wait_bitmask = 0x05;
>
> -       msg.cnoc_cmds_addrs[0] = 0x50034;
> -       msg.cnoc_cmds_addrs[1] = 0x5007c;
> -       msg.cnoc_cmds_addrs[2] = 0x5004c;
> +       msg->cnoc_cmds_addrs[0] = 0x50034;
> +       msg->cnoc_cmds_addrs[1] = 0x5007c;
> +       msg->cnoc_cmds_addrs[2] = 0x5004c;
>
> -       msg.cnoc_cmds_data[0][0] =  0x40000000;
> -       msg.cnoc_cmds_data[0][1] =  0x00000000;
> -       msg.cnoc_cmds_data[0][2] =  0x40000000;
> +       msg->cnoc_cmds_data[0][0] =  0x40000000;
> +       msg->cnoc_cmds_data[0][1] =  0x00000000;
> +       msg->cnoc_cmds_data[0][2] =  0x40000000;
> +
> +       msg->cnoc_cmds_data[1][0] =  0x60000001;
> +       msg->cnoc_cmds_data[1][1] =  0x20000001;
> +       msg->cnoc_cmds_data[1][2] =  0x60000001;
> +}
> +
> +
> +static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
> +{
> +       struct a6xx_hfi_msg_bw_table msg = { 0 };
> +       struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
> +       struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
>
> -       msg.cnoc_cmds_data[1][0] =  0x60000001;
> -       msg.cnoc_cmds_data[1][1] =  0x20000001;
> -       msg.cnoc_cmds_data[1][2] =  0x60000001;
> +       if (adreno_is_a618(adreno_gpu))
> +               a618_build_bw_table(&msg);
> +       else
> +               a6xx_build_bw_table(&msg);
>
>         return a6xx_hfi_send_msg(gmu, HFI_H2F_MSG_BW_TABLE, &msg, sizeof(msg),
>                 NULL, 0);
> --
> 2.7.4
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
