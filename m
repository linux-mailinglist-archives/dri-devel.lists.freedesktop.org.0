Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4A4AE6F4E
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jun 2025 21:13:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 528A510E0CA;
	Tue, 24 Jun 2025 19:13:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IE+AcjnW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6D5D10E0CA
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 19:13:03 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-5535652f42cso866956e87.2
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Jun 2025 12:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1750792382; x=1751397182; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=42g0mLF/csycd0PbqCpM2WtITkGugXfu8fIaTZhFhBc=;
 b=IE+AcjnWWVGTFvrbjkxtMDZCW0+gq/l5vWXk15PGd0wdpFaBpYOwal/3613AWa5en/
 4S5s3uCZnLL0u6nH2iSEfsSECXCISfSH6bZGDDXEht2Bpc+63D/b7HK4tNk5D2FrKvCV
 UxMGI0MFDCB6nTdEjeqFnZoRCLhUYLtUMb65S2afMp7VDg8ZXsX8AtinX5Mc9DXtxfCf
 YrOHiuxYFPVQ9CjWpKicIgLMzZnV0Q1gniu32Pfuo5snaYU95Qk9RGohN7b9cfmv3ff9
 1iUi+lbkTZfU0veWZ68hU9ukv6K+PU2mkhA0FeNgU2PZhbvefMFiP/fgJNHPHkUiM4Kz
 Uv/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750792382; x=1751397182;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=42g0mLF/csycd0PbqCpM2WtITkGugXfu8fIaTZhFhBc=;
 b=R2UrzNLPga/GNQ0nHDHt4LuFoD9aeeDIEtbUxHd/60Fi1RlA8vnrQQy0Vm9HNvredF
 dGb5tltVHoMuC17R9b83Bjk9aOGcJnuKsCUW445pcoM5LhOhMZ6zdoDUICJU9xBVglN9
 1vZW94jQM0mgdNR6bMJERvkNH+OqKmz0PnC7eVuSRKsgtPi6vdNiZj7KQeS/XTVxNGuk
 NkNTw83S1umx9DNU82WJDvngLM3rEdFnfFaMWIMayRRpXXUKLnp1QhGyzfWKNLaN3DB4
 Nv54PuKwKX9j5UsAfNLgoHw0ee/QxIGmalbH2n+vrcA9BD8d4XxjCmliCcqVh+t3rMSo
 kCgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+MH2Bslqm5osxJUGqWSudxWYhflj/3vF/ijC9sdlRfRaSIwopalVvAcweTKp/W5zKELQwC0yQ450=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx58FaR4MtuoGtGbEgKif6kXJYDPYv2SI7rTiZdJw+SUxl1sNPP
 nxYB5b2CkHLmvrO5zhRljNqvycxYe1WdubE1idzZK25RBvPTklqvc/huoEFgPzeboFoRaFeyDuT
 70h3SraQdCWI9bl9EHVlWxr/VZwCT9NyaeDrspTdqSA==
X-Gm-Gg: ASbGncsjvaDFQ6SEFOnn2HI4AZWiTY6ytbadxWKz+YtDajbe/TQ9m6/jl2/bgXi7FTk
 HNgFw7nfJlQjLnDKy4IeqSk1zc2uyBKyIa38LH+OSSPo3P+Nr6K5oA/93lb4kViTRNQ+Kr7iPq3
 gvYZO+mwplOP55j33ioOVopQhQO6m7qtpMtmzYkhG+DXU=
X-Google-Smtp-Source: AGHT+IFcvsv4Jx0wPVU5q9HdOKD/NjVsRLZ8GzOGiSq6bCzhKJUr6IeEsytMxz0Nq3UnxW9fjOmi1xt9+Qqg6x/9RLE=
X-Received: by 2002:a05:6512:1247:b0:553:35ad:2f45 with SMTP id
 2adb3069b0e04-554fdf7c090mr5733e87.50.1750792382134; Tue, 24 Jun 2025
 12:13:02 -0700 (PDT)
MIME-Version: 1.0
References: <20250619-b4-of_drm_find_panel_part1-v2-0-0df94aecc43d@redhat.com>
 <20250619-b4-of_drm_find_panel_part1-v2-14-0df94aecc43d@redhat.com>
In-Reply-To: <20250619-b4-of_drm_find_panel_part1-v2-14-0df94aecc43d@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 21:12:50 +0200
X-Gm-Features: AX0GCFsyGEH8PEzLkMow539_Cj69jbmDRSN9FsVHKoXlbloZW-99abb_OrCBGA0
Message-ID: <CACRpkdZM75HEZ0DACqC3iY7S1gLurw29Z--C7TJxUVxPUTuNqA@mail.gmail.com>
Subject: Re: [PATCH v2 14/16] drm/mcde: Keep up with refcounting
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, 
 Samuel Holland <samuel@sholland.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, 
 Biju Das <biju.das.jz@bp.renesas.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, Stefan Agner <stefan@agner.ch>, 
 Alison Wang <alison.wang@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-samsung-soc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Jun 19, 2025 at 9:19=E2=80=AFPM Anusha Srivatsa <asrivats@redhat.co=
m> wrote:

> Put the panel reference returned by of_drm_find_panel()
> back when driver is no longer using it.
>
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
