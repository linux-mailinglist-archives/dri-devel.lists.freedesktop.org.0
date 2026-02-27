Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGx5J6nioWmUwwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 19:30:01 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E43F91BBFB1
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 19:30:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F22110E0A4;
	Fri, 27 Feb 2026 18:29:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com
 [209.85.221.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4E5810E0A4
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 18:29:56 +0000 (UTC)
Received: by mail-vk1-f174.google.com with SMTP id
 71dfb90a1353d-56739adfa1aso1941052e0c.0
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 10:29:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772216996; x=1772821796;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Qcd8Oic1Sc8ZJu2YAJkZaSOQYT6Z1q9h1yoGvFgoj60=;
 b=W4F6fR7Uz2sPlClTigBv07A4b0bGdlfD2LG8rkzhWmpwxgsZYUsQBJho9MxI3Kpyrp
 T1j0A4fIEdf/Io2+UWCj7/6xe9K43KH4uKxepN0rxjxZmRaGUQxAZ7GzpqM5HpamxGvp
 yrrazViHD5YtMetXIR1XpF+8jgdXkAM5ilTBkVUA3J/VKjb34mhJ+MDa+YqTin29p7Ix
 U971Omdx6KfUzYyl5EMPwzZIO3a3Msvgia6gu94Yl77oYUi3tmSgt0Y7Arb4CV7TwtXv
 q/4F23ESNswDWcCjCp1n0j9ji9bdq4dkllPy8ENVnAOoJFj3d/AmO1p/faY9YYsTTCQz
 qK/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBALSeEN+iyNlHJgO1nYo7U/T6Na7wMsLNEh/Z0bjZyBNAkDL5s0o4McbucUMNsgYQs/WoT4EUcxU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzj2CiwCrLsrAToFyoLO/4dd2c1p+cgyv4FliZGM+nk3ZaskJwx
 w2pRn4aUgujkL/TH98uFxbHi2cLw1S0haXoW/E+gku9Gi6U3cZ7B7XsJLRnMxPjeuag=
X-Gm-Gg: ATEYQzygWQ7uzGDVD/ylZwfnh58VvuAyq/ovCwLsLPYz44H1bb4lw0+13ggOjX3cxkP
 49DZ+CFo9LmGt0XaREecj0fYvM4G7IZby+6GiqM8jocDEtHi0rKZTti8FfKDNxcTgqgjVJGGD4M
 0tSv6Hksrf3hb7vF7znYQAiwkK/0FHe4KZLz8E9suy2dGnToeFITrxcP6pWIMIDb/sD78UsLFLg
 W1aUdLxF6kDyQEfIrYYCjjanGmyzaeIWSpxocCdH56E4JCe/sI65xEri/4Q9TQxgzOU8QnGAmrh
 FUTpgfTluToNsxUrWqTRlJKJRx8mG9rDbgeDY/EQ6iUEmSaHFZQxyemYUm6u78bKkRbTLcR23qc
 nBCJKABdW3gscVbctagv8g/2wLBAjNYbZxl12auzkwjRcDfL/Fz9rurAuczak5MZciZpEPy8YlB
 /eXpYqApoIYierITnrN7/kvdi0DSClOyCqcBEkAe9+eV33YaXPkSiE0CmjjKhH
X-Received: by 2002:a05:6122:8f89:b0:567:5ccc:1367 with SMTP id
 71dfb90a1353d-56aa0a8fa10mr2167130e0c.11.1772216995706; 
 Fri, 27 Feb 2026 10:29:55 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com.
 [209.85.217.53]) by smtp.gmail.com with ESMTPSA id
 71dfb90a1353d-56a91b8c96fsm7436164e0c.2.2026.02.27.10.29.55
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Feb 2026 10:29:55 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id
 ada2fe7eead31-5ff1699312bso1390457137.3
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 10:29:55 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUzogUlyLPxTT+RNELSevtqaFlOKZaRxaGYOwvZvrETUNGkr937D82yyzAgEMsvihH0JEKDv6p8v5g=@lists.freedesktop.org
X-Received: by 2002:a05:6102:3ed6:b0:5f8:e2eb:43d with SMTP id
 ada2fe7eead31-5ff32331547mr2540585137.10.1772216995065; Fri, 27 Feb 2026
 10:29:55 -0800 (PST)
