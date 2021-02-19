Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C707531F7EF
	for <lists+dri-devel@lfdr.de>; Fri, 19 Feb 2021 12:10:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 932A36E027;
	Fri, 19 Feb 2021 11:10:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA7746E027
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Feb 2021 11:10:01 +0000 (UTC)
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi
 [91.157.208.71])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B1381344;
 Fri, 19 Feb 2021 12:09:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1613733000;
 bh=9V5Dfq2l+D0NFK2fgvUyFDCxgq4qpHz6bmFbFxnCMyc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=oSeApiC5nLeOOCYOdr6UQh/r2iQOpkvttdNx2FJBXrFdgWKhXQzGbtSqon7mss3gh
 6ncfsXJq7eL+as+INHMrKE/wPhL2wTYONPXiB0QU4ynip9PnjKGBeGXAbYjuU49Mev
 VQ/P5pGqCf8GKlpjF19Q+r4nuS4dfNtjBP1H/4zE=
Subject: Re: [PATCH 4/5] drm/omap: hdmi5: add CEC support
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org
References: <20210211103703.444625-1-hverkuil-cisco@xs4all.nl>
 <20210211103703.444625-5-hverkuil-cisco@xs4all.nl>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Autocrypt: addr=tomi.valkeinen@ideasonboard.com; keydata=
 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
Message-ID: <e1bb64ac-f7df-f839-9449-990f9b918aca@ideasonboard.com>
Date: Fri, 19 Feb 2021 13:09:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210211103703.444625-5-hverkuil-cisco@xs4all.nl>
Content-Language: en-US
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
Cc: Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
 Sekhar Nori <nsekhar@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hans,

On 11/02/2021 12:37, Hans Verkuil wrote:
> Add HDMI CEC support for OMAP5.
> 
> Many thanks to Tomi for helping out how to enable CEC for omap5.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> Thanks-to: Tomi Valkeinen <tomi.valkeinen@iki.fi>
> ---
>  drivers/gpu/drm/omapdrm/dss/Kconfig      |   8 +
>  drivers/gpu/drm/omapdrm/dss/Makefile     |   1 +
>  drivers/gpu/drm/omapdrm/dss/hdmi.h       |   1 +
>  drivers/gpu/drm/omapdrm/dss/hdmi5.c      |  63 +++++--
>  drivers/gpu/drm/omapdrm/dss/hdmi5_cec.c  | 201 +++++++++++++++++++++++
>  drivers/gpu/drm/omapdrm/dss/hdmi5_cec.h  |  42 +++++
>  drivers/gpu/drm/omapdrm/dss/hdmi5_core.c |  28 +++-
>  drivers/gpu/drm/omapdrm/dss/hdmi5_core.h |  33 +++-
>  8 files changed, 358 insertions(+), 19 deletions(-)
>  create mode 100644 drivers/gpu/drm/omapdrm/dss/hdmi5_cec.c
>  create mode 100644 drivers/gpu/drm/omapdrm/dss/hdmi5_cec.h
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/Kconfig b/drivers/gpu/drm/omapdrm/dss/Kconfig
> index e11b258a2294..67a1ba14703b 100644
> --- a/drivers/gpu/drm/omapdrm/dss/Kconfig
> +++ b/drivers/gpu/drm/omapdrm/dss/Kconfig
> @@ -83,6 +83,14 @@ config OMAP5_DSS_HDMI
>  	  Definition Multimedia Interface. See https://www.hdmi.org/ for HDMI
>  	  specification.
>  
> +config OMAP5_DSS_HDMI_CEC
> +	bool "Enable HDMI CEC support for OMAP5"
> +	depends on OMAP5_DSS_HDMI
> +	select CEC_CORE
> +	default y
> +	help
> +	  When selected the HDMI transmitter will support the CEC feature.
> +
>  config OMAP2_DSS_SDI
>  	bool "SDI support"
>  	default n
> diff --git a/drivers/gpu/drm/omapdrm/dss/Makefile b/drivers/gpu/drm/omapdrm/dss/Makefile
> index f967e6948f2e..94fe0fa3b3c2 100644
> --- a/drivers/gpu/drm/omapdrm/dss/Makefile
> +++ b/drivers/gpu/drm/omapdrm/dss/Makefile
> @@ -17,4 +17,5 @@ omapdss-$(CONFIG_OMAP2_DSS_HDMI_COMMON) += hdmi_common.o hdmi_wp.o hdmi_pll.o \
>  omapdss-$(CONFIG_OMAP4_DSS_HDMI) += hdmi4.o hdmi4_core.o
>  omapdss-$(CONFIG_OMAP4_DSS_HDMI_CEC) += hdmi4_cec.o
>  omapdss-$(CONFIG_OMAP5_DSS_HDMI) += hdmi5.o hdmi5_core.o
> +omapdss-$(CONFIG_OMAP5_DSS_HDMI_CEC) += hdmi5_cec.o
>  ccflags-$(CONFIG_OMAP2_DSS_DEBUG) += -DDEBUG
> diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi.h b/drivers/gpu/drm/omapdrm/dss/hdmi.h
> index c4a4e07f0b99..72d8ae441da6 100644
> --- a/drivers/gpu/drm/omapdrm/dss/hdmi.h
> +++ b/drivers/gpu/drm/omapdrm/dss/hdmi.h
> @@ -261,6 +261,7 @@ struct hdmi_core_data {
>  	struct hdmi_wp_data *wp;
>  	unsigned int core_pwr_cnt;
>  	struct cec_adapter *adap;
> +	struct clk *cec_clk;
>  };
>  
>  static inline void hdmi_write_reg(void __iomem *base_addr, const u32 idx,
> diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi5.c b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
> index 54e5cb5aa52d..b674d8ba173f 100644
> --- a/drivers/gpu/drm/omapdrm/dss/hdmi5.c
> +++ b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
> @@ -29,12 +29,14 @@
>  #include <linux/of.h>
>  #include <linux/of_graph.h>
>  #include <sound/omap-hdmi-audio.h>
> +#include <media/cec.h>
>  
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_state_helper.h>
>  
>  #include "omapdss.h"
>  #include "hdmi5_core.h"
> +#include "hdmi5_cec.h"
>  #include "dss.h"
>  
>  static int hdmi_runtime_get(struct omap_hdmi *hdmi)
> @@ -104,6 +106,10 @@ static irqreturn_t hdmi_irq_handler(int irq, void *data)
>  	} else if (irqstatus & HDMI_IRQ_LINK_DISCONNECT) {
>  		hdmi_wp_set_phy_pwr(wp, HDMI_PHYPWRCMD_LDOON);
>  	}

