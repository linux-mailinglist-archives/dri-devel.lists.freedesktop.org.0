Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B69645DD0
	for <lists+dri-devel@lfdr.de>; Wed,  7 Dec 2022 16:46:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF16810E3D0;
	Wed,  7 Dec 2022 15:46:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C30E910E3D0
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Dec 2022 15:46:11 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id 65so5134035pfx.9
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Dec 2022 07:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UfOHvK7ecYIuUe0s4A5xd+Shfnx26W2C73pfnXWOFPw=;
 b=iT5h2rMguX+IY5q8yLBNZmN/99vOp91cbgceJR1iIMkvim2gs5WBUbHDUfjpuyh0H+
 uzXwjjS7uqH45oKea6deOwTqj2zlfFWOhsQTwYzT8WxQ5cjhPChGJQd8t0UwQN66xUN7
 QV8nuyqydi5raOny0PZCpMlfZ9XQE2IwcZbnWzNskDHsPkKwnTPS7Me3nnP12TY9m6NO
 dbGAJGkjQzuRtXz0Y0XZEaim3vlqvfbkbQRK+SzWOZIrqR0SDFTGlByFU4ILTSI0DFwJ
 LGPPpy3VjocWPnrf7+O1+gA2pUvdbEP0tSuWlI3kBXgvvMEYfcTSO1aYrXgmfBI+ra3q
 nAMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UfOHvK7ecYIuUe0s4A5xd+Shfnx26W2C73pfnXWOFPw=;
 b=yf9BwJfDkqbqkiBlSX70LLF2VOa7eDPu/nFKIM/VNCm6q9OqFXYt38NFJ1W3G6YzKe
 pEfQ3WiW2m20Yn0pYeScXt7mK6DfcDdc5Kb1alKK1S4pumyHqMt+ELzwUwzZ7+B34ss9
 FconZtG6G4vr8MRC4PFHCQKRji0kDlSGbR9EI8DoUAaZc+kk9UpXImk1yVwrKM74ugo4
 WJTON1UmrWSDRWLECqkvlUb3l4Kn2wTucAPkuaZ2VdsXQIZw+AjpRDk014goPxiJLJiN
 QhP0vlTatcDqHTyL1o3j6cT/PnlChsrL6VCSs7cnJ/Eyh1S1em3s1WYd36oob0rZD31k
 /jbQ==
X-Gm-Message-State: ANoB5plpf8FANjFHegt3U/stKlznA7uAXgNnX8fc+aUQ3cXXgiyj/vrP
 SAa6Wsuli/CrBHARDKEoupV0QsLH3JnI2ek+XXAXWQ==
X-Google-Smtp-Source: AA0mqf4loW0n0K8rBmh1RZRv2mZ9kBVaPS0r1AUXAFFSQCa/AbskGM6a4jYQ6OSdRF3Zfxqatvnkl5J1s9WWGmB6Y1o=
X-Received: by 2002:aa7:951d:0:b0:577:3e5e:7a4 with SMTP id
 b29-20020aa7951d000000b005773e5e07a4mr8405149pfp.57.1670427970858; Wed, 07
 Dec 2022 07:46:10 -0800 (PST)
MIME-Version: 1.0
References: <1664960824-20951-1-git-send-email-quic_akhilpo@quicinc.com>
 <20221005143618.v7.3.I162c4be55f230cd439f0643f1624527bdc8a9831@changeid>
In-Reply-To: <20221005143618.v7.3.I162c4be55f230cd439f0643f1624527bdc8a9831@changeid>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 7 Dec 2022 16:45:34 +0100
Message-ID: <CAPDyKFpMUQo-Q2sbm3YXPeagt88zsRFWgc06GmNm0TVUPmPY_g@mail.gmail.com>
Subject: Re: [PATCH v7 3/6] clk: qcom: gdsc: Add a reset op to poll gdsc
 collapse
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
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
Cc: linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, krzysztof.kozlowski@linaro.org,
 Andy Gross <agross@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 5 Oct 2022 at 11:08, Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>
> Add a reset op compatible function to poll for gdsc collapse. This is
> required because:
>   1. We don't wait for it to turn OFF at hardware for VOTABLE GDSCs.
>   2. There is no way for client drivers (eg. gpu driver) to do
>   put-with-wait for these gdscs which is required in some scenarios
>   (eg. GPU recovery).

What puzzles me a bit, who is the typical consumer of the reset.

I looked at patch4 and tried to figure it out, but let's discuss that
in that thread instead. Some more comments, see below.

