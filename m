Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7201F53B6DF
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 12:20:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C110112D67;
	Thu,  2 Jun 2022 10:20:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com
 [IPv6:2607:f8b0:4864:20::f35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DCB6112D67
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 10:20:31 +0000 (UTC)
Received: by mail-qv1-xf35.google.com with SMTP id i19so3220525qvu.13
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 03:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7xoHOj1xulzu3SD29GS2YKQ7gqDLAbM1bPx44xbkClg=;
 b=DSUMru50+KeenCQPQGfny1v3Ey5MgeseAd9dW+EgqLIhT5Gun0C2qi5V6HvzJ5dfK5
 9oH3esl6la/adwnvP6zQTXAtyI6MeB5Vn3s4G9c7nfdnvmZU68JdsXs9eSrgfZN0ARmr
 OH4fJBOSBRFdAoQUTC0UmFlnZdJeWfANDij0q8ZYbmsIjvCYD37WNd6KvnWCjQg1Pcmm
 yQzaVJUapywWsiOmrpKJKcU3NmpijxcNaQfuPopeCPySTuVY/EP8jp4kJP3frZm4sYID
 wyF6YnL3J4kBLP8rFV9NzS+iiQmy/DR3I5kP+NpDI82a5eisygvFLfkpj5YCyOMUSffL
 mvEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7xoHOj1xulzu3SD29GS2YKQ7gqDLAbM1bPx44xbkClg=;
 b=ikB39wh1cbyMIw8kZb1jJogFv9eYE8sVXaGgttB+L4jIPfPhwmncQU7ckn6+aRuXBw
 hIqWL/JWQCwrz+7QX5nj+zr+uelrcydEcW4PX7RyJhanA3gK81C+KlReHfefJlZu9GJN
 MVo+TUapaerniudT8fyt1NicxoUEJzW1PTu1W79jPc/YzwEeqsZ1zYVNamUC/P3U2yHx
 0DeyYz1gmPiSJ94QxdqO+DjNajFuQWjl5G1VXmGrUsD6M/RPkjuyuFyw1KlSDacm+5Hs
 AZIY680u0Mt2+HRM59vN71b3XG77scWsAHOd4rXKa473y22+m4EU7VlJ7bWim9UTCiUj
 WtJA==
X-Gm-Message-State: AOAM532hjz28nkxD8cYPUCy6QNlss0R9G+efjAyXMYsAC2qRnPLWdILO
 zAOq6zDCRFO6SIl93uLBVr/Jnc+geBkaJw7SZSZehw==
X-Google-Smtp-Source: ABdhPJw1Rch5C49/vloTHmi2dY/GNe+3O0wK53nKBS9fZMA13PpgfQcEMtkcYegIIDx2qb2wp1k+tGsQ77F5VsPPLIo=
X-Received: by 2002:ad4:5aa4:0:b0:465:2b11:cfd with SMTP id
 u4-20020ad45aa4000000b004652b110cfdmr5204455qvg.55.1654165230535; Thu, 02 Jun
 2022 03:20:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220601220747.1145095-1-marijn.suijten@somainline.org>
 <20220601220747.1145095-4-marijn.suijten@somainline.org>
In-Reply-To: <20220601220747.1145095-4-marijn.suijten@somainline.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 2 Jun 2022 13:20:19 +0300
Message-ID: <CAA8EJpomtbN0+ocD2pRbkYriUY4D9OnjgoFzL9qNHhPm3Uz5cQ@mail.gmail.com>
Subject: Re: [PATCH v2 03/11] clk: fixed-factor: Introduce
 *clk_hw_register_fixed_factor_parent_hw()
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
> Add the devres and non-devres variant of
> clk_hw_register_fixed_factor_parent_hw() for registering a fixed factor
> clock with clk_hw parent pointer instead of parent name.
>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>

Two minor comments below. It's up to Stephen to check if they are
correct or not.

> ---
>  drivers/clk/clk-fixed-factor.c | 57 ++++++++++++++++++++++++++++------
>  include/linux/clk-provider.h   |  8 +++++
>  2 files changed, 55 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/clk/clk-fixed-factor.c b/drivers/clk/clk-fixed-factor.c
> index 54942d758ee6..fabb98d0cdb2 100644
> --- a/drivers/clk/clk-fixed-factor.c
> +++ b/drivers/clk/clk-fixed-factor.c
> @@ -78,7 +78,8 @@ static void devm_clk_hw_register_fixed_factor_release(struct device *dev, void *
>
>  static struct clk_hw *
>  __clk_hw_register_fixed_factor(struct device *dev, struct device_node *np,
> -               const char *name, const char *parent_name, int index,
> +               const char *name, const char *parent_name,
> +               const struct clk_hw *parent_hw, int index,
>                 unsigned long flags, unsigned int mult, unsigned int div,
>                 bool devm)
>  {
> @@ -108,7 +109,9 @@ __clk_hw_register_fixed_factor(struct device *dev, struct device_node *np,
>         init.name = name;
>         init.ops = &clk_fixed_factor_ops;
>         init.flags = flags;
> -       if (parent_name)
> +       if (parent_hw)
> +               init.parent_hws = &parent_hw;
> +       else if (parent_name)
>                 init.parent_names = &parent_name;

If you change the order of if clauses, you won't have to introduce
unnecessary changes.

>         else
>                 init.parent_data = &pdata;
> @@ -148,17 +151,50 @@ struct clk_hw *devm_clk_hw_register_fixed_factor_index(struct device *dev,
>                 const char *name, unsigned int index, unsigned long flags,
>                 unsigned int mult, unsigned int div)
>  {
> -       return __clk_hw_register_fixed_factor(dev, NULL, name, NULL, index,
> -                                             flags, mult, div, true);
> +       return __clk_hw_register_fixed_factor(dev, NULL, name, NULL, NULL,
> +                                             index, flags, mult, div, true);

Here (and several times later) you are inserting an argument and then
moving arguments to the next line. My slight preference would be to
just insert the arg (and maybe break the line if it gets too long) w/o
touching the next lines.

>  }
>  EXPORT_SYMBOL_GPL(devm_clk_hw_register_fixed_factor_index);
>
> +/**
> + * devm_clk_hw_register_fixed_factor_parent_hw - Register a fixed factor clock with
> + * pointer to parent clock
> + * @dev: device that is registering this clock
> + * @name: name of this clock
> + * @parent_hw: pointer to parent clk
> + * @flags: fixed factor flags
> + * @mult: multiplier
> + * @div: divider
> + *
> + * Return: Pointer to fixed factor clk_hw structure that was registered or
> + * an error pointer.
> + */
> +struct clk_hw *devm_clk_hw_register_fixed_factor_parent_hw(struct device *dev,
> +               const char *name, const struct clk_hw *parent_hw,
> +               unsigned long flags, unsigned int mult, unsigned int div)
> +{
> +       return __clk_hw_register_fixed_factor(dev, NULL, name, NULL, parent_hw,
> +                                             -1, flags, mult, div, true);
> +}
> +EXPORT_SYMBOL_GPL(devm_clk_hw_register_fixed_factor_parent_hw);
> +
> +struct clk_hw *clk_hw_register_fixed_factor_parent_hw(struct device *dev,
> +               const char *name, const struct clk_hw *parent_hw,
> +               unsigned long flags, unsigned int mult, unsigned int div)
> +{
> +       return __clk_hw_register_fixed_factor(dev, NULL, name, NULL,
> +                                             parent_hw, -1, flags, mult, div,
> +                                             false);
> +}
> +EXPORT_SYMBOL_GPL(clk_hw_register_fixed_factor_parent_hw);
> +
>  struct clk_hw *clk_hw_register_fixed_factor(struct device *dev,
>                 const char *name, const char *parent_name, unsigned long flags,
>                 unsigned int mult, unsigned int div)
>  {
> -       return __clk_hw_register_fixed_factor(dev, NULL, name, parent_name, -1,
> -                                             flags, mult, div, false);
> +       return __clk_hw_register_fixed_factor(dev, NULL, name, parent_name,
> +                                             NULL, -1, flags, mult, div,
> +                                             false);
>  }
>  EXPORT_SYMBOL_GPL(clk_hw_register_fixed_factor);
>
> @@ -204,8 +240,9 @@ struct clk_hw *devm_clk_hw_register_fixed_factor(struct device *dev,
>                 const char *name, const char *parent_name, unsigned long flags,
>                 unsigned int mult, unsigned int div)
>  {
> -       return __clk_hw_register_fixed_factor(dev, NULL, name, parent_name, -1,
> -                       flags, mult, div, true);
> +       return __clk_hw_register_fixed_factor(dev, NULL, name, parent_name,
> +                                             NULL, -1, flags, mult, div,
> +                                             true);
>  }
>  EXPORT_SYMBOL_GPL(devm_clk_hw_register_fixed_factor);
>
> @@ -240,8 +277,8 @@ static struct clk_hw *_of_fixed_factor_clk_setup(struct device_node *node)
>         if (of_match_node(set_rate_parent_matches, node))
>                 flags |= CLK_SET_RATE_PARENT;
>
> -       hw = __clk_hw_register_fixed_factor(NULL, node, clk_name, NULL, 0,
> -                                           flags, mult, div, false);
> +       hw = __clk_hw_register_fixed_factor(NULL, node, clk_name, NULL, NULL,
> +                                           0, flags, mult, div, false);
>         if (IS_ERR(hw)) {
>                 /*
>                  * Clear OF_POPULATED flag so that clock registration can be
> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> index 316c7e082934..94458cb669f0 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -1032,6 +1032,14 @@ struct clk_hw *devm_clk_hw_register_fixed_factor(struct device *dev,
>  struct clk_hw *devm_clk_hw_register_fixed_factor_index(struct device *dev,
>                 const char *name, unsigned int index, unsigned long flags,
>                 unsigned int mult, unsigned int div);
> +
> +struct clk_hw *devm_clk_hw_register_fixed_factor_parent_hw(struct device *dev,
> +               const char *name, const struct clk_hw *parent_hw,
> +               unsigned long flags, unsigned int mult, unsigned int div);
> +
> +struct clk_hw *clk_hw_register_fixed_factor_parent_hw(struct device *dev,
> +               const char *name, const struct clk_hw *parent_hw,
> +               unsigned long flags, unsigned int mult, unsigned int div);
>  /**
>   * struct clk_fractional_divider - adjustable fractional divider clock
>   *
> --
> 2.36.1
>


-- 
With best wishes
Dmitry
