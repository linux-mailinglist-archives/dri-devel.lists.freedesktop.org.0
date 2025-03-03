Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6B9A4C1DE
	for <lists+dri-devel@lfdr.de>; Mon,  3 Mar 2025 14:29:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3786D89FA7;
	Mon,  3 Mar 2025 13:28:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fvovLgDu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBA3D89FA7
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 13:28:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 722235C5994
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 13:26:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5407C4CEEA
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Mar 2025 13:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741008536;
 bh=pU75ZWR55ytSqTfFyBXoZ15CdXjjZybmf3hZAq7hNZA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fvovLgDuT8SSv3WCPvLaVtJ0pBNwyRk6mFp31yKWnf+m8GRu7OhSOpELYlOpzrLNN
 sqdAotELtlVNYxz7k6QnZtcBAlyXprLJPPsSicGaETkDSeNYREsV4LGPuE+zQwUzJU
 vJeo0lTRXJn33MqW9GSE1LA10t2CBcSeWWF/JJxdzVejirlmdmXYvnfYsJ3fudmtQ9
 7K9jdg92q+5e6jsT3P3a5357wIHHlB6QY+ZKso/Q1+ndSWBnoPz83uRD/qG8ERufGH
 tPdnoGpo5d5sWXgFI4mByp/QiN7oufWU1SvpUPzn8zcBQhD/Ssc50B2bSIWu3/5php
 wpKCziGZrfnaw==
Received: by mail-pj1-f42.google.com with SMTP id
 98e67ed59e1d1-2f42992f608so6794640a91.0
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Mar 2025 05:28:56 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWsgr2/dW0gY1Tf0DkT90NqqhIqf5uOSpb5WWSxR4QM5X2ID8u7z7DJ/5Zc+UFQyCIdCxqJ7MW6tx0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyALFlSWYB+dkblDQlQTHOPk2XxxJy5Yahg0zOlnrKjM8EH8jRN
 mvToIeSNPhA5lW5NNBxHquFGUrXut7WE9NyroNNxoPZG981GAcAoB+GCnoiE1Ig1/ce9O5t3Xd1
 vMJCUPyLOiy+LliN6PDLE7FDd+g==
X-Google-Smtp-Source: AGHT+IHEdNW1OchHMbLS1cCfwrEs+3MwI78VEpSMNYRCH8bFSj4YHOZdW6AmaLLo8nvW04MvVqNc2fV4NRzXAOPbwh8=
X-Received: by 2002:a17:90b:3d4e:b0:2fe:b9a2:fd3b with SMTP id
 98e67ed59e1d1-2febabf8336mr20713936a91.30.1741008536294; Mon, 03 Mar 2025
 05:28:56 -0800 (PST)
MIME-Version: 1.0
References: <b754a408-4f39-4e37-b52d-7706c132e27f@stanley.mountain>
In-Reply-To: <b754a408-4f39-4e37-b52d-7706c132e27f@stanley.mountain>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 3 Mar 2025 21:29:43 +0800
X-Gmail-Original-Message-ID: <CAAOTY__KF=9Pp=3PAnXG5WCPX4Hxkfd391eBu0dfhO-wz9dWqw@mail.gmail.com>
X-Gm-Features: AQ5f1JoEyaQUFZqrdcQEIsbOBWMKKKZ_mrsKmQyi0xWBpqur_M_EISNLxHKjU88
Message-ID: <CAAOTY__KF=9Pp=3PAnXG5WCPX4Hxkfd391eBu0dfhO-wz9dWqw@mail.gmail.com>
Subject: Re: [PATCH RESEND] drm/mediatek: dsi: fix error codes in
 mtk_dsi_host_transfer()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Julien STEPHAN <jstephan@baylibre.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Dan:

Dan Carpenter <dan.carpenter@linaro.org> =E6=96=BC 2025=E5=B9=B41=E6=9C=888=
=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=885:36=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> There is a type bug because the return statement:
>
>         return ret < 0 ? ret : recv_cnt;
>
> The issue is that ret is an int, recv_cnt is a u32 and the function
> returns ssize_t, which is a signed long.  The way that the type promotion
> works is that the negative error codes are first cast to u32 and then
> to signed long.  The error codes end up being positive instead of
> negative and the callers treat them as success.

Applied to mediatek-drm-next [1], thanks.

[1] https://web.git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.=
git/log/?h=3Dmediatek-drm-next

Regards,
Chun-Kuang.

>
> Fixes: 81cc7e51c4f1 ("drm/mediatek: Allow commands to be sent during vide=
o mode")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/r/202412210801.iADw0oIH-lkp@intel.com/
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> ---
> I sent this patch earlier:
> https://lore.kernel.org/all/Y%2FyBC4yxTs+Po0TG@kili/
> but it wasn't applied.  I've changed the commit message a bit and added
> new tags.
>
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediate=
k/mtk_dsi.c
> index d871b1dba083..0acfda47f002 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -1015,12 +1015,12 @@ static ssize_t mtk_dsi_host_transfer(struct mipi_=
dsi_host *host,
>                                      const struct mipi_dsi_msg *msg)
>  {
>         struct mtk_dsi *dsi =3D host_to_dsi(host);
> -       u32 recv_cnt, i;
> +       ssize_t recv_cnt;
>         u8 read_data[16];
>         void *src_addr;
>         u8 irq_flag =3D CMD_DONE_INT_FLAG;
>         u32 dsi_mode;
> -       int ret;
> +       int ret, i;
>
>         dsi_mode =3D readl(dsi->regs + DSI_MODE_CTRL);
>         if (dsi_mode & MODE) {
> @@ -1069,7 +1069,7 @@ static ssize_t mtk_dsi_host_transfer(struct mipi_ds=
i_host *host,
>         if (recv_cnt)
>                 memcpy(msg->rx_buf, src_addr, recv_cnt);
>
> -       DRM_INFO("dsi get %d byte data from the panel address(0x%x)\n",
> +       DRM_INFO("dsi get %zd byte data from the panel address(0x%x)\n",
>                  recv_cnt, *((u8 *)(msg->tx_buf)));
>
>  restore_dsi_mode:
> --
> 2.45.2
>
