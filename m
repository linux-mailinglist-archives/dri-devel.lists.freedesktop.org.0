Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DD72C7FD9
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 09:30:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 906B46E40A;
	Mon, 30 Nov 2020 08:30:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC9246E40A
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 08:30:08 +0000 (UTC)
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20201130083006epoutp036de77cd3ac92cbcaf1df4de9e40e3406~MO_Fz2n7t1530615306epoutp03N
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 08:30:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20201130083006epoutp036de77cd3ac92cbcaf1df4de9e40e3406~MO_Fz2n7t1530615306epoutp03N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1606725006;
 bh=Mt/gdIsFl1M12MFRytnwm1abg7voXmSQOUlTijrF/j0=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=c0tNLxwRL6vnJ4bVraRUOGFIW9tS1CI4ZkPOkDqhPU0HyxViSVDAN0V5iteGeupAa
 kdYvZdlaaUlnCIrY4ye0HFg38Np30JFL62smFYrzL3orB+aEsCZ5dIaLYJAEIxhykH
 pv5LR0yBMkvPcPpk1+ePrDoQyHUHYOtegcJ7lG7g=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20201130083005epcas1p480f9d22c867543847495688f7331db92~MO_E2dxFa0894908949epcas1p4p;
 Mon, 30 Nov 2020 08:30:05 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.40.156]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4Ckz1l1yvtz4x9QC; Mon, 30 Nov
 2020 08:30:03 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 BF.F7.63458.B8DA4CF5; Mon, 30 Nov 2020 17:30:03 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20201130083001epcas1p22f14f300f10546db02dc53183e8c196c~MO_BcgFtV1026010260epcas1p2r;
 Mon, 30 Nov 2020 08:30:01 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20201130083001epsmtrp12bba35f31748f0e58ac47cddc8699ce0~MO_BaMzuj3161831618epsmtrp1Y;
 Mon, 30 Nov 2020 08:30:01 +0000 (GMT)
X-AuditID: b6c32a36-6dfff7000000f7e2-a0-5fc4ad8b140e
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 B8.54.13470.98DA4CF5; Mon, 30 Nov 2020 17:30:01 +0900 (KST)
Received: from [10.113.221.102] (unknown [10.113.221.102]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20201130083001epsmtip1b15540c60c5e93579b52f1ed5fe124d5~MO_Ay9IdD3262532625epsmtip1X;
 Mon, 30 Nov 2020 08:30:01 +0000 (GMT)
Subject: Re: [PATCH v10 00/19] Introduce memory interconnect for NVIDIA
 Tegra SoCs
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Georgi
 Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>, Michael
 Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Peter
 De Schrijver <pdeschrijver@nvidia.com>, MyungJoo Ham
 <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Mikko
 Perttunen <cyndis@kapsi.fi>, Viresh Kumar <vireshk@kernel.org>, Peter Geis
 <pgwipeout@gmail.com>, Nicolas Chauvet <kwizart@gmail.com>, Krzysztof
 Kozlowski <krzk@kernel.org>
From: Chanwoo Choi <cw00.choi@samsung.com>
Organization: Samsung Electronics
Message-ID: <d12880ba-6780-cfee-7667-3723fcad9f3a@samsung.com>
Date: Mon, 30 Nov 2020 17:44:39 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:59.0) Gecko/20100101
 Thunderbird/59.0
