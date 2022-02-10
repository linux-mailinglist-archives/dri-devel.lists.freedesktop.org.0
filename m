Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 490224B10C0
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 15:47:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1747C10E878;
	Thu, 10 Feb 2022 14:47:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D6E010E28B
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 14:47:21 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E591861A4E
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 14:47:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 597DAC340E5
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 14:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644504440;
 bh=O3JOfPmpBwP/gmoNJ7OcEd8I9SFz30bb2+bBccRllQo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=UG557PE0zKLLnOzvvt/XPxcYZtX2VYIeGz3rd+I50f5mCxayksCvm3SOIoREvUKDz
 yeqHjK1VhFBiHZLF+qPoeRhxg1qcRqUrL0klmNDz1o54X3PFsW5nISll9zhmP7nys0
 GzYRGHTit0QS+ZSuiqTvMz3Am3kgREsZaFhKgAuTT0NhojJBjzVEj3Jk7KTxi7FQRI
 xBFrokui8CvRxiAc3RoZcWSvUW5spHTQyYJlknePvkdBSORrdXhPpLYeFozH/0deBD
 N/Z4eElMKAqfBmseWEctG1HPJeeH2gHgsenDcApGh8IxivUeZ9yD4PLelHZpFA1mz6
 XCWVFLLNt6Riw==
Received: by mail-ed1-f42.google.com with SMTP id cz16so11267503edb.8
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 06:47:20 -0800 (PST)
X-Gm-Message-State: AOAM531tAfq721W9CCWmymP1BV9dBb532q4hAbs7naLKJDwTMdULgaiu
 Xlv59PdrbTMeZBQ8ln6lcn0115MOpv3qB0Zg2A==
X-Google-Smtp-Source: ABdhPJxpwUZeJ0qluZsLz3I68UmvPC5zgdCoTcIEq2Zdeqtnc4dwKsGWjpYJoB+Qs4sdmpTJIWsWCoOUl8JTom8pf4k=
X-Received: by 2002:aa7:c418:: with SMTP id j24mr8683068edq.451.1644504438640; 
 Thu, 10 Feb 2022 06:47:18 -0800 (PST)
MIME-Version: 1.0
References: <20220210124638.2330904-1-jstephan@baylibre.com>
In-Reply-To: <20220210124638.2330904-1-jstephan@baylibre.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 10 Feb 2022 22:47:05 +0800
X-Gmail-Original-Message-ID: <CAAOTY__gw5GZT3+=R4CiaVX=DTRGTs2vtOvXxV6v+tw7LwnU2g@mail.gmail.com>
Message-ID: <CAAOTY__gw5GZT3+=R4CiaVX=DTRGTs2vtOvXxV6v+tw7LwnU2g@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: allow commands to be sent during video
 mode
To: Julien STEPHAN <jstephan@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS FOR MEDIATEK" <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:DRM DRIVERS FOR MEDIATEK" <linux-mediatek@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Julien:

Julien STEPHAN <jstephan@baylibre.com> =E6=96=BC 2022=E5=B9=B42=E6=9C=8810=
=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=888:47=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> Mipi dsi panel drivers can use mipi_dsi_dcs_{set,get}_display_brightness(=
)
> to request backlight changes.
>
> This can be done during panel initialization (dsi is in command mode)
> or afterwards (dsi is in Video Mode).
>
> When the DSI is in Video Mode, all commands are rejected.
>
> Detect current DSI mode in mtk_dsi_host_transfer() and switch modes
> temporarily to allow commands to be sent.

Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

>
> Signed-off-by: Julien STEPHAN <jstephan@baylibre.com>
> Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
> ---
> Changes in v2:
>   - update commit message to be more descriptive
>
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 34 ++++++++++++++++++++++--------
>  1 file changed, 25 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediate=
k/mtk_dsi.c
> index 5d90d2eb0019..7d66fdc7f81d 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -891,24 +891,34 @@ static ssize_t mtk_dsi_host_transfer(struct mipi_ds=
i_host *host,
>         u8 read_data[16];
>         void *src_addr;
>         u8 irq_flag =3D CMD_DONE_INT_FLAG;
> -
> -       if (readl(dsi->regs + DSI_MODE_CTRL) & MODE) {
> -               DRM_ERROR("dsi engine is not command mode\n");
> -               return -EINVAL;
> +       u32 dsi_mode;
> +
> +       dsi_mode =3D readl(dsi->regs + DSI_MODE_CTRL);
> +       if (dsi_mode & MODE) {
> +               mtk_dsi_stop(dsi);
> +               if (mtk_dsi_switch_to_cmd_mode(dsi, VM_DONE_INT_FLAG, 500=
)) {
> +                       recv_cnt =3D -EINVAL;
> +                       goto restore_dsi_mode;
> +               }
>         }
>
>         if (MTK_DSI_HOST_IS_READ(msg->type))
>                 irq_flag |=3D LPRX_RD_RDY_INT_FLAG;
>
> -       if (mtk_dsi_host_send_cmd(dsi, msg, irq_flag) < 0)
> -               return -ETIME;
> +       if (mtk_dsi_host_send_cmd(dsi, msg, irq_flag) < 0) {
> +               recv_cnt =3D -ETIME;
> +               goto restore_dsi_mode;
> +       }
>
> -       if (!MTK_DSI_HOST_IS_READ(msg->type))
> -               return 0;
> +       if (!MTK_DSI_HOST_IS_READ(msg->type)) {
> +               recv_cnt =3D 0;
> +               goto restore_dsi_mode;
> +       }
>
>         if (!msg->rx_buf) {
>                 DRM_ERROR("dsi receive buffer size may be NULL\n");
> -               return -EINVAL;
> +               recv_cnt =3D -EINVAL;
> +               goto restore_dsi_mode;
>         }
>
>         for (i =3D 0; i < 16; i++)
> @@ -933,6 +943,12 @@ static ssize_t mtk_dsi_host_transfer(struct mipi_dsi=
_host *host,
>         DRM_INFO("dsi get %d byte data from the panel address(0x%x)\n",
>                  recv_cnt, *((u8 *)(msg->tx_buf)));
>
> +restore_dsi_mode:
> +       if (dsi_mode & MODE) {
> +               mtk_dsi_set_mode(dsi);
> +               mtk_dsi_start(dsi);
> +       }
> +
>         return recv_cnt;
>  }
>
> --
> 2.35.1
>
