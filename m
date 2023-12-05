Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 494B4804B8B
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 08:57:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F1BE10E484;
	Tue,  5 Dec 2023 07:57:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C05F710E484
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Dec 2023 07:57:50 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40c09fcfa9fso22954925e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Dec 2023 23:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701763069; x=1702367869; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=jZlO0xnPStZEinTm0f24UdEVnn+OIeG1LB9VFhjMDn0=;
 b=Fwgg2ht9n3xlD4ctz9UrjCbdp8UIEzzQCXlEP/YxCKtZ8XXtcHZ/LQkpRZhP25l/Fs
 1cN3MIU8FaTau0wwb0OYeuiQ6MSGH9wXXz37Qlrh330AUZ5rQxmyYRMioJGgGkdIJqYG
 kQtsM59rKsKVFQ563Jt8lM8+akPpbCV08CIgE7UpwMPvtJCu2TFXi9VvU8VtX/xpmyfj
 TCU/yhtxzT1r1ZXgnnlaXqaHl7IZrQjicRlnrLESG2FPmif/6xMe42RVq1bTFcdhV3bT
 xTuft26rZahpK7u9NFWzA+Y9etXTMx3v3x1geFThSgOs2v6krb301E8asQGeCNqJYWT3
 6nsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701763069; x=1702367869;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=jZlO0xnPStZEinTm0f24UdEVnn+OIeG1LB9VFhjMDn0=;
 b=Rdbra6gYzeP5oKW5mcC4PW1ALjg5rWz+mfvYUvuQb6uHr7+NcgAMj+CcMU8el4b0rM
 qByHsZFbHV0aKEg3knQ9yyCMOX2BZ+f64BW5LDfJscGBOzRv4CVFl9oI3bzrJC0qUL6c
 OwOPd9sL/NC01LN77Uw+r3KG1xJOncSYcPAHdUgfusJgEJZp4gJWvAJ0tCAhsBemI2VR
 Rpl4Q8rq4WUSPv9mlhssEmPYiKP5MKbsrBxk1SWoRnWv59MEVWjQU3SQk5XzA/XgHYOJ
 EbodJNIlb6mwkUS/4HU3Cjpql4Dq0D2MHHB0NOgRVucIzBma1ZKyjYjYunFtmDeUYhA4
 WCdw==
X-Gm-Message-State: AOJu0Ywf/ZZ1/2LTx9tcVXcbUwi2xy+cttIcsRDg6vGCBklCzhH7IBbZ
 QNRCfzSHGVkzTTgOeOmVucEgVQ==
X-Google-Smtp-Source: AGHT+IHwJd6xvx8EbrbeJxGrNjoH7z2uA3YKkwv9zem5lbOJtRKYg/eC+/mlMS/Y1Dl6kwyTL/swVw==
X-Received: by 2002:a05:600c:188a:b0:40c:eb7:d62d with SMTP id
 x10-20020a05600c188a00b0040c0eb7d62dmr436955wmp.64.1701763069001; 
 Mon, 04 Dec 2023 23:57:49 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:4518:5e57:ff13:b4bb?
 ([2a01:e0a:982:cbb0:4518:5e57:ff13:b4bb])
 by smtp.gmail.com with ESMTPSA id
 fm19-20020a05600c0c1300b004060f0a0fd5sm17803498wmb.13.2023.12.04.23.57.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Dec 2023 23:57:48 -0800 (PST)
Message-ID: <f38df966-5c82-47be-8ea4-b7df8ebc173a@linaro.org>
Date: Tue, 5 Dec 2023 08:57:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH V2 06/10] drm/panel: himax-hx8394: Add Support for
 Powkiddy X55 panel
Content-Language: en-US, fr
To: Chris Morgan <macroalpha82@gmail.com>, linux-rockchip@lists.infradead.org
References: <20231204185719.569021-1-macroalpha82@gmail.com>
 <20231204185719.569021-7-macroalpha82@gmail.com>
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro Developer Services
In-Reply-To: <20231204185719.569021-7-macroalpha82@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Reply-To: neil.armstrong@linaro.org
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>, krzysztof.kozlowski+dt@linaro.org,
 sboyd@kernel.org, sam@ravnborg.org, mturquette@baylibre.com,
 javierm@redhat.com, dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 mripard@kernel.org, tzimmermann@suse.de, quic_jesszhan@quicinc.com,
 linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04/12/2023 19:57, Chris Morgan wrote:
> From: Chris Morgan <macromorgan@hotmail.com>
> 
> Add support for the Powkiddy X55 panel as used on the Powkiddy X55
> handheld gaming console. This panel uses a Himax HX8394 display
> controller and requires a vendor provided init sequence. The display
> resolution is 720x1280 and is 67mm by 121mm as measured with calipers.
> 
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>   drivers/gpu/drm/panel/panel-himax-hx8394.c | 137 +++++++++++++++++++++
>   1 file changed, 137 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-himax-hx8394.c b/drivers/gpu/drm/panel/panel-himax-hx8394.c
> index b68ea09f4725..ff0dc08b9829 100644
> --- a/drivers/gpu/drm/panel/panel-himax-hx8394.c
> +++ b/drivers/gpu/drm/panel/panel-himax-hx8394.c
> @@ -38,6 +38,7 @@
>   #define HX8394_CMD_SETMIPI	  0xba
>   #define HX8394_CMD_SETOTP	  0xbb
>   #define HX8394_CMD_SETREGBANK	  0xbd
> +#define HX8394_CMD_UNKNOWN5	  0xbf
>   #define HX8394_CMD_UNKNOWN1	  0xc0
>   #define HX8394_CMD_SETDGCLUT	  0xc1
>   #define HX8394_CMD_SETID	  0xc3
> @@ -52,6 +53,7 @@
>   #define HX8394_CMD_SETGIP1	  0xd5
>   #define HX8394_CMD_SETGIP2	  0xd6
>   #define HX8394_CMD_SETGPO	  0xd6
> +#define HX8394_CMD_UNKNOWN4	  0xd8
>   #define HX8394_CMD_SETSCALING	  0xdd
>   #define HX8394_CMD_SETIDLE	  0xdf
>   #define HX8394_CMD_SETGAMMA	  0xe0
> @@ -203,6 +205,140 @@ static const struct hx8394_panel_desc hsd060bhw4_desc = {
>   	.init_sequence = hsd060bhw4_init_sequence,
>   };
>   
> +static int powkiddy_x55_init_sequence(struct hx8394 *ctx)
> +{
> +	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
> +
> +	/* 5.19.8 SETEXTC: Set extension command (B9h) */
> +	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETEXTC,
> +			       0xff, 0x83, 0x94);
> +
> +	/* 5.19.9 SETMIPI: Set MIPI control (BAh) */
> +	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETMIPI,
> +			       0x63, 0x03, 0x68, 0x6b, 0xb2, 0xc0);
> +
> +	/* 5.19.2 SETPOWER: Set power (B1h) */
> +	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETPOWER,
> +			       0x48, 0x12, 0x72, 0x09, 0x32, 0x54, 0x71, 0x71, 0x57, 0x47);
> +
> +	/* 5.19.3 SETDISP: Set display related register (B2h) */
> +	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETDISP,
> +			       0x00, 0x80, 0x64, 0x2c, 0x16, 0x2f);
> +
> +	/* 5.19.4 SETCYC: Set display waveform cycles (B4h) */
> +	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETCYC,
> +			       0x73, 0x74, 0x73, 0x74, 0x73, 0x74, 0x01, 0x0c, 0x86, 0x75,
> +			       0x00, 0x3f, 0x73, 0x74, 0x73, 0x74, 0x73, 0x74, 0x01, 0x0c,
> +			       0x86);
> +
> +	/* 5.19.5 SETVCOM: Set VCOM voltage (B6h) */
> +	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETVCOM,
> +			       0x6e, 0x6e);
> +
> +	/* 5.19.19 SETGIP0: Set GIP Option0 (D3h) */
> +	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETGIP0,
> +			       0x00, 0x00, 0x07, 0x07, 0x40, 0x07, 0x0c, 0x00, 0x08, 0x10,
> +			       0x08, 0x00, 0x08, 0x54, 0x15, 0x0a, 0x05, 0x0a, 0x02, 0x15,
> +			       0x06, 0x05, 0x06, 0x47, 0x44, 0x0a, 0x0a, 0x4b, 0x10, 0x07,
> +			       0x07, 0x0c, 0x40);
> +
> +	/* 5.19.20 Set GIP Option1 (D5h) */
> +	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETGIP1,
> +			       0x1c, 0x1c, 0x1d, 0x1d, 0x00, 0x01, 0x02, 0x03, 0x04, 0x05,
> +			       0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x24, 0x25, 0x18, 0x18,
> +			       0x26, 0x27, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
> +			       0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x20, 0x21,
> +			       0x18, 0x18, 0x18, 0x18);
> +
> +	/* 5.19.21 Set GIP Option2 (D6h) */
> +	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETGIP2,
> +			       0x1c, 0x1c, 0x1d, 0x1d, 0x07, 0x06, 0x05, 0x04, 0x03, 0x02,
> +			       0x01, 0x00, 0x0b, 0x0a, 0x09, 0x08, 0x21, 0x20, 0x18, 0x18,
> +			       0x27, 0x26, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18,
> +			       0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x18, 0x25, 0x24,
> +			       0x18, 0x18, 0x18, 0x18);
> +
> +	/* 5.19.25 SETGAMMA: Set gamma curve related setting (E0h) */
> +	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETGAMMA,
> +			       0x00, 0x0a, 0x15, 0x1b, 0x1e, 0x21, 0x24, 0x22, 0x47, 0x56,
> +			       0x65, 0x66, 0x6e, 0x82, 0x88, 0x8b, 0x9a, 0x9d, 0x98, 0xa8,
> +			       0xb9, 0x5d, 0x5c, 0x61, 0x66, 0x6a, 0x6f, 0x7f, 0x7f, 0x00,
> +			       0x0a, 0x15, 0x1b, 0x1e, 0x21, 0x24, 0x22, 0x47, 0x56, 0x65,
> +			       0x65, 0x6e, 0x81, 0x87, 0x8b, 0x98, 0x9d, 0x99, 0xa8, 0xba,
> +			       0x5d, 0x5d, 0x62, 0x67, 0x6b, 0x72, 0x7f, 0x7f);
> +
> +	/* Unknown command, not listed in the HX8394-F datasheet */
> +	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_UNKNOWN1,
> +			       0x1f, 0x31);
> +
> +	/* 5.19.17 SETPANEL (CCh) */
> +	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETPANEL,
> +			       0x0b);
> +
> +	/* Unknown command, not listed in the HX8394-F datasheet */
> +	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_UNKNOWN3,
> +			       0x02);
> +
> +	/* 5.19.11 Set register bank (BDh) */
> +	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETREGBANK,
> +			       0x02);
> +
> +	/* Unknown command, not listed in the HX8394-F datasheet */
> +	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_UNKNOWN4,
> +			       0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> +			       0xff, 0xff);
> +
> +	/* 5.19.11 Set register bank (BDh) */
> +	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETREGBANK,
> +			       0x00);
> +
> +	/* 5.19.11 Set register bank (BDh) */
> +	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETREGBANK,
> +			       0x01);
> +
> +	/* 5.19.2 SETPOWER: Set power (B1h) */
> +	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETPOWER,
> +			       0x00);
> +
> +	/* 5.19.11 Set register bank (BDh) */
> +	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_SETREGBANK,
> +			       0x00);
> +
> +	/* Unknown command, not listed in the HX8394-F datasheet */
> +	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_UNKNOWN5,
> +			       0x40, 0x81, 0x50, 0x00, 0x1a, 0xfc, 0x01);
> +
> +	/* Unknown command, not listed in the HX8394-F datasheet */
> +	mipi_dsi_dcs_write_seq(dsi, HX8394_CMD_UNKNOWN2,
> +			       0xed);
> +
> +	return 0;
> +}
> +
> +static const struct drm_display_mode powkiddy_x55_mode = {
> +	.hdisplay	= 720,
> +	.hsync_start	= 720 + 44,
> +	.hsync_end	= 720 + 44 + 20,
> +	.htotal		= 720 + 44 + 20 + 20,
> +	.vdisplay	= 1280,
> +	.vsync_start	= 1280 + 12,
> +	.vsync_end	= 1280 + 12 + 10,
> +	.vtotal		= 1280 + 12 + 10 + 10,
> +	.clock		= 63290,
> +	.flags		= DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> +	.width_mm	= 67,
> +	.height_mm	= 121,
> +};
> +
> +static const struct hx8394_panel_desc powkiddy_x55_desc = {
> +	.mode = &powkiddy_x55_mode,
> +	.lanes = 4,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
> +		      MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET,
> +	.format = MIPI_DSI_FMT_RGB888,
> +	.init_sequence = powkiddy_x55_init_sequence,
> +};
> +
>   static int hx8394_enable(struct drm_panel *panel)
>   {
>   	struct hx8394 *ctx = panel_to_hx8394(panel);
> @@ -419,6 +555,7 @@ static void hx8394_remove(struct mipi_dsi_device *dsi)
>   
>   static const struct of_device_id hx8394_of_match[] = {
>   	{ .compatible = "hannstar,hsd060bhw4", .data = &hsd060bhw4_desc },
> +	{ .compatible = "powkiddy,x55-panel", .data = &powkiddy_x55_desc },
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(of, hx8394_of_match);

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
