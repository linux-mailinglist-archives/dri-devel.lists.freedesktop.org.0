Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FBE2434A5
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 09:13:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 551ED6E5A3;
	Thu, 13 Aug 2020 07:12:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 595 seconds by postgrey-1.36 at gabe;
 Wed, 12 Aug 2020 11:18:33 UTC
Received: from smtphy.263.net (syd-smtp02.263.net [13.237.61.158])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6551C6E8D4
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 11:18:33 +0000 (UTC)
Received: from regular2.263xmail.com (unknown [211.157.147.162])
 by smtphy.263.net (Postfix) with ESMTPS id D32F512003B
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 19:08:36 +0800 (CST)
Received: from regular1.263xmail.com (unknown [192.168.165.233])
 by regular2.263xmail.com (Postfix) with ESMTP id 6D66A22C
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Aug 2020 19:08:25 +0800 (CST)
Received: from localhost (unknown [192.168.167.209])
 by regular1.263xmail.com (Postfix) with ESMTP id F3283635;
 Wed, 12 Aug 2020 19:08:21 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED: 0
X-ANTISPAM-LEVEL: 2
X-SKE-CHECKED: 1
X-ABS-CHECKED: 1
Received: from [172.16.12.39] (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P31769T140661747595008S1597230488214934_; 
 Wed, 12 Aug 2020 19:08:20 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <7ee266d39716933efe667677a448c91f>
X-RL-SENDER: algea.cao@rock-chips.com
X-SENDER: algea.cao@rock-chips.com
X-LOGIN-NAME: algea.cao@rock-chips.com
X-FST-TO: daniel@ffwll.ch
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-DNS-TYPE: 0
X-System-Flag: 0
Subject: Re: [PATCH 4/6] drm/rockchip: dw_hdmi: Add vendor hdmi properties
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20200812083120.743-1-algea.cao@rock-chips.com>
 <20200812083543.4231-1-algea.cao@rock-chips.com>
 <20200812093315.GE6057@pendragon.ideasonboard.com>
From: crj <algea.cao@rock-chips.com>
Message-ID: <52cca26d-b2b3-22b2-f371-a8086f2e6336@rock-chips.com>
Date: Wed, 12 Aug 2020 19:08:10 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.1.1
MIME-Version: 1.0
In-Reply-To: <20200812093315.GE6057@pendragon.ideasonboard.com>
X-Mailman-Approved-At: Thu, 13 Aug 2020 07:12:31 +0000
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
Cc: jernej.skrabec@siol.net, laurent.pinchart+renesas@ideasonboard.com,
 jonas@kwiboo.se, airlied@linux.ie, kuankuan.y@gmail.com,
 narmstrong@baylibre.com, hjc@rock-chips.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, a.hajda@samsung.com, tzimmermann@suse.de,
 jbrunet@baylibre.com, linux-rockchip@lists.infradead.org, darekm@google.com,
 sam@ravnborg.org, linux-arm-kernel@lists.infradead.org, cychiang@chromium.org
Content-Type: multipart/mixed; boundary="===============1726507941=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============1726507941==
Content-Type: multipart/alternative;
 boundary="------------413B129AAB0C4F7D9FD853CA"

This is a multi-part message in MIME format.
--------------413B129AAB0C4F7D9FD853CA
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Lauren,

Thank you for your review.

在 2020/8/12 17:33, Laurent Pinchart 写道:
> Hi Algea,
>
> Thank you for the patch.
>
> On Wed, Aug 12, 2020 at 04:35:43PM +0800, Algea Cao wrote:
>> Introduce struct dw_hdmi_property_ops in plat_data to support
>> vendor hdmi property.
>>
>> Implement hdmi vendor properties color_depth_property and
>> hdmi_output_property to config hdmi output color depth and
>> color format.
>>
>> The property "hdmi_output_format", the possible value
>> could be:
>>           - RGB
>>           - YCBCR 444
>>           - YCBCR 422
>>           - YCBCR 420
>>
>> Default value of the property is set to 0 = RGB, so no changes if you
>> don't set the property.
>>
>> The property "hdmi_output_depth" possible value could be
>>           - Automatic
>>             This indicates prefer highest color depth, it is
>>             30bit on rockcip platform.
>>           - 24bit
>>           - 30bit
>> The default value of property is 24bit.
>>
>> Signed-off-by: Algea Cao <algea.cao@rock-chips.com>
>> ---
>>
>>   drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 174 ++++++++++++++++++++
>>   include/drm/bridge/dw_hdmi.h                |  22 +++
>>   2 files changed, 196 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
>> index 23de359a1dec..8f22d9a566db 100644
>> --- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
>> +++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
>> @@ -52,6 +52,27 @@
>>   
>>   #define HIWORD_UPDATE(val, mask)	(val | (mask) << 16)
>>   
>> +/* HDMI output pixel format */
>> +enum drm_hdmi_output_type {
>> +	DRM_HDMI_OUTPUT_DEFAULT_RGB, /* default RGB */
>> +	DRM_HDMI_OUTPUT_YCBCR444, /* YCBCR 444 */
>> +	DRM_HDMI_OUTPUT_YCBCR422, /* YCBCR 422 */
>> +	DRM_HDMI_OUTPUT_YCBCR420, /* YCBCR 420 */
>> +	DRM_HDMI_OUTPUT_YCBCR_HQ, /* Highest subsampled YUV */
>> +	DRM_HDMI_OUTPUT_YCBCR_LQ, /* Lowest subsampled YUV */
>> +	DRM_HDMI_OUTPUT_INVALID, /* Guess what ? */
>> +};
> Vendor-specific properties shouldn't use names starting with drm_ or
> DRM_, that's for the DRM core. But this doesn't seem specific to
> Rockchip at all, it should be a standard property. Additionally, new
> properties need to come with a userspace implementation showing their
> usage, in X.org, Weston, the Android DRM/KMS HW composer, or another
> relevant upstream project (a test tool is usually not enough).


We use these properties only in Android HW composer, But we can't upstream

our HW composer code right now.  Can we use this properties as private 
property

and do not upstream HW composer for the time being?


>> +
>> +enum dw_hdmi_rockchip_color_depth {
>> +	ROCKCHIP_HDMI_DEPTH_8,
>> +	ROCKCHIP_HDMI_DEPTH_10,
>> +	ROCKCHIP_HDMI_DEPTH_12,
>> +	ROCKCHIP_HDMI_DEPTH_16,
>> +	ROCKCHIP_HDMI_DEPTH_420_10,
>> +	ROCKCHIP_HDMI_DEPTH_420_12,
>> +	ROCKCHIP_HDMI_DEPTH_420_16
>> +};
>> +
>>   /**
>>    * struct rockchip_hdmi_chip_data - splite the grf setting of kind of chips
>>    * @lcdsel_grf_reg: grf register offset of lcdc select
>> @@ -73,6 +94,12 @@ struct rockchip_hdmi {
>>   	struct clk *grf_clk;
>>   	struct dw_hdmi *hdmi;
>>   	struct phy *phy;
>> +
>> +	struct drm_property *color_depth_property;
>> +	struct drm_property *hdmi_output_property;
>> +
>> +	unsigned int colordepth;
>> +	enum drm_hdmi_output_type hdmi_output;
>>   };
>>   
>>   #define to_rockchip_hdmi(x)	container_of(x, struct rockchip_hdmi, x)
>> @@ -327,6 +354,150 @@ static void dw_hdmi_rockchip_genphy_disable(struct dw_hdmi *dw_hdmi, void *data)
>>   	phy_power_off(hdmi->phy);
>>   }
>>   
>> +static const struct drm_prop_enum_list color_depth_enum_list[] = {
>> +	{ 0, "Automatic" }, /* Prefer highest color depth */
>> +	{ 8, "24bit" },
>> +	{ 10, "30bit" },
>> +};
>> +
>> +static const struct drm_prop_enum_list drm_hdmi_output_enum_list[] = {
>> +	{ DRM_HDMI_OUTPUT_DEFAULT_RGB, "output_rgb" },
>> +	{ DRM_HDMI_OUTPUT_YCBCR444, "output_ycbcr444" },
>> +	{ DRM_HDMI_OUTPUT_YCBCR422, "output_ycbcr422" },
>> +	{ DRM_HDMI_OUTPUT_YCBCR420, "output_ycbcr420" },
>> +	{ DRM_HDMI_OUTPUT_YCBCR_HQ, "output_ycbcr_high_subsampling" },
>> +	{ DRM_HDMI_OUTPUT_YCBCR_LQ, "output_ycbcr_low_subsampling" },
>> +	{ DRM_HDMI_OUTPUT_INVALID, "invalid_output" },
>> +};
>> +
>> +static void
>> +dw_hdmi_rockchip_attach_properties(struct drm_connector *connector,
>> +				   unsigned int color, int version,
>> +				   void *data)
>> +{
>> +	struct rockchip_hdmi *hdmi = (struct rockchip_hdmi *)data;
>> +	struct drm_property *prop;
>> +
>> +	switch (color) {
>> +	case MEDIA_BUS_FMT_RGB101010_1X30:
>> +		hdmi->hdmi_output = DRM_HDMI_OUTPUT_DEFAULT_RGB;
>> +		hdmi->colordepth = 10;
>> +		break;
>> +	case MEDIA_BUS_FMT_YUV8_1X24:
>> +		hdmi->hdmi_output = DRM_HDMI_OUTPUT_YCBCR444;
>> +		hdmi->colordepth = 8;
>> +		break;
>> +	case MEDIA_BUS_FMT_YUV10_1X30:
>> +		hdmi->hdmi_output = DRM_HDMI_OUTPUT_YCBCR444;
>> +		hdmi->colordepth = 10;
>> +		break;
>> +	case MEDIA_BUS_FMT_UYVY10_1X20:
>> +		hdmi->hdmi_output = DRM_HDMI_OUTPUT_YCBCR422;
>> +		hdmi->colordepth = 10;
>> +		break;
>> +	case MEDIA_BUS_FMT_UYVY8_1X16:
>> +		hdmi->hdmi_output = DRM_HDMI_OUTPUT_YCBCR422;
>> +		hdmi->colordepth = 8;
>> +		break;
>> +	case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
>> +		hdmi->hdmi_output = DRM_HDMI_OUTPUT_YCBCR420;
>> +		hdmi->colordepth = 8;
>> +		break;
>> +	case MEDIA_BUS_FMT_UYYVYY10_0_5X30:
>> +		hdmi->hdmi_output = DRM_HDMI_OUTPUT_YCBCR420;
>> +		hdmi->colordepth = 10;
>> +		break;
>> +	default:
>> +		hdmi->hdmi_output = DRM_HDMI_OUTPUT_DEFAULT_RGB;
>> +		hdmi->colordepth = 8;
>> +	}
>> +
>> +	prop = drm_property_create_enum(connector->dev, 0,
>> +					"hdmi_output_depth",
>> +					color_depth_enum_list,
>> +					ARRAY_SIZE(color_depth_enum_list));
>> +	if (prop) {
>> +		hdmi->color_depth_property = prop;
>> +		drm_object_attach_property(&connector->base, prop, 0);
>> +	}
>> +
>> +	prop = drm_property_create_enum(connector->dev, 0, "hdmi_output_format",
>> +					drm_hdmi_output_enum_list,
>> +					ARRAY_SIZE(drm_hdmi_output_enum_list));
>> +	if (prop) {
>> +		hdmi->hdmi_output_property = prop;
>> +		drm_object_attach_property(&connector->base, prop, 0);
>> +	}
>> +}
>> +
>> +static void
>> +dw_hdmi_rockchip_destroy_properties(struct drm_connector *connector,
>> +				    void *data)
>> +{
>> +	struct rockchip_hdmi *hdmi = (struct rockchip_hdmi *)data;
>> +
>> +	if (hdmi->color_depth_property) {
>> +		drm_property_destroy(connector->dev,
>> +				     hdmi->color_depth_property);
>> +		hdmi->color_depth_property = NULL;
>> +	}
>> +
>> +	if (hdmi->hdmi_output_property) {
>> +		drm_property_destroy(connector->dev,
>> +				     hdmi->hdmi_output_property);
>> +		hdmi->hdmi_output_property = NULL;
>> +	}
>> +}
>> +
>> +static int
>> +dw_hdmi_rockchip_set_property(struct drm_connector *connector,
>> +			      struct drm_connector_state *state,
>> +			      struct drm_property *property,
>> +			      u64 val,
>> +			      void *data)
>> +{
>> +	struct rockchip_hdmi *hdmi = (struct rockchip_hdmi *)data;
>> +
>> +	if (property == hdmi->color_depth_property) {
>> +		hdmi->colordepth = val;
>> +		return 0;
>> +	} else if (property == hdmi->hdmi_output_property) {
>> +		hdmi->hdmi_output = val;
>> +		return 0;
>> +	}
>> +
>> +	DRM_ERROR("failed to set rockchip hdmi connector property\n");
>> +	return -EINVAL;
>> +}
>> +
>> +static int
>> +dw_hdmi_rockchip_get_property(struct drm_connector *connector,
>> +			      const struct drm_connector_state *state,
>> +			      struct drm_property *property,
>> +			      u64 *val,
>> +			      void *data)
>> +{
>> +	struct rockchip_hdmi *hdmi = (struct rockchip_hdmi *)data;
>> +
>> +	if (property == hdmi->color_depth_property) {
>> +		*val = hdmi->colordepth;
>> +		return 0;
>> +	} else if (property == hdmi->hdmi_output_property) {
>> +		*val = hdmi->hdmi_output;
>> +		return 0;
>> +	}
>> +
>> +	DRM_ERROR("failed to get rockchip hdmi connector property\n");
>> +	return -EINVAL;
>> +}
>> +
>> +static const struct dw_hdmi_property_ops dw_hdmi_rockchip_property_ops = {
>> +	.attach_properties	= dw_hdmi_rockchip_attach_properties,
>> +	.destroy_properties	= dw_hdmi_rockchip_destroy_properties,
>> +	.set_property		= dw_hdmi_rockchip_set_property,
>> +	.get_property		= dw_hdmi_rockchip_get_property,
>> +};
>> +
>>   static void dw_hdmi_rk3228_setup_hpd(struct dw_hdmi *dw_hdmi, void *data)
>>   {
>>   	struct rockchip_hdmi *hdmi = (struct rockchip_hdmi *)data;
>> @@ -511,6 +682,9 @@ static int dw_hdmi_rockchip_bind(struct device *dev, struct device *master,
>>   	hdmi->dev = &pdev->dev;
>>   	hdmi->chip_data = plat_data->phy_data;
>>   	plat_data->phy_data = hdmi;
>> +
>> +	plat_data->property_ops = &dw_hdmi_rockchip_property_ops;
>> +
>>   	encoder = &hdmi->encoder;
>>   
>>   	encoder->possible_crtcs = drm_of_find_possible_crtcs(drm, dev->of_node);
>> diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
>> index ea34ca146b82..dc561ebe7a9b 100644
>> --- a/include/drm/bridge/dw_hdmi.h
>> +++ b/include/drm/bridge/dw_hdmi.h
>> @@ -6,6 +6,7 @@
>>   #ifndef __DW_HDMI__
>>   #define __DW_HDMI__
>>   
>> +#include <drm/drm_property.h>
>>   #include <sound/hdmi-codec.h>
>>   
>>   struct drm_display_info;
>> @@ -123,6 +124,24 @@ struct dw_hdmi_phy_ops {
>>   	void (*setup_hpd)(struct dw_hdmi *hdmi, void *data);
>>   };
>>   
>> +struct dw_hdmi_property_ops {
>> +	void (*attach_properties)(struct drm_connector *connector,
>> +				  unsigned int color, int version,
>> +				  void *data);
>> +	void (*destroy_properties)(struct drm_connector *connector,
>> +				   void *data);
>> +	int (*set_property)(struct drm_connector *connector,
>> +			    struct drm_connector_state *state,
>> +			    struct drm_property *property,
>> +			    u64 val,
>> +			    void *data);
>> +	int (*get_property)(struct drm_connector *connector,
>> +			    const struct drm_connector_state *state,
>> +			    struct drm_property *property,
>> +			    u64 *val,
>> +			    void *data);
>> +};
>> +
>>   struct dw_hdmi_plat_data {
>>   	struct regmap *regm;
>>   
>> @@ -141,6 +160,9 @@ struct dw_hdmi_plat_data {
>>   					   const struct drm_display_info *info,
>>   					   const struct drm_display_mode *mode);
>>   
>> +	/* Vendor Property support */
>> +	const struct dw_hdmi_property_ops *property_ops;
>> +
>>   	/* Vendor PHY support */
>>   	const struct dw_hdmi_phy_ops *phy_ops;
>>   	const char *phy_name;

--------------413B129AAB0C4F7D9FD853CA
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Lauren,</p>
    <p>Thank you for your review.<span style="color: rgb(51, 51, 51);
        font-family: Arial, 'Microsoft YaHei', '\\5FAE软雅黑', '\\5B8B体',
        'Malgun Gothic', Meiryo, sans-serif; font-size: 14px;
        font-style: normal; font-variant: normal; font-weight: normal;
        letter-spacing: normal; line-height: 26px; orphans: auto;
        text-align: justify; text-indent: 0px; text-transform: none;
        white-space: normal; widows: auto; word-spacing: 0px;
        -webkit-text-stroke-width: 0px; background-color: rgb(247, 248,
        250); display: inline !important; float: none;"></span> </p>
    <div class="moz-cite-prefix">在 2020/8/12 17:33, Laurent Pinchart 写道:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20200812093315.GE6057@pendragon.ideasonboard.com">
      <pre class="moz-quote-pre" wrap="">Hi Algea,

Thank you for the patch.

On Wed, Aug 12, 2020 at 04:35:43PM +0800, Algea Cao wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Introduce struct dw_hdmi_property_ops in plat_data to support
vendor hdmi property.

Implement hdmi vendor properties color_depth_property and
hdmi_output_property to config hdmi output color depth and
color format.

The property "hdmi_output_format", the possible value
could be:
         - RGB
         - YCBCR 444
         - YCBCR 422
         - YCBCR 420

Default value of the property is set to 0 = RGB, so no changes if you
don't set the property.

The property "hdmi_output_depth" possible value could be
         - Automatic
           This indicates prefer highest color depth, it is
           30bit on rockcip platform.
         - 24bit
         - 30bit
The default value of property is 24bit.

Signed-off-by: Algea Cao <a class="moz-txt-link-rfc2396E" href="mailto:algea.cao@rock-chips.com">&lt;algea.cao@rock-chips.com&gt;</a>
---

 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c | 174 ++++++++++++++++++++
 include/drm/bridge/dw_hdmi.h                |  22 +++
 2 files changed, 196 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
index 23de359a1dec..8f22d9a566db 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c
@@ -52,6 +52,27 @@
 
 #define HIWORD_UPDATE(val, mask)	(val | (mask) &lt;&lt; 16)
 
+/* HDMI output pixel format */
+enum drm_hdmi_output_type {
+	DRM_HDMI_OUTPUT_DEFAULT_RGB, /* default RGB */
+	DRM_HDMI_OUTPUT_YCBCR444, /* YCBCR 444 */
+	DRM_HDMI_OUTPUT_YCBCR422, /* YCBCR 422 */
+	DRM_HDMI_OUTPUT_YCBCR420, /* YCBCR 420 */
+	DRM_HDMI_OUTPUT_YCBCR_HQ, /* Highest subsampled YUV */
+	DRM_HDMI_OUTPUT_YCBCR_LQ, /* Lowest subsampled YUV */
+	DRM_HDMI_OUTPUT_INVALID, /* Guess what ? */
+};
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Vendor-specific properties shouldn't use names starting with drm_ or
DRM_, that's for the DRM core. But this doesn't seem specific to
Rockchip at all, it should be a standard property. Additionally, new
properties need to come with a userspace implementation showing their
usage, in X.org, Weston, the Android DRM/KMS HW composer, or another
relevant upstream project (a test tool is usually not enough).
</pre>
    </blockquote>
    <p><br>
    </p>
    <p>We use these properties only in Android HW composer, But we can't
      upstream</p>
    <p>our HW composer code right now.  Can we use this properties as
      private property <br>
    </p>
    <p>and do not upstream HW composer for the time being?<br>
    </p>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:20200812093315.GE6057@pendragon.ideasonboard.com">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+
+enum dw_hdmi_rockchip_color_depth {
+	ROCKCHIP_HDMI_DEPTH_8,
+	ROCKCHIP_HDMI_DEPTH_10,
+	ROCKCHIP_HDMI_DEPTH_12,
+	ROCKCHIP_HDMI_DEPTH_16,
+	ROCKCHIP_HDMI_DEPTH_420_10,
+	ROCKCHIP_HDMI_DEPTH_420_12,
+	ROCKCHIP_HDMI_DEPTH_420_16
+};
+
 /**
  * struct rockchip_hdmi_chip_data - splite the grf setting of kind of chips
  * @lcdsel_grf_reg: grf register offset of lcdc select
@@ -73,6 +94,12 @@ struct rockchip_hdmi {
 	struct clk *grf_clk;
 	struct dw_hdmi *hdmi;
 	struct phy *phy;
+
+	struct drm_property *color_depth_property;
+	struct drm_property *hdmi_output_property;
+
+	unsigned int colordepth;
+	enum drm_hdmi_output_type hdmi_output;
 };
 
 #define to_rockchip_hdmi(x)	container_of(x, struct rockchip_hdmi, x)
@@ -327,6 +354,150 @@ static void dw_hdmi_rockchip_genphy_disable(struct dw_hdmi *dw_hdmi, void *data)
 	phy_power_off(hdmi-&gt;phy);
 }
 
+static const struct drm_prop_enum_list color_depth_enum_list[] = {
+	{ 0, "Automatic" }, /* Prefer highest color depth */
+	{ 8, "24bit" },
+	{ 10, "30bit" },
+};
+
+static const struct drm_prop_enum_list drm_hdmi_output_enum_list[] = {
+	{ DRM_HDMI_OUTPUT_DEFAULT_RGB, "output_rgb" },
+	{ DRM_HDMI_OUTPUT_YCBCR444, "output_ycbcr444" },
+	{ DRM_HDMI_OUTPUT_YCBCR422, "output_ycbcr422" },
+	{ DRM_HDMI_OUTPUT_YCBCR420, "output_ycbcr420" },
+	{ DRM_HDMI_OUTPUT_YCBCR_HQ, "output_ycbcr_high_subsampling" },
+	{ DRM_HDMI_OUTPUT_YCBCR_LQ, "output_ycbcr_low_subsampling" },
+	{ DRM_HDMI_OUTPUT_INVALID, "invalid_output" },
+};
+
+static void
+dw_hdmi_rockchip_attach_properties(struct drm_connector *connector,
+				   unsigned int color, int version,
+				   void *data)
+{
+	struct rockchip_hdmi *hdmi = (struct rockchip_hdmi *)data;
+	struct drm_property *prop;
+
+	switch (color) {
+	case MEDIA_BUS_FMT_RGB101010_1X30:
+		hdmi-&gt;hdmi_output = DRM_HDMI_OUTPUT_DEFAULT_RGB;
+		hdmi-&gt;colordepth = 10;
+		break;
+	case MEDIA_BUS_FMT_YUV8_1X24:
+		hdmi-&gt;hdmi_output = DRM_HDMI_OUTPUT_YCBCR444;
+		hdmi-&gt;colordepth = 8;
+		break;
+	case MEDIA_BUS_FMT_YUV10_1X30:
+		hdmi-&gt;hdmi_output = DRM_HDMI_OUTPUT_YCBCR444;
+		hdmi-&gt;colordepth = 10;
+		break;
+	case MEDIA_BUS_FMT_UYVY10_1X20:
+		hdmi-&gt;hdmi_output = DRM_HDMI_OUTPUT_YCBCR422;
+		hdmi-&gt;colordepth = 10;
+		break;
+	case MEDIA_BUS_FMT_UYVY8_1X16:
+		hdmi-&gt;hdmi_output = DRM_HDMI_OUTPUT_YCBCR422;
+		hdmi-&gt;colordepth = 8;
+		break;
+	case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
+		hdmi-&gt;hdmi_output = DRM_HDMI_OUTPUT_YCBCR420;
+		hdmi-&gt;colordepth = 8;
+		break;
+	case MEDIA_BUS_FMT_UYYVYY10_0_5X30:
+		hdmi-&gt;hdmi_output = DRM_HDMI_OUTPUT_YCBCR420;
+		hdmi-&gt;colordepth = 10;
+		break;
+	default:
+		hdmi-&gt;hdmi_output = DRM_HDMI_OUTPUT_DEFAULT_RGB;
+		hdmi-&gt;colordepth = 8;
+	}
+
+	prop = drm_property_create_enum(connector-&gt;dev, 0,
+					"hdmi_output_depth",
+					color_depth_enum_list,
+					ARRAY_SIZE(color_depth_enum_list));
+	if (prop) {
+		hdmi-&gt;color_depth_property = prop;
+		drm_object_attach_property(&amp;connector-&gt;base, prop, 0);
+	}
+
+	prop = drm_property_create_enum(connector-&gt;dev, 0, "hdmi_output_format",
+					drm_hdmi_output_enum_list,
+					ARRAY_SIZE(drm_hdmi_output_enum_list));
+	if (prop) {
+		hdmi-&gt;hdmi_output_property = prop;
+		drm_object_attach_property(&amp;connector-&gt;base, prop, 0);
+	}
+}
+
+static void
+dw_hdmi_rockchip_destroy_properties(struct drm_connector *connector,
+				    void *data)
+{
+	struct rockchip_hdmi *hdmi = (struct rockchip_hdmi *)data;
+
+	if (hdmi-&gt;color_depth_property) {
+		drm_property_destroy(connector-&gt;dev,
+				     hdmi-&gt;color_depth_property);
+		hdmi-&gt;color_depth_property = NULL;
+	}
+
+	if (hdmi-&gt;hdmi_output_property) {
+		drm_property_destroy(connector-&gt;dev,
+				     hdmi-&gt;hdmi_output_property);
+		hdmi-&gt;hdmi_output_property = NULL;
+	}
+}
+
+static int
+dw_hdmi_rockchip_set_property(struct drm_connector *connector,
+			      struct drm_connector_state *state,
+			      struct drm_property *property,
+			      u64 val,
+			      void *data)
+{
+	struct rockchip_hdmi *hdmi = (struct rockchip_hdmi *)data;
+
+	if (property == hdmi-&gt;color_depth_property) {
+		hdmi-&gt;colordepth = val;
+		return 0;
+	} else if (property == hdmi-&gt;hdmi_output_property) {
+		hdmi-&gt;hdmi_output = val;
+		return 0;
+	}
+
+	DRM_ERROR("failed to set rockchip hdmi connector property\n");
+	return -EINVAL;
+}
+
+static int
+dw_hdmi_rockchip_get_property(struct drm_connector *connector,
+			      const struct drm_connector_state *state,
+			      struct drm_property *property,
+			      u64 *val,
+			      void *data)
+{
+	struct rockchip_hdmi *hdmi = (struct rockchip_hdmi *)data;
+
+	if (property == hdmi-&gt;color_depth_property) {
+		*val = hdmi-&gt;colordepth;
+		return 0;
+	} else if (property == hdmi-&gt;hdmi_output_property) {
+		*val = hdmi-&gt;hdmi_output;
+		return 0;
+	}
+
+	DRM_ERROR("failed to get rockchip hdmi connector property\n");
+	return -EINVAL;
+}
+
+static const struct dw_hdmi_property_ops dw_hdmi_rockchip_property_ops = {
+	.attach_properties	= dw_hdmi_rockchip_attach_properties,
+	.destroy_properties	= dw_hdmi_rockchip_destroy_properties,
+	.set_property		= dw_hdmi_rockchip_set_property,
+	.get_property		= dw_hdmi_rockchip_get_property,
+};
+
 static void dw_hdmi_rk3228_setup_hpd(struct dw_hdmi *dw_hdmi, void *data)
 {
 	struct rockchip_hdmi *hdmi = (struct rockchip_hdmi *)data;
@@ -511,6 +682,9 @@ static int dw_hdmi_rockchip_bind(struct device *dev, struct device *master,
 	hdmi-&gt;dev = &amp;pdev-&gt;dev;
 	hdmi-&gt;chip_data = plat_data-&gt;phy_data;
 	plat_data-&gt;phy_data = hdmi;
+
+	plat_data-&gt;property_ops = &amp;dw_hdmi_rockchip_property_ops;
+
 	encoder = &amp;hdmi-&gt;encoder;
 
 	encoder-&gt;possible_crtcs = drm_of_find_possible_crtcs(drm, dev-&gt;of_node);
diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
index ea34ca146b82..dc561ebe7a9b 100644
--- a/include/drm/bridge/dw_hdmi.h
+++ b/include/drm/bridge/dw_hdmi.h
@@ -6,6 +6,7 @@
 #ifndef __DW_HDMI__
 #define __DW_HDMI__
 
+#include &lt;drm/drm_property.h&gt;
 #include &lt;sound/hdmi-codec.h&gt;
 
 struct drm_display_info;
@@ -123,6 +124,24 @@ struct dw_hdmi_phy_ops {
 	void (*setup_hpd)(struct dw_hdmi *hdmi, void *data);
 };
 
+struct dw_hdmi_property_ops {
+	void (*attach_properties)(struct drm_connector *connector,
+				  unsigned int color, int version,
+				  void *data);
+	void (*destroy_properties)(struct drm_connector *connector,
+				   void *data);
+	int (*set_property)(struct drm_connector *connector,
+			    struct drm_connector_state *state,
+			    struct drm_property *property,
+			    u64 val,
+			    void *data);
+	int (*get_property)(struct drm_connector *connector,
+			    const struct drm_connector_state *state,
+			    struct drm_property *property,
+			    u64 *val,
+			    void *data);
+};
+
 struct dw_hdmi_plat_data {
 	struct regmap *regm;
 
@@ -141,6 +160,9 @@ struct dw_hdmi_plat_data {
 					   const struct drm_display_info *info,
 					   const struct drm_display_mode *mode);
 
+	/* Vendor Property support */
+	const struct dw_hdmi_property_ops *property_ops;
+
 	/* Vendor PHY support */
 	const struct dw_hdmi_phy_ops *phy_ops;
 	const char *phy_name;
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
  </body>
</html>

--------------413B129AAB0C4F7D9FD853CA--



--===============1726507941==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1726507941==--


