Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26184459007
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 15:15:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E484D89944;
	Mon, 22 Nov 2021 14:15:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 669FE89944
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 14:15:51 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20211122141549euoutp01718b2f0e65f6e4872f093b44a7b0db3f~54_2_nUj22189221892euoutp01a
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 14:15:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20211122141549euoutp01718b2f0e65f6e4872f093b44a7b0db3f~54_2_nUj22189221892euoutp01a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1637590549;
 bh=BeZnhPIFeWbxVhAa16KWixFoZ/vCymnsKANBTfcIfT8=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=JkunEL6/uAleQLutRoc/GORyWse7MbVuNj5IBl7wjhv4P2by/+5wU/V7/017xXqDE
 GNir5NL6y1bABANi0hjmX7RCgEaDGOH7ytxUq93pZwKX4WvKUBW3rl9YK4kzdG+Yra
 CuBRYfMRrpdWc/PcQcK0Y3YBgUKCGl1rTWmugOGQ=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20211122141549eucas1p1dabdcab8104b4c1fc14b6ef651fc606c~54_2gR-sp2871328713eucas1p1G;
 Mon, 22 Nov 2021 14:15:49 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 7C.1F.10260.516AB916; Mon, 22
 Nov 2021 14:15:49 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20211122141548eucas1p2a2ea9662218a03b0496f48c54c5c4827~54_2FbyDy2616026160eucas1p2h;
 Mon, 22 Nov 2021 14:15:48 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20211122141548eusmtrp12f1303282f2d64aa26b2c6df2a44f0c6~54_2Eh_vG2128221282eusmtrp1F;
 Mon, 22 Nov 2021 14:15:48 +0000 (GMT)
X-AuditID: cbfec7f5-bf3ff70000002814-c2-619ba615c708
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 88.F0.09522.416AB916; Mon, 22
 Nov 2021 14:15:48 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20211122141548eusmtip2659847504bf359c8d6fdcaf81434ed86~54_1j0nqC1967719677eusmtip2d;
 Mon, 22 Nov 2021 14:15:48 +0000 (GMT)
