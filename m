Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA731407E5
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2020 11:27:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0488D6F4D8;
	Fri, 17 Jan 2020 10:27:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC0716F4D8
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 10:27:34 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200117102732euoutp023d16a2022bdfc0eb7a4a8c744b88d9c4~qpb2Nr6hZ3107231072euoutp02k
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 10:27:32 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200117102732euoutp023d16a2022bdfc0eb7a4a8c744b88d9c4~qpb2Nr6hZ3107231072euoutp02k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1579256852;
 bh=bTfhQitb0NO9m5qt55r1QEwjc0OWAYz3OAD+x0ZllQE=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=H+Cw2gskbns1OlUHhYdpA4l0b7FBdMETo3GFmCZRMQ8sVI4Clm7epWpYO8lOWCilt
 /HxedbTJEDyz8pyDyip6lgiPqb24SPFtQuhfL5SGHwq7cLdf7Uq/Ux+M77Q8Ay9iud
 0gVX0n19sBARzPcXsm4o2N8aDexRiEGuMAhCWM4o=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200117102732eucas1p210aff5117fb2e578e00c2d5cb479420a~qpb19Fl_y3155631556eucas1p2E;
 Fri, 17 Jan 2020 10:27:32 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id C7.BD.61286.41C812E5; Fri, 17
 Jan 2020 10:27:32 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200117102731eucas1p2cce1ecd1d36a5b209d73df59d7245da0~qpb1RkpcB1699216992eucas1p2H;
 Fri, 17 Jan 2020 10:27:31 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20200117102731eusmtrp11930d4cab98b10388a71d2f1a3bb4919~qpb1QtELx1399313993eusmtrp1m;
 Fri, 17 Jan 2020 10:27:31 +0000 (GMT)
X-AuditID: cbfec7f2-f0bff7000001ef66-61-5e218c146be2
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id B8.F8.08375.31C812E5; Fri, 17
 Jan 2020 10:27:31 +0000 (GMT)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20200117102730eusmtip13d0f85c6defeaa0f9df3002127e559a4~qpb0C1sGp2982629826eusmtip1K;
 Fri, 17 Jan 2020 10:27:30 +0000 (GMT)
Subject: Re: [RESEND v3 2/2] drm: bridge: adv7511: Add support for ADV7535
To: Bogdan Togorean <bogdan.togorean@analog.com>,
 dri-devel@lists.freedesktop.org
