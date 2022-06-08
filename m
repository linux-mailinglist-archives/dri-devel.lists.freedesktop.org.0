Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF6B5427A3
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 09:41:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00B2B10ED47;
	Wed,  8 Jun 2022 07:41:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0931410ED47
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 07:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654674081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oSiZVSBm4/8vPhhFbWQ531zs5GylzxQlmBrVz2YPF7Y=;
 b=GDmk9DmlDLVNbMOmxuqiemFwc667Oj45Ht/9mjsA4bMYSmTzmO9Chc5omdjT0u2n/FkmK4
 NiSdlx6YwCruhsC2W8IcLp9zDOAi9U5cy6E7ehZvqVUaqZ6eOAzePmqNvuJZmofy2joPlC
 Vz3N33xdmIZZx1/1ACmJDtLsnihzqGQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-665-oGdx62ZBM7WPC9PrYDl5Kw-1; Wed, 08 Jun 2022 03:41:20 -0400
X-MC-Unique: oGdx62ZBM7WPC9PrYDl5Kw-1
Received: by mail-wm1-f69.google.com with SMTP id
 u12-20020a05600c19cc00b0038ec265155fso14038682wmq.6
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Jun 2022 00:41:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=oSiZVSBm4/8vPhhFbWQ531zs5GylzxQlmBrVz2YPF7Y=;
 b=EZy0ncZIn0tdgHGmUW/R0qekHixOamwkvgm4XsEUqtvnS+va5b9BmbS/9PCWHX1L7m
 uVxwspIFnKWxTwRlrQp9zE51IhbkrfJyj0OEer/ONycZFukoCNMvp0ZSAMBXQcZRZ0ip
 3Y66BkErn/BgYfQSpG9R+4+y3QU1BAEdaGoMoWffySglHvRYYRfi1weG4lPa5XU60U70
 CHwMraIs3AgJIYzWX8+nIjVPyBgGiYfyLXs1u+4/YCQwJyVcSQ9G/rMS04V0dWezMbpV
 qDsvwe+HdOjhAZgwaAmC2SZEl/ozMpTQdxLXtuuUJoWWYUA+fFdlR23lG2KXFxAMgKZr
 QXNw==
X-Gm-Message-State: AOAM533nSAQPj9kfv1vVjIYi7QNgE3oQKrezPQuHbJP/cgsX1r+pS64l
 cQbFm/QEPaiK2swfsYA7iH+TOXyQ2ssKkWqSaFAAJ3cMICFNXjQ2+2PQCRxv0AT7co4bTtPWdNV
 1oYdbtpp4rv5VA1zPc7sOCHUMkp94
X-Received: by 2002:a5d:4811:0:b0:213:bab0:64f3 with SMTP id
 l17-20020a5d4811000000b00213bab064f3mr28052425wrq.499.1654674078439; 
 Wed, 08 Jun 2022 00:41:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx832q/pWOjPR0IlTzGmSuu3ZA2zubgpH7Hx1usrp95CyJYmlqsOXJ0aoiWY5plqj0LXKYqWA==
X-Received: by 2002:a5d:4811:0:b0:213:bab0:64f3 with SMTP id
 l17-20020a5d4811000000b00213bab064f3mr28052402wrq.499.1654674078244; 
 Wed, 08 Jun 2022 00:41:18 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:f4b2:2105:b039:7367?
 ([2a01:e0a:c:37e0:f4b2:2105:b039:7367])
 by smtp.gmail.com with ESMTPSA id
 h13-20020a05600c2cad00b00397623ff335sm25134006wmc.10.2022.06.08.00.41.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jun 2022 00:41:17 -0700 (PDT)
Message-ID: <2c26c0c9-7a5e-4ffa-95cf-42c6bc6ae88d@redhat.com>
Date: Wed, 8 Jun 2022 09:41:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] drm/ast: Treat AST2600 like AST2500 in most places
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 airlied@linux.ie, daniel@ffwll.ch, regressions@leemhuis.info,
 kuohsiang_chou@aspeedtech.com
References: <20220607120248.31716-1-tzimmermann@suse.de>
 <3528fa40-987f-2467-35a5-93397d968ee8@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <3528fa40-987f-2467-35a5-93397d968ee8@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jfalempe@redhat.com
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
Cc: stable@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/06/2022 14:07, Thomas Zimmermann wrote:
> Jocelyn, do you have a way of getting this patch tested?

Thanks for sending this patch.
I'm sorry I'm not able to test it directly.
It's a bit complex to try an upstream kernel on the machine we found the 
regression, I will do my best to get it tested, but no promise.

Also be careful when backporting to stable kernel, as the patch may 
apply, but some other "if (AST2500)" logic might be missing the AST2600 
check.

