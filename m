Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB162CE51A2
	for <lists+dri-devel@lfdr.de>; Sun, 28 Dec 2025 16:01:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9888410E210;
	Sun, 28 Dec 2025 15:01:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LQsQluS4";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D++4Naar";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8438610E210
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 15:01:12 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BS5wbYv1264095
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 15:01:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=qcppdkim1; bh=5/0eQDhlF2HPrLEMfmPQbXvu
 HlFxGfm1CLOl2CgGH8c=; b=LQsQluS4/NDzZw+qTNCN5YMJ3MO3djO1SDdeUQxX
 eWTDVgEt2AdrEN8MqZmglZl2MgSFKQXMpaaojmvpEcdDTdEr9jIdXWEIHQNdRJ1g
 JVnCZtDFPXtZYYONGMty7eMSjYA9QJGSidFukllrWVs/oqmmxoWMDZ1PWvp4p/4H
 AKwHccdemH524F/5RN0c+bErC76KFrkd6iconW45ibnueyhfamfIQPNc3v4p7UGp
 RJvsDKgZa6i+cGGf/newhzAa6lFGEWMl5dojx0dtB2FjDvNzNeutw3HvkMTT0deY
 Y9uCBSE2H30CQvLoQlyX/QF/DCMEkaGbT0pf2OQ9e03ojw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba8r6a7x2-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 15:01:11 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id
 a1e0cc1a2514c-93f39594413so8166718241.3
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Dec 2025 07:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766934071; x=1767538871;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=5/0eQDhlF2HPrLEMfmPQbXvuHlFxGfm1CLOl2CgGH8c=;
 b=D++4Naar3MrwQ0jrAlcLqqM+XwWPBd3xJcVXENY7x88g1cH9BWC5uIWHLe3wSZmMwv
 LSs/A2upyJg+YxLgOGwsZQD0g9Fl0WD+ZiCQb84Sfx+Ufl7/w4e48YpiKNa3pARrbcql
 60+zBRGSbgE5zBnjxaff6NKYha3m0HCfDy2/dk82yVDu+pDzqOcgevIJaTGMTp3a43AJ
 YycWwfjsM6gIPhkdDMAxynDxLOp3ZPTGVUcUplJ+6dNCmnV4i/au3drErCEsbncU1d9l
 zWzWMWltRhkjKH7QMr07EQzmvgTxgPivfAPny0Ta/fkMTkkY94SmEhmpomOSWKGeh6v6
 aBSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766934071; x=1767538871;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5/0eQDhlF2HPrLEMfmPQbXvuHlFxGfm1CLOl2CgGH8c=;
 b=fEyc6HP9wcxBlm7PP9+xdA+wB8EezVJ5jZVspaEn46Y5PRI0+MmcF2YA5A/p/UUmw/
 H3vlVIPxTSakt6tpY92G8R9oUU4sXMT/hPZft1ZXTRGGMDhg833Y7eK1wqGfKjK7998W
 r9MFpdYI0Hd7gQrOx7R29GeqhmmaeIgp8JTViwL8ao+7HxCWmBrGENXIhZGOUbQFoRds
 8dogBh8e3k3quTx12jOCjetkBMH2HCqHZY+wpVp1MOG+uHpkclHz+x5SMSLdr+pX2yjy
 G3IfQvsbCEGXI6E0HivWt2yVVt+mHV7piLZ+rvy+2EnpHAAKlXQgwvhZjF0cwVNCs9ep
 jwwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWh8XSBbJNoRMJf9nIq0CS4srI8A3/vhEYJwuBp02bYMuDHoWDeWDjqxf9xkhe3n6pQSisoUokf58=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzkc7I000SEmX69tBZ39w2pxKypCjj8fcLMXYMIH7qAClZShaOR
 rGvbK5nNG+UQDKef7/RwQh/TWh4+ozGfTpC1m7oMSRdUZpgzEEmg1HO0uqU+3GKu36UfwtxWgbd
 Jom1BY4YCZRNDB0AKdh/cj99F3vV6tc1tWXrURqRiiRLIlSyF3lxzpIVErRYsBfD8MYigfL8=
X-Gm-Gg: AY/fxX5h40gEOmHyV0QJDzlAAyWRpaeYB98wx8K7Gt70gfVaTv49JvZah1AGgYrSZ8K
 QKQ6zPUAKpUuWXiNUW3FGeGip18jm6f1W2VmHhiVhVB7jUW4kxtmSRYpETjEXcfSWA8QXNMyGjC
 TevXV3Bu0NGKUOTlz20pWNBN5a3wcFicmEGp7mDm1UjP6K+X1SLV8ous2BGDaxE+RDnab6Uw4jj
 OjyzsTng+EwHaDPfn3oDXkITJpgpRuKbzJ+k5uD/C2zm7E4gBrU2ZBmBYhycSPblG+9qYOC3v3X
 7Ve9wQLWt9MvP0rOUGiB7lpaWhDBy7T80BzMWkrBcDWbfr+v87guBmN9d/v70sVa+HP0WB6Jsfl
 c4fG7j4EehaT4jHayv45nv1U4OdSXK34R+y4W/yI7r57TSpek9T1zhrizzSFJgPy5Ms54dLKnCI
 XQ0UeLDp8GxsS8BywHLpg/eg8=
