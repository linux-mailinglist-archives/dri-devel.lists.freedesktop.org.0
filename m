Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 548C6299092
	for <lists+dri-devel@lfdr.de>; Mon, 26 Oct 2020 16:08:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 548406E175;
	Mon, 26 Oct 2020 15:08:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDB926E175
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 15:08:50 +0000 (UTC)
Received: by mail-ej1-f67.google.com with SMTP id k3so14059749ejj.10
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Oct 2020 08:08:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5iSdu1PXK0XmR2WnB9STaXKJ3YlzmlR/0SoXDLvMrSM=;
 b=lbHlvKIv2MCnezdReL+yqvmSFO7VzaKCRnr5OpeQzQ8TFCS6K83eeqzQLLv/K0obgE
 kK/YiIKrxoq3JAURl3XCql8fO7ndVyzGNVHKiWhEK1V+r1f/ohCA4irGsIrEU7A9MUpV
 tzXuHxeFo+V7Uce/fmCCtbEPTAdpC1kEfgYtAiDV8WxX37ZA/V8VmdL9wc04k3aUE+ch
 znEN9QvR/3qX3/8+ypNieqrIBACdBfD2g1661c43KYHO66UQBFOPifFF501K58CpRi3E
 tL+DZKbMcVREM1XUBXT/SsXoGqPeabOQ0aw6qtT0xoqqRaweOCCu3Z9LYbJuaOsLcKNE
 z+bA==
X-Gm-Message-State: AOAM5333JYJihpbqIhfBW+V3kUnhYInMq80s3fsZyy9i0CkdgycdRRRm
 lrQ02COxgaIm1s5BfJPmHCk=
X-Google-Smtp-Source: ABdhPJzjOQyo/e3kBWa/0LWJrvv9aB0EgvPcyQ0RaOH16AfjnowP+uij6FgtMEz6bs/a8mLsEfLJ3Q==
X-Received: by 2002:a17:906:8401:: with SMTP id
 n1mr15669965ejx.215.1603724929210; 
 Mon, 26 Oct 2020 08:08:49 -0700 (PDT)
Received: from kozik-lap ([194.230.155.184])
 by smtp.googlemail.com with ESMTPSA id d24sm5360000edq.34.2020.10.26.08.08.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 08:08:48 -0700 (PDT)
Date: Mon, 26 Oct 2020 16:08:45 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v6 00/52] Introduce memory interconnect for NVIDIA Tegra
 SoCs
Message-ID: <20201026150845.GA87050@kozik-lap>
References: <20201025221735.3062-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201025221735.3062-1-digetx@gmail.com>
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
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <cyndis@kapsi.fi>, dri-devel@lists.freedesktop.org,
 Nicolas Chauvet <kwizart@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Peter Geis <pgwipeout@gmail.com>,
 linux-tegra@vger.kernel.org, Georgi Djakov <georgi.djakov@linaro.org>,
 devicetree@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 26, 2020 at 01:16:43AM +0300, Dmitry Osipenko wrote:
> Hello,
> 
> This series brings initial support for memory interconnect to Tegra20,
> Tegra30 and Tegra124 SoCs.
> 
> For the starter only display controllers and devfreq devices are getting
> interconnect API support, others could be supported later on. The display
> controllers have the biggest demand for interconnect API right now because
> dynamic memory frequency scaling can't be done safely without taking into
> account bandwidth requirement from the displays. In particular this series
> fixes distorted display output on T30 Ouya and T124 TK1 devices.

Hi,

You introduced in v6 multiple new patches. Could you describe the
dependencies, if any?

Best regards,
Krzysztof

