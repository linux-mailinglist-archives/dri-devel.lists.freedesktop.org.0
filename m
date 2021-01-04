Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6DC2E97BF
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 15:55:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B56B689CB5;
	Mon,  4 Jan 2021 14:55:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2130.oracle.com (aserp2130.oracle.com [141.146.126.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAB4489CB5
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Jan 2021 14:55:08 +0000 (UTC)
Received: from pps.filterd (aserp2130.oracle.com [127.0.0.1])
 by aserp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 104EsilD011292;
 Mon, 4 Jan 2021 14:54:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=dnocVcTsgoPYnIHPldL769OdktMS5cDE6wAGV/6tBS0=;
 b=DOiqhhhGTBzi8XIy+mZ7zxs1yKUYl38bvcq4V9AYPJHbDxGQkMAMFxG/aRvqhW4LBiG2
 zqAfPb4fhgdtYEwluwbKiU2sKUcUdNT6GFofNmOt2jqXTvoW+is2W0Pf8gZG7UbskJR9
 2x63uq+k8ojQZfECInbb9x2m8dlQCDgCFQUopEe3McG47aBhkMIntgxCflBWnIhkpnEM
 bMbX/uj+dQvgfUBcKxkcy2mDJWDbyPRtW1Ccjbg1Fb6l49uu5GPvn/kJn+OuqT6FoYRr
 N/hriICkUbnRHetOxVTiT1MO5KYNgrQNFhpobBXHbtTv/yiGoaoqQIQkH4+8r+zPxRfe qw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2130.oracle.com with ESMTP id 35tebampjx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 04 Jan 2021 14:54:46 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 104EqYAe162863;
 Mon, 4 Jan 2021 14:52:45 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3030.oracle.com with ESMTP id 35v2ax951u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 04 Jan 2021 14:52:45 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 104Eoucl008997;
 Mon, 4 Jan 2021 14:50:56 GMT
Received: from kadam (/102.36.221.92) by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 04 Jan 2021 14:50:54 +0000
Date: Mon, 4 Jan 2021 17:50:39 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Xin Ji <xji@analogixsemi.com>
Subject: Re: [PATCH v1 2/2] drm/bridge: anx7625: add MIPI DPI input feature
 support
Message-ID: <20210104145039.GT2809@kadam>
References: <cover.1608883950.git.xji@analogixsemi.com>
 <ec0282f620ac472886d3e349bb6a09394b747edb.1608883950.git.xji@analogixsemi.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ec0282f620ac472886d3e349bb6a09394b747edb.1608883950.git.xji@analogixsemi.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9853
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 adultscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101040097
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9853
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 clxscore=1011 bulkscore=0
 lowpriorityscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101040098
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
Cc: devel@driverdev.osuosl.org, Nicolas Boichat <drinkcat@google.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Vasily Khoruzhick <anarsoul@gmail.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Torsten Duwe <duwe@lst.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Sam Ravnborg <sam@ravnborg.org>,
 Sheng Pan <span@analogixsemi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 25, 2020 at 07:02:15PM +0800, Xin Ji wrote:
> +static int anx7625_aux_dpcd_read(struct anx7625_data *ctx,
> +				 u8 addrh, u8 addrm, u8 addrl,
> +				 u8 len, u8 *buf)
> +{
> +	struct device *dev = &ctx->client->dev;
> +	int ret;
> +	u8 cmd;
> +
> +	if (len > MAX_DPCD_BUFFER_SIZE) {
> +		DRM_DEV_ERROR(dev, "exceed aux buffer len.\n");
> +		return -E2BIG;

s/E2BIG/EINVAL/.  -E2BIG means something else.

> +	}
> +
> +	cmd = ((len - 1) << 4) | 0x09;
> +
> +	/* Set command and length */
> +	ret = anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> +				AP_AUX_COMMAND, cmd);
> +
> +	/* Set aux access address */
> +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> +				 AP_AUX_ADDR_7_0, addrl);
> +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> +				 AP_AUX_ADDR_15_8, addrm);
> +	ret |= anx7625_write_and(ctx, ctx->i2c.rx_p0_client,
> +				 AP_AUX_ADDR_19_16, addrh);
> +
> +	/* Enable aux access */
> +	ret |= anx7625_write_or(ctx, ctx->i2c.rx_p0_client,
> +				AP_AUX_CTRL_STATUS, AP_AUX_CTRL_OP_EN);
> +
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(dev, "cannot access aux related register.\n");
> +		return -EIO;
> +	}
> +
> +	usleep_range(2000, 2100);
> +
> +	ret = wait_aux_op_finish(ctx);
> +	if (ret) {
> +		DRM_DEV_ERROR(dev, "aux IO error: wait aux op finish.\n");
> +		return ret;
> +	}
> +
> +	ret = anx7625_reg_block_read(ctx, ctx->i2c.rx_p0_client,
> +				     AP_AUX_BUFF_START, len, buf);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(dev, "read dpcd register failed\n");
> +		return -EIO;
>  	}
>  
> -	return val;
> +	return 0;
>  }
>  
>  static int anx7625_video_mute_control(struct anx7625_data *ctx,
> @@ -595,6 +663,101 @@ static int anx7625_dsi_config(struct anx7625_data *ctx)
>  	return ret;
>  }
>  
> +static int anx7625_api_dpi_config(struct anx7625_data *ctx)
> +{
> +	struct device *dev = &ctx->client->dev;
> +	u16 freq = ctx->dt.pixelclock.min / 1000;
> +	int ret;
> +
> +	/* configure pixel clock */
> +	ret = anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> +				PIXEL_CLOCK_L, freq & 0xFF);
> +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
> +				 PIXEL_CLOCK_H, (freq >> 8));
> +
> +	/* set DPI mode */
> +	/* set to DPI PLL module sel */
> +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
> +				 MIPI_DIGITAL_PLL_9, 0x20);
> +	/* power down MIPI */
> +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
> +				 MIPI_LANE_CTRL_10, 0x08);
> +	/* enable DPI mode */
> +	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
> +				 MIPI_DIGITAL_PLL_18, 0x1C);
> +	/* set first edge */
> +	ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
> +				 VIDEO_CONTROL_0, 0x06);
> +	if (ret < 0)
> +		DRM_DEV_ERROR(dev, "IO error : dpi phy set failed.\n");
> +
> +	return ret;
> +}
> +
> +static int anx7625_dpi_config(struct anx7625_data *ctx)
> +{
> +	struct device *dev = &ctx->client->dev;
> +	int ret;
> +
> +	DRM_DEV_DEBUG_DRIVER(dev, "config dpi\n");
> +
> +	/* DSC disable */
> +	ret = anx7625_write_and(ctx, ctx->i2c.rx_p0_client,
> +				R_DSC_CTRL_0, ~DSC_EN);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(dev, "IO error : disable dsc failed.\n");
> +		return ret;
> +	}
> +
> +	ret = anx7625_config_bit_matrix(ctx);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(dev, "config bit matrix failed.\n");
> +		return ret;
> +	}
> +
> +	ret = anx7625_api_dpi_config(ctx);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(dev, "mipi phy(dpi) setup failed.\n");
> +		return ret;
> +	}
> +
> +	/* set MIPI RX EN */
> +	ret = anx7625_write_or(ctx, ctx->i2c.rx_p0_client,
> +			       AP_AV_STATUS, AP_MIPI_RX_EN);
> +	/* clear mute flag */
> +	ret |= anx7625_write_and(ctx, ctx->i2c.rx_p0_client,
> +				 AP_AV_STATUS, (u8)~AP_MIPI_MUTE);
> +	if (ret < 0)
> +		DRM_DEV_ERROR(dev, "IO error : enable mipi rx failed.\n");
> +
> +	return ret;
> +}
> +
> +static int anx7625_hdcp_setting(struct anx7625_data *ctx)
> +{
> +	u8 bcap;
> +	struct device *dev = &ctx->client->dev;
> +
> +	if (!(ctx->hdcp_support && ctx->hdcp_en)) {

Push the ! in and remove the parentheses.

	if (!ctx->hdcp_support || !ctx->hdcp_en) {


> +		DRM_DEV_DEBUG_DRIVER(dev, "hdcp_support(%d), hdcp_en(%d)\n",
> +				     ctx->hdcp_support, ctx->hdcp_en);
> +		DRM_DEV_DEBUG_DRIVER(dev, "disable HDCP by config\n");
> +		return anx7625_write_and(ctx, ctx->i2c.rx_p1_client,
> +					 0xee, 0x9f);
> +	}
> +
> +	anx7625_aux_dpcd_read(ctx, 0x06, 0x80, 0x28, 1, &bcap);
> +	if (!(bcap & 0x01)) {
> +		DRM_WARN("downstream not support HDCP 1.4, cap(%x).\n", bcap);
> +		return anx7625_write_and(ctx, ctx->i2c.rx_p1_client,
> +					 0xee, 0x9f);
> +	}
> +
> +	DRM_DEV_DEBUG_DRIVER(dev, "enable HDCP 1.4\n");
> +
> +	return anx7625_write_or(ctx, ctx->i2c.rx_p1_client, 0xee, 0x20);
> +}
> +
>  static void anx7625_dp_start(struct anx7625_data *ctx)
>  {
>  	int ret;
> @@ -605,9 +768,15 @@ static void anx7625_dp_start(struct anx7625_data *ctx)
>  		return;
>  	}
>  
> +	/* HDCP config */
> +	anx7625_hdcp_setting(ctx);
> +
>  	anx7625_config_audio_input(ctx);
>  
> -	ret = anx7625_dsi_config(ctx);
> +	if (ctx->pdata.is_dpi)
> +		ret = anx7625_dpi_config(ctx);
> +	else
> +		ret = anx7625_dsi_config(ctx);
>  
>  	if (ret < 0)
>  		DRM_DEV_ERROR(dev, "MIPI phy setup error.\n");
> @@ -688,8 +857,53 @@ static int sp_tx_get_edid_block(struct anx7625_data *ctx)
>  	return c;
>  }
>  
> -static int edid_read(struct anx7625_data *ctx,
> -		     u8 offset, u8 *pblock_buf)
> +static int check_hdcp_support(struct anx7625_data *ctx)
> +{
> +	int ret;
> +	struct device *dev = &ctx->client->dev;
> +
> +	/* Select HDCP1.4 Key load */
> +	anx7625_reg_write(ctx, ctx->i2c.rx_p0_client, FLASH_SRAM_SEL, 0x12);
> +	/* Select flash addr low byte */
> +	anx7625_reg_write(ctx, ctx->i2c.rx_p0_client, FLASH_ADDR_LOW, 0x91);
> +	/* Select flash addr high byte */
> +	anx7625_reg_write(ctx, ctx->i2c.rx_p0_client, FLASH_ADDR_HIGH, 0xa0);
> +	/* Select sram length high byte */
> +	anx7625_reg_write(ctx, ctx->i2c.rx_p0_client, SRAM_LEN_HIGH, 0x00);
> +	/* Select sram length low byte */
> +	anx7625_reg_write(ctx, ctx->i2c.rx_p0_client, SRAM_LEN_LOW, 0x27);
> +	/* Select flash length high byte */
> +	anx7625_reg_write(ctx, ctx->i2c.rx_p0_client, FLASH_LEN_HIGH, 0x02);
> +	/* Select flash length low byte */
> +	anx7625_reg_write(ctx, ctx->i2c.rx_p0_client, FLASH_LEN_LOW, 0x70);
> +	/* Select sram addr high byte */
> +	anx7625_reg_write(ctx, ctx->i2c.rx_p0_client, SRAM_ADDR_HIGH, 0x00);
> +	/* Select sram addr low byte */
> +	anx7625_reg_write(ctx, ctx->i2c.rx_p0_client, SRAM_ADDR_LOW, 0x00);
> +	/* Enable load with decrypt_en */
> +	anx7625_reg_write(ctx, ctx->i2c.rx_p0_client, FLASH_LOAD_STA, 0x03);
> +
> +	usleep_range(10000, 11000);
> +
> +	/* Check load status */
> +	ret = anx7625_reg_read(ctx, ctx->i2c.rx_p0_client, FLASH_LOAD_STA);
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(dev, "IO error : access flash load.\n");
> +		return ret;
> +	}
> +
> +	if ((ret & 0xF2) != 0xF2) {
> +		ctx->hdcp_support = 0;
> +		DRM_DEV_DEBUG_DRIVER(dev, "not support HDCP\n");
> +	} else {
> +		ctx->hdcp_support = 1;
> +		DRM_DEV_DEBUG_DRIVER(dev, "support HDCP\n");
> +	}
> +
> +	return 0;
> +}
> +
> +static int edid_read(struct anx7625_data *ctx, u8 offset, u8 *pblock_buf)
>  {
>  	int ret, cnt;
>  	struct device *dev = &ctx->client->dev;
> @@ -718,6 +932,15 @@ static int edid_read(struct anx7625_data *ctx,
>  	return 0;
>  }
>  
> +void hdcp_enable(struct anx7625_data *ctx, int en)
> +{
> +	struct device *dev = &ctx->client->dev;
> +
> +	DRM_DEV_DEBUG_DRIVER(dev, "en(%d)\n", en);
> +
> +	ctx->hdcp_en = !!en;
> +}
> +
>  static int segments_edid_read(struct anx7625_data *ctx,
>  			      u8 segment, u8 *buf, u8 offset)
>  {
> @@ -992,8 +1215,10 @@ static void anx7625_chip_control(struct anx7625_data *ctx, int state)
>  
>  	if (state) {
>  		atomic_inc(&ctx->power_status);
> -		if (atomic_read(&ctx->power_status) == 1)
> +		if (atomic_read(&ctx->power_status) == 1) {
>  			anx7625_power_on_init(ctx);
> +			check_hdcp_support(ctx);
> +		}
>  	} else {
>  		if (atomic_read(&ctx->power_status)) {
>  			atomic_dec(&ctx->power_status);
> @@ -1051,6 +1276,7 @@ static void anx7625_start_dp_work(struct anx7625_data *ctx)
>  		return;
>  	}
>  
> +	ctx->hpd_status = 1;
>  	ctx->hpd_high_cnt++;
>  
>  	/* Not support HDCP */
> @@ -1060,8 +1286,10 @@ static void anx7625_start_dp_work(struct anx7625_data *ctx)
>  	ret |= anx7625_write_or(ctx, ctx->i2c.rx_p1_client, 0xec, 0x10);
>  	/* Interrupt for DRM */
>  	ret |= anx7625_write_or(ctx, ctx->i2c.rx_p1_client, 0xff, 0x01);
> -	if (ret < 0)
> +	if (ret < 0) {
> +		DRM_DEV_ERROR(dev, "fail to setting HDCP/auth\n");
>  		return;
> +	}
>  
>  	ret = anx7625_reg_read(ctx, ctx->i2c.rx_p1_client, 0x86);
>  	if (ret < 0)
> @@ -1080,6 +1308,10 @@ static void anx7625_hpd_polling(struct anx7625_data *ctx)
>  	int ret, val;
>  	struct device *dev = &ctx->client->dev;
>  
> +	/* Interrupt mode, no need poll HPD status, just return */
> +	if (ctx->pdata.intp_irq)
> +		return;
> +
>  	if (atomic_read(&ctx->power_status) != 1) {
>  		DRM_DEV_DEBUG_DRIVER(dev, "No need to poling HPD status.\n");
>  		return;
> @@ -1130,6 +1362,22 @@ static void anx7625_remove_edid(struct anx7625_data *ctx)
>  	ctx->slimport_edid_p.edid_block_num = -1;
>  }
>  
> +static void anx7625_dp_adjust_swing(struct anx7625_data *ctx)
> +{
> +	struct device *dev = &ctx->client->dev;
> +	int i;
> +
> +	if (!ctx->pdata.reg_table_size)
> +		return;

No need for this check.  Just remove it and the for loop becomes a no-op.

> +
> +	DRM_DEV_DEBUG_DRIVER(dev, "adjust DP tx swing\n");

Delete this debug statement and use ftrace for this information.

> +
> +	for (i = 0; i < ctx->pdata.reg_table_size; i++)
> +		anx7625_reg_write(ctx, ctx->i2c.tx_p1_client,
> +				  ctx->pdata.art[i].offset & 0xFF,
> +				  ctx->pdata.art[i].data & 0xFF);
> +}
> +
>  static void dp_hpd_change_handler(struct anx7625_data *ctx, bool on)
>  {
>  	struct device *dev = &ctx->client->dev;
> @@ -1145,9 +1393,8 @@ static void dp_hpd_change_handler(struct anx7625_data *ctx, bool on)
>  	} else {
>  		DRM_DEV_DEBUG_DRIVER(dev, " HPD high\n");
>  		anx7625_start_dp_work(ctx);
> +		anx7625_dp_adjust_swing(ctx);
>  	}
> -
> -	ctx->hpd_status = 1;
>  }
>  
>  static int anx7625_hpd_change_detect(struct anx7625_data *ctx)
> @@ -1224,12 +1471,63 @@ static irqreturn_t anx7625_intr_hpd_isr(int irq, void *data)
>  	return IRQ_HANDLED;
>  }
>  
> +static int anx7625_get_u32_value(struct device_node *np,
> +				 const char *name,
> +				 int start_pos,
> +				 int *reg_data)
> +{
> +	int i, ret;
> +
> +	/* each slot has 2 cells */
> +	for (i = 0; i < 2; i++) {
> +		ret = of_property_read_u32_index(np, name,
> +						 start_pos + i,
> +						 &reg_data[i]);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
>  static int anx7625_parse_dt(struct device *dev,
>  			    struct anx7625_platform_data *pdata)
>  {
>  	struct device_node *np = dev->of_node;
>  	struct drm_panel *panel;
> -	int ret;
> +	int ret, i;
> +	int reg_data[2];
> +	int total_size, num_regs, start_pos;
> +
> +	if (of_get_property(dev->of_node, "anx,swing-setting", &total_size)) {
> +		/* each slot has 2 cells */
> +		num_regs = total_size / (sizeof(u32) * 2);
> +		if (num_regs > MAX_REG_SIZE)
> +			num_regs = MAX_REG_SIZE;
> +
> +		pdata->reg_table_size = num_regs;
> +
> +		for (i = 0; i < num_regs; i++) {
> +			start_pos = i * 2;
> +			ret = anx7625_get_u32_value(np, "anx,swing-setting",
> +						    start_pos, reg_data);
> +			if (ret) {
> +				DRM_DEV_ERROR(dev, "get swing-setting at %d\n",
> +					      start_pos);
> +				return -ENODEV;

return ret;?

regards,
dan carpenter

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