MIME-Version: 1.0
In-Reply-To: <20201123002723.28463-1-digetx@gmail.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrOJsWRmVeSWpSXmKPExsWy7bCmvm732iPxBu9WcFq8+/SU1WL1x8eM
 Fle+vmezmL53E5tFy6xFLBbnz29gt9j6dA2TxdmmN+wWl3fNYbP43HuE0aLzyyw2i4unXC1u
 N65gs5i0diqjxdln3hate4+wW/y7tpHF4ueueSwWmx8cY3MQ9nh/o5XdY+esu+wel879YfbY
 tKqTzePOtT1sHve7jzN59Da/Y/Po27KK0ePzJrkAzqhsm4zUxJTUIoXUvOT8lMy8dFsl7+B4
 53hTMwNDXUNLC3MlhbzE3FRbJRefAF23zBygp5QUyhJzSoFCAYnFxUr6djZF+aUlqQoZ+cUl
 tkqpBSk5BZYFesWJucWleel6yfm5VoYGBkamQIUJ2Rl/W66zFuwxrzh7YRNLA+NyzS5GTg4J
 AROJb3NXsnUxcnEICexglHjxaB4LhPOJUeLJtm4o5xujxOydF9lgWtZvXMUKkdjLKPFtRxMj
 hPOeUWLJ7DUsIFXCAiESd/+8BqsSEbjJIrF8xT+gdg4OZoEqiU1/vEFq2AS0JPa/uAE2lV9A
 UeLqj8eMIDavgJ1E45QTTCA2i4CqxK8ri8FsUYEwiZPbWqBqBCVOznwCtotTwEzi5+GjYDaz
 gLjErSfzmSBseYntb+cwg9wgIdDPKXFpyj9miBdcJFbNmghlC0u8Or6FHcKWknjZ3wZlV0us
 PHmEDaK5g1Fiy/4LrBAJY4n9SyczQTyjKbF+lz5EWFFi5++5jBCL+STefe1hBSmREOCV6GgT
 gihRlrj84C4ThC0psbi9k20Co9IsJO/MQvLCLCQvzEJYtoCRZRWjWGpBcW56arFhgRFydG9i
 BKd4LbMdjJPeftA7xMjEwXiIUYKDWUmEN4PjYLwQb0piZVVqUX58UWlOavEhRlNgAE9klhJN
 zgdmmbySeENTI2NjYwsTQzNTQ0Mlcd4/2h3xQgLpiSWp2ampBalFMH1MHJxSDUxy7tfXVRZO
 WnV33a2YCY8PpxXIeaUHpHDlf0t8sPNSeM2JlYltSoX/7OpOFv588HK1x8PJ3w/t6Z2p+LVv
 RV3kR6sj08MPCD+rMDgZ5/84QXi3YoWLbv724vh9W7TfxKiFla75tm/JvG92qUs/3ZV+n7h+
 tWD8tdQK5aMBWxdaC9xfU7H9bc2DLoaIhmvbg06yrNZ48Nq0aPKFAnvvu4wRix5n7zyuNtvn
 v2bB+bu257+yxYkzCr6J1vM8Zbq479OKyyUNtbF2D1p/3DGSm9xtzr9lxezgtZ8yVmz4lvjh
 07En2xiilibbTbiX9Izv0yNzGT22nq9mNUEC6aF7pXqeyc+Rt3XSF9lRK/a6572KEktxRqKh
 FnNRcSIAjXo+K3oEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRmVeSWpSXmKPExsWy7bCSnG7n2iPxBque6Vi8+/SU1WL1x8eM
 Fle+vmezmL53E5tFy6xFLBbnz29gt9j6dA2TxdmmN+wWl3fNYbP43HuE0aLzyyw2i4unXC1u
 N65gs5i0diqjxdln3hate4+wW/y7tpHF4ueueSwWmx8cY3MQ9nh/o5XdY+esu+wel879YfbY
 tKqTzePOtT1sHve7jzN59Da/Y/Po27KK0ePzJrkAzigum5TUnMyy1CJ9uwSujL8t11kL9phX
 nL2wiaWBcblmFyMnh4SAicT6jatYQWwhgd2MEhPfWEPEJSWmXTzK3MXIAWQLSxw+XNzFyAVU
 8pZRYun5JrB6YYEQiWk3PjGDJEQE7rJITPpxiw0kwSxQJbFw7WI2iI5ORon2hqOMIAk2AS2J
 /S9ugBXxCyhKXP3xGCzOK2An0TjlBBOIzSKgKvHrymIwW1QgTGLnksdMEDWCEidnPmEBsTkF
 zCR+Hj7KArFMXeLPvEvMELa4xK0n85kgbHmJ7W/nME9gFJ6FpH0WkpZZSFpmIWlZwMiyilEy
 taA4Nz232LDAMC+1XK84Mbe4NC9dLzk/dxMjONa1NHcwbl/1Qe8QIxMH4yFGCQ5mJRHeDI6D
 8UK8KYmVValF+fFFpTmpxYcYpTlYlMR5bxQujBMSSE8sSc1OTS1ILYLJMnFwSjUwJQrLxCjf
 2mfh4JjsG2A2IfRLBpu+XduNphWrtW45y59/nTsnVGKOsKWPa6NY2Z/k+Gb2sy0iXzbHPLg9
 5ew9i4sn3f6pG7xp2iL31iIy3eSe1OcXhb8+HvmywSx3o+Hq/cz5ZbG/LYWTNHT+v1jecXnn
 j1krpIMr56lauH/xNbxq0Fl7+tg9Zseij6fSn/AWLQ9alFfTsOuHhrGkrPTT3ubFTrKzjRKe
 yJ/LSL/hGcd/Sm2h6c0vvB2lGd9WbxVk22xxuGHNJq8Qf446Q1n1rHfMYuuf//W5bzn9S9cZ
 +Qh+2cyUOfN4NWI0mOJ9L5RUHfmxJDE12mDT0anl/5T3t9yXPDttsY7d/DMGPySVWIozEg21
 mIuKEwGzxjm4ZAMAAA==
