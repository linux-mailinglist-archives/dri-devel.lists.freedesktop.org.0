Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0956F2DAE2C
	for <lists+dri-devel@lfdr.de>; Tue, 15 Dec 2020 14:42:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DEC56E039;
	Tue, 15 Dec 2020 13:42:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com
 [IPv6:2607:f8b0:4864:20::e43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E47B06E039
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 13:42:33 +0000 (UTC)
Received: by mail-vs1-xe43.google.com with SMTP id p7so10981040vsf.8
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Dec 2020 05:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WdtyYhINVIP0zj4hUblQtYm+d83mIC5y4bO6fsIgws4=;
 b=C/RgTTl9KMhfhdhqZl9UbJevCVbwaNYQgtvwTG+fXTyFmB6V2/sys/PtcEKz+1Oy4O
 p3GSJKsust/Icf+LPbYr3T+jLpXLVEF8rug3mXG2q9goAHNClsaujDImUyJFUlTwWR7q
 VtyutBiwjXkLgHwiW1N9bmLQtkEKT0weRm398=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WdtyYhINVIP0zj4hUblQtYm+d83mIC5y4bO6fsIgws4=;
 b=NaVjWLb+ZXJ0/U1TzZaaLCBzXSPMmOO+jYwL1lxoC4yXHMoZhl03c0aMTeokLUE29q
 YB8S4YiE8hiyGIUphiDZI7W3qfGsStH79z1bNeFy2rX3M+bdt1YQ/Bl/RrIfp2kmPK7e
 WgV4NclexOr24Ig0bExu0SD49uBo7B0/zh1aOanAlzTFKZUAfzbQmz7PQ0Y+PhD1oGWt
 sL4g2o3PglJeh5xvoq4W0XJnR6Hq+DvgndnwQKkjTA/DbWBkwvutxWjr6znwL3GoHHP+
 /WAGev+Cu2NNcz5tngl5E44sIB8cKgOQSuVFSX1Quw4N6WIYGMODkcDVCDnTByX5c1/q
 Lm9Q==
X-Gm-Message-State: AOAM533wO8kvTXlC/2tSnET8jGPFQHaVuaVgO+xGJynEBhnu8m7m0R9A
 EnZvvwCj149bI3wfeQWtc2/LSJTfrY/DUUW4TOtYkA==
X-Google-Smtp-Source: ABdhPJxv7M8JgVQKp38gzV7gwW3jUYVRPuREIp84PvUJ8p1GCQQ6BumzGfT66kHqi5Xu7tZP47OxnxOJibawlusR1MI=
X-Received: by 2002:a67:ff03:: with SMTP id v3mr26709138vsp.48.1608039752973; 
 Tue, 15 Dec 2020 05:42:32 -0800 (PST)
MIME-Version: 1.0
References: <1607746317-4696-1-git-send-email-yongqiang.niu@mediatek.com>
 <1607746317-4696-15-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1607746317-4696-15-git-send-email-yongqiang.niu@mediatek.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Tue, 15 Dec 2020 21:42:22 +0800
Message-ID: <CANMq1KBu4Ft49CUgGMxYdsv6ymWzVWK+eNBhn1t+oEN0ZwP0YA@mail.gmail.com>
Subject: Re: [PATCH v2, 14/17] soc: mediatek: mmsys: Use function call for
 setting mmsys ovl mout register
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

On Sat, Dec 12, 2020 at 12:13 PM Yongqiang Niu
<yongqiang.niu@mediatek.com> wrote:
>
> Use function call for setting mmsys ovl mout register
>
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
> ---
>  drivers/soc/mediatek/mmsys/mtk-mmsys.c | 18 ++++++++++++++++++
>  include/linux/soc/mediatek/mtk-mmsys.h |  3 +++
>  2 files changed, 21 insertions(+)
>
> diff --git a/drivers/soc/mediatek/mmsys/mtk-mmsys.c b/drivers/soc/mediatek/mmsys/mtk-mmsys.c
> index cb76e64..2558b42 100644
> --- a/drivers/soc/mediatek/mmsys/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mmsys/mtk-mmsys.c
> @@ -78,6 +78,15 @@ void mtk_mmsys_ddp_connect(struct device *dev,
>                 reg = readl_relaxed(mmsys->regs + addr) | value;
>                 writel_relaxed(reg, mmsys->regs + addr);
>         }
> +
> +       if (!funcs->ovl_mout_en)
> +               return;
> +
> +       value = funcs->ovl_mout_en(cur, next, &addr);
> +       if (value) {
> +               reg = readl_relaxed(mmsys->regs + addr) | value;
> +               writel_relaxed(reg, mmsys->regs + addr);
> +       }

This is technically correct, but I'm afraid this may become and issue
later if we have another function like ovl_mout_en.

So maybe it's better to do:
if (funcs->ovl_mout_en) {
  value = funcs->ovl_mout_en(cur, next, &addr);
  ...
}

Or another option: Create a new function
static unsigned int mtk_mmsys_ovl_mout_en(...) {
   if (!funcs->ovl_mout_en)
      return 0;
}

and call that, following the same pattern as
mtk_mmsys_ddp_mout_en/mtk_mmsys_ddp_sel_in?

>  }
>  EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_connect);
>
> @@ -103,6 +112,15 @@ void mtk_mmsys_ddp_disconnect(struct device *dev,
>                 reg = readl_relaxed(mmsys->regs + addr) & ~value;
>                 writel_relaxed(reg, mmsys->regs + addr);
>         }
> +
> +       if (!funcs->ovl_mout_en)
> +               return;
> +
> +       value = funcs->ovl_mout_en(cur, next, &addr);
> +       if (value) {
> +               reg = readl_relaxed(mmsys->regs + addr) & ~value;
> +               writel_relaxed(reg, mmsys->regs + addr);
> +       }
>  }
>  EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_disconnect);
>
> diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
> index aa4f60e..220203d 100644
> --- a/include/linux/soc/mediatek/mtk-mmsys.h
> +++ b/include/linux/soc/mediatek/mtk-mmsys.h
> @@ -49,6 +49,9 @@ struct mtk_mmsys_conn_funcs {
>         u32 (*mout_en)(enum mtk_ddp_comp_id cur,
>                        enum mtk_ddp_comp_id next,
>                        unsigned int *addr);
> +       u32 (*ovl_mout_en)(enum mtk_ddp_comp_id cur,
> +                          enum mtk_ddp_comp_id next,
> +                          unsigned int *addr);
>         u32 (*sel_in)(enum mtk_ddp_comp_id cur,
>                       enum mtk_ddp_comp_id next,
>                       unsigned int *addr);
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
