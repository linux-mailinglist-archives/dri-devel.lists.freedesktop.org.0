Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A6BAE7738
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 08:37:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2F4D10E1F4;
	Wed, 25 Jun 2025 06:37:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="huAyjIfZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19D2B10E1FD
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 06:37:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A1CF74435F;
 Wed, 25 Jun 2025 06:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1750833414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I+esnPC92QAULfZGIgAZ3QzOd6HXfhWYg6eoN6cTABk=;
 b=huAyjIfZk3toBH4Nmw26kG3LYYAkJ+UiZItgRiWTzElG9qXBkNxtP9fmURR892YgK7E77t
 c7fKObbiQ4WaK5Kiys8xpBgItEfO6pH7JDPOD5e/7JKubDOa6PlVsmpr0j/dmrxvvT5rXk
 Qw/jpxwDdK9gidgx3WXFfnRZGPiizr97wEdG9X7XyX6alwsBROzurYvAC9+GjvrxWz5gSo
 U8Inp9SbrPAyXTfoXJyAxqvOCPSPogk1VkVqR5viDZSV+gXsTHrLt3CTRsjRMrePhxFlN6
 43zoUgM1eQ2ucv+Kmk3ti5EUvTiIQTujCpcav+2blo4fSaPTOdHFWeF2yWuRtQ==
Date: Wed, 25 Jun 2025 08:36:51 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Francesco Dolcini <francesco@dolcini.it>
Subject: Re: [PATCH] panel/simple-simple: Identify simple DPI panels using
 .compatible field
Message-ID: <20250625083651.0f545d44@booty>
In-Reply-To: <20250624-b4-simple-panel-regression-v1-1-a5adf92a7c17@redhat.com>
References: <20250624-b4-simple-panel-regression-v1-1-a5adf92a7c17@redhat.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvvddtiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepnfhutggrucevvghrvghsohhlihcuoehluhgtrgdrtggvrhgvshholhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedtleejjeduvddutefftdduleefudfgudeltdeuffeuudefgfdugeekgedtieehudenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdgsohhothhlihhnrdgtohhmnecukfhppedvrgdtvdemieejtdemvddtvddtmegvrgdtudemsggvgedumeelhegvjeemfeegfeemledufegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddvmeeijedtmedvtddvtdemvggrtddumegsvgegudemleehvgejmeefgeefmeeludefvgdphhgvlhhopegsohhothihpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddupdhrtghpthhtoheprghsrhhivhgrthhssehrvgguhhgrthdrtghomhdprhgtphhtthhopehnvghilhdrrghrmhhsthhrohhngheslhhinhgrrhhordhorhhgpdhrtghpthhtohepqhhuihgtpghjv
 ghsshiihhgrnhesqhhuihgtihhntgdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthh
X-GND-Sasl: luca.ceresoli@bootlin.com
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

Hello Anusha,

thanks for quickly addressing this issue!

On Tue, 24 Jun 2025 15:13:05 -0500
Anusha Srivatsa <asrivats@redhat.com> wrote:

> Currently driver is checking for desc == &panel_dpi to do the DPI
> specific panel desc allocations. This looks hacky.
> 
> The panel allocation in panel_simple_probe() breaks due to not having
> the desc for DPI scenario. This patch does the following:
> 
> - Rename panel_dpi_probe() to panel_dpi_get_desc() and call it before
> panel allocation. panel_dpi_get_desc() returns a panel desc unlike
> panel_dpi_probe() which returned an int. This way driver has a known
> connector type while allocating the panel.
> - panel_dpi_get_desc() returns a panel desc
> - Add a simple helper is_panel_dpi() to identify a simple DPI panel from
> a simple panel based on .compatible field
> 
> Fixes: de04bb0089a9 ("drm/panel/panel-simple: Use the new allocation in place of devm_kzalloc()")

Please add a mention to the discussion:
Closes: https://lore.kernel.org/all/20250612081834.GA248237@francesco-nb/

and also:
Reported-by: Francesco Dolcini <francesco@dolcini.it>

