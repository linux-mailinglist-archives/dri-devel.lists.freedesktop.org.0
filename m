Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1D4A17A9B
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 10:55:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE9B010E525;
	Tue, 21 Jan 2025 09:55:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pKUt9QnN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D30B10E525
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 09:55:49 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-e46ebe19489so7766140276.2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 01:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737453348; x=1738058148; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=7o6IOiITgKj2aaYMKuu2L3/b1CWQWZ/+CCPF6c2JWmw=;
 b=pKUt9QnNhQFB/RjB+K9n5PdG7qD+q4CV1jJUvB9gq2pdt+r0CM/FzepZQBAfohsiMf
 z8jjKRpOMH2u05iTTkWNEo1X0SNJV0lyP5y70ppeFUNHWWlaEql+GR3gwCZvd3fOlmlP
 d9ls9VSsvccRRRMgiIumkkAs+Ee9R65HC3GkaH0mUCPbJQE+8kyaMlzFFRzq/wdZN8y/
 4bNxmLH7l1Lo4GqfthUw0+MwiP7C1izxy8VzotNavvebpGB2T9KpyFUE5VpndLFlEiTP
 IcjEVwSLcJ0J8uddgsPIiyOssr7pTbmun5cuytyyMF+aVakizMSj0GMNVAo8ijFzW7la
 yCFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737453348; x=1738058148;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7o6IOiITgKj2aaYMKuu2L3/b1CWQWZ/+CCPF6c2JWmw=;
 b=hGkdXpvRB9ORPTpqAk7S33XuzPgZSKHJVKTEssKLc9saheXbupnWG50artrtmTS9+L
 TFPhnjWTB1XehziPAUQzE2I0xRNLddyZuF5oE3dBo+k8j0+Ej0r1En3lThmErmnSazps
 HE1tsBF+RvV6CXdjgg3EBeirHf04wfdd7u7U9hOvV6Q3bf1jO25fAN9/QKQFPrgAZQwZ
 cqyy7u/KSvtVNWUU1d6LIn3I9F1Bo65lg32PNQsA4XTolgeocvitOThpwwfVpTGt2em6
 xPl2jWhAYNwWJjaeBt0CCqQ14dC39OMD2wfVoNl9JYDJmEcx1GjwI0hr7hbYk9bV1V00
 Eg0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGVRm2NlupmwvjTEA0XgwlweVsILao4r7HSMwy84XrD/eC+ZqBH9wsmVfyjXEnkcMZVGtZw86FdRk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyjFjFSrL07RLtaj5FhVLybi3ieeNCiSrWOlQ9ALtrY/LKEqfZo
 j4MvUDC0spXnDJMbbcktSkb3DFWkzGqORm5AXKkUm8fKddPElvUZ6EDTVDeEBEEjju4mSWFgGSZ
 UbHzDBWyGgadSJq31b9swXu77oPZLxQocyTQyrw==
X-Gm-Gg: ASbGncvgm9HeO77UqgVYDPpOVJsjZiqAVmChY7rrIaM2drTQ33fx5O8umPZkpEr8TNB
 JXUISPSzMSVs12g+Xd24L8hyRzWkZnjRhfz4phVB+wN22ZIA9kJQ=
X-Google-Smtp-Source: AGHT+IEpnT3FHvprwRHA3VpPC4Y+cVC4t00ffjRcKixMRn9RszYOv82pYtRXth2Mua1mSVsOU+7gyK7UGMPrtGwJ2tA=
X-Received: by 2002:a05:6902:154a:b0:e58:cbe:75af with SMTP id
 3f1490d57ef6-e580cbe7a6bmr47838276.8.1737453348429; Tue, 21 Jan 2025 01:55:48
 -0800 (PST)
MIME-Version: 1.0
References: <CGME20250120172125eucas1p141540607f423eea4c55b2bd22ff5adf0@eucas1p1.samsung.com>
 <20250120172111.3492708-1-m.wilczynski@samsung.com>
 <20250120172111.3492708-6-m.wilczynski@samsung.com>
