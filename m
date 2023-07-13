Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5B9751B5D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 10:17:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BA0410E175;
	Thu, 13 Jul 2023 08:17:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 359BE10E175
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 08:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689236224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SlmG1NQg8lK8BEmDhzi6aPTLUD5I0BLXufBYMxcvp0E=;
 b=ZHNbVXIgYvShBUVlRGyd7giIzIdIWxTjJzJW8nCqaWVsAZyMdqbrdy2yEthXKjpEp8ye/Q
 p3rteVZEQpJ9ISnNMA1DKXyTBruXr+KzU/nWK9EBNaYug2gms7LxVKqChXmsP8m1iUJS9k
 84/K9N5g0pcjTxDcnPKTfHj9TEY9b3g=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-575-HSdPU1XvNkOe0OlZ6qK3UQ-1; Thu, 13 Jul 2023 04:17:03 -0400
X-MC-Unique: HSdPU1XvNkOe0OlZ6qK3UQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-3fbfc766a78so2179405e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 01:17:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689236222; x=1691828222;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SlmG1NQg8lK8BEmDhzi6aPTLUD5I0BLXufBYMxcvp0E=;
 b=I5YQfzNOMTvljSn2FFOANZx5CsshTUiuXTTKjk9VNdVf1d0w/BHtOikzlOr9QtnwPZ
 rGGXaFsSKLIUBwPUEsGyYtv9wQZ8klI4Geda7F860Xi+FIAhfYZBgdpy3P3dgiSTW622
 mwN6o1+Zf2zD/krc5tY69PksC77cj3bMfvf/2iJNBmZNVyXJIxCwzUdfy4eb1Tu1k7Dv
 O2JHRs3oH1r0p/ZE1ZC5ZSeW4fqas6kQ65QBJN51wVJeBQCtJDzUtJc8NKIE4CR6S3np
 Q1v68hDpcKaXSH4UA6MFOoN11rn+Wt4qtwy9+mOmlT5RevBbEr+lR2RdBZaAS5FZ72v6
 lpjg==
X-Gm-Message-State: ABy/qLYZQfgJ6iqLp+sG/o31MbgoRwvwM/pZHdXzdzivu5892xGzxwQO
 2zYib0SsFRZtOdsHLEERb/j/5jn8EzlNZ5RVvHTR40urxa+BfX30b4LWIDPQJ9A1tERYg80xy1q
 +EMklNWyAVzVhPvEsfjT1aKMBRQ7F
X-Received: by 2002:a05:600c:2054:b0:3f9:b972:731b with SMTP id
 p20-20020a05600c205400b003f9b972731bmr789959wmg.11.1689236221991; 
 Thu, 13 Jul 2023 01:17:01 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGnNoMOVokHTB3Apf6SB3NykOfWpRrdAYycrTRoVWQLp6nz6nXG/l+Exg75oplzQjPV6VBPQA==
X-Received: by 2002:a05:600c:2054:b0:3f9:b972:731b with SMTP id
 p20-20020a05600c205400b003f9b972731bmr789942wmg.11.1689236221626; 
 Thu, 13 Jul 2023 01:17:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 z19-20020a1c4c13000000b003fb225d414fsm17464076wmf.21.2023.07.13.01.17.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jul 2023 01:17:01 -0700 (PDT)
Message-ID: <a6eb098a-8ac6-7240-dddc-ba645a1931fc@redhat.com>
Date: Thu, 13 Jul 2023 10:17:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v5 2/2] drm/ast: report connection status on Display Port.
To: Jammy Huang <jammy_huang@aspeedtech.com>, tzimmermann@suse.de,
 airlied@redhat.com, kuohsiang_chou@aspeedtech.com,
 jani.nikula@linux.intel.com, dianders@chromium.org
References: <20230713064037.315387-1-jfalempe@redhat.com>
 <20230713064037.315387-2-jfalempe@redhat.com>
 <f61ea042-a14c-9c8f-710d-0ba0820686fe@aspeedtech.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <f61ea042-a14c-9c8f-710d-0ba0820686fe@aspeedtech.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/07/2023 09:00, Jammy Huang wrote:
> Hi Jocelyn,
> 
> Thanks for your work.
> 
> On 2023/7/13 下午 02:40, Jocelyn Falempe wrote:
>> Aspeed always report the display port as "connected", because it
>> doesn't set a .detect_ctx callback.
>> Fix this by providing the proper detect callback for astdp and dp501.
>>
>> This also fixes the following regression:
>> Since commit fae7d186403e ("drm/probe-helper: Default to 640x480 if no
>> EDID on DP") The default resolution is now 640x480 when no monitor is
>> connected. But Aspeed graphics is mostly used in servers, where no 
>> monitor
>> is attached. This also affects the remote BMC resolution to 640x480, 
>> which
>> is inconvenient, and breaks the anaconda installer.
>>
>> v2: Add .detect callback to the dp/dp501 connector (Jani Nikula)
>> v3: Use .detect_ctx callback, and refactors (Thomas Zimmermann)
>>      Add a BMC virtual connector
>> v4: Better indent detect_ctx() functions (Thomas Zimmermann)
>> v5: Enable polling of the dp and dp501 connector status
>>      (Thomas Zimmermann)
>>
>> Fixes: fae7d186403e ("drm/probe-helper: Default to 640x480 if no EDID 
>> on DP")
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>   drivers/gpu/drm/ast/ast_dp.c    | 11 ++++++++++
>>   drivers/gpu/drm/ast/ast_dp501.c | 37 ++++++++++++++++++++++-----------
>>   drivers/gpu/drm/ast/ast_drv.h   |  2 ++
>>   drivers/gpu/drm/ast/ast_mode.c  | 31 +++++++++++++++++++++++++--
>>   4 files changed, 67 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
>> index 6dc1a09504e1..bf78f3d4aa3f 100644
>> --- a/drivers/gpu/drm/ast/ast_dp.c
>> +++ b/drivers/gpu/drm/ast/ast_dp.c
>> @@ -7,6 +7,17 @@
>>   #include <drm/drm_print.h>
>>   #include "ast_drv.h"
>> +bool ast_astdp_is_connected(struct ast_device *ast)
>> +{
>> +    if (!ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xD1, 
>> ASTDP_MCU_FW_EXECUTING))
>> +        return false;
>> +    if (!ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xDC, 
>> ASTDP_LINK_SUCCESS))
>> +        return false;
>> +    if (!ast_get_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xDF, ASTDP_HPD))
>> +        return false;
>> +    return true;
>> +}
> 
> * ASPDP_LINK_SUCCESS is true, when DP link training is finished. The DP 
> link quality is good
> 
> enough to deliver video data.
> 
> * ASTDP_HPD is true, when there is DP sink pull high HPD.
> 
> Thus, ASTDP_HPD is the prerequisite of ASTDP_LINK_SUCCESS. I would 
> suggest to remove
> 
> the check for ASTDP_LINK_SUCCESS here. ASTDP_HPD is good enough for 
> connected status.
> 
> If you want to check all these three status, please change the order, 
> FW_EXECUTING -> HPD ->
> 
> LINK_SUCCESS.

Thanks for the detailed explanations.
I looked at other drivers to see if HPD is good enough for "connected" 
status, but I didn't find a clear answer.
There is also a drm_link_status, but that looks to be mostly unused.
https://elixir.bootlin.com/linux/latest/source/include/drm/drm_connector.h#L331

So I think I will follow your suggestion, and remove the check for 
ASTDP_LINK_SUCCESS.


For the BMC connector patch, you know if there is a register setting I 
can check to see if a BMC is present or not ?

Best regards,

-- 

Jocelyn