> Suggested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Suggested-by: Maxime Ripard <mripard@kernel.org>
> Cc: Francesco Dolcini <francesco@dolcini.it>
> Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> ---
> Seeing the below trace due to the changes introduced by:
> Commit de04bb0089a9 ("drm/panel/panel-simple: Use the new allocation in place of devm_kzalloc()")
> 
> [   12.089274] ------------[ cut here ]------------
> [   12.089303] WARNING: CPU: 0 PID: 96 at drivers/gpu/drm/bridge/panel.c:377 devm_drm_of_get_bridge+0xac/0xb8
> [   12.130808] Modules linked in: v4l2_jpeg pwm_imx27(+) imx_vdoa gpu_sched panel_simple imx6_media(C) imx_media_common
> (C) videobuf2_dma_contig pwm_bl gpio_keys v4l2_mem2mem fuse ipv6 autofs4
> [   12.147774] CPU: 0 UID: 0 PID: 96 Comm: kworker/u8:3 Tainted: G         C          6.16.0-rc1+ #1 PREEMPT
> [   12.157446] Tainted: [C]=CRAP
> [   12.160418] Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
> [   12.166953] Workqueue: events_unbound deferred_probe_work_func
> [   12.172805] Call trace:
> [   12.172815]  unwind_backtrace from show_stack+0x10/0x14
> [   12.180598]  show_stack from dump_stack_lvl+0x68/0x74
> [   12.185674]  dump_stack_lvl from __warn+0x7c/0xe0
> [   12.190407]  __warn from warn_slowpath_fmt+0x1b8/0x1c0
> [   12.195567]  warn_slowpath_fmt from devm_drm_of_get_bridge+0xac/0xb8
> [   12.201949]  devm_drm_of_get_bridge from imx_pd_probe+0x58/0x164
> [   12.207976]  imx_pd_probe from platform_probe+0x5c/0xb0
> [   12.213220]  platform_probe from really_probe+0xd0/0x3a4
> [   12.218551]  really_probe from __driver_probe_device+0x8c/0x1d4
> [   12.224486]  __driver_probe_device from driver_probe_device+0x30/0xc0
> [   12.230942]  driver_probe_device from __device_attach_driver+0x98/0x10c
> [   12.237572]  __device_attach_driver from bus_for_each_drv+0x90/0xe4
> [   12.243854]  bus_for_each_drv from __device_attach+0xa8/0x1c8
> [   12.249614]  __device_attach from bus_probe_device+0x88/0x8c
> [   12.255285]  bus_probe_device from deferred_probe_work_func+0x8c/0xcc
> [   12.261739]  deferred_probe_work_func from process_one_work+0x154/0x2dc
> [   12.268371]  process_one_work from worker_thread+0x250/0x3f0
> [   12.274043]  worker_thread from kthread+0x12c/0x24c
> [   12.278940]  kthread from ret_from_fork+0x14/0x28
> [   12.283660] Exception stack(0xd0be9fb0 to 0xd0be9ff8)
> [   12.288720] 9fa0:                                     00000000 00000000 00000000 00000000
> [   12.296906] 9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> [   12.305089] 9fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> [   12.312050] ---[ end trace 0000000000000000 ]---
> ---
>  drivers/gpu/drm/panel/panel-simple.c | 38 +++++++++++++++++++++---------------
>  1 file changed, 22 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 0a3b26bb4d731c54614e24e38018c308acd5367a..2e6fd545100388a9d53183a5621e7b8fdb4148ae 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -26,6 +26,7 @@
>  #include <linux/i2c.h>
>  #include <linux/media-bus-format.h>
>  #include <linux/module.h>
> +#include <linux/of_device.h>
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
> @@ -432,8 +433,7 @@ static const struct drm_panel_funcs panel_simple_funcs = {
>  
>  static struct panel_desc panel_dpi;
>  
> -static int panel_dpi_probe(struct device *dev,
> -			   struct panel_simple *panel)
> +static struct panel_desc *panel_dpi_get_desc(struct device *dev)
>  {
>  	struct display_timing *timing;
>  	const struct device_node *np;
> @@ -445,17 +445,17 @@ static int panel_dpi_probe(struct device *dev,
>  	np = dev->of_node;
>  	desc = devm_kzalloc(dev, sizeof(*desc), GFP_KERNEL);
>  	if (!desc)
> -		return -ENOMEM;
> +		return NULL;
>  
>  	timing = devm_kzalloc(dev, sizeof(*timing), GFP_KERNEL);
>  	if (!timing)
> -		return -ENOMEM;
> +		return NULL;
>  
>  	ret = of_get_display_timing(np, "panel-timing", timing);
>  	if (ret < 0) {
>  		dev_err(dev, "%pOF: no panel-timing node found for \"panel-dpi\" binding\n",
>  			np);
> -		return ret;
> +		return NULL;
>  	}
>  
>  	desc->timings = timing;
> @@ -473,9 +473,7 @@ static int panel_dpi_probe(struct device *dev,
>  	/* We do not know the connector for the DT node, so guess it */
>  	desc->connector_type = DRM_MODE_CONNECTOR_DPI;
>  
> -	panel->desc = desc;
> -
> -	return 0;
> +	return desc;
>  }
>  
>  #define PANEL_SIMPLE_BOUNDS_CHECK(to_check, bounds, field) \
> @@ -570,6 +568,15 @@ static int panel_simple_override_nondefault_lvds_datamapping(struct device *dev,
>  	return 0;
>  }
>  
> +static bool is_panel_dpi(struct device *dev)
> +{
> +	const struct of_device_id *match;
> +
> +	match = of_match_device(dev->driver->of_match_table, dev);
> +
> +	return strcmp(match->compatible, "panel_dpi");

The compatible is panel-dpi, not panel_dpi.

> +}
> +
>  static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
>  {
>  	struct panel_simple *panel;
> @@ -579,6 +586,10 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
>  	u32 bus_flags;
>  	int err;
>  
> +	/* Is this simple panel a DPI panel */
> +	if (is_panel_dpi(dev))
> +		desc = panel_dpi_get_desc(dev);
> +
>  	panel = devm_drm_panel_alloc(dev, struct panel_simple, base,
>  				     &panel_simple_funcs, desc->connector_type);
>  	if (IS_ERR(panel))
> @@ -611,16 +622,11 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
>  			return -EPROBE_DEFER;
>  	}
>  
> -	if (desc == &panel_dpi) {
> -		/* Handle the generic panel-dpi binding */
> -		err = panel_dpi_probe(dev, panel);
> -		if (err)
> -			goto free_ddc;
> -		desc = panel->desc;
> -	} else {
> +	if (is_panel_dpi(dev))
> +		goto free_ddc;
> +	else
>  		if (!of_get_display_timing(dev->of_node, "panel-timing", &dt))
>  			panel_simple_parse_panel_timing_node(dev, panel, &dt);
> -	}

The 'else' becomes unnecessary after a 'if () goto xyz;'

With your changes you should now be able to remove both this entry in
platform_of_match:

	/* Must be the last entry */
	.compatible = "panel-dpi",
	.data = &panel_dpi,

and finally this line:

	static struct panel_desc panel_dpi;

Otherwise LGTM.

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
