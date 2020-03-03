Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A517717714F
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 09:33:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAA77891B4;
	Tue,  3 Mar 2020 08:33:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95224891B4
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Mar 2020 08:33:33 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id t11so3190442wrw.5
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Mar 2020 00:33:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=jGXlJU0eQgCzjZFCDnm9moRkUnZ17jrhoohDk5670JU=;
 b=I/XCBBQwqf6VpBezJHTFsJ6STmDFRGmhRY71URELCeiKXXJL2nqi8FAS4Wr/h9W6tZ
 qZSImfhUXhC2LD6T5ixuSKRvE+dzjPGepZafmi/YnQuyR54au5fyeuhADtUikI5Othxy
 BD8ikK8j9bi1yGdNfU4EqFKp2zz57WKU3ulIc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=jGXlJU0eQgCzjZFCDnm9moRkUnZ17jrhoohDk5670JU=;
 b=Ly4ho1Wm378c2sl/AWmMXy89c2xob48W5WB6IFIR6QECfq1avzrtEQOjDGjVQ3omPa
 WiN7kz2vn3mXF4X881wpMdVZspMJwbovnmPLmNBmAyaVgOZg/F0EgCJmxqVzpahIKjCl
 mxjgca2EKroQE2UrcRzG1lbxgZ8VrpGVkzLdgj3EqBPbJDPJVinZ6WgVh2JiM9JUTY97
 W9nHmTfD74i5QUwvS1oRDtgc1dOJWHPqa1/XDI6K8rWE+scqgd3ovJZi/phs/aKgim15
 qXZbCfi4wwN/V85kS2J2C76RviymfEYUqW/+d2Md2x1FiL7sQICdRtni0q9oLp7jT5Xu
 1tXw==
X-Gm-Message-State: ANhLgQ0/q1JvcDwezoMlADEt68PLFzURTrhH1I4wgdWrYzDLhdG0eyfR
 XzW9YzLjmQOD6t1NjxJdeKFqhQ==
X-Google-Smtp-Source: ADFU+vuEPs7ifRxsMe24TVGJWfbIbPWvo0MMKCbFY5KzV1I4WqD1iytUS+s1mxvhgCWZC5md8CRBKQ==
X-Received: by 2002:a5d:69c6:: with SMTP id s6mr4159063wrw.32.1583224412293;
 Tue, 03 Mar 2020 00:33:32 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b197sm2805478wmd.10.2020.03.03.00.33.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2020 00:33:31 -0800 (PST)
Date: Tue, 3 Mar 2020 09:33:29 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/simple-kms: Fix documentation for
 drm_simple_encoder_init()
Message-ID: <20200303083329.GN2363188@phenom.ffwll.local>
References: <20200303071807.9288-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200303071807.9288-1-tzimmermann@suse.de>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, sam@ravnborg.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 03, 2020 at 08:18:07AM +0100, Thomas Zimmermann wrote:
> Brings the documentation of drm_simple_encoder_init() in sync with the
> function's signature.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: 63170ac6f2e8 ("drm/simple-kms: Add drm_simple_encoder_{init,create}()")
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> ---
>  drivers/gpu/drm/drm_simple_kms_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_simple_kms_helper.c b/drivers/gpu/drm/drm_simple_kms_helper.c
> index 5a2abe2dea3e..2fab80aaf52e 100644
> --- a/drivers/gpu/drm/drm_simple_kms_helper.c
> +++ b/drivers/gpu/drm/drm_simple_kms_helper.c
> @@ -40,7 +40,7 @@ static const struct drm_encoder_funcs drm_simple_encoder_funcs_cleanup = {
>  /**
>   * drm_simple_encoder_init - Initialize a preallocated encoder
>   * @dev: drm device
> - * @funcs: callbacks for this encoder
> + * @encoder: the encoder to initialize
>   * @encoder_type: user visible type of the encoder
>   *
>   * Initialises a preallocated encoder that has no further functionality.

btw reading this I just realized ... who does the kfree on the memory
containing the encoder? The ->destroy hook doesn't do that, and without
that the only other option thus far is devm_kzalloc, which is wrong.
drmm_kzalloc would fix this, but we don't have that yet.

How does this work? Maybe add a FIXME note that right now this can only
really be used if the encoder is embedded into something else that's
getting freed ...
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