MIME-Version: 1.0
References: <cover.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
 <53c8d9e7fde7b176e05503a72af81e74c7a8a1c1.1770996493.git.tommaso.merciai.xr@bp.renesas.com>
 <CAMuHMdVAf=GyDR95BFD0Q3Wbjo5n5vnqSsfue=7fRWxs6=Hdgg@mail.gmail.com>
 <aaHTMGQHZwutlBIv@tom-desktop>
In-Reply-To: <aaHTMGQHZwutlBIv@tom-desktop>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Feb 2026 19:29:44 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVs1L-eRLDkGWx58WbwzjD-+yFxxNLLbrQ=kzQ7_P9y0w@mail.gmail.com>
X-Gm-Features: AaiRm50fiYKFClgCr0aKEdOOuTixihvNu690WG65tXaKE8BtTScAymOURaJQ5yg
Message-ID: <CAMuHMdVs1L-eRLDkGWx58WbwzjD-+yFxxNLLbrQ=kzQ7_P9y0w@mail.gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tommaso.merciai.xr@bp.renesas.com,m:tomm.merciai@gmail.com,m:laurent.pinchart@ideasonboard.com,m:linux-renesas-soc@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:magnus.damm@gmail.com,m:laurent.pinchart+renesas@ideasonboard.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-clk@vger.kernel.org,m:tommmerciai@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_CC(0.00)[gmail.com,ideasonboard.com,vger.kernel.org,bp.renesas.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,glider.be,baylibre.com,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,dri-devel-bounces@lists.freedesktop.org];
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
	NEURAL_HAM(-0.00)[-0.950];
	TAGGED_RCPT(0.00)[dri-devel,dt,renesas];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,init.name:url]
X-Rspamd-Queue-Id: E43F91BBFB1
X-Rspamd-Action: no action

Hi Tommaso,

On Fri, 27 Feb 2026 at 18:24, Tommaso Merciai
<tommaso.merciai.xr@bp.renesas.com> wrote:
> On Fri, Feb 27, 2026 at 11:47:58AM +0100, Geert Uytterhoeven wrote:
> > On Fri, 13 Feb 2026 at 17:28, Tommaso Merciai
> > <tommaso.merciai.xr@bp.renesas.com> wrote:
> > > Add PLLDSI clk mux support to select PLLDSI clock from different clock
> > > sources.
> > >
> > > Introduce the DEF_PLLDSI_SMUX() macro to define these muxes and register
> > > them in the clock driver.
> > >
> > > Extend the determine_rate callback to calculate and propagate PLL
> > > parameters via rzv2h_get_pll_dtable_pars() when LVDS output is selected,
> > > using a new helper function rzv2h_cpg_plldsi_smux_lvds_determine_rate().
> > >
> > > The CLK_SMUX2_DSI{0,1}_CLK clock multiplexers select between two paths
> > > with different duty cycles:
> > >
> > > - CDIV7_DSIx_CLK (LVDS path, parent index 0): asymmetric H/L=4/3 duty (4/7)
> > > - CSDIV_DSIx (DSI/RGB path, parent index 1): symmetric 50% duty (1/2)
> > >
> > > Implement rzv2h_cpg_plldsi_smux_{get,set}_duty_cycle clock operations to
> > > allow the DRM driver to query and configure the appropriate clock path
> > > based on the required output duty cycle.
> > >
> > > Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
> >
> > Thanks for your patch!
> >
> > > --- a/drivers/clk/renesas/rzv2h-cpg.c
> > > +++ b/drivers/clk/renesas/rzv2h-cpg.c

> > > +       clk_hw_data = devm_kzalloc(priv->dev, sizeof(*clk_hw_data), GFP_KERNEL);
> > > +       if (!clk_hw_data)
> > > +               return ERR_PTR(-ENOMEM);
> > > +
> > > +       clk_hw_data->priv = priv;
> > > +
> > > +       init.name = core->name;
> > > +       init.ops = &rzv2h_cpg_plldsi_smux_ops;
> > > +       init.flags = core->flag;
> > > +       init.parent_names = core->parent_names;
> > > +       init.num_parents = core->num_parents;
> > > +
> > > +       clk_hw_data->mux.reg = priv->base + smux.offset;
> > > +
> > > +       clk_hw_data->mux.shift = smux.shift;
> > > +       clk_hw_data->mux.mask = smux.width;
> >
> > Again, smux.width is not a mask.
> > Perhaps GENMASK_U16(smux.shift - 1, 0)?
>
> Or maybe we can use:
>
>         clk_hw_data->mux.mask = clk_div_mask(smux.width);
> ?

Thanks, I forgot about clk_div_mask(), which is definitely a better
choice here.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