From: Andrzej Hajda <a.hajda@samsung.com>
Message-ID: <982e6232-f257-86d2-3ca0-3a99daec3767@samsung.com>
Date: Fri, 17 Jan 2020 11:27:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200107133431.5201-3-bogdan.togorean@analog.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02Sf0yMcRzH932+zz33lC5PJ/osP+JkxuZHo+07LGyNL8PITENxeJamDneO
 /NhEsiuVSLlOEroJ/SDqkhkOpayjXOTHnNbN/DqWulosdPcw/ff6ft6fz/vzeW9fHitzuWA+
 XrNT1GrUCSrOl62u67NNCcwYFzs95eh4kmlrYEjem1sycij1JCa/q49jYnd/40jKhQqOtPZ+
 xKThSytL0o4Xy8mz2gKOmF80M6TWUcQQa9Za8ryvA5PU2w/kpKSvCpHrlbmYZNkWzlPS1JZ+
 jn5qnU9LC0sR/daWKqenk5tZeruniKWnDfkyWnk5jaOPslsY+tVmk1NLzzsZvXOmVE4dR+sZ
 WpzXytH35ypYejczh12uXOM7Z7OYEL9L1E6L2OC75UF7GbP9w+Kkcksjm4zez0lHPjwIM8Fd
 8lPuYaVQguBhzQD7DnA3gjxzMSs9uhDcsqRz/yZ6aoxIEi4iKDSlYenhQtBUbseermHCYnD8
 LPVyoLAS3J05XissZGHoLjvoFThhEvRff+m1VQgRYPtqlqUjnmeFCeC8m+ApDxeiwWnvkEkt
 AdCQ72Q97CPMhQ9vm72jWAgBi6sASxwEr5xnGc8uEOw8WDrsjMcThEhwVYVLCYbBp/obcolH
 weOcDFbiA+AoOYylWQOCqqs3sSTMhje2H5zHBw/cXFE7TSrPB2O2+a+9P7S5AqQT/OFE9Sks
 lRVgOKKUuseBo6nqr2EQmJ+6uWykMg0KZhoUxjQojOn/3iLEXkZBol6XGCfqwjTi7qk6daJO
 r4mbumlbYiUa+KyPf9V/r0Hulo1WJPBI5acwRo2NVcrUu3R7Eq0IeKwKVDQYR8cqFZvVe/aK
 2m3rtfoEUWdFI3lWFaSYcf5jjFKIU+8Ut4ridlH7T2V4n+BkNPS337qe/r7pi2Su9nshQ/ct
 cDaGvDZEdRuHt0exkdfKJjbB5+ornWNHjIkOXpbyPbycxmlOxESuyi8PmLI0NnS/z4oR3NMw
 wW/V0vtdP1S5l6zt4/WZda+f/CLrDXWhDzOW6HtXFw/ZcSWp7eWSnAv+SROHVB4L5woa42PG
 jJ5VuHuWitVtUYdNxlqd+g9giozRqAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBKsWRmVeSWpSXmKPExsVy+t/xu7rCPYpxBhefG1r0njvJZDHtzm5W
 i6bWKcwW/7dNZLa48vU9m0Xz4vVsFle/v2S2OPnmKotF58Ql7BaXd81hs1h6/SKTxa77C5gs
 DvVFW1z7+ZjZonXvEXaLFT+3Mlps3jSV2aLvnLuDkEfrpb9sHq+uOnqsmbeG0eP9jVZ2j9kN
 F1k89n5bwOIxu2Mmq8emVZ1sHicmXGLyeHfuHLvH9m8PWD32z13D7nG/+ziTx5JpV9k8ni1c
 z+JxoHcyS4BQlJ5NUX5pSapCRn5xia1StKGFkZ6hpYWekYmlnqGxeayVkamSvp1NSmpOZllq
 kb5dgl7GkYdrmQpeeFWs236KpYHxmU0XIyeHhICJxLcdMxi7GLk4hASWMkrc/TCPESIhLrF7
 /ltmCFtY4s+1LjYQW0jgNaNE9zNJEFtYwEvi/u81YDUiAsESH//eYAexmQX6mCXO/lKFGHqc
 UeLm2zlgQ9kENCX+br4JNohXwE7i3LulrF2MHBwsAqoSTw7kgIRFBSIk3v6+yQpRIihxcuYT
 FhCbU8Be4sW9i2wQ89Ul/sy7xAxhy0tsfzsHyhaXuPVkPtMERqFZSNpnIWmZhaRlFpKWBYws
 qxhFUkuLc9Nziw31ihNzi0vz0vWS83M3MQJTybZjPzfvYLy0MfgQowAHoxIP74wghTgh1sSy
 4srcQ4wSHMxKIrwnZ8jGCfGmJFZWpRblxxeV5qQWH2I0BfptIrOUaHI+MM3llcQbmhqaW1ga
 mhubG5tZKInzdggcjBESSE8sSc1OTS1ILYLpY+LglGpgzMoOs7Ve9n3Lxki2U9d1Nzef63/B
 77lxHfPSjnUTVunKOfbd97ScW6i13WZfx+3rbG95lz8+kKeifzX3T96Zg4anshS+1EU++bQm
 e0/p1CNbpvws6zKb1PPbedMdt11xOQ9finQeD50xc7btRP4TCRe0IzxUdDRUt534ecZRb6dV
 /6rge6Llc5VYijMSDbWYi4oTAUpMp8M7AwAA
X-CMS-MailID: 20200117102731eucas1p2cce1ecd1d36a5b209d73df59d7245da0
X-Msg-Generator: CA
X-RootMTR: 20200107133859epcas4p45949a65be83ba877e98548d77279666c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200107133859epcas4p45949a65be83ba877e98548d77279666c
References: <20200107133431.5201-1-bogdan.togorean@analog.com>
 <CGME20200107133859epcas4p45949a65be83ba877e98548d77279666c@epcas4p4.samsung.com>
 <20200107133431.5201-3-bogdan.togorean@analog.com>
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
Cc: mark.rutland@arm.com, robdclark@chromium.org, jernej.skrabec@siol.net,
 narmstrong@baylibre.com, airlied@linux.ie, gregkh@linuxfoundation.org,
 jonas@kwiboo.se, linux-kernel@vger.kernel.org,
 wsa+renesas@sang-engineering.com, robh+dt@kernel.org,
 Laurent.pinchart@ideasonboard.com, alexander.deucher@amd.com,
 tglx@linutronix.de, sam@ravnborg.org, matt.redfearn@thinci.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07.01.2020 14:34, Bogdan Togorean wrote:
