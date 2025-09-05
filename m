Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ECE3B4589D
	for <lists+dri-devel@lfdr.de>; Fri,  5 Sep 2025 15:19:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBA2910E083;
	Fri,  5 Sep 2025 13:19:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="rX6EW+LJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A054810E083
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Sep 2025 13:19:13 +0000 (UTC)
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
 by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 585DIwcr3719256;
 Fri, 5 Sep 2025 08:18:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1757078338;
 bh=Vjy5D3JgftIM3mq1lO2nAabFylrYZnZJc5kE8C4YKoQ=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=rX6EW+LJbrM7p3sbMr5EIJR1dm6j2ZX3zGezLmrJAqG0ziUlBk4/rxCdNfntX7zvT
 ru5PZc317Nne+HmzItcDiwrW8zMqnrZxheg1moewJb+sk3oDbmk+ixjBIpO51d6l2a
 sBmyTqpXynLDGq+Yb3FARrKU4ebEdy4fw8UJAIXE=
Received: from DFLE20.ent.ti.com (dfle20.ent.ti.com [10.64.6.57])
 by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 585DIw9Z940211
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 5 Sep 2025 08:18:58 -0500
Received: from DFLE200.ent.ti.com (10.64.6.58) by DFLE20.ent.ti.com
 (10.64.6.57) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 5 Sep
 2025 08:18:58 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.2.2562.20; Fri, 5 Sep
 2025 08:18:58 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 5 Sep 2025 08:18:58 -0500
Received: from [172.24.233.62] (devarsh-precision-tower-3620.dhcp.ti.com
 [172.24.233.62])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 585DIrwx490934;
 Fri, 5 Sep 2025 08:18:54 -0500
Message-ID: <c98e017d-5aa0-4b40-8ee1-5f58901b6c07@ti.com>
Date: Fri, 5 Sep 2025 18:48:53 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/panel: ilitek-ili9881c: Add configuration for
 5" Raspberry Pi 720x1280
To: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 <dri-devel@lists.freedesktop.org>
CC: Conor Dooley <conor+dt@kernel.org>, Dave Stevenson
 <dave.stevenson@raspberrypi.com>, David Airlie <airlied@gmail.com>,
 "Jessica Zhang" <jessica.zhang@oss.qualcomm.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Simona Vetter
 <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, <devicetree@vger.kernel.org>,
 <linux-renesas-soc@vger.kernel.org>
References: <20250904205743.186177-1-marek.vasut+renesas@mailbox.org>
 <20250904205743.186177-2-marek.vasut+renesas@mailbox.org>
Content-Language: en-US
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <20250904205743.186177-2-marek.vasut+renesas@mailbox.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
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

Hi Marek,

Thanks for the patch.

On 05/09/25 02:26, Marek Vasut wrote:
> Add configuration for the 5" Raspberry Pi 720x1280 DSI panel
> based on ili9881. This uses 10px longer horizontal sync pulse
> and 10px shorter HBP to avoid very short hsync pulse.

Is there a publicly available datasheet for the aforementioned ilitek 
controller used in the panel, also does the same document also mention 
the manufacturer specific DSC commands used in rpi_5inch_init[] ?

Also is there a separate document mentioning timing parameters for porch 
values and sync pulse widths that you are using here for Raspberry Pi 
720x1280 DSI panel ?

Regards
Devarsh

> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> V2: Turn ILI9881C_COMMAND_INSTR() params lowercase
> ---
>   drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 214 ++++++++++++++++++
>   1 file changed, 214 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> index fee10546c7c7f..7049e4d23f7f4 100644
> --- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> @@ -1224,6 +1224,194 @@ static const struct ili9881c_instr am8001280g_init[] = {
>   	ILI9881C_COMMAND_INSTR(MIPI_DCS_WRITE_POWER_SAVE, 0x00),
>   };
>   
> +static const struct ili9881c_instr rpi_5inch_init[] = {
> +	ILI9881C_SWITCH_PAGE_INSTR(3),
> +	ILI9881C_COMMAND_INSTR(0x01, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x02, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x03, 0x73),
> +	ILI9881C_COMMAND_INSTR(0x04, 0x73),
> +	ILI9881C_COMMAND_INSTR(0x05, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x06, 0x06),
> +	ILI9881C_COMMAND_INSTR(0x07, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x08, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x09, 0x01),
> +	ILI9881C_COMMAND_INSTR(0x0a, 0x01),
> +	ILI9881C_COMMAND_INSTR(0x0b, 0x01),
> +	ILI9881C_COMMAND_INSTR(0x0c, 0x01),
> +	ILI9881C_COMMAND_INSTR(0x0d, 0x01),
> +	ILI9881C_COMMAND_INSTR(0x0e, 0x01),
> +	ILI9881C_COMMAND_INSTR(0x0f, 0x01),
> +	ILI9881C_COMMAND_INSTR(0x10, 0x01),
> +	ILI9881C_COMMAND_INSTR(0x11, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x12, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x13, 0x01),
> +	ILI9881C_COMMAND_INSTR(0x14, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x15, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x16, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x17, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x18, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x19, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x1a, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x1b, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x1c, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x1d, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x1e, 0xc0),
> +	ILI9881C_COMMAND_INSTR(0x1f, 0x80),
> +	ILI9881C_COMMAND_INSTR(0x20, 0x04),
> +	ILI9881C_COMMAND_INSTR(0x21, 0x03),
> +	ILI9881C_COMMAND_INSTR(0x22, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x23, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x24, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x25, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x26, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x27, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x28, 0x33),
> +	ILI9881C_COMMAND_INSTR(0x29, 0x03),
> +	ILI9881C_COMMAND_INSTR(0x2a, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x2b, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x2c, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x2d, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x2e, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x2f, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x30, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x31, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x32, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x33, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x34, 0x03),
> +	ILI9881C_COMMAND_INSTR(0x35, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x36, 0x03),
> +	ILI9881C_COMMAND_INSTR(0x37, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x38, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x39, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x3a, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x3b, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x3c, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x3d, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x3e, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x3f, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x40, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x41, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x42, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x43, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x44, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x50, 0x01),
> +	ILI9881C_COMMAND_INSTR(0x51, 0x23),
> +	ILI9881C_COMMAND_INSTR(0x52, 0x45),
> +	ILI9881C_COMMAND_INSTR(0x53, 0x67),
> +	ILI9881C_COMMAND_INSTR(0x54, 0x89),
> +	ILI9881C_COMMAND_INSTR(0x55, 0xab),
> +	ILI9881C_COMMAND_INSTR(0x56, 0x01),
> +	ILI9881C_COMMAND_INSTR(0x57, 0x23),
> +	ILI9881C_COMMAND_INSTR(0x58, 0x45),
> +	ILI9881C_COMMAND_INSTR(0x59, 0x67),
> +	ILI9881C_COMMAND_INSTR(0x5a, 0x89),
> +	ILI9881C_COMMAND_INSTR(0x5b, 0xab),
> +	ILI9881C_COMMAND_INSTR(0x5c, 0xcd),
> +	ILI9881C_COMMAND_INSTR(0x5d, 0xef),
> +	ILI9881C_COMMAND_INSTR(0x5e, 0x10),
> +	ILI9881C_COMMAND_INSTR(0x5f, 0x09),
> +	ILI9881C_COMMAND_INSTR(0x60, 0x08),
> +	ILI9881C_COMMAND_INSTR(0x61, 0x0f),
> +	ILI9881C_COMMAND_INSTR(0x62, 0x0e),
> +	ILI9881C_COMMAND_INSTR(0x63, 0x0d),
> +	ILI9881C_COMMAND_INSTR(0x64, 0x0c),
> +	ILI9881C_COMMAND_INSTR(0x65, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x66, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x67, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x68, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x69, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x6a, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x6b, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x6c, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x6d, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x6e, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x6f, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x70, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x71, 0x06),
> +	ILI9881C_COMMAND_INSTR(0x72, 0x07),
> +	ILI9881C_COMMAND_INSTR(0x73, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x74, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x75, 0x06),
> +	ILI9881C_COMMAND_INSTR(0x76, 0x07),
> +	ILI9881C_COMMAND_INSTR(0x77, 0x0e),
> +	ILI9881C_COMMAND_INSTR(0x78, 0x0f),
> +	ILI9881C_COMMAND_INSTR(0x79, 0x0c),
> +	ILI9881C_COMMAND_INSTR(0x7a, 0x0d),
> +	ILI9881C_COMMAND_INSTR(0x7b, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x7c, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x7d, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x7e, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x7f, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x80, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x81, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x82, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x83, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x84, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x85, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x86, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x87, 0x09),
> +	ILI9881C_COMMAND_INSTR(0x88, 0x08),
> +	ILI9881C_COMMAND_INSTR(0x89, 0x02),
> +	ILI9881C_COMMAND_INSTR(0x8a, 0x02),
> +	ILI9881C_SWITCH_PAGE_INSTR(4),
> +	ILI9881C_COMMAND_INSTR(0x6c, 0x15),
> +	ILI9881C_COMMAND_INSTR(0x6e, 0x2a),
> +	ILI9881C_COMMAND_INSTR(0x6f, 0x57),
> +	ILI9881C_COMMAND_INSTR(0x3a, 0xa4),
> +	ILI9881C_COMMAND_INSTR(0x8d, 0x1a),
> +	ILI9881C_COMMAND_INSTR(0x87, 0xba),
> +	ILI9881C_COMMAND_INSTR(0x26, 0x76),
> +	ILI9881C_COMMAND_INSTR(0xb2, 0xd1),
> +	ILI9881C_SWITCH_PAGE_INSTR(1),
> +	ILI9881C_COMMAND_INSTR(0x22, 0x0a),
> +	ILI9881C_COMMAND_INSTR(0x31, 0x00),
> +	ILI9881C_COMMAND_INSTR(0x53, 0x35),
> +	ILI9881C_COMMAND_INSTR(0x55, 0x50),
> +	ILI9881C_COMMAND_INSTR(0x50, 0xaf),
> +	ILI9881C_COMMAND_INSTR(0x51, 0xaf),
> +	ILI9881C_COMMAND_INSTR(0x60, 0x14),
> +	ILI9881C_COMMAND_INSTR(0xa0, 0x08),
> +	ILI9881C_COMMAND_INSTR(0xa1, 0x1d),
> +	ILI9881C_COMMAND_INSTR(0xa2, 0x2c),
> +	ILI9881C_COMMAND_INSTR(0xa3, 0x14),
> +	ILI9881C_COMMAND_INSTR(0xa4, 0x19),
> +	ILI9881C_COMMAND_INSTR(0xa5, 0x2e),
> +	ILI9881C_COMMAND_INSTR(0xa6, 0x22),
> +	ILI9881C_COMMAND_INSTR(0xa7, 0x23),
> +	ILI9881C_COMMAND_INSTR(0xa8, 0x97),
> +	ILI9881C_COMMAND_INSTR(0xa9, 0x1e),
> +	ILI9881C_COMMAND_INSTR(0xaa, 0x29),
> +	ILI9881C_COMMAND_INSTR(0xab, 0x7b),
> +	ILI9881C_COMMAND_INSTR(0xac, 0x18),
> +	ILI9881C_COMMAND_INSTR(0xad, 0x17),
> +	ILI9881C_COMMAND_INSTR(0xae, 0x4b),
> +	ILI9881C_COMMAND_INSTR(0xaf, 0x1f),
> +	ILI9881C_COMMAND_INSTR(0xb0, 0x27),
> +	ILI9881C_COMMAND_INSTR(0xb1, 0x52),
> +	ILI9881C_COMMAND_INSTR(0xb2, 0x63),
> +	ILI9881C_COMMAND_INSTR(0xb3, 0x39),
> +	ILI9881C_COMMAND_INSTR(0xc0, 0x08),
> +	ILI9881C_COMMAND_INSTR(0xc1, 0x1d),
> +	ILI9881C_COMMAND_INSTR(0xc2, 0x2c),
> +	ILI9881C_COMMAND_INSTR(0xc3, 0x14),
> +	ILI9881C_COMMAND_INSTR(0xc4, 0x19),
> +	ILI9881C_COMMAND_INSTR(0xc5, 0x2e),
> +	ILI9881C_COMMAND_INSTR(0xc6, 0x22),
> +	ILI9881C_COMMAND_INSTR(0xc7, 0x23),
> +	ILI9881C_COMMAND_INSTR(0xc8, 0x97),
> +	ILI9881C_COMMAND_INSTR(0xc9, 0x1e),
> +	ILI9881C_COMMAND_INSTR(0xca, 0x29),
> +	ILI9881C_COMMAND_INSTR(0xcb, 0x7b),
> +	ILI9881C_COMMAND_INSTR(0xcc, 0x18),
> +	ILI9881C_COMMAND_INSTR(0xcd, 0x17),
> +	ILI9881C_COMMAND_INSTR(0xce, 0x4b),
> +	ILI9881C_COMMAND_INSTR(0xcf, 0x1f),
> +	ILI9881C_COMMAND_INSTR(0xd0, 0x27),
> +	ILI9881C_COMMAND_INSTR(0xd1, 0x52),
> +	ILI9881C_COMMAND_INSTR(0xd2, 0x63),
> +	ILI9881C_COMMAND_INSTR(0xd3, 0x39),
> +};
> +
>   static const struct ili9881c_instr rpi_7inch_init[] = {
>   	ILI9881C_SWITCH_PAGE_INSTR(3),
>   	ILI9881C_COMMAND_INSTR(0x01, 0x00),
> @@ -1806,6 +1994,23 @@ static const struct drm_display_mode am8001280g_default_mode = {
>   	.height_mm	= 151,
>   };
>   
> +static const struct drm_display_mode rpi_5inch_default_mode = {
> +	.clock		= 83333,
> +
> +	.hdisplay	= 720,
> +	.hsync_start	= 720 + 110,
> +	.hsync_end	= 720 + 110 + 12,
> +	.htotal		= 720 + 110 + 12 + 95,
> +
> +	.vdisplay	= 1280,
> +	.vsync_start	= 1280 + 100,
> +	.vsync_end	= 1280 + 100 + 2,
> +	.vtotal		= 1280 + 100 + 2 + 100,
> +
> +	.width_mm	= 62,
> +	.height_mm	= 110,
> +};
> +
>   static const struct drm_display_mode rpi_7inch_default_mode = {
>   	.clock          = 83330,
>   
> @@ -2000,6 +2205,14 @@ static const struct ili9881c_desc am8001280g_desc = {
>   		      MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM,
>   };
>   
> +static const struct ili9881c_desc rpi_5inch_desc = {
> +	.init = rpi_5inch_init,
> +	.init_length = ARRAY_SIZE(rpi_5inch_init),
> +	.mode = &rpi_5inch_default_mode,
> +	.mode_flags =  MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_LPM,
> +	.lanes = 2,
> +};
> +
>   static const struct ili9881c_desc rpi_7inch_desc = {
>   	.init = rpi_7inch_init,
>   	.init_length = ARRAY_SIZE(rpi_7inch_init),
> @@ -2025,6 +2238,7 @@ static const struct of_device_id ili9881c_of_match[] = {
>   	{ .compatible = "tdo,tl050hdv35", .data = &tl050hdv35_desc },
>   	{ .compatible = "wanchanglong,w552946aba", .data = &w552946aba_desc },
>   	{ .compatible = "ampire,am8001280g", .data = &am8001280g_desc },
> +	{ .compatible = "raspberrypi,dsi-5inch", &rpi_5inch_desc },
>   	{ .compatible = "raspberrypi,dsi-7inch", &rpi_7inch_desc },
>   	{ }
>   };

