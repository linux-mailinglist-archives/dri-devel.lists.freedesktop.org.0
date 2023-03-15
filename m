Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 187846BB7A1
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 16:25:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 259E310E8FC;
	Wed, 15 Mar 2023 15:25:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F10FD10E8FC
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 15:25:23 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id bi20so2918281wmb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Mar 2023 08:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678893922;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ALJqtJ6/YqWNslEjg+dyRnX0ot8Ob+UnfDQnpMdHhDU=;
 b=nvyYslfEjgUNwnHMRhQUSYLCdmOV9hPMr4Z7nIE2spmPBexE1TOHtvlAuiz+VrJH+H
 VM0K4lx1tF+/sjekIVlLne6C9H9bImBgE2qh0HkklrpDg8KCd2FrLaEFk85bQ6DYcP/D
 7/YqRLRVag2cUl2lqt5eL6z6gQz0t52o3SL6HK+4qhWrUQrbPoLojPXnWMiD8JaLYc+L
 NpyPJuetO7orwAu8Gnt0Ie0tTB7MBQQUM3ng4kMH1+pBbcw1SNBFe/s7qoNvAdPLFT50
 se/O3bIAGJH2+PBTFngyCm89sH6ffHmzLxeB7FWKYb3o61Y6hv2h3gvVQjfZvVdpN4gL
 qKFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678893922;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ALJqtJ6/YqWNslEjg+dyRnX0ot8Ob+UnfDQnpMdHhDU=;
 b=UeiWll/6mNVKZ6P38R5hmWc0g/zpAaICL228tH7PSxEVNMZTlfw9hB00ui2qffEFZm
 9iMFCP+W2BYI1h+OBgoSok4PPPC3NKZC/DdvNo81G+HLtOlqNuXQCr70Np5ttqPr/vhQ
 F54EhEEKqosO+7lTvTJqXNABDcy9H19Epv0cv83pe2MoMSHqethFoPcy+XBUVpPh79T3
 UpT7NPfNyZ5W5HohAwnfsqxQXZOINkCou9WCVWx051b5ESWjdU9bM9yPTbuR1WywiFv7
 gDm5MfoXzvDADoghn/ikzEl+h71VAq9ICnw0/VdTY3P9Ra4StsDJQgcnVcoUd7+n0sHH
 v/Cw==
X-Gm-Message-State: AO0yUKXaDIzDQHf2wNiKoIbFKHRsWFoSLHvQg3JFWq+1vaq/A7vCemwh
 cL/aceZ0WjYMGPtGI3AHL9ng06zhIew=
X-Google-Smtp-Source: AK7set/j7sL+ywYFzhBtVvXuXpyDFMOaEjDVUapFkUTMJ3kZXLXflb1Kq+3UkzP2r1koaUWmL/crqw==
X-Received: by 2002:a05:600c:34c1:b0:3eb:383c:1876 with SMTP id
 d1-20020a05600c34c100b003eb383c1876mr18266670wmq.6.1678893922376; 
 Wed, 15 Mar 2023 08:25:22 -0700 (PDT)
Received: from [192.168.2.181] (46-10-148-90.ip.btc-net.bg. [46.10.148.90])
 by smtp.gmail.com with ESMTPSA id
 s20-20020a7bc394000000b003ed2433aa4asm2083286wmj.41.2023.03.15.08.25.21
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Mar 2023 08:25:21 -0700 (PDT)
Message-ID: <98e9cc9a-6986-4425-3906-03dce337a0df@gmail.com>
Date: Wed, 15 Mar 2023 17:25:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] drm/vmwgfx: Fix src/dst_pitch confusion
To: dri-devel@lists.freedesktop.org
References: <20230314211445.1363828-1-zack@kde.org>
Content-Language: en-US
From: "Martin Krastev (VMware)" <martinkrastev768@gmail.com>
In-Reply-To: <20230314211445.1363828-1-zack@kde.org>
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

From: Martin Krastev <krastevm@vmware.com>

We reviewers botched that one.

Reviewed-by: Martin Krastev <krastevm@vmware.com>


Regards,

Martin


On 14.03.23 г. 23:14 ч., Zack Rusin wrote:
> From: Zack Rusin <zackr@vmware.com>
>
> The src/dst_pitch got mixed up during the rework of the function, make
> sure the offset's refer to the correct one.
>
> Spotted by clang:
> Clang warns (or errors with CONFIG_WERROR):
>
>    drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c:509:29: error: variable 'dst_pitch' is uninitialized when used here [-Werror,-Wuninitialized]
>            src_offset = ddirty->top * dst_pitch + ddirty->left * stdu->cpp;
>                                       ^~~~~~~~~
>    drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c:492:26: note: initialize the variable 'dst_pitch' to silence this warning
>            s32 src_pitch, dst_pitch;
>                                    ^
>                                     = 0
>    1 error generated.
>
> Signed-off-by: Zack Rusin <zackr@vmware.com>
> Link: https://github.com/ClangBuiltLinux/linux/issues/1811
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Reported-by: Dave Airlie <airlied@gmail.com>
> Fixes: 39985eea5a6d ("drm/vmwgfx: Abstract placement selection")
> ---
>   drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
> index d79a6eccfaa4..ba0c0e12cfe9 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
> @@ -506,11 +506,11 @@ static void vmw_stdu_bo_cpu_commit(struct vmw_kms_dirty *dirty)
>   	/* Assume we are blitting from Guest (bo) to Host (display_srf) */
>   	src_pitch = stdu->display_srf->metadata.base_size.width * stdu->cpp;
>   	src_bo = &stdu->display_srf->res.guest_memory_bo->tbo;
> -	src_offset = ddirty->top * dst_pitch + ddirty->left * stdu->cpp;
> +	src_offset = ddirty->top * src_pitch + ddirty->left * stdu->cpp;
>   
>   	dst_pitch = ddirty->pitch;
>   	dst_bo = &ddirty->buf->tbo;
> -	dst_offset = ddirty->fb_top * src_pitch + ddirty->fb_left * stdu->cpp;
> +	dst_offset = ddirty->fb_top * dst_pitch + ddirty->fb_left * stdu->cpp;
>   
>   	(void) vmw_bo_cpu_blit(dst_bo, dst_offset, dst_pitch,
>   			       src_bo, src_offset, src_pitch,
