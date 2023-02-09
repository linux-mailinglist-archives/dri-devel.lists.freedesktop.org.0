Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EC96903B1
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 10:30:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4AF710E0E5;
	Thu,  9 Feb 2023 09:29:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84E6B10E0E5
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 09:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675934997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RBuQ1Ymu8MLIzmLUuJsbngz5BvvOGIdZhrg0TKtvUxk=;
 b=CoHUDxmG5Q9zAzAXWXLRse/9Z4u7VnRv9RaTkk0Geqz0+N0lUmdIewYL4e9lB4H+JEkO8d
 9+SPe6P4qGavAlygrAdT+6uaW9bI7jx/7ZoHFis5HrY/xmffmXiKmq1VscP0uxkhy5MCnz
 LwnePiYfhb/pFSkE2XHwxGI+ao1hWtU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-562-2ZdHNlW0MkaDoBnt4Z3jaA-1; Thu, 09 Feb 2023 04:29:56 -0500
X-MC-Unique: 2ZdHNlW0MkaDoBnt4Z3jaA-1
Received: by mail-wm1-f69.google.com with SMTP id
 n7-20020a05600c3b8700b003dc55dcb298so735754wms.8
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Feb 2023 01:29:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RBuQ1Ymu8MLIzmLUuJsbngz5BvvOGIdZhrg0TKtvUxk=;
 b=e0WNE/XiYijM0AhOHB+pGsQtAZoHBLUV0VagoO4uTGH3YHBz3AwDAzw7EtEOJU1bVh
 VzWZ/GbtdYzwHXNIj6rmzang9fFaJbm2hnCSoXtqnPanCPHzjeqZbyr/zoilUBMQ+SeP
 z/48mkea6KXG+7nQ20zKx3AYzuQzbUpv5sgXf3iHyWF6ApFsrtR1z79ILnBScwM+Y5oY
 2R0u9IJXTtrEKAE2dDFwsboKlpHbCAhr7JDnImC54GlH/QLeVHbgo+WtW+HE95AmyRZ8
 /tqbAdM0SGkWKnjdkqZtldfsciigR4MTYkjbBoyMEbYyj0xwtRArthy9rS02bGpFHHVg
 pi/Q==
X-Gm-Message-State: AO0yUKWwkR7o7qxntTE1SlCe5Nd0DTWhaKzaYBwEt9COE386VqaDoh8T
 86HNl1HDP3Rk3znmiym1JMRdFArGU+BBcUmAZUs/14QiLwxeflBhWxsSaG0iFtIcHqTxXRayOLU
 s3U17Htwtv4rOd8Tj0tsPPrkl7nAh
X-Received: by 2002:adf:dcd2:0:b0:2c3:db61:20ec with SMTP id
 x18-20020adfdcd2000000b002c3db6120ecmr10112606wrm.23.1675934995013; 
 Thu, 09 Feb 2023 01:29:55 -0800 (PST)
X-Google-Smtp-Source: AK7set9Vx9cgZaY6j2unX+DHhufgGi08RXZ59ONfHUVXsBpZGWwE9umoPSY8LydSSLmdMzAMFqp/Dg==
X-Received: by 2002:adf:dcd2:0:b0:2c3:db61:20ec with SMTP id
 x18-20020adfdcd2000000b002c3db6120ecmr10112596wrm.23.1675934994826; 
 Thu, 09 Feb 2023 01:29:54 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e?
 ([2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e])
 by smtp.gmail.com with ESMTPSA id
 f14-20020adfe90e000000b002c408c96f3fsm789233wrm.84.2023.02.09.01.29.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Feb 2023 01:29:54 -0800 (PST)
Message-ID: <2df349f5-f5e2-e16b-b077-91800b440723@redhat.com>
Date: Thu, 9 Feb 2023 10:29:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2] drm/ast: Fix start address computation
To: Jammy Huang <jammy_huang@aspeedtech.com>,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de, airlied@redhat.com,
 kuohsiang_chou@aspeedtech.com
References: <20230209091254.15455-1-jfalempe@redhat.com>
 <65c4af68-3808-4021-ae4f-d0c07c908431@aspeedtech.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <65c4af68-3808-4021-ae4f-d0c07c908431@aspeedtech.com>
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

On 09/02/2023 10:22, Jammy Huang wrote:
> Hello,
> 
> The offset given to ast_set_start_address_crt1() should be offset in 
> vram. It should 0 now as your patch.
> 
> I think it is better to correct it in ast_primary_plane_init() and 
> ast_cursor_plane_init() as below.

ok, thanks for the review, I will send a v3 with this suggestion.

-- 

Jocelyn

> 
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -714,7 +714,7 @@ static int ast_primary_plane_init(struct ast_private 
> *ast)
>          struct ast_plane *ast_primary_plane = &ast->primary_plane;
>          struct drm_plane *primary_plane = &ast_primary_plane->base;
>          void __iomem *vaddr = ast->vram;
> -       u64 offset = ast->vram_base;
> +       u64 offset = 0;
>          unsigned long cursor_size = roundup(AST_HWC_SIZE + 
> AST_HWC_SIGNATURE_SIZE, PAGE_SIZE);
>          unsigned long size = ast->vram_fb_available - cursor_size;
>          int ret;
> @@ -972,7 +972,7 @@ static int ast_cursor_plane_init(struct ast_private 
> *ast)
>                  return -ENOMEM;
> 
>          vaddr = ast->vram + ast->vram_fb_available - size;
> -       offset = ast->vram_base + ast->vram_fb_available - size;
> +       offset = st->vram_fb_available - size;
> 
> On 2023/2/9 下午 05:12, Jocelyn Falempe wrote:
>> During the driver conversion to shmem, the start address for the
>> scanout buffer was set to the base PCI address.
>> In most cases it works because only the lower 24bits are used, and
>> due to alignment it was almost always 0.
>> But on some unlucky hardware, it's not the case, and some unitilized
>> memory is displayed on the BMC.
>> With shmem, the primary plane is always at offset 0 in GPU memory.
>>
>> Tested on a sr645 affected by this bug.
>>
>> Fixes: f2fa5a99ca81 ("drm/ast: Convert ast to SHMEM")
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>   drivers/gpu/drm/ast/ast_mode.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/ast/ast_mode.c 
>> b/drivers/gpu/drm/ast/ast_mode.c
>> index c7443317c747..54deb29bfeb3 100644
>> --- a/drivers/gpu/drm/ast/ast_mode.c
>> +++ b/drivers/gpu/drm/ast/ast_mode.c
>> @@ -681,7 +681,8 @@ static void 
>> ast_primary_plane_helper_atomic_update(struct drm_plane *plane,
>>       if (!old_fb || old_fb->pitches[0] != fb->pitches[0])
>>           ast_set_offset_reg(ast, fb);
>>       if (!old_fb) {
>> -        ast_set_start_address_crt1(ast, (u32)ast_plane->offset);
>> +        /* with shmem, the primary plane is always at offset 0 */
>> +        ast_set_start_address_crt1(ast, 0);
>>           ast_set_index_reg_mask(ast, AST_IO_SEQ_PORT, 0x1, 0xdf, 0x00);
>>       }
>>   }
> 