Empty line here, please.

> +	if (irqstatus & HDMI_IRQ_CORE) {
> +		hdmi5_cec_irq(&hdmi->core);
> +		hdmi5_core_handle_irqs(&hdmi->core);
> +	}

It's a bit odd to call two functions here. Would it work if
hdmi5_core_handle_irqs() would read and clear HDMI_CORE_IH_CEC_STAT0,
and call hdmi5_cec_irq() if the stat != 0 ?

And it would be nice if hdmi5_core.c would enable and disable core
interrupt, but maybe that can be left for later if the need ever comes
to handle other interrupts than cec.

>  
>  	return IRQ_HANDLED;
>  }
> @@ -112,9 +118,12 @@ static int hdmi_power_on_core(struct omap_hdmi *hdmi)
>  {
>  	int r;
>  
> +	if (hdmi->core.core_pwr_cnt++)
> +		return 0;
> +
>  	r = regulator_enable(hdmi->vdda_reg);
>  	if (r)
> -		return r;
> +		goto err_reg_enable;
>  
>  	r = hdmi_runtime_get(hdmi);
>  	if (r)
> @@ -129,12 +138,17 @@ static int hdmi_power_on_core(struct omap_hdmi *hdmi)
>  
>  err_runtime_get:
>  	regulator_disable(hdmi->vdda_reg);
> +err_reg_enable:
> +	hdmi->core.core_pwr_cnt--;
>  
>  	return r;
>  }
>  
>  static void hdmi_power_off_core(struct omap_hdmi *hdmi)
>  {
> +	if (--hdmi->core.core_pwr_cnt)
> +		return;
> +
>  	hdmi->core_enabled = false;
>  
>  	hdmi_runtime_put(hdmi);
> @@ -168,7 +182,7 @@ static int hdmi_power_on_full(struct omap_hdmi *hdmi)
>  		pc, &hdmi_cinfo);
>  
>  	/* disable and clear irqs */
> -	hdmi_wp_clear_irqenable(&hdmi->wp, 0xffffffff);
> +	hdmi_wp_clear_irqenable(&hdmi->wp, ~HDMI_IRQ_CORE);

I guess the point here is to not touch CORE interrupt, as hdmi5_cec.c
handles that? The line below will still clear the CORE interrupt status.

