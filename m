Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 920F553B6B7
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 12:15:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C763112D57;
	Thu,  2 Jun 2022 10:15:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D670112D85
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 10:15:05 +0000 (UTC)
Received: by mail-qk1-x729.google.com with SMTP id m68so3287095qkb.9
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 03:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fOHitFVtUhQxQeGoTHoG0OzFq0ZzrGiczbq+UxLc2qw=;
 b=JWryxprqeUxNU1XZR95MlHVGT7qDBnT1Ot3ZVtcYjVhIAQGizQ4cLaxHFqn92wHQdR
 eA3+lrQlnmvH3tLvzz3gKCMHBYSa0XUYOP1v8m+fWNANYgzmckyp9Xgiy5aVFbX47zIq
 x6NRqvlWDNLibNbKuwKmcZ4ofxZlW7tP0VnbmlDx30GfjrZgQkSNKNokN8lEYLyqdrk8
 kStDk6tMe5YgSu0FwDg7iUFg7VejnB9qXCKwXo132VZs4XqeSjyNnkD4k4Gyw0fR4SD+
 qdOg+UWMF+y75RBbC5BTWTgwaoELK0hVrRkyr1Tw8oFOFOFNXFkr22r0yeNj2rKXoSw9
 vO8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fOHitFVtUhQxQeGoTHoG0OzFq0ZzrGiczbq+UxLc2qw=;
 b=C6LCwsZw4szwEsybvncN4Qlb1Zwk8CJ14wvU4LramCkOTmeAHx1jxIZjbh66VchxLY
 TT+rLBwk8CRPITVG15sR6vHaGmq2DzcRR6ZEuEoXHXys8b6CgPtyhDVvBPIN7CNmHVav
 rH0+ztXsgHfCr5k2m2uZkaxBHGDt9oP7c9AKC0JN3IYY4a1prfWzGoKc9ED6M4/IkRTN
 D0hwN5hpFyv/aMtA0QB/cSH7oZmNaIIZhgqo6vnF61eQa19QM4puBwtUmDmvMR1xqinZ
 BSNGV1nuqVRjI4oZa94gCfuRNBNGXBvt396k5/y4w3Si6maWH9GGLAgylfVLG0Vpt8uH
 fcHQ==
X-Gm-Message-State: AOAM530FhXwQzazxch1b8CMSSKJsvRaLkmu10YTFWsIz7RiSwYnkFX73
 KvxxmRpcsG8gwLm4kEL+k7QROdl3XH56POOE+DAXMA==
X-Google-Smtp-Source: ABdhPJw2bRmHzQbnAYbZakDLi24fc4qCFs5O5K0MkvKDsfdY7N70JVb+c0+aHohWoM0U4fwyizCr+zLCSn4np4A52Z4=
X-Received: by 2002:a05:620a:2a06:b0:6a5:b090:65c0 with SMTP id
 o6-20020a05620a2a0600b006a5b09065c0mr2438054qkp.593.1654164904535; Thu, 02
 Jun 2022 03:15:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220601220747.1145095-1-marijn.suijten@somainline.org>
 <20220601220747.1145095-2-marijn.suijten@somainline.org>
In-Reply-To: <20220601220747.1145095-2-marijn.suijten@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 2 Jun 2022 13:14:53 +0300
Message-ID: <CAA8EJprRhoE+MMWSx69O+s=Zvoq=HKtaoe7xx+kCmtZas1woCw@mail.gmail.com>
Subject: Re: [PATCH v2 01/11] clk: divider: Introduce
 devm_clk_hw_register_divider_parent_hw()
To: Marijn Suijten <marijn.suijten@somainline.org>
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
Cc: David Airlie <airlied@linux.ie>,
 Michael Turquette <mturquette@baylibre.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, dri-devel@lists.freedesktop.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 phone-devel@vger.kernel.org, linux-clk@vger.kernel.org,
 Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Rajeev Nandan <quic_rajeevny@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Stephen Boyd <sboyd@kernel.org>, Vladimir Lypak <vladimir.lypak@gmail.com>,
 linux-kernel@vger.kernel.org, Jami Kettunen <jami.kettunen@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 2 Jun 2022 at 01:07, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> Add the devres variant of clk_hw_register_divider_parent_hw() for
> registering a divider clock with clk_hw parent pointer instead of parent
> name.
>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  include/linux/clk-provider.h | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> index c10dc4c659e2..4e07621849e6 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -831,6 +831,25 @@ struct clk *clk_register_divider_table(struct device *dev, const char *name,
>         __devm_clk_hw_register_divider((dev), NULL, (name), (parent_name), NULL,   \
>                                   NULL, (flags), (reg), (shift), (width),     \
>                                   (clk_divider_flags), NULL, (lock))
> +/**
> + * devm_clk_hw_register_divider_parent_hw - register a divider clock with the clock framework
> + * @dev: device registering this clock
> + * @name: name of this clock
> + * @parent_hw: pointer to parent clk
> + * @flags: framework-specific flags
> + * @reg: register address to adjust divider
> + * @shift: number of bits to shift the bitfield
> + * @width: width of the bitfield
> + * @clk_divider_flags: divider-specific flags for this clock
> + * @lock: shared register lock for this clock
> + */
> +#define devm_clk_hw_register_divider_parent_hw(dev, name, parent_hw, flags,   \
> +                                              reg, shift, width,             \
> +                                              clk_divider_flags, lock)       \
> +       __devm_clk_hw_register_divider((dev), NULL, (name), NULL,             \
> +                                      (parent_hw), NULL, (flags), (reg),     \
> +                                      (shift), (width), (clk_divider_flags), \
> +                                      NULL, (lock))
>  /**
>   * devm_clk_hw_register_divider_table - register a table based divider clock
>   * with the clock framework (devres variant)
> --
> 2.36.1
>


-- 
With best wishes
Dmitry