X-Received: by 2002:a05:6102:4a84:b0:5df:c228:288d with SMTP id
 ada2fe7eead31-5eb1a625997mr8265770137.8.1766934070585; 
 Sun, 28 Dec 2025 07:01:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF/+QFy+XNUUdpgR0yvVIaXhHA4gjvR7HFPwRlNE46+le38X/7ttZyf+He0wPFCxrKBloKjTg==
X-Received: by 2002:a05:6102:4a84:b0:5df:c228:288d with SMTP id
 ada2fe7eead31-5eb1a625997mr8265729137.8.1766934070052; 
 Sun, 28 Dec 2025 07:01:10 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a185ea2d8sm8100512e87.45.2025.12.28.07.01.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Dec 2025 07:01:07 -0800 (PST)
Date: Sun, 28 Dec 2025 17:01:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Tony <syyang@lontium.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, prahlad.valluru@oss.qualcomm.com,
 Prahlad Valluru <vvalluru@qti.qualcomm.com>
Subject: Re: [PATCH v3 2/2] drm/bridge: add support for lontium lt8713sx
 bridge driver
Message-ID: <ud4eneuxamylrbiaqr6d6ntoh52kk6aqr6rc2v7lu24lhulidg@sdruua7h4yxh>
References: <20251228-lt8713sx-bridge-driver-v3-0-9169fbef0e5b@oss.qualcomm.com>
 <20251228-lt8713sx-bridge-driver-v3-2-9169fbef0e5b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251228-lt8713sx-bridge-driver-v3-2-9169fbef0e5b@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=Raidyltv c=1 sm=1 tr=0 ts=69514638 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=Kz8-B0t5AAAA:8 a=s0IaEJ_OwYWvi6_HU58A:9 a=CjuIK1q_8ugA:10
 a=TOPH6uDL9cOC6tEoww4z:22 a=RuZk68QooNbwfxovefhk:22
X-Proofpoint-ORIG-GUID: 9EmTwoy79EMaAKG70_L5eoUieEwM86F4
X-Proofpoint-GUID: 9EmTwoy79EMaAKG70_L5eoUieEwM86F4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDEzNyBTYWx0ZWRfX2ZMXQSjKuwUx
 oVPwCgQVRKyy0c/kFYXonHrboNn6UjKTlaXPoViibkwZZ6e8obVeHKZ4XgPkpI1iT+We+JM/bdA
 Tq7JRIquMcxuDtJQIbw4yawAulq8f6CZG4DeJa7eQvqrnSMWaV67fJQBYEz1xREQDpjbWxQaWVm
 jaS+0u3PaSIpKTU4VQkGAsbMkS7MKRjTlZ7OaVodULQ5jUB4uTtxkOI5GN8VsiRwmMtpLP93DhN
 FOn/BHGkMC/yaGZIXa6yMzCVC5PA6UYDhOBQ6LS+0o+n7RR0lw1rmRCGtrbN/34+LGy2KAJ3qwk
 kXXh/QPrNkoUXpp7icMko+jlnwybJuJyX8aho+5cHrQXpWYKE71AIJ+Ela78VEcrFu2qLKxzhiJ
 TJI9r+LFZ5jDSPR22Y11J0xDAH3dVEEtPVUoZKExc+aXiVDsRmDDLzl9aOiu/WwD9gwFaqNoZGG
 38b8ggeebyUPjxslYXQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_05,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512280137
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

On Sun, Dec 28, 2025 at 05:10:40PM +0530, Vishnu Saini wrote:
> The lt8713sx is a Type-C/DP1.4 to Type-C/DP1.4/HDMI2.0 converter,
> with three configurable DP1.4/HDMI2.0/DP++ output interfaces and
> audio output interface.
> 
> Driver is required for firmware upgrade in the bridge chip.

Or for enabling the bridge chip. Or for building the bridge chains
inside Linux kernel...

Also, do we need any special handling for DP++ / HDMI devices being
attached to the bridge?

> 
> Co-developed-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
> Signed-off-by: Prahlad Valluru <vvalluru@qti.qualcomm.com>
> Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/bridge/Kconfig            |  10 +
>  drivers/gpu/drm/bridge/Makefile           |   1 +
>  drivers/gpu/drm/bridge/lontium-lt8713sx.c | 682 ++++++++++++++++++++++++++++++
>  3 files changed, 693 insertions(+)
> 
> +
> +#define FW_FILE "lt8713sx_fw.bin"

