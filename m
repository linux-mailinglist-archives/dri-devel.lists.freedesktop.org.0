Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BC749DDD6
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 10:24:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 795E510EFA9;
	Thu, 27 Jan 2022 09:24:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B843D10EFA9
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 09:24:09 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id z7so3376575ljj.4
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jan 2022 01:24:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1/pFKZsibDbTasI5zHvoomcfgVulhQzgBhdCkCIsPV4=;
 b=SBk++oGjK7vx0bR/u816Fk2uDzB+AlEwqZ4fjozkcNku8sKEy0s4qnYQVBkjiLcXwZ
 iONXICtuFkUv6Hw8Tzo4sCIck9Nt/2u9zBftwk0FLSN/SWTNQTB3x08U4JLD4Wzx1o5h
 hiX00dZ7j99eLlL0vFrDxqxBbboh8fBIxyY6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1/pFKZsibDbTasI5zHvoomcfgVulhQzgBhdCkCIsPV4=;
 b=0bYsnXdEy3VkgDQNKLAFwaHDGz0S7t8WfrC7kZ/UNRES5ztb+qWTnx5UX/Zx1Jousy
 ge3lXU+HfANoSfofH15obl8pyZaHwvRsK83Sxanw5mO4cxsjqURJvD29XFNw5d5nyade
 feQlxmmAxDEh9ImiG/CSzMzh6v6NGzuL+lwud8uMDCd/fAJy8cZMpkM+vwIPQTapAGPK
 lVtuqyw4RQOxpXkTmSFhLxrNDeYkp+a1NI/qZIdE+pyO2U4OhFV5mvetXJ6RNQ7rujMs
 dgVMiD330PuY876O1Pa7bSyfkHY9aPcwLlSIsSQn5TMz0iXCQLeqmNv89TuX0a9TVqtk
 xv5A==
X-Gm-Message-State: AOAM530ZDeXLBrzpIHAFJqJV7VvpjmXjm63m5oYa/kOPvlBJPMTlRooO
 3decmbZTN5jrKickY0O9GH2Z68aUkNWESRArEEUGAg==
X-Google-Smtp-Source: ABdhPJyXM+RpThUvI1HjeGrfGwAx7jB600kp/rh3QNtWeV9RUuO7+U6MejDM5XXVg8GmXXHFoXWzjd3Eg8/BT40cL18=
X-Received: by 2002:a2e:920b:: with SMTP id k11mr2169470ljg.302.1643275447980; 
 Thu, 27 Jan 2022 01:24:07 -0800 (PST)
MIME-Version: 1.0
References: <20220127025544.10854-1-yunfei.dong@mediatek.com>
 <20220127025544.10854-8-yunfei.dong@mediatek.com>
In-Reply-To: <20220127025544.10854-8-yunfei.dong@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 27 Jan 2022 17:23:56 +0800
Message-ID: <CAGXv+5ELuvvG6dwXH5DdHtjOm4j4AAVTk2UxGOitF5v5Vx265A@mail.gmail.com>
Subject: Re: [PATCH v1, 7/8] media: uapi: Init VP9 stateless decode params
To: Yunfei Dong <yunfei.dong@mediatek.com>, 
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Xiaoyong Lu <xiaoyong.lu@mediatek.com>, Steve Cho <stevecho@chromium.org>,
 Irui Wang <irui.wang@mediatek.com>, George Sun <george.sun@mediatek.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Fritz Koenig <frkoenig@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, Tzung-Bi Shih <tzungbi@chromium.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>, Tomasz Figa <tfiga@google.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 srv_heupstream@mediatek.com, Alexandre Courbot <acourbot@chromium.org>,
 linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Jan 27, 2022 at 10:56 AM Yunfei Dong <yunfei.dong@mediatek.com> wrote:
>
> Init some of VP9 frame decode params to default value.
>
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Maybe add

Fixes: b88dbe38dca8 ("media: uapi: Add VP9 stateless decoder controls")

> ---
>  drivers/media/v4l2-core/v4l2-ctrls-core.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> index 54abe5245dcc..b25c77b8a445 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> @@ -112,6 +112,7 @@ static void std_init_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>         struct v4l2_ctrl_mpeg2_picture *p_mpeg2_picture;
>         struct v4l2_ctrl_mpeg2_quantisation *p_mpeg2_quant;
>         struct v4l2_ctrl_vp8_frame *p_vp8_frame;
> +       struct v4l2_ctrl_vp9_frame *p_vp9_frame;
>         struct v4l2_ctrl_fwht_params *p_fwht_params;
>         void *p = ptr.p + idx * ctrl->elem_size;
>
> @@ -152,6 +153,13 @@ static void std_init_compound(const struct v4l2_ctrl *ctrl, u32 idx,
>                 p_vp8_frame = p;
>                 p_vp8_frame->num_dct_parts = 1;
>                 break;
> +       case V4L2_CTRL_TYPE_VP9_FRAME:
> +               p_vp9_frame = p;
> +               p_vp9_frame->profile = 0;
> +               p_vp9_frame->bit_depth = 8;
> +               p_vp9_frame->flags |= V4L2_VP9_FRAME_FLAG_X_SUBSAMPLING |
> +                       V4L2_VP9_FRAME_FLAG_Y_SUBSAMPLING;
> +               break;
>         case V4L2_CTRL_TYPE_FWHT_PARAMS:
>                 p_fwht_params = p;
>                 p_fwht_params->version = V4L2_FWHT_VERSION;
> --
> 2.25.1
>
