Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 206E743F6AE
	for <lists+dri-devel@lfdr.de>; Fri, 29 Oct 2021 07:33:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E0F16E9E5;
	Fri, 29 Oct 2021 05:33:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9962B6E9E5
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Oct 2021 05:33:32 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id z144so10052082iof.0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 22:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FReYOopH02D5COr/NffWZKd+wG9WfCzdcsCckINuOIg=;
 b=I/Y64zF/ZpuDtCvP7DXWwJDekequNVZ0j0qyEbOjPZjY6DZgEJ+OeniAVKShH5FZGz
 WjO8IYnAq4i1OFMbDK1L3gz+P/TaKI8Xa+xZyUj7gNBpQm7wD/K0q1oJ9ehrzTCxdCjE
 O8ZEzctOgSVLLPg2CqXubJ8rei5qxnvHBLlvY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FReYOopH02D5COr/NffWZKd+wG9WfCzdcsCckINuOIg=;
 b=e2ytAC47shGlLaSXyiGRWBfK0kwhpvK/gTazz3basyttcsRrXGBDCpdj2AXFK/btOd
 2FQyjc0WIIUM9MRSI6NAIrvNSAFyZcvK4JvcOzls2rtlQTp5vzDRzkBRbx6ZLIWV8J8P
 wqVGUiVBYdBcWnYYQInQKKS5AjZPmIrN8WAVEGVIQacCkZpt9s0CItlobeKvk4QHsbb3
 5F36V12/Q8A8hvVECzu/JknQ7k+MIWV9Lv4eJ65XNBd+nIBXrUubdGOOURAhhuewrMPH
 Kw/QGaXC+6vrAv1u+OUQjh8wZXt5qY+hCrkBLQFE8ysxM1zpZWrvHztJs2gmB8cfGUN8
 Vq5g==
X-Gm-Message-State: AOAM532jqMfWwrI6vc/IGZk0jWD8sOukxAQ1sql6Mc8qVpqefAGYpu7z
 Gy3+BNIv2Yd9XHmpm4kw1pzQXb7C+QoOAQ==
X-Google-Smtp-Source: ABdhPJxbyAITUfQ5OWurshVlAW3V37CNTXaTa7c13j6svGXzPRgtmil3g+GUyUxbzNsT2E311qOe/A==
X-Received: by 2002:a05:6638:f86:: with SMTP id
 h6mr6558579jal.21.1635485611242; 
 Thu, 28 Oct 2021 22:33:31 -0700 (PDT)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com.
 [209.85.166.42])
 by smtp.gmail.com with ESMTPSA id p9sm2456805iob.43.2021.10.28.22.33.29
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 22:33:29 -0700 (PDT)
Received: by mail-io1-f42.google.com with SMTP id h81so2379125iof.6
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 22:33:29 -0700 (PDT)
X-Received: by 2002:a05:6638:12cd:: with SMTP id
 v13mr6826768jas.84.1635485608849; 
 Thu, 28 Oct 2021 22:33:28 -0700 (PDT)
MIME-Version: 1.0
References: <20211028101912.4624-1-jason-jh.lin@mediatek.com>
 <20211028101912.4624-4-jason-jh.lin@mediatek.com>
In-Reply-To: <20211028101912.4624-4-jason-jh.lin@mediatek.com>
From: Fei Shao <fshao@chromium.org>
Date: Fri, 29 Oct 2021 13:32:53 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhCD-mG-5grj5s3c7NJF1nt=V3v4FN=MvZe2ZMkP9z5_A@mail.gmail.com>
Message-ID: <CAC=S1nhCD-mG-5grj5s3c7NJF1nt=V3v4FN=MvZe2ZMkP9z5_A@mail.gmail.com>
Subject: Re: [PATCH v6 3/6] drm/mediatek: Detect CMDQ execution timeout
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, 
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, hsinyi@chromium.org, nancy.lin@mediatek.com, 
 singo.chang@mediatek.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 28, 2021 at 6:19 PM jason-jh.lin <jason-jh.lin@mediatek.com> wrote:
>
> From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
>
> CMDQ is used to update display register in vblank period, so
> it should be execute in next 2 vblank. One vblank interrupt
> before send message (occasionally) and one vblank interrupt
> after cmdq done. If it fail to execute in next 3 vblank,
> tiemout happen.
>
> Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
Reviewed-by: Fei Shao <fshao@chromium.org>



> ---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> index e23e3224ac67..a368cbc18923 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
> @@ -54,6 +54,7 @@ struct mtk_drm_crtc {
>  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
>         struct cmdq_client              cmdq_client;
>         u32                             cmdq_event;
> +       u32                             cmdq_vblank_cnt;
>  #endif
>
>         struct device                   *mmsys_dev;
> @@ -227,7 +228,10 @@ struct mtk_ddp_comp *mtk_drm_ddp_comp_for_plane(struct drm_crtc *crtc,
>  static void ddp_cmdq_cb(struct mbox_client *cl, void *mssg)
>  {
>         struct cmdq_cb_data *data = mssg;
> +       struct cmdq_client *cmdq_cl = container_of(cl, struct cmdq_client, client);
> +       struct mtk_drm_crtc *mtk_crtc = container_of(cmdq_cl, struct mtk_drm_crtc, cmdq_client);
>
> +       mtk_crtc->cmdq_vblank_cnt = 0;
>         cmdq_pkt_destroy(data->pkt);
>  }
>  #endif
> @@ -483,6 +487,15 @@ static void mtk_drm_crtc_update_config(struct mtk_drm_crtc *mtk_crtc,
>                                            cmdq_handle->pa_base,
>                                            cmdq_handle->cmd_buf_size,
>                                            DMA_TO_DEVICE);
> +               /*
> +                * CMDQ command should execute in next 3 vblank.
> +                * One vblank interrupt before send message (occasionally)
> +                * and one vblank interrupt after cmdq done,
> +                * so it's timeout after 3 vblank interrupt.
> +                * If it fail to execute in next 3 vblank, timeout happen.
> +                */
> +               mtk_crtc->cmdq_vblank_cnt = 3;
> +
>                 mbox_send_message(mtk_crtc->cmdq_client.chan, cmdq_handle);
>                 mbox_client_txdone(mtk_crtc->cmdq_client.chan, 0);
>         }
> @@ -499,11 +512,14 @@ static void mtk_crtc_ddp_irq(void *data)
>
>  #if IS_REACHABLE(CONFIG_MTK_CMDQ)
>         if (!priv->data->shadow_register && !mtk_crtc->cmdq_client.chan)
> +               mtk_crtc_ddp_config(crtc, NULL);
> +       else if (--mtk_crtc->cmdq_vblank_cnt == 0)
> +               DRM_ERROR("mtk_crtc %d CMDQ execute command timeout!\n",
> +                         drm_crtc_index(&mtk_crtc->base));
>  #else
>         if (!priv->data->shadow_register)
> -#endif
>                 mtk_crtc_ddp_config(crtc, NULL);
> -
> +#endif
>         mtk_drm_finish_page_flip(mtk_crtc);
>  }
>
> --
> 2.18.0
>
