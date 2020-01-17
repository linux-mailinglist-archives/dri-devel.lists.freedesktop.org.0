Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C75E140876
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2020 11:55:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8CA66F4F0;
	Fri, 17 Jan 2020 10:55:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 706466F4F0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 10:55:32 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20200117105530euoutp0189f22b80d68d42b816077f5ceeff4564~qp0Q0YjV82597325973euoutp01P
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 10:55:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20200117105530euoutp0189f22b80d68d42b816077f5ceeff4564~qp0Q0YjV82597325973euoutp01P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1579258530;
 bh=lCv3C9dpauRpZCEpp2Anm3+rdRAqFnauFwbZJmU/EPc=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=jOwHP8i3XH8CSwZCf0E65m22p1yzAJmCPUXYTxShaPJKCuPFl7pYdvJpRGRfMVyV7
 Iq0ClD0X6eD9j+ZBWuA6VZ3XsyYa64fTKwIFeEHdTSKkU5GABHfkPqIyz6iJUtracN
 j+PAG2iE4ixoQWF89jg4E9UJ9BT+5b9XEoBqO/Ew=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200117105530eucas1p269ed4647c49a9a4dd197ceb301053b4d~qp0QeT3K13217932179eucas1p2O;
 Fri, 17 Jan 2020 10:55:30 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 96.E2.60679.2A2912E5; Fri, 17
 Jan 2020 10:55:30 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20200117105530eucas1p192f06988f7030480d00c4c74dde46e62~qp0QJpbT10181501815eucas1p1P;
 Fri, 17 Jan 2020 10:55:30 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200117105529eusmtrp20b8cfd42f625fc5dd4f74f635e0dc8b1~qp0QIqPxq1468914689eusmtrp2C;
 Fri, 17 Jan 2020 10:55:29 +0000 (GMT)
X-AuditID: cbfec7f4-0e5ff7000001ed07-37-5e2192a2f45a
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 10.EC.08375.1A2912E5; Fri, 17
 Jan 2020 10:55:29 +0000 (GMT)