Message-ID: <5e173bc6-a320-42ec-79de-0ea4c3c2b480@samsung.com>
Date: Mon, 22 Nov 2021 15:15:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.1
Subject: Re: [PATCH 1/2] drm: exynos: dsi: Convert to bridge driver
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>, Inki Dae
 <inki.dae@samsung.com>, Neil Armstrong <narmstrong@baylibre.com>, Robert
 Foss <robert.foss@linaro.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Sam Ravnborg <sam@ravnborg.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20211122070633.89219-2-jagan@amarulasolutions.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrOKsWRmVeSWpSXmKPExsWy7djPc7qiy2YnGiz6zmJxf/FnFosrX9+z
 WUy6P4HF4sumCWwWnROXsFssn7CPzeJQX7TFp1kPmS1W/NzK6MDpsfbjfVaP9zda2T1md8xk
 9Vi85yWTx51re9g87ncfZ/JYMu0qm0ffllWMARxRXDYpqTmZZalF+nYJXBm3Jq9kKrgSUdEx
 Mb2BcaNnFyMnh4SAicTskzdYuhi5OIQEVjBKfPjXxAjhfGGU2Lv8JyuE85lR4vfD9+wwLYe/
 74JKLGeUeHlyPzuE85FR4u2lR0DDODh4Bewk/s2VBmlgEVCVWPjwBCOIzSsgKHFy5hMWEFtU
 IEnidOskZhBbWMBZ4si7ZWA1zALiEreezGcCmSkisIRJ4vjS+8wQCXeJp2+2gdlsAoYSXW+7
 2EBsTgEHicVzHrJD1MhLNG+dzQzSLCHQzCnRdeQvE8TZLhKNj36zQtjCEq+Ob4F6R0bi9OQe
 FqgGRomH59ayQzg9jBKXm2YwQlRZS9w594sN5DVmAU2J9bv0IcKOElsmL2ICCUsI8EnceCsI
 cQSfxKRt05khwrwSHW1CENVqErOOr4Nbe/DCJeYJjEqzkMJlFpL/ZyF5ZxbC3gWMLKsYxVNL
 i3PTU4uN81LL9YoTc4tL89L1kvNzNzEC09bpf8e/7mBc8eqj3iFGJg7GQ4wSHMxKIrzXlsxO
 FOJNSaysSi3Kjy8qzUktPsQozcGiJM4r8qchUUggPbEkNTs1tSC1CCbLxMEp1cAkyxG7SHyf
 1MeZRy92v2VhkVio+jn3+edtjufytil5q1eLRxbwLkvU2ruzWt52cpVk+JFqcYNNXxNPbnv9
 J0yRXULqSGoSd6W1/s2J3535RWe0la8P661bxKLgNnXtq1ADSZNf7YsfXF14OFz+x3KtoL0e
 7NYp3Pf9nvOo8cUmzGJQFG9aoVN/9dScJysk3Da81pdfkM/MPevwW8UH/Uu3zuJkqGe5IN/1
 m8Nffksj1/7tVhvXPT3QcY9d+FeUnKLrd6ZlD+d5KIT49j/8kpy44lJM7u8jK049exVa9Ppp
 4T5Nhr1Z1ucs8p5fX773yo36u5eXOpSxh1SrLi98EmBnvMiU0VPpO3v4lynlCquVWIozEg21
 mIuKEwGk0XNFygMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrJIsWRmVeSWpSXmKPExsVy+t/xe7oiy2YnGuyYo25xf/FnFosrX9+z
 WUy6P4HF4sumCWwWnROXsFssn7CPzeJQX7TFp1kPmS1W/NzK6MDpsfbjfVaP9zda2T1md8xk
 9Vi85yWTx51re9g87ncfZ/JYMu0qm0ffllWMARxRejZF+aUlqQoZ+cUltkrRhhZGeoaWFnpG
 JpZ6hsbmsVZGpkr6djYpqTmZZalF+nYJehm3Jq9kKrgSUdExMb2BcaNnFyMnh4SAicTh77tY
 uxi5OIQEljJKPO1pZoVIyEicnNYAZQtL/LnWxQZR9J5RYsHTPUAJDg5eATuJf3OlQWpYBFQl
 Fj48wQhi8woISpyc+YQFxBYVSJLo/76LGcQWFnCWOPJuGVgNs4C4xK0n85lAZooILGGSeD5/
 ClTCXeLpm23MEMtOMkr8WL8UrJtNwFCi6y3IFZwcnAIOEovnPGSHaDCT6NraBdUsL9G8dTbz
 BEahWUgOmYVk4SwkLbOQtCxgZFnFKJJaWpybnltsqFecmFtcmpeul5yfu4kRGKfbjv3cvINx
 3quPeocYmTgYDzFKcDArifBeWzI7UYg3JbGyKrUoP76oNCe1+BCjKTA0JjJLiSbnAxNFXkm8
 oZmBqaGJmaWBqaWZsZI4r2dBR6KQQHpiSWp2ampBahFMHxMHp1QDU9UCj1aBts6Ss1uPThSp
 UxLz+HTQxbTzDs/U5n63sznF8znFdl96lNZ9Tt7E70Dekj2N17aapvK1PPOpZ436YBLwLjqz
 4YPUqX9tQXWcs7eXB4VaHC2+9e7Dt4WOxadVjgs9VsyUsWnfOXu/XlnaEckVLsFTX59ZKMEx
 81Hx9bQJfcnX5qzPThN6cO3xUTZ2Uzl1z/OqAmKv8jiebUxeG8roGG+xNuq8uIlKW8M8HYUz
 ZwTiHZZMurB/ttqbJOnbpitj++2XN3wP0lXfddxkUivPvvYdohwn16Z4hWc5+T7rlWGY5tbR
 Myuw6vY6o12aGc12yq4HvU/unxV/+ZhMr5EB8znpqZLbuN1t1u9RYinOSDTUYi4qTgQAr9FS
 U1wDAAA=
X-CMS-MailID: 20211122141548eucas1p2a2ea9662218a03b0496f48c54c5c4827
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20211122070651eucas1p1d505c9d2041501898d4f3b1f277e2599
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20211122070651eucas1p1d505c9d2041501898d4f3b1f277e2599
References: <20211122070633.89219-1-jagan@amarulasolutions.com>
 <CGME20211122070651eucas1p1d505c9d2041501898d4f3b1f277e2599@eucas1p1.samsung.com>
 <20211122070633.89219-2-jagan@amarulasolutions.com>
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
Cc: linux-amarula@amarulasolutions.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22.11.2021 08:06, Jagan Teki wrote:
> Some display panels would come up with a non-DSI output, those
> can have an option to connect the DSI host by means of interface
> bridge converter.
>
> This DSI to non-DSI interface bridge converter would requires
> DSI Host to handle drm bridge functionalities in order to DSI
> Host to Interface bridge.
>
> This patch convert the existing to a drm bridge driver with a
> built-in encoder support for compatibility with existing
> component drivers.
>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Note:
> Hi Marek Szyprowski,
>
> Please test this on Panel and Bridge hardware.

