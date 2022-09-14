Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7E15B82D7
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 10:22:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4CFC10E57C;
	Wed, 14 Sep 2022 08:22:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B151B10E57C
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 08:22:13 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id z13so7095406edb.13
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Sep 2022 01:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=C3szHyN1H7uWCYSHMJkK9hI6f1WnHoGR06A9hdGC5m4=;
 b=dg7GYZg434lKn977vNMDHW6Xq/ubpOjo++bwDYcJPjweH2hQShU/U6gZFxlsC0iKMs
 8mOGaOkJQ748aVQ+LVzYlg8yxuEtpq9wPKofxczXqHdOe8B0NAvkgEotk4Wf/XQ0QH2F
 8GZUW846oDXv1IBly8apJw9S/XSBIXJeC7cBY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=C3szHyN1H7uWCYSHMJkK9hI6f1WnHoGR06A9hdGC5m4=;
 b=73Hxsojx1OuOpwZX3UjAxQ2Zq65P2ThjwBvEn8CEYZ0V1pV1RMwdh1RzNjuIdPoiP0
 f8NLQLbiAJdA6YrrroeaE14F8spuYNli4SvTHD0gcD3Ybz62T+cWKsgijG5bai1c0T+G
 SOYqAig5LHDLRbFddS2zanWl9b12sbb+fhQXuXlXx5Eupf4ZfQ4GmfMDFxwxzGSB3ah+
 VD5+Arx3QrF7usnVWpBwyL7K42OTQ/ggqgB6fkeMDkBbtMYJYfEFpIFGDNe8mxoZ0Sw5
 cAxiPkbxKdjSlOoaRAJ7Gu8yC8umGAh8w6VVEiPDIqQgl96PIO95v95jREXB5Skxe7B5
 /bqQ==
X-Gm-Message-State: ACgBeo3b9zD/y/gTsZ1Eif6PQV2ATHhBQ6u7uZaEKUxWk4DWAauPIAE0
 idjelmP/TN9eL9iI2KqhhVtP5s7nOl3vXnHXkzOzKw==
X-Google-Smtp-Source: AA6agR5VXO7LGKlo/0ITP5xoJJtYJWB9kOGeOCXFZPjSD3tELNNBCLBAsYH7sCGgrDncAa9Ie4CYWyAxAnqxa9WrMj0=
X-Received: by 2002:a05:6402:e86:b0:440:d1be:20c7 with SMTP id
 h6-20020a0564020e8600b00440d1be20c7mr29564784eda.349.1663143732102; Wed, 14
 Sep 2022 01:22:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220829184031.1863663-1-jagan@amarulasolutions.com>
 <20220829184031.1863663-8-jagan@amarulasolutions.com>
 <CAHCN7xKxS6oaX8kGYv_bhWfCFUEMBykN87BwXMPkcCg=OwKXrw@mail.gmail.com>
In-Reply-To: <CAHCN7xKxS6oaX8kGYv_bhWfCFUEMBykN87BwXMPkcCg=OwKXrw@mail.gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 14 Sep 2022 13:52:01 +0530
Message-ID: <CAMty3ZAKjpXpdK1ZNw9dX_ojC4NKCZZ36HaQZGPDfrqiMk0kpQ@mail.gmail.com>
Subject: Re: [PATCH v4 07/12] drm: bridge: samsung-dsim: Fix PLL_P (PMS_P)
 offset
To: Adam Ford <aford173@gmail.com>
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
Cc: Marek Vasut <marex@denx.de>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, NXP Linux Team <linux-imx@nxp.com>,
 Fancy Fang <chen.fang@nxp.com>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 arm-soc <linux-arm-kernel@lists.infradead.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 30, 2022 at 1:12 AM Adam Ford <aford173@gmail.com> wrote:
>
> On Mon, Aug 29, 2022 at 1:41 PM Jagan Teki <jagan@amarulasolutions.com> wrote:
> >
> > The i.MX 8M Mini Applications Processor Reference Manual, Rev. 3, 11/2020
> > with 13.7.10.1 Master PLL PMS Value setting Register mentioned PMS_P offset
> > range from BIT[18-13] and the upstream driver is using the same offset.
> >
> > However, offset 13 is not working on i.MX8M Mini platforms but downstream
> > NXP driver is using 14 [1] and it is working with i.MX8M Mini SoC.
>
> From the line you highlighted in the link, the downstream NXP ones
> shows 13 if I'm reading it correctly.
>
> #define PLLCTRL_SET_P(x) REG_PUT(x, 18, 13)

PMS_P value set in sec_mipi_dsim_check_pll_out using PLLCTRL_SET_P()
with offset 13 and then an additional offset of one bit added in
sec_mipi_dsim_config_pll via PLLCTRL_SET_PMS().

Please check this for additional information
https://github.com/fschrempf/linux/commit/bbb3549a99e162ef6ad4c83d5fd4d39a6daa6d56

I'll update the additional information in commit messages in v5.

Thanks,
Jagan.
