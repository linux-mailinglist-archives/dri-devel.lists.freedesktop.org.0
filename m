Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E69662AF588
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 16:54:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE8A989BA1;
	Wed, 11 Nov 2020 15:54:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D333689BA1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 15:54:39 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0ABFsSWd130915;
 Wed, 11 Nov 2020 09:54:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1605110068;
 bh=1/etRUwSEHxIiOVBXTIPREumTqBXbYHv8nSiQnEx8zU=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=Ag/Db3rhr9PX6Dg0uGohKSOtqV+Jbs8pQgZitenn80Ljf4Le5wObV7xTu+tCyqKUF
 ePYZke7zDgsWdSUL9sfK7VmXsz5VO4nt+e0WmZ0gAVfBM2VN+6TEl+knTXzjlC+1o3
 INDVLukOwJOXzfsKDoUC8uDR6+4rGCx2im6DRLnY=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0ABFsSSw009162
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 11 Nov 2020 09:54:28 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 11
 Nov 2020 09:54:28 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 11 Nov 2020 09:54:28 -0600
Received: from [192.168.2.6] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0ABFsPdf113492;
 Wed, 11 Nov 2020 09:54:26 -0600
Subject: Re: [PATCH v3 33/56] drm/omap: dsi: convert to drm_panel
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20201105120333.947408-1-tomi.valkeinen@ti.com>
 <20201105120333.947408-34-tomi.valkeinen@ti.com>
 <20201109103931.GD6029@pendragon.ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Message-ID: <110c2e4b-ac33-1245-7f55-fd99f2ee416b@ti.com>
Date: Wed, 11 Nov 2020 17:54:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201109103931.GD6029@pendragon.ideasonboard.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Tony Lindgren <tony@atomide.com>,
 "H . Nikolaus Schaller" <hns@goldelico.com>, Sekhar Nori <nsekhar@ti.com>,
 Sebastian Reichel <sre@kernel.org>, dri-devel@lists.freedesktop.org,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 linux-omap@vger.kernel.org, Nikhil Devshatwar <nikhil.nd@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/11/2020 12:39, Laurent Pinchart wrote:
> On Thu, Nov 05, 2020 at 02:03:10PM +0200, Tomi Valkeinen wrote:
>> From: Sebastian Reichel <sebastian.reichel@collabora.com>
>>
>> This converts the DSI module to expect common drm_panel display
>> drivers instead of dssdev based ones.
>>
>> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
>> ---
>>  .../gpu/drm/omapdrm/displays/panel-dsi-cm.c   | 204 +++++++-----------
>>  drivers/gpu/drm/omapdrm/dss/dsi.c             | 133 ++++++++++--
>>  .../gpu/drm/omapdrm/dss/omapdss-boot-init.c   |   1 -
>>  drivers/gpu/drm/omapdrm/dss/omapdss.h         |   8 -
>>  4 files changed, 189 insertions(+), 157 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
>> index d9b3444b4faf..3668b3f0aff2 100644
>> --- a/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
>> +++ b/drivers/gpu/drm/omapdrm/displays/panel-dsi-cm.c
>> @@ -6,8 +6,6 @@
>>   * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
>>   */
>>  
>> -/* #define DEBUG */
>> -
>>  #include <linux/backlight.h>
>>  #include <linux/delay.h>
>>  #include <linux/gpio/consumer.h>
>> @@ -20,11 +18,14 @@
>>  #include <linux/regulator/consumer.h>
>>  
>>  #include <drm/drm_connector.h>
>> +#include <drm/drm_mipi_dsi.h>
>> +#include <drm/drm_panel.h>
>> +#include <drm/drm_modes.h>
> 
> Alphabetically ordered please.
> 
>>  
>> +#include <video/display_timing.h>
>>  #include <video/mipi_display.h>
>>  #include <video/of_display_timing.h>
>> -
>> -#include "../dss/omapdss.h"
>> +#include <video/videomode.h>
>>  
>>  #define DCS_READ_NUM_ERRORS	0x05
>>  #define DCS_GET_ID1		0xda
>> @@ -35,11 +36,8 @@
>>  
>>  struct panel_drv_data {
>>  	struct mipi_dsi_device *dsi;
>> -
>> -	struct omap_dss_device dssdev;
>> -	struct omap_dss_device *src;
>> -
>> -	struct videomode vm;
>> +	struct drm_panel panel;
>> +	struct drm_display_mode mode;
>>  
>>  	struct mutex lock;
>>  
>> @@ -71,7 +69,11 @@ struct panel_drv_data {
>>  	bool ulps_enabled;
>>  };
>>  
>> -#define to_panel_data(p) container_of(p, struct panel_drv_data, dssdev)
>> +
> 
> A single blank line is enough.
> 
>> +static inline struct panel_drv_data *panel_to_ddata(struct drm_panel *panel)
>> +{
>> +	return container_of(panel, struct panel_drv_data, panel);
>> +}
>>  
>>  static int _dsicm_enable_te(struct panel_drv_data *ddata, bool enable);
>>  
>> @@ -285,7 +287,6 @@ static void dsicm_hw_reset(struct panel_drv_data *ddata)
>>  
>>  static int dsicm_power_on(struct panel_drv_data *ddata)
>>  {
>> -	struct omap_dss_device *src = ddata->src;
>>  	u8 id1, id2, id3;
>>  	int r;
>>  
>> @@ -322,10 +323,6 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
>>  	if (r)
>>  		goto err;
>>  
>> -	r = src->ops->dsi.enable_video_output(src, ddata->dsi->channel);
>> -	if (r)
>> -		goto err;
>> -
>>  	ddata->enabled = true;
>>  
>>  	if (!ddata->intro_printed) {
>> @@ -345,15 +342,12 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
>>  	return r;
>>  }
>>  
>> -static void dsicm_power_off(struct panel_drv_data *ddata)
>> +static int dsicm_power_off(struct panel_drv_data *ddata)
>>  {
>> -	struct omap_dss_device *src = ddata->src;
>>  	int r;
>>  
>>  	ddata->enabled = false;
>>  
>> -	src->ops->dsi.disable_video_output(src, ddata->dsi->channel);
>> -
>>  	r = mipi_dsi_dcs_set_display_off(ddata->dsi);
>>  	if (!r)
>>  		r = dsicm_sleep_in(ddata);
>> @@ -363,51 +357,25 @@ static void dsicm_power_off(struct panel_drv_data *ddata)
>>  				"error disabling panel, issuing HW reset\n");
>>  		dsicm_hw_reset(ddata);
>>  	}
>> -}
>> -
>> -static int dsicm_connect(struct omap_dss_device *src,
>> -			 struct omap_dss_device *dst)
>> -{
>> -	struct panel_drv_data *ddata = to_panel_data(dst);
>> -
>> -	ddata->src = src;
>> -	return 0;
>> -}
>> -
>> -static void dsicm_disconnect(struct omap_dss_device *src,
>> -			     struct omap_dss_device *dst)
>> -{
>> -	struct panel_drv_data *ddata = to_panel_data(dst);
>>  
>> -	ddata->src = NULL;
>> +	return r;
>>  }
>>  
>> -static void dsicm_pre_enable(struct omap_dss_device *dssdev)
>> +static int dsicm_prepare(struct drm_panel *panel)
>>  {
>> -	struct panel_drv_data *ddata = to_panel_data(dssdev);
>> -	struct omap_dss_device *src = ddata->src;
>> +	struct panel_drv_data *ddata = panel_to_ddata(panel);
>>  	int r;
>> -	struct omap_dss_dsi_config dsi_config = {
>> -		.vm = &ddata->vm,
>> -		.hs_clk_min = 150000000,
>> -		.hs_clk_max = 300000000,
>> -		.lp_clk_min = 7000000,
>> -		.lp_clk_max = 10000000,
>> -	};
>>  
>>  	r = regulator_bulk_enable(DCS_REGULATOR_SUPPLY_NUM, ddata->supplies);
>>  	if (r)
>>  		dev_err(&ddata->dsi->dev, "failed to enable supplies: %d\n", r);
>>  
>> -	r = src->ops->dsi.set_config(src, &dsi_config);
>> -	if (r) {
>> -		dev_err(&ddata->dsi->dev, "failed to configure DSI\n");
>> -	}
>> +	return r;
>>  }
>>  
>> -static void dsicm_enable(struct omap_dss_device *dssdev)
>> +static int dsicm_enable(struct drm_panel *panel)
>>  {
>> -	struct panel_drv_data *ddata = to_panel_data(dssdev);
>> +	struct panel_drv_data *ddata = panel_to_ddata(panel);
>>  	int r;
>>  
>>  	mutex_lock(&ddata->lock);
>> @@ -420,33 +388,39 @@ static void dsicm_enable(struct omap_dss_device *dssdev)
>>  
>>  	dsicm_bl_power(ddata, true);
>>  
>> -	return;
>> +	return 0;
>>  err:
>> -	dev_dbg(&ddata->dsi->dev, "enable failed (%d)\n", r);
>> +	dev_err(&ddata->dsi->dev, "enable failed (%d)\n", r);
>>  	mutex_unlock(&ddata->lock);
>> +	return r;
>> +}
>> +
>> +static int dsicm_unprepare(struct drm_panel *panel)
>> +{
>> +	struct panel_drv_data *ddata = panel_to_ddata(panel);
>> +	int r;
>> +
>> +	r = regulator_bulk_disable(DCS_REGULATOR_SUPPLY_NUM, ddata->supplies);
>> +	if (r)
>> +		dev_err(&ddata->dsi->dev, "failed to disable supplies: %d\n", r);
>> +
>> +	return r;
>>  }
>>  
>> -static void dsicm_disable(struct omap_dss_device *dssdev)
>> +static int dsicm_disable(struct drm_panel *panel)
>>  {
>> -	struct panel_drv_data *ddata = to_panel_data(dssdev);
>> +	struct panel_drv_data *ddata = panel_to_ddata(panel);
>> +	int r;
>>  
>>  	dsicm_bl_power(ddata, false);
>>  
>>  	mutex_lock(&ddata->lock);
>>  
>> -	dsicm_power_off(ddata);
>> +	r = dsicm_power_off(ddata);
>>  
>>  	mutex_unlock(&ddata->lock);
>> -}
>> -
>> -static void dsicm_post_disable(struct omap_dss_device *dssdev)
>> -{
>> -	struct panel_drv_data *ddata = to_panel_data(dssdev);
>> -	int r;
>>  
>> -	r = regulator_bulk_disable(DCS_REGULATOR_SUPPLY_NUM, ddata->supplies);
>> -	if (r)
>> -		dev_err(&ddata->dsi->dev, "failed to disable supplies: %d\n", r);
>> +	return r;
>>  }
>>  
>>  static int _dsicm_enable_te(struct panel_drv_data *ddata, bool enable)
>> @@ -465,50 +439,37 @@ static int _dsicm_enable_te(struct panel_drv_data *ddata, bool enable)
>>  	return r;
>>  }
>>  
>> -static int dsicm_get_modes(struct omap_dss_device *dssdev,
>> +static int dsicm_get_modes(struct drm_panel *panel,
>>  			   struct drm_connector *connector)
>>  {
>> -	struct panel_drv_data *ddata = to_panel_data(dssdev);
>> +	struct panel_drv_data *ddata = panel_to_ddata(panel);
>> +	struct drm_display_mode *mode;
>> +
>> +	mode = drm_mode_duplicate(connector->dev, &ddata->mode);
>> +	if (!mode) {
>> +		dev_err(&ddata->dsi->dev, "failed to add mode %ux%ux@%u kHz\n",
>> +			ddata->mode.hdisplay, ddata->mode.vdisplay,
>> +			ddata->mode.clock);
>> +		return -ENOMEM;
>> +	}
>> +
>> +	drm_mode_set_name(mode);
>> +	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
>>  
>>  	connector->display_info.width_mm = ddata->width_mm;
>>  	connector->display_info.height_mm = ddata->height_mm;
>>  
>> -	return omapdss_display_get_modes(connector, &ddata->vm);
>> -}
>> -
>> -static int dsicm_check_timings(struct omap_dss_device *dssdev,
>> -			       struct drm_display_mode *mode)
>> -{
>> -	struct panel_drv_data *ddata = to_panel_data(dssdev);
>> -	int ret = 0;
>> -
>> -	if (mode->hdisplay != ddata->vm.hactive)
>> -		ret = -EINVAL;
>> -
>> -	if (mode->vdisplay != ddata->vm.vactive)
>> -		ret = -EINVAL;
>> +	drm_mode_probed_add(connector, mode);
>>  
>> -	if (ret) {
>> -		dev_warn(dssdev->dev, "wrong resolution: %d x %d",
>> -			 mode->hdisplay, mode->vdisplay);
>> -		dev_warn(dssdev->dev, "panel resolution: %d x %d",
>> -			 ddata->vm.hactive, ddata->vm.vactive);
>> -	}
>> -
>> -	return ret;
>> +	return 1;
>>  }
>>  
>> -static const struct omap_dss_device_ops dsicm_ops = {
>> -	.connect	= dsicm_connect,
>> -	.disconnect	= dsicm_disconnect,
>> -
>> -	.pre_enable	= dsicm_pre_enable,
>> -	.enable		= dsicm_enable,
>> -	.disable	= dsicm_disable,
>> -	.post_disable	= dsicm_post_disable,
>> -
>> -	.get_modes	= dsicm_get_modes,
>> -	.check_timings	= dsicm_check_timings,
>> +static const struct drm_panel_funcs dsicm_panel_funcs = {
>> +	.unprepare = dsicm_unprepare,
>> +	.disable = dsicm_disable,
>> +	.prepare = dsicm_prepare,
>> +	.enable = dsicm_enable,
>> +	.get_modes = dsicm_get_modes,
>>  };
>>  
>>  static int dsicm_probe_of(struct mipi_dsi_device *dsi)
>> @@ -517,8 +478,12 @@ static int dsicm_probe_of(struct mipi_dsi_device *dsi)
>>  	struct backlight_device *backlight;
>>  	struct panel_drv_data *ddata = mipi_dsi_get_drvdata(dsi);
>>  	struct display_timing timing;
>> +	struct videomode vm = { 0 };
> 
> How about
> 
> 	struct videomode vm = {
> 		.hactive = 864,
> 		.vactive = 480,
> 	};
> 
>>  	int err;
>>  
>> +	vm.hactive = 864;
>> +	vm.vactive = 480;
>> +
>>  	ddata->reset_gpio = devm_gpiod_get(&dsi->dev, "reset", GPIOD_OUT_LOW);
>>  	if (IS_ERR(ddata->reset_gpio)) {
>>  		err = PTR_ERR(ddata->reset_gpio);
>> @@ -528,15 +493,16 @@ static int dsicm_probe_of(struct mipi_dsi_device *dsi)
>>  
>>  	err = of_get_display_timing(node, "panel-timing", &timing);
>>  	if (!err) {
>> -		videomode_from_timing(&timing, &ddata->vm);
>> -		if (!ddata->vm.pixelclock)
>> -			ddata->vm.pixelclock =
>> -				ddata->vm.hactive * ddata->vm.vactive * 60;
>> +		videomode_from_timing(&timing, &vm);
>>  	} else {
>>  		dev_warn(&dsi->dev,
>>  			 "failed to get video timing, using defaults\n");
>>  	}
>>  
>> +	if (!vm.pixelclock)
>> +		vm.pixelclock = vm.hactive * vm.vactive * 60;
>> +	drm_display_mode_from_videomode(&vm, &ddata->mode);
>> +
>>  	ddata->width_mm = 0;
>>  	of_property_read_u32(node, "width-mm", &ddata->width_mm);
>>  
>> @@ -570,7 +536,6 @@ static int dsicm_probe(struct mipi_dsi_device *dsi)
>>  	struct panel_drv_data *ddata;
>>  	struct backlight_device *bldev = NULL;
>>  	struct device *dev = &dsi->dev;
>> -	struct omap_dss_device *dssdev;
>>  	int r;
>>  
>>  	dev_dbg(dev, "probe\n");
>> @@ -582,30 +547,17 @@ static int dsicm_probe(struct mipi_dsi_device *dsi)
>>  	mipi_dsi_set_drvdata(dsi, ddata);
>>  	ddata->dsi = dsi;
>>  
>> -	ddata->vm.hactive = 864;
>> -	ddata->vm.vactive = 480;
>> -	ddata->vm.pixelclock = 864 * 480 * 60;
>> -
>>  	r = dsicm_probe_of(dsi);
>>  	if (r)
>>  		return r;
>>  
>> -	dssdev = &ddata->dssdev;
>> -	dssdev->dev = dev;
>> -	dssdev->ops = &dsicm_ops;
>> -	dssdev->type = OMAP_DISPLAY_TYPE_DSI;
>> -	dssdev->display = true;
>> -	dssdev->owner = THIS_MODULE;
>> -	dssdev->of_port = 0;
>> -	dssdev->ops_flags = OMAP_DSS_DEVICE_OP_MODES;
>> -
>> -	omapdss_display_init(dssdev);
>> -	omapdss_device_register(dssdev);
>> -
>>  	mutex_init(&ddata->lock);
>>  
>>  	dsicm_hw_reset(ddata);
>>  
>> +	drm_panel_init(&ddata->panel, dev, &dsicm_panel_funcs,
>> +		       DRM_MODE_CONNECTOR_DSI);
>> +
>>  	if (ddata->use_dsi_backlight) {
>>  		struct backlight_properties props = { 0 };
>>  		props.max_brightness = 255;
>> @@ -637,6 +589,8 @@ static int dsicm_probe(struct mipi_dsi_device *dsi)
>>  	if (ddata->ulps_enabled)
>>  		dsi->mode_flags |= MIPI_DSI_MODE_ULPS_IDLE;
>>  
>> +	drm_panel_add(&ddata->panel);
>> +
>>  	r = mipi_dsi_attach(dsi);
>>  	if (r < 0)
>>  		goto err_dsi_attach;
>> @@ -644,6 +598,7 @@ static int dsicm_probe(struct mipi_dsi_device *dsi)
>>  	return 0;
>>  
>>  err_dsi_attach:
>> +	drm_panel_remove(&ddata->panel);
>>  	sysfs_remove_group(&dsi->dev.kobj, &dsicm_attr_group);
>>  err_bl:
>>  	if (ddata->extbldev)
>> @@ -655,15 +610,12 @@ static int dsicm_probe(struct mipi_dsi_device *dsi)
>>  static int __exit dsicm_remove(struct mipi_dsi_device *dsi)
>>  {
>>  	struct panel_drv_data *ddata = mipi_dsi_get_drvdata(dsi);
>> -	struct omap_dss_device *dssdev = &ddata->dssdev;
>>  
>>  	dev_dbg(&dsi->dev, "remove\n");
>>  
>>  	mipi_dsi_detach(dsi);
>>  
>> -	omapdss_device_unregister(dssdev);
>> -
>> -	omapdss_device_disconnect(ddata->src, dssdev);
>> +	drm_panel_remove(&ddata->panel);
>>  
>>  	sysfs_remove_group(&dsi->dev.kobj, &dsicm_attr_group);
>>  
>> @@ -677,7 +629,7 @@ static int __exit dsicm_remove(struct mipi_dsi_device *dsi)
>>  }
>>  
>>  static const struct of_device_id dsicm_of_match[] = {
>> -	{ .compatible = "omapdss,panel-dsi-cm", },
>> +	{ .compatible = "panel-dsi-cm", },
>>  	{},
>>  };
>>  
>> diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
>> index 620cef8bb1f2..a1a867a7d91d 100644
>> --- a/drivers/gpu/drm/omapdrm/dss/dsi.c
>> +++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
>> @@ -36,6 +36,7 @@
>>  #include <linux/sys_soc.h>
>>  
>>  #include <drm/drm_mipi_dsi.h>
>> +#include <drm/drm_panel.h>
>>  #include <video/mipi_display.h>
>>  
>>  #include "omapdss.h"
>> @@ -217,6 +218,8 @@ static int dsi_vc_send_null(struct dsi_data *dsi, int channel);
>>  static ssize_t _omap_dsi_host_transfer(struct dsi_data *dsi,
>>  				       const struct mipi_dsi_msg *msg);
>>  
>> +static void dsi_display_disable(struct omap_dss_device *dssdev);
>> +
> 
> Could you reorder functions to avoid forward-declarations ? This can be
> done on top if it generates annoying conflicts.
> 
>>  /* DSI PLL HSDIV indices */
>>  #define HSDIV_DISPC	0
>>  #define HSDIV_DSI	1
>> @@ -383,6 +386,7 @@ struct dsi_data {
>>  	bool te_enabled;
>>  	bool ulps_enabled;
>>  	bool ulps_auto_idle;
>> +	bool video_enabled;
>>  
>>  	struct delayed_work ulps_work;
>>  
>> @@ -423,6 +427,8 @@ struct dsi_data {
>>  
>>  	unsigned int scp_clk_refcount;
>>  
>> +	struct omap_dss_dsi_config config;
>> +
>>  	struct dss_lcd_mgr_config mgr_config;
>>  	struct videomode vm;
>>  	enum mipi_dsi_pixel_format pix_fmt;
>> @@ -3622,7 +3628,7 @@ static int dsi_configure_pins(struct omap_dss_device *dssdev,
>>  	return 0;
>>  }
>>  
>> -static int dsi_enable_video_output(struct omap_dss_device *dssdev, int channel)
>> +static void dsi_enable_video_output(struct omap_dss_device *dssdev, int channel)
>>  {
>>  	struct dsi_data *dsi = to_dsi_data(dssdev);
>>  	int bpp = mipi_dsi_pixel_format_to_bpp(dsi->pix_fmt);
>> @@ -3631,8 +3637,10 @@ static int dsi_enable_video_output(struct omap_dss_device *dssdev, int channel)
>>  	int r;
>>  
>>  	r = dsi_display_init_dispc(dsi);
>> -	if (r)
>> -		return r;
>> +	if (r) {
>> +		dev_err(dsi->dev, "failed to init dispc!\n");
>> +		return;
>> +	}
>>  
>>  	if (dsi->mode == OMAP_DSS_DSI_VIDEO_MODE) {
>>  		switch (dsi->pix_fmt) {
>> @@ -3672,7 +3680,7 @@ static int dsi_enable_video_output(struct omap_dss_device *dssdev, int channel)
>>  	if (r)
>>  		goto err_mgr_enable;
>>  
>> -	return 0;
>> +	return;
>>  
>>  err_mgr_enable:
>>  	if (dsi->mode == OMAP_DSS_DSI_VIDEO_MODE) {
>> @@ -3681,7 +3689,8 @@ static int dsi_enable_video_output(struct omap_dss_device *dssdev, int channel)
>>  	}
>>  err_pix_fmt:
>>  	dsi_display_uninit_dispc(dsi);
>> -	return r;
>> +	dev_err(dsi->dev, "failed to enable DSI encoder!\n");
>> +	return;
>>  }
>>  
>>  static void dsi_disable_video_output(struct omap_dss_device *dssdev, int channel)
>> @@ -3704,6 +3713,25 @@ static void dsi_disable_video_output(struct omap_dss_device *dssdev, int channel
>>  	dsi_display_uninit_dispc(dsi);
>>  }
>>  
>> +static void dsi_disable_video_outputs(struct omap_dss_device *dssdev)
>> +{
>> +	struct dsi_data *dsi = to_dsi_data(dssdev);
>> +	int i;
>> +
>> +	dsi_bus_lock(dsi);
>> +	dsi->video_enabled = false;
>> +
>> +	for (i = 0; i < 3; i++) {
>> +		if (!dsi->vc[i].dest)
>> +			continue;
>> +		dsi_disable_video_output(dssdev, i);
>> +	}
>> +
>> +	dsi_display_disable(dssdev);
>> +
>> +	dsi_bus_unlock(dsi);
>> +}
>> +
>>  static void dsi_update_screen_dispc(struct dsi_data *dsi)
>>  {
>>  	unsigned int bytespp;
>> @@ -3897,6 +3925,11 @@ static int dsi_update_channel(struct omap_dss_device *dssdev, int channel)
>>  
>>  	dsi_bus_lock(dsi);
>>  
>> +	if (!dsi->video_enabled) {
>> +		r = -EIO;
>> +		goto err;
>> +	}
>> +
>>  	if (!dsi->vc[channel].dest) {
>>  		r = -ENODEV;
>>  		goto err;
>> @@ -3942,7 +3975,7 @@ static int dsi_update_all(struct omap_dss_device *dssdev)
>>  
>>  	for (i = 0; i < 4; i++) {
>>  		r = dsi_update_channel(dssdev, i);
>> -		if (r != -ENODEV)
>> +		if (r && r != -ENODEV)
> 
> Does this belong to this patch ? I haven't flagged it when reviwing the
> patch that introduced this code, assuming that you meant to exit from
> the loop once a channel with a client is found, given that we don't
> support multiple clients. In any case this should be coordinated with
> dsi_enable_video_outputs() and dsi_disable_video_outputs(), all should
> stop on the first client, or loop over all clients.

Yes, it should be in an earlier patch.

I think this code needs more work, but in any case this change belongs to the patch that added
dsi_update_all.

>> @@ -5057,6 +5138,10 @@ static int omap_dsi_host_attach(struct mipi_dsi_host *host,
>>  
>>  	dsi_bus_lock(dsi);
>>  
>> +	panel = of_drm_find_panel(client->dev.of_node);
>> +	if (IS_ERR(panel))
>> +		return PTR_ERR(panel);
> 
> Is it intended that the panel isn't used ?

I think it's left over code. I'll drop.

 Tomi

-- 
Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
