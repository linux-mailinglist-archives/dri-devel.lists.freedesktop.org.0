Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 168B62BBF7A
	for <lists+dri-devel@lfdr.de>; Sat, 21 Nov 2020 15:13:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E16576E9BF;
	Sat, 21 Nov 2020 14:13:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E8716E9BE;
 Sat, 21 Nov 2020 14:13:48 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id k27so16857692ejs.10;
 Sat, 21 Nov 2020 06:13:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Vmi9wiqTvmGi16rhZcMVC6JjslBSY2fYCYfY7Z2titQ=;
 b=g/PWRVvoEsFX9dP7TQgHpAYsk1+vAih9HgFinu37Z0HjD5+ZUzKGuDcJUQ524b52EX
 0jvASOx+6cdElQaOHscAAnTnD4Dm/if0kqqwnWcCOjD44hjWyHRHnMbjYd/ftBRY+siT
 l6BM1AxHEit1OIgnHe8uT+7lq1/GZcD14lehZA2N8LpdDrFhNna91VPiIX9h21krRGE8
 XClcPto3r9aL0NL8UcdjbarVl4GQsspSRhxvbycWvg+r3KZZZzrro/4ubHBf+1dYSroj
 USLOFGixLCCGTs+I7tb8j6w7BssXF3h0wjlEUN4HKtgfWh16GuDUqO+cY0tI4cCJW/Ky
 MF1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=Vmi9wiqTvmGi16rhZcMVC6JjslBSY2fYCYfY7Z2titQ=;
 b=JaN9MKBc039qEBnAQU9CKtD1ydUdprKFqFWHZHVRdxTaRj4GIus7+wkgvdDTeqCH/K
 y72eEytvvk50FET7EGSSl1rbbsbWYaFnBrUi0ZKsXD+cK8v6aSL03bhu9DBwPU3VyHv1
 nelukv+mzi4rEw+4pTLlSWvTjVoPDldBtTmOS1DHqo74c1+60LJzRvUc5I5e9pfgSUh2
 0HtBfcinvcOUFXZpWLTaZMWaVtTJ9QQPaqvmhi62TDE6nfG17fMYDAdPxTfe5HWigu+j
 ZoowZcPPLuvw3mUOusqj604mlPtBAEqBTydsD3Oz7lCBLbrA4GNVeiNdGuWCg0B2iBeR
 rwpQ==
X-Gm-Message-State: AOAM532lad1THFFolvpM9Ug+MQzy16bctBW/iJpRllVbrqgNyV/BH0G5
 JRey7fyJS/99BYCtw3jK+VQ=
X-Google-Smtp-Source: ABdhPJyoNUqW5lyHn17tjAZVrO3PK0T+76JE86ZYprrKKXfHswHrUgXp+6hM2ZwGqufhYMS66KLiQg==
X-Received: by 2002:a17:906:6091:: with SMTP id
 t17mr7552861ejj.476.1605968027289; 
 Sat, 21 Nov 2020 06:13:47 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id q24sm2488929edw.66.2020.11.21.06.13.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Nov 2020 06:13:46 -0800 (PST)
Subject: Re: [PATCH v3 04/12] drm/ttm: Set dma addr to null after freee
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, robh@kernel.org, l.stach@pengutronix.de,
 yuq825@gmail.com, eric@anholt.net
References: <1605936082-3099-1-git-send-email-andrey.grodzovsky@amd.com>
 <1605936082-3099-5-git-send-email-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <cc970f95-ae21-ab8d-232e-abbddf7d6a0f@gmail.com>
Date: Sat, 21 Nov 2020 15:13:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1605936082-3099-5-git-send-email-andrey.grodzovsky@amd.com>
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
Reply-To: christian.koenig@amd.com
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 21.11.20 um 06:21 schrieb Andrey Grodzovsky:
> Fixes oops.

That file doesn't even exist any more. What oops should this fix?

>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> ---
>   drivers/gpu/drm/ttm/ttm_page_alloc.c | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_page_alloc.c b/drivers/gpu/drm/ttm/ttm_page_alloc.c
> index b40a467..b0df328 100644
> --- a/drivers/gpu/drm/ttm/ttm_page_alloc.c
> +++ b/drivers/gpu/drm/ttm/ttm_page_alloc.c
> @@ -1160,6 +1160,8 @@ void ttm_unmap_and_unpopulate_pages(struct device *dev, struct ttm_dma_tt *tt)
>   		dma_unmap_page(dev, tt->dma_address[i], num_pages * PAGE_SIZE,
>   			       DMA_BIDIRECTIONAL);
>   
> +		tt->dma_address[i] = 0;
> +
>   		i += num_pages;
>   	}
>   	ttm_pool_unpopulate(&tt->ttm);

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
