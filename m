Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E16D58DC3E
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 18:39:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94C879AB55;
	Tue,  9 Aug 2022 16:37:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D4DA92F1B
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Aug 2022 16:37:01 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id j15so14948086wrr.2
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Aug 2022 09:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc;
 bh=X6MoPuBxB5LTaIpwHgwbCSWtaGD5GP/fUf8i2jb34y4=;
 b=YYFt5Hvk/GA/aYQDThMEhnkFeG40v5eWaqD5RVCuoCI5uK/07t3E5fR6jL4qn7DEYR
 zViLu6mr7jl7ctZbQDoa9xQZKNKqiA95aqiHa8LJP7h6escYhs0koUmPFts6RhqrXOk/
 yN+220j0woh5fKuBdr+jklN8ZsiBtUlH7QLuY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc;
 bh=X6MoPuBxB5LTaIpwHgwbCSWtaGD5GP/fUf8i2jb34y4=;
 b=RFBUElCYmrghM47ZT9i3d0Bk3xOokM/w1uNdFpkIukn/4HkNgvKFMh0SMn2R7cC/ng
 ooRTa32orbRWk5/bO3Es2MAASMfHnFKoMQTA29aevZKIKunLjTnwwU6r6Ce+xQk7mEqd
 7W3UqQe1zt4zXT9hrkm7CnXqNt4G45m6ghXEYrHQ5fYe6ENMA2IOdCWEOJ19vVxXS98x
 ZyHmoGUhO+2fCA0ShBwYLruDNK3YEALMk0vc9nzFgPeSTZ1TpX/oIG/CNIpWLIUW9xDC
 n1UL0kGMC+avoS/oFaklLKUF2cV5u38GK3kwVXbGOO1KBNvHQKJRk5q5yTX8FAFPdS8J
 ppEg==
X-Gm-Message-State: ACgBeo3dABtlEhNQUN9aosLG3dG9ICOtiVPTuM9bCM0ZckdFBIeiz+1R
 fOUhqgdM1XFxscmBfsaUxn0iOVuLj/YKK9YZ
X-Google-Smtp-Source: AA6agR7rbtu73gmgTkuGQJU/XLaVRYmZEDfYA+1YrhcoZwGgf2aMhYhyzwlzXCnqTQoNUelc9/MxFQ==
X-Received: by 2002:a05:6000:2ab:b0:223:6167:a213 with SMTP id
 l11-20020a05600002ab00b002236167a213mr4039906wry.310.1660063019958; 
 Tue, 09 Aug 2022 09:36:59 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 i204-20020a1c3bd5000000b003a536d5aa2esm9884682wma.11.2022.08.09.09.36.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 09:36:59 -0700 (PDT)
Date: Tue, 9 Aug 2022 18:36:57 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v7 2/2] drm/shmem-helper: Correct doc-comment of
 drm_gem_shmem_get_sg_table()
Message-ID: <YvKNKSqVlc0vwDS/@phenom.ffwll.local>
Mail-Followup-To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@linux.ie>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com
References: <20220630200058.1883506-1-dmitry.osipenko@collabora.com>
 <20220630200058.1883506-3-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220630200058.1883506-3-dmitry.osipenko@collabora.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Osipenko <digetx@gmail.com>, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 30, 2022 at 11:00:58PM +0300, Dmitry Osipenko wrote:
> drm_gem_shmem_get_sg_table() never returns NULL on error, but a ERR_PTR.
> Correct the doc comment which says that it returns NULL on error.
> 
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index 904fc893c905..0b526657fbea 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -663,7 +663,8 @@ EXPORT_SYMBOL(drm_gem_shmem_print_info);
>   * drm_gem_shmem_get_pages_sgt() instead.
>   *
>   * Returns:
> - * A pointer to the scatter/gather table of pinned pages or NULL on failure.
> + * A pointer to the scatter/gather table of pinned pages or an ERR_PTR()-encoded
> + * error code on failure.

There was a conflict here because another patch adjusted this already, but
I fixed it up and merged this to drm-misc-next.

Thanks, Daniel

>   */
>  struct sg_table *drm_gem_shmem_get_sg_table(struct drm_gem_shmem_object *shmem)
>  {
> @@ -689,7 +690,8 @@ EXPORT_SYMBOL_GPL(drm_gem_shmem_get_sg_table);
>   * drm_gem_shmem_get_sg_table() should not be directly called by drivers.
>   *
>   * Returns:
> - * A pointer to the scatter/gather table of pinned pages or errno on failure.
> + * A pointer to the scatter/gather table of pinned pages or an ERR_PTR()-encoded
> + * error code on failure.
>   */
>  struct sg_table *drm_gem_shmem_get_pages_sgt(struct drm_gem_shmem_object *shmem)
>  {
> -- 
> 2.36.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