I'm still looking forward to seeing this file in linux-firmware.

> +
> +#define REG_PAGE_CONTROL	0xff
> +
> +#define MAX_OUTPUT_PORTS	3
> +#define LT8713SX_PAGE_SIZE	256
> +
> +DECLARE_CRC8_TABLE(lt8713sx_crc_table);
> +
> +struct lt8713sx {
> +	struct device *dev;
> +	struct drm_bridge bridge;
> +	struct drm_bridge *next_bridge[MAX_OUTPUT_PORTS];
> +	int num_outputs;
> +
> +	struct regmap *regmap;
> +	/* Protects all accesses to registers by stopping the on-chip MCU */
> +	struct mutex ocm_lock;
> +
> +	struct gpio_desc *reset_gpio;
> +	struct gpio_desc *enable_gpio;
> +
> +	struct i2c_client *client;
> +	const struct firmware *fw;
> +
> +	u8 *fw_buffer;
> +
> +	u32 main_crc_value;
> +	u32 bank_crc_value[17];
> +
> +	int bank_num;
> +};
> +
> +static void lt8713sx_reset(struct lt8713sx *lt8713sx);
> +
> +static const struct regmap_range lt8713sx_ranges[] = {
> +	{
> +		.range_min = 0x0000,
> +		.range_max = 0xffff
> +	},
> +};
> +
> +static const struct regmap_access_table lt8713sx_table = {
> +	.yes_ranges = lt8713sx_ranges,
> +	.n_yes_ranges = ARRAY_SIZE(lt8713sx_ranges),
> +};
> +
> +static const struct regmap_range_cfg lt8713sx_range_cfg = {
> +	.name = "lt8713sx",
> +	.range_min = 0x0000,
> +	.range_max = 0xffff,
> +	.selector_reg = REG_PAGE_CONTROL,
> +	.selector_mask = 0xff,
> +	.selector_shift = 0,
> +	.window_start = 0,
> +	.window_len = 0x100,
> +};
> +
> +static const struct regmap_config lt8713sx_regmap_config = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.volatile_table = &lt8713sx_table,
> +	.ranges = &lt8713sx_range_cfg,
> +	.num_ranges = 1,
> +	.cache_type = REGCACHE_NONE,
> +	.max_register = 0xffff,
> +};
> +
> +static void lt8713sx_i2c_enable(struct lt8713sx *lt8713sx)
> +{
> +	regmap_write(lt8713sx->regmap, 0xe0ee, 0x01);
> +}
> +
> +static void lt8713sx_i2c_disable(struct lt8713sx *lt8713sx)
> +{
> +	regmap_write(lt8713sx->regmap, 0xe0ee, 0x00);
> +}
> +
> +static u32 calculate_crc(const u8 *upgrade_data, u64 len, u64 crc_size)
> +{
> +	u8 crc = 0x00;
> +	u8 pad = 0xff;
> +
> +	crc = crc8(lt8713sx_crc_table, upgrade_data, len, crc);
> +
> +	/* pad remaining bytes */
> +	crc_size -= len;
> +	while (crc_size--)
> +		crc = crc8(lt8713sx_crc_table, &pad, 1, crc);

As I wrote before, you are basically calculating the CRC over the padded
buffer. Please pad the buffer and calculate it over the whole buffer
rather than doing this byte by byte.

> +
> +	return crc;
> +}
> +
> +static int lt8713sx_prepare_firmware_data(struct lt8713sx *lt8713sx)
> +{
> +	int ret = 0;
> +	u64 sz_12k = 12 * SZ_1K;
> +
> +	ret = request_firmware(&lt8713sx->fw, FW_FILE, lt8713sx->dev);
> +	if (ret < 0) {
> +		dev_err(lt8713sx->dev, "request firmware failed\n");
> +		return ret;
> +	}
> +
> +	dev_dbg(lt8713sx->dev, "Firmware size: %zu bytes\n", lt8713sx->fw->size);
> +
> +	if (lt8713sx->fw->size > SZ_256K - 1) {
> +		dev_err(lt8713sx->dev, "Firmware size exceeds 256KB limit\n");
> +		release_firmware(lt8713sx->fw);
> +		return -EINVAL;
> +	}
> +
> +	lt8713sx->fw_buffer = kvmalloc(SZ_256K, GFP_KERNEL);
> +	if (!lt8713sx->fw_buffer) {
> +		release_firmware(lt8713sx->fw);
> +		return -ENOMEM;
> +	}
> +
> +	memset(lt8713sx->fw_buffer, 0xff, SZ_256K);
> +
> +	if (lt8713sx->fw->size < SZ_64K) {
> +		memcpy(lt8713sx->fw_buffer, lt8713sx->fw->data, lt8713sx->fw->size);
> +		lt8713sx->fw_buffer[SZ_64K - 1] =
> +				calculate_crc(lt8713sx->fw->data, lt8713sx->fw->size, SZ_64K - 1);
> +		lt8713sx->main_crc_value = lt8713sx->fw_buffer[SZ_64K - 1];
> +		dev_dbg(lt8713sx->dev,
> +			"Main Firmware Data  Crc=0x%02X\n", lt8713sx->main_crc_value);
> +
> +	} else {
> +		/* main firmware */
> +		memcpy(lt8713sx->fw_buffer, lt8713sx->fw->data, SZ_64K - 1);
> +		lt8713sx->fw_buffer[SZ_64K - 1] =
> +				calculate_crc(lt8713sx->fw_buffer, SZ_64K - 1, SZ_64K - 1);
> +		lt8713sx->main_crc_value = lt8713sx->fw_buffer[SZ_64K - 1];
> +		dev_dbg(lt8713sx->dev,
> +			"Main Firmware Data  Crc=0x%02X\n", lt8713sx->main_crc_value);
> +
> +		/* bank firmware */
> +		memcpy(lt8713sx->fw_buffer + SZ_64K,
> +		       lt8713sx->fw->data + SZ_64K,
> +		       lt8713sx->fw->size - SZ_64K);
> +
> +		lt8713sx->bank_num = (lt8713sx->fw->size - SZ_64K + sz_12k - 1) / sz_12k;
> +		dev_dbg(lt8713sx->dev, "Bank Number Total is %d.\n", lt8713sx->bank_num);
> +
> +		for (int i = 0; i < lt8713sx->bank_num; i++) {
> +			lt8713sx->bank_crc_value[i] =
> +				calculate_crc(lt8713sx->fw_buffer + SZ_64K + i * sz_12k,
> +					      sz_12k, sz_12k);
> +			dev_dbg(lt8713sx->dev, "Bank number:%d; Firmware Data  Crc:0x%02X\n",
> +				i, lt8713sx->bank_crc_value[i]);
> +		}
> +	}
> +	return 0;
> +}
> +
> +static void lt8713sx_config_parameters(struct lt8713sx *lt8713sx)
> +{
> +	regmap_write(lt8713sx->regmap, 0xe0ee, 0x01);
> +	regmap_write(lt8713sx->regmap, 0xe05e, 0xc1);
> +	regmap_write(lt8713sx->regmap, 0xe058, 0x00);
> +	regmap_write(lt8713sx->regmap, 0xe059, 0x50);
> +	regmap_write(lt8713sx->regmap, 0xe05a, 0x10);
> +	regmap_write(lt8713sx->regmap, 0xe05a, 0x00);
> +	regmap_write(lt8713sx->regmap, 0xe058, 0x21);
> +}
> +
> +static void lt8713sx_wren(struct lt8713sx *lt8713sx)
> +{
> +	regmap_write(lt8713sx->regmap, 0xe103, 0xbf);
> +	regmap_write(lt8713sx->regmap, 0xe103, 0xff);
> +	regmap_write(lt8713sx->regmap, 0xe05a, 0x04);
> +	regmap_write(lt8713sx->regmap, 0xe05a, 0x00);
> +}
> +
> +static void lt8713sx_wrdi(struct lt8713sx *lt8713sx)
> +{
> +	regmap_write(lt8713sx->regmap, 0xe05a, 0x08);
> +	regmap_write(lt8713sx->regmap, 0xe05a, 0x00);
> +}
> +
> +static void lt8713sx_fifo_reset(struct lt8713sx *lt8713sx)
> +{
> +	regmap_write(lt8713sx->regmap, 0xe103, 0xbf);
> +	regmap_write(lt8713sx->regmap, 0xe103, 0xff);
> +}
> +
> +static void lt8713sx_disable_sram_write(struct lt8713sx *lt8713sx)
> +{
> +	regmap_write(lt8713sx->regmap, 0xe055, 0x00);
> +}
> +
> +static void lt8713sx_sram_to_flash(struct lt8713sx *lt8713sx)
> +{
> +	regmap_write(lt8713sx->regmap, 0xe05a, 0x30);
> +	regmap_write(lt8713sx->regmap, 0xe05a, 0x00);
> +}
> +
> +static void lt8713sx_i2c_to_sram(struct lt8713sx *lt8713sx)
> +{
> +	regmap_write(lt8713sx->regmap, 0xe055, 0x80);
> +	regmap_write(lt8713sx->regmap, 0xe05e, 0xc0);
> +	regmap_write(lt8713sx->regmap, 0xe058, 0x21);
> +}
> +
> +static u8 lt8713sx_read_flash_status(struct lt8713sx *lt8713sx)
> +{
> +	u32 flash_status = 0;
> +
> +	regmap_write(lt8713sx->regmap,  0xe103, 0x3f);
> +	regmap_write(lt8713sx->regmap,  0xe103, 0xff);
> +
> +	regmap_write(lt8713sx->regmap,  0xe05e, 0x40);
> +	regmap_write(lt8713sx->regmap,  0xe056, 0x05); /* opcode=read status register */
> +	regmap_write(lt8713sx->regmap,  0xe055, 0x25);
> +	regmap_write(lt8713sx->regmap,  0xe055, 0x01);
> +	regmap_write(lt8713sx->regmap,  0xe058, 0x21);
> +
> +	regmap_read(lt8713sx->regmap, 0xe05f, &flash_status);
> +	dev_dbg(lt8713sx->dev, "flash_status:%x\n", flash_status);
> +
> +	return flash_status;
> +}
> +
> +static void lt8713sx_block_erase(struct lt8713sx *lt8713sx)
> +{
> +	u32 i = 0;
> +	u8 flash_status = 0;
> +	u8 blocknum = 0x00;
> +	u32 flashaddr = 0x00;
> +
> +	for (blocknum = 0; blocknum < 8; blocknum++) {
> +		flashaddr = blocknum * SZ_32K;
> +		regmap_write(lt8713sx->regmap,  0xe0ee, 0x01);

lt8713sx_i2c_enable() ? Why is it set again?

> +		regmap_write(lt8713sx->regmap,  0xe05a, 0x04);
> +		regmap_write(lt8713sx->regmap,  0xe05a, 0x00);
> +		regmap_write(lt8713sx->regmap,  0xe05b, flashaddr >> 16);
> +		regmap_write(lt8713sx->regmap,  0xe05c, flashaddr >> 8);
> +		regmap_write(lt8713sx->regmap,  0xe05d, flashaddr);
> +		regmap_write(lt8713sx->regmap,  0xe05a, 0x01);
> +		regmap_write(lt8713sx->regmap,  0xe05a, 0x00);
> +		msleep(100);
> +		i = 0;
> +		while (1) {
> +			flash_status = lt8713sx_read_flash_status(lt8713sx);
> +			if ((flash_status & 0x01) == 0)
> +				break;
> +
> +			if (i > 50)
> +				break;
> +
> +			i++;
> +			msleep(50);
> +		}
> +	}
> +	dev_dbg(lt8713sx->dev, "erase flash done.\n");
> +}
> +
> +static void lt8713sx_load_main_fw_to_sram(struct lt8713sx *lt8713sx)
> +{
> +	regmap_write(lt8713sx->regmap, 0xe0ee, 0x01);
> +	regmap_write(lt8713sx->regmap, 0xe068, 0x00);
> +	regmap_write(lt8713sx->regmap, 0xe069, 0x00);
> +	regmap_write(lt8713sx->regmap, 0xe06a, 0x00);
> +	regmap_write(lt8713sx->regmap, 0xe065, 0x00);
> +	regmap_write(lt8713sx->regmap, 0xe066, 0xff);
> +	regmap_write(lt8713sx->regmap, 0xe067, 0xff);
> +	regmap_write(lt8713sx->regmap, 0xe06b, 0x00);
> +	regmap_write(lt8713sx->regmap, 0xe06c, 0x00);
> +	regmap_write(lt8713sx->regmap, 0xe060, 0x01);
> +	msleep(200);
> +	regmap_write(lt8713sx->regmap, 0xe060, 0x00);
> +}
> +
> +static void lt8713sx_load_bank_fw_to_sram(struct lt8713sx *lt8713sx, u64 addr)
> +{
> +	regmap_write(lt8713sx->regmap, 0xe0ee, 0x01);
> +	regmap_write(lt8713sx->regmap, 0xe068, ((addr & 0xff0000) >> 16));
> +	regmap_write(lt8713sx->regmap, 0xe069, ((addr & 0x00ff00) >> 8));
> +	regmap_write(lt8713sx->regmap, 0xe06a, (addr & 0x0000ff));
> +	regmap_write(lt8713sx->regmap, 0xe065, 0x00);
> +	regmap_write(lt8713sx->regmap, 0xe066, 0x30);
> +	regmap_write(lt8713sx->regmap, 0xe067, 0x00);
> +	regmap_write(lt8713sx->regmap, 0xe06b, 0x00);
> +	regmap_write(lt8713sx->regmap, 0xe06c, 0x00);
> +	regmap_write(lt8713sx->regmap, 0xe060, 0x01);
> +	msleep(50);
> +	regmap_write(lt8713sx->regmap, 0xe060, 0x00);
> +}
> +
> +static int lt8713sx_write_data(struct lt8713sx *lt8713sx, const u8 *data, u64 filesize)
> +{
> +	int page = 0, num = 0, i = 0, val;
> +
> +	page = (filesize % LT8713SX_PAGE_SIZE) ?
> +			((filesize / LT8713SX_PAGE_SIZE) + 1) : (filesize / LT8713SX_PAGE_SIZE);
> +
> +	dev_dbg(lt8713sx->dev,
> +		"Writing to Sram=%u pages, total size = %llu bytes\n", page, filesize);
> +
> +	for (num = 0; num < page; num++) {
> +		dev_dbg(lt8713sx->dev, "page[%d]\n", num);
> +		lt8713sx_i2c_to_sram(lt8713sx);
> +
> +		for (i = 0; i < LT8713SX_PAGE_SIZE; i++) {
> +			if ((num * LT8713SX_PAGE_SIZE + i) < filesize)
> +				val = *(data + (num * LT8713SX_PAGE_SIZE + i));
> +			else
> +				val = 0xff;
> +			regmap_write(lt8713sx->regmap, 0xe059, val);
> +		}
> +
> +		lt8713sx_wren(lt8713sx);
> +		lt8713sx_sram_to_flash(lt8713sx);
> +	}
> +
> +	lt8713sx_wrdi(lt8713sx);
> +	lt8713sx_disable_sram_write(lt8713sx);
> +
> +	return 0;
> +}
> +
> +static void lt8713sx_main_upgrade_result(struct lt8713sx *lt8713sx)
> +{
> +	u32 main_crc_result;
> +
> +	regmap_read(lt8713sx->regmap, 0xe023, &main_crc_result);
> +
> +	dev_dbg(lt8713sx->dev, "Main CRC HW: 0x%02X\n", main_crc_result);
> +	dev_dbg(lt8713sx->dev, "Main CRC FW: 0x%02X\n", lt8713sx->main_crc_value);
> +
> +	if (main_crc_result == lt8713sx->main_crc_value)
> +		dev_dbg(lt8713sx->dev, "Main Firmware Upgrade Success.\n");
> +	else
> +		dev_err(lt8713sx->dev, "Main Firmware Upgrade Failed.\n");
> +}
> +
> +static void lt8713sx_bank_upgrade_result(struct lt8713sx *lt8713sx, u8 banknum)
> +{
> +	u32 bank_crc_result;
> +
> +	regmap_read(lt8713sx->regmap, 0xe023, &bank_crc_result);
> +
> +	dev_dbg(lt8713sx->dev, "Bank %d CRC Result: 0x%02X\n", banknum, bank_crc_result);
> +
> +	if (bank_crc_result == lt8713sx->bank_crc_value[banknum])
> +		dev_dbg(lt8713sx->dev, "Bank %d Firmware Upgrade Success.\n", banknum);
> +	else
> +		dev_err(lt8713sx->dev, "Bank %d Firmware Upgrade Failed.\n", banknum);
> +}
> +
> +static void lt8713sx_bank_result_check(struct lt8713sx *lt8713sx)
> +{
> +	int i;
> +	u64 addr = 0x010000;
> +
> +	for (i = 0; i < lt8713sx->bank_num; i++) {
> +		lt8713sx_load_bank_fw_to_sram(lt8713sx, addr);
> +		lt8713sx_bank_upgrade_result(lt8713sx, i);
> +		addr += 0x3000;
> +	}
> +}
> +
> +static int lt8713sx_firmware_upgrade(struct lt8713sx *lt8713sx)
> +{
> +	int ret;
> +
> +	lt8713sx_config_parameters(lt8713sx);
> +
> +	lt8713sx_block_erase(lt8713sx);
> +
> +	if (lt8713sx->fw->size < SZ_64K) {
> +		ret = lt8713sx_write_data(lt8713sx, lt8713sx->fw_buffer, SZ_64K);
> +		if (ret < 0) {
> +			dev_err(lt8713sx->dev, "Failed to write firmware data: %d\n", ret);
> +			return ret;
> +		}
> +	} else {
> +		ret = lt8713sx_write_data(lt8713sx, lt8713sx->fw_buffer, lt8713sx->fw->size);
> +		if (ret < 0) {
> +			dev_err(lt8713sx->dev, "Failed to write firmware data: %d\n", ret);
> +			return ret;
> +		}
> +	}
> +	dev_dbg(lt8713sx->dev, "Write Data done.\n");
> +
> +	return 0;
> +}
> +
> +static int lt8713sx_firmware_update(struct lt8713sx *lt8713sx)
> +{
> +	int ret = 0;
> +
> +	mutex_lock(&lt8713sx->ocm_lock);
> +	lt8713sx_i2c_enable(lt8713sx);
> +
> +	ret = lt8713sx_prepare_firmware_data(lt8713sx);
> +	if (ret < 0) {
> +		dev_err(lt8713sx->dev, "Failed to prepare firmware data: %d\n", ret);
> +		goto error;
> +	}
> +
> +	ret = lt8713sx_firmware_upgrade(lt8713sx);
> +	if (ret < 0) {
> +		dev_err(lt8713sx->dev, "Upgrade failure.\n");
> +		goto error;
> +	} else {
> +		/* Validate CRC */
> +		lt8713sx_load_main_fw_to_sram(lt8713sx);
> +		lt8713sx_main_upgrade_result(lt8713sx);
> +		lt8713sx_wrdi(lt8713sx);
> +		lt8713sx_fifo_reset(lt8713sx);
> +		lt8713sx_bank_result_check(lt8713sx);
> +		lt8713sx_wrdi(lt8713sx);
> +	}
> +
> +error:
> +	lt8713sx_i2c_disable(lt8713sx);
> +	if (!ret)
> +		lt8713sx_reset(lt8713sx);
> +
> +	kvfree(lt8713sx->fw_buffer);
> +	lt8713sx->fw_buffer = NULL;
> +
> +	if (lt8713sx->fw) {
> +		release_firmware(lt8713sx->fw);
> +		lt8713sx->fw = NULL;
> +	}
> +	mutex_unlock(&lt8713sx->ocm_lock);
> +
> +	return ret;
> +}
> +
> +static void lt8713sx_reset(struct lt8713sx *lt8713sx)
> +{
> +	dev_dbg(lt8713sx->dev, "reset bridge.\n");
> +	gpiod_set_value_cansleep(lt8713sx->reset_gpio, 1);
> +	msleep(20);
> +
> +	gpiod_set_value_cansleep(lt8713sx->reset_gpio, 0);
> +	msleep(20);
> +
> +	dev_dbg(lt8713sx->dev, "reset done.\n");
> +}
> +
> +static int lt8713sx_regulator_enable(struct lt8713sx *lt8713sx)
> +{
> +	int ret;
> +
> +	ret = devm_regulator_get_enable(lt8713sx->dev, "vdd");
> +	if (ret < 0)
> +		return dev_err_probe(lt8713sx->dev, ret, "failed to enable vdd regulator\n");
> +
> +	usleep_range(1000, 10000);
> +
> +	ret = devm_regulator_get_enable(lt8713sx->dev, "vcc");
> +	if (ret < 0)
> +		return dev_err_probe(lt8713sx->dev, ret, "failed to enable vcc regulator\n");
> +	return 0;
> +}
> +
> +static int lt8713sx_bridge_attach(struct drm_bridge *bridge,
> +				  struct drm_encoder *encoder,
> +				  enum drm_bridge_attach_flags flags)
> +{
> +	struct lt8713sx *lt8713sx = container_of(bridge, struct lt8713sx, bridge);
> +	int i, ret;
> +
> +	for (i = 0; i < lt8713sx->num_outputs; i++) {
> +		if (!lt8713sx->next_bridge[i])
> +			continue;
> +
> +		ret = drm_bridge_attach(encoder,
> +					lt8713sx->next_bridge[i],
> +					bridge, flags);

This wasn't really tested. This code will not result in what you intend
to do here. Each next bridge should have its own encoder / bridge chain.

> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int lt8713sx_get_ports(struct lt8713sx *lt8713sx)
> +{
> +	struct device *dev = lt8713sx->dev;
> +	struct device_node *port, *ports, *ep, *remote;
> +	int i = 0;
> +	u32 reg;
> +
> +	ports = of_get_child_by_name(dev->of_node, "ports");
> +	if (!ports)
> +		return -ENODEV;
> +
> +	for_each_child_of_node(ports, port) {
> +		if (of_property_read_u32(port, "reg", &reg))
> +			continue;
> +
> +		if (reg == 0)
> +			continue;
> +
> +		if (i >= ARRAY_SIZE(lt8713sx->next_bridge)) {
> +			of_node_put(port);
> +			break;
> +		}
> +
> +		ep = of_graph_get_next_endpoint(port, NULL);
> +		if (!ep)
> +			continue;
> +
> +		remote = of_graph_get_remote_port_parent(ep);
> +		of_node_put(ep);

And this misses the of_device_is_available() check. Please use
drm_of_find_panel_or_bridge().

> +
> +		if (!remote)
> +			continue;
> +
> +		lt8713sx->next_bridge[i] = of_drm_find_bridge(remote);
> +		of_node_put(remote);
> +		if (lt8713sx->next_bridge[i])
> +			i++;

And if not, the driver should be returning -EPROBE_DEFER.

> +	}
> +	lt8713sx->num_outputs = i;
> +	dev_dbg(dev, "Enabled %d output ports", i);
> +
> +	of_node_put(ports);
> +	return 0;
> +};
> +
> +static int lt8713sx_gpio_init(struct lt8713sx *lt8713sx)
> +{
> +	struct device *dev = lt8713sx->dev;
> +
> +	lt8713sx->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
> +	if (IS_ERR(lt8713sx->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(lt8713sx->reset_gpio),
> +				     "failed to acquire reset gpio\n");
> +
> +	/* power enable gpio */
> +	lt8713sx->enable_gpio = devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_HIGH);
> +	if (IS_ERR(lt8713sx->enable_gpio))
> +		return dev_err_probe(dev, PTR_ERR(lt8713sx->enable_gpio),
> +				     "failed to acquire enable gpio\n");
> +	return 0;
> +}
> +
> +static ssize_t lt8713sx_firmware_store(struct device *dev,
> +				       struct device_attribute *attr,
> +				       const char *buf, size_t len)
> +{
> +	struct lt8713sx *lt8713sx = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = lt8713sx_firmware_update(lt8713sx);
> +	if (ret < 0)
> +		return ret;
> +	return len;
> +}
> +
> +static DEVICE_ATTR_WO(lt8713sx_firmware);
> +
> +static struct attribute *lt8713sx_attrs[] = {
> +	&dev_attr_lt8713sx_firmware.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group lt8713sx_attr_group = {
> +	.attrs = lt8713sx_attrs,
> +};
> +
> +static const struct attribute_group *lt8713sx_attr_groups[] = {
> +	&lt8713sx_attr_group,
> +	NULL,
> +};
> +
> +static const struct drm_bridge_funcs lt8713sx_bridge_funcs = {
> +	.attach = lt8713sx_bridge_attach,
> +};
> +
> +static int lt8713sx_probe(struct i2c_client *client)
> +{
> +	struct lt8713sx *lt8713sx;
> +	struct device *dev = &client->dev;
> +	int ret;
> +
> +	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
> +		return dev_err_probe(dev, -ENODEV, "device doesn't support I2C\n");
> +
> +	lt8713sx = devm_drm_bridge_alloc(dev, struct lt8713sx, bridge, &lt8713sx_bridge_funcs);
> +	if (IS_ERR(lt8713sx))
> +		return PTR_ERR(lt8713sx);
> +
> +	lt8713sx->dev = dev;
> +	lt8713sx->client = client;
> +	i2c_set_clientdata(client, lt8713sx);
> +
> +	ret = devm_mutex_init(lt8713sx->dev, &lt8713sx->ocm_lock);
> +	if (ret)
> +		return ret;
> +
> +	lt8713sx->regmap = devm_regmap_init_i2c(client, &lt8713sx_regmap_config);
> +	if (IS_ERR(lt8713sx->regmap))
> +		return dev_err_probe(dev, PTR_ERR(lt8713sx->regmap), "regmap i2c init failed\n");
> +
> +	ret = lt8713sx_get_ports(lt8713sx);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = lt8713sx_gpio_init(lt8713sx);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = lt8713sx_regulator_enable(lt8713sx);
> +	if (ret)
> +		return ret;
> +
> +	lt8713sx_reset(lt8713sx);
> +
> +	lt8713sx->bridge.funcs = &lt8713sx_bridge_funcs;
> +	lt8713sx->bridge.of_node = dev->of_node;
> +	lt8713sx->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
> +	drm_bridge_add(&lt8713sx->bridge);
> +
> +	crc8_populate_msb(lt8713sx_crc_table, 0x31);
> +
> +	return 0;
> +}
> +
> +static void lt8713sx_remove(struct i2c_client *client)
> +{
> +	struct lt8713sx *lt8713sx = i2c_get_clientdata(client);
> +
> +	drm_bridge_remove(&lt8713sx->bridge);
> +}
> +
> +static struct i2c_device_id lt8713sx_id[] = {
> +	{ "lontium,lt8713sx", 0 },
> +	{ /* sentinel */ }
> +};
> +
> +static const struct of_device_id lt8713sx_match_table[] = {
> +	{ .compatible = "lontium,lt8713sx" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, lt8713sx_match_table);
> +
> +static struct i2c_driver lt8713sx_driver = {
> +	.driver = {
> +		.name = "lt8713sx",
> +		.of_match_table = lt8713sx_match_table,
> +		.dev_groups = lt8713sx_attr_groups,
> +	},
> +	.probe = lt8713sx_probe,
> +	.remove = lt8713sx_remove,
> +	.id_table = lt8713sx_id,
> +};
> +
> +module_i2c_driver(lt8713sx_driver);
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("lt8713sx drm bridge driver");
> +MODULE_AUTHOR("Tony <syyang@lontium.com>");
> +MODULE_FIRMWARE(FW_FILE);
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