X-CMS-MailID: 20201130083001epcas1p22f14f300f10546db02dc53183e8c196c
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20201123003254epcas1p1763e1ce693d7cb8e2f20d521e701ad5f
References: <CGME20201123003254epcas1p1763e1ce693d7cb8e2f20d521e701ad5f@epcas1p1.samsung.com>
 <20201123002723.28463-1-digetx@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

The v5.10-rc6 was released from linus git tree.
Generally, I will send the pull-quest about devfreq to linux-pm.git maintainer
after releasing the v5.1-rc7 for the integration test on linux-pm.git.

The icc patches in this patch have not yet merged. If these patches
are not merged before v5.10-rc7, Maybe, I'll apply the devfreq patches
for v5.12-rc1.

Best Regards,
Chanwoo Choi


On 11/23/20 9:27 AM, Dmitry Osipenko wrote:
> This series brings initial support for memory interconnect to Tegra20,
> Tegra30 and Tegra124 SoCs.
> 
> For the starter only display controllers and devfreq devices are getting
> interconnect API support, others could be supported later on. The display
> controllers have the biggest demand for interconnect API right now because
> dynamic memory frequency scaling can't be done safely without taking into
> account bandwidth requirement from the displays. In particular this series
> fixes distorted display output on T30 Ouya and T124 TK1 devices.
> 
> Changelog:
> 
> v10 - In a longer run it will be much nicer if we could support EMC
>       hardware versioning on Tegra20 and it's not late to support it now.
>       Hence I added these new patches:
> 
>         dt-bindings: memory: tegra20: emc: Document opp-supported-hw property
>         memory: tegra20: Support hardware versioning and clean up OPP table initialization
> 
>     - Removed error message from tegra30-devfreq driver about missing OPP
>       properties in a device-tree because EMC driver already prints that
>       message and it uses OPP API error code instead of checking DT directly,
>       which is a more correct way of doing that.
> 
> v9: - Squashed "memory: tegra30-emc: Factor out clk initialization" into
>       patch "tegra30: Support interconnect framework".
>       Suggested by Krzysztof Kozlowski.
> 
>     - Improved Kconfig in the patch "memory: tegra124-emc: Make driver modular"
>       by adding CONFIG_TEGRA124_CLK_EMC entry, which makes clk-driver changes
>       to look a bit more cleaner. Suggested by Krzysztof Kozlowski.
> 
>     - Dropped voltage regulator support from ICC and DT patches for now
>       because there is a new discussion about using a power domain abstraction
>       for controlling the regulator, which is likely to happen.
> 
>     - Replaced direct "operating-points-v2" property checking in EMC drivers
>       with checking of a returned error code from dev_pm_opp_of_add_table().
>       Note that I haven't touched T20 EMC driver because it's very likely
>       that we'll replace that code with a common helper soon anyways.
>       Suggested by Viresh Kumar.
> 
>     - The T30 DT patches now include EMC OPP changes for Ouya board, which
>       is available now in linux-next.
> 
> Dmitry Osipenko (19):
>   dt-bindings: memory: tegra20: emc: Document opp-supported-hw property
>   memory: tegra20: Support hardware versioning and clean up OPP table
>     initialization
>   memory: tegra30: Support interconnect framework
>   memory: tegra124-emc: Make driver modular
>   memory: tegra124-emc: Continue probing if timings are missing in
>     device-tree
>   memory: tegra124: Support interconnect framework
>   drm/tegra: dc: Support memory bandwidth management
>   drm/tegra: dc: Extend debug stats with total number of events
>   PM / devfreq: tegra30: Support interconnect and OPPs from device-tree
>   PM / devfreq: tegra30: Separate configurations per-SoC generation
>   PM / devfreq: tegra20: Deprecate in a favor of emc-stat based driver
>   ARM: tegra: Correct EMC registers size in Tegra20 device-tree
>   ARM: tegra: Add interconnect properties to Tegra20 device-tree
>   ARM: tegra: Add interconnect properties to Tegra30 device-tree
>   ARM: tegra: Add interconnect properties to Tegra124 device-tree
>   ARM: tegra: Add nvidia,memory-controller phandle to Tegra20 EMC
>     device-tree
>   ARM: tegra: Add EMC OPP properties to Tegra20 device-trees
>   ARM: tegra: Add EMC OPP and ICC properties to Tegra30 EMC and ACTMON
>     device-tree nodes
>   ARM: tegra: Add EMC OPP and ICC properties to Tegra124 EMC and ACTMON
>     device-tree nodes
> 
>  .../memory-controllers/nvidia,tegra20-emc.txt |   6 +
>  MAINTAINERS                                   |   1 -
>  arch/arm/boot/dts/tegra124-apalis-emc.dtsi    |   8 +
>  .../arm/boot/dts/tegra124-jetson-tk1-emc.dtsi |   8 +
>  arch/arm/boot/dts/tegra124-nyan-big-emc.dtsi  |  10 +
>  .../arm/boot/dts/tegra124-nyan-blaze-emc.dtsi |  10 +
>  .../boot/dts/tegra124-peripherals-opp.dtsi    | 419 ++++++++++++++++++
>  arch/arm/boot/dts/tegra124.dtsi               |  31 ++
>  .../boot/dts/tegra20-acer-a500-picasso.dts    |   5 +
>  arch/arm/boot/dts/tegra20-colibri.dtsi        |   4 +
>  arch/arm/boot/dts/tegra20-paz00.dts           |   4 +
>  .../arm/boot/dts/tegra20-peripherals-opp.dtsi | 109 +++++
>  arch/arm/boot/dts/tegra20.dtsi                |  33 +-
>  ...30-asus-nexus7-grouper-memory-timings.dtsi |  12 +
>  arch/arm/boot/dts/tegra30-ouya.dts            |   8 +
>  .../arm/boot/dts/tegra30-peripherals-opp.dtsi | 383 ++++++++++++++++
>  arch/arm/boot/dts/tegra30.dtsi                |  33 +-
>  drivers/clk/tegra/Kconfig                     |   3 +
>  drivers/clk/tegra/Makefile                    |   2 +-
>  drivers/clk/tegra/clk-tegra124-emc.c          |  41 +-
>  drivers/clk/tegra/clk-tegra124.c              |  26 +-
>  drivers/clk/tegra/clk.h                       |  18 +-
>  drivers/devfreq/Kconfig                       |  10 -
>  drivers/devfreq/Makefile                      |   1 -
>  drivers/devfreq/tegra20-devfreq.c             | 210 ---------
>  drivers/devfreq/tegra30-devfreq.c             | 147 +++---
>  drivers/gpu/drm/tegra/Kconfig                 |   1 +
>  drivers/gpu/drm/tegra/dc.c                    | 359 +++++++++++++++
>  drivers/gpu/drm/tegra/dc.h                    |  19 +
>  drivers/gpu/drm/tegra/drm.c                   |  14 +
>  drivers/gpu/drm/tegra/hub.c                   |   3 +
>  drivers/gpu/drm/tegra/plane.c                 | 121 +++++
>  drivers/gpu/drm/tegra/plane.h                 |  15 +
>  drivers/memory/tegra/Kconfig                  |   5 +-
>  drivers/memory/tegra/tegra124-emc.c           | 377 ++++++++++++++--
>  drivers/memory/tegra/tegra124.c               |  82 +++-
>  drivers/memory/tegra/tegra20-emc.c            |  48 +-
>  drivers/memory/tegra/tegra30-emc.c            | 344 +++++++++++++-
>  drivers/memory/tegra/tegra30.c                | 173 +++++++-
>  include/linux/clk/tegra.h                     |   8 +
>  include/soc/tegra/emc.h                       |  16 -
>  41 files changed, 2725 insertions(+), 402 deletions(-)
>  create mode 100644 arch/arm/boot/dts/tegra124-peripherals-opp.dtsi
>  create mode 100644 arch/arm/boot/dts/tegra20-peripherals-opp.dtsi
>  create mode 100644 arch/arm/boot/dts/tegra30-peripherals-opp.dtsi
>  delete mode 100644 drivers/devfreq/tegra20-devfreq.c
>  delete mode 100644 include/soc/tegra/emc.h
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
