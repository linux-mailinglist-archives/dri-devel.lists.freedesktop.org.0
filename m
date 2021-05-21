Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B9938C9BB
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 17:04:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAD836E1BA;
	Fri, 21 May 2021 15:04:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 280AD6E1BA
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 15:04:08 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id j14so19653699wrq.5
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 08:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=XPTUbv0/6jYMrHJc7+Vnsbn82vQQf6SolLh1SnMpMIU=;
 b=kkAzEkyX4gQmUUmGWqU/874mq/duCVUptZ0ktObZyG3WC6TCYPVZuml9g8F+RfqgvK
 gwaru/9o+6OQWbhHkF6g9g7Tg3m/kuTVI6RhS3pWdqFxGTlneWHXvydOzeR/ooqQKbrh
 KqFQUd7jAvESsQtUX25gGXe2fc9Y4LUC1ntug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XPTUbv0/6jYMrHJc7+Vnsbn82vQQf6SolLh1SnMpMIU=;
 b=ai80ml68muNOXc0CqZusSVPhR4ZGGgeYO7T+PLPFnsTuiweRNBlcsPSEYFfgvIdkIn
 1Foo+xDiDidiKmA2gFeO72Dy/NfAkAUb2xvZlEMc42fLmrlbsZWUQDFVMWFK8iW3svJ5
 B6EVC9LDLbTIRJUaqWHKbrRKx5r+yLtpQr7MvVQLqjzWTuzZA/2ZiG6AumRFyPtrXx9x
 6Lrbmk98HFZfz9ZcpMagklOHyIPb3BBzLNqeo5/15SARFDjWeDg2de56z/XIoDekalQF
 n4J+2QzOGNUDCegb5BINyPDqcVTqGaXNGPHcoyartuM8MlooujN8TSoFVZmL4wUv0zU1
 GN9w==
X-Gm-Message-State: AOAM532qVeAhoe7HQ4iAyAuz1kXPb5VzwLO1cyXigaWIV466wX9hn20L
 +DawoUlyz4IZCZ+ibuRSAD4G6bCJMaNQJQ==
X-Google-Smtp-Source: ABdhPJxBYq6Jx+1sig0f4LAKu0Bf9yHfLz0lT4YmEqHYDcckDAK53Avbc9PxKNOrq7uNsSF7smPY7Q==
X-Received: by 2002:adf:dd4c:: with SMTP id u12mr10156648wrm.224.1621609446914; 
 Fri, 21 May 2021 08:04:06 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id e20sm12614180wme.26.2021.05.21.08.04.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 May 2021 08:04:06 -0700 (PDT)
Date: Fri, 21 May 2021 17:03:40 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/gem: Tiny kernel clarification for
 drm_gem_fence_array_add
Message-ID: <YKfLzLUIcesYKsfr@phenom.ffwll.local>
References: <20210521091057.1664425-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210521091057.1664425-1-daniel.vetter@ffwll.ch>
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
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 21, 2021 at 11:10:57AM +0200, Daniel Vetter wrote:
> Spotted while trying to convert panfrost to these.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>

Cc: Emma Anholt <emma@anholt.net>

As original author of these.
-Daniel

> ---
>  drivers/gpu/drm/drm_gem.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 9989425e9875..e5dc98425896 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -1312,6 +1312,9 @@ EXPORT_SYMBOL(drm_gem_unlock_reservations);
>   * @fence_array: array of dma_fence * for the job to block on.
>   * @fence: the dma_fence to add to the list of dependencies.
>   *
> + * This functions consumes the reference for @fence both on success and error
> + * cases.
> + *
>   * Returns:
>   * 0 on success, or an error on failing to expand the array.
>   */
> -- 
> 2.31.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
