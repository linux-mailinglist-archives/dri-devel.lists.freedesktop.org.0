Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 235EC55A305
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 22:49:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CB4D10E3C2;
	Fri, 24 Jun 2022 20:49:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 566FE10E1AC
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 20:49:03 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id cw10so7049964ejb.3
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 13:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=4Hm+RwF6zdRTAP4jPbUkFegWvOdyeCN+KoGv/KdQyOQ=;
 b=IbqRHr8pQpzMu6gfF9LxN6XfTvx/Z2IK+Zbycio945d5nIgTnwXNVNK+j4lk/X495z
 yuXBe4k0pIlvnpwAIZ5aNZcZ7xdA4653i+Xo1XsGB8DAuSCJF2kDY1Lcy0UFc0OXRHOm
 xDJ129UaWAVhiGChIz6Qs3E9N4JwBx1Om0jvg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=4Hm+RwF6zdRTAP4jPbUkFegWvOdyeCN+KoGv/KdQyOQ=;
 b=PonEeZ7gAbcWWzT8+/yMowwFK2APU5kFLUkJP0Wf2dzQS6IZWM056puJ8k2W0gy8/d
 d2K2XMdDt7Rmsc9XRl0PcDgHg4B+Wj9+19DFzBgtI8iMm5+id3gjR49Yf06mR+7WIzOk
 RkvOCS4nLwMgWOMi0I0sgVYcmKdjbHdkIgfPoA7lu6uKYpRH5u1C3PEQzS1pVuNB9ghi
 kXQm6N69RVLQvN0hJW05DpWvx4VYwiOOXGORfuZFpQNpQb/1PE2oG5/BpUJj2bUmlNPk
 yU1cpYE87bZhswTFtS5f4Df7/6ZfwyLW3vkZ3T/Sf1BqTVPL8hm3iUr51dqCHs7aXV4V
 W6BA==
X-Gm-Message-State: AJIora9fgADaJi/oKKE0mQfQnCW3bzioe9eBEYQohqb6YCH13b5oqSFp
 Y1kqjXFoh22jcemejIkpTX5GX/TTzMed4g==
X-Google-Smtp-Source: AGRyM1tUC838ztsYx8GI1aLILWxJgp48uXukKVyAcZfd/hrTaM4Z8OcVOEnxZ/ckpyMWLdikl4heVA==
X-Received: by 2002:a17:906:9b92:b0:722:f705:759d with SMTP id
 dd18-20020a1709069b9200b00722f705759dmr839195ejc.745.1656103741909; 
 Fri, 24 Jun 2022 13:49:01 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 d2-20020aa7d682000000b0042dddaa8af3sm2726082edr.37.2022.06.24.13.49.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 13:49:01 -0700 (PDT)
Date: Fri, 24 Jun 2022 22:48:59 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH v3 1/2] drm: Add DRM_GEM_FOPS
Message-ID: <YrYjO1oSUqL8f4xV@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Chris Healy <cphealy@gmail.com>, Rob Clark <robdclark@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>
References: <20220609174213.2265938-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220609174213.2265938-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, freedreno@lists.freedesktop.org,
 Chris Healy <cphealy@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 09, 2022 at 10:42:11AM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> The DEFINE_DRM_GEM_FOPS() helper is a bit limiting if a driver wants to
> provide additional file ops, like show_fdinfo().
> 
> v2: Split out DRM_GEM_FOPS instead of making DEFINE_DRM_GEM_FOPS
>     varardic
> v3: nits
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

We're at three drivers, maybe it'd be better if this is more standardized?
I feel like we're opening a bit a can of worms here where everyone just
has some good odl fashioned fun. It's at least much better documented than
the old property proliferation :-)
-Daniel

> ---
>  include/drm/drm_gem.h | 26 ++++++++++++++++++--------
>  1 file changed, 18 insertions(+), 8 deletions(-)
> 
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index 9d7c61a122dc..87cffc9efa85 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -314,6 +314,23 @@ struct drm_gem_object {
>  	const struct drm_gem_object_funcs *funcs;
>  };
>  
> +/**
> + * DRM_GEM_FOPS - Default drm GEM file operations
> + *
> + * This macro provides a shorthand for setting the GEM file ops in the
> + * &file_operations structure.  If all you need are the default ops, use
> + * DEFINE_DRM_GEM_FOPS instead.
> + */
> +#define DRM_GEM_FOPS \
> +	.open		= drm_open,\
> +	.release	= drm_release,\
> +	.unlocked_ioctl	= drm_ioctl,\
> +	.compat_ioctl	= drm_compat_ioctl,\
> +	.poll		= drm_poll,\
> +	.read		= drm_read,\
> +	.llseek		= noop_llseek,\
> +	.mmap		= drm_gem_mmap
> +
>  /**
>   * DEFINE_DRM_GEM_FOPS() - macro to generate file operations for GEM drivers
>   * @name: name for the generated structure
> @@ -330,14 +347,7 @@ struct drm_gem_object {
>  #define DEFINE_DRM_GEM_FOPS(name) \
>  	static const struct file_operations name = {\
>  		.owner		= THIS_MODULE,\
> -		.open		= drm_open,\
> -		.release	= drm_release,\
> -		.unlocked_ioctl	= drm_ioctl,\
> -		.compat_ioctl	= drm_compat_ioctl,\
> -		.poll		= drm_poll,\
> -		.read		= drm_read,\
> -		.llseek		= noop_llseek,\
> -		.mmap		= drm_gem_mmap,\
> +		DRM_GEM_FOPS,\
>  	}
>  
>  void drm_gem_object_release(struct drm_gem_object *obj);
> -- 
> 2.36.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
