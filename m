Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2659C9015
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 17:48:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 825CA10E822;
	Thu, 14 Nov 2024 16:47:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="bi3R5xqy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3375B10E822
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 16:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1731602873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xt0gEA03H8u8VTaljHFvzZY8AomqqKaL5KraLABqcHM=;
 b=bi3R5xqy+weicsoLWFS/e54g4n4YeGVCYhB3ig9ulpTzxbkLzCsLedsZBAlYMaNz+3XmQe
 nGtcn+c0G2n7v2I5E/znuiV+rLZ26WF55r3lfcP7L+jsnyAB4rIZhovLxe0egVAmdcp/SL
 IJDgw/TgelnUVVBOr6WBI/f9LMlK0Zw=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-631-dmB-LBb-MWCETn6UVtQwBA-1; Thu, 14 Nov 2024 11:47:51 -0500
X-MC-Unique: dmB-LBb-MWCETn6UVtQwBA-1
X-Mimecast-MFC-AGG-ID: dmB-LBb-MWCETn6UVtQwBA
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4316300bb15so6247465e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 08:47:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731602870; x=1732207670;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xt0gEA03H8u8VTaljHFvzZY8AomqqKaL5KraLABqcHM=;
 b=Iv3zMUKLOaf3RV02MjbIeRJeAS9vv7BhaRtrRgCELvV7gLqjm8zwiHK9hj/BLb/q2G
 u9fXcmFxvWHgJnJFvtHnMa2s0acc5vv+j66iQliMf3m7ZFQ1EISX3eJ/Sc6FUjCZEewk
 b0eEkPMXWlRAt/RXGXymK/vXF9f4Zq2H3LkK1MI1fJlUa5EhVyGx64MIXvcxEh4Mkqwd
 Cxt//W4gIvDC+nYAgIB/wjJuYpz7fSD4O7iw5qCO6G/q24T8fxFX1tqoptalpvmIElbm
 IrFG2XXX1yBPaK6rRj8zcbi3XWdKJKCpOC+Xhj7wXv6djuk7TX8/qzUpNmUl+ekW787i
 Dhnw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmm38p1qa3wrjT0Ueo0DsrMx/6g292tVhRJNJUg3674aNPoHjYcgdoGCMnxbFtZnfZntgGEHtIGqs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDmI6rR0ied2jWdgGEaH6m3MkMEqSyD5XzGO8yH3vPeRpOvrl5
 pqkxcUAFK86GKWt/tFqoqgNTrBXbbiMbq66cjzAoZP2xDiI+IKrVQj6HTH4a3DCd2zPz15jDBt7
 Oc3lXyVIE6fhK8baR0AlZWpdToiJ6CHNzkHLq6UyudHzelfJqSDKFmR5P5oIYcFjP6Q==
X-Received: by 2002:a05:600c:3514:b0:42f:4f6:f8f3 with SMTP id
 5b1f17b1804b1-432b74fde60mr209807205e9.7.1731602870332; 
 Thu, 14 Nov 2024 08:47:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHO6XVDKE6FFt2PaV/J3jbU1cAd/6xYIC/fSOli4LEa0urBBzONnSFV8DMwoGka0LBFFtnxQw==
X-Received: by 2002:a05:600c:3514:b0:42f:4f6:f8f3 with SMTP id
 5b1f17b1804b1-432b74fde60mr209806975e9.7.1731602869912; 
 Thu, 14 Nov 2024 08:47:49 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432da265668sm29139835e9.10.2024.11.14.08.47.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Nov 2024 08:47:49 -0800 (PST)
Message-ID: <a394af10-8428-4d19-84cf-f21ec63f23f5@redhat.com>
Date: Thu, 14 Nov 2024 17:47:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/mgag200: Apply upper limit for clock variable
To: Murad Masimov <m.masimov@maxima.ru>, Dave Airlie <airlied@redhat.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
References: <20241111163306.860-1-m.masimov@maxima.ru>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20241111163306.860-1-m.masimov@maxima.ru>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5NPGGfDw6U0RrxoBnnrq5LbOO8T0I6644feebWDIQDE_1731602870
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

On 11/11/2024 17:33, Murad Masimov wrote:
> If the value of the clock variable is higher than 800000, the value of the
> variable m, which is used as a divisor, will remain zero, because
> (clock * testp) will be higher than vcomax in every loop iteration, which
> leads to skipping every iteration and leaving variable m unmodified.
> 
> Clamp value of the clock variable between the lower and the upper limits.
> It should be correct, since there is already a similar lower limit check.

I don't think it is correct.

If the clock asked is > 800000, then delta > premitteddelta, and it will 
return -EINVAL.
With your patch it will instead configure the clock to 800000 which is 
too low for the mode asked and will result in corrupted output.

Best regards,

-- 

Jocelyn

> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: e829d7ef9f17 ("drm/mgag200: Add support for a new rev of G200e")
> Signed-off-by: Murad Masimov <m.masimov@maxima.ru>
> ---
>   drivers/gpu/drm/mgag200/mgag200_g200se.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200se.c b/drivers/gpu/drm/mgag200/mgag200_g200se.c
> index 7a32d3b1d226..4934c27b084e 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_g200se.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_g200se.c
> @@ -216,8 +216,7 @@ static int mgag200_g200se_04_pixpllc_atomic_check(struct drm_crtc *crtc,
>   	m = n = p = s = 0;
>   	delta = 0xffffffff;
> 
> -	if (clock < 25000)
> -		clock = 25000;
> +	clock = clamp(clock, 25000L, 800000L);
>   	clock = clock * 2;
> 
>   	/* Permited delta is 0.5% as VESA Specification */
> --
> 2.39.2
> 

