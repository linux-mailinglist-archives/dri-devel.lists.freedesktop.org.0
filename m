Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E507300AE
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 15:52:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10B1810E45E;
	Wed, 14 Jun 2023 13:52:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41CA810E45E
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 13:52:18 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f8d2bfed53so5565525e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jun 2023 06:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686750735; x=1689342735;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=W0fu98Ha3dS0F+1gjLTBslJB/GpPh3RNUsn49eo1+eM=;
 b=bluMl73rsCcGovrghDB4Whh9ahTWXCAzDok//Q9saMH2bqGqx+4KnuT+RXX6tewVld
 YGyj4ruHl770KQopEdPYNReTTf1liRzMZNLuO+K5YFIOt6AhJV+CeWERHzAGAkg3DFMt
 ngLc8oyu8vkGd6GzXOwhxiVPzCSR0Ency0G3cH4Ev3FKJprLHscq6g2HluAxmN2+Hp4U
 a0RnGvXqhK5U+kOXrkjWTCL4yQRYx+E5Hp1r9vyNYkN0Bn2LuULdIncrXS4RwMfuYT2r
 00YFs2wCUJjzhwchUW9mEpIdabCwzitA7NFTYScLJkWOg/PmJfeUaht6+3ur8O4TgGSL
 QYVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686750735; x=1689342735;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=W0fu98Ha3dS0F+1gjLTBslJB/GpPh3RNUsn49eo1+eM=;
 b=Fh/kbriuoX8nVnTr6/DguHKHBVvbJYxfADzzrxr3+qp2izIDslxS6sgUw5cc3jmkbQ
 A731UifW6XDgo0Sa7Zb0r4ioNmiCVw35u53yHCuotX3KbtK1YrTBeniF1FWouxh25stu
 Z84qJRVkb6aqtPu62sQTkfu29jEwXw7LV1L0SHIz0OAXsNGa0Qq8XfLAVr2tDrGeqEYW
 AAcadVGYd006a/PN1XdEpOx0S+rqIh+AUqAsEgGH1nylvPTYtl7RtsDuY4sjzsxT1xw8
 AszQMrzn4XcShNoqkmrYjfBssjn/5paia2YkzbjoLGG3VdQvebteXWVBtNEFJPRf8mo6
 U6iA==
X-Gm-Message-State: AC+VfDx+5iUNcgrE+FM5cPW+pt8e/8VTWVuYJqecH1eubTQwuPU/z72P
 fA0hRm5PTxUELOpGS6We3Xg=
X-Google-Smtp-Source: ACHHUZ48nHgzWV0fJ1dhj5/MZinR9tDZd3rxdnvVWwB8QdA1VEMftevD1cKlAr5w9LNm72p1rGhHzg==
X-Received: by 2002:a7b:cb04:0:b0:3f7:ecdf:ab2d with SMTP id
 u4-20020a7bcb04000000b003f7ecdfab2dmr1443114wmj.20.1686750734702; 
 Wed, 14 Jun 2023 06:52:14 -0700 (PDT)
Received: from ?IPV6:2a00:e180:15e4:4200:3c54:f73b:1892:7271?
 ([2a00:e180:15e4:4200:3c54:f73b:1892:7271])
 by smtp.gmail.com with ESMTPSA id
 f5-20020adff585000000b0030796e103a1sm18449602wro.5.2023.06.14.06.52.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jun 2023 06:52:14 -0700 (PDT)
Message-ID: <c52e29a7-95c4-5a3d-4564-a3554a6de5d3@gmail.com>
Date: Wed, 14 Jun 2023 15:52:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] fbdev: Use /* */ comment in initializer macro
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, sam@ravnborg.org, deller@gmx.de
References: <20230614131253.10208-1-tzimmermann@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20230614131253.10208-1-tzimmermann@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 14.06.23 um 15:12 schrieb Thomas Zimmermann:
> Use /* */ in initializer macro to avoid out-commenting the comma
> at the end of the line.
>
> Reported-by: Christian König <ckoenig.leichtzumerken@gmail.com>
> Closes: https://lore.kernel.org/dri-devel/20230530150253.22758-1-tzimmermann@suse.de/T/#m356cda2679c17d7a01f30ce2b5282cd9046ea6d4
> Fixes: f1061fa641b8 ("fbdev: Add initializer macros for struct fb_ops")
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Helge Deller <deller@gmx.de>
> Cc: linux-fbdev@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   include/linux/fb.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/include/linux/fb.h b/include/linux/fb.h
> index ce6823e157e6b..ce7d588edc3e6 100644
> --- a/include/linux/fb.h
> +++ b/include/linux/fb.h
> @@ -552,7 +552,7 @@ extern ssize_t fb_io_write(struct fb_info *info, const char __user *buf,
>   	.fb_imageblit	= cfb_imageblit
>   
>   #define __FB_DEFAULT_IO_OPS_MMAP \
> -	.fb_mmap	= NULL // default implementation
> +	.fb_mmap	= NULL /* default implementation */
>   
>   #define FB_DEFAULT_IO_OPS \
>   	__FB_DEFAULT_IO_OPS_RDWR, \
> @@ -585,7 +585,7 @@ extern ssize_t fb_sys_write(struct fb_info *info, const char __user *buf,
>   	.fb_imageblit	= sys_imageblit
>   
>   #define __FB_DEFAULT_SYS_OPS_MMAP \
> -	.fb_mmap	= NULL // default implementation
> +	.fb_mmap	= NULL /* default implementation */
>   
>   #define FB_DEFAULT_SYS_OPS \
>   	__FB_DEFAULT_SYS_OPS_RDWR, \

