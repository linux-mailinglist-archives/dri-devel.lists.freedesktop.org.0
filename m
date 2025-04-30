Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC41EAA3FEB
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 02:58:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 060D410E058;
	Wed, 30 Apr 2025 00:58:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="ggPKYOkp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 007EE10E058
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 00:58:47 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-b1f7357b5b6so846052a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Apr 2025 17:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1745974727; x=1746579527;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8/aA7hND/9oRLSZ0K0veHCzvrEbxF7v+wWQOhRllbYY=;
 b=ggPKYOkp/eomkNZmcsqiVKnCtjS+BktzUQ9pWC16U9gF4cHlUJseKyiU533gl2leNC
 ZnJMEZYRQIXn43zpelBgo3DpC8yx1COwUsHkWPixoR3Vn9NRlvOYbGR03wIYASwzJG2L
 ha3ajKvCmOoUnaVHL5hGXteKeZ01XHA2MznEw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745974727; x=1746579527;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8/aA7hND/9oRLSZ0K0veHCzvrEbxF7v+wWQOhRllbYY=;
 b=T4s6JiKz1qhLtLsSnyGreGQ87DYTMOAzS0iMuH5W9Nmwxza35IiU9MPE7/8LNP77zX
 p0KoWc5NK7pOoxSzwXzjsuhn8rRMVBgDtpy2QwD38w6B2RF8LL5xOJeYbCPKYpT/w2ID
 ZryCzNtkJrgoc+thQXKkEOyTwc+XuDUVLJJEc9Xnqo1MXmeczAyN7Me0sXaV1kOqBtzf
 B4XrXCmDTgD9Fy0FZ6aPYEVJuC6wBHJRPC0BXqrqJQBUXGKMOogJLLnp0Ii3ebilEFzc
 UKSwrCDPNUg5fBQrviWiBDvKiNga4Kxfqu+r7bPmbkLPv4NieamWkpTCccYTJ9RCv1Wc
 lWeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4RJaxZsEflZYnkAvltKEqPWfIDz7Xvml/a4kS5yDh63VQ90TXnYC5agVjkUbwzy69/lI2aAGz00Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywzgc9VTAjesJcZiNtoG1XfsSgHBmJ2YIs/TSC1QCngpeyulGTk
 J8X7S1BKcFRohL/wk2/pawmebQrPZb17+na5E8mwXxgzl87brBkwgRl/56FOqg==
X-Gm-Gg: ASbGnctHMwi4fLRoVsqp8FdqM2V23QJ5eyAhX836cITMk0/Zw8c0Vr94jjtiRU7Xcil
 1Z/S6IlfweUS/MClDBqCgBZjTTTS6OcUjIYtvfNuLei58UHecBF4brwYaCrRbngPRGHy62hvhb8
 B4Jqdy1cyV3LYAi+FSDd8gXn6IQ6oslT8h/qUCQn8lcpI79rXoQxfjBhm0BuLHzxrEoCl5sj6YO
 ECb+l2ZdgcYe+d78Gu5/UIkL7W+GOPnRy7kaUWy1LPzcEHURTHAZJNklwPBEDUh1njFdTHQmXZx
 LQFVxGteZPB9cY1soQ1w/t1O3pdlU8t2ZYLYre2CKQAoJNQmYug8UVD71aGSxXFiBENIQE1X3CN
 eH+bnhA==
X-Google-Smtp-Source: AGHT+IEu6ORaGuj4DJrE7GElQTVujlfFQGUeTayvOi8xrPpM6BqKCKX9xJUAUwKDm4VVmAvWXayPnw==
X-Received: by 2002:a17:903:440c:b0:220:cd9f:a180 with SMTP id
 d9443c01a7336-22df35eebb2mr22408655ad.53.1745974727485; 
 Tue, 29 Apr 2025 17:58:47 -0700 (PDT)
Received: from [10.211.247.102] ([216.221.25.44])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22db4dc75besm110049555ad.61.2025.04.29.17.58.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Apr 2025 17:58:46 -0700 (PDT)
Message-ID: <226e9c93-f2c1-4fea-9ae8-a313df5bd61e@broadcom.com>
Date: Tue, 29 Apr 2025 17:59:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/vmwgfx: Fix Host-Backed userspace on Guest-Backed
 kernel
To: Ian Forbes <ian.forbes@broadcom.com>, dri-devel@lists.freedesktop.org
Cc: bcm-kernel-feedback-list@broadcom.com, zack.rusin@broadcom.com,
 martin.krastev@broadcom.com
References: <20250429203427.1742331-1-ian.forbes@broadcom.com>
From: Maaz Mombasawala <maaz.mombasawala@broadcom.com>
Content-Language: en-US
In-Reply-To: <20250429203427.1742331-1-ian.forbes@broadcom.com>
Content-Type: text/plain; charset=UTF-8
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

On 4/29/25 13:34, Ian Forbes wrote:
> Running 3D applications with SVGA_FORCE_HOST_BACKED=1 or using an
> ancient version of mesa was broken because the buffer was pinned in
> VMW_BO_DOMAIN_SYS and could not be moved to VMW_BO_DOMAIN_MOB during
> validation.
> 
> The compat_shader buffer should not pinned.
> 
> Fixes: 668b206601c5 ("drm/vmwgfx: Stop using raw ttm_buffer_object's")
> Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_shader.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c b/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c
> index 7fb1c88bcc47..69dfe69ce0f8 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c
> @@ -896,7 +896,7 @@ int vmw_compat_shader_add(struct vmw_private *dev_priv,
>  		.busy_domain = VMW_BO_DOMAIN_SYS,
>  		.bo_type = ttm_bo_type_device,
>  		.size = size,
> -		.pin = true,
> +		.pin = false,
>  		.keep_resv = true,
>  	};
>  

Looks good.

Reviewed-by: Maaz Mombasawala <maaz.mombasawala@broadcom.com>

-- 
Maaz Mombasawala <maaz.mombasawala@broadcom.com>