> ADV7535 is a DSI to HDMI bridge chip like ADV7533 but it allows
> 1080p@60Hz. v1p2 is fixed to 1.8V on ADV7535 but on ADV7533 can be 1.2V
> or 1.8V and is configurable in a register.
>
> Signed-off-by: Bogdan Togorean <bogdan.togorean@analog.com>
> ---
>  drivers/gpu/drm/bridge/adv7511/Kconfig       | 13 ++----
>  drivers/gpu/drm/bridge/adv7511/Makefile      |  3 +-
>  drivers/gpu/drm/bridge/adv7511/adv7511.h     | 44 +++-----------------
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 35 ++++++++++------
>  4 files changed, 32 insertions(+), 63 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/adv7511/Kconfig b/drivers/gpu/drm/bridge/adv7511/Kconfig
> index 8a56ff81f4fb..47d4eb9e845d 100644
> --- a/drivers/gpu/drm/bridge/adv7511/Kconfig
> +++ b/drivers/gpu/drm/bridge/adv7511/Kconfig
> @@ -4,8 +4,9 @@ config DRM_I2C_ADV7511
>  	depends on OF
>  	select DRM_KMS_HELPER
>  	select REGMAP_I2C
> +	select DRM_MIPI_DSI
>  	help
> -	  Support for the Analog Device ADV7511(W) and ADV7513 HDMI encoders.
> +	  Support for the Analog Device ADV7511(W)/13/33/35 HDMI encoders.
>  
>  config DRM_I2C_ADV7511_AUDIO
>  	bool "ADV7511 HDMI Audio driver"
> @@ -15,16 +16,8 @@ config DRM_I2C_ADV7511_AUDIO
>  	  Support the ADV7511 HDMI Audio interface. This is used in
>  	  conjunction with the AV7511  HDMI driver.
>  
> -config DRM_I2C_ADV7533
> -	bool "ADV7533 encoder"
> -	depends on DRM_I2C_ADV7511
> -	select DRM_MIPI_DSI
> -	default y
> -	help
> -	  Support for the Analog Devices ADV7533 DSI to HDMI encoder.
> -
>  config DRM_I2C_ADV7511_CEC
> -	bool "ADV7511/33 HDMI CEC driver"
> +	bool "ADV7511/33/35 HDMI CEC driver"
>  	depends on DRM_I2C_ADV7511
>  	select CEC_CORE
>  	default y
> diff --git a/drivers/gpu/drm/bridge/adv7511/Makefile b/drivers/gpu/drm/bridge/adv7511/Makefile
> index b46ebeb35fd4..d8ceb534b51f 100644
> --- a/drivers/gpu/drm/bridge/adv7511/Makefile
> +++ b/drivers/gpu/drm/bridge/adv7511/Makefile
> @@ -1,6 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> -adv7511-y := adv7511_drv.o
> +adv7511-y := adv7511_drv.o adv7533.o
>  adv7511-$(CONFIG_DRM_I2C_ADV7511_AUDIO) += adv7511_audio.o
>  adv7511-$(CONFIG_DRM_I2C_ADV7511_CEC) += adv7511_cec.o
> -adv7511-$(CONFIG_DRM_I2C_ADV7533) += adv7533.o
>  obj-$(CONFIG_DRM_I2C_ADV7511) += adv7511.o
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> index 52b2adfdc877..ed9cfd944098 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
> @@ -220,6 +220,10 @@
>  
>  #define ADV7533_REG_CEC_OFFSET		0x70
>  
> +#define ADV7533_REG_SUPPLY_SELECT	0xe4
> +
> +#define ADV7533_V1P2_ENABLE		BIT(7)
> +
>  enum adv7511_input_clock {
>  	ADV7511_INPUT_CLOCK_1X,
>  	ADV7511_INPUT_CLOCK_2X,
> @@ -320,6 +324,7 @@ struct adv7511_video_config {
>  enum adv7511_type {
>  	ADV7511,
>  	ADV7533,
> +	ADV7535,
>  };
>  
>  #define ADV7511_MAX_ADDRS 3
> @@ -393,7 +398,6 @@ static inline int adv7511_cec_init(struct device *dev, struct adv7511 *adv7511)
>  }
>  #endif
>  
> -#ifdef CONFIG_DRM_I2C_ADV7533
>  void adv7533_dsi_power_on(struct adv7511 *adv);
>  void adv7533_dsi_power_off(struct adv7511 *adv);
>  void adv7533_mode_set(struct adv7511 *adv, const struct drm_display_mode *mode);
> @@ -402,44 +406,6 @@ int adv7533_patch_cec_registers(struct adv7511 *adv);
>  int adv7533_attach_dsi(struct adv7511 *adv);
>  void adv7533_detach_dsi(struct adv7511 *adv);
>  int adv7533_parse_dt(struct device_node *np, struct adv7511 *adv);
> -#else
> -static inline void adv7533_dsi_power_on(struct adv7511 *adv)
> -{
> -}
> -
> -static inline void adv7533_dsi_power_off(struct adv7511 *adv)
> -{
> -}
> -
> -static inline void adv7533_mode_set(struct adv7511 *adv,
> -				    const struct drm_display_mode *mode)
> -{
> -}
> -
> -static inline int adv7533_patch_registers(struct adv7511 *adv)
> -{
> -	return -ENODEV;
> -}
> -
> -static inline int adv7533_patch_cec_registers(struct adv7511 *adv)
> -{
> -	return -ENODEV;
> -}
> -
> -static inline int adv7533_attach_dsi(struct adv7511 *adv)
> -{
> -	return -ENODEV;
> -}
> -
> -static inline void adv7533_detach_dsi(struct adv7511 *adv)
> -{
> -}
> -
> -static inline int adv7533_parse_dt(struct device_node *np, struct adv7511 *adv)
> -{
> -	return -ENODEV;
> -}
> -#endif
>  
>  #ifdef CONFIG_DRM_I2C_ADV7511_AUDIO
>  int adv7511_audio_init(struct device *dev, struct adv7511 *adv7511);
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> index 9e13e466e72c..35595472e771 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -367,7 +367,7 @@ static void adv7511_power_on(struct adv7511 *adv7511)
>  	 */
>  	regcache_sync(adv7511->regmap);
>  
> -	if (adv7511->type == ADV7533)
> +	if (adv7511->type == ADV7533 || adv7511->type == ADV7535)
>  		adv7533_dsi_power_on(adv7511);
>  	adv7511->powered = true;
>  }
> @@ -387,7 +387,7 @@ static void __adv7511_power_off(struct adv7511 *adv7511)
>  static void adv7511_power_off(struct adv7511 *adv7511)
>  {
>  	__adv7511_power_off(adv7511);
> -	if (adv7511->type == ADV7533)
> +	if (adv7511->type == ADV7533 || adv7511->type == ADV7535)
>  		adv7533_dsi_power_off(adv7511);
>  	adv7511->powered = false;
>  }
> @@ -761,7 +761,7 @@ static void adv7511_mode_set(struct adv7511 *adv7511,
>  	regmap_update_bits(adv7511->regmap, 0x17,
>  		0x60, (vsync_polarity << 6) | (hsync_polarity << 5));
>  
> -	if (adv7511->type == ADV7533)
> +	if (adv7511->type == ADV7533 || adv7511->type == ADV7535)
>  		adv7533_mode_set(adv7511, adj_mode);
>  
>  	drm_mode_copy(&adv7511->curr_mode, adj_mode);
> @@ -874,7 +874,7 @@ static int adv7511_bridge_attach(struct drm_bridge *bridge)
>  				 &adv7511_connector_helper_funcs);
>  	drm_connector_attach_encoder(&adv->connector, bridge->encoder);
>  
> -	if (adv->type == ADV7533)
> +	if (adv->type == ADV7533 || adv->type == ADV7535)
>  		ret = adv7533_attach_dsi(adv);
>  
>  	if (adv->i2c_main->irq)
> @@ -903,6 +903,7 @@ static const char * const adv7511_supply_names[] = {
>  	"dvdd-3v",
>  };
>  
> +/* The order of entries is important. If changed update hardcoded indices */
>  static const char * const adv7533_supply_names[] = {
>  	"avdd",
>  	"dvdd",
> @@ -952,7 +953,7 @@ static bool adv7511_cec_register_volatile(struct device *dev, unsigned int reg)
>  	struct i2c_client *i2c = to_i2c_client(dev);
>  	struct adv7511 *adv7511 = i2c_get_clientdata(i2c);
>  
> -	if (adv7511->type == ADV7533)
> +	if (adv7511->type == ADV7533 || adv7511->type == ADV7535)
>  		reg -= ADV7533_REG_CEC_OFFSET;
>  
>  	switch (reg) {
> @@ -994,7 +995,7 @@ static int adv7511_init_cec_regmap(struct adv7511 *adv)
>  		goto err;
>  	}
>  
> -	if (adv->type == ADV7533) {
> +	if (adv->type == ADV7533 || adv->type == ADV7535) {
>  		ret = adv7533_patch_cec_registers(adv);
>  		if (ret)
>  			goto err;
> @@ -1094,8 +1095,9 @@ static int adv7511_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
>  	struct adv7511_link_config link_config;
>  	struct adv7511 *adv7511;
>  	struct device *dev = &i2c->dev;
> +	struct regulator *reg_v1p2;
>  	unsigned int val;
> -	int ret;
> +	int ret, reg_v1p2_uV;
>  
>  	if (!dev->of_node)
>  		return -EINVAL;
> @@ -1163,6 +1165,17 @@ static int adv7511_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
>  	if (ret)
>  		goto uninit_regulators;
>  
> +	if (adv7511->type == ADV7533) {
> +		reg_v1p2 = adv7511->supplies[5].consumer;
> +		reg_v1p2_uV = regulator_get_voltage(reg_v1p2);
> +
> +		if (reg_v1p2_uV == 1200000) {
> +			regmap_update_bits(adv7511->regmap,
> +				ADV7533_REG_SUPPLY_SELECT, ADV7533_V1P2_ENABLE,
> +				ADV7533_V1P2_ENABLE);
> +		}
> +	}
> +


In patch adding support for adv7535 you modifies adv7533 path. It looks
suspicious, maybe it would be better to extract it to separate patch.
Anyway this change requires tests from adv7533 users.

Beside this the patch looks OK.


Regards

Andrzej


>  	adv7511_packet_disable(adv7511, 0xffff);
>  
>  	adv7511->i2c_edid = i2c_new_ancillary_device(i2c, "edid",
> @@ -1242,7 +1255,7 @@ static int adv7511_remove(struct i2c_client *i2c)
>  {
>  	struct adv7511 *adv7511 = i2c_get_clientdata(i2c);
>  
> -	if (adv7511->type == ADV7533)
> +	if (adv7511->type == ADV7533 || adv7511->type == ADV7535)
>  		adv7533_detach_dsi(adv7511);
>  	i2c_unregister_device(adv7511->i2c_cec);
>  	if (adv7511->cec_clk)
> @@ -1266,9 +1279,8 @@ static const struct i2c_device_id adv7511_i2c_ids[] = {
>  	{ "adv7511", ADV7511 },
>  	{ "adv7511w", ADV7511 },
>  	{ "adv7513", ADV7511 },
> -#ifdef CONFIG_DRM_I2C_ADV7533
>  	{ "adv7533", ADV7533 },
> -#endif
> +	{ "adv7535", ADV7535 },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, adv7511_i2c_ids);
> @@ -1277,9 +1289,8 @@ static const struct of_device_id adv7511_of_ids[] = {
>  	{ .compatible = "adi,adv7511", .data = (void *)ADV7511 },
>  	{ .compatible = "adi,adv7511w", .data = (void *)ADV7511 },
>  	{ .compatible = "adi,adv7513", .data = (void *)ADV7511 },
> -#ifdef CONFIG_DRM_I2C_ADV7533
>  	{ .compatible = "adi,adv7533", .data = (void *)ADV7533 },
> -#endif
> +	{ .compatible = "adi,adv7535", .data = (void *)ADV7535 },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, adv7511_of_ids);


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
