Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2DB72B8A3
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 09:30:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B33110E164;
	Mon, 12 Jun 2023 07:30:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F313B10E1E4;
 Mon, 12 Jun 2023 05:04:18 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id
 5614622812f47-39c4c3da9cbso2039162b6e.2; 
 Sun, 11 Jun 2023 22:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686546258; x=1689138258;
 h=cc:to:subject:message-id:date:from:references:in-reply-to
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yXejNWihH1cSvRvqLdsiZooKU8TxJgF5T4F4Xvbxnsk=;
 b=MuHiDOyfBffaPSQrCja2twO0/NpQMD6m6Z8x/Ba1rzTBGIGHZWsrFsxDWlwErvBkSB
 /j3/mtQ2nuAw7yuv0apHEy8gtBvpmZbrPiIg3hXjlJfYKSuUrAFBBHw44H2KDRwgBR7I
 VCtpRThYe5ZtaX4AqV4MCV/XqkO8jM3m766yB9mqZJ9TBhBIAJILTIf9LRDUc7I9UNYc
 0uHZOFxOwsGa9K4kPQ2nkNhZefz1ipF/FAS/DKFfNMP63m3wx0omxMK9yRLSaHDSPmrN
 3s1/qd8jsBulhIrenylmMkmwgeuGqKHS0f7TsI5QWvGGVKZ5YESZAs3JSNx51RmdVulo
 GjiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686546258; x=1689138258;
 h=cc:to:subject:message-id:date:from:references:in-reply-to
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yXejNWihH1cSvRvqLdsiZooKU8TxJgF5T4F4Xvbxnsk=;
 b=SSZYpI14v0Mvh6AdI9/scxBf7LmrMM79CuQnCQdx8gygYKRMS4U6UeraOBJaYt+Iw9
 Ou123iQBrNd6MHFWfm8SasmgXbJgqBrdRLA6Y0iRljTjBEbJYAIYxvHLaO7dpq58K7Af
 o4R9oKl2/Gj7XowjSGk6qkibrO+SFbAWSUERmm75inYxhsZ46ULTM4/Uys/6UKlbh+wB
 lGaSOu5DSwGcpTueo4ETR0ATKQsaW82x6xCR385pY13jQEAqS4uUig613gBgxo+nwSfy
 qvQaHW7UW6K7Epl9UOqvOfTUqCxxi5rDMf9PTumpR8un03+oOOCOauJc6e6OxH1F9Yx/
 7rhA==
X-Gm-Message-State: AC+VfDxqjhsv4V1etgMs/0SLZGj9byUZ8F2RSxKO4W7YX2sppCa4uvTO
 poKzkYgL5Qqf0IzS3AfO4V8CBYrnVJT5JLbjwHs=
X-Google-Smtp-Source: ACHHUZ6gx3tRtW3o5Eha/7tuZII/koptiVHdNUE7RCzzbT1tTbgQvBQPdIxZXaDEDxM9aFQ6gRCiV+nytoi2RYsmg7s=
X-Received: by 2002:a05:6808:2a4c:b0:396:1bf6:d781 with SMTP id
 fa12-20020a0568082a4c00b003961bf6d781mr3025099oib.6.1686546257862; Sun, 11
 Jun 2023 22:04:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7010:7d4d:b0:35e:bd26:c91f with HTTP; Sun, 11 Jun 2023
 22:04:17 -0700 (PDT)
In-Reply-To: <20230612031616.3620134-2-dmitry.baryshkov@linaro.org>
References: <20230612031616.3620134-1-dmitry.baryshkov@linaro.org>
 <20230612031616.3620134-2-dmitry.baryshkov@linaro.org>
From: Degdag Mohamed <degdagmohamed@gmail.com>
Date: Mon, 12 Jun 2023 06:04:17 +0100
Message-ID: <CAEhjvduE+iMzzyC2Bex9C5=ueXE8NSZ6oGywRtAJv7gzyvbukw@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/msm/dsi: don't allow enabling 7nm VCO with
 unprogrammed rate
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 12 Jun 2023 07:30:29 +0000
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
Cc: freedreno@lists.freedesktop.org, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Dmitry Baryshkov],

Thank you for sharing the patches. I have reviewed and tested all
three patches, and they seem to be working correctly.

Tested-by: Degdag Mohamed degdagmohamed@gmail.com

Please let me know if you need any further information or assistance.

Best regards,
Degdag Mohamed

On 6/12/23, Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> CCF can try enabling VCO before the rate has been programmed. This can
> cause clock lockups and/or other boot issues. Program the VCO to the
> minimal PLL rate if the read rate is 0 Hz.
>
> Reported-by: Degdag Mohamed <degdagmohamed@gmail.com>
> Fixes: 1ef7c99d145c ("drm/msm/dsi: add support for 7nm DSI PHY/PLL")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> index 3b1ed02f644d..6979d35eb7c3 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
> @@ -395,11 +395,16 @@ static void dsi_pll_phy_dig_reset(struct dsi_pll_7nm
> *pll)
>  	wmb(); /* Ensure that the reset is deasserted */
>  }
>
> +static unsigned long dsi_pll_7nm_vco_recalc_rate(struct clk_hw *hw,
> +						  unsigned long parent_rate);
>  static int dsi_pll_7nm_vco_prepare(struct clk_hw *hw)
>  {
>  	struct dsi_pll_7nm *pll_7nm = to_pll_7nm(hw);
>  	int rc;
>
> +	if (dsi_pll_7nm_vco_recalc_rate(hw, VCO_REF_CLK_RATE) == 0)
> +		dsi_pll_7nm_vco_set_rate(hw, pll_7nm->phy->cfg->min_pll_rate,
> VCO_REF_CLK_RATE);
> +
>  	dsi_pll_enable_pll_bias(pll_7nm);
>  	if (pll_7nm->slave)
>  		dsi_pll_enable_pll_bias(pll_7nm->slave);
> --
> 2.39.2
>
>
