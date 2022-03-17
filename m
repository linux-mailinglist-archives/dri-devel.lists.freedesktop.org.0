Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E31644DC35D
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 10:52:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 855A610E064;
	Thu, 17 Mar 2022 09:52:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E505C10E090
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 09:52:07 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id u16so5536662wru.4
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 02:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=POaRQS9wHiia4Bur/ZNyFgG6w/DzK6VqlKPRJcLxxe4=;
 b=KrzSi8nKO7pKPgNtpEPKF9YqbFX0cM8JoAIBhjlOaErnhRTXywx0A3jXuhLZz7gHeE
 5rTYwpmUkA8b3eSrewMV1U9al430nji8sPEY4jAwoeDs92zmJ3gmpAqIOu18gF2hczd8
 LuVLrPsvlimG67NKsQivDvJ7r8irq8ctiaSCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=POaRQS9wHiia4Bur/ZNyFgG6w/DzK6VqlKPRJcLxxe4=;
 b=0uMjybtXcSCejAdjb+GGBlTcSbWakKcKi3KvXsqv7uMaAxGpeF9E+ZT6M2Bsjm8p5p
 UYs/5jVMyQNQbnNj2r7Ew/KU6gfzbjlLHBgPl26ICMz8sRWqV03VPEwSF32Xd6BGk/SO
 zMdROeVu/WZi3uW7hIO7W3jzngtA8hontcxE1A3y027dnWvpB8JsligAoUY0x2q2t+y9
 UvdQFD9JuPDMIZ03G7lDr9Db3kW9dNybuvcCkc8kErqP59nIkniPPqY7uKhPeZOrMPkF
 ypktTYs9fC3IGUhHBMsh9CKF6s6r4JCPfzh4H5S+vUkrFCjM/78WDYYlLq5Dj7tQB4u9
 pHyQ==
X-Gm-Message-State: AOAM5301VaYQbXeD8LcnQCCVTJxg1I7jK9/vdy/3x0r1SZ/34j/O7N57
 wFhmrZDRTB5KxaDw4hA8IiECww==
X-Google-Smtp-Source: ABdhPJyATZD34zYZdIs0F4fYWpfAhHNBTV0m2/c76AvE5MGq0SbbWji3SzI4+bbIwGkmWrNtBaw7Rw==
X-Received: by 2002:adf:e343:0:b0:1f0:7a2:99f2 with SMTP id
 n3-20020adfe343000000b001f007a299f2mr3454528wrj.96.1647510726496; 
 Thu, 17 Mar 2022 02:52:06 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 h13-20020adff18d000000b001f1de9f930esm5278118wro.81.2022.03.17.02.52.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 02:52:05 -0700 (PDT)
Date: Thu, 17 Mar 2022 10:52:04 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Subject: Re: [PATCH v1] drm/shmem-helper: Correct doc-comment of
 drm_gem_shmem_get_sg_table()
Message-ID: <YjMExI9ONMa1AF7v@phenom.ffwll.local>
References: <20220308133401.62340-1-dmitry.osipenko@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220308133401.62340-1-dmitry.osipenko@collabora.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Dmitry Osipenko <digetx@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 08, 2022 at 04:34:01PM +0300, Dmitry Osipenko wrote:
> drm_gem_shmem_get_sg_table() never returns NULL on error, but a ERR_PTR.
> Correct the doc comment which says that it returns NULL on error.
> 
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> ---
>  drivers/gpu/drm/drm_gem_shmem_helper.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
> index 8ad0e02991ca..37009418cd28 100644
> --- a/drivers/gpu/drm/drm_gem_shmem_helper.c
> +++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
> @@ -662,7 +662,7 @@ EXPORT_SYMBOL(drm_gem_shmem_print_info);
>   * drm_gem_shmem_get_pages_sgt() instead.
>   *
>   * Returns:
> - * A pointer to the scatter/gather table of pinned pages or NULL on failure.
> + * A pointer to the scatter/gather table of pinned pages or errno on failure.

Hm usually we write "negative errno" for these, since the error numbers
are defined as positive numbers. Care to respin?

Thanks a lot, Daniel

>   */
>  struct sg_table *drm_gem_shmem_get_sg_table(struct drm_gem_shmem_object *shmem)
>  {
> -- 
> 2.35.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
