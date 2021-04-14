Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A435935F0F8
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 11:43:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4720E6E48B;
	Wed, 14 Apr 2021 09:43:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B97846E48B
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 09:43:50 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id 12so10244053wmf.5
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Apr 2021 02:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=QB/DMc3p9ovLa/E22BONeghLuOVN9yo6Hi/60qxKVLE=;
 b=L80apUtjNF0fmduSaJ0bU2BjhV9okvP5vqIKfK7RfyNwenaHtN0PJ4mogqoQgJKIhz
 ejKbinuH2Q8QpcmGu47fyLoLK8ZSXX2Kv/2EEIosYkF7nRjcDcPNmo5ncknmFRwvF6A4
 pAUQ21jIgRzhpJXS0kz85iy5mq899ehVXy2+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QB/DMc3p9ovLa/E22BONeghLuOVN9yo6Hi/60qxKVLE=;
 b=YWsTi4WJI9SVU1aoqDWkSrqPt6DSmhXtgmT+v4vQSa5stG3ASIiHIRuM+LqTdlACd6
 BRZNKRkSdwoDvf8LxCJL+IGZm3qhIvsDATq4OawFRlbVYfz7LtBAq0Aoon+pLpFxdVyW
 IblzbyEYrkG06wqejR7P8RD7OLzwo9p0HbKAinkXx0J+EYlMGf6lFD8ijRLQ7OS3MwYk
 K5Aoecnv550D3sAz/Jivpd307ZLIoiAd2+n8skHazX8BBWgqYjowiVt8hJl39F4bgoFr
 aujRc+Hi2dKVcGsH7/j/hagIoQKa1Xm5pSvo4t6dmjfIXqL4HeEumKxjeYGH3qakQffP
 gpEA==
X-Gm-Message-State: AOAM532QFTSm4cYj19RIP9BDYR5ZcRLTAoQFtbK7XC7U3/3GSz5MR8RC
 2PxCXmHvw9yuQ4OD5huC3oiETw==
X-Google-Smtp-Source: ABdhPJxId4D2LZqCNGVCBzTuTGD0dKyVUF0LLW5rCepPIydsZlXWSbbq0kcbZIqdhQS6BnRMNHrvaQ==
X-Received: by 2002:a7b:c948:: with SMTP id i8mr2134573wml.107.1618393429392; 
 Wed, 14 Apr 2021 02:43:49 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u9sm4446918wmq.30.2021.04.14.02.43.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Apr 2021 02:43:48 -0700 (PDT)
Date: Wed, 14 Apr 2021 11:43:46 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Melissa Wen <melissa.srw@gmail.com>
Subject: Re: [PATCH v3 1/4] drm/vkms: init plane using
 drmm_universal_plane_alloc
Message-ID: <YHa5UpMsPhpxHsXS@phenom.ffwll.local>
References: <cover.1618299945.git.melissa.srw@gmail.com>
 <b0fed269b94099746fc040605aa8dfa376ba5908.1618299945.git.melissa.srw@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b0fed269b94099746fc040605aa8dfa376ba5908.1618299945.git.melissa.srw@gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Sumera Priyadarsini <sylphrenadin@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 13, 2021 at 04:50:08AM -0300, Melissa Wen wrote:
> By using drmm_universal_plane_alloc instead of
> drm_universal_plane_init, we let the DRM infrastructure handles
> resource allocation and cleanup. We can also get rid of some
> code repetitions for plane cleanup, improving code maintainability
> in vkms.
> 
> Signed-off-by: Melissa Wen <melissa.srw@gmail.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/vkms/vkms_drv.h    |  8 ++++++--
>  drivers/gpu/drm/vkms/vkms_output.c | 19 +++++--------------
>  drivers/gpu/drm/vkms/vkms_plane.c  | 29 +++++++++++------------------
>  3 files changed, 22 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
> index 35540c7c4416..70fb79621617 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.h
> +++ b/drivers/gpu/drm/vkms/vkms_drv.h
> @@ -37,6 +37,10 @@ struct vkms_plane_state {
>  	struct vkms_composer *composer;
>  };
>  
> +struct vkms_plane {
> +	struct drm_plane base;
> +};
> +
>  /**
>   * vkms_crtc_state - Driver specific CRTC state
>   * @base: base CRTC state
> @@ -114,8 +118,8 @@ int vkms_crtc_init(struct drm_device *dev, struct drm_crtc *crtc,
>  
>  int vkms_output_init(struct vkms_device *vkmsdev, int index);
>  
> -struct drm_plane *vkms_plane_init(struct vkms_device *vkmsdev,
> -				  enum drm_plane_type type, int index);
> +struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
> +				   enum drm_plane_type type, int index);
>  
>  /* CRC Support */
>  const char *const *vkms_get_crc_sources(struct drm_crtc *crtc,
> diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
> index f5f6f15c362c..6979fbc7f821 100644
> --- a/drivers/gpu/drm/vkms/vkms_output.c
> +++ b/drivers/gpu/drm/vkms/vkms_output.c
> @@ -39,7 +39,7 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
>  	struct drm_connector *connector = &output->connector;
>  	struct drm_encoder *encoder = &output->encoder;
>  	struct drm_crtc *crtc = &output->crtc;
> -	struct drm_plane *primary, *cursor = NULL;
> +	struct vkms_plane *primary, *cursor = NULL;
>  	int ret;
>  	int writeback;
>  
> @@ -49,15 +49,13 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
>  
>  	if (vkmsdev->config->cursor) {
>  		cursor = vkms_plane_init(vkmsdev, DRM_PLANE_TYPE_CURSOR, index);
> -		if (IS_ERR(cursor)) {
> -			ret = PTR_ERR(cursor);
> -			goto err_cursor;
> -		}
> +		if (IS_ERR(cursor))
> +			return PTR_ERR(cursor);
>  	}
>  
> -	ret = vkms_crtc_init(dev, crtc, primary, cursor);
> +	ret = vkms_crtc_init(dev, crtc, &primary->base, &cursor->base);
>  	if (ret)
> -		goto err_crtc;
> +		return ret;
>  
>  	ret = drm_connector_init(dev, connector, &vkms_connector_funcs,
>  				 DRM_MODE_CONNECTOR_VIRTUAL);
> @@ -100,12 +98,5 @@ int vkms_output_init(struct vkms_device *vkmsdev, int index)
>  err_connector:
>  	drm_crtc_cleanup(crtc);
>  
> -err_crtc:
> -	if (vkmsdev->config->cursor)
> -		drm_plane_cleanup(cursor);
> -
> -err_cursor:
> -	drm_plane_cleanup(primary);
> -
>  	return ret;
>  }
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> index 6d310d31b75d..135140f8e87a 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -86,7 +86,6 @@ static void vkms_plane_reset(struct drm_plane *plane)
>  static const struct drm_plane_funcs vkms_plane_funcs = {
>  	.update_plane		= drm_atomic_helper_update_plane,
>  	.disable_plane		= drm_atomic_helper_disable_plane,
> -	.destroy		= drm_plane_cleanup,
>  	.reset			= vkms_plane_reset,
>  	.atomic_duplicate_state = vkms_plane_duplicate_state,
>  	.atomic_destroy_state	= vkms_plane_destroy_state,
> @@ -191,18 +190,14 @@ static const struct drm_plane_helper_funcs vkms_primary_helper_funcs = {
>  	.cleanup_fb		= vkms_cleanup_fb,
>  };
>  
> -struct drm_plane *vkms_plane_init(struct vkms_device *vkmsdev,
> -				  enum drm_plane_type type, int index)
> +struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
> +				   enum drm_plane_type type, int index)
>  {
>  	struct drm_device *dev = &vkmsdev->drm;
>  	const struct drm_plane_helper_funcs *funcs;
> -	struct drm_plane *plane;
> +	struct vkms_plane *plane;
>  	const u32 *formats;
> -	int ret, nformats;
> -
> -	plane = kzalloc(sizeof(*plane), GFP_KERNEL);
> -	if (!plane)
> -		return ERR_PTR(-ENOMEM);
> +	int nformats;
>  
>  	if (type == DRM_PLANE_TYPE_CURSOR) {
>  		formats = vkms_cursor_formats;
> @@ -214,16 +209,14 @@ struct drm_plane *vkms_plane_init(struct vkms_device *vkmsdev,
>  		funcs = &vkms_primary_helper_funcs;
>  	}
>  
> -	ret = drm_universal_plane_init(dev, plane, 1 << index,
> -				       &vkms_plane_funcs,
> -				       formats, nformats,
> -				       NULL, type, NULL);
> -	if (ret) {
> -		kfree(plane);
> -		return ERR_PTR(ret);
> -	}
> +	plane = drmm_universal_plane_alloc(dev, struct vkms_plane, base, 1 << index,
> +					   &vkms_plane_funcs,
> +					   formats, nformats,
> +					   NULL, type, NULL);
> +	if (IS_ERR(plane))
> +		return plane;
>  
> -	drm_plane_helper_add(plane, funcs);
> +	drm_plane_helper_add(&plane->base, funcs);
>  
>  	return plane;
>  }
> -- 
> 2.30.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
