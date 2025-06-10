Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E13F1AD3AF6
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 16:17:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA18510E578;
	Tue, 10 Jun 2025 14:17:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="Ils1jUdI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9969E10E56C
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 14:17:39 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-3a3798794d3so4736545f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 07:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1749565058; x=1750169858;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=L7FQPUI2t4fKh9B8qtLSyYwsxdJre2h+7ztMs/P0P7U=;
 b=Ils1jUdIfvYP685UsqKM/WjawOuRzvebe8OXhfd0cUy/UJJywwiLinxz8Xg99LvsOh
 PFGgADL3qSouEY6IxK94qxYHMrmBoyIhgKYg33cw+0N7QG3LhRcmWeYXwVlL26+D6QjQ
 dLeh3fMjRPsWMYHmOB0Yqv/2XkSLq8PvSiF5QwG+BnxkiD87A75byhv1FdkCo5oPS1v1
 weIzI7UW6oWa3ZoHOQU1R/wr3pRe3axb8AJf1R/NMd7hv0wyIv7NqylettGyvKFpo/PO
 lpdoWrA3c7dqBJfFMBop9r+xT7RPZ4jm9WiJ2SbxDCu1evvCBDrV5RddRqKkpt4nVgRb
 aNGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749565058; x=1750169858;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=L7FQPUI2t4fKh9B8qtLSyYwsxdJre2h+7ztMs/P0P7U=;
 b=h4XJLTrq4gNN1nRaElPDjUq8CfelLlcNrM/3dqyX3tfzk/YhoFqn199hjjKuoi3Be/
 YPf12p6mBbInMEsoahDK9u5bFfQ56/3BtkyQrl5yf4Oi/JRNxfNgYzuQ6z4Y2E2V9k0K
 TOouyVRMHWNAWP+KtVKhI8d1alHPi9ViYiQ7HSo/SaavmT8JTCK1PIqNnNiVWfHVwgbI
 NsqA1QTy3FlqGAp04LNsSGnKpepJRlcTpzRLNJjhm9bJjpWqzM9Fo2sP2dHgun1yKDaj
 YRyO6wODCFEPQiHSmYBkzbf9b7wyb95fO3Q+xizV6eVxT4shDnDVq5EX4xYJXHIN2lQ5
 aGkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYUsaZP5w4jT0sVE+l9YuTBzQBpqxrJF2IkG6eAWj1Mffhuz8h5KRj69qzLPcU7g/O1Znj4G9Dlew=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwcH05bdTaHQmkDC1VD21Y2aeIdsajijKQWLXbQzwTT6SYM12PG
 pg5Du3oqB6OgSofxXbOzrzIcbk0JsvCX1+w+kGxemEOzI2s8KT8OiQHi6oxaE3uTcng=
X-Gm-Gg: ASbGncuN7ztQLw8jSKygOpbTQTUbjwiQ+h+HtVkj1GYdzBW9t6Vwlo9/TgGDWeLpyn5
 4xULrDAckI0j7CS0jM4FbrGhCb3BgbvM5+k0on4zWTX2KmmWLI6L5S4erfjJfIX8omz8fgs6n8m
 wl9EQ0CLlu4XYQ27BFkQQadICvF4TtZ7kS3+aAfm7gxuVwZC35R38Cv/Wg+DjNUR898cmDC5Soz
 lQKuWGO5j0Cjeuz2fQqapuC20VyaE63TyFvOy0GCYEDGk7MjBrjtjtd1XXFCrQ4EY6EhUlRTd5V
 4HBPIS5O7einhFkGEkBuuM3npjM7S3zHL6DOHfEtbJPMv9BZTHfLVLWYCKzqlwQJDxwSUoYBOL8
 H
X-Google-Smtp-Source: AGHT+IEomsRBijSCauKahXmuN9DoALYK71K7BXkR2JKtgSOuJFyLBUMw3W56VvXiuEzOAN9bZpH/tQ==
X-Received: by 2002:a05:6000:2503:b0:3a4:ec23:dba5 with SMTP id
 ffacd0b85a97d-3a5319b17c0mr15062186f8f.5.1749565057467; 
 Tue, 10 Jun 2025 07:17:37 -0700 (PDT)
Received: from [192.168.0.101] ([81.79.92.254])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a53229de17sm12762433f8f.18.2025.06.10.07.17.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jun 2025 07:17:37 -0700 (PDT)
Message-ID: <349a1cea-3377-4022-bebc-6b67f18077bb@ursulin.net>
Date: Tue, 10 Jun 2025 15:17:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf: fix compare in WARN_ON_ONCE
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dan.carpenter@linaro.org, sumit.semwal@linaro.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Cc: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
References: <20250605085336.62156-1-christian.koenig@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20250605085336.62156-1-christian.koenig@amd.com>
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


On 05/06/2025 09:53, Christian König wrote:
> Smatch pointed out this trivial typo:
> 	drivers/dma-buf/dma-buf.c:1123 dma_buf_map_attachment()
> 	warn: passing positive error code '16' to 'ERR_PTR'
> 
> drivers/dma-buf/dma-buf.c
>      1113         dma_resv_assert_held(attach->dmabuf->resv);
>      1114
>      1115         if (dma_buf_pin_on_map(attach)) {
>      1116                 ret = attach->dmabuf->ops->pin(attach);
>      1117                 /*
>      1118                  * Catch exporters making buffers inaccessible even when
>      1119                  * attachments preventing that exist.
>      1120                  */
>      1121                 WARN_ON_ONCE(ret == EBUSY);
>                                               ^^^^^
> This was probably intended to be -EBUSY?
> 
>      1122                 if (ret)
> --> 1123                         return ERR_PTR(ret);
>                                                  ^^^
> Otherwise we will eventually crash.
> 
>      1124         }
>      1125
>      1126         sg_table = attach->dmabuf->ops->map_dma_buf(attach, direction);
>      1127         if (!sg_table)
>      1128                 sg_table = ERR_PTR(-ENOMEM);
>      1129         if (IS_ERR(sg_table))
>      1130                 goto error_unpin;
>      1131
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/dma-buf/dma-buf.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index 0c48d41dd5eb..451714008e8a 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -1060,7 +1060,7 @@ struct sg_table *dma_buf_map_attachment(struct dma_buf_attachment *attach,
>   		 * Catch exporters making buffers inaccessible even when
>   		 * attachments preventing that exist.
>   		 */
> -		WARN_ON_ONCE(ret == EBUSY);
> +		WARN_ON_ONCE(ret == -EBUSY);
>   		if (ret)
>   			return ERR_PTR(ret);
>   	}

Thread bump FTW ;)

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

