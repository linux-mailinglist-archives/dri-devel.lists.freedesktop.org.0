Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 292804745A9
	for <lists+dri-devel@lfdr.de>; Tue, 14 Dec 2021 15:54:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0906010E547;
	Tue, 14 Dec 2021 14:54:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF2B210E547;
 Tue, 14 Dec 2021 14:54:06 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id v11so32784215wrw.10;
 Tue, 14 Dec 2021 06:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=QHcUAfEad7WKaEaeKkLn7LFVZww3lXYZUw4oQRq9+tU=;
 b=BECO94Qf+icNNuF+N/ts4ObCn6Ncn4/JdMOyQl4d3TMSz3OV1aRdYNCeSgVO4HwMNq
 DWReQKBIgjgwr9qr9IrJ/WXkov6RV5Pgd38M1W9UfdWeiQ+UYiJI5K46SPV3wZ2jFR1X
 2NCz/xQfNhQcoZaItIchM4Zq2nQUBCB7BxS0tD33MX5q1rlgLlqsu3zIK8h0gisVdnQ4
 RxYeEASInhwmW2sW3uGJL6ozbUpZl7jPSzCkddiNbqzXsVfgiM6CW4SFrYD48ysY1fnj
 lWPITR0znyQoPMhDjXCvz/mOqOl2IqhxtOvRhqz0Lj0dH6zrqrk86OCeIChRKyKZZsOW
 5wYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=QHcUAfEad7WKaEaeKkLn7LFVZww3lXYZUw4oQRq9+tU=;
 b=zhyCPfw6SO1g2NigkibEJj7dOhxdyS2TSJyncxs7FSVrgDA9WuTWI6ggEJuW/6zwIO
 uIlQHPNXynV6Td/4LAx7A4TQafor0q6iQ2H28rdWXlc+GSmSkjaaPh1psqID7mCmiM6z
 qqBq6dzHJ8luAm5pyYGviakAaHXOltYCB2sxvOV3eE7Yzzlo4NTrz+GPAkoN1LCmV8yH
 Ojch62DsmmNvzjebSzSKufxztLarsihVAdkC5ubQH29+Xgg35CQzusyEBQME1VhvOdAJ
 Ww+UeIXirxZi+A6qTjwxggAm5FcM35whN2Ss2El87fnd48uSWyxcfRFxeon7vTHxPmYX
 bsQQ==
X-Gm-Message-State: AOAM532RPfK/f52mUwAHQL6OZxoPFI59FpbDCSdzQZ/LsHLX7szJtJV6
 UIqgMlUVZmxp4x3ytK/C0zU=
X-Google-Smtp-Source: ABdhPJx51kLMiGT+xWuWKMZmjb7/M74p4GAa3jGXnjWTY3hsaSdXQfh6sVj/tCHskuH56l3fj/t67A==
X-Received: by 2002:a5d:4084:: with SMTP id o4mr6432264wrp.47.1639493645360;
 Tue, 14 Dec 2021 06:54:05 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:65ee:6e65:8955:bfe8?
 ([2a02:908:1252:fb60:65ee:6e65:8955:bfe8])
 by smtp.gmail.com with ESMTPSA id d8sm91994wrm.76.2021.12.14.06.54.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Dec 2021 06:54:04 -0800 (PST)
Subject: Re: [PATCH] drm/radeon: Fix syntax errors in comments
To: Xiang wangx <wangxiang@cdjrlc.com>, airlied@linux.ie
References: <20211214135217.24444-1-wangxiang@cdjrlc.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <ba96bb4f-1666-32a2-68a9-8fe3d6e2c10e@gmail.com>
Date: Tue, 14 Dec 2021 15:54:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211214135217.24444-1-wangxiang@cdjrlc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 14.12.21 um 14:52 schrieb Xiang wangx:
> Delete the redundant word 'we'.
>
> Signed-off-by: Xiang wangx <wangxiang@cdjrlc.com>

Well not a syntax error in the sense of a coding error, but valid fix 
anyway :)

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/radeon/radeon_vce.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_vce.c b/drivers/gpu/drm/radeon/radeon_vce.c
> index 511a942e851d..ca4a36464340 100644
> --- a/drivers/gpu/drm/radeon/radeon_vce.c
> +++ b/drivers/gpu/drm/radeon/radeon_vce.c
> @@ -513,7 +513,7 @@ int radeon_vce_cs_reloc(struct radeon_cs_parser *p, int lo, int hi,
>    * @allocated: allocated a new handle?
>    *
>    * Validates the handle and return the found session index or -EINVAL
> - * we we don't have another free session index.
> + * we don't have another free session index.
>    */
>   static int radeon_vce_validate_handle(struct radeon_cs_parser *p,
>   				      uint32_t handle, bool *allocated)

