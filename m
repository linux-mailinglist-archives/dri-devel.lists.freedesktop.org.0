Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QC76CnB2oWmntQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 11:48:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85C891B62AE
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 11:48:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCE3A10EAFA;
	Fri, 27 Feb 2026 10:48:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com
 [209.85.221.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEDE010EAFA
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 10:48:11 +0000 (UTC)
Received: by mail-vk1-f176.google.com with SMTP id
 71dfb90a1353d-56a87098868so665783e0c.1
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 02:48:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772189290; x=1772794090;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3FlwDAQHs4Ab188Hz8URDAmWORYubm2PaVsA0iFMwu0=;
 b=b0vwoATcIm7atQwLN7hvCwuom8JErC+yFK5pDAQ8YCp3HlmzJCsbnHaYXwEVLp2nSW
 0+GyqE6Y8wn2Kshqb/bDMeX/XsJnVZqgzIgVE0aM2GlppbQ/yRmohP576/LpSER8x2Pp
 cNua04bXQH53ZIPWTWWZlQTDkde6uh1U9v/a6g2UEMuscHEoFiIfBQVQSiTniT+TxirQ
 8u+oA66avNJmShT9K8aoWOq0sXNvz0/yuczylme6gi8rcBUDuVhnkJwlk5PCLlDc3Ew3
 R8J+KrTLHUg0GWBm5TUYkKjMgMieHttn1As3PfSuyW9FmAqoN4lmNWwKg0fg/qJllhKX
 GRFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVG8Zau1uzRBbTFAtcxyXyQ+MajI4xQ1Si+I2XIhX2E5RsdmotmHj/rToLinlSNdV7otgg9xp8ndrA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwOCu4XxapgPQMOfJ9txvPEWA3YlUuhKWfpocrwQnYGxUF3kWSJ
 MY6ZrLH76kWnYBQPHLw1qy2kaUTRbYyKH+bl6VtvUCcE/3w1N9BCMeR5v3C2yJe/pNg=
X-Gm-Gg: ATEYQzzpFz/2z4kelCK2/wkv9PHZQhnX3DbNLoJbH2UemR1iZkhe6ydelTWQtjTCsBW
 5AokaWO7S8TPZVdPyDSqOJCmdJ/CC+jsLEPAp7DVT7pfSx/Uj3ZcqI4aKAuC6xLkVSanW247Pei
 JN3wE2oWYi0qaIb9MNFHNgp17V1WmWJ51L9Tg8qfEX9y5XGQogePlLS8VTzGeeXrSjlXA+jakra
 q0kYBHB/7tMBYhZb8jxAH5nREMf8K3hGTDHZHcR9XQKWcAolN005FwjBDOHvj+jwhDtAnv2brGk
 +tkGXehubgtc1OJc4k7WdDE1atOCUl+HMqeNRZIoEtEWUj84EN8RNL/03ifg19GUZfTz6NDf8uq
 XhqRkGslF54kiDqCA/3fAoJCoVOFRr0RWO3aO7w0CRL244xsbf3O4HNXCsUnN96LijXR9U6i35m
 J82Vd/xtPbBY17S8u8feFLTFbk9ksLq6dsLLSxpIc+b5jzqir9xA3JssS19Hsw
X-Received: by 2002:a05:6122:4b18:b0:566:eb31:4713 with SMTP id
 71dfb90a1353d-56aa0aafa95mr1182273e0c.9.1772189290564; 
 Fri, 27 Feb 2026 02:48:10 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com.
 [209.85.222.45]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-56a91bb4fbesm5733055e0c.5.2026.02.27.02.48.09
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Feb 2026 02:48:09 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id
 a1e0cc1a2514c-94dd2d71231so521073241.0
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 02:48:09 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWySBOYysuJd65lIq4WCY6qapLZVAV13vmWugGhmf9CnyiXroDJrmi+48VqZ5hxdxC0K1k9OAEMk9E=@lists.freedesktop.org
X-Received: by 2002:a05:6102:3583:b0:5f9:3a74:e17b with SMTP id
 ada2fe7eead31-5ff3232afd6mr1008069137.13.1772189289126; Fri, 27 Feb 2026
 02:48:09 -0800 (PST)
MIME-Version: 1.0
References: <cover.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
 <53c8d9e7fde7b176e05503a72af81e74c7a8a1c1.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
In-Reply-To: <53c8d9e7fde7b176e05503a72af81e74c7a8a1c1.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Feb 2026 11:47:58 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVAf=GyDR95BFD0Q3Wbjo5n5vnqSsfue=7fRWxs6=Hdgg@mail.gmail.com>
X-Gm-Features: AaiRm51h4Q-XTgbNeUvH0Ox5Heqc-6O0OJ_Dv-XNFtKtSDZR5vc0E3M-GeWzDIs
Message-ID: <CAMuHMdVAf=GyDR95BFD0Q3Wbjo5n5vnqSsfue=7fRWxs6=Hdgg@mail.gmail.com>
Subject: Re: [PATCH v5 01/20] clk: renesas: rzv2h: Add PLLDSI clk mux support
To: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Cc: tomm.merciai@gmail.com, laurent.pinchart@ideasonboard.com, 
 linux-renesas-soc@vger.kernel.org, biju.das.jz@bp.renesas.com, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, 
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.89 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tommaso.merciai.xr@bp.renesas.com,m:tomm.merciai@gmail.com,m:laurent.pinchart@ideasonboard.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:magnus.damm@gmail.com,m:laurent.pinchart+renesas@ideasonboard.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:tommmerciai@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,dri-devel-bounces@lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_CC(0.00)[gmail.com,ideasonboard.com,vger.kernel.org,bp.renesas.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,glider.be,baylibre.com,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.851];
	TAGGED_RCPT(0.00)[dri-devel,dt,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,linux-m68k.org:email,mail.gmail.com:mid,renesas.com:email]
X-Rspamd-Queue-Id: 85C891B62AE
X-Rspamd-Action: no action

Hi Tommaso,

On Fri, 13 Feb 2026 at 17:28, Tommaso Merciai
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
> The CLK_SMUX2_DSI{0,1}_CLK clock multiplexers select between two paths
> with different duty cycles:
>
> - CDIV7_DSIx_CLK (LVDS path, parent index 0): asymmetric H/L=4/3 duty (4/7)
> - CSDIV_DSIx (DSI/RGB path, parent index 1): symmetric 50% duty (1/2)
>
> Implement rzv2h_cpg_plldsi_smux_{get,set}_duty_cycle clock operations to
> allow the DRM driver to query and configure the appropriate clock path
> based on the required output duty cycle.
>
> Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/rzv2h-cpg.c
> +++ b/drivers/clk/renesas/rzv2h-cpg.c

> +static struct clk * __init
> +rzv2h_cpg_plldsi_smux_clk_register(const struct cpg_core_clk *core,
> +                                  struct rzv2h_cpg_priv *priv)
> +{
> +       struct rzv2h_plldsi_mux_clk *clk_hw_data;
> +       struct clk_init_data init;
> +       struct clk_hw *clk_hw;
> +       struct smuxed smux;
> +       u8 width, mask;
> +       int ret;
> +
> +       smux = core->cfg.smux;
> +       mask = smux.width;
> +       width = fls(mask) - ffs(mask) + 1;
> +
> +       if (width + smux.width > 16) {
> +               dev_err(priv->dev, "mux value exceeds LOWORD field\n");
> +               return ERR_PTR(-EINVAL);
> +       }

I am totally confused by this: smux.width is not a mask, but the size
of a register bitifield.
Perhaps:

    if (smux.shift + smux.width > 16) { ... }

?

> +
> +       clk_hw_data = devm_kzalloc(priv->dev, sizeof(*clk_hw_data), GFP_KERNEL);
> +       if (!clk_hw_data)
> +               return ERR_PTR(-ENOMEM);
> +
> +       clk_hw_data->priv = priv;
> +
> +       init.name = core->name;
> +       init.ops = &rzv2h_cpg_plldsi_smux_ops;
> +       init.flags = core->flag;
> +       init.parent_names = core->parent_names;
> +       init.num_parents = core->num_parents;
> +
> +       clk_hw_data->mux.reg = priv->base + smux.offset;
> +
> +       clk_hw_data->mux.shift = smux.shift;
> +       clk_hw_data->mux.mask = smux.width;

Again, smux.width is not a mask.
Perhaps GENMASK_U16(smux.shift - 1, 0)?

> +       clk_hw_data->mux.flags = core->mux_flags;
> +       clk_hw_data->mux.lock = &priv->rmw_lock;
> +
> +       clk_hw = &clk_hw_data->mux.hw;
> +       clk_hw->init = &init;
> +
> +       ret = devm_clk_hw_register(priv->dev, clk_hw);
> +       if (ret)
> +               return ERR_PTR(ret);
> +
> +       return clk_hw->clk;
> +}

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
