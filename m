Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A775F5A1185
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 15:09:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E92EE10E230;
	Thu, 25 Aug 2022 13:09:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AEA710E230
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 13:09:06 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id az27so4542515wrb.6
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 06:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=6fe3qO+g9J+l3GlHLyNAAJaJBk5cDlmle87a/iuxSEg=;
 b=HrYjJQHH4UNfHir+6sbLkd8xKcOuyL9rnFxbzSxD82Vo55TqgER5xIoQCQjLwM+mOM
 ozyno0lTMmEgfM0Gn+LWgzNiIDo9Frkp4xho0pLrq2L89a1SAyNY8HgwnttwGvQPvMgm
 gtewMPDUQDp0txBorhiBcFAPfenSj0K6UoJV9zudWZlTVslpt+v0LleOeJLz1nPxnRys
 AFe19H+UQZ4Q1Mj5ejD261sAGPMd5NIJvCMmdLKfX92tkJvTYg+zVGa5o+FbFtLOzqE6
 iRCDaFDtx4P/LGbWQUtWdSYKJhQi6HeacqvtwGTfxKI/gmAa5srG5NknZXgO4oSYgpPg
 M14Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=6fe3qO+g9J+l3GlHLyNAAJaJBk5cDlmle87a/iuxSEg=;
 b=seF3YNDklWX376+yJ8FQZaoGdEijDnEUXJwPsg4IEnAjVu9ohycUL+eNi94IUdzb4q
 CMyGSf56i6ZSvKC4JwhGV5AoqssdwtvE0pW31sITaTtgJhxXETbtiRwd9niFl4NaV1gC
 bz84PtOAmlv0bzPlyj9LSP+ogBXLfBbCUjqPlk29+7s+9+htzEblOFGBEBD9sebS9bGf
 T00MhA3u5onhNXTcmcP8rtPKcQXal462kjXMnytXIWqmaYC/3b7eBKmznLHD4hIMItGM
 T85Du/d1am39g2r7m87GrZIYHXWYgQFjRGfliopnLa0aMOTV2+6gDOgMBkDFSjrLEfsH
 edjw==
X-Gm-Message-State: ACgBeo3ViwA9W5m/0YWiqsb9tYD4ZkwKAbZ++sC2UByOqcqlELg6b4yB
 ZBDADplWZaix68G0IGWY1fcXJ8FjlFY=
X-Google-Smtp-Source: AA6agR7UBlXOM+WUEhxxVABpntMRNdTQcy0g5wbICDVhGOTHepjy5kESxjIou7bia/gOsg5yeG8yrw==
X-Received: by 2002:a05:6000:23c:b0:225:1a3a:2524 with SMTP id
 l28-20020a056000023c00b002251a3a2524mr2156101wrz.489.1661432944741; 
 Thu, 25 Aug 2022 06:09:04 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 b18-20020a5d6352000000b002252751629dsm19455364wrw.24.2022.08.25.06.09.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 06:09:03 -0700 (PDT)
Message-ID: <e60c979d-4d54-86a8-8981-9587b3f271a6@gmail.com>
Date: Thu, 25 Aug 2022 15:09:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH linux-next v2] drm/mediatek: Remove the unneeded result
Content-Language: en-US
To: cgel.zte@gmail.com
References: <20220825072335.228921-1-ye.xingchen@zte.com.cn>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220825072335.228921-1-ye.xingchen@zte.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: chunkuang.hu@kernel.org, airlied@linux.ie,
 ye xingchen <ye.xingchen@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 25/08/2022 09:23, cgel.zte@gmail.com wrote:
> From: ye xingchen <ye.xingchen@zte.com.cn>
> 
> Return the value drm_mode_config_helper_suspend() directly instead of
>   storing it in another redundant variable.
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>

I thought I already did this in v1, anyway here we go again:

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
> v1 -> v2
> Add all the mailinglists that get_maintainers.pl give.
>   drivers/gpu/drm/mediatek/mtk_drm_drv.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index 5f02f8d0e4fc..91f58db5915f 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -833,11 +833,8 @@ static int mtk_drm_sys_prepare(struct device *dev)
>   {
>   	struct mtk_drm_private *private = dev_get_drvdata(dev);
>   	struct drm_device *drm = private->drm;
> -	int ret;
> -
> -	ret = drm_mode_config_helper_suspend(drm);
>   
> -	return ret;
> +	return drm_mode_config_helper_suspend(drm);
>   }
>   
>   static void mtk_drm_sys_complete(struct device *dev)
