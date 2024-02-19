Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6ED85A67A
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 15:53:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F17510E354;
	Mon, 19 Feb 2024 14:53:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="orJaLeh9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
 [209.85.219.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 595C610E364
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 14:53:47 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id
 3f1490d57ef6-dcdb210cb6aso4902670276.2
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 06:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708354426; x=1708959226; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uHNd0ZyJA4gTbxBaC9YDXwkG/RiI5KMLPKGCG7+Wzlo=;
 b=orJaLeh94m/pIABPYgOI3SSWiVu0EqXzdUVQ0VGBWxGlqUXjyokFYwuUFxtw0YELqV
 62Qg1EWggQnba49EFI6MAThn5MC9EMXn8W1DsEbg0gZUG4AFCYwz778t0BqCYYrLe7fQ
 MzO8jwqRnlw4REwwgJXQAjyeBA8XalTvVT2iOW68qKuO1LyTcXipizveL6KqN5+p/Cvo
 yOmIrLtgBw+4j/bjjW292UPgRrKY42pmXkNz8BUoYJQ2DdLz6xKMXsmxKgpb14QKk+sc
 XKUXiDi1Xkkgvd9o5/5qgGNV+UIlgaLGiQ+t//kzqN+n9GRmbr7Wb5uaoGH1r8nRhRAc
 rccg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708354426; x=1708959226;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uHNd0ZyJA4gTbxBaC9YDXwkG/RiI5KMLPKGCG7+Wzlo=;
 b=NZm0NpL3F8LJj4611C0KTY0DXGrCWlh5c8hlySut5iFOHIqoij3Q4EMQbge4mVE5px
 fTXTzUUe+0EFr+wzccuZXlGwhh38LS90tk7VKLT2mPNJHmtP0ebfFcY0o88f88YLEe6r
 ZxJOGODZ4mSrRAHklF0/MgsQohe/hg9VgI0S1o8e45Tet3NTv9RaTZL41JgvEpZ2J+fl
 iYWlS+/Sr3WO6tL4ITnakyCq2q1D0y7goKv5pyPSNRK9lxSFB+nv86D0mpmAoXJpVIHT
 /8ba9cHdS5GZ+yI+LUx149+iukfmzhLaBtrlpkOqva83xsThCS65Pt2Usv5nN1Ok3k4/
 Uxng==
X-Forwarded-Encrypted: i=1;
 AJvYcCWe01vxbF1jSrIR14aAvae9H6bO4odhgxylbWSE6mxHrgCc3uxTJoazCsqju2NDIDmLeZnH+HtfaqAJcUZnrPqnbEFvBFza7FwP2d/guZpt
X-Gm-Message-State: AOJu0Yy38qFzwgGMIS268e70wUQFQCGxVEmWyVcqK4WqL6q8BcCu/Jwp
 8TJL4Zee+LLTZnjWk8nJ6YEfqQYxNZIm90Cqqqgk63CHZAKn3Nn2tLA5ewbgGuCjyD1pNoSKcd0
 9apdKQXllMabQXKYYmA4N8Yx+xB8Tvm56VrCURw==
X-Google-Smtp-Source: AGHT+IHY/le6C7LNc0DIav/5O65P9EcFeh1YIyPzIjc+EV5s2EcaI1Ea6U5pWMuSdfWLBVIgW0qC8w2mR4a/yKRxOBo=
X-Received: by 2002:a81:5287:0:b0:607:9d63:f5f5 with SMTP id
 g129-20020a815287000000b006079d63f5f5mr12422677ywb.12.1708354426245; Mon, 19
 Feb 2024 06:53:46 -0800 (PST)
MIME-Version: 1.0
References: <20240219-topic-rb1_gpu-v1-0-d260fa854707@linaro.org>
 <20240219-topic-rb1_gpu-v1-3-d260fa854707@linaro.org>
In-Reply-To: <20240219-topic-rb1_gpu-v1-3-d260fa854707@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 19 Feb 2024 16:53:35 +0200
Message-ID: <CAA8EJpq8XvQm9B3RZq9PNMqA5VAqKUyVn5qt8-WEYMQMWniDZA@mail.gmail.com>
Subject: Re: [PATCH 3/8] clk: qcom: clk-alpha-pll: Add HUAYRA_2290 support
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
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

On Mon, 19 Feb 2024 at 15:36, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> Commit 134b55b7e19f ("clk: qcom: support Huayra type Alpha PLL")
> introduced an entry to the alpha offsets array, but diving into QCM2290
> downstream and some documentation, it turned out that the name Huayra
> apparently has been used quite liberally across many chips, even with
> noticeably different hardware.
>
> Introduce another set of offsets and a new configure function for the
> Huayra PLL found on QCM2290. This is required e.g. for the consumers
> of GPUCC_PLL0 to properly start.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 45 ++++++++++++++++++++++++++++++++++++++++
>  drivers/clk/qcom/clk-alpha-pll.h |  3 +++
>  2 files changed, 48 insertions(+)
>
> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
> index 8a412ef47e16..61b5abd13782 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.c
> +++ b/drivers/clk/qcom/clk-alpha-pll.c
> @@ -244,6 +244,19 @@ const u8 clk_alpha_pll_regs[][PLL_OFF_MAX_REGS] = {
>                 [PLL_OFF_OPMODE] = 0x30,
>                 [PLL_OFF_STATUS] = 0x3c,
>         },
> +       [CLK_ALPHA_PLL_TYPE_HUAYRA_2290] =  {
> +               [PLL_OFF_L_VAL] = 0x04,
> +               [PLL_OFF_ALPHA_VAL] = 0x08,
> +               [PLL_OFF_USER_CTL] = 0x0c,
> +               [PLL_OFF_CONFIG_CTL] = 0x10,
> +               [PLL_OFF_CONFIG_CTL_U] = 0x14,
> +               [PLL_OFF_CONFIG_CTL_U1] = 0x18,
> +               [PLL_OFF_TEST_CTL] = 0x1c,
> +               [PLL_OFF_TEST_CTL_U] = 0x20,
> +               [PLL_OFF_TEST_CTL_U1] = 0x24,
> +               [PLL_OFF_OPMODE] = 0x28,
> +               [PLL_OFF_STATUS] = 0x38,
> +       },

Can you please move them next to the standard huayra PLL regs?

>  };
>  EXPORT_SYMBOL_GPL(clk_alpha_pll_regs);
>
> @@ -779,6 +792,38 @@ static long clk_alpha_pll_round_rate(struct clk_hw *hw, unsigned long rate,
>         return clamp(rate, min_freq, max_freq);
>  }
>
> +void clk_huayra_2290_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
> +                                  const struct alpha_pll_config *config)
> +{
> +       clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL(pll), config->config_ctl_val);
> +       clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL_U(pll), config->config_ctl_hi_val);
> +       clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL_U1(pll), config->config_ctl_hi1_val);
> +       clk_alpha_pll_write_config(regmap, PLL_TEST_CTL(pll), config->test_ctl_val);
> +       clk_alpha_pll_write_config(regmap, PLL_TEST_CTL_U(pll), config->test_ctl_hi_val);
> +       clk_alpha_pll_write_config(regmap, PLL_TEST_CTL_U1(pll), config->test_ctl_hi1_val);
> +       clk_alpha_pll_write_config(regmap, PLL_L_VAL(pll), config->l);
> +       clk_alpha_pll_write_config(regmap, PLL_ALPHA_VAL(pll), config->alpha);
> +       clk_alpha_pll_write_config(regmap, PLL_USER_CTL(pll), config->user_ctl_val);
> +
> +       /* Set PLL_BYPASSNL */
> +       regmap_update_bits(regmap, PLL_MODE(pll), PLL_BYPASSNL, PLL_BYPASSNL);
> +
> +       /* Wait 5 us between setting BYPASS and deasserting reset */
> +       mb();
> +       udelay(5);
> +
> +       /* Take PLL out from reset state */
> +       regmap_update_bits(regmap, PLL_MODE(pll), PLL_RESET_N, PLL_RESET_N);
> +
> +       /* Wait 50us for PLL_LOCK_DET bit to go high */
> +       mb();
> +       usleep_range(50, 55);
> +
> +       /* Enable PLL output */
> +       regmap_update_bits(regmap, PLL_MODE(pll), PLL_OUTCTRL, PLL_OUTCTRL);
> +}
> +EXPORT_SYMBOL(clk_huayra_2290_pll_configure);
> +
>  static unsigned long
>  alpha_huayra_pll_calc_rate(u64 prate, u32 l, u32 a)
>  {
> diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
> index fb6d50263bb9..91d3d6f19eae 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.h
> +++ b/drivers/clk/qcom/clk-alpha-pll.h
> @@ -29,6 +29,7 @@ enum {
>         CLK_ALPHA_PLL_TYPE_BRAMMO_EVO,
>         CLK_ALPHA_PLL_TYPE_STROMER,
>         CLK_ALPHA_PLL_TYPE_STROMER_PLUS,
> +       CLK_ALPHA_PLL_TYPE_HUAYRA_2290,

Also next to standard huayra PLL, please.

>         CLK_ALPHA_PLL_TYPE_MAX,
>  };
>
> @@ -191,6 +192,8 @@ extern const struct clk_ops clk_alpha_pll_rivian_evo_ops;
>
>  void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
>                              const struct alpha_pll_config *config);
> +void clk_huayra_2290_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
> +                                  const struct alpha_pll_config *config);
>  void clk_fabia_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
>                                 const struct alpha_pll_config *config);
>  void clk_trion_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
>
> --
> 2.43.2
>


-- 
With best wishes
Dmitry
