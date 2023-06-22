Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 798D373A105
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 14:36:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64E6A10E03E;
	Thu, 22 Jun 2023 12:35:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 752AD10E03E
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 12:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687437355;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o3pBXTuB3tzuuBUsdWyQRug37awOIMzuxqG56/45cYw=;
 b=YefFbdO1nR2+EZnSXKgq6ZgbTxRQZCQrK3FS8AMBQBRMTNtjr34iPZHqS2DzO3GnqVWJEp
 V8l0Wvw0ZSGybFA0+II3SkEzCqFBoSkaa8wkbujY6k5yx/4LSZQAky/to0cMN9zohpW+IM
 AYTKZE1xb7uvX0U2uhp+2pD/PAP6lnQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-329-8RnsIx37P0Gyy0QdrlyjpA-1; Thu, 22 Jun 2023 08:35:54 -0400
X-MC-Unique: 8RnsIx37P0Gyy0QdrlyjpA-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-31126581e13so10007052f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 05:35:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687437353; x=1690029353;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o3pBXTuB3tzuuBUsdWyQRug37awOIMzuxqG56/45cYw=;
 b=eqY2RIHQ1MXcu+YkDtzhu6HcT8gyHr9jIm6QvkHB1ETEC2wjp3R3KUP715xE50CREu
 UtzooaH8lbk33t3Gorgd2Q7xcx8SqJQZ8vc6xINQwbTnf8CL+7ecEqG5LfSidzmIr9cO
 txJhkFMFJUXYdIjh3225f2jP/vUzRfTXNGMU6/48WWym3hx6BQfZnPQLllPzHkBk/6W/
 h5EZrkmbO/CsYFqlZYeMS/zfc0TwgNxK1THQR7Ca3KeDQLt3/xzWKnUfll8/EAhmgXKX
 TrsoqfATrVw4+y3tFQOwZt42pDo+Fz6ij6CXLVG98Cx+6BvRl8aVpeC+5gigqBsZFKMD
 9D0w==
X-Gm-Message-State: AC+VfDwaU0kuBwq43xgRnWyj0F9M5tYtxS481WEeQzBSvaBk8dVrQnxz
 yuEHwKilsft4YTzxNb9ektzpQKkhVgY4EeaDuX2/DVnyYDI9OQMNiXGQ0iptqaAdjnkWlUt6F2m
 8Jw17s/c9mQp6ycskYXiAfe8BXKax
X-Received: by 2002:adf:df81:0:b0:311:1cd7:68b3 with SMTP id
 z1-20020adfdf81000000b003111cd768b3mr18688361wrl.57.1687437353357; 
 Thu, 22 Jun 2023 05:35:53 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4/IgalXYDuJ4s/OfSxQU7RlstK05ku6b/vAJRJl/dYkeQFv9nh31ixKyyAH3vZITc0Y/uPcg==
X-Received: by 2002:adf:df81:0:b0:311:1cd7:68b3 with SMTP id
 z1-20020adfdf81000000b003111cd768b3mr18688349wrl.57.1687437353049; 
 Thu, 22 Jun 2023 05:35:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 a16-20020adfe5d0000000b0030e5a63e2dbsm6993575wrn.80.2023.06.22.05.35.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jun 2023 05:35:52 -0700 (PDT)
Message-ID: <8e7011fe-6757-e89f-c3c5-d5f87cf83766@redhat.com>
Date: Thu, 22 Jun 2023 14:35:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] drm/mgag200: Fix a warning reported by Fi.CI.SPARSE
To: Sui Jingfeng <suijingfeng@loongson.cn>, Dave Airlie <airlied@redhat.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Tom Rix <trix@redhat.com>
References: <20230621191139.2291139-1-suijingfeng@loongson.cn>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20230621191139.2291139-1-suijingfeng@loongson.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch was already sent by Tom Rix last month:
https://patchwork.freedesktop.org/series/117881/

I can push it to drm-misc-next, if Thomas is ok.

Best regards,

-- 

Jocelyn

On 21/06/2023 21:11, Sui Jingfeng wrote:
> drivers/gpu/drm/mgag200/mgag200_drv.c:23:5: warning: symbol 'mgag200_modeset' was not declared. Should it be static?
> 
> Found in the log of Fi.CI.SPARSE test [1]
> 
> [1] https://patchwork.freedesktop.org/series/119249/
> 
> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> ---
>   drivers/gpu/drm/mgag200/mgag200_drv.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
> index 976f0ab2006b..abddf37f0ea1 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_drv.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
> @@ -20,7 +20,7 @@
>   
>   #include "mgag200_drv.h"
>   
> -int mgag200_modeset = -1;
> +static int mgag200_modeset = -1;
>   MODULE_PARM_DESC(modeset, "Disable/Enable modesetting");
>   module_param_named(modeset, mgag200_modeset, int, 0400);
>   

