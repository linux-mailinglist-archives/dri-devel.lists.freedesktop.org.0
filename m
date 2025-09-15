Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A695B577B9
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 13:12:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC95410E451;
	Mon, 15 Sep 2025 11:12:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sArvI+MH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEC2410E451
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 11:12:05 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-45b4d89217aso29133885e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Sep 2025 04:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1757934724; x=1758539524; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=badnNnqIsXkPn2EvMp9u+z86UbkTv8uQkG/3+BUdjvA=;
 b=sArvI+MHa1odOCK3xYGhKkOSve6zEIj6zENyUH3IM6L2eAmfULBzWg6Vi0pHaedn3p
 AQhIrzQl7PuCUIvOdEf/xAQzE1I9T5xbYwsMPCX/jPfNwpeyeJ2aSY1W6zxul5szTL99
 cbrALNzWvxzvtt9fun5HXjc7EreHPwMEqgl1M19kQbG5TkX3yX2srq5lT9W7fcCWYf4n
 gjNLls1udTNANEZ9UWgZUjsQkV1kiXtAw8cqhk3k7UfJo2SJPqUxdX42MFcAho8HwdtK
 +gN/is7q6VvVJhH3YKZp3JUMSeXNfCojbAJYrSeceUvKjJVQsaNVBo0Q/1LeSs/TXIA+
 m1Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757934724; x=1758539524;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=badnNnqIsXkPn2EvMp9u+z86UbkTv8uQkG/3+BUdjvA=;
 b=BQmi3hZbV/k/scYuas+ZjoVZ6YwngCNkGGGPjJuCW6FQpwAKjqQVWTT7wRoogb37lj
 faLV31i0u5Kv1tv2T1dCYEYI1kx1xlyf+1CgQNBMWhgNGNRdTCUOwapfc9znlk/TdNFl
 znVGW4Das/WGkGgbwVMuGpujnBgY7SYuUjNnLNVYdwJbbLAcDsdMitgZACEW0XyQlXFF
 /cQmj3Pa9KPSYoitmaBFNOMiTyqfLxyX4b+oo7WFCB6H7TmS8lgduNqCnUPkvUZ8xAMl
 ki2ruyXW49RSCseGiEr9TbiADpXc+ShnFmFcwbYbDx7t7744owrGuiQUTwXFfXzhm3PG
 hq2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5Y/yaYMKFjzhG+KRbSp9+fg1Oth5lWcqYwTZwby7fyDIIHPnuhUvfEEkVhVOOS9E56YQQzLlabG8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzkV3OQeS+SxHwHSZopwrH7yAyQsChK4oquwWlFWbdSyjLP039d
 R+nKv6i0Ga6EuJsYsHaDmnm73cPhVmL42wpKL1JbDoKNaiaurDV3+0R9+Qyz20+1K4o=
X-Gm-Gg: ASbGncuxDGfthQa8aNmwyT4mIH89Zy14Sb8K+gc2TTK0OaG31Awzx4rFdpRn2WUZcD2
 Nq6p/0BNYozRmTFvEcAuhFp1Poed1fzvgB+9q/nBiBvtPiiCOt03yEkMQI4+YQxcRgUDCgqBiYB
 keaRJvqRCJIgF1TcsI6eQZvUwQLNOta84mmt4CtSAa6WssnOH/9Qd46kLdvUfl3Iv5gqRXs04lW
 4pD1T4SL23SeUT05/EEO0tg2lkL9Owla1YTn5KkKpOf2W4A5DQcG3tS3hUbU6mq5f0YvG8I3vFM
 54LDbbmR7rH2mZeKbDNvsBC3z9pTu/XAlZiiGKs5PdCCJLoC/+tK0tMQwnEoshc74B88RODUukD
 LTM5v7pa2aK+xeOl5HvsV5fbz9HPfZYH4Vy7nIQ==
X-Google-Smtp-Source: AGHT+IGm63UEHY4s1jwbRi4GCTY1XYfJ6+b0wYpsutPmJZyaFuGMrawbriAbxQunREyvB8TmP6296Q==
X-Received: by 2002:a05:600c:1c0e:b0:45f:2870:222e with SMTP id
 5b1f17b1804b1-45f2a023010mr42132565e9.26.1757934724348; 
 Mon, 15 Sep 2025 04:12:04 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-45e037d62besm171722925e9.21.2025.09.15.04.12.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Sep 2025 04:12:03 -0700 (PDT)
Date: Mon, 15 Sep 2025 14:12:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/xe: Fix a NULL vs IS_ERR() in
 xe_vm_add_compute_exec_queue()
Message-ID: <aMf0gA6Zyj3PpgZn@stanley.mountain>
References: <aJTMBdX97cof_009@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aJTMBdX97cof_009@stanley.mountain>
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

Ping?

regards,
dan carpenter

On Thu, Aug 07, 2025 at 06:53:41PM +0300, Dan Carpenter wrote:
> The xe_preempt_fence_create() function returns error pointers.  It
> never returns NULL.  Update the error checking to match.
> 
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/xe/xe_vm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 432ea325677d..5c58c6d99dce 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -240,8 +240,8 @@ int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
>  
>  	pfence = xe_preempt_fence_create(q, q->lr.context,
>  					 ++q->lr.seqno);
> -	if (!pfence) {
> -		err = -ENOMEM;
> +	if (IS_ERR(pfence)) {
> +		err = PTR_ERR(pfence);
>  		goto out_fini;
>  	}
>  
> -- 
> 2.47.2
