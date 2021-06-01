Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A16A43977B5
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 18:13:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D081B6E07B;
	Tue,  1 Jun 2021 16:12:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F8CE6E07B
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jun 2021 16:12:58 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id n4so14971991wrw.3
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Jun 2021 09:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=RTKTEbmxtrsch+/FsTbSgaDR8cW8alqmoHnBJyVa4fU=;
 b=lEZEUX5YalH9qYDfjGWOEnJ+BJcEuS86aYL1qvWP0Uzx9RQMDdbmAGFeRsqHj/0drU
 oR/RmpxVZVrrBiIhhAWzw0Xcc0pUEw2sBg+5959EvGva3BM2wkqf+hj2Ta9Gk8cFjgs5
 v+Huo5Hj1n3Qun+7hxdey42iUoGPBh0uBvjBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=RTKTEbmxtrsch+/FsTbSgaDR8cW8alqmoHnBJyVa4fU=;
 b=ipt+ZOEykNt0RB1E4bUnvfwKQXfr/2siYhf1scuSh3kvytGZPAGkkXN1FbjX1VtF7L
 UwbXlRsrP+xk7OrX1TyccO3CeP0PGwNW3LJo62yjQe4uSSC5Z/N31A6hoSvE/zuBFl0K
 Uuw3RNTvwir/e46oO5s9fO7aSXyRKCtcrTOO4AKK86pHDGG4yGfryDuJMjW7IK7mIW8H
 Qhp3zcdBJ3OOy399Oj5oD2aQjD2Hu/Gdd1q+Rqs9p6QZHMbE7vpZpHAZVtzH2BUtdm1N
 +cwaoLNvCceoo2T1fB6ZTmZIdZNJZxjejbelbTTcFcEqOxNdlegyETAysJDsUxSrJ5TS
 eMSQ==
X-Gm-Message-State: AOAM531W5JxwEKqWJD/gox5QhMChzllFNlmha4MmJa134RzlsYoijg2z
 lTO5IyrUxsnY2j+7p63TlS6xq+zTE8V/9g==
X-Google-Smtp-Source: ABdhPJx9NQM2M7DacpouqiStB2xAgVGDNmo/q2e0z44Mn/8CYlaQzcPV4AL2zZj7Yo2r8a+tqzNMmg==
X-Received: by 2002:adf:f990:: with SMTP id f16mr3658485wrr.340.1622563976810; 
 Tue, 01 Jun 2021 09:12:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w8sm3948891wre.70.2021.06.01.09.12.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 09:12:56 -0700 (PDT)
Date: Tue, 1 Jun 2021 18:12:54 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH] drm: Fix misleading documentation of drm_gem_cma_create()
Message-ID: <YLZchmKujXJoyp1y@phenom.ffwll.local>
Mail-Followup-To: Paul Cercueil <paul@crapouillou.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, list@opendingux.net,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
References: <20210601095405.8975-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210601095405.8975-1-paul@crapouillou.net>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, list@opendingux.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 01, 2021 at 10:54:05AM +0100, Paul Cercueil wrote:
> The backing memory does not necessarily have the writecombine attribute
> set, since commit cf8ccbc72d61 ("drm: Add support for GEM buffers backed
> by non-coherent memory").
> 
> Fixes: cf8ccbc72d61 ("drm: Add support for GEM buffers backed by non-coherent memory")
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/drm_gem_cma_helper.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
> index 4a24af2c5c43..d53388199f34 100644
> --- a/drivers/gpu/drm/drm_gem_cma_helper.c
> +++ b/drivers/gpu/drm/drm_gem_cma_helper.c
> @@ -104,8 +104,7 @@ __drm_gem_cma_create(struct drm_device *drm, size_t size, bool private)
>   * @size: size of the object to allocate
>   *
>   * This function creates a CMA GEM object and allocates a contiguous chunk of
> - * memory as backing store. The backing memory has the writecombine attribute
> - * set.
> + * memory as backing store.
>   *
>   * Returns:
>   * A struct drm_gem_cma_object * on success or an ERR_PTR()-encoded negative
> -- 
> 2.30.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
