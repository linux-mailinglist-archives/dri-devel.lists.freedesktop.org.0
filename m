Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 176EA2E70C3
	for <lists+dri-devel@lfdr.de>; Tue, 29 Dec 2020 14:03:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A34C6891C2;
	Tue, 29 Dec 2020 13:03:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1492891C2
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Dec 2020 13:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609246998;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vvm5MmduYfq+CeOMpnUQJhTQ4fWwSPJm0vCOaVoEwcg=;
 b=EaGx5jTtl/vJrXOqBHr1p8dzrOmkmw5Oa9mbaQA42WLDBnbChN3V2VVo8MZBZY1kRFld2s
 sd0IZwlWH4akf/lqKvh45YRMR76gQ0pxjrrhOELDAotWs1/eAms6nYlJYDprIKUhbni7Bd
 KYbKh6a6qhfu3B43ka8rA3VdQ3tLo3I=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-IJ-IuGz1PX-n6F1-DosOpw-1; Tue, 29 Dec 2020 08:02:33 -0500
X-MC-Unique: IJ-IuGz1PX-n6F1-DosOpw-1
Received: by mail-ed1-f69.google.com with SMTP id bf13so4414360edb.10
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Dec 2020 05:02:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Vvm5MmduYfq+CeOMpnUQJhTQ4fWwSPJm0vCOaVoEwcg=;
 b=M3ecr++25RodZayafSbqPppITZuf+JXefH0pkNaYgHUINxSxsa1vJQs0zYRyzp0Q7a
 mSy9GGiZFj4wAb92bClGF6jZEs81CFs+3cVSNIQsaQ8GjkaYcVE+3q1PDXG1iIzPqOkQ
 UeR1kow4YOsfiOFalBDQ1ZfGEj6WH86riNHWLzwJ5qmiWGPM65ul/FYWyGtTjq87fkHl
 WQyDocJCTco7NkqEc7zBFrg8dhBdqpbfQXhuy7UYmxtJM/CsgHJID3QmTJFsbtTcXwRq
 Yjjq4wDeiNYNnXXsNuZ7FHYlxr3ah1NV9f6x2dDMyQ6tMp0jiaT5u/16u5ePakdb5ppa
 YQkg==
X-Gm-Message-State: AOAM531gvV971UFGoFKWtvWf7ME4upWhYgA47OJZ2kePzJBQJ4CndS1R
 3/N2zpnBj5rcEkMbaNTx7THJxEBDUXJoq61j37uadXKu063u8OR1tR9cYvTcqsAq03SGmW11nsM
 C8Q3mGxfSDI5wbOEbktuQuqEKySrYpL8nESoEJIwGrLM0NOfSgmOwJm4KTeI3vjhdFs081jCA5D
 RHVInz
X-Received: by 2002:a17:906:c2ca:: with SMTP id
 ch10mr38660497ejb.157.1609246952558; 
 Tue, 29 Dec 2020 05:02:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwZe+0PeumBo8opCh97Rc3CfxyGDfiSwAPK8JsBsk+c68ZL8v4jfHfLK2RtzlmhXt25G45uUQ==
X-Received: by 2002:a17:906:c2ca:: with SMTP id
 ch10mr38660475ejb.157.1609246952314; 
 Tue, 29 Dec 2020 05:02:32 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id bm12sm4815794ejb.117.2020.12.29.05.02.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Dec 2020 05:02:31 -0800 (PST)
Subject: Re: [PATCH] video: fbdev: simplefb: Fix info message during probe
To: Peter Robinson <pbrobinson@gmail.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20201228183934.1117012-1-pbrobinson@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <b00bd27c-70b5-9ef1-85a1-11e733af78da@redhat.com>
Date: Tue, 29 Dec 2020 14:02:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201228183934.1117012-1-pbrobinson@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 12/28/20 7:39 PM, Peter Robinson wrote:
> The info message was showing the mapped address for the framebuffer. To avoid
> security problems, all virtual addresses are converted to __ptrval__, so
> the message has pointless information:
> 
> simple-framebuffer 3ea9b000.framebuffer: framebuffer at 0x3ea9b000, 0x12c000 bytes, mapped to 0x(____ptrval____)
> 
> Drop the extraneous bits to clean up the message:
> 
> simple-framebuffer 3ea9b000.framebuffer: framebuffer at 0x3ea9b000, 0x12c000 bytes
> 
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans

> ---
>  drivers/video/fbdev/simplefb.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/video/fbdev/simplefb.c b/drivers/video/fbdev/simplefb.c
> index 533a047d07a2..62f0ded70681 100644
> --- a/drivers/video/fbdev/simplefb.c
> +++ b/drivers/video/fbdev/simplefb.c
> @@ -477,9 +477,8 @@ static int simplefb_probe(struct platform_device *pdev)
>  	simplefb_clocks_enable(par, pdev);
>  	simplefb_regulators_enable(par, pdev);
>  
> -	dev_info(&pdev->dev, "framebuffer at 0x%lx, 0x%x bytes, mapped to 0x%p\n",
> -			     info->fix.smem_start, info->fix.smem_len,
> -			     info->screen_base);
> +	dev_info(&pdev->dev, "framebuffer at 0x%lx, 0x%x bytes\n",
> +			     info->fix.smem_start, info->fix.smem_len);
>  	dev_info(&pdev->dev, "format=%s, mode=%dx%dx%d, linelength=%d\n",
>  			     params.format->name,
>  			     info->var.xres, info->var.yres,
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