>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>
> Changes in v7:
> - Update commit message (Bjorn)
>
> Changes in v2:
> - Minor update to function prototype
>
>  drivers/clk/qcom/gdsc.c | 23 +++++++++++++++++++----
>  drivers/clk/qcom/gdsc.h |  7 +++++++
>  2 files changed, 26 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
> index 7cf5e13..ccef742 100644
> --- a/drivers/clk/qcom/gdsc.c
> +++ b/drivers/clk/qcom/gdsc.c
> @@ -17,6 +17,7 @@
>  #include <linux/reset-controller.h>
>  #include <linux/slab.h>
>  #include "gdsc.h"
> +#include "reset.h"
>
>  #define PWR_ON_MASK            BIT(31)
>  #define EN_REST_WAIT_MASK      GENMASK_ULL(23, 20)
> @@ -116,7 +117,8 @@ static int gdsc_hwctrl(struct gdsc *sc, bool en)
>         return regmap_update_bits(sc->regmap, sc->gdscr, HW_CONTROL_MASK, val);
>  }
>
> -static int gdsc_poll_status(struct gdsc *sc, enum gdsc_status status)
> +static int gdsc_poll_status(struct gdsc *sc, enum gdsc_status status,
> +               s64 timeout_us, unsigned int interval_ms)
>  {
>         ktime_t start;
>
> @@ -124,7 +126,9 @@ static int gdsc_poll_status(struct gdsc *sc, enum gdsc_status status)
>         do {
>                 if (gdsc_check_status(sc, status))
>                         return 0;
> -       } while (ktime_us_delta(ktime_get(), start) < TIMEOUT_US);
> +               if (interval_ms)
> +                       msleep(interval_ms);
> +       } while (ktime_us_delta(ktime_get(), start) < timeout_us);

Rather than continue to open code this polling loop, would it not make
sense to convert the code into using readx_poll_timeout() (or some of
its friends).

Down the road, this leads to that the msleep() above should become
usleep_range() instead, which seems more correct to me.

>
>         if (gdsc_check_status(sc, status))
>                 return 0;
> @@ -189,7 +193,7 @@ static int gdsc_toggle_logic(struct gdsc *sc, enum gdsc_status status)
>                 udelay(1);
>         }
>
> -       ret = gdsc_poll_status(sc, status);
> +       ret = gdsc_poll_status(sc, status, TIMEOUT_US, 0);
>         WARN(ret, "%s status stuck at 'o%s'", sc->pd.name, status ? "ff" : "n");
>
>         if (!ret && status == GDSC_OFF && sc->rsupply) {
> @@ -360,7 +364,7 @@ static int _gdsc_disable(struct gdsc *sc)
>                  */
>                 udelay(1);
>
> -               ret = gdsc_poll_status(sc, GDSC_ON);
> +               ret = gdsc_poll_status(sc, GDSC_ON, TIMEOUT_US, 0);
>                 if (ret)
>                         return ret;
>         }
> @@ -608,3 +612,14 @@ int gdsc_gx_do_nothing_enable(struct generic_pm_domain *domain)
>         return 0;
>  }
>  EXPORT_SYMBOL_GPL(gdsc_gx_do_nothing_enable);
> +
> +int gdsc_wait_for_collapse(void *priv)
> +{
> +       struct gdsc *sc = priv;
> +       int ret;
> +
> +       ret = gdsc_poll_status(sc, GDSC_OFF, 500000, 5);
> +       WARN(ret, "%s status stuck at 'on'", sc->pd.name);
> +       return ret;
> +}
> +EXPORT_SYMBOL_GPL(gdsc_wait_for_collapse);
> diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
> index 981a12c..5395f69 100644
> --- a/drivers/clk/qcom/gdsc.h
> +++ b/drivers/clk/qcom/gdsc.h
> @@ -12,6 +12,7 @@
>  struct regmap;
>  struct regulator;
>  struct reset_controller_dev;
> +struct qcom_reset_map;
>
>  /**
>   * struct gdsc - Globally Distributed Switch Controller
> @@ -88,6 +89,7 @@ int gdsc_register(struct gdsc_desc *desc, struct reset_controller_dev *,
>                   struct regmap *);
>  void gdsc_unregister(struct gdsc_desc *desc);
>  int gdsc_gx_do_nothing_enable(struct generic_pm_domain *domain);
> +int gdsc_wait_for_collapse(void *priv);
>  #else
>  static inline int gdsc_register(struct gdsc_desc *desc,
>                                 struct reset_controller_dev *rcdev,
> @@ -97,5 +99,10 @@ static inline int gdsc_register(struct gdsc_desc *desc,
>  }
>
>  static inline void gdsc_unregister(struct gdsc_desc *desc) {};
> +
> +static int gdsc_wait_for_collapse(void *priv)
> +{
> +       return  -ENOSYS;
> +}
>  #endif /* CONFIG_QCOM_GDSC */
>  #endif /* __QCOM_GDSC_H__ */

Kind regards
Uffe
