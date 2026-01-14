Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 480B3D1EF67
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 14:07:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E9C010E1F9;
	Wed, 14 Jan 2026 13:07:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 598ED10E1F9
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 13:07:00 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id
 46e09a7af769-7ce229972f1so7557459a34.3
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 05:07:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768396019; x=1769000819;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dOi1xuIgOKeNmhtu/zXsVbi5AW8T0pSjiAWSdoOenWg=;
 b=FmogsU4jY+vT9vOCFVxEXQE5krhyInnwtAV2zW/JiBqCLzBEHJbMZIQQXQsPx4H+HC
 R+hBhOG9uws21G1X26WYGxxNFScFk8bXHUvITGFAxhsuEg3Fig4uMMzMRgKoTxUzVx/r
 uGRbAS8DH58G73N7SLTJrU0G6zE2lWCiiq1xdR7LTg1O0r9bzTsvXfsfTU/YJFtlzWJb
 oLqaV7/0kk0WIgb4WWnAIW08KdZlDZY2Qp44pRzR6JW5U2BDGrqbjCjZaFDxMYs8oTXo
 v6bsC7GcA88fr3IaQOAjvGZWEDVUGZB7WGhl4WmSV7gMQmZF18kD7EooZoNF8HXlxBaN
 XsSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBsNWsKRdB+dNxoo7esYG52+Ce47v8Iv4gnqMU1w+4wjWEAbeXsHio/8Ij+cHmFN+saGRJBw3tqu4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwzeYaoji1/mpgLWY78QCdLcydrsMzy/J8rizUKETPOoRXkfca6
 QoDEQf3uJbAYAE2E7E8OvnCZtrogEw9rzvqZu71XNyx7oLUoFj3oDk0rq/W3sd2T
X-Gm-Gg: AY/fxX5dJ2cDquVEC0o5gT91PjOiby11WhTdh5sHZO3aQ1cEBWmjcsiZlVf6hyj9zmF
 ah1wB8av3q1bQyIHlJR0eRByYX72EdESpiExWVghec+DftCatJPyliZGbgjMhlYDyRdSvvkhRhC
 ujt7s6mq3qUjDT1/GX4ImXZnQE6Y8ZlJbypra1eW7a++KUzCQD0vzNKNdZIF2P++BF1MDlEe0AS
 YdcMCCr4/yL+If2cvXBfGQ8xdzxJm2HoktJREcn+0gM5a55v8lyiM/mqYyuep8k78bcUVdaIDLJ
 dmIh+nuIdGvw1UAmdFmzToIANZGVQICyeSqUBhugod9ZGkt5ApWAMZLNe+icwCARfR2q/tWAc9j
 ZsWGd7YGHj/nK/BC6gBeJHPeIutUMvvF4ssd38Hc+02pivwHeLjtoK5hQZ2GJ4h447f65/AS6ZE
 7hVfP+faMIyV1Cmi4WsEUwnWtkM+7FKkXLWNSQL/chodmZwq7m
X-Received: by 2002:a05:6830:43a3:b0:7c6:ca92:3621 with SMTP id
 46e09a7af769-7cfcb67f7ffmr1271173a34.22.1768396019260; 
 Wed, 14 Jan 2026 05:06:59 -0800 (PST)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com.
 [209.85.161.50]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7ce478af494sm17668154a34.17.2026.01.14.05.06.58
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jan 2026 05:06:58 -0800 (PST)
Received: by mail-oo1-f50.google.com with SMTP id
 006d021491bc7-6610800b87fso229678eaf.1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 05:06:58 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWAZJPj6yetIVrZin6FUA2JsjKZ0K7NjtkrWY7d/eZ0Y/YbAB36VHH9s1ysfNm2Hqcdx0HizpCKrMU=@lists.freedesktop.org
X-Received: by 2002:a05:6102:38c9:b0:5f1:555e:a0b4 with SMTP id
 ada2fe7eead31-5f183bdce22mr616871137.32.1768395587922; Wed, 14 Jan 2026
 04:59:47 -0800 (PST)
MIME-Version: 1.0
References: <cover.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
 <3ab81490b7bdbd2dafd7a940ae242f07d30aaa17.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <3ab81490b7bdbd2dafd7a940ae242f07d30aaa17.1764165783.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 14 Jan 2026 13:59:36 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUBN0OKOOTw+j3XuWi+hVYBVRyzp=J-+0yMfem2BfT+Eg@mail.gmail.com>
X-Gm-Features: AZwV_QjCdG9CLFFvTy17z_yoeEbQmRYHkFE3zh-jRCvSjUp5PEJNAk_rO0NIbA8
Message-ID: <CAMuHMdUBN0OKOOTw+j3XuWi+hVYBVRyzp=J-+0yMfem2BfT+Eg@mail.gmail.com>
Subject: Re: [PATCH 01/22] clk: renesas: rzv2h: Add PLLDSI clk mux support
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, linux-renesas-soc@vger.kernel.org, 
 biju.das.jz@bp.renesas.com, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org
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

Hi Tommaso,

On Wed, 26 Nov 2025 at 15:08, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> Add PLLDSI clk mux support to select PLLDSI clock from different clock
> sources.
>
> Introduce the DEF_PLLDSI_SMUX() macro to define these muxes and register
> them in the clock driver.
>
> Extend the determine_rate callback to calculate and propagate PLL
> parameters via rzv2h_get_pll_dtable_pars() when LVDS output is selected,
> using a new helper function rzv2h_cpg_plldsi_smux_lvds_determine_rate().
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/rzv2h-cpg.c
> +++ b/drivers/clk/renesas/rzv2h-cpg.c

> +
> +static int rzv2h_cpg_plldsi_smux_lvds_determine_rate(struct rzv2h_cpg_priv *priv,
> +                                                    struct pll_clk *pll_clk,
> +                                                    struct clk_rate_request *req)
> +{
> +       struct rzv2h_pll_div_pars *dsi_params;
> +       struct rzv2h_pll_dsi_info *dsi_info;
> +       u8 lvds_table[] = { 7 };
> +       u64 rate_millihz;
> +
> +       dsi_info = &priv->pll_dsi_info[pll_clk->pll.instance];
> +       dsi_params = &dsi_info->pll_dsi_parameters;
> +
> +       rate_millihz = mul_u32_u32(req->rate, MILLI);
> +       if (!rzv2h_get_pll_divs_pars(dsi_info->pll_dsi_limits, dsi_params,
> +                                    lvds_table, 1, rate_millihz)) {

s/1/ARRAY_SIZE(lvds_table)/

> +               dev_err(priv->dev, "failed to determine rate for req->rate: %lu\n",
> +                       req->rate);
> +               return -EINVAL;
> +       }
> +
> +       req->rate = DIV_ROUND_CLOSEST_ULL(dsi_params->div.freq_millihz, MILLI);
> +       req->best_parent_rate = req->rate;
> +       dsi_info->req_pll_dsi_rate = req->best_parent_rate * dsi_params->div.divider_value;
> +
> +       return 0;
> +}

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
