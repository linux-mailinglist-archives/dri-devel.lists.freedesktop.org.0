Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE5C908793
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 11:35:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2107B10ECB4;
	Fri, 14 Jun 2024 09:35:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="GzCbAnmA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D596610ECB4
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 09:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718357725;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xdJt7+cVLZ5M2lQzrTC0sFKbIvCszz8E/fHGwHxyvpM=;
 b=GzCbAnmA6PXJOLze9zLwaJjMHbt4AIGHTIy7JY/pLqqjrt23Xzj9LapH1XHZlG0NP4pYYL
 yMN9uZgO5YUvaj5Uath2YuEpCFj8oyFoZ4WO8ViYLWTeCQDO/BzbdGx8LGsHe35xDfdRFU
 UVjyHjNNGkoQGkKCSuobTlC79YYJs+Y=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-389-xHRORmepNJKP7_b0S2VRIw-1; Fri, 14 Jun 2024 05:35:24 -0400
X-MC-Unique: xHRORmepNJKP7_b0S2VRIw-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-421292df2adso12701855e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 02:35:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718357723; x=1718962523;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xdJt7+cVLZ5M2lQzrTC0sFKbIvCszz8E/fHGwHxyvpM=;
 b=KFxUW8QevhOgiud9lDEtsOr/NSxcpHLsHBb5iTHocZKuulIwfOJKX2pAJwLKIjZDa4
 Pk16Gljy3hx8jQCcvGIGQYLRl2HfBpTv/2HEmDsxxXUksbxKn6w9VrcJodakaWSC6Vvi
 9X/bci14KBpo0ahSpKgDP/v6ssR2QYTaJiLKHwph039B598OHufwl3zN59SMgfoQBSqa
 nJA95zZid3Jq203K/OIqV72RiDJFkq/oMQKaJShlpd5FrRX1J2Lg5SptIgxCw+RiOtFr
 brW94bvwlxsWAj4Y0jroudzeU67hMNNPPWL+EImhyynn4uVEGF+dcUm6R+IXGaFFwkRe
 OQ3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWsI/b3FfZhr6M9hF6eHHwYjMI9rOs/3f8qEPaIsWHayKWel6qvAYoRVPFN4/10+4BHWo2+vcx4Vz2Akfwb+kriFPOdpkhz3DhuQmix0aM
X-Gm-Message-State: AOJu0Ywna4UCX6uublrTSjXxb/cLZNumGPGm4pBpM42YT3Iom+XD56K7
 XXTJC56aFwrYvcDT+PBHtbi/ue+YyefbVw3UD10oAjNTa1gwS7Vkd2bAfIvQnO0tyy+e6OjMgwl
 Q2s8zpJttUCpzf2NZW5Td9Og1L9c1FVd5AiNrRb5nTRsObyMfJOO/2Vqs5nSDTjjYiQ==
X-Received: by 2002:a7b:c41a:0:b0:421:7b9d:5b9b with SMTP id
 5b1f17b1804b1-42304821171mr19059135e9.15.1718357723216; 
 Fri, 14 Jun 2024 02:35:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGe9EHRho8FXo61eGrPv34AQ567+feP7sbnnVAIN5Dw0SEYP9TPPcNB5desjjcRmD8PIdslsg==
X-Received: by 2002:a7b:c41a:0:b0:421:7b9d:5b9b with SMTP id
 5b1f17b1804b1-42304821171mr19058885e9.15.1718357722864; 
 Fri, 14 Jun 2024 02:35:22 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e?
 ([2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36075104c17sm3813405f8f.106.2024.06.14.02.35.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jun 2024 02:35:22 -0700 (PDT)
Message-ID: <d2f7f2c2-242e-4521-a205-8b19999a565b@redhat.com>
Date: Fri, 14 Jun 2024 11:35:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] drm/panic: Fix uninitialized
 drm_scanout_buffer.set_pixel() crash
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <cover.1718305355.git.geert+renesas@glider.be>
 <4c250d21880ca0b97e41da7b6a101bdf07e9d015.1718305355.git.geert+renesas@glider.be>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <4c250d21880ca0b97e41da7b6a101bdf07e9d015.1718305355.git.geert+renesas@glider.be>
X-Mimecast-Spam-Score: 0
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



On 13/06/2024 21:17, Geert Uytterhoeven wrote:
> No implementations of drm_plane_helper_funcs.get_scanout_buffer() fill
> in the optional drm_scanout_buffer.set_pixel() member.  Hence the member
> may contain non-zero garbage, causing a crash when deferencing it during
> drm panic.
> 
> Fix this by pre-initializing the drm_scanout_buffer object before
> calling drm_plane_helper_funcs.get_scanout_buffer().

Good catch, I don't know how I didn't hit this bug before.
Thanks for the fix.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Fixes: 24d07f114e4ec760 ("drm/panic: Add a set_pixel() callback to drm_scanout_buffer")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>    - New.
> ---
>   drivers/gpu/drm/drm_panic.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index 293d4dcbc80da7ba..fc04ed4e0b399f55 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -582,7 +582,7 @@ static void draw_panic_dispatch(struct drm_scanout_buffer *sb)
>   
>   static void draw_panic_plane(struct drm_plane *plane)
>   {
> -	struct drm_scanout_buffer sb;
> +	struct drm_scanout_buffer sb = { };
>   	int ret;
>   	unsigned long flags;
>   

