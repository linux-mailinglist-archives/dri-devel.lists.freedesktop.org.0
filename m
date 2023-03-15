Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DED816BABB3
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 10:09:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 308C510E968;
	Wed, 15 Mar 2023 09:09:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FED210E968
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 09:09:38 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id g18so344787wmk.0
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 02:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678871376;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=GVNg+gj+UlQPWX9hB6iUs2/jQBX0Jkfv9x/YYWmxK+c=;
 b=BlzI1ULaSKUP5pJa+4admRr2X8mpQCSL0bNlbwKzyLa8LfTh47KyDQGvBTnAzHVDrA
 +xCnPnnmP1iOMPU7Y5vfBxcey+nDS8AlpvTn59jJeJrc6yLVkzxAzN7VXNhMXHfEdArz
 YtQ93Nee4Xr0Zc7UdpoxHq2HlPfgKNrtE0Qcq7sTblZreYziBQt8E45a28PstZiLskR1
 3dtKwVU4SJJo+v4trlXTwy8dyhVR68HOmGv6FhhH5k/eGgJp33miVVpj4reLOyaiAZ9q
 bkYLlcM59UepXHVARrPkIAmXxfxJ3I6dFHATmEqq2gH2plhWkw5IrXf/rsUPhPxmJsVH
 4neQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678871376;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GVNg+gj+UlQPWX9hB6iUs2/jQBX0Jkfv9x/YYWmxK+c=;
 b=F3AF0L/MLHH6uMndcaW66ExMOsS8dHhaEdfjOvwQMExbB11KYAZoXYua/VZxdtH2a/
 nJGSWef/f4lQ05zOJUX/ZJwicC2XUAH4fPAIqrtB04mBPe1LBGnhggjSzpVfyNAlLwng
 UyivaO35EUgpUtPd8PpFeyPf603wmeVUgq0iEJbtD9pWuCdKUqNFoKzHbXUdaYJTKVcR
 +Ma686Qj6ArsrC2wrAJ+0KV6OUZJ/44UGZDYpCvmXp/AFj6BSrv2fCY1etDJgnsz5gag
 mB3+wU88pdkYCjO4dJ4NcHwqm0IUGgIt+cQ9Qx7qvZK6fFq4iF2FRa4g8OswOSsnjJ+f
 1G9w==
X-Gm-Message-State: AO0yUKVVSXIUC33pMKoZfwFNiwwac8b+1CVuA7hKcsRpO33tPn8CQngq
 4PzSGtH0MIoRnCtjWgl/ak8ywg==
X-Google-Smtp-Source: AK7set9nfvyF2bFDbE/3/KN5unE9MXU+3XxeVgWp0fgN4W5/+AQGLoMmk4p3GJMFtTadQUw5GgO1YQ==
X-Received: by 2002:a05:600c:4707:b0:3eb:29fe:f912 with SMTP id
 v7-20020a05600c470700b003eb29fef912mr16537330wmo.36.1678871376616; 
 Wed, 15 Mar 2023 02:09:36 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:5d2d:8427:397b:8fe7?
 ([2a01:e0a:982:cbb0:5d2d:8427:397b:8fe7])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a1ce909000000b003ed1f6878a5sm1228383wmc.5.2023.03.15.02.09.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Mar 2023 02:09:36 -0700 (PDT)
Message-ID: <7e220b1f-d68f-05ff-bd1e-7cefe06eb2b4@linaro.org>
Date: Wed, 15 Mar 2023 10:09:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 2/2] drm/panel: support for STARRY 2081101QFH032011-53G
 MIPI-DSI panel
Content-Language: en-US
To: Ruihai Zhou <zhouruihai@huaqin.corp-partner.google.com>,
 sam@ravnborg.org, daniel@ffwll.ch
