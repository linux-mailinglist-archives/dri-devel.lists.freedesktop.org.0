Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E34049CE160
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 15:36:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 683E910E867;
	Fri, 15 Nov 2024 14:35:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="d6prvo8b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B028B10E011
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 14:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1731681356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hG6xLxPh/x5Oj9/65JNNs/XoNai/htMbWRdFrzW0cYA=;
 b=d6prvo8bWB6nquUDwE9fPVY1VW+9gAYi6rTajuJb1fFcetonEToVKdN7O0yznaFoNMBA4Y
 6jZcw2k9NR/I7AhYUAUqKmF8qzR8UuyQZAMd250n8OWidlvSRahmgylKDXzhM9xDCucrnA
 wYMNBGCuqi6VbJjqsfH4q0TK+Gm15eo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-96-UN41ZKy9MCWuNTDmbUN-jQ-1; Fri, 15 Nov 2024 09:35:55 -0500
X-MC-Unique: UN41ZKy9MCWuNTDmbUN-jQ-1
X-Mimecast-MFC-AGG-ID: UN41ZKy9MCWuNTDmbUN-jQ
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4316300bb15so13223575e9.2
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 06:35:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731681354; x=1732286154;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hG6xLxPh/x5Oj9/65JNNs/XoNai/htMbWRdFrzW0cYA=;
 b=bDsavAC7EiMCmOcxsOMzbsm/FMW/IAo8l2zpT0K2we5uPfnepiWI6DkkglBySR7G3+
 VXO15aVEPN77ZBFMWGu6WU446qghQTDrRNKDB5ptQyqgdX1pHX/Wn45k9bjlYPiY9vmM
 V+NMHROdurXkS6qPImdQ2R6zJSXT6oDJuvgkVdXtTLJYBo1HoMPbzsoP6GDXpq9odPoF
 lLCvOPASz7WauLQDu7voUf+0mbz7wEVHb2iIzXodEbyoS/cqIzFwgopIlzBeLantggCZ
 SzzTAwbgB8EKxS9mfsVg0EPghzJwMmKrpcv0hm6hPIItRXM8d2SJ7DXAayhvr7iEN0Ih
 JuDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWZrEnJ0ETswrvNfFGlvXxIURhIWqVJHrxHuVsfvTDc8zmJX0Yemx27bABQjKH+0vFuCkvGFmDino=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzy0z2HYol4tCw0WlP/kxFwsYSZXaewo4pDgYjtPkVd5T2jkYwQ
 N8VJOXETYkrY5AnEimOfZcTEEYR1rwuaE8lW2dji6uWDbEh/jOpxVxX8Z+dX7I24NM3bv3BG4/X
 Daezn7USEERL9oKNEqUf1VDjVLmfXn5kNZArEFzPSV6neHKRFIuYNX77oRysvI+cxeA==
X-Received: by 2002:a05:6000:1ac5:b0:382:319f:3abd with SMTP id
 ffacd0b85a97d-382319f3bfdmr274812f8f.36.1731681353950; 
 Fri, 15 Nov 2024 06:35:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEEwZG8/3+7a7sgOXiGaxta3MQuTiLXV+EcNr9aAXsXquoYJhyS561B/2ti5A7APdJPgT+2nA==
X-Received: by 2002:a05:6000:1ac5:b0:382:319f:3abd with SMTP id
 ffacd0b85a97d-382319f3bfdmr274782f8f.36.1731681353489; 
 Fri, 15 Nov 2024 06:35:53 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3821adade8dsm4560992f8f.41.2024.11.15.06.35.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Nov 2024 06:35:53 -0800 (PST)
Message-ID: <4a6d4704-27a2-457a-8b7b-3b306539bc6d@redhat.com>
Date: Fri, 15 Nov 2024 15:35:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/mgag200: Apply upper limit for clock variable
To: Murad Masimov <m.masimov@maxima.ru>, Dave Airlie <airlied@redhat.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Mathieu Larouche <mathieu.larouche@matrox.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org
References: <20241115141449.709-1-m.masimov@maxima.ru>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20241115141449.709-1-m.masimov@maxima.ru>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: N_roQYG9zAof6lXogBU3VCUWUYleK8qznbbrHo_jpDM_1731681354
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/11/2024 15:14, Murad Masimov wrote:
> If the value of the clock variable is higher than 800000, the value of the
> variable m, which is used as a divisor, will remain zero, because
> (clock * testp) will be higher than vcomax in every loop iteration, which
> leads to skipping every iteration and leaving variable m unmodified.
> 
> Return -EINVAL just after the loop, if m is still 0.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.

Thanks for this patch.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Fixes: e829d7ef9f17 ("drm/mgag200: Add support for a new rev of G200e")
> Signed-off-by: Murad Masimov <m.masimov@maxima.ru>
> ---
>   drivers/gpu/drm/mgag200/mgag200_g200se.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200se.c b/drivers/gpu/drm/mgag200/mgag200_g200se.c
> index 7a32d3b1d226..4d65ead63d66 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_g200se.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_g200se.c
> @@ -249,6 +249,9 @@ static int mgag200_g200se_04_pixpllc_atomic_check(struct drm_crtc *crtc,
>   		}
>   	}
> 
> +	if (m == 0)
> +		return -EINVAL;
> +
>   	fvv = pllreffreq * n / m;
>   	fvv = (fvv - 800000) / 50000;
>   	if (fvv > 15)
> --
> 2.39.2
> 

