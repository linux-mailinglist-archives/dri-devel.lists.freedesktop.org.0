Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A72B25A41
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 06:03:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC62610E200;
	Thu, 14 Aug 2025 04:03:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="QbCQu5rX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11E5510E200
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 04:03:03 +0000 (UTC)
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
 by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57E42thg2222677;
 Wed, 13 Aug 2025 23:02:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1755144175;
 bh=rWL1oQqSxIaAHJO6HOoNdyoDTllnJzkAz1ZHedm1Jfc=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=QbCQu5rXjlb4LAYjyhYwiNZ3bq0JWu5C2JtkNVqTYsYvQnFwaChqXgjaa6hUlvLMO
 rY1wMtfy86PT2QZ5AxhJ882HQ3P7zIvEPkDbks8rilmfDTq6DU1y5UxpZx7Xm8hDhE
 m3KN3lBZ9kqdlL4xGvJ4RQfnVVTh2Ykl8BD2nlLg=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57E42tgQ874082
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
 Wed, 13 Aug 2025 23:02:55 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Wed, 13
 Aug 2025 23:02:54 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Wed, 13 Aug 2025 23:02:54 -0500
Received: from [10.249.145.16] ([10.249.145.16])
 by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57E42nxv3013204;
 Wed, 13 Aug 2025 23:02:50 -0500
Message-ID: <5ea5626b-6e01-47d9-985d-16eb6e3b782f@ti.com>
Date: Thu, 14 Aug 2025 09:32:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/bridge: it66121: Add it66122 support
To: Nishanth Menon <nm@ti.com>, Conor Dooley <conor+dt@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, David Airlie
 <airlied@gmail.com>, Maxime Ripard <mripard@kernel.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Neil Armstrong
 <neil.armstrong@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, Robert Nelson <robertcnelson@gmail.com>,
 Jason Kridner <jkridner@beagleboard.org>
References: <20250813190835.344563-1-nm@ti.com>
 <20250813190835.344563-3-nm@ti.com>
Content-Language: en-US
From: devarsh <devarsht@ti.com>
In-Reply-To: <20250813190835.344563-3-nm@ti.com>
Content-Type: text/plain; charset="UTF-8"
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

Hi Nishanth,

Thanks for the patch.

On 14/08/25 00:38, Nishanth Menon wrote:
> The IT66122 is a drop in replacement for the IT66122. 

The IT66122 is a drop in replacement for the IT66121

The part is
> register compatible with what we use of the IT66121. The only relevant
> change being the PID is now 0x0622 vs 0x0612. Add this extra PID so
> probe does not fail during the PID check with these new parts.
> 
> Signed-off-by: Nishanth Menon <nm@ti.com>
> ---
> 
> Note: checkpatch --strict reports:
> CHECK: No space is necessary after a cast
> #45: FILE: drivers/gpu/drm/bridge/ite-it66121.c:1643:
> +	{ "it66122", (kernel_ulong_t) &it66122_chip_info },
> 
> I chose to retain existing style - let me know if we want to clean this
> up as well.
> 
> NOTE: .id = ID_IT66121 is explicitly used as indication of reuse of
> existing it66121 compatibility.
> 
>  drivers/gpu/drm/bridge/ite-it66121.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
> index aa7b1dcc5d70..329fa47a5701 100644
> --- a/drivers/gpu/drm/bridge/ite-it66121.c
> +++ b/drivers/gpu/drm/bridge/ite-it66121.c
> @@ -1618,6 +1618,12 @@ static const struct it66121_chip_info it66121_chip_info = {
>  	.pid = 0x0612,
>  };
>  
> +static const struct it66121_chip_info it66122_chip_info = {
> +	.id = ID_IT66121,

I think better to create separate .id as done for other chip_info structs :

.id = ID_IT66122

Regards
Devarsh

> +	.vid = 0x4954,
> +	.pid = 0x0622,
> +};
> +
>  static const struct it66121_chip_info it6610_chip_info = {
>  	.id = ID_IT6610,
>  	.vid = 0xca00,
> @@ -1626,6 +1632,7 @@ static const struct it66121_chip_info it6610_chip_info = {
>  
>  static const struct of_device_id it66121_dt_match[] = {
>  	{ .compatible = "ite,it66121", &it66121_chip_info },
> +	{ .compatible = "ite,it66122", &it66122_chip_info },
>  	{ .compatible = "ite,it6610", &it6610_chip_info },
>  	{ }
>  };
> @@ -1633,6 +1640,7 @@ MODULE_DEVICE_TABLE(of, it66121_dt_match);
>  
>  static const struct i2c_device_id it66121_id[] = {
>  	{ "it66121", (kernel_ulong_t) &it66121_chip_info },
> +	{ "it66122", (kernel_ulong_t) &it66122_chip_info },
>  	{ "it6610", (kernel_ulong_t) &it6610_chip_info },
>  	{ }
>  };

