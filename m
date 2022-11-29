Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E02BF63C903
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 21:13:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 643AF10E24B;
	Tue, 29 Nov 2022 20:13:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFB4610E24B
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 20:13:15 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id c129so16528950oia.0
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 12:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=qAZcMqSiLOnrB/y0CJ76qNXOhphHB04hIWWkiOOhBWo=;
 b=TECpmFPT9bH8khmU5jnle3NB2u05TK83SU5wluwX8C52w+okSX4vleudKyxwU2jZFl
 SLQM981YdXg6f4z+kzwE9RlJZuvF2nF1EqufaAx7j0UjRB21LFA2iTJb+a1uI2qU5umo
 3CmPmYfJHdgR2ChJeToSTelJXeQhEsynPWd3f9/P6chEXjcHW9bfRQh0KKGd0CL4YwpC
 w0D93FxdMPTYwHgrDxWWj+4qmiiDdJY2vvaXYwDSK3uhpomhuu2ayZPDkKD3QgPyccbv
 tXDQsGX4sT2VUfgu28A/WGYNhKVWvONvb5wDcZrFVp3zapQ83RoTPI7wabV6JJh70Lib
 mjhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qAZcMqSiLOnrB/y0CJ76qNXOhphHB04hIWWkiOOhBWo=;
 b=J++S+DHADnhMRFF5gkJLdyWjQLUZ3cSZE8pCvySjyhFKj/xd4YXxUjKfM8ZqRFQ10d
 +G1rtGaeA0znpOeXTTu7AbwY6NfQe4oYvDf/gCXvuT89qEBHhc1j1PgTPQfDS9t5isWC
 1jsgARddjdsXhu53t/mnoRYH0bd+tFbji1PhgF3fBrb9XPD8TGCRWROxZydkKo4QDlFf
 pJt/k9BbHi7LrF4xiWl1ImWMb6CjyhqUuX8pTS1F4UmUELQUo4QIEuq/DN0q6knVcAkM
 70dsZQGlM4toh68gJM9CcqNT2L5TK0lb3YX4xm+HRWs+B5WN3PoII1Hbv7dDvNxxiJMS
 gAqA==
X-Gm-Message-State: ANoB5pkxjoD560y4fGU95pcuPLpK+c6grB3vhJQ30mxqOrCzWwFi13qQ
 RaT0sA2/ewNE7IY+9J6+mbs=
X-Google-Smtp-Source: AA0mqf5Ck3QosPD7Tun8zUZgP6quzOUAsBrrpm59KVtcNgqflrTIwbEToothH20Ysb5tXovhdb0RgA==
X-Received: by 2002:a05:6808:243:b0:359:f5bc:cb05 with SMTP id
 m3-20020a056808024300b00359f5bccb05mr17741503oie.230.1669752794983; 
 Tue, 29 Nov 2022 12:13:14 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 y66-20020a4a4545000000b0049f0671a23asm5865650ooa.9.2022.11.29.12.13.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 12:13:14 -0800 (PST)
Date: Tue, 29 Nov 2022 12:13:13 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [1/2] drm/shmem-helper: Remove errant put in error path
Message-ID: <20221129201149.GA2131686@roeck-us.net>
References: <20221129200242.298120-2-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221129200242.298120-2-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 open list <linux-kernel@vger.kernel.org>, stable@vger.kernel.org,
 Eric Anholt <eric@anholt.net>,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 29, 2022 at 12:02:41PM -0800, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> drm_gem_shmem_mmap() doesn't own this reference!
> 

I think the impact should be explained further.

> Fixes: 2194a63a818d ("drm: Add library for shmem backed GEM objects")
> Cc: stable@vger.kernel.org
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index 35138f8a375c..110a9eac2af8 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -623,7 +623,6 @@ int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shmem, struct vm_area_struct
>  
>  	ret = drm_gem_shmem_get_pages(shmem);
>  	if (ret) {
> -		drm_gem_vm_close(vma);
>  		return ret;
>  	}

Drop the now unnecessary { }

Also, consider adding Reported-by: and possibly Suggested-by:.

Thanks,
Guenter