>  	hdmi_wp_set_irqstatus(&hdmi->wp,
>  			hdmi_wp_get_irqstatus(&hdmi->wp));
>  
> @@ -225,7 +239,7 @@ static int hdmi_power_on_full(struct omap_hdmi *hdmi)
>  
>  static void hdmi_power_off_full(struct omap_hdmi *hdmi)
>  {
> -	hdmi_wp_clear_irqenable(&hdmi->wp, 0xffffffff);
> +	hdmi_wp_clear_irqenable(&hdmi->wp, ~HDMI_IRQ_CORE);
>  
>  	hdmi_wp_video_stop(&hdmi->wp);
>  
> @@ -273,11 +287,11 @@ static void hdmi_stop_audio_stream(struct omap_hdmi *hd)
>  	REG_FLD_MOD(hd->wp.base, HDMI_WP_SYSCONFIG, hd->wp_idlemode, 3, 2);
>  }
>  
> -static int hdmi_core_enable(struct omap_hdmi *hdmi)
> +int hdmi5_core_enable(struct omap_hdmi *hdmi)
>  {
>  	int r = 0;
>  
> -	DSSDBG("ENTER omapdss_hdmi_core_enable\n");
> +	DSSDBG("ENTER %s\n", __func__);
>  
>  	mutex_lock(&hdmi->lock);
>  
> @@ -295,9 +309,9 @@ static int hdmi_core_enable(struct omap_hdmi *hdmi)
>  	return r;
>  }
>  
> -static void hdmi_core_disable(struct omap_hdmi *hdmi)
> +void hdmi5_core_disable(struct omap_hdmi *hdmi)
>  {
> -	DSSDBG("Enter omapdss_hdmi_core_disable\n");
> +	DSSDBG("ENTER %s\n", __func__);
>  
>  	mutex_lock(&hdmi->lock);
>  
> @@ -424,6 +438,15 @@ static void hdmi5_bridge_disable(struct drm_bridge *bridge,
>  	mutex_unlock(&hdmi->lock);
>  }
>  
> +static void hdmi5_bridge_hpd_notify(struct drm_bridge *bridge,
> +				    enum drm_connector_status status)
> +{
> +	struct omap_hdmi *hdmi = drm_bridge_to_hdmi(bridge);
> +
> +	if (status == connector_status_disconnected)
> +		hdmi5_cec_set_phys_addr(&hdmi->core, NULL);
> +}
> +
>  static struct edid *hdmi5_bridge_get_edid(struct drm_bridge *bridge,
>  					  struct drm_connector *connector)
>  {
> @@ -436,7 +459,7 @@ static struct edid *hdmi5_bridge_get_edid(struct drm_bridge *bridge,
>  	need_enable = hdmi->core_enabled == false;
>  
>  	if (need_enable) {
> -		r = hdmi_core_enable(hdmi);
> +		r = hdmi5_core_enable(hdmi);
>  		if (r)
>  			return NULL;
>  	}
> @@ -460,12 +483,29 @@ static struct edid *hdmi5_bridge_get_edid(struct drm_bridge *bridge,
>  	hdmi_runtime_put(hdmi);
>  	mutex_unlock(&hdmi->lock);
>  
> +	hdmi5_cec_set_phys_addr(&hdmi->core, edid);
> +
>  	if (need_enable)
> -		hdmi_core_disable(hdmi);
> +		hdmi5_core_disable(hdmi);
>  
>  	return (struct edid *)edid;
>  }
>  
> +static int hdmi5_bridge_cec_init(struct drm_bridge *bridge,
> +				 struct drm_connector *conn)
> +{
> +	struct omap_hdmi *hdmi = drm_bridge_to_hdmi(bridge);
> +
> +	return hdmi5_cec_init(hdmi->pdev, &hdmi->core, &hdmi->wp, conn);
> +}
> +
> +static void hdmi5_bridge_cec_exit(struct drm_bridge *bridge)
> +{
> +	struct omap_hdmi *hdmi = drm_bridge_to_hdmi(bridge);
> +
> +	hdmi5_cec_uninit(&hdmi->core);
> +}
> +
>  static const struct drm_bridge_funcs hdmi5_bridge_funcs = {
>  	.attach = hdmi5_bridge_attach,
>  	.mode_set = hdmi5_bridge_mode_set,
> @@ -474,14 +514,17 @@ static const struct drm_bridge_funcs hdmi5_bridge_funcs = {
>  	.atomic_reset = drm_atomic_helper_bridge_reset,
>  	.atomic_enable = hdmi5_bridge_enable,
>  	.atomic_disable = hdmi5_bridge_disable,
> +	.hpd_notify = hdmi5_bridge_hpd_notify,
>  	.get_edid = hdmi5_bridge_get_edid,
> +	.cec_init = hdmi5_bridge_cec_init,
> +	.cec_exit = hdmi5_bridge_cec_exit,
>  };
>  
>  static void hdmi5_bridge_init(struct omap_hdmi *hdmi)
>  {
>  	hdmi->bridge.funcs = &hdmi5_bridge_funcs;
>  	hdmi->bridge.of_node = hdmi->pdev->dev.of_node;
> -	hdmi->bridge.ops = DRM_BRIDGE_OP_EDID;
> +	hdmi->bridge.ops = DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_CEC;
>  	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
>  
>  	drm_bridge_add(&hdmi->bridge);
> diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi5_cec.c b/drivers/gpu/drm/omapdrm/dss/hdmi5_cec.c
> new file mode 100644
> index 000000000000..26ef8f585b8d
> --- /dev/null
> +++ b/drivers/gpu/drm/omapdrm/dss/hdmi5_cec.c
> @@ -0,0 +1,201 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * HDMI CEC
> + *
> + * Copyright 2019 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
> + */
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/sched.h>
> +#include <linux/slab.h>
> +#include <linux/clk.h>
> +
> +#include "dss.h"
> +#include "hdmi.h"
> +#include "hdmi5_core.h"
> +#include "hdmi5_cec.h"
> +
> +static int hdmi5_cec_log_addr(struct cec_adapter *adap, u8 logical_addr)
> +{
> +	struct hdmi_core_data *core = cec_get_drvdata(adap);
> +	u8 v;
> +
> +	if (logical_addr == CEC_LOG_ADDR_INVALID) {
> +		hdmi_write_reg(core->base, HDMI_CORE_CEC_ADDR_L, 0);
> +		hdmi_write_reg(core->base, HDMI_CORE_CEC_ADDR_H, 0);

Empty line here

> +		return 0;
> +	}
> +
> +	if (logical_addr <= 7) {
> +		v = hdmi_read_reg(core->base, HDMI_CORE_CEC_ADDR_L);
> +		v |= 1 << logical_addr;
> +		hdmi_write_reg(core->base, HDMI_CORE_CEC_ADDR_L, v);
> +		v = hdmi_read_reg(core->base, HDMI_CORE_CEC_ADDR_H);
> +		v |= 1 << 7;
> +		hdmi_write_reg(core->base, HDMI_CORE_CEC_ADDR_H, v);
> +	} else {
> +		v = hdmi_read_reg(core->base, HDMI_CORE_CEC_ADDR_H);
> +		v |= 1 << (logical_addr - 8);
> +		v |= 1 << 7;
> +		hdmi_write_reg(core->base, HDMI_CORE_CEC_ADDR_H, v);
> +	}
> +
> +	return 0;
> +}
> +
> +static int hdmi5_cec_transmit(struct cec_adapter *adap, u8 attempts,
> +			      u32 signal_free_time, struct cec_msg *msg)
> +{
> +	struct hdmi_core_data *core = cec_get_drvdata(adap);
> +	unsigned int i, ctrl;
> +
> +	switch (signal_free_time) {
> +	case CEC_SIGNAL_FREE_TIME_RETRY:
> +		ctrl = CEC_CTRL_RETRY;
> +		break;
> +	case CEC_SIGNAL_FREE_TIME_NEW_INITIATOR:
> +	default:
> +		ctrl = CEC_CTRL_NORMAL;
> +		break;
> +	case CEC_SIGNAL_FREE_TIME_NEXT_XFER:
> +		ctrl = CEC_CTRL_IMMED;
> +		break;
> +	}
> +
> +	for (i = 0; i < msg->len; i++)
> +		hdmi_write_reg(core->base,
> +			       HDMI_CORE_CEC_TX_DATA0 + i * 4, msg->msg[i]);
> +
> +	hdmi_write_reg(core->base, HDMI_CORE_CEC_TX_CNT, msg->len);
> +	hdmi_write_reg(core->base, HDMI_CORE_CEC_CTRL,
> +		       ctrl | CEC_CTRL_START);
> +
> +	return 0;
> +}
> +
> +void hdmi5_cec_irq(struct hdmi_core_data *core)
> +{
> +	struct cec_adapter *adap = core->adap;
> +	unsigned int stat = hdmi_read_reg(core->base, HDMI_CORE_IH_CEC_STAT0);
> +
> +	if (stat == 0)
> +		return;
> +
> +	hdmi_write_reg(core->base, HDMI_CORE_IH_CEC_STAT0, stat);
> +
> +	if (stat & CEC_STAT_ERROR_INIT)
> +		cec_transmit_attempt_done(adap, CEC_TX_STATUS_ERROR);
> +	else if (stat & CEC_STAT_DONE)
> +		cec_transmit_attempt_done(adap, CEC_TX_STATUS_OK);
> +	else if (stat & CEC_STAT_NACK)
> +		cec_transmit_attempt_done(adap, CEC_TX_STATUS_NACK);
> +
> +	if (stat & CEC_STAT_EOM) {
> +		struct cec_msg msg = {};
> +		unsigned int len, i;
> +
> +		len = hdmi_read_reg(core->base, HDMI_CORE_CEC_RX_CNT);
> +		if (len > sizeof(msg.msg))
> +			len = sizeof(msg.msg);
> +
> +		for (i = 0; i < len; i++)
> +			msg.msg[i] =
> +				hdmi_read_reg(core->base,
> +					      HDMI_CORE_CEC_RX_DATA0 + i * 4);
> +
> +		hdmi_write_reg(core->base, HDMI_CORE_CEC_LOCK, 0);
> +
> +		msg.len = len;
> +		cec_received_msg(adap, &msg);
> +	}
> +}
> +
> +static int hdmi5_cec_enable(struct cec_adapter *adap, bool enable)
> +{
> +	struct hdmi_core_data *core = cec_get_drvdata(adap);
> +	struct omap_hdmi *hdmi = container_of(core, struct omap_hdmi, core);
> +	unsigned int irqs;
> +	int err;
> +
> +	if (!enable) {
> +		hdmi_write_reg(core->base, HDMI_CORE_CEC_MASK, ~0);
> +		hdmi_write_reg(core->base, HDMI_CORE_IH_MUTE_CEC_STAT0, ~0);
> +		hdmi_wp_clear_irqenable(core->wp, HDMI_IRQ_CORE);
> +		hdmi_wp_set_irqstatus(core->wp, HDMI_IRQ_CORE);
> +		REG_FLD_MOD(core->base, HDMI_CORE_MC_CLKDIS, 0x01, 5, 5);
> +		hdmi5_core_disable(hdmi);

Empty line.

> +		return 0;
> +	}

And here.

> +	err = hdmi5_core_enable(hdmi);
> +	if (err)
> +		return err;
> +
> +	REG_FLD_MOD(core->base, HDMI_CORE_MC_CLKDIS, 0x00, 5, 5);
> +	hdmi_write_reg(core->base, HDMI_CORE_IH_I2CM_STAT0, ~0);
> +	hdmi_write_reg(core->base, HDMI_CORE_IH_MUTE_I2CM_STAT0, ~0);
> +	hdmi_write_reg(core->base, HDMI_CORE_CEC_CTRL, 0);
> +	hdmi_write_reg(core->base, HDMI_CORE_IH_CEC_STAT0, ~0);
> +	hdmi_write_reg(core->base, HDMI_CORE_CEC_LOCK, 0);
> +	hdmi_write_reg(core->base, HDMI_CORE_CEC_TX_CNT, 0);
> +
> +	hdmi5_cec_log_addr(adap, CEC_LOG_ADDR_INVALID);
> +
> +	/* Enable HDMI core interrupts */
> +	hdmi_wp_set_irqenable(core->wp, HDMI_IRQ_CORE);
> +
> +	irqs = CEC_STAT_ERROR_INIT | CEC_STAT_NACK | CEC_STAT_EOM |
> +	       CEC_STAT_DONE;
> +	hdmi_write_reg(core->base, HDMI_CORE_CEC_MASK, ~irqs);
> +	hdmi_write_reg(core->base, HDMI_CORE_IH_MUTE_CEC_STAT0, ~irqs);

Empty line.

> +	return 0;
> +}
> +
> +static const struct cec_adap_ops hdmi5_cec_ops = {
> +	.adap_enable = hdmi5_cec_enable,
> +	.adap_log_addr = hdmi5_cec_log_addr,
> +	.adap_transmit = hdmi5_cec_transmit,
> +};

There's a chance of race with these and the drm originating hdmi code.
hdmi5_core_enable/disable is protected with a mutex, but a few of the
registers are touched without any common lock held. Did you go through
these and ensure there's no race? With some studying, I can't see
anything that might cause issues, so maybe it's fine.

> +void hdmi5_cec_set_phys_addr(struct hdmi_core_data *core, struct edid *edid)
> +{
> +	cec_s_phys_addr_from_edid(core->adap, edid);
> +}
> +
> +int hdmi5_cec_init(struct platform_device *pdev, struct hdmi_core_data *core,
> +		   struct hdmi_wp_data *wp, struct drm_connector *conn)
> +{
> +	const u32 caps = CEC_CAP_DEFAULTS | CEC_CAP_CONNECTOR_INFO;
> +	struct cec_connector_info conn_info;
> +	unsigned int ret;
> +
> +	core->cec_clk = devm_clk_get(&pdev->dev, "cec");
> +	if (IS_ERR(core->cec_clk))
> +		return PTR_ERR(core->cec_clk);
> +	ret = clk_prepare_enable(core->cec_clk);
> +	if (ret)
> +		return ret;
> +
> +	core->adap = cec_allocate_adapter(&hdmi5_cec_ops, core,
> +					  "omap5", caps, CEC_MAX_LOG_ADDRS);
> +	ret = PTR_ERR_OR_ZERO(core->adap);
> +	if (ret < 0)
> +		return ret;

Empty line.

> +	cec_fill_conn_info_from_drm(&conn_info, conn);
> +	cec_s_conn_info(core->adap, &conn_info);
> +	core->wp = wp;
> +
> +	ret = cec_register_adapter(core->adap, &pdev->dev);
> +	if (ret < 0) {
> +		cec_delete_adapter(core->adap);
> +		return ret;
> +	}

Empty line.

> +	return 0;
> +}
> +
> +void hdmi5_cec_uninit(struct hdmi_core_data *core)
> +{
> +	clk_disable_unprepare(core->cec_clk);
> +	cec_unregister_adapter(core->adap);
> +}
> diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi5_cec.h b/drivers/gpu/drm/omapdrm/dss/hdmi5_cec.h
> new file mode 100644
> index 000000000000..904541da46da
> --- /dev/null
> +++ b/drivers/gpu/drm/omapdrm/dss/hdmi5_cec.h
> @@ -0,0 +1,42 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * HDMI header definition for OMAP5 HDMI CEC IP
> + *
> + * Copyright 2019 Cisco Systems, Inc. and/or its affiliates. All rights reserved.
> + */
> +
> +#ifndef _HDMI5_CEC_H_
> +#define _HDMI5_CEC_H_
> +
> +/* HDMI CEC funcs */
> +#ifdef CONFIG_OMAP5_DSS_HDMI_CEC
> +void hdmi5_cec_set_phys_addr(struct hdmi_core_data *core,
> +			     struct edid *edid);
> +void hdmi5_cec_irq(struct hdmi_core_data *core);
> +int hdmi5_cec_init(struct platform_device *pdev, struct hdmi_core_data *core,
> +		   struct hdmi_wp_data *wp, struct drm_connector *conn);
> +void hdmi5_cec_uninit(struct hdmi_core_data *core);
> +#else
> +static inline void hdmi5_cec_set_phys_addr(struct hdmi_core_data *core,
> +					   struct edid *edid)
> +{
> +}
> +
> +static inline void hdmi5_cec_irq(struct hdmi_core_data *core)
> +{
> +}
> +
> +static inline int hdmi5_cec_init(struct platform_device *pdev,
> +				 struct hdmi_core_data *core,
> +				 struct hdmi_wp_data *wp,
> +				 struct drm_connector *conn)
> +{
> +	return 0;
> +}
> +
> +static inline void hdmi5_cec_uninit(struct hdmi_core_data *core)
> +{
> +}
> +#endif
> +
> +#endif
> diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi5_core.c b/drivers/gpu/drm/omapdrm/dss/hdmi5_core.c
> index 6cc2ad7a420c..13bc0f3d850b 100644
> --- a/drivers/gpu/drm/omapdrm/dss/hdmi5_core.c
> +++ b/drivers/gpu/drm/omapdrm/dss/hdmi5_core.c
> @@ -229,6 +229,19 @@ void hdmi5_core_dump(struct hdmi_core_data *core, struct seq_file *s)
>  	DUMPCORE(HDMI_CORE_I2CM_FS_SCL_LCNT_1_ADDR);
>  	DUMPCORE(HDMI_CORE_I2CM_FS_SCL_LCNT_0_ADDR);
>  	DUMPCORE(HDMI_CORE_I2CM_SDA_HOLD_ADDR);
> +
> +	DUMPCORE(HDMI_CORE_IH_CEC_STAT0);
> +	DUMPCORE(HDMI_CORE_IH_MUTE_CEC_STAT0);
> +	DUMPCORE(HDMI_CORE_CEC_CTRL);
> +	DUMPCORE(HDMI_CORE_CEC_MASK);
> +	DUMPCORE(HDMI_CORE_CEC_ADDR_L);
> +	DUMPCORE(HDMI_CORE_CEC_ADDR_H);
> +	DUMPCORE(HDMI_CORE_CEC_TX_CNT);
> +	DUMPCORE(HDMI_CORE_CEC_RX_CNT);
> +	DUMPCORE(HDMI_CORE_CEC_TX_DATA0);
> +	DUMPCORE(HDMI_CORE_CEC_RX_DATA0);
> +	DUMPCORE(HDMI_CORE_CEC_LOCK);
> +	DUMPCORE(HDMI_CORE_CEC_WKUPCTRL);
>  }
>  
>  static void hdmi_core_init(struct hdmi_core_vid_config *video_cfg,
> @@ -513,8 +526,6 @@ static void hdmi_core_mask_interrupts(struct hdmi_core_data *core)
>  	REG_FLD_MOD(base, HDMI_CORE_AUD_INT, 0x3, 3, 2);
>  	REG_FLD_MOD(base, HDMI_CORE_AUD_GP_MASK, 0x3, 1, 0);
>  
> -	REG_FLD_MOD(base, HDMI_CORE_CEC_MASK, 0x7f, 6, 0);
> -
>  	REG_FLD_MOD(base, HDMI_CORE_I2CM_CTLINT, 0x1, 6, 6);
>  	REG_FLD_MOD(base, HDMI_CORE_I2CM_CTLINT, 0x1, 2, 2);
>  	REG_FLD_MOD(base, HDMI_CORE_I2CM_INT, 0x1, 2, 2);
> @@ -532,8 +543,6 @@ static void hdmi_core_mask_interrupts(struct hdmi_core_data *core)
>  
>  	REG_FLD_MOD(base, HDMI_CORE_IH_AS_STAT0, 0x7, 2, 0);
>  
> -	REG_FLD_MOD(base, HDMI_CORE_IH_CEC_STAT0, 0x7f, 6, 0);
> -
>  	REG_FLD_MOD(base, HDMI_CORE_IH_I2CM_STAT0, 0x3, 1, 0);
>  
>  	REG_FLD_MOD(base, HDMI_CORE_IH_PHY_STAT0, 0xff, 7, 0);
> @@ -549,13 +558,17 @@ int hdmi5_core_handle_irqs(struct hdmi_core_data *core)
>  {
>  	void __iomem *base = core->base;
>  
> +	/*
> +	 * Clear all possible IRQ_CORE interrupts except for
> +	 * HDMI_CORE_IH_I2CM_STAT0 (that interrupt is muted and
> +	 * is handled by polling elsewhere) and HDMI_CORE_IH_CEC_STAT0
> +	 * which is handled by the CEC code.
> +	 */
>  	REG_FLD_MOD(base, HDMI_CORE_IH_FC_STAT0, 0xff, 7, 0);
>  	REG_FLD_MOD(base, HDMI_CORE_IH_FC_STAT1, 0xff, 7, 0);
>  	REG_FLD_MOD(base, HDMI_CORE_IH_FC_STAT2, 0xff, 7, 0);
>  	REG_FLD_MOD(base, HDMI_CORE_IH_AS_STAT0, 0xff, 7, 0);
>  	REG_FLD_MOD(base, HDMI_CORE_IH_PHY_STAT0, 0xff, 7, 0);
> -	REG_FLD_MOD(base, HDMI_CORE_IH_I2CM_STAT0, 0xff, 7, 0);
> -	REG_FLD_MOD(base, HDMI_CORE_IH_CEC_STAT0, 0xff, 7, 0);
>  	REG_FLD_MOD(base, HDMI_CORE_IH_VP_STAT0, 0xff, 7, 0);
>  	REG_FLD_MOD(base, HDMI_CORE_IH_I2CMPHY_STAT0, 0xff, 7, 0);
>  
> @@ -879,5 +892,8 @@ int hdmi5_core_init(struct platform_device *pdev, struct hdmi_core_data *core)
>  	if (IS_ERR(core->base))
>  		return PTR_ERR(core->base);
>  
> +	REG_FLD_MOD(core->base, HDMI_CORE_CEC_MASK, 0x7f, 6, 0);
> +	REG_FLD_MOD(core->base, HDMI_CORE_IH_CEC_STAT0, 0x7f, 6, 0);
> +
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi5_core.h b/drivers/gpu/drm/omapdrm/dss/hdmi5_core.h
> index 070cbf5fb57d..a83b634f6011 100644
> --- a/drivers/gpu/drm/omapdrm/dss/hdmi5_core.h
> +++ b/drivers/gpu/drm/omapdrm/dss/hdmi5_core.h
> @@ -30,8 +30,18 @@
>  #define HDMI_CORE_IH_PHY_STAT0			0x00410
>  #define HDMI_CORE_IH_I2CM_STAT0			0x00414
>  #define HDMI_CORE_IH_CEC_STAT0			0x00418
> +#define CEC_STAT_DONE				BIT(0)
> +#define CEC_STAT_EOM				BIT(1)
> +#define CEC_STAT_NACK				BIT(2)
> +#define CEC_STAT_ARBLOST			BIT(3)
> +#define CEC_STAT_ERROR_INIT			BIT(4)
> +#define CEC_STAT_ERROR_FOLL			BIT(5)
> +#define CEC_STAT_WAKEUP				BIT(6)
> +
>  #define HDMI_CORE_IH_VP_STAT0			0x0041C
>  #define HDMI_CORE_IH_I2CMPHY_STAT0		0x00420
> +#define HDMI_CORE_IH_MUTE_I2CM_STAT0            0x00614
> +#define HDMI_CORE_IH_MUTE_CEC_STAT0		0x00618
>  #define HDMI_CORE_IH_MUTE			0x007FC
>  
>  /* HDMI Video Sampler */
> @@ -233,9 +243,6 @@
>  /* HDMI HDCP */
>  #define HDMI_CORE_HDCP_MASK			0x14020
>  
> -/* HDMI CEC */
> -#define HDMI_CORE_CEC_MASK			0x17408
> -
>  /* HDMI I2C Master */
>  #define HDMI_CORE_I2CM_SLAVE			0x157C8
>  #define HDMI_CORE_I2CM_ADDRESS			0x157CC
> @@ -258,6 +265,24 @@
>  #define HDMI_CORE_I2CM_FS_SCL_LCNT_0_ADDR	0x15810
>  #define HDMI_CORE_I2CM_SDA_HOLD_ADDR		0x15814
>  
> +/* HDMI CEC */
> +#define HDMI_CORE_CEC_CTRL			0x153C8
> +#define CEC_CTRL_START				BIT(0)
> +#define CEC_CTRL_FRAME_TYP			(3 << 1)
> +#define CEC_CTRL_RETRY				(0 << 1)
> +#define CEC_CTRL_NORMAL				(1 << 1)
> +#define CEC_CTRL_IMMED				(2 << 1)
> +
> +#define HDMI_CORE_CEC_MASK			0x153D0
> +#define HDMI_CORE_CEC_ADDR_L			0x153DC
> +#define HDMI_CORE_CEC_ADDR_H			0x153E0
> +#define HDMI_CORE_CEC_TX_CNT			0x153E4
> +#define HDMI_CORE_CEC_RX_CNT			0x153E8
> +#define HDMI_CORE_CEC_TX_DATA0			0x15408
> +#define HDMI_CORE_CEC_RX_DATA0			0x15448
> +#define HDMI_CORE_CEC_LOCK			0x15488
> +#define HDMI_CORE_CEC_WKUPCTRL			0x1548C
> +
>  enum hdmi_core_packet_mode {
>  	HDMI_PACKETMODERESERVEDVALUE = 0,
>  	HDMI_PACKETMODE24BITPERPIXEL = 4,
> @@ -290,6 +315,8 @@ int hdmi5_core_handle_irqs(struct hdmi_core_data *core);
>  void hdmi5_configure(struct hdmi_core_data *core, struct hdmi_wp_data *wp,
>  			struct hdmi_config *cfg);
>  int hdmi5_core_init(struct platform_device *pdev, struct hdmi_core_data *core);
> +int hdmi5_core_enable(struct omap_hdmi *hdmi);
> +void hdmi5_core_disable(struct omap_hdmi *hdmi);
>  
>  int hdmi5_audio_config(struct hdmi_core_data *core, struct hdmi_wp_data *wp,
>  			struct omap_dss_audio *audio, u32 pclk);
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