I don't have good news, t crashes:

[drm] Exynos DRM: using 13800000.decon device for DMA mapping operations
exynos-drm exynos-drm: bound 13800000.decon (ops decon_component_ops)
exynos-drm exynos-drm: bound 13880000.decon (ops decon_component_ops)
exynos-drm exynos-drm: bound 13930000.mic (ops exynos_mic_component_ops)
[drm:drm_bridge_attach] *ERROR* failed to attach bridge 
/soc@0/dsi@13900000 to encoder TMDS-67: -22
exynos-drm exynos-drm: failed to bind 13900000.dsi (ops 
exynos_dsi_component_ops): -22
Internal error: synchronous external abort: 96000210 [#1] PREEMPT SMP
Modules linked in:
CPU: 2 PID: 74 Comm: kworker/u16:1 Not tainted 5.16.0-rc1+ #4141
Hardware name: Samsung TM2E board (DT)
Workqueue: events_unbound deferred_probe_work_func
pstate: 80000005 (Nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : decon_atomic_disable+0x58/0xd4
lr : decon_atomic_disable+0x28/0xd4
sp : ffff80001390b940
x29: ffff80001390b940 x28: ffff80001259a000 x27: ffff000027f39e80
input: stmfts as 
/devices/platform/soc@0/14ed0000.hsi2c/i2c-3/3-0049/input/input0
x26: 00000000ffffffea x25: ffff000025a40280 x24: 0000000000000001
x23: ffff800011b55f98 x22: ffff0000315dc000 x21: ffff00002695d100
x20: ffff000027e7a080 x19: ffff0000315e6000 x18: 0000000000000000
x17: 645f736f6e797865 x16: 2073706f28206973 x15: 0000000000028ee0
x14: 0000000000000028 x13: 0000000000000001 x12: 0000000000000040
x11: ffff000023c18920 x10: ffff000023c18922 x9 : ffff8000126352f0
x8 : ffff000023c00270 x7 : 0000000000000000 x6 : ffff000023c00268
x5 : ffff000027e7a3a0 x4 : 0000000000000001 x3 : ffff000027e7a080
x2 : 0000000000000024 x1 : ffff800013bc8024 x0 : ffff0000246117c0
Call trace:
  decon_atomic_disable+0x58/0xd4
  decon_unbind+0x1c/0x3c
  component_unbind+0x38/0x60
  component_bind_all+0x16c/0x25c
  exynos_drm_bind+0x104/0x1bc
  try_to_bring_up_master+0x164/0x1d0
  __component_add+0xa8/0x174
  component_add+0x14/0x20
  hdmi_probe+0x438/0x710
  platform_probe+0x68/0xe0
  really_probe.part.0+0x9c/0x31c
  __driver_probe_device+0x98/0x144
  driver_probe_device+0xc8/0x160
  __device_attach_driver+0xb8/0x120
  bus_for_each_drv+0x78/0xd0
  __device_attach+0xd8/0x180
  device_initial_probe+0x14/0x20
  bus_probe_device+0x9c/0xa4
  deferred_probe_work_func+0x88/0xc4
  process_one_work+0x288/0x6f0
  worker_thread+0x74/0x470
  kthread+0x188/0x194
  ret_from_fork+0x10/0x20
Code: 11002042 f9481c61 531e7442 8b020021 (88dffc21)
---[ end trace d73aff585b108954 ]---
Kernel panic - not syncing: synchronous external abort: Fatal exception
SMP: stopping secondary CPUs
Kernel Offset: disabled
CPU features: 0x2,300071c2,00000846
Memory Limit: none
---[ end Kernel panic - not syncing: synchronous external abort: Fatal 
exception ]---

I will try to debug it a bit more once I find some spare time. I've 
applied only the first patch.

>   drivers/gpu/drm/exynos/exynos_drm_dsi.c | 73 +++++++++++++++++--------
>   1 file changed, 51 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index 8d137857818c..174590f543c3 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -257,6 +257,7 @@ struct exynos_dsi {
>   	struct drm_connector connector;
>   	struct drm_panel *panel;
>   	struct list_head bridge_chain;
> +	struct drm_bridge bridge;
>   	struct drm_bridge *out_bridge;
>   	struct device *dev;
>   
> @@ -287,9 +288,9 @@ struct exynos_dsi {
>   #define host_to_dsi(host) container_of(host, struct exynos_dsi, dsi_host)
>   #define connector_to_dsi(c) container_of(c, struct exynos_dsi, connector)
>   
> -static inline struct exynos_dsi *encoder_to_dsi(struct drm_encoder *e)
> +static inline struct exynos_dsi *bridge_to_dsi(struct drm_bridge *b)
>   {
> -	return container_of(e, struct exynos_dsi, encoder);
> +	return container_of(b, struct exynos_dsi, bridge);
>   }
>   
>   enum reg_idx {
> @@ -1374,9 +1375,10 @@ static void exynos_dsi_unregister_te_irq(struct exynos_dsi *dsi)
>   	}
>   }
>   
> -static void exynos_dsi_enable(struct drm_encoder *encoder)
> +static void exynos_dsi_atomic_enable(struct drm_bridge *bridge,
> +				     struct drm_bridge_state *old_bridge_state)
>   {
> -	struct exynos_dsi *dsi = encoder_to_dsi(encoder);
> +	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
>   	struct drm_bridge *iter;
>   	int ret;
>   
> @@ -1399,7 +1401,8 @@ static void exynos_dsi_enable(struct drm_encoder *encoder)
>   		list_for_each_entry_reverse(iter, &dsi->bridge_chain,
>   					    chain_node) {
>   			if (iter->funcs->pre_enable)
> -				iter->funcs->pre_enable(iter);
> +				iter->funcs->atomic_pre_enable(iter,
> +							       old_bridge_state);
>   		}
>   	}
>   
> @@ -1413,7 +1416,7 @@ static void exynos_dsi_enable(struct drm_encoder *encoder)
>   	} else {
>   		list_for_each_entry(iter, &dsi->bridge_chain, chain_node) {
>   			if (iter->funcs->enable)
> -				iter->funcs->enable(iter);
> +				iter->funcs->atomic_enable(iter, old_bridge_state);
>   		}
>   	}
>   
> @@ -1429,9 +1432,10 @@ static void exynos_dsi_enable(struct drm_encoder *encoder)
>   	pm_runtime_put(dsi->dev);
>   }
>   
> -static void exynos_dsi_disable(struct drm_encoder *encoder)
> +static void exynos_dsi_atomic_disable(struct drm_bridge *bridge,
> +				      struct drm_bridge_state *old_bridge_state)
>   {
> -	struct exynos_dsi *dsi = encoder_to_dsi(encoder);
> +	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
>   	struct drm_bridge *iter;
>   
>   	if (!(dsi->state & DSIM_STATE_ENABLED))
> @@ -1443,7 +1447,7 @@ static void exynos_dsi_disable(struct drm_encoder *encoder)
>   
>   	list_for_each_entry_reverse(iter, &dsi->bridge_chain, chain_node) {
>   		if (iter->funcs->disable)
> -			iter->funcs->disable(iter);
> +			iter->funcs->atomic_disable(iter, old_bridge_state);
>   	}
>   
>   	exynos_dsi_set_display_enable(dsi, false);
> @@ -1451,7 +1455,7 @@ static void exynos_dsi_disable(struct drm_encoder *encoder)
>   
>   	list_for_each_entry(iter, &dsi->bridge_chain, chain_node) {
>   		if (iter->funcs->post_disable)
> -			iter->funcs->post_disable(iter);
> +			iter->funcs->atomic_post_disable(iter, old_bridge_state);
>   	}
>   
>   	dsi->state &= ~DSIM_STATE_ENABLED;
> @@ -1494,9 +1498,9 @@ static const struct drm_connector_helper_funcs exynos_dsi_connector_helper_funcs
>   	.get_modes = exynos_dsi_get_modes,
>   };
>   
> -static int exynos_dsi_create_connector(struct drm_encoder *encoder)
> +static int exynos_dsi_create_connector(struct exynos_dsi *dsi)
>   {
> -	struct exynos_dsi *dsi = encoder_to_dsi(encoder);
> +	struct drm_encoder *encoder = &dsi->encoder;
>   	struct drm_connector *connector = &dsi->connector;
>   	struct drm_device *drm = encoder->dev;
>   	int ret;
> @@ -1522,9 +1526,21 @@ static int exynos_dsi_create_connector(struct drm_encoder *encoder)
>   	return 0;
>   }
>   
> -static const struct drm_encoder_helper_funcs exynos_dsi_encoder_helper_funcs = {
> -	.enable = exynos_dsi_enable,
> -	.disable = exynos_dsi_disable,
> +static int exynos_dsi_attach(struct drm_bridge *bridge,
> +			     enum drm_bridge_attach_flags flags)
> +{
> +	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
> +
> +	return drm_bridge_attach(bridge->encoder, dsi->out_bridge, NULL, 0);
> +}
> +
> +static const struct drm_bridge_funcs exynos_dsi_bridge_funcs = {
> +	.atomic_duplicate_state	= drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state	= drm_atomic_helper_bridge_destroy_state,
> +	.atomic_reset		= drm_atomic_helper_bridge_reset,
> +	.atomic_enable		= exynos_dsi_atomic_enable,
> +	.atomic_disable		= exynos_dsi_atomic_disable,
> +	.attach			= exynos_dsi_attach,
>   };
>   
>   MODULE_DEVICE_TABLE(of, exynos_dsi_of_match);
> @@ -1543,7 +1559,7 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
>   		dsi->out_bridge = out_bridge;
>   		list_splice_init(&encoder->bridge_chain, &dsi->bridge_chain);
>   	} else {
> -		int ret = exynos_dsi_create_connector(encoder);
> +		int ret = exynos_dsi_create_connector(dsi);
>   
>   		if (ret) {
>   			DRM_DEV_ERROR(dsi->dev,
> @@ -1596,7 +1612,7 @@ static int exynos_dsi_host_detach(struct mipi_dsi_host *host,
>   
>   	if (dsi->panel) {
>   		mutex_lock(&drm->mode_config.mutex);
> -		exynos_dsi_disable(&dsi->encoder);
> +		exynos_dsi_atomic_disable(&dsi->bridge, NULL);
>   		dsi->panel = NULL;
>   		dsi->connector.status = connector_status_disconnected;
>   		mutex_unlock(&drm->mode_config.mutex);
> @@ -1702,12 +1718,16 @@ static int exynos_dsi_bind(struct device *dev, struct device *master,
>   
>   	drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_TMDS);
>   
> -	drm_encoder_helper_add(encoder, &exynos_dsi_encoder_helper_funcs);
> -
>   	ret = exynos_drm_set_possible_crtcs(encoder, EXYNOS_DISPLAY_TYPE_LCD);
>   	if (ret < 0)
>   		return ret;
>   
> +	ret = drm_bridge_attach(&dsi->encoder, &dsi->bridge, NULL, 0);
> +	if (ret) {
> +		drm_encoder_cleanup(&dsi->encoder);
> +		return ret;
> +	}
> +
>   	in_bridge_node = of_graph_get_remote_node(dev->of_node, DSI_PORT_IN, 0);
>   	if (in_bridge_node) {
>   		in_bridge = of_drm_find_bridge(in_bridge_node);
> @@ -1723,10 +1743,9 @@ static void exynos_dsi_unbind(struct device *dev, struct device *master,
>   				void *data)
>   {
>   	struct exynos_dsi *dsi = dev_get_drvdata(dev);
> -	struct drm_encoder *encoder = &dsi->encoder;
> -
> -	exynos_dsi_disable(encoder);
>   
> +	exynos_dsi_atomic_disable(&dsi->bridge, NULL);
> +	drm_encoder_cleanup(&dsi->encoder);
>   	mipi_dsi_host_unregister(&dsi->dsi_host);
>   }
>   
> @@ -1819,6 +1838,12 @@ static int exynos_dsi_probe(struct platform_device *pdev)
>   
>   	pm_runtime_enable(dev);
>   
> +	dsi->bridge.funcs = &exynos_dsi_bridge_funcs;
> +	dsi->bridge.of_node = dev->of_node;
> +	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
> +
> +	drm_bridge_add(&dsi->bridge);
> +
>   	ret = component_add(dev, &exynos_dsi_component_ops);
>   	if (ret)
>   		goto err_disable_runtime;
> @@ -1833,6 +1858,10 @@ static int exynos_dsi_probe(struct platform_device *pdev)
>   
>   static int exynos_dsi_remove(struct platform_device *pdev)
>   {
> +	struct exynos_dsi *dsi = platform_get_drvdata(pdev);
> +
> +	drm_bridge_remove(&dsi->bridge);
> +
>   	pm_runtime_disable(&pdev->dev);
>   
>   	component_del(&pdev->dev, &exynos_dsi_component_ops);

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