References: <20230314090549.11418-1-zhouruihai@huaqin.corp-partner.google.com>
Organization: Linaro Developer Services
In-Reply-To: <20230314090549.11418-1-zhouruihai@huaqin.corp-partner.google.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 14/03/2023 10:05, Ruihai Zhou wrote:
> The STARRY 2081101QFH032011-53G is a 10.1" WUXGA TFT LCD panel,
> which fits in nicely with the existing panel-boe-tv101wum-nl6
> driver. Hence, we add a new compatible with panel specific config.
> 
> Signed-off-by: Ruihai Zhou <zhouruihai@huaqin.corp-partner.google.com>
> ---
>   .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 126 ++++++++++++++++++
>   1 file changed, 126 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> index c924f1124ebc..783234ae0f57 100644
> --- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> +++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> @@ -1131,6 +1131,103 @@ static const struct panel_init_cmd auo_b101uan08_3_init_cmd[] = {
>   	{},
>   };
>   
> +static const struct panel_init_cmd starry_qfh032011_53g_init_cmd[] = {
> +	_INIT_DCS_CMD(0xB0, 0x01),
> +	_INIT_DCS_CMD(0xC3, 0x4F),
> +	_INIT_DCS_CMD(0xC4, 0x40),
> +	_INIT_DCS_CMD(0xC5, 0x40),
> +	_INIT_DCS_CMD(0xC6, 0x40),
> +	_INIT_DCS_CMD(0xC7, 0x40),
> +	_INIT_DCS_CMD(0xC8, 0x4D),
> +	_INIT_DCS_CMD(0xC9, 0x52),
> +	_INIT_DCS_CMD(0xCA, 0x51),
> +	_INIT_DCS_CMD(0xCD, 0x5D),
> +	_INIT_DCS_CMD(0xCE, 0x5B),
> +	_INIT_DCS_CMD(0xCF, 0x4B),
> +	_INIT_DCS_CMD(0xD0, 0x49),
> +	_INIT_DCS_CMD(0xD1, 0x47),
> +	_INIT_DCS_CMD(0xD2, 0x45),
> +	_INIT_DCS_CMD(0xD3, 0x41),
> +	_INIT_DCS_CMD(0xD7, 0x50),
> +	_INIT_DCS_CMD(0xD8, 0x40),
> +	_INIT_DCS_CMD(0xD9, 0x40),
> +	_INIT_DCS_CMD(0xDA, 0x40),
> +	_INIT_DCS_CMD(0xDB, 0x40),
> +	_INIT_DCS_CMD(0xDC, 0x4E),
> +	_INIT_DCS_CMD(0xDD, 0x52),
> +	_INIT_DCS_CMD(0xDE, 0x51),
> +	_INIT_DCS_CMD(0xE1, 0x5E),
> +	_INIT_DCS_CMD(0xE2, 0x5C),
> +	_INIT_DCS_CMD(0xE3, 0x4C),
> +	_INIT_DCS_CMD(0xE4, 0x4A),
> +	_INIT_DCS_CMD(0xE5, 0x48),
> +	_INIT_DCS_CMD(0xE6, 0x46),
> +	_INIT_DCS_CMD(0xE7, 0x42),
> +	_INIT_DCS_CMD(0xB0, 0x03),
> +	_INIT_DCS_CMD(0xBE, 0x03),
> +	_INIT_DCS_CMD(0xCC, 0x44),
> +	_INIT_DCS_CMD(0xC8, 0x07),
> +	_INIT_DCS_CMD(0xC9, 0x05),
> +	_INIT_DCS_CMD(0xCA, 0x42),
> +	_INIT_DCS_CMD(0xCD, 0x3E),
> +	_INIT_DCS_CMD(0xCF, 0x60),
> +	_INIT_DCS_CMD(0xD2, 0x04),
> +	_INIT_DCS_CMD(0xD3, 0x04),
> +	_INIT_DCS_CMD(0xD4, 0x01),
> +	_INIT_DCS_CMD(0xD5, 0x00),
> +	_INIT_DCS_CMD(0xD6, 0x03),
> +	_INIT_DCS_CMD(0xD7, 0x04),
> +	_INIT_DCS_CMD(0xD9, 0x01),
> +	_INIT_DCS_CMD(0xDB, 0x01),
> +	_INIT_DCS_CMD(0xE4, 0xF0),
> +	_INIT_DCS_CMD(0xE5, 0x0A),
> +	_INIT_DCS_CMD(0xB0, 0x00),
> +	_INIT_DCS_CMD(0xCC, 0x08),
> +	_INIT_DCS_CMD(0xC2, 0x08),
> +	_INIT_DCS_CMD(0xC4, 0x10),
> +	_INIT_DCS_CMD(0xB0, 0x02),
> +	_INIT_DCS_CMD(0xC0, 0x00),
> +	_INIT_DCS_CMD(0xC1, 0x0A),
> +	_INIT_DCS_CMD(0xC2, 0x20),
> +	_INIT_DCS_CMD(0xC3, 0x24),
> +	_INIT_DCS_CMD(0xC4, 0x23),
> +	_INIT_DCS_CMD(0xC5, 0x29),
> +	_INIT_DCS_CMD(0xC6, 0x23),
> +	_INIT_DCS_CMD(0xC7, 0x1C),
> +	_INIT_DCS_CMD(0xC8, 0x19),
> +	_INIT_DCS_CMD(0xC9, 0x17),
> +	_INIT_DCS_CMD(0xCA, 0x17),
> +	_INIT_DCS_CMD(0xCB, 0x18),
> +	_INIT_DCS_CMD(0xCC, 0x1A),
> +	_INIT_DCS_CMD(0xCD, 0x1E),
> +	_INIT_DCS_CMD(0xCE, 0x20),
> +	_INIT_DCS_CMD(0xCF, 0x23),
> +	_INIT_DCS_CMD(0xD0, 0x07),
> +	_INIT_DCS_CMD(0xD1, 0x00),
> +	_INIT_DCS_CMD(0xD2, 0x00),
> +	_INIT_DCS_CMD(0xD3, 0x0A),
> +	_INIT_DCS_CMD(0xD4, 0x13),
> +	_INIT_DCS_CMD(0xD5, 0x1C),
> +	_INIT_DCS_CMD(0xD6, 0x1A),
> +	_INIT_DCS_CMD(0xD7, 0x13),
> +	_INIT_DCS_CMD(0xD8, 0x17),
> +	_INIT_DCS_CMD(0xD9, 0x1C),
> +	_INIT_DCS_CMD(0xDA, 0x19),
> +	_INIT_DCS_CMD(0xDB, 0x17),
> +	_INIT_DCS_CMD(0xDC, 0x17),
> +	_INIT_DCS_CMD(0xDD, 0x18),
> +	_INIT_DCS_CMD(0xDE, 0x1A),
> +	_INIT_DCS_CMD(0xDF, 0x1E),
> +	_INIT_DCS_CMD(0xE0, 0x20),
> +	_INIT_DCS_CMD(0xE1, 0x23),
> +	_INIT_DCS_CMD(0xE2, 0x07),
> +	_INIT_DCS_CMD(0X11),
> +	_INIT_DELAY_CMD(120),
> +	_INIT_DCS_CMD(0X29),
> +	_INIT_DELAY_CMD(80),
> +	{},
> +};
> +
>   static inline struct boe_panel *to_boe_panel(struct drm_panel *panel)
>   {
>   	return container_of(panel, struct boe_panel, base);
> @@ -1497,6 +1594,32 @@ static const struct panel_desc boe_tv105wum_nw0_desc = {
>   	.init_cmds = boe_init_cmd,
>   };
>   
> +static const struct drm_display_mode starry_qfh032011_53g_default_mode = {
> +	.clock = 165731,
> +	.hdisplay = 1200,
> +	.hsync_start = 1200 + 100,
> +	.hsync_end = 1200 + 100 + 10,
> +	.htotal = 1200 + 100 + 10 + 100,
> +	.vdisplay = 1920,
> +	.vsync_start = 1920 + 14,
> +	.vsync_end = 1920 + 14 + 10,
> +	.vtotal = 1920 + 14 + 10 + 15,
> +};
> +
> +static const struct panel_desc starry_qfh032011_53g_desc = {
> +	.modes = &starry_qfh032011_53g_default_mode,
> +	.bpc = 8,
> +	.size = {
> +		.width_mm = 135,
> +		.height_mm = 216,
> +	},
> +	.lanes = 4,
> +	.format = MIPI_DSI_FMT_RGB888,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
> +		      MIPI_DSI_MODE_LPM,
> +	.init_cmds = starry_qfh032011_53g_init_cmd,
> +};
> +
>   static int boe_panel_get_modes(struct drm_panel *panel,
>   			       struct drm_connector *connector)
>   {
> @@ -1667,6 +1790,9 @@ static const struct of_device_id boe_of_match[] = {
>   	{ .compatible = "innolux,hj110iz-01a",
>   	  .data = &inx_hj110iz_desc
>   	},
> +	{ .compatible = "starry,2081101qfh032011-53g",
> +	  .data = &starry_qfh032011_53g_desc
> +	},
>   	{ /* sentinel */ }
>   };
>   MODULE_DEVICE_TABLE(of, boe_of_match);


Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
