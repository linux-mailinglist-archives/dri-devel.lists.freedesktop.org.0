Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A952DAE18
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 14:38:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2763D89CA8;
	Tue, 15 Dec 2020 13:38:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80C0D89CA8
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 13:38:07 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id z16so10965280vsp.5
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 05:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9FgvEA6LpRqaZRiWRCs1HzkpZ2wxH4J/Kj/S8yl9EX8=;
 b=aMDDKyWXNebTeXg5FMLCK9txB+AXo41QnAw7eILkX0NTeyAdt7jEx4r62/kGLfIHLY
 NTdTfInWItH7WmdFOmFWrs0hZxC8xA4+JavAwYl1jp8pksKKMo4VeyPHa4XewnixNL71
 5zM6Wgsl4rhnbDaXq2EpMe4o9FfwGh7clMUv4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9FgvEA6LpRqaZRiWRCs1HzkpZ2wxH4J/Kj/S8yl9EX8=;
 b=SBDVDPke7rlu/C71rjdqxMWT5unFr03v94CnEgrsasy7UZlXe99sOm2yPFbA9FuMMD
 c5Zh4WexNDjx3SsucQnDsAjr9Yjq7tf0Mztyq3doeVgCrA+6Ec3sQyAHsxJ54s1Y4BMf
 aVWyUIpBXQL1AmaAyyUqd2KkKhL8HLcNrX0afdmoChxFcXFLXH+MtTBsGl0ePjYn3Ftt
 O7KltulaLli8ZYO19qVLY1zj/PNv5bGe6pfIiJPcP2V2UufY2oxFftsO7a+JYanPdVya
 IsGgaRh8g2Zs1iCrcZng7iZmnzJr3nrrHTZttlQw715knfL6XWKTA+hcUhdwyG/uVAYu
 Z63w==
X-Gm-Message-State: AOAM533IIj4v2fKcXFVRBOHglYH1zqdHGLAvW4WWnpVkXVGzl0VcjMZN
 YK+YSTCuriXF9heb1Z7e88BAGsXKQu2q3E+Mv4QCGg==
X-Google-Smtp-Source: ABdhPJw2pSaiM6ovuzcTeKxy3DP6Ku+SVy15pyfTwAwM3z1ikPI1R8D7O7JPHcMCx/NBwXhCbuTiLeGCivpmnPRuZRE=
X-Received: by 2002:a67:5c03:: with SMTP id q3mr26997421vsb.47.1608039486303; 
 Tue, 15 Dec 2020 05:38:06 -0800 (PST)
MIME-Version: 1.0
References: <1607746317-4696-1-git-send-email-yongqiang.niu@mediatek.com>
 <1607746317-4696-8-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1607746317-4696-8-git-send-email-yongqiang.niu@mediatek.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Tue, 15 Dec 2020 21:37:55 +0800
Message-ID: <CANMq1KCbmW4kbY5rbuogr9JJD5c5=-qatFs-EaWbuAxSzWmnLQ@mail.gmail.com>
Subject: Re: [PATCH v2, 07/17] drm/mediatek: add disp config and mm 26mhz
 clock into mutex device
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
 Devicetree List <devicetree@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Dec 12, 2020 at 12:12 PM Yongqiang Niu
<yongqiang.niu@mediatek.com> wrote:
>
> there are 2 more clock need enable for display.
> parser these clock when mutex device probe,
> enable and disable when mutex on/off
>
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_ddp.c | 49 ++++++++++++++++++++++++++++------
>  1 file changed, 41 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> index 60788c1..de618a1 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp.c
> @@ -118,7 +118,7 @@ struct mtk_ddp_data {
>
>  struct mtk_ddp {
>         struct device                   *dev;
> -       struct clk                      *clk;
> +       struct clk                      *clk[3];
>         void __iomem                    *regs;
>         struct mtk_disp_mutex           mutex[10];
>         const struct mtk_ddp_data       *data;
> @@ -257,14 +257,39 @@ int mtk_disp_mutex_prepare(struct mtk_disp_mutex *mutex)
>  {
>         struct mtk_ddp *ddp = container_of(mutex, struct mtk_ddp,
>                                            mutex[mutex->id]);
> -       return clk_prepare_enable(ddp->clk);
> +       int ret;
> +       int i;
> +
> +       for (i = 0; i < ARRAY_SIZE(ddp->clk); i++) {
> +               if (IS_ERR(ddp->clk[i]))
> +                       continue;
> +               ret = clk_prepare_enable(ddp->clk[i]);
> +               if (ret) {
> +                       pr_err("failed to enable clock, err %d. i:%d\n",
> +                               ret, i);
> +                       goto err;
> +               }
> +       }
> +
> +       return 0;
> +
> +err:
> +       while (--i >= 0)
> +               clk_disable_unprepare(ddp->clk[i]);
> +       return ret;
>  }
>
>  void mtk_disp_mutex_unprepare(struct mtk_disp_mutex *mutex)
>  {
>         struct mtk_ddp *ddp = container_of(mutex, struct mtk_ddp,
>                                            mutex[mutex->id]);
> -       clk_disable_unprepare(ddp->clk);
> +       int i;
> +
> +        for (i = 0; i < ARRAY_SIZE(ddp->clk); i++) {
> +               if (IS_ERR(ddp->clk[i]))
> +                       continue;
> +               clk_disable_unprepare(ddp->clk[i]);
> +       }
>  }
>
>  void mtk_disp_mutex_add_comp(struct mtk_disp_mutex *mutex,
> @@ -415,11 +440,19 @@ static int mtk_ddp_probe(struct platform_device *pdev)
>         ddp->data = of_device_get_match_data(dev);
>
>         if (!ddp->data->no_clk) {
> -               ddp->clk = devm_clk_get(dev, NULL);
> -               if (IS_ERR(ddp->clk)) {
> -                       if (PTR_ERR(ddp->clk) != -EPROBE_DEFER)
> -                               dev_err(dev, "Failed to get clock\n");
> -                       return PTR_ERR(ddp->clk);
> +               int ret;
> +
> +               for (i = 0; i < ARRAY_SIZE(ddp->clk); i++) {
> +                       ddp->clk[i] = of_clk_get(dev->of_node, i);
> +
> +                       if (IS_ERR(ddp->clk[i])) {
> +                               ret = PTR_ERR(ddp->clk[i]);
> +                               if (ret != EPROBE_DEFER)
> +                                       dev_err(dev, "Failed to get clock %d\n",
> +                                               ret);
> +
> +                               return ret;
> +                       }

Use of_clk_bulk_get_all instead?

ddp->num_clks = of_clk_bulk_get_all(dev->of_node, &ddp->clks);
...

Then the calls above can be clk_bulk_enable/clk_bulk_disable using
num_clks and clks.


>                 }
>         }
>
> --
> 1.8.1.1.dirty
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
