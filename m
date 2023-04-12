Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E33066DF2E0
	for <lists+dri-devel@lfdr.de>; Wed, 12 Apr 2023 13:15:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E10C10E378;
	Wed, 12 Apr 2023 11:15:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D430110E770
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 11:15:46 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id s8so6325128wmo.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Apr 2023 04:15:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681298145; x=1683890145;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2rRQAYMFQzZ3Z7KU85vDtMZHZSEIGe7IfC6ZvEKTDDQ=;
 b=EQHdnlfwi6nu6QIdLm9Of177q7xeJMgzzi2XQTTToYNjRE61oBqIsDDc0f6ua4qPQ9
 d2gfkkj5fpvOCltBjgHMZzUqRzZJaisNpPyhrHizb7babWJ4LjkuDupe9ckgBaU1Lx1I
 viwMZlC4sTLSSspiNlV/9UiUEwR8lIrvk1YPGWC4XfHWFJXnAR+p4fvt4L8KdC61S3PQ
 CBtF8d8k9drEMxrupXil3qiRyBXXoeq7LJd3B9pXAz8rlxlryF/MNHcSmQyYVRXTYYkD
 0b64WM7qR5s5NleSvhi82dwa34INs+ZfUYsbMBdVGMnXW/LDEAEOiF7oHErYgTjOjnc8
 BXzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681298145; x=1683890145;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=2rRQAYMFQzZ3Z7KU85vDtMZHZSEIGe7IfC6ZvEKTDDQ=;
 b=TmrNaP/EFDNNQwoeInTdzVKQ2WCxxSdIU80ukD6FrAc4Qjadsf7wXGl81VGNZctFs/
 /yKbc/pwjeQVysK890h4Yi7srNDL+4cA99HYeHxqoZhnInSVcndYQiKVRHv5rSfJK8nw
 KIlXL1mHLg7AliEA8zZ2lbcLt5i/nJEmmVf4Bk/ch+ocbcQwMmD+vEZoZeC0L2fZAsMC
 OkyIE3MRTxXhN2L0fQnFoastAvUzjHa2mFKt+ZhLFSUA7nDuwwlH9eRvc7bEf3SzD49o
 ygqjNdMO+6wW8QWuk0LJiJlf4MnbSjFUO7/aR9NjDU7KXNi/pN6sLbMoEt6wTK08eNhL
 QchA==
X-Gm-Message-State: AAQBX9cNQzJ/H9NrBpylGTTfMDNy/mMwHmhxv7A+DBIAKmFJjckMuQIW
 U/wdQBu/m4vN/lOFPDjxuwU=
X-Google-Smtp-Source: AKy350Zm+JQ20RDs5iEIf8/taJMLA27MPvWDySrC8rMlHOZefSmm0Xk3pKeERGIKs4WI+rc0K+uqoA==
X-Received: by 2002:a1c:f716:0:b0:3ef:4138:9eef with SMTP id
 v22-20020a1cf716000000b003ef41389eefmr12903970wmh.36.1681298144771; 
 Wed, 12 Apr 2023 04:15:44 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 k21-20020a05600c1c9500b003ee74c25f12sm2046961wms.35.2023.04.12.04.15.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Apr 2023 04:15:43 -0700 (PDT)
Message-ID: <8d369520-bc2c-e269-aef8-61896adfcd4c@gmail.com>
Date: Wed, 12 Apr 2023 13:15:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH -next 2/3] drm/mediatek: Use
 devm_platform_ioremap_resource()
Content-Language: en-US
To: Yang Li <yang.lee@linux.alibaba.com>, airlied@gmail.com
References: <20230412064635.41315-1-yang.lee@linux.alibaba.com>
 <20230412064635.41315-2-yang.lee@linux.alibaba.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230412064635.41315-2-yang.lee@linux.alibaba.com>
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
Cc: chunkuang.hu@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12/04/2023 08:46, Yang Li wrote:
> Remove variable 'res' and convert platform_get_resource(),
> devm_ioremap_resource() to a single call to
> devm_platform_ioremap_resource(), as this is exactly what this function
> does.
> 
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/gpu/drm/mediatek/mtk_disp_aal.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_aal.c b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
> index 434e8a9ce8ab..391fa0ece22c 100644
> --- a/drivers/gpu/drm/mediatek/mtk_disp_aal.c
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_aal.c
> @@ -104,7 +104,6 @@ static int mtk_disp_aal_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
>   	struct mtk_disp_aal *priv;
> -	struct resource *res;
>   	int ret;
>   
>   	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> @@ -117,8 +116,7 @@ static int mtk_disp_aal_probe(struct platform_device *pdev)
>   		return PTR_ERR(priv->clk);
>   	}
>   
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	priv->regs = devm_ioremap_resource(dev, res);
> +	priv->regs = devm_platform_ioremap_resource(pdev, 0);
>   	if (IS_ERR(priv->regs)) {
>   		dev_err(dev, "failed to ioremap aal\n");
>   		return PTR_ERR(priv->regs);
