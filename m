Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EFF625C9FA
	for <lists+dri-devel@lfdr.de>; Thu,  3 Sep 2020 22:08:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57FAD6E408;
	Thu,  3 Sep 2020 20:08:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D347F6E408
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 20:08:40 +0000 (UTC)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6C27B20C09
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 20:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599163720;
 bh=VNQBiy+9hTVwRrEP9Lqn0yhiulQhOMN+3eYs5y17OSo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fpu3+eIhqnPrgb0qkZaEvK3Kmu6p311u+wQxiizl/PBDQky26ZvdXEF9ZBBWJX790
 KQiAx25ql7TsaMgmfFnPlg+xYGZbmKisva1U51ZXi/PmbDdJ3jVQNYBbBEOzuUbsDI
 W4iLYZPfAEzOMG9cHh4+nZQsdoQ8fdBGp+++s/Tc=
Received: by mail-ej1-f50.google.com with SMTP id nw23so5599477ejb.4
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Sep 2020 13:08:40 -0700 (PDT)
X-Gm-Message-State: AOAM5313poCnT2gBcBEkKM0sD63x1blQ3eCJ84FwIGmRBMUyCN79+x4n
 N4KxYhMN0No0EmJ9J4Xr2TwVqgAs1yA+b0q33E0=
X-Google-Smtp-Source: ABdhPJyuDkfhPLPKz+PzRWR6ZZ6XjdtJBpFQ1L6Teu/datJrHcsDx/4D3LZlqVcdF89l0M1sqH04BmaIJmXbbK5x2pw=
X-Received: by 2002:a17:906:82d1:: with SMTP id
 a17mr3855109ejy.385.1599163718890; 
 Thu, 03 Sep 2020 13:08:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200903165717.1272492-1-m.tretter@pengutronix.de>
In-Reply-To: <20200903165717.1272492-1-m.tretter@pengutronix.de>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 3 Sep 2020 22:08:27 +0200
X-Gmail-Original-Message-ID: <CAJKOXPcJCfFL43OLXC_DAowU0o_jW2rZ7qX-m8ePcPEMo0PEgQ@mail.gmail.com>
Message-ID: <CAJKOXPcJCfFL43OLXC_DAowU0o_jW2rZ7qX-m8ePcPEMo0PEgQ@mail.gmail.com>
Subject: Re: [PATCH 00/16] drm/exynos: Convert driver to drm bridge
To: Michael Tretter <m.tretter@pengutronix.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?=
 <b.zolnierkie@samsung.com>, 
 Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>, 
 Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>
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
Cc: narmstrong@baylibre.com,
 "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>,
 kernel@pengutronix.de, dri-devel@lists.freedesktop.org,
 Laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 3 Sep 2020 at 18:57, Michael Tretter <m.tretter@pengutronix.de> wrote:
>
> Hello,
>
> the Exynos MIPI DSI Phy is also found on the i.MX8M Mini. However, on the
> i.MX8M Mini, the bridge is driven by an LCDIF display controller instead of
> the Exynos Decon. The driver for the LCDIF does not use the component
> framework, but uses drm bridges.
>
> This series converts the Exynos MIPI DSI into a drm bridge and makes it usable
> with such drivers. Although the driver is converted, it still supports the
> component framework API to stay compliant with the Exynos DRM driver.
>
> Unfortunately, I don't have any Exynos SoC to actually test the series.  I
> tested the driver with a few additional unfinished patches on the i.MX8M Mini
> EVK, but somebody should definitely verify that the driver is still working on
> Exynos hardware.

Hi Michael,

+Cc maintainers and folks in Samsung.

Please follow the script/get_maintainers.pl to get the list of
maintainers of the Exynos DRM drivers. First they could provide you
with testing, second they might be the people merging the driver.

Unfortunately I cannot provide proper testing as none of my boards
have a display attached. :)

Best regards,
Krzysztof
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
