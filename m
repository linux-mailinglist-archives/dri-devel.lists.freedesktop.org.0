Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E9028DA3B
	for <lists+dri-devel@lfdr.de>; Wed, 14 Oct 2020 09:04:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DEEE6EA13;
	Wed, 14 Oct 2020 07:04:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AF0F6E3F5
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Oct 2020 18:09:51 +0000 (UTC)
Received: by mail-il1-x142.google.com with SMTP id q1so1158810ilt.6
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Oct 2020 11:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TE2fl/qyE0ZlA7fIvI5O4hrdLbHdTXQxQKy8JK0q3BA=;
 b=ubAscvvyW2B6KLNtkBbazSIC4pm8TD4sdIhBQKaONsIrvYUNTpwqjGh/HXGxu6zGk0
 QMxkSXVje4iKactBly7HjjNN/Y85LHLDjqSzy5vu8PqdsRIS4VQ0vo4ISr/RZyXRO1SW
 5vNVVqzKHMzQBznwTOESTZiKZFfNp/W7Kpqypn7NRp7LLhLUumuvVEJfoj3CV50qYONP
 NEqjQtrHmuYbf+0KS6HlLncpkER5ADcJzKYGbVoaUi7D6+GcFEYVTgYCWVxtyi1dhqEK
 ctbwf++/BSJI/rgrNp/BxtVtgFW2A3Cy7KCixpdFox8y8aWKlwMY43ktplNzprK5rueD
 6jpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TE2fl/qyE0ZlA7fIvI5O4hrdLbHdTXQxQKy8JK0q3BA=;
 b=VHTUXp96v/y7BXjtPszpLFoL9mheJW43LJS8s1SXTr7P9V7wpnL8FyAWYFO4CbS3Ar
 z+LAjnGQxX1Jc23vhIYsp9GL3ebH57tY685Lg3bTS4fj1VkF9X7113v/dJXAWl0Wbt9s
 Llb72CJfNhoFYj3JcF7EFz+yhgYaJC9ekkVpceF92V+QKqaTZMgEsMw6/W60t/jOFi4V
 95w+6nvRaBdvLT/zzhd6JOkrahyVscfFK4zbapWHMU3T/y+gv0FUREOiu4522YzPWrZU
 9q/2/CuT2e8AzAJKOLh/p1gzu+d+LzeFrvqVZt0WbFTqMKLVSRgAY4G8o367HZQlS2Ao
 8i9g==
X-Gm-Message-State: AOAM532R1SaFayhzLWG1aBzojj33WxRRg9U4I0hs7ZxiD2VCVw686qrj
 vjChzSOFitSsC0Y+pRUKmb466LZ2B/LNnqlJSAqOnA==
X-Google-Smtp-Source: ABdhPJwY3+uca79dB+DpzD2BqWxy386/q68+0Wx8eiiTzy3ZbGd3JtUUxsWGLmmvtTcD5QGvD2EdLVGpuAGKbrC8vgk=
X-Received: by 2002:a92:7914:: with SMTP id u20mr966643ilc.203.1602612590574; 
 Tue, 13 Oct 2020 11:09:50 -0700 (PDT)
MIME-Version: 1.0
References: <20201013172832.4055545-1-fparent@baylibre.com>
 <20201013172832.4055545-2-fparent@baylibre.com>
In-Reply-To: <20201013172832.4055545-2-fparent@baylibre.com>
From: Fabien Parent <fparent@baylibre.com>
Date: Tue, 13 Oct 2020 20:09:39 +0200
Message-ID: <CAOwMV_wo0SeXRbX-8+ipTr3zcYNPZ4fNF7-Xf8hX0RYP_EAOsw@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/mediatek: mtk_hdmi: add MT8167 support for HDMI
To: linux-kernel <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 dri-devel@lists.freedesktop.org
X-Mailman-Approved-At: Wed, 14 Oct 2020 07:03:58 +0000
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
Cc: Matthias Brugger <matthias.bgg@gmail.com>, airlied@linux.ie,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 13, 2020 at 7:28 PM Fabien Parent <fparent@baylibre.com> wrote:
>
> Add support for HDMI on MT8167. HDMI on MT8167 is similar to
> MT8173/MT2701 execpt for the two registers: SYS_CFG1C and SYS_CFG20
>
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_hdmi.c      | 7 +++++++
>  drivers/gpu/drm/mediatek/mtk_hdmi_regs.h | 2 ++
>  2 files changed, 9 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> index c70f195c21be..7762be5cb446 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -1835,9 +1835,16 @@ static struct mtk_hdmi_data mt8173_hdmi_driver_data = {
>         .sys_cfg20 = HDMI_SYS_CFG20,
>  };
>
> +static struct mtk_hdmi_conf mt8167_hdmi_driver_data = {

Sent the wrong patch. Sending v2 soon.

> +       .sys_cfg1c = MT8167_HDMI_SYS_CFG1C,
> +       .sys_cfg20 = MT8167_HDMI_SYS_CFG20,
> +};
> +
>  static const struct of_device_id mtk_drm_hdmi_of_ids[] = {
>         { .compatible = "mediatek,mt8173-hdmi",
>           .data = &mt8173_hdmi_driver_data },
> +       { .compatible = "mediatek,mt8167-hdmi",
> +         .data = &mt8167_hdmi_driver_data },
>         {}
>  };
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_regs.h b/drivers/gpu/drm/mediatek/mtk_hdmi_regs.h
> index 2050ba45b23a..a0f9c367d7aa 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi_regs.h
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi_regs.h
> @@ -195,6 +195,7 @@
>  #define GEN_RGB                                (0 << 7)
>
>  #define HDMI_SYS_CFG1C         0x000
> +#define MT8167_HDMI_SYS_CFG1C  0x800
>  #define HDMI_ON                                BIT(0)
>  #define HDMI_RST                       BIT(1)
>  #define ANLG_ON                                BIT(2)
> @@ -211,6 +212,7 @@
>  #define HTPLG_PIN_SEL_OFF              BIT(30)
>  #define AES_EFUSE_ENABLE               BIT(31)
>  #define HDMI_SYS_CFG20         0x004
> +#define MT8167_HDMI_SYS_CFG20  0x804
>  #define DEEP_COLOR_MODE_MASK           (3 << 1)
>  #define COLOR_8BIT_MODE                        (0 << 1)
>  #define COLOR_10BIT_MODE               (1 << 1)
> --
> 2.28.0
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
