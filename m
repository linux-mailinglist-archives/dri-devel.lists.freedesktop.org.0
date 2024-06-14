Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71A9D90879C
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 11:36:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 581CE10ECBC;
	Fri, 14 Jun 2024 09:36:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="hmQJdFsu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2103510ECBC
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 09:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1718357795;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KdfeWtRDAuWsZ8j9bLApAvsSD5oNrsJwjHXB/7FcSzc=;
 b=hmQJdFsuFNwvp0uJELvxdRKX4LTK6lW9e7CvKWN5sJGmI45uqeKLs53HB3jS9hK3W4hhbj
 dmnl4DR9UMYZ40Gkkws0BVvAqqkYaz1LbzwzNS4IL+LnNbX7RNF/Il+mFwX7ymAn6RGPZb
 uROedXOGCw3Y98g8Zdqs1ekrEGi63DA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-3-C6V7ipgiNta2zWi2qU3Myw-1; Fri, 14 Jun 2024 05:36:29 -0400
X-MC-Unique: C6V7ipgiNta2zWi2qU3Myw-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-422322e4abaso10527685e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 02:36:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718357788; x=1718962588;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KdfeWtRDAuWsZ8j9bLApAvsSD5oNrsJwjHXB/7FcSzc=;
 b=JCE1wU+TXBlcw9AN8rQCX+XuqjGdU/kEyg7H9aseTcG7sXurh0WFCZAL72wi6f90Dy
 M9OWEaGdAzimCZ1X7N1tslAyaxuTtrMoQYZx571x/1Z99JCtHR/+l22LREAW9lmQFbWA
 lDzOI+yzDnEOQx5DCy6D7yBtIzMpay2JxkTPj5mRgGExdWeKBCkki8PorOaQ/uTZdrx/
 pUwXstyesOUFS3uQK7OuE8pCYMAqqF+ueszQGRdqc/tojmofo1U3RIty/MdX6y7V7Y9C
 /2Qp0JUR4ZKE07zlBcZpsUCmjRmUT2rB0A1l7xRxsLM++2/4rRV2uJC3YiQDrV+H74iD
 zxBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWo0V0F2MA54cKvLlCp4+c9zEEw3Ko7dDC4hRi/I8eL6FKParmUD2EzKJpF+U1TqGZDDkmpjRgnkjFdNJAtUYl50if2h/i/BRSCIJFuE3S1
X-Gm-Message-State: AOJu0YxfLfA6SlsYIst37b96DYp7jISe2Zymxbyq9Jol9IRfvQYMmFYl
 x1JRxtpyf9Qaol+JikbVoN+mKyJA2AiK1CA46VmpS/j32rTMDLqRLwFsByD7jj4kx9BteZysElR
 PB7yFjE2hV6cvVRSj9DatqLoCfdVTs1yRe4M3KBhnXF24gUbb7ACqzMgIX8Bkj1YQ7Q==
X-Received: by 2002:a05:600c:4a9f:b0:422:eee2:572c with SMTP id
 5b1f17b1804b1-422eee257d9mr40054905e9.8.1718357788191; 
 Fri, 14 Jun 2024 02:36:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjxUAkrfgiqF4B9IILJq7eNGszyZUh3YENf1nv29/SYoE7i85RFm0GdV/Ed29jYVD8fE7b5g==
X-Received: by 2002:a05:600c:4a9f:b0:422:eee2:572c with SMTP id
 5b1f17b1804b1-422eee257d9mr40054755e9.8.1718357787860; 
 Fri, 14 Jun 2024 02:36:27 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e?
 ([2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-422f641a65bsm53388225e9.42.2024.06.14.02.36.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jun 2024 02:36:27 -0700 (PDT)
Message-ID: <a60c6382-2c41-49aa-8f79-ee9744f12b4b@redhat.com>
Date: Fri, 14 Jun 2024 11:36:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] drm/panic: Fix off-by-one logo size checks
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <cover.1718305355.git.geert+renesas@glider.be>
 <1c9d02463cef3eac22cfac3ac6d1adad369f367b.1718305355.git.geert+renesas@glider.be>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <1c9d02463cef3eac22cfac3ac6d1adad369f367b.1718305355.git.geert+renesas@glider.be>
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



On 13/06/2024 21:18, Geert Uytterhoeven wrote:
> Logos that are either just as wide or just as high as the display work
> fine.

Sure, that looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Fixes: bf9fb17c6672868d ("drm/panic: Add a drm panic handler")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>    - Rebased.
> ---
>   drivers/gpu/drm/drm_panic.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index fc04ed4e0b399f55..814ef5c20c08ee42 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -472,7 +472,7 @@ static void draw_panic_static_user(struct drm_scanout_buffer *sb)
>   	drm_panic_fill(sb, &r_screen, bg_color);
>   
>   	if ((r_msg.x1 >= drm_rect_width(&r_logo) || r_msg.y1 >= drm_rect_height(&r_logo)) &&
> -	    drm_rect_width(&r_logo) < sb->width && drm_rect_height(&r_logo) < sb->height) {
> +	    drm_rect_width(&r_logo) <= sb->width && drm_rect_height(&r_logo) <= sb->height) {
>   		draw_txt_rectangle(sb, font, logo, logo_lines, false, &r_logo, fg_color);
>   	}
>   	draw_txt_rectangle(sb, font, panic_msg, msg_lines, true, &r_msg, fg_color);