> 
> Am 07.06.22 um 14:02 schrieb Thomas Zimmermann:
>> Include AST2600 in most of the branches for AST2500. Thereby revert
>> most effects of commit f9bd00e0ea9d ("drm/ast: Create chip AST2600").
>>
>> The AST2600 used to be treated like an AST2500, which at least gave
>> usable display output. After introducing AST2600 in the driver without
>> further updates, lots of functions take the wrong branches.
>>
>> Handling AST2600 in the AST2500 branches reverts back to the original
>> settings. The exception are cases where AST2600 meanwhile got its own
>> branch.
>>
>> Reported-by: Jocelyn Falempe <jfalempe@redhat.com>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Suggested-by: Jocelyn Falempe <jfalempe@redhat.com>
>> Fixes: f9bd00e0ea9d ("drm/ast: Create chip AST2600")
>> Cc: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>
>> Cc: Dave Airlie <airlied@redhat.com>
>> Cc: dri-devel@lists.freedesktop.org
>> Cc: <stable@vger.kernel.org> # v5.11+
>> ---
>>   drivers/gpu/drm/ast/ast_main.c | 4 ++--
>>   drivers/gpu/drm/ast/ast_mode.c | 6 +++---
>>   drivers/gpu/drm/ast/ast_post.c | 6 +++---
>>   3 files changed, 8 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ast/ast_main.c 
>> b/drivers/gpu/drm/ast/ast_main.c
>> index d770d5a23c1a..56b2ac138375 100644
>> --- a/drivers/gpu/drm/ast/ast_main.c
>> +++ b/drivers/gpu/drm/ast/ast_main.c
>> @@ -307,7 +307,7 @@ static int ast_get_dram_info(struct drm_device *dev)
>>       default:
>>           ast->dram_bus_width = 16;
>>           ast->dram_type = AST_DRAM_1Gx16;
>> -        if (ast->chip == AST2500)
>> +        if ((ast->chip == AST2500) || (ast->chip == AST2600))
>>               ast->mclk = 800;
>>           else
>>               ast->mclk = 396;
>> @@ -319,7 +319,7 @@ static int ast_get_dram_info(struct drm_device *dev)
>>       else
>>           ast->dram_bus_width = 32;
>> -    if (ast->chip == AST2500) {
>> +    if ((ast->chip == AST2600) || (ast->chip == AST2500)) {
>>           switch (mcr_cfg & 0x03) {
>>           case 0:
>>               ast->dram_type = AST_DRAM_1Gx16;
>> diff --git a/drivers/gpu/drm/ast/ast_mode.c 
>> b/drivers/gpu/drm/ast/ast_mode.c
>> index 323af2746aa9..1dde30b98317 100644
>> --- a/drivers/gpu/drm/ast/ast_mode.c
>> +++ b/drivers/gpu/drm/ast/ast_mode.c
>> @@ -310,7 +310,7 @@ static void ast_set_crtc_reg(struct ast_private *ast,
>>       u8 jreg05 = 0, jreg07 = 0, jreg09 = 0, jregAC = 0, jregAD = 0, 
>> jregAE = 0;
>>       u16 temp, precache = 0;
>> -    if ((ast->chip == AST2500) &&
>> +    if (((ast->chip == AST2600) || (ast->chip == AST2500)) &&
>>           (vbios_mode->enh_table->flags & AST2500PreCatchCRT))
>>           precache = 40;
>> @@ -428,7 +428,7 @@ static void ast_set_dclk_reg(struct ast_private *ast,
>>   {
>>       const struct ast_vbios_dclk_info *clk_info;
>> -    if (ast->chip == AST2500)
>> +    if ((ast->chip == AST2600) || (ast->chip == AST2500))
>>           clk_info = 
>> &dclk_table_ast2500[vbios_mode->enh_table->dclk_index];
>>       else
>>           clk_info = &dclk_table[vbios_mode->enh_table->dclk_index];
>> @@ -476,7 +476,7 @@ static void ast_set_crtthd_reg(struct ast_private 
>> *ast)
>>           ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xa7, 0xe0);
>>           ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xa6, 0xa0);
>>       } else if (ast->chip == AST2300 || ast->chip == AST2400 ||
>> -        ast->chip == AST2500) {
>> +           ast->chip == AST2500 || ast->chip == AST2600) {
>>           ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xa7, 0x78);
>>           ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xa6, 0x60);
>>       } else if (ast->chip == AST2100 ||
>> diff --git a/drivers/gpu/drm/ast/ast_post.c 
>> b/drivers/gpu/drm/ast/ast_post.c
>> index 0aa9cf0fb5c3..eb1ff9084034 100644
>> --- a/drivers/gpu/drm/ast/ast_post.c
>> +++ b/drivers/gpu/drm/ast/ast_post.c
>> @@ -80,7 +80,7 @@ ast_set_def_ext_reg(struct drm_device *dev)
>>           ast_set_index_reg(ast, AST_IO_CRTC_PORT, i, 0x00);
>>       if (ast->chip == AST2300 || ast->chip == AST2400 ||
>> -        ast->chip == AST2500) {
>> +        ast->chip == AST2500 || ast->chip == AST2600) {
>>           if (pdev->revision >= 0x20)
>>               ext_reg_info = extreginfo_ast2300;
>>           else
>> @@ -105,7 +105,7 @@ ast_set_def_ext_reg(struct drm_device *dev)
>>       /* Enable RAMDAC for A1 */
>>       reg = 0x04;
>>       if (ast->chip == AST2300 || ast->chip == AST2400 ||
>> -        ast->chip == AST2500)
>> +        ast->chip == AST2500 || ast->chip == AST2600)
>>           reg |= 0x20;
>>       ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xb6, 0xff, reg);
>>   }
>> @@ -382,7 +382,7 @@ void ast_post_gpu(struct drm_device *dev)
>>       if (ast->chip == AST2600) {
>>           ast_dp_launch(dev, 1);
>>       } else if (ast->config_mode == ast_use_p2a) {
>> -        if (ast->chip == AST2500)
>> +        if (ast->chip == AST2500 || ast->chip == AST2600)
>>               ast_post_chip_2500(dev);
>>           else if (ast->chip == AST2300 || ast->chip == AST2400)
>>               ast_post_chip_2300(dev);
> 