> Changelog:
> 
> v6: - This series was massively reworked in comparison to v5, most of the
>       patches that previously got r-b need a new round of a review (!).
> 
>     - Added missed clk-rounding to the set() callback of EMC ICC providers.
>       Now clk_set_min_rate() doesn't error out on rate overflow.
> 
>     - Now peak bandwidth is properly taken into account by the set() callback
>       of EMC ICC providers.
> 
>     - EMC runs at 2x of the DRAM bus only on Tegra20, this now taken in account
>       properly by the EMC ICC set() callbacks.
> 
>     - ICC drivers use new icc_sync_state() and xlate_extended().
> 
>     - ICC drivers support new TEGRA_MC_ICC_TAG_ISO for ICC paths, which
>       conveys to ICC driver that memory path uses isochronous transfers.
> 
>     - Added support for memory latency scaling to Tegra30 ICC provider.
>       It's required for fixing display FIFO underflows on T30.
> 
>     - Added basic interconnect support to Tegra124 drivers.
> 
>     - Tegra20/30/124 EMC drivers now support voltage scaling using generic
>       OPP API.
> 
>     - The display bandwidth management is reworked and improved. It now
>       supports both bandwidth and latency allocations. The nv-display is
>       now also taken into account properly, i.e. it's kept untouched.
>       The extra bandwidth reservation required for ISO clients is moved
>       from DC driver to the ICC drivers.
> 
>     - Dropped patch that tuned T20 display controller memory client because
>       turned out that it kills ~30% of memory bandwidth. It should be possible
>       to support client tuning, but it's too complicated for now.
> 
>     - Corrected display's cursor and winb-vfilter ICC clients.
>       The winb-vfilter was erroneously used in place of cursor's client
>       in device-trees.
> 
>     - Added devm_tegra_get_memory_controller() and switched drivers to
>       use it.
> 
>     - Device-tree OPP tables are now supported by memory and devfreq
>       drivers.
> 
>     - Tegra20-devfeq driver is reworked and now uses EMC-stats instead
>       of IMC-stats (which are nearly identical modules) because previously
>       I failed to understand how EMC-stats work and succeeded this time,
>       thinking that it simply doesn't work. This removes a bit icky dependency
>       on using both EMC and MC drivers simultaneously by the devfreq driver.
> 
>     - Tegra20-devfeq driver now is a sub-device of the EMC, it also now uses
>       interconnect API for driving memory bandwidth.
> 
>     - Tegra30-devfreq got interconnect support.
> 
>     - Devfreq patches now use dev_err_probe(), which was suggested by
>       Chanwoo Choi.
> 
>     - Added acks from Chanwoo Choi and Rob Herring to the reviewed and
>       unchanged patches.
> 
>     - Added tested-by from Peter Geis and Nicolas Chauvet, who tested this
>       series on Ouya and TK1 devices, reporting that it fixes display
>       corruption on these devices which happened due to insufficient memory
>       bandwidth.
> 
>     - Added patches to fix T20 EMC registers size.
> 
>     - Fixed missing LA entry for PTC in the Tegra MC drivers.
> 
>     - New and updated patches in v6:
> 
>         dt-bindings: memory: tegra20: emc: Correct registers range in example
>         dt-bindings: memory: tegra20: emc: Document nvidia,memory-controller property
>         dt-bindings: memory: tegra20: emc: Document OPP table and voltage regulator
>         dt-bindings: memory: tegra20: emc: Document mfd-simple compatible and statistics sub-device
>         dt-bindings: memory: tegra30: emc: Document OPP table and voltage regulator
>         dt-bindings: memory: tegra124: mc: Document new interconnect property
>         dt-bindings: memory: tegra124: emc: Document new interconnect property
>         dt-bindings: memory: tegra124: emc: Document OPP table and voltage regulator
>         dt-bindings: tegra30-actmon: Document OPP and interconnect properties
>         dt-bindings: memory: tegra124: Add memory client IDs
>         ARM: tegra: Correct EMC registers size in Tegra20 device-tree
>         ARM: tegra: Add interconnect properties to Tegra124 device-tree
>         ARM: tegra: Add nvidia,memory-controller phandle to Tegra20 EMC device-tree
>         ARM: tegra: Add DVFS properties to Tegra20 EMC device-tree node
>         ARM: tegra: Add DVFS properties to Tegra30 EMC and ACTMON device-tree nodes
>         ARM: tegra: Add DVFS properties to Tegra124 EMC and ACTMON device-tree nodes
>         memory: tegra: Add and use devm_tegra_get_memory_controller()
>         memory: tegra-mc: Add interconnect framework
>         memory: tegra20: Support interconnect framework
>         memory: tegra20-emc: Skip parsing of emc-stats DT sub-node
>         memory: tegra: Add missing latency allowness entry for Page Table Cache
>         memory: tegra: Add FIFO sizes to Tegra30 memory clients
>         memory: tegra30: Support interconnect framework
>         memory: tegra124-emc: Make driver modular
>         memory: tegra124: Support interconnect framework
>         memory: tegra: Remove superfluous error messages around platform_get_irq()
>         drm/tegra: dc: Support memory bandwidth management
>         drm/tegra: dc: Extend debug stats with total number of events
>         PM / devfreq: tegra20: Convert to EMC_STAT driver, support interconnect and device-tree
>         PM / devfreq: tegra30: Support interconnect and OPPs from device-tree
>         PM / devfreq: tegra30: Separate configurations per-SoC generation
>         opp: Put interconnect paths outside of opp_table_lock
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