Received: from [106.120.51.74] (unknown [106.120.51.74]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200117105528eusmtip202ee34f97c7360c178e9122e992ab49d~qp0PM1EUp1361713617eusmtip2S;
 Fri, 17 Jan 2020 10:55:28 +0000 (GMT)
Subject: Re: [RESEND v3 2/2] drm: bridge: adv7511: Add support for ADV7535
From: Andrzej Hajda <a.hajda@samsung.com>
To: Bogdan Togorean <bogdan.togorean@analog.com>,
 dri-devel@lists.freedesktop.org
Message-ID: <97b4a2c6-2c2e-f486-f454-c340a0c3038c@samsung.com>
Date: Fri, 17 Jan 2020 11:55:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <982e6232-f257-86d2-3ca0-3a99daec3767@samsung.com>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA02SeUwTURDG8/ZttwtaXVdMxyMq9YgnntEXTzBGNyYe0cQYjWjFDaC0YFcU
 xERQS1CEFDxbRLAKkqYGg4JaJJiiVkTrBV6RVAU1RdGoFIMHaLsY+e83M9+8+b7ksZg/zgxi
 Y/XbRYNeG6dhgumKWx3uidbc0MjJ3hd9SZa7liLHXlYqyF7jEUy6KnIwqfd9Zsi+M6UMafju
 xaT2YwNNDuScVZLHjpMMKXr6kCIOTyFFnNnryJOOJkyMVTeUpKSjHJGLZUcxyXYvDucF46Pf
 jNDSECHYT9mR8PmZUSnkpT6khar2QlrIyzArhDLbAUa4bXpECZ/cbqVwuf2VQqjOtysFT6aL
 Es4ea2CEd6dLaeF61mF6Bb82eM5mMS52h2iYNG9jcIy5qV2ZULcs6X2+i0lFueEHURAL3HSw
 Zt9iDqJgludKEGTard1FG4LiqhZKLr4hMNualf9Wumw13YNzCF6X7qX8A55rRfDTluLn/twS
 8Py0Yz8z3Fj4ffE54+cQbhX4vhym/cuYy8bQdj4tIFJx8+Ct6UdARHOjwNv4I3BtALcGmuub
 FLKmH9Sam2k/B3HzwVblCTDmhsHl1pNYZjW8aC4IuAPuLgs3D+UpZNsL4bm1gJG5P7S4LnXH
 GQJdVwsomfeAp2Q/lpczEJRfuIrlwWx46fa7Y/9eGAuljklyOwJOmIoofxu4PvCstZ/soQ/k
 VhzHclsFGem8rA4Fz73y7gfVUPTAx5iQxtIjmaVHGkuPNJb/dwsRbUNqMVHSRYvSVL24M0zS
 6qREfXRYVLyuDP39rnWdrrYryPFrkxNxLNL0Vp1YOTySV2h3SMk6JwIWa0JUjVmhkbxqszZ5
 l2iI32BIjBMlJxrM0hq1aprVu57norXbxa2imCAa/k0pNmhQKtr2K2303HGm8VHOLW8j1MWa
 +8ZZQxl9+Nc6x4j4WY764rD8FJKUNLu4+s7A9ya+84jPHJsQM7dRoUqutVAPlg+MnG9MH/nt
 MY/3eFM/bB2zbZGtaOlIX2dNbGWKfXfijGsLct4sH+1MX4qTbtd31vRyZa6U0i6l6wyrZ06I
 09kTmjS0FKOdMg4bJO0fWwdVmqoDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA03Sa0hTYRjAcd6ds7MpDo9T2ZtS6UCloNm8tNfy1icPESFpJFqupQeVNic7
 0zI/NJLRNBSdZV5T8YLJQNLUUsS0i4kpOS9pOCdohpaKUTPv6Vbgtz8vz++BFx4uxn/GduOm
 pKppVapMLiTs8cHd/plTNXrP+NOaWgnKGx5goeLpLja6r32Eob32QgyN/V4lUHZtM4HG1xcx
 NPBjHEc5hXUcNNpZQaD6zyMs1GmuZqG+/Dg0sTGHIW33Ww5q3GgDqLXlMYbyhyPC+ZTWuENQ
 S+PnKcNTA6BWJ7UcqlwzglPdlmqcKteVsqmWphyC+lBgZFErw8McqsMyy6Z6Kg0cyvywn0XV
 FY8T1EJNM069zivCI/mxomCVMl1NeyQrGXWIME6M/ETiICTyCwgSif0l18/6BQp9Q4MTaXlK
 Bq3yDb0hSi6ds3DSBi/d+VbZT2iAPjwX2HEhGQD3mt6wDppP1gPY88TJ9i6AXVXLmK2d4fZE
 LpEL7PdnvgM4utRmBc7kBWjeMliHCPIE3GmdIg7ahYyCazuTnIPGyHwMDm162fA2gDvvLFbA
 I0Ph14JNK8BJL7ho2rQCVzIGLm9NsW0zTnCgdB4/aDsyDDZ1m3HbUh+4/dSI2fo47Fiu+NcC
 +GW+ilUA+GWHeNkhUnaIlB0i1QBvAi50OqNIUjBiESNTMOmpSaIEpaIF7J9J+/uN1pfA+Dyq
 D5BcIHTglVz2iOezZRlMpqIPQC4mdOGZ8jzj+bxEWeZdWqWUqtLlNNMHAvc/V4i5uSYo948u
 VS0VB4olKEgs8Zf4n0FCAU9H9l7jk0kyNX2LptNo1X/H4tq5aUD0n09OaMNryG0s6UWRY9aK
 1L1hUi/vdQ9fMwjYjE9xiVwTrXMuqb9nuXLkVeJk5IOLsXrdx8QKqWPDqi5szSSP9f5lDMma
 7a/7SUfcLhB5j5CFkoDdZMEyM2qyTGfPCPaK6HVvYGrMz6jSLxSZj3K03Q5hx25eDWjTxJyT
 CnEmWSY+iakY2V89QowfPAMAAA==
X-CMS-MailID: 20200117105530eucas1p192f06988f7030480d00c4c74dde46e62
X-Msg-Generator: CA
X-RootMTR: 20200107133859epcas4p45949a65be83ba877e98548d77279666c
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200107133859epcas4p45949a65be83ba877e98548d77279666c
References: <20200107133431.5201-1-bogdan.togorean@analog.com>
 <CGME20200107133859epcas4p45949a65be83ba877e98548d77279666c@epcas4p4.samsung.com>
 <20200107133431.5201-3-bogdan.togorean@analog.com>
 <982e6232-f257-86d2-3ca0-3a99daec3767@samsung.com>
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

On 17.01.2020 11:27, Andrzej Hajda wrote:
> On 07.01.2020 14:34, Bogdan Togorean wrote:
>> ADV7535 is a DSI to HDMI bridge chip like ADV7533 but it allows
>> 1080p@60Hz. v1p2 is fixed to 1.8V on ADV7535 but on ADV7533 can be 1.2V
>> or 1.8V and is configurable in a register.
>>
>> Signed-off-by: Bogdan Togorean <bogdan.togorean@analog.com>
>> ---
>>  drivers/gpu/drm/bridge/adv7511/Kconfig       | 13 ++----
>>  drivers/gpu/drm/bridge/adv7511/Makefile      |  3 +-
>>  drivers/gpu/drm/bridge/adv7511/adv7511.h     | 44 +++-----------------
>>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 35 ++++++++++------
>>  4 files changed, 32 insertions(+), 63 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/bridge/adv7511/Kconfig b/drivers/gpu/drm/bridge/adv7511/Kconfig
>> index 8a56ff81f4fb..47d4eb9e845d 100644
>> --- a/drivers/gpu/drm/bridge/adv7511/Kconfig
>> +++ b/drivers/gpu/drm/bridge/adv7511/Kconfig
>> @@ -4,8 +4,9 @@ config DRM_I2C_ADV7511
>>  	depends on OF
>>  	select DRM_KMS_HELPER
>>  	select REGMAP_I2C
>> +	select DRM_MIPI_DSI
>>  	help
>> -	  Support for the Analog Device ADV7511(W) and ADV7513 HDMI encoders.
>> +	  Support for the Analog Device ADV7511(W)/13/33/35 HDMI encoders.
>>  
>>  config DRM_I2C_ADV7511_AUDIO
>>  	bool "ADV7511 HDMI Audio driver"
>> @@ -15,16 +16,8 @@ config DRM_I2C_ADV7511_AUDIO
>>  	  Support the ADV7511 HDMI Audio interface. This is used in
>>  	  conjunction with the AV7511  HDMI driver.
>>  
>> -config DRM_I2C_ADV7533
>> -	bool "ADV7533 encoder"
>> -	depends on DRM_I2C_ADV7511
>> -	select DRM_MIPI_DSI
>> -	default y
>> -	help
>> -	  Support for the Analog Devices ADV7533 DSI to HDMI encoder.
>> -
>>  config DRM_I2C_ADV7511_CEC
>> -	bool "ADV7511/33 HDMI CEC driver"
>> +	bool "ADV7511/33/35 HDMI CEC driver"
>>  	depends on DRM_I2C_ADV7511
>>  	select CEC_CORE
>>  	default y
>> diff --git a/drivers/gpu/drm/bridge/adv7511/Makefile b/drivers/gpu/drm/bridge/adv7511/Makefile
>> index b46ebeb35fd4..d8ceb534b51f 100644
>> --- a/drivers/gpu/drm/bridge/adv7511/Makefile
>> +++ b/drivers/gpu/drm/bridge/adv7511/Makefile
>> @@ -1,6 +1,5 @@
>>  # SPDX-License-Identifier: GPL-2.0-only
>> -adv7511-y := adv7511_drv.o
>> +adv7511-y := adv7511_drv.o adv7533.o
>>  adv7511-$(CONFIG_DRM_I2C_ADV7511_AUDIO) += adv7511_audio.o
>>  adv7511-$(CONFIG_DRM_I2C_ADV7511_CEC) += adv7511_cec.o
>> -adv7511-$(CONFIG_DRM_I2C_ADV7533) += adv7533.o
>>  obj-$(CONFIG_DRM_I2C_ADV7511) += adv7511.o
>> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511.h b/drivers/gpu/drm/bridge/adv7511/adv7511.h
>> index 52b2adfdc877..ed9cfd944098 100644
>> --- a/drivers/gpu/drm/bridge/adv7511/adv7511.h
>> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511.h
>> @@ -220,6 +220,10 @@
>>  
>>  #define ADV7533_REG_CEC_OFFSET		0x70
>>  
>> +#define ADV7533_REG_SUPPLY_SELECT	0xe4
>> +
>> +#define ADV7533_V1P2_ENABLE		BIT(7)
>> +
>>  enum adv7511_input_clock {
>>  	ADV7511_INPUT_CLOCK_1X,
>>  	ADV7511_INPUT_CLOCK_2X,
>> @@ -320,6 +324,7 @@ struct adv7511_video_config {
>>  enum adv7511_type {
>>  	ADV7511,
>>  	ADV7533,
>> +	ADV7535,
>>  };
>>  
>>  #define ADV7511_MAX_ADDRS 3
>> @@ -393,7 +398,6 @@ static inline int adv7511_cec_init(struct device *dev, struct adv7511 *adv7511)
>>  }
>>  #endif
>>  
>> -#ifdef CONFIG_DRM_I2C_ADV7533
>>  void adv7533_dsi_power_on(struct adv7511 *adv);
>>  void adv7533_dsi_power_off(struct adv7511 *adv);
>>  void adv7533_mode_set(struct adv7511 *adv, const struct drm_display_mode *mode);
>> @@ -402,44 +406,6 @@ int adv7533_patch_cec_registers(struct adv7511 *adv);
>>  int adv7533_attach_dsi(struct adv7511 *adv);
>>  void adv7533_detach_dsi(struct adv7511 *adv);
>>  int adv7533_parse_dt(struct device_node *np, struct adv7511 *adv);
>> -#else
>> -static inline void adv7533_dsi_power_on(struct adv7511 *adv)
>> -{
>> -}
>> -
>> -static inline void adv7533_dsi_power_off(struct adv7511 *adv)
>> -{
>> -}
>> -
>> -static inline void adv7533_mode_set(struct adv7511 *adv,
>> -				    const struct drm_display_mode *mode)
>> -{
>> -}
>> -
>> -static inline int adv7533_patch_registers(struct adv7511 *adv)
>> -{
>> -	return -ENODEV;
>> -}
>> -
>> -static inline int adv7533_patch_cec_registers(struct adv7511 *adv)
>> -{
>> -	return -ENODEV;
>> -}
>> -
>> -static inline int adv7533_attach_dsi(struct adv7511 *adv)
>> -{
>> -	return -ENODEV;
>> -}
>> -
>> -static inline void adv7533_detach_dsi(struct adv7511 *adv)
>> -{
>> -}
>> -
>> -static inline int adv7533_parse_dt(struct device_node *np, struct adv7511 *adv)
>> -{
>> -	return -ENODEV;
>> -}
>> -#endif
>>  
>>  #ifdef CONFIG_DRM_I2C_ADV7511_AUDIO
>>  int adv7511_audio_init(struct device *dev, struct adv7511 *adv7511);
>> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
>> index 9e13e466e72c..35595472e771 100644
>> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
>> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
>> @@ -367,7 +367,7 @@ static void adv7511_power_on(struct adv7511 *adv7511)
>>  	 */
>>  	regcache_sync(adv7511->regmap);
>>  
>> -	if (adv7511->type == ADV7533)
>> +	if (adv7511->type == ADV7533 || adv7511->type == ADV7535)
>>  		adv7533_dsi_power_on(adv7511);
>>  	adv7511->powered = true;
>>  }
>> @@ -387,7 +387,7 @@ static void __adv7511_power_off(struct adv7511 *adv7511)
>>  static void adv7511_power_off(struct adv7511 *adv7511)
>>  {
>>  	__adv7511_power_off(adv7511);
>> -	if (adv7511->type == ADV7533)
>> +	if (adv7511->type == ADV7533 || adv7511->type == ADV7535)
>>  		adv7533_dsi_power_off(adv7511);
>>  	adv7511->powered = false;
>>  }
>> @@ -761,7 +761,7 @@ static void adv7511_mode_set(struct adv7511 *adv7511,
>>  	regmap_update_bits(adv7511->regmap, 0x17,
>>  		0x60, (vsync_polarity << 6) | (hsync_polarity << 5));
>>  
>> -	if (adv7511->type == ADV7533)
>> +	if (adv7511->type == ADV7533 || adv7511->type == ADV7535)
>>  		adv7533_mode_set(adv7511, adj_mode);
>>  
>>  	drm_mode_copy(&adv7511->curr_mode, adj_mode);
>> @@ -874,7 +874,7 @@ static int adv7511_bridge_attach(struct drm_bridge *bridge)
>>  				 &adv7511_connector_helper_funcs);
>>  	drm_connector_attach_encoder(&adv->connector, bridge->encoder);
>>  
>> -	if (adv->type == ADV7533)
>> +	if (adv->type == ADV7533 || adv->type == ADV7535)
>>  		ret = adv7533_attach_dsi(adv);
>>  
>>  	if (adv->i2c_main->irq)
>> @@ -903,6 +903,7 @@ static const char * const adv7511_supply_names[] = {
>>  	"dvdd-3v",
>>  };
>>  
>> +/* The order of entries is important. If changed update hardcoded indices */
>>  static const char * const adv7533_supply_names[] = {
>>  	"avdd",
>>  	"dvdd",
>> @@ -952,7 +953,7 @@ static bool adv7511_cec_register_volatile(struct device *dev, unsigned int reg)
>>  	struct i2c_client *i2c = to_i2c_client(dev);
>>  	struct adv7511 *adv7511 = i2c_get_clientdata(i2c);
>>  
>> -	if (adv7511->type == ADV7533)
>> +	if (adv7511->type == ADV7533 || adv7511->type == ADV7535)
>>  		reg -= ADV7533_REG_CEC_OFFSET;
>>  
>>  	switch (reg) {
>> @@ -994,7 +995,7 @@ static int adv7511_init_cec_regmap(struct adv7511 *adv)
>>  		goto err;
>>  	}
>>  
>> -	if (adv->type == ADV7533) {
>> +	if (adv->type == ADV7533 || adv->type == ADV7535) {
>>  		ret = adv7533_patch_cec_registers(adv);
>>  		if (ret)
>>  			goto err;
>> @@ -1094,8 +1095,9 @@ static int adv7511_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
>>  	struct adv7511_link_config link_config;
>>  	struct adv7511 *adv7511;
>>  	struct device *dev = &i2c->dev;
>> +	struct regulator *reg_v1p2;
>>  	unsigned int val;
>> -	int ret;
>> +	int ret, reg_v1p2_uV;
>>  
>>  	if (!dev->of_node)
>>  		return -EINVAL;
>> @@ -1163,6 +1165,17 @@ static int adv7511_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
>>  	if (ret)
>>  		goto uninit_regulators;
>>  
>> +	if (adv7511->type == ADV7533) {
>> +		reg_v1p2 = adv7511->supplies[5].consumer;
>> +		reg_v1p2_uV = regulator_get_voltage(reg_v1p2);
>> +
>> +		if (reg_v1p2_uV == 1200000) {
>> +			regmap_update_bits(adv7511->regmap,
>> +				ADV7533_REG_SUPPLY_SELECT, ADV7533_V1P2_ENABLE,
>> +				ADV7533_V1P2_ENABLE);
>> +		}
>> +	}
>> +
>
> In patch adding support for adv7535 you modifies adv7533 path. It looks
> suspicious, maybe it would be better to extract it to separate patch.
> Anyway this change requires tests from adv7533 users.


One more thing, maybe it would be better to add some tolerance to 1.2V
test, quick look at public datasheet suggest +/- 0.06V.


Regards

Andrzej


>
> Beside this the patch looks OK.
>
>
> Regards
>
> Andrzej
>
>
>>  	adv7511_packet_disable(adv7511, 0xffff);
>>  
>>  	adv7511->i2c_edid = i2c_new_ancillary_device(i2c, "edid",
>> @@ -1242,7 +1255,7 @@ static int adv7511_remove(struct i2c_client *i2c)
>>  {
>>  	struct adv7511 *adv7511 = i2c_get_clientdata(i2c);
>>  
>> -	if (adv7511->type == ADV7533)
>> +	if (adv7511->type == ADV7533 || adv7511->type == ADV7535)
>>  		adv7533_detach_dsi(adv7511);
>>  	i2c_unregister_device(adv7511->i2c_cec);
>>  	if (adv7511->cec_clk)
>> @@ -1266,9 +1279,8 @@ static const struct i2c_device_id adv7511_i2c_ids[] = {
>>  	{ "adv7511", ADV7511 },
>>  	{ "adv7511w", ADV7511 },
>>  	{ "adv7513", ADV7511 },
>> -#ifdef CONFIG_DRM_I2C_ADV7533
>>  	{ "adv7533", ADV7533 },
>> -#endif
>> +	{ "adv7535", ADV7535 },
>>  	{ }
>>  };
>>  MODULE_DEVICE_TABLE(i2c, adv7511_i2c_ids);
>> @@ -1277,9 +1289,8 @@ static const struct of_device_id adv7511_of_ids[] = {
>>  	{ .compatible = "adi,adv7511", .data = (void *)ADV7511 },
>>  	{ .compatible = "adi,adv7511w", .data = (void *)ADV7511 },
>>  	{ .compatible = "adi,adv7513", .data = (void *)ADV7511 },
>> -#ifdef CONFIG_DRM_I2C_ADV7533
>>  	{ .compatible = "adi,adv7533", .data = (void *)ADV7533 },
>> -#endif
>> +	{ .compatible = "adi,adv7535", .data = (void *)ADV7535 },
>>  	{ }
>>  };
>>  MODULE_DEVICE_TABLE(of, adv7511_of_ids);
>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
