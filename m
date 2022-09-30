Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D4D5F06F6
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 10:57:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1CBE10EBFB;
	Fri, 30 Sep 2022 08:57:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E86110EC22
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 08:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664528217;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GksjdtrU1jhQOkiNjNn5vOagCvo5oz2/NnAeQkYRGtk=;
 b=ABn1qjCCfDYjhspnsLOoINCtUiw0LUajnfedJ5YYTxfgq5wtk2VQFcD1uwBRxndjzu1Pux
 AnbrKuRgx8SzO+6gDQxIyPwF3hZOHfxDpUXZNNBaZWiCQdjmz30zF0dhmiswd7Lei5GuzD
 XkO2t15yW4OVUFPXoJHjexigk30i5lw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-43-6SC1vaL9Orii80fdWxh4bQ-1; Fri, 30 Sep 2022 04:56:56 -0400
X-MC-Unique: 6SC1vaL9Orii80fdWxh4bQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 y20-20020a05600c365400b003b4d4ae666fso1098394wmq.4
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 01:56:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=GksjdtrU1jhQOkiNjNn5vOagCvo5oz2/NnAeQkYRGtk=;
 b=XAF3dV70kvgKQ17da5wsbsVowlWpZwTM13ME2p607S6Z80/12FBsnNHJgJuHr7Lc+f
 0c1NHApXmhQcXiyss8GBVGcdnBHtmmzuT357vy1PmC6Z+6sHhcDjirewsFWt1LlEnNZn
 rQTjkgDzqYJ7WoJAEzmuZRmKk7awETSTjxbehse0L2mUErUQ1uuzFmF5HUb1GJm4zMUW
 DRjkEZ41hSaGmt0xMNDLENkl5BLBIxxBNg/UGLwvM3vGrt5vWl2DW1gAzRkK+K9916Se
 B0WkgwD0fyQZQ9OJBISiY4tY7E3nRloZOtGpewIPKHYD+2Lw0trRE1CKSeioNvP7lCEM
 7CxQ==
X-Gm-Message-State: ACrzQf0X8/TFabVr6qvnXLriQcYvvn+HoI+XGPljPtJzmHZLKPiB16Z/
 zFzMfKKJkZdy5c4z+mfMHXh2y9geee0yeJr6A82Uqnp8nzdvH6HSa9tHsqStytvf7k1pd8T/JU2
 m+MzL5Bkud+6shL6mY25dsioXta+4
X-Received: by 2002:a05:6000:1561:b0:22a:72a1:e3f1 with SMTP id
 1-20020a056000156100b0022a72a1e3f1mr5231829wrz.456.1664528215093; 
 Fri, 30 Sep 2022 01:56:55 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM58ob7MDlrVtCYvDmnarCrIyBsLrovmWD/42m2fVShY222uUQh+xxyKJXRO2VQPC5cOY9siCw==
X-Received: by 2002:a05:6000:1561:b0:22a:72a1:e3f1 with SMTP id
 1-20020a056000156100b0022a72a1e3f1mr5231818wrz.456.1664528214805; 
 Fri, 30 Sep 2022 01:56:54 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:2ceb:e04a:af9c:bc9b?
 ([2a01:e0a:c:37e0:2ceb:e04a:af9c:bc9b])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a05600c484100b003a5bd5ea215sm1397861wmo.37.2022.09.30.01.56.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Sep 2022 01:56:54 -0700 (PDT)
Message-ID: <ea33519b-2008-ac68-a010-2668a42f9dd1@redhat.com>
Date: Fri, 30 Sep 2022 10:56:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v3] drm/ast: Add Atomic gamma lut support for aspeed
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 airlied@redhat.com
References: <20220930065444.689578-1-jfalempe@redhat.com>
 <d1bb1d75-b309-0174-b9c3-dfae3752699b@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <d1bb1d75-b309-0174-b9c3-dfae3752699b@suse.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30/09/2022 09:55, Thomas Zimmermann wrote:
> Hi,
> 
> I did more testing and you were correct in the original patch. Even in 
> 16-bit mode, the gamma LUT needs 256 entries per color. Apparently the 
> ast HW expands the RGB565 components into RGB888 internally before doing 
> the gamma lookup.
> 
> I added another review below. I'm sorry for the incorrect reply earlier.

No problem, without proper hardware to test, and good documentation, 
it's hard to guess right what the hardware will do at first attempt.

> 
> Am 30.09.22 um 08:54 schrieb Jocelyn Falempe:
>> The current ast driver only supports legacy gamma interface.
>> This also fixes a Gnome3/Wayland error which incorrectly adds
>> gamma to atomic commit:
>> "Page flip discarded: CRTC property (GAMMA_LUT) not found"
>>
>> I only tested remotely, so I wasn't able to check that it had
>> an effect on the VGA output. But when activating "Night Light"
>> in Gnome, ast_crtc_load_lut() is called.
>>
>> v2: use the same functions as mgag200.
>>      handle 16bits color mode.
>>
>> v3: Check gamma_lut size in atomic check.
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> Tested-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> Please keep my tags.
> 
>> ---
>>   drivers/gpu/drm/ast/ast_mode.c | 103 +++++++++++++++++++++++++++------
>>   1 file changed, 86 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ast/ast_mode.c 
>> b/drivers/gpu/drm/ast/ast_mode.c
>> index 214b10178454..874b356ce37a 100644
>> --- a/drivers/gpu/drm/ast/ast_mode.c
>> +++ b/drivers/gpu/drm/ast/ast_mode.c
>> @@ -49,6 +49,8 @@
>>   #include "ast_drv.h"
>>   #include "ast_tables.h"
>> +#define AST_LUT_SIZE 256
>> +
>>   static inline void ast_load_palette_index(struct ast_private *ast,
>>                        u8 index, u8 red, u8 green,
>>                        u8 blue)
>> @@ -63,20 +65,71 @@ static inline void ast_load_palette_index(struct 
>> ast_private *ast,
>>       ast_io_read8(ast, AST_IO_SEQ_PORT);
>>   }
>> -static void ast_crtc_load_lut(struct ast_private *ast, struct 
>> drm_crtc *crtc)
>> +static void ast_crtc_set_gamma_linear(struct ast_private *ast,
>> +                      const struct drm_format_info *format)
>>   {
>> -    u16 *r, *g, *b;
>>       int i;
>> -    if (!crtc->enabled)
>> -        return;
>> +    switch (format->format) {
>> +    case DRM_FORMAT_RGB565:
>> +        /* Use better interpolation, to take 32 values from 0 to 255 */
>> +        for (i = 0; i < AST_LUT_SIZE / 8; i++)
>> +            ast_load_palette_index(ast,
>> +                           i,
>> +                           i * 8 + i / 4,
>> +                           i * 4 + i / 16,
>> +                           i * 8 + i / 4);
>> +        /* Green has one more bit, so add padding with 0 for red and 
>> blue. */
>> +        for (i = AST_LUT_SIZE / 8; i < AST_LUT_SIZE / 4; i++)
>> +            ast_load_palette_index(ast, i, 0, i * 4 + i / 16, 0);
>> +        break;
> 
> This is the code that does not work with ast. I'd like to keep the 
> switch statement, so simply remove the code and let it fall through as 
> for the other cases.
done
> 
>> +    case DRM_FORMAT_C8: /* In this case, gamma table is used as color 
>> palette */
>> +    case DRM_FORMAT_RGB888:
> 
> RGBG888 can be removed. We never support this anywhere.

done
> 
>> +    case DRM_FORMAT_XRGB8888:
>> +        for (i = 0; i < AST_LUT_SIZE; i++)
>> +            ast_load_palette_index(ast, i, i, i, i);
>> +        break;
>> +    default:
>> +        drm_warn_once(&ast->base, "Unsupported format %p4cc for gamma 
>> correction\n",
>> +                  &format->format);
>> +        break;
>> +    }
>> +}
>> -    r = crtc->gamma_store;
>> -    g = r + crtc->gamma_size;
>> -    b = g + crtc->gamma_size;
>> +static void ast_crtc_set_gamma(struct ast_private *ast,
>> +                   const struct drm_format_info *format,
>> +                   struct drm_color_lut *lut)
>> +{
>> +    int i;
>> -    for (i = 0; i < 256; i++)
>> -        ast_load_palette_index(ast, i, *r++ >> 8, *g++ >> 8, *b++ >> 8);
>> +    switch (format->format) {
>> +    case DRM_FORMAT_RGB565:
>> +        /* Use better interpolation, to take 32 values from lut[0] to 
>> lut[255] */
>> +        for (i = 0; i < AST_LUT_SIZE / 8; i++)
>> +            ast_load_palette_index(ast,
>> +                           i,
>> +                           lut[i * 8 + i / 4].red >> 8,
>> +                           lut[i * 4 + i / 16].green >> 8,
>> +                           lut[i * 8 + i / 4].blue >> 8);
>> +        /* Green has one more bit, so add padding with 0 for red and 
>> blue. */
>> +        for (i = AST_LUT_SIZE / 8; i < AST_LUT_SIZE / 4; i++)
>> +            ast_load_palette_index(ast, i, 0, lut[i * 4 + i / 
>> 16].green >> 8, 0);
>> +        break;
> 
> Same as above.

done
> 
>> +    case DRM_FORMAT_C8: /* In this case, gamma table is used as color 
>> palette */
>> +    case DRM_FORMAT_RGB888:
> 
> Same as above.
> 
>> +    case DRM_FORMAT_XRGB8888:
>> +        for (i = 0; i < AST_LUT_SIZE; i++)
>> +            ast_load_palette_index(ast,
>> +                           i,
> 
> I think 'i' can go on the previous line after 'ast'.

done
> 
>> +                           lut[i].red >> 8,
>> +                           lut[i].green >> 8,
>> +                           lut[i].blue >> 8);
>> +        break;
>> +    default:
>> +        drm_warn_once(&ast->base, "Unsupported format %p4cc for gamma 
>> correction\n",
>> +                  &format->format);
>> +        break;
>> +    }
>>   }
>>   static bool ast_get_vbios_mode_info(const struct drm_format_info 
>> *format,
>> @@ -1018,9 +1071,11 @@ static void ast_crtc_dpms(struct drm_crtc 
>> *crtc, int mode)
>>               ast_set_color_reg(ast, format);
>>               ast_set_vbios_color_reg(ast, format, vbios_mode_info);
>> +            if (crtc->state->gamma_lut)
>> +                ast_crtc_set_gamma(ast, format, 
>> crtc->state->gamma_lut->data);
>> +            else
>> +                ast_crtc_set_gamma_linear(ast, format);
>>           }
>> -
>> -        ast_crtc_load_lut(ast, crtc);
>>           break;
>>       case DRM_MODE_DPMS_STANDBY:
>>       case DRM_MODE_DPMS_SUSPEND:
>> @@ -1128,6 +1183,15 @@ static int ast_crtc_helper_atomic_check(struct 
>> drm_crtc *crtc,
>>       if (drm_WARN_ON_ONCE(dev, !format))
>>           return -EINVAL; /* BUG: We didn't set format in primary 
>> check(). */
> 
> There should be a format test right here before testing 
> color_mgmt_changed. See my next comment below.
> 
>> +    if (crtc_state->color_mgmt_changed && crtc_state->gamma_lut) {
>> +        if (crtc_state->gamma_lut->length !=
>> +            AST_LUT_SIZE * sizeof(struct drm_color_lut)) {
>> +            drm_err(dev, "Wrong size for gamma_lut %zu\n",
>> +                crtc_state->gamma_lut->length);
>> +            return -EINVAL;
>> +        }
>> +    }
>> +
>>       succ = ast_get_vbios_mode_info(format, &crtc_state->mode,
>>                          &crtc_state->adjusted_mode,
>>                          &ast_state->vbios_mode_info);
>> @@ -1158,20 +1222,23 @@ ast_crtc_helper_atomic_flush(struct drm_crtc 
>> *crtc,
>>   {
>>       struct drm_crtc_state *crtc_state = 
>> drm_atomic_get_new_crtc_state(state,
>>                                         crtc);
>> -    struct drm_crtc_state *old_crtc_state = 
>> drm_atomic_get_old_crtc_state(state,
>> -                                          crtc);
>>       struct drm_device *dev = crtc->dev;
>>       struct ast_private *ast = to_ast_private(dev);
>>       struct ast_crtc_state *ast_crtc_state = 
>> to_ast_crtc_state(crtc_state);
>> -    struct ast_crtc_state *old_ast_crtc_state = 
>> to_ast_crtc_state(old_crtc_state);
>>       struct ast_vbios_mode_info *vbios_mode_info = 
>> &ast_crtc_state->vbios_mode_info;
>>       /*
>>        * The gamma LUT has to be reloaded after changing the primary
>>        * plane's color format.
>>        */
>> -    if (old_ast_crtc_state->format != ast_crtc_state->format)
>> -        ast_crtc_load_lut(ast, crtc);
> 
> After reading this chunk again, I'm not so sure that this test can be 
> removed easily. We once had a bug where colors got randomized after 
> setting display modes. It turned out that changing the plane's color 
> format invalidated the gamma LUT. Hence, we test this here and reload 
> the LUT if the format changed. Commit 8e3784dfef8a ("drm/ast: Reload 
> gamma LUT after changing primary plane's color format") if you're curious.
> 
> It's a bit odd to do this test in atomic_flush, but with the new color 
> MGMT we can improve this as well. The test and comment should be moved 
> into ast_crtc_helper_atomic_check() at the location I marked above. If 
> the format changes, simply set the color_mgmt_changed flag to trigger 
> reloading the LUT. Like this:
> 
>         /*
>          * The gamma LUT has to be reloaded after changing the primary
>          * plane's color format.
>          */
>      if (old_ast_crtc_state->format != ast_crtc_state->format)
>          crtc_state->color_mgmt_changed = true;
> 
> Your code in atomic_flush will then do the right thing.

ok, I've done this in v4.
I thought the color_mgmt_changed would cover this, but now in v4 it does.

Thanks a lot for the review and tests, I will send the v4 soon.

-- 

Jocelyn

> 
> Best regards
> Thomas
> 
>> +    if (crtc_state->enable && crtc_state->color_mgmt_changed) {
>> +        if (crtc_state->gamma_lut)
>> +            ast_crtc_set_gamma(ast,
>> +                       ast_crtc_state->format,
>> +                       crtc_state->gamma_lut->data);
>> +        else
>> +            ast_crtc_set_gamma_linear(ast, ast_crtc_state->format);
>> +    }
>>       //Set Aspeed Display-Port
>>       if (ast->tx_chip_types & AST_TX_ASTDP_BIT)
>> @@ -1309,7 +1376,9 @@ static int ast_crtc_init(struct drm_device *dev)
>>       if (ret)
>>           return ret;
>> -    drm_mode_crtc_set_gamma_size(crtc, 256);
>> +    drm_mode_crtc_set_gamma_size(crtc, AST_LUT_SIZE);
>> +    drm_crtc_enable_color_mgmt(crtc, 0, false, AST_LUT_SIZE);
>> +
>>       drm_crtc_helper_add(crtc, &ast_crtc_helper_funcs);
>>       return 0;
> 