In-Reply-To: <20250120172111.3492708-6-m.wilczynski@samsung.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 21 Jan 2025 10:55:12 +0100
X-Gm-Features: AbW1kvYXcCyxNJkjAKX_kGzqeB1Hobs-RjT3osPXjnDxzisZWb_QimmzPk9PWZ4
Message-ID: <CAPDyKFrKKZ4RL5y+sCKAOK71ap7O3aTTc6rY9NrvcHt4hh6EVQ@mail.gmail.com>
Subject: Re: [RFC v3 05/18] pmdomain: thead: Add power-domain driver for TH1520
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, drew@pdp7.com, guoren@kernel.org, 
 wefu@redhat.com, jassisinghbrar@gmail.com, paul.walmsley@sifive.com, 
 palmer@dabbelt.com, aou@eecs.berkeley.edu, frank.binns@imgtec.com, 
 matt.coster@imgtec.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, jszhang@kernel.org, 
 p.zabel@pengutronix.de, m.szyprowski@samsung.com, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 linux-pm@vger.kernel.org
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

On Mon, 20 Jan 2025 at 18:21, Michal Wilczynski
<m.wilczynski@samsung.com> wrote:
>
> The T-Head TH1520 SoC contains multiple power islands that can be
> programmatically turned on and off using the AON (Always-On) protocol
> and a hardware mailbox [1]. The relevant mailbox driver has already been
> merged into the mainline kernel in commit 5d4d263e1c6b ("mailbox:
> Introduce support for T-head TH1520 Mailbox driver");
>
> This commit introduces a power-domain driver for the TH1520 SoC, which
> is using AON firmware protocol to communicate with E902 core through the
> hardware mailbox. This way it can send power on/off commands to the E902
> core.
>
> Link: https://openbeagle.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH1520%20System%20User%20Manual.pdf [1]
>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

I guess this depends on patch2 and patch3. Not sure what's the best
way to merge this, but I can certainly funnel them all three through
my pmdomain tree if that sounds feasible. Just let me know.

Kind regards
Uffe

> ---
>  MAINTAINERS                                |   1 +
>  drivers/pmdomain/Kconfig                   |   1 +
>  drivers/pmdomain/Makefile                  |   1 +
>  drivers/pmdomain/thead/Kconfig             |  12 ++
>  drivers/pmdomain/thead/Makefile            |   2 +
>  drivers/pmdomain/thead/th1520-pm-domains.c | 174 +++++++++++++++++++++
>  6 files changed, 191 insertions(+)
>  create mode 100644 drivers/pmdomain/thead/Kconfig
>  create mode 100644 drivers/pmdomain/thead/Makefile
>  create mode 100644 drivers/pmdomain/thead/th1520-pm-domains.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c96a1e6c8831..363bb3471a33 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20195,6 +20195,7 @@ F:      drivers/firmware/thead,th1520-aon.c
>  F:     drivers/mailbox/mailbox-th1520.c
>  F:     drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
>  F:     drivers/pinctrl/pinctrl-th1520.c
> +F:     drivers/pmdomain/thead/
>  F:     include/dt-bindings/clock/thead,th1520-clk-ap.h
>  F:     include/dt-bindings/firmware/thead,th1520-aon.h
>  F:     include/linux/firmware/thead/thead,th1520-aon.h
> diff --git a/drivers/pmdomain/Kconfig b/drivers/pmdomain/Kconfig
> index 23c64851a5b0..91f04ace35d4 100644
> --- a/drivers/pmdomain/Kconfig
> +++ b/drivers/pmdomain/Kconfig
> @@ -16,6 +16,7 @@ source "drivers/pmdomain/st/Kconfig"
>  source "drivers/pmdomain/starfive/Kconfig"
>  source "drivers/pmdomain/sunxi/Kconfig"
>  source "drivers/pmdomain/tegra/Kconfig"
> +source "drivers/pmdomain/thead/Kconfig"
>  source "drivers/pmdomain/ti/Kconfig"
>  source "drivers/pmdomain/xilinx/Kconfig"
>
> diff --git a/drivers/pmdomain/Makefile b/drivers/pmdomain/Makefile
> index a68ece2f4c68..7030f44a49df 100644
> --- a/drivers/pmdomain/Makefile
> +++ b/drivers/pmdomain/Makefile
> @@ -14,6 +14,7 @@ obj-y                                 += st/
>  obj-y                                  += starfive/
>  obj-y                                  += sunxi/
>  obj-y                                  += tegra/
> +obj-y                                  += thead/
>  obj-y                                  += ti/
>  obj-y                                  += xilinx/
>  obj-y                                  += core.o governor.o
> diff --git a/drivers/pmdomain/thead/Kconfig b/drivers/pmdomain/thead/Kconfig
> new file mode 100644
> index 000000000000..c7a1ac0c61dc
> --- /dev/null
> +++ b/drivers/pmdomain/thead/Kconfig
> @@ -0,0 +1,12 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config TH1520_PM_DOMAINS
> +       tristate "Support TH1520 Power Domains"
> +       depends on TH1520_AON_PROTOCOL || !TH1520_AON_PROTOCOL
> +       select REGMAP_MMIO
> +       help
> +         This driver enables power domain management for the T-HEAD
> +         TH-1520 SoC. On this SoC there are number of power domains,
> +         which can be managed independently. For example GPU, NPU,
> +         and DPU reside in their own power domains which can be
> +         turned on/off.
> diff --git a/drivers/pmdomain/thead/Makefile b/drivers/pmdomain/thead/Makefile
> new file mode 100644
> index 000000000000..adfdf5479c68
> --- /dev/null
> +++ b/drivers/pmdomain/thead/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_TH1520_PM_DOMAINS)                += th1520-pm-domains.o
> diff --git a/drivers/pmdomain/thead/th1520-pm-domains.c b/drivers/pmdomain/thead/th1520-pm-domains.c
> new file mode 100644
> index 000000000000..d913ad40fb76
> --- /dev/null
> +++ b/drivers/pmdomain/thead/th1520-pm-domains.c
> @@ -0,0 +1,174 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2021 Alibaba Group Holding Limited.
> + * Copyright (c) 2024 Samsung Electronics Co., Ltd.
> + * Author: Michal Wilczynski <m.wilczynski@samsung.com>
> + */
> +
> +#include <linux/firmware/thead/thead,th1520-aon.h>
> +#include <linux/slab.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
> +
> +#include <dt-bindings/firmware/thead,th1520-aon.h>
> +
> +struct th1520_power_domain {
> +       struct th1520_aon_chan *aon_chan;
> +       struct generic_pm_domain genpd;
> +       u32 rsrc;
> +};
> +
> +struct th1520_power_info {
> +       const char *name;
> +       u32 rsrc;
> +};
> +
> +static const struct th1520_power_info th1520_pd_ranges[] = {
> +       { "vdec", TH1520_AON_VDEC_PD },
> +       { "npu", TH1520_AON_NPU_PD },
> +       { "venc", TH1520_AON_VENC_PD },
> +       { "gpu", TH1520_AON_GPU_PD },
> +       { "dsp0", TH1520_AON_DSP0_PD },
> +       { "dsp1", TH1520_AON_DSP1_PD }
> +};
> +
> +static inline struct th1520_power_domain *
> +to_th1520_power_domain(struct generic_pm_domain *genpd)
> +{
> +       return container_of(genpd, struct th1520_power_domain, genpd);
> +}
> +
> +static int th1520_pd_power_on(struct generic_pm_domain *domain)
> +{
> +       struct th1520_power_domain *pd = to_th1520_power_domain(domain);
> +
> +       return th1520_aon_power_update(pd->aon_chan, pd->rsrc, true);
> +}
> +
> +static int th1520_pd_power_off(struct generic_pm_domain *domain)
> +{
> +       struct th1520_power_domain *pd = to_th1520_power_domain(domain);
> +
> +       return th1520_aon_power_update(pd->aon_chan, pd->rsrc, false);
> +}
> +
> +static struct generic_pm_domain *th1520_pd_xlate(const struct of_phandle_args *spec,
> +                                                void *data)
> +{
> +       struct generic_pm_domain *domain = ERR_PTR(-ENOENT);
> +       struct genpd_onecell_data *pd_data = data;
> +       unsigned int i;
> +
> +       for (i = 0; i < ARRAY_SIZE(th1520_pd_ranges); i++) {
> +               struct th1520_power_domain *pd;
> +
> +               pd = to_th1520_power_domain(pd_data->domains[i]);
> +               if (pd->rsrc == spec->args[0]) {
> +                       domain = &pd->genpd;
> +                       break;
> +               }
> +       }
> +
> +       return domain;
> +}
> +
> +static struct th1520_power_domain *
> +th1520_add_pm_domain(struct device *dev, const struct th1520_power_info *pi)
> +{
> +       struct th1520_power_domain *pd;
> +       int ret;
> +
> +       pd = devm_kzalloc(dev, sizeof(*pd), GFP_KERNEL);
> +       if (!pd)
> +               return ERR_PTR(-ENOMEM);
> +
> +       pd->rsrc = pi->rsrc;
> +       pd->genpd.power_on = th1520_pd_power_on;
> +       pd->genpd.power_off = th1520_pd_power_off;
> +       pd->genpd.name = pi->name;
> +
> +       ret = pm_genpd_init(&pd->genpd, NULL, true);
> +       if (ret)
> +               return ERR_PTR(ret);
> +
> +       return pd;
> +}
> +
> +static void th1520_pd_init_all_off(struct generic_pm_domain **domains,
> +                                  struct device *dev)
> +{
> +       int ret;
> +       int i;
> +
> +       for (i = 0; i < ARRAY_SIZE(th1520_pd_ranges); i++) {
> +               struct th1520_power_domain *pd =
> +                       to_th1520_power_domain(domains[i]);
> +
> +               ret = th1520_aon_power_update(pd->aon_chan, pd->rsrc, false);
> +               if (ret)
> +                       dev_err(dev,
> +                               "Failed to initially power down power domain %s\n",
> +                               pd->genpd.name);
> +       }
> +}
> +
> +static int th1520_pd_probe(struct platform_device *pdev)
> +{
> +       struct generic_pm_domain **domains;
> +       struct genpd_onecell_data *pd_data;
> +       struct th1520_aon_chan *aon_chan;
> +       struct device *dev = &pdev->dev;
> +       int i;
> +
> +       aon_chan = dev_get_drvdata(dev->parent);
> +       if (!aon_chan) {
> +               dev_err(dev, "Failed to get AON channel from parent\n");
> +               return -EINVAL;
> +       }
> +
> +       domains = devm_kcalloc(dev, ARRAY_SIZE(th1520_pd_ranges),
> +                              sizeof(*domains), GFP_KERNEL);
> +       if (!domains)
> +               return -ENOMEM;
> +
> +       pd_data = devm_kzalloc(dev, sizeof(*pd_data), GFP_KERNEL);
> +       if (!pd_data)
> +               return -ENOMEM;
> +
> +       for (i = 0; i < ARRAY_SIZE(th1520_pd_ranges); i++) {
> +               struct th1520_power_domain *pd;
> +
> +               pd = th1520_add_pm_domain(dev, &th1520_pd_ranges[i]);
> +               if (IS_ERR(pd))
> +                       return PTR_ERR(pd);
> +
> +               pd->aon_chan = aon_chan;
> +               domains[i] = &pd->genpd;
> +               dev_dbg(dev, "added power domain %s\n", pd->genpd.name);
> +       }
> +
> +       pd_data->domains = domains;
> +       pd_data->num_domains = ARRAY_SIZE(th1520_pd_ranges);
> +       pd_data->xlate = th1520_pd_xlate;
> +
> +       /*
> +        * Initialize all power domains to off to ensure they start in a
> +        * low-power state. This allows device drivers to manage power
> +        * domains by turning them on or off as needed.
> +        */
> +       th1520_pd_init_all_off(domains, dev);
> +
> +       return of_genpd_add_provider_onecell(dev->parent->of_node, pd_data);
> +}
> +
> +static struct platform_driver th1520_pd_driver = {
> +       .driver = {
> +               .name = "th1520-pd",
> +       },
> +       .probe = th1520_pd_probe,
> +};
> +module_platform_driver(th1520_pd_driver);
> +
> +MODULE_AUTHOR("Michal Wilczynski <m.wilczynski@samsung.com>");
> +MODULE_DESCRIPTION("T-HEAD TH1520 SoC power domain controller");
> +MODULE_LICENSE("GPL");
> --
> 2.34.1
>
