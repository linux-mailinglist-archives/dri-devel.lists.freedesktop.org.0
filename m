Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBABB67D076
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 16:41:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 525D310E945;
	Thu, 26 Jan 2023 15:41:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D60CF10E946
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 15:41:50 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 f12-20020a7bc8cc000000b003daf6b2f9b9so3484106wml.3
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jan 2023 07:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=k0m12v3Di2o/+lIlzBAfogul/kt+ur4S1vNxsmILAGw=;
 b=n/tt0TbbZY0kvvmlybh+maDKHQ0be4D7R2GJKVsJPSnJpVsx0QLfpqZZqdY0GvK2Rj
 CDDH1MgMpvljpXQpOQZODWUXYojOW/ygyBIW5eLeOqR1t9yhYV+UpJOGKnrxpH79FpYD
 eJUQKgSM2oK309E6IXdbCCYlwwu47qgl0ob6zmebhg1Z83DhVXlVoVW/hpmT7LfqDHE+
 s1Rk5q26JwDcJ8vYdVxuro2CG1Mt/rFiV2Nu9V1CsS0NBtql8GlWwAnH5ypNl22MJpQw
 VfcF+NcQqSMFhL0zzCieU4CVxSqFYgaIHpNiOHdy6QcMZlzupyeVoYkDihkeDxmUT/Pb
 cqBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=k0m12v3Di2o/+lIlzBAfogul/kt+ur4S1vNxsmILAGw=;
 b=u4S2Zh+whDBEOwX9RlYsnfE033h33840dJG3510GG8XX5PMKiXLT9JzIMkdudd6y6j
 HGRrkTg5/TnWYvJSf9wFFPnQvtGeyeg0H+2KDLdUguTP2QPtMrMK5B1aJKVmZP96sUZQ
 XbLdyr2FDrMKNAO5oofsuytjsamStX8v8uhQ4Ox5HXyzhaByBB9tILL6QtqPKXrvyhLX
 W4lIRvFhxZhjh1XUlyKcQx0J4ANMTp2jLbn77nGklA5BxQ+YVp0LN2eOfqoXlhIR/8E8
 /+HVcw3t/uRVBUKnrDCXV6C2epYQpjBB5aULD1C7hHYUV3iuOpDHa4LuMa7fWRZHW1Qw
 tJhw==
X-Gm-Message-State: AFqh2kr2ygakXcWOPAD2yfcpvSCOdM5xd5x24kCzefFv4aeGNhPAQWBq
 Gkt5S38MlAezx8gk/8oCNGZPRg==
X-Google-Smtp-Source: AMrXdXuOVMWTSO6PYETKl64COGKG0SdwZcv6kBqbetqGCuLNBWyPlhLiAo0Ppr7eUnXdj8jthAjXvA==
X-Received: by 2002:a05:600c:4a27:b0:3da:fae5:7e2f with SMTP id
 c39-20020a05600c4a2700b003dafae57e2fmr35805078wmp.3.1674747709376; 
 Thu, 26 Jan 2023 07:41:49 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
 by smtp.gmail.com with ESMTPSA id
 j38-20020a05600c1c2600b003daff80f16esm7367238wms.27.2023.01.26.07.41.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Jan 2023 07:41:48 -0800 (PST)
Message-ID: <c851113d-c243-c883-f038-3e61a5b8b066@linaro.org>
Date: Thu, 26 Jan 2023 16:41:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 2/4] DRM: BRIDGE: TFP410: Support basic I2C interface
Content-Language: en-US
To: Jonathan Cormier <jcormier@criticallink.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Jyri Sarha <jsarha@ti.com>
References: <20230125-tfp410_i2c-v1-0-66a4d4e390b7@criticallink.com>
 <20230125-tfp410_i2c-v1-2-66a4d4e390b7@criticallink.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230125-tfp410_i2c-v1-2-66a4d4e390b7@criticallink.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: devicetree@vger.kernel.org,
 Michael Williamson <michael.williamson@criticallink.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bob Duke <bduke@criticallink.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/01/2023 22:09, Jonathan Cormier wrote:
> From: Michael Williamson <michael.williamson@criticallink.com>
> 
> The TFP410 driver does not support I2C.  As such, the device remains in
> Power Down if the I2C is enabled by the bootstrap pins.
> 
> Add basic support for the I2C interface, and provide support to take
> the device out of power down when enabled.  Also read the bootstrap mode
> pins via the CTL_1_MODE register when using the I2C bus.
> 
> Signed-off-by: Michael Williamson <michael.williamson@criticallink.com>
> Signed-off-by: Jonathan Cormier <jcormier@criticallink.com>
> ---
>  drivers/gpu/drm/bridge/ti-tfp410.c | 95 +++++++++++++++++++++++++++-----------
>  1 file changed, 68 insertions(+), 27 deletions(-)

Use subject prefixes matching the subsystem (which you can get for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching).

hint: it is entirely different.

> 
> diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
> index b9635abbad16..323a6d9ed188 100644
> --- a/drivers/gpu/drm/bridge/ti-tfp410.c
> +++ b/drivers/gpu/drm/bridge/ti-tfp410.c
> @@ -6,6 +6,7 @@
>  
>  #include <linux/gpio/consumer.h>
>  #include <linux/i2c.h>
> +#include <linux/regmap.h>
>  #include <linux/media-bus-format.h>
>  #include <linux/module.h>
>  #include <linux/of_graph.h>
> @@ -21,6 +22,20 @@

(...)

>  
>  static void tfp410_i2c_remove(struct i2c_client *client)
> @@ -408,7 +449,7 @@ MODULE_DEVICE_TABLE(i2c, tfp410_i2c_ids);
>  static struct i2c_driver tfp410_i2c_driver = {
>  	.driver = {
>  		.name	= "tfp410",
> -		.of_match_table = of_match_ptr(tfp410_match),
> +		.of_match_table = tfp410_match,

This does not look related to the patch.

Best regards,
Krzysztof

