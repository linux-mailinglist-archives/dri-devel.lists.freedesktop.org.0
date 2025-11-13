Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C436C56940
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 10:26:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35F2410E7DF;
	Thu, 13 Nov 2025 09:26:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Lf19PLry";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1A7710E7DF
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 09:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1763025997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7R9N/FfFooTvFiuYFzXmBkOjNvxoQlXU1gmzqRI67VA=;
 b=Lf19PLry+QUUqEsBvudI7G2H+7RLQWJR6ux4nhaM81ZL6KWU0OeNFoLHA7rsOPD1Pp1WbL
 obG6qcmttxiKm+ALE75JRCn7Cd5L70LjgVYguElxgl3sSk11KTinF18VNnWJjJQV2lEqFe
 VZWiqQFzCIywN08YvqhAp5sLYW0KiOo=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-424-7ujywUcaPO2V_ZVxFG49iQ-1; Thu, 13 Nov 2025 04:26:34 -0500
X-MC-Unique: 7ujywUcaPO2V_ZVxFG49iQ-1
X-Mimecast-MFC-AGG-ID: 7ujywUcaPO2V_ZVxFG49iQ_1763025993
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-429c95fdba8so359885f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Nov 2025 01:26:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763025993; x=1763630793;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7R9N/FfFooTvFiuYFzXmBkOjNvxoQlXU1gmzqRI67VA=;
 b=RMLC+FJZMvapKG4XrgdRUTFFR5z5nVbi84tkn/z2FT5TqsahK9W33sl0qBkpHgY707
 fXlb0/A6RSEdhX8asYyK/9Ocz3FyoepUcFGhpcvAfXd6T6G8RjbIBO8RUPRkwy9YyIOS
 g1nRSw/hj/zEcXSL9jHFW8gltp82gQMeyygeUBoT+p6bodUjY3G3JQq38ZBnZtgseFh9
 ur5k5Z2seT74R0dYzG8wuvFei5MjBEDOJLRxCPbFMyFJR0y+O5fJekrZVjyBokMxywkL
 mibcN1mAX5LOPSntMRHGGWedt2kkAm78af7ucxKQUrqt0vNo24zdBUVwx2qYetKbTRAO
 AAAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkplg44a2zp30LNv/gRdVdGQK4OM4esmsffwqyofKFo/jZnDEfWA84jQcadjhYdG73Qf3NtHYGSCg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwyGh8tDbJBmH+LxLVVwjQ+QnUOZUwEo5L/tmo6rNuCWGluhK60
 OLhwntB7qYE4Xm2mJZD9qa2tdzf1zcW5Xgq3Lfh5wkAWzndx6E0rrI+Pxqbn+1grg0cQH5H7tNY
 Bs9xZUVdXliOvmm/p1jtOS5i+8bieFZXz8AtwmT3kuqpIiGIUovf576SbirYbvpNVl91wTw==
X-Gm-Gg: ASbGncvOhT2kj+Eo+mywgmb38D13ye4h2mGpl/7/NG2VEX3O+/aXRCx4bfVUUib4kjX
 wjtqn9RY1ZErjchNVVBJAJZrUapXyn+wfRWZE6NZaNgQJCVRPib8bihZvHBQQTg1nnIGaeCuBVG
 mterXAj/hYnxny18sD8f+6F4Nk0ya4QAbJt23SIXzIWC9NJ5IVl1TPDq+dXXPCnZGJeZRZ1s+ij
 WCObXEWqj/Vnw/0cyLDrOTyxeOFdU9Kf/aA9r19hVLAL80p6vq/Nh1nmd5c7BLUj+qJdjFaAc8O
 By7Xiwv5KOlw/UQ186EpOHIzWvmUm6YPgWhCMwhifhetgnmZ93tgtmF1Vx3Vas76IOJf55ZqULe
 00O0hYHoAKNrm298FpWqINmF7fLAKZrkyd8dtVgs=
X-Received: by 2002:a05:6000:2509:b0:42b:411b:e487 with SMTP id
 ffacd0b85a97d-42b4bb8b7e4mr4860021f8f.2.1763025992833; 
 Thu, 13 Nov 2025 01:26:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGIRziukj8I4Ak7C1mmiJKyC18raHsWB/NP1HrSjYz442vJL9chJSlokZvO5UV7cH4LppHZuA==
X-Received: by 2002:a05:6000:2509:b0:42b:411b:e487 with SMTP id
 ffacd0b85a97d-42b4bb8b7e4mr4859999f8f.2.1763025992431; 
 Thu, 13 Nov 2025 01:26:32 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b53f0b62dsm2682174f8f.24.2025.11.13.01.26.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Nov 2025 01:26:32 -0800 (PST)
Message-ID: <88d9d0aa-43f1-4629-9f50-5c792b5c7e0d@redhat.com>
Date: Thu, 13 Nov 2025 10:26:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/client: fix MODULE_PARM_DESC string for "active"
To: Randy Dunlap <rdunlap@infradead.org>, dri-devel@lists.freedesktop.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>
References: <20251112010920.2355712-1-rdunlap@infradead.org>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20251112010920.2355712-1-rdunlap@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: eJ8wou3McFey7bz-qk-6aFJqMUt3Jy19lrq3WnwRFpk_1763025993
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

On 12/11/2025 02:09, Randy Dunlap wrote:
> The MODULE_PARM_DESC string for the "active" parameter is missing a
> space and has an extraneous trailing ']' character. Correct these.
> 
> Before patch:
> $ modinfo -p ./drm_client_lib.ko
> active:Choose which drm client to start, default isfbdev] (string)
> 
> After patch:
> $ modinfo -p ./drm_client_lib.ko
> active:Choose which drm client to start, default is fbdev (string)
> 
Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>


> Fixes: f7b42442c4ac ("drm/log: Introduce a new boot logger to draw the kmsg on the screen")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> ---
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Jocelyn Falempe <jfalempe@redhat.com>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> ---
>   drivers/gpu/drm/clients/drm_client_setup.c |    4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> --- linux-next-20251110.orig/drivers/gpu/drm/clients/drm_client_setup.c
> +++ linux-next-20251110/drivers/gpu/drm/clients/drm_client_setup.c
> @@ -13,8 +13,8 @@
>   static char drm_client_default[16] = CONFIG_DRM_CLIENT_DEFAULT;
>   module_param_string(active, drm_client_default, sizeof(drm_client_default), 0444);
>   MODULE_PARM_DESC(active,
> -		 "Choose which drm client to start, default is"
> -		 CONFIG_DRM_CLIENT_DEFAULT "]");
> +		 "Choose which drm client to start, default is "
> +		 CONFIG_DRM_CLIENT_DEFAULT);
>   
>   /**
>    * drm_client_setup() - Setup in-kernel DRM clients
> 

