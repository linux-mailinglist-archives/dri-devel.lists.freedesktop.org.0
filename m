Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC6336C602
	for <lists+dri-devel@lfdr.de>; Tue, 27 Apr 2021 14:23:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E428D6E958;
	Tue, 27 Apr 2021 12:23:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A7926E958
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 12:23:08 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 26-20020a05600c22dab029013efd7879b8so5110988wmg.0
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Apr 2021 05:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=0pMESe1z+MsjbhBRHvTQHk6SqcR4Ic+PigvgIgSdX4w=;
 b=j/YIAhHVG51+GO+y7bT1Sg35jUm9Uat83QdrpCqSHZyO3K8wq0n5c9o5EQ3kGNTexF
 XU8SgXOq2P4fvbzGgQmiob6iCbBr2/q6gXd0BPDNeoZ8jgN3Wm0VqAwM5vOq15uWXToW
 GMyTTxbn08cGD8eEAS40PmSaVz8PREoA6FAOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=0pMESe1z+MsjbhBRHvTQHk6SqcR4Ic+PigvgIgSdX4w=;
 b=W18+lguPkV/WOxsFeC8Yg0W3gE94U8DYlBTfYvNp2/1MnATp+en+YRpyUML/L69Kxk
 c7ol003HSctXKzJhk7l1HrEawbm4xnkebinwUFmObkTs0/FOWzlMCZBW+/7iSdnjHDcP
 RVjykcHxJ/tSemrzyj8jOKmiCxaFX3G6INMwBkP/23LhqjoSnLA/t2oVh2lm9NFBA7DW
 vM23eNuFXjpsfiGGaESy58ZePaoq1lgsLtcl+V3REtCg5xYnPQm6o85YtsfhlTrae5I2
 uJCZCiWg+Bm9FhnHWq9Njk9d5LOxvXqMZyJhNGVc5KJeRL1FVlYyC60y1UF53cjxBohY
 BGLA==
X-Gm-Message-State: AOAM53052eiqAEJ2mPj2RniiMLfrjd/f8i3GVdPg20suEYlgjuP97LRV
 RCUMuMW/7GxJEoHvQm6Nj18ycA==
X-Google-Smtp-Source: ABdhPJwmWvSYs4zi3tUhhsyr3/eaD9g6PjtdpY/LhVc/Bh9wuH/cDkbysx+IzGT6qsUoBJgNjHkJkg==
X-Received: by 2002:a1c:1d91:: with SMTP id
 d139mr16655610wmd.101.1619526186919; 
 Tue, 27 Apr 2021 05:23:06 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b202sm2585727wmb.5.2021.04.27.05.23.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 05:23:06 -0700 (PDT)
Date: Tue, 27 Apr 2021 14:23:04 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: Re: [PATCH v3] drm/drm_file.c: Define drm_send_event_helper() as
 'static'
Message-ID: <YIgCKOSIyc1rMkrt@phenom.ffwll.local>
Mail-Followup-To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 outreachy-kernel@googlegroups.com, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org
References: <20210427105503.10765-1-fmdefrancesco@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210427105503.10765-1-fmdefrancesco@gmail.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 outreachy-kernel@googlegroups.com, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 27, 2021 at 12:55:03PM +0200, Fabio M. De Francesco wrote:
> drm_send_event_helper() has not prototype, it has internal linkage and
> therefore it should be defined with storage class 'static'.
> 
> Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>

Applied to drm-misc-next for 5.14, thanks for your patch.
-Daniel

> ---
> 
> Changes from v2: Removed all the other lines in function comment.
> Changes from v1: As suggested by Daniel Vetter, removed unnecessary
> kernel-doc comments.
> 
>  drivers/gpu/drm/drm_file.c | 14 +-------------
>  1 file changed, 1 insertion(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
> index 7efbccffc2ea..d4f0bac6f8f8 100644
> --- a/drivers/gpu/drm/drm_file.c
> +++ b/drivers/gpu/drm/drm_file.c
> @@ -774,19 +774,7 @@ void drm_event_cancel_free(struct drm_device *dev,
>  }
>  EXPORT_SYMBOL(drm_event_cancel_free);
>  
> -/**
> - * drm_send_event_helper - send DRM event to file descriptor
> - * @dev: DRM device
> - * @e: DRM event to deliver
> - * @timestamp: timestamp to set for the fence event in kernel's CLOCK_MONOTONIC
> - * time domain
> - *
> - * This helper function sends the event @e, initialized with
> - * drm_event_reserve_init(), to its associated userspace DRM file.
> - * The timestamp variant of dma_fence_signal is used when the caller
> - * sends a valid timestamp.
> - */
> -void drm_send_event_helper(struct drm_device *dev,
> +static void drm_send_event_helper(struct drm_device *dev,
>  			   struct drm_pending_event *e, ktime_t timestamp)
>  {
>  	assert_spin_locked(&dev->event_lock);
> -- 
> 2.31.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
