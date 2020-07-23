Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1FB22ABD7
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jul 2020 11:34:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 402C26E88A;
	Thu, 23 Jul 2020 09:34:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4B3D6E88A
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jul 2020 09:34:47 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id h17so4463495oie.3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jul 2020 02:34:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mUOZNRgi2WDMnJstl3822UZz6W+cTtqoXZUUjvczjxY=;
 b=GUmgMVV+0yJv2t6Z8/U6LiDv83RrL6WvPXQzaXMvqS8vXXLmonyC2f/sVYS5y3WgFS
 lu6rgCV0dSB57hhQ+zGsUtViwuNgLJ4Wm7qmLAjXmLIhYKs9InfY8Q9Mg0Z4buKJZJSH
 cnJDaPA48Vl9eEnM8CUeXSmvI0XU1x4mnwVY6JbJTdqm8hHXsl+0cSSgzHYC3UQRL7ek
 FGCLCU4pcz8f6uKd3GfUfubrL0znfhsRCvZCn+xxy/PGfjVBLt1c2u5H4VW4nwTojQti
 twT6bqpOGxsBkLp4efBZayJ0tWmfcim3ZSHR8XUttqsVtES8Gk6Km6KugjNGIC+F8vk6
 P6kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mUOZNRgi2WDMnJstl3822UZz6W+cTtqoXZUUjvczjxY=;
 b=aFCUZSh0OO0zHf+whz6PukcO56rxMn6jwp1+b9VuDz3VldkiGKhxTAWGPnh10lTbhc
 7P6AisMK5rdGrzXsMedsFOVnpfiVTKazXA2X5PFZU/w1W+N9kj+JIKj0vaiVu+HSGJnZ
 pPNsLBmqnnZTBMkbTHbTteo5pT5ineUSKxZH4Itb6NSQ/w4qx5VoUbAUODylKyXPfxiD
 E/Qzc2iwEBx7rfgsVcWd8b12J/8bdV8qCWSoGECsfoJaIoWsoO4wJIi1As/y8FwRfMyf
 1Tu92ou5Ja9RhtqC0bH9rB5xJdFJJgzjfkk5vGw9/bfc/f0sjkXD0mQyWhU9SCD43es2
 69wQ==
X-Gm-Message-State: AOAM532Y/Y9fik9sxKzXUeH6B6fjUWhY3fP/pfnjDFQkS28ngDLZ36UC
 VizVFBRKny0h5V4bjvpvSmbZeVefrF58ibjm/C6M+zAH+etRog==
X-Google-Smtp-Source: ABdhPJzgqe7CiGqbKBHmABe5mif7/AisJOSoULJ2y82Ij6b5HcCjs5bc/QhzNylG1ab4yxMZWRDIL9nHg85nK/H8kbk=
X-Received: by 2002:aca:ba45:: with SMTP id k66mr3149488oif.47.1595496887048; 
 Thu, 23 Jul 2020 02:34:47 -0700 (PDT)
MIME-Version: 1.0
References: <1595469798-3824-1-git-send-email-yongqiang.niu@mediatek.com>
 <1595469798-3824-2-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1595469798-3824-2-git-send-email-yongqiang.niu@mediatek.com>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Thu, 23 Jul 2020 11:34:35 +0200
Message-ID: <CAFqH_50=MkBLHJ23hJo--RG=4560ttOUOjHuEwpevghFZ59xQQ@mail.gmail.com>
Subject: Re: [v7,
 PATCH 1/7] drm/mediatek: move ddp component defint into mtk_mmsys.h
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
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
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Yongqian Niu,

Thank you for your patch

Missatge de Yongqiang Niu <yongqiang.niu@mediatek.com> del dia dj., 23
de jul. 2020 a les 4:05:
>
> move ddp component defint into mtk_mmsys.h
>

There is a typo, should be "defines". But why you should move these
defines to mtk-mmsys?



> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h | 34 +----------------------------
>  drivers/soc/mediatek/mtk-mmsys.c            |  4 +---
>  include/linux/soc/mediatek/mtk-mmsys.h      | 33 ++++++++++++++++++++++++++++
>  3 files changed, 35 insertions(+), 36 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> index debe363..161201f 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h
> @@ -7,6 +7,7 @@
>  #define MTK_DRM_DDP_COMP_H
>
>  #include <linux/io.h>
> +#include <linux/soc/mediatek/mtk-mmsys.h>
>
>  struct device;
>  struct device_node;
> @@ -35,39 +36,6 @@ enum mtk_ddp_comp_type {
>         MTK_DDP_COMP_TYPE_MAX,
>  };
>
> -enum mtk_ddp_comp_id {
> -       DDP_COMPONENT_AAL0,
> -       DDP_COMPONENT_AAL1,
> -       DDP_COMPONENT_BLS,
> -       DDP_COMPONENT_CCORR,
> -       DDP_COMPONENT_COLOR0,
> -       DDP_COMPONENT_COLOR1,
> -       DDP_COMPONENT_DITHER,
> -       DDP_COMPONENT_DPI0,
> -       DDP_COMPONENT_DPI1,
> -       DDP_COMPONENT_DSI0,
> -       DDP_COMPONENT_DSI1,
> -       DDP_COMPONENT_DSI2,
> -       DDP_COMPONENT_DSI3,
> -       DDP_COMPONENT_GAMMA,
> -       DDP_COMPONENT_OD0,
> -       DDP_COMPONENT_OD1,
> -       DDP_COMPONENT_OVL0,
> -       DDP_COMPONENT_OVL_2L0,
> -       DDP_COMPONENT_OVL_2L1,
> -       DDP_COMPONENT_OVL1,
> -       DDP_COMPONENT_PWM0,
> -       DDP_COMPONENT_PWM1,
> -       DDP_COMPONENT_PWM2,
> -       DDP_COMPONENT_RDMA0,
> -       DDP_COMPONENT_RDMA1,
> -       DDP_COMPONENT_RDMA2,
> -       DDP_COMPONENT_UFOE,
> -       DDP_COMPONENT_WDMA0,
> -       DDP_COMPONENT_WDMA1,
> -       DDP_COMPONENT_ID_MAX,
> -};
> -
>  struct mtk_ddp_comp;
>  struct cmdq_pkt;
>  struct mtk_ddp_comp_funcs {
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
> index a55f255..36ad66b 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -5,13 +5,11 @@
>   */
>
>  #include <linux/device.h>
> +#include <linux/io.h>
>  #include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/soc/mediatek/mtk-mmsys.h>
>
> -#include "../../gpu/drm/mediatek/mtk_drm_ddp.h"
> -#include "../../gpu/drm/mediatek/mtk_drm_ddp_comp.h"
> -
>  #define DISP_REG_CONFIG_DISP_OVL0_MOUT_EN      0x040
>  #define DISP_REG_CONFIG_DISP_OVL1_MOUT_EN      0x044
>  #define DISP_REG_CONFIG_DISP_OD_MOUT_EN                0x048
> diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
> index 7bab5d9..2228bf6 100644
> --- a/include/linux/soc/mediatek/mtk-mmsys.h
> +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> @@ -9,6 +9,39 @@
>  enum mtk_ddp_comp_id;
>  struct device;
>
> +enum mtk_ddp_comp_id {
> +       DDP_COMPONENT_AAL0,
> +       DDP_COMPONENT_AAL1,
> +       DDP_COMPONENT_BLS,
> +       DDP_COMPONENT_CCORR,
> +       DDP_COMPONENT_COLOR0,
> +       DDP_COMPONENT_COLOR1,
> +       DDP_COMPONENT_DITHER,
> +       DDP_COMPONENT_DPI0,
> +       DDP_COMPONENT_DPI1,
> +       DDP_COMPONENT_DSI0,
> +       DDP_COMPONENT_DSI1,
> +       DDP_COMPONENT_DSI2,
> +       DDP_COMPONENT_DSI3,
> +       DDP_COMPONENT_GAMMA,
> +       DDP_COMPONENT_OD0,
> +       DDP_COMPONENT_OD1,
> +       DDP_COMPONENT_OVL0,
> +       DDP_COMPONENT_OVL_2L0,
> +       DDP_COMPONENT_OVL_2L1,
> +       DDP_COMPONENT_OVL1,
> +       DDP_COMPONENT_PWM0,
> +       DDP_COMPONENT_PWM1,
> +       DDP_COMPONENT_PWM2,
> +       DDP_COMPONENT_RDMA0,
> +       DDP_COMPONENT_RDMA1,
> +       DDP_COMPONENT_RDMA2,
> +       DDP_COMPONENT_UFOE,
> +       DDP_COMPONENT_WDMA0,
> +       DDP_COMPONENT_WDMA1,
> +       DDP_COMPONENT_ID_MAX,
> +};
> +
>  void mtk_mmsys_ddp_connect(struct device *dev,
>                            enum mtk_ddp_comp_id cur,
>                            enum mtk_ddp_comp_id next);
> --
> 1.8.1.1.dirty
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