> 
>> +
>>   int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata)
>>   {
>>       struct ast_device *ast = to_ast_device(dev);
>> diff --git a/drivers/gpu/drm/ast/ast_dp501.c 
>> b/drivers/gpu/drm/ast/ast_dp501.c
>> index a5d285850ffb..f10d53b0c94f 100644
>> --- a/drivers/gpu/drm/ast/ast_dp501.c
>> +++ b/drivers/gpu/drm/ast/ast_dp501.c
>> @@ -272,11 +272,9 @@ static bool ast_launch_m68k(struct drm_device *dev)
>>       return true;
>>   }
>> -bool ast_dp501_read_edid(struct drm_device *dev, u8 *ediddata)
>> +bool ast_dp501_is_connected(struct ast_device *ast)
>>   {
>> -    struct ast_device *ast = to_ast_device(dev);
>> -    u32 i, boot_address, offset, data;
>> -    u32 *pEDIDidx;
>> +    u32 boot_address, offset, data;
>>       if (ast->config_mode == ast_use_p2a) {
>>           boot_address = get_fw_base(ast);
>> @@ -292,14 +290,6 @@ bool ast_dp501_read_edid(struct drm_device *dev, 
>> u8 *ediddata)
>>           data = ast_mindwm(ast, boot_address + offset);
>>           if (!(data & AST_DP501_PNP_CONNECTED))
>>               return false;
>> -
>> -        /* Read EDID */
>> -        offset = AST_DP501_EDID_DATA;
>> -        for (i = 0; i < 128; i += 4) {
>> -            data = ast_mindwm(ast, boot_address + offset + i);
>> -            pEDIDidx = (u32 *)(ediddata + i);
>> -            *pEDIDidx = data;
>> -        }
>>       } else {
>>           if (!ast->dp501_fw_buf)
>>               return false;
>> @@ -319,7 +309,30 @@ bool ast_dp501_read_edid(struct drm_device *dev, 
>> u8 *ediddata)
>>           data = readl(ast->dp501_fw_buf + offset);
>>           if (!(data & AST_DP501_PNP_CONNECTED))
>>               return false;
>> +    }
>> +    return true;
>> +}
>> +
>> +bool ast_dp501_read_edid(struct drm_device *dev, u8 *ediddata)
>> +{
>> +    struct ast_device *ast = to_ast_device(dev);
>> +    u32 i, boot_address, offset, data;
>> +    u32 *pEDIDidx;
>> +
>> +    if (!ast_dp501_is_connected(ast))
>> +        return false;
>> +
>> +    if (ast->config_mode == ast_use_p2a) {
>> +        boot_address = get_fw_base(ast);
>> +        /* Read EDID */
>> +        offset = AST_DP501_EDID_DATA;
>> +        for (i = 0; i < 128; i += 4) {
>> +            data = ast_mindwm(ast, boot_address + offset + i);
>> +            pEDIDidx = (u32 *)(ediddata + i);
>> +            *pEDIDidx = data;
>> +        }
>> +    } else {
>>           /* Read EDID */
>>           offset = AST_DP501_EDID_DATA;
>>           for (i = 0; i < 128; i += 4) {
>> diff --git a/drivers/gpu/drm/ast/ast_drv.h 
>> b/drivers/gpu/drm/ast/ast_drv.h
>> index c9659e72002f..848a9f1403e8 100644
>> --- a/drivers/gpu/drm/ast/ast_drv.h
>> +++ b/drivers/gpu/drm/ast/ast_drv.h
>> @@ -514,6 +514,7 @@ void ast_patch_ahb_2500(struct ast_device *ast);
>>   /* ast dp501 */
>>   void ast_set_dp501_video_output(struct drm_device *dev, u8 mode);
>>   bool ast_backup_fw(struct drm_device *dev, u8 *addr, u32 size);
>> +bool ast_dp501_is_connected(struct ast_device *ast);
>>   bool ast_dp501_read_edid(struct drm_device *dev, u8 *ediddata);
>>   u8 ast_get_dp501_max_clk(struct drm_device *dev);
>>   void ast_init_3rdtx(struct drm_device *dev);
>> @@ -522,6 +523,7 @@ void ast_init_3rdtx(struct drm_device *dev);
>>   struct ast_i2c_chan *ast_i2c_create(struct drm_device *dev);
>>   /* aspeed DP */
>> +bool ast_astdp_is_connected(struct ast_device *ast);
>>   int ast_astdp_read_edid(struct drm_device *dev, u8 *ediddata);
>>   void ast_dp_launch(struct drm_device *dev);
>>   void ast_dp_power_on_off(struct drm_device *dev, bool no);
>> diff --git a/drivers/gpu/drm/ast/ast_mode.c 
>> b/drivers/gpu/drm/ast/ast_mode.c
>> index 1a8293162fec..e7f36ec73817 100644
>> --- a/drivers/gpu/drm/ast/ast_mode.c
>> +++ b/drivers/gpu/drm/ast/ast_mode.c
>> @@ -1582,8 +1582,21 @@ static int 
>> ast_dp501_connector_helper_get_modes(struct drm_connector *connector)
>>       return 0;
>>   }
>> +static int ast_dp501_connector_helper_detect_ctx(struct drm_connector 
>> *connector,
>> +                         struct drm_modeset_acquire_ctx *ctx,
>> +                         bool force)
>> +{
>> +    struct ast_device *ast = to_ast_device(connector->dev);
>> +
>> +    if (ast_dp501_is_connected(ast))
>> +        return connector_status_connected;
>> +    return connector_status_disconnected;
>> +}
>> +
>> +
>>   static const struct drm_connector_helper_funcs 
>> ast_dp501_connector_helper_funcs = {
>>       .get_modes = ast_dp501_connector_helper_get_modes,
>> +    .detect_ctx = ast_dp501_connector_helper_detect_ctx,
>>   };
>>   static const struct drm_connector_funcs ast_dp501_connector_funcs = {
>> @@ -1608,7 +1621,7 @@ static int ast_dp501_connector_init(struct 
>> drm_device *dev, struct drm_connector
>>       connector->interlace_allowed = 0;
>>       connector->doublescan_allowed = 0;
>> -    connector->polled = DRM_CONNECTOR_POLL_CONNECT;
>> +    connector->polled = DRM_CONNECTOR_POLL_CONNECT | 
>> DRM_CONNECTOR_POLL_DISCONNECT;
>>       return 0;
>>   }
>> @@ -1680,8 +1693,20 @@ static int 
>> ast_astdp_connector_helper_get_modes(struct drm_connector *connector)
>>       return 0;
>>   }
>> +static int ast_astdp_connector_helper_detect_ctx(struct drm_connector 
>> *connector,
>> +                         struct drm_modeset_acquire_ctx *ctx,
>> +                         bool force)
>> +{
>> +    struct ast_device *ast = to_ast_device(connector->dev);
>> +
>> +    if (ast_astdp_is_connected(ast))
>> +        return connector_status_connected;
>> +    return connector_status_disconnected;
>> +}
>> +
>>   static const struct drm_connector_helper_funcs 
>> ast_astdp_connector_helper_funcs = {
>>       .get_modes = ast_astdp_connector_helper_get_modes,
>> +    .detect_ctx = ast_astdp_connector_helper_detect_ctx,
>>   };
>>   static const struct drm_connector_funcs ast_astdp_connector_funcs = {
>> @@ -1706,7 +1731,7 @@ static int ast_astdp_connector_init(struct 
>> drm_device *dev, struct drm_connector
>>       connector->interlace_allowed = 0;
>>       connector->doublescan_allowed = 0;
>> -    connector->polled = DRM_CONNECTOR_POLL_CONNECT;
>> +    connector->polled = DRM_CONNECTOR_POLL_CONNECT | 
>> DRM_CONNECTOR_POLL_DISCONNECT;
>>       return 0;
>>   }
>> @@ -1903,5 +1928,7 @@ int ast_mode_config_init(struct ast_device *ast)
>>       drm_mode_config_reset(dev);
>> +    drm_kms_helper_poll_init(dev);
>> +
>>       return 0;
>>   }
> 

