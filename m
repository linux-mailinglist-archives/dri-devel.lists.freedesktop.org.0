Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C405F57F5
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 18:04:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C1A110E6BC;
	Wed,  5 Oct 2022 16:04:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39FAD10E6E8
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Oct 2022 16:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664985849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6VmuEPh0GKIRK6E1m3VF5nVWqHKHTtX99Nr9gjfAcjc=;
 b=VspYXMJmCCLekaXr3HXHiFyjVSXjXJMor+cJLc4RLQtWXVHe2c+HYJAvwN6qx0Jt1X1Vtt
 BZtwQnGr/njuR3xNf4jx229+p8ZdDXSvXlmWQpn1F8qdGM3kvvThIiCoyb9qW3cLD4xm9V
 R7fSt9wVLSQGBQ32zew0OKIha6krSgw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-515-SueAWi0-PIuCTp6823kLcw-1; Wed, 05 Oct 2022 12:04:00 -0400
X-MC-Unique: SueAWi0-PIuCTp6823kLcw-1
Received: by mail-wm1-f72.google.com with SMTP id
 7-20020a05600c020700b003b4ce6e6b12so561423wmi.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Oct 2022 09:04:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=6VmuEPh0GKIRK6E1m3VF5nVWqHKHTtX99Nr9gjfAcjc=;
 b=e4izOmNPdi/EXO8GWdwjIxKhZ96jJRF97fxAOXQ2E5LtSR6ceCPjpDQr8IMPBjvWk3
 ksSJzy/gy497ig73YCaC3rmsjDh1b0mfcqumNyFZS287hM1UazdV5k4KXc90HgRlTEOy
 jBmXrWz1ME9CJTia2K0KXasUBF7cUZyqCSZpdXpoGRrOYt3VxKrDO+lxN6crCADvhtK0
 3XxW5niW/pPU0L1WxTmaJ6VYZQioyEP5OooFw2ZxYXtxy1Bo+P86rQGMQec0oB1wSx2g
 YyKYpdC8Jb6MQ70om///Tg1jcCPdZhui2ZL5LGe83o6CefX9UL6LdLzsZ/qP1aCrz7mR
 DdqA==
X-Gm-Message-State: ACrzQf1ByY9q99yZFxmngiOAEhEjBqgCoYPeMb3z0qbvcldQp5wqvtF3
 qG1v6ZxkWaE1buUVpB80MSeLKYzt9a1/rV4/dImsE8ns3Fd6qYuH8RW2mTIsezo+Asi2ym8W61B
 qbBs8VOGppVZtQ9R2J/x6K/+nwjxF
X-Received: by 2002:adf:dbc3:0:b0:22a:d393:bd84 with SMTP id
 e3-20020adfdbc3000000b0022ad393bd84mr306728wrj.626.1664985839291; 
 Wed, 05 Oct 2022 09:03:59 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4ub+BWBZ9Bnr1wUlcgYmYfBzOPzm9jUvYXY24urJlTeq9Da+W040vVGlZxm/Nce6n0Lecszw==
X-Received: by 2002:adf:dbc3:0:b0:22a:d393:bd84 with SMTP id
 e3-20020adfdbc3000000b0022ad393bd84mr306700wrj.626.1664985838973; 
 Wed, 05 Oct 2022 09:03:58 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e?
 ([2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e])
 by smtp.gmail.com with ESMTPSA id
 t189-20020a1c46c6000000b003a5537bb2besm2462446wma.25.2022.10.05.09.03.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 Oct 2022 09:03:58 -0700 (PDT)
Message-ID: <86a1c1de-3cc9-b00e-ca35-23ccaa45a43d@redhat.com>
Date: Wed, 5 Oct 2022 18:03:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v4] drm/ast: Add Atomic gamma lut support for aspeed
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 airlied@redhat.com
References: <20220930094754.745626-1-jfalempe@redhat.com>
 <15147124-d074-8349-46ff-b6ea977a8265@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <15147124-d074-8349-46ff-b6ea977a8265@suse.de>
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

On 30/09/2022 12:45, Thomas Zimmermann wrote:
> Hi,
> 
> looks good to me. Let's wait until next week before landing the patch, 
> so that others can comment on it.

applied to drm-misc-next

Thanks,

-- 

Jocelyn

> 
> Best regards
> Thomas
> 
> Am 30.09.22 um 11:47 schrieb Jocelyn Falempe:
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
>> v4: revert 16bits mode, v1 was correct.
>>      make sure gamma table are set when primary plane format
>>      changes.
>>      remove rgb888 format that is not used.
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> Tested-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>   drivers/gpu/drm/ast/ast_mode.c | 87 +++++++++++++++++++++++++++-------
>>   1 file changed, 70 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ast/ast_mode.c 
>> b/drivers/gpu/drm/ast/ast_mode.c
>> index 214b10178454..89fcb8e3ea16 100644
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
>> @@ -63,20 +65,46 @@ static inline void ast_load_palette_index(struct 
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
>> +    case DRM_FORMAT_C8: /* In this case, gamma table is used as color 
>> palette */
>> +    case DRM_FORMAT_RGB565:
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
>> +    case DRM_FORMAT_C8: /* In this case, gamma table is used as color 
>> palette */
>> +    case DRM_FORMAT_RGB565:
>> +    case DRM_FORMAT_XRGB8888:
>> +        for (i = 0; i < AST_LUT_SIZE; i++)
>> +            ast_load_palette_index(ast, i,
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
>> @@ -1018,9 +1046,11 @@ static void ast_crtc_dpms(struct drm_crtc 
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
>> @@ -1109,6 +1139,8 @@ static int ast_crtc_helper_atomic_check(struct 
>> drm_crtc *crtc,
>>                       struct drm_atomic_state *state)
>>   {
>>       struct drm_crtc_state *crtc_state = 
>> drm_atomic_get_new_crtc_state(state, crtc);
>> +    struct drm_crtc_state *old_crtc_state = 
>> drm_atomic_get_old_crtc_state(state, crtc);
>> +    struct ast_crtc_state *old_ast_crtc_state = 
>> to_ast_crtc_state(old_crtc_state);
>>       struct drm_device *dev = crtc->dev;
>>       struct ast_crtc_state *ast_state;
>>       const struct drm_format_info *format;
>> @@ -1128,6 +1160,22 @@ static int ast_crtc_helper_atomic_check(struct 
>> drm_crtc *crtc,
>>       if (drm_WARN_ON_ONCE(dev, !format))
>>           return -EINVAL; /* BUG: We didn't set format in primary 
>> check(). */
>> +    /*
>> +     * The gamma LUT has to be reloaded after changing the primary
>> +     * plane's color format.
>> +     */
>> +    if (old_ast_crtc_state->format != format)
>> +        crtc_state->color_mgmt_changed = true;
>> +
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
>> @@ -1158,20 +1206,23 @@ ast_crtc_helper_atomic_flush(struct drm_crtc 
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
>> @@ -1309,7 +1360,9 @@ static int ast_crtc_init(struct drm_device *dev)
>>       if (ret)
>>           return ret;
>> -    drm_mode_crtc_set_gamma_size(crtc, 256);
>> +    drm_mode_crtc_set_gamma_size(crtc, AST_LUT_SIZE);
>> +    drm_crtc_enable_color_mgmt(crtc, 0, false, AST_LUT_SIZE);
>> +
>>       drm_crtc_helper_add(crtc, &ast_crtc_helper_funcs);
>>       return 0;
> 

