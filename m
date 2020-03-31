Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBC001998F2
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 16:50:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07BA36E841;
	Tue, 31 Mar 2020 14:50:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1FAD6E83E
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 14:50:13 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id 31so26326871wrs.3
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 07:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=LThkFwSkZqTw2d4yYtrBRfrpjqvh2S44Ii+brKsEaNw=;
 b=j9eW+kYrODFdfrvu7dy3d7qBefcQklepGBvj9jeR8ukot9h5lwypuGf5uufqC6HRgI
 kOxYY0Gl1d+rsvs3jI2joeQ/K9fw0zLrpKP2ZfW17KXY4+WUk/JSZ8KAUVAnIoYijiSG
 72xe3HjDiRAGweyGBeu0koQ6R6h53GPsoakP+UZ63E0oG2b3gbice2QixK1CP37bWFvF
 nFymoKBWxsY3etNsmAtN0CcDfZOj9AnypWpwdsYX9DdcJZicqd8a+AG3qJ4Xlh7CtbZV
 wpoAEOJD53gMflO5aGS6pi7iX1qHirLV9b3hK64AZ+M80o5vpoCHeuC7oIDhoy097U7j
 YpTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=LThkFwSkZqTw2d4yYtrBRfrpjqvh2S44Ii+brKsEaNw=;
 b=WGCOt2DNL9KV2msuVIxt1sbCGdzDkOJgqKitUEXQ4gbJEUrDxZz+6VPs35q1N9V0dg
 X6DrV8ug28+8j5M2EphkuQN8CsRXdImqBggcHOO2MavmENChzgeIb8EVTfTYp+/9izMt
 XbktoC2b8WagYpW9p9mmE7ERBbzk7fvLpfWNAoahdMyCTkETW+h+Hlh3rXH4FBOAP12T
 Oj0rJTjjYKVT1dZ4dt5MWaJl43G1OPZI8ji2cBUApcWw/7SDwXzELvFVqP5mUUCufqFT
 pp0NwlamNtgi1owrkW4cda9Q50ry8KUwteUZEC3tMqWxN3RjFAJrVq4dnnmr/SgQzSc/
 GPYw==
X-Gm-Message-State: ANhLgQ3dMvTL7yuAVbshqxrBZOKNjzM/521KjoOOozOd1SszltnQkHem
 8H5Sgj8bSQ4rqCtmlyF36GR0VT7H6Ag=
X-Google-Smtp-Source: ADFU+vsr3d8+VMK/1DccKZdQKSpk3+U3Tn2Yv0QuaeVmGVHxKuIWc8675z3Jx+k42MOjeg8U4DKKKQ==
X-Received: by 2002:adf:ecc3:: with SMTP id s3mr20158772wro.32.1585666212208; 
 Tue, 31 Mar 2020 07:50:12 -0700 (PDT)
Received: from [192.168.10.4] ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id d6sm26595939wrw.10.2020.03.31.07.50.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Mar 2020 07:50:11 -0700 (PDT)
Subject: Re: [Xen-devel] [PATCH] drm/xen: fix passing zero to 'PTR_ERR' warning
To: Ding Xiang <dingxiang@cmss.chinamobile.com>,
 oleksandr_andrushchenko@epam.com, airlied@linux.ie, daniel@ffwll.ch
References: <1585562347-30214-1-git-send-email-dingxiang@cmss.chinamobile.com>
From: Oleksandr Andrushchenko <andr2000@gmail.com>
Message-ID: <b4d43b05-8b30-749c-0b60-87b4cdd7b1dd@gmail.com>
Date: Tue, 31 Mar 2020 17:50:10 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1585562347-30214-1-git-send-email-dingxiang@cmss.chinamobile.com>
Content-Language: en-US
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
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/30/20 12:59, Ding Xiang wrote:
> Fix a static code checker warning:
>      drivers/gpu/drm/xen/xen_drm_front.c:404 xen_drm_drv_dumb_create()
>      warn: passing zero to 'PTR_ERR'
>
> Signed-off-by: Ding Xiang <dingxiang@cmss.chinamobile.com>
Reviewed-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> ---
>   drivers/gpu/drm/xen/xen_drm_front.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xen/xen_drm_front.c b/drivers/gpu/drm/xen/xen_drm_front.c
> index 4be49c1..3741420 100644
> --- a/drivers/gpu/drm/xen/xen_drm_front.c
> +++ b/drivers/gpu/drm/xen/xen_drm_front.c
> @@ -401,7 +401,7 @@ static int xen_drm_drv_dumb_create(struct drm_file *filp,
>   
>   	obj = xen_drm_front_gem_create(dev, args->size);
>   	if (IS_ERR_OR_NULL(obj)) {
> -		ret = PTR_ERR(obj);
> +		ret = PTR_ERR_OR_ZERO(obj);
>   		goto fail;
>   	}
>   
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
