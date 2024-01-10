Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 321D4829743
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 11:21:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6442210E584;
	Wed, 10 Jan 2024 10:21:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4069210E584
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 10:21:30 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a27e7b70152so74110966b.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 02:21:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1704882088; x=1705486888; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lJgNZQDQ+DIMBe4Tt1iYyaM+/r15yfvqro7593b4SXo=;
 b=HBI3Zpz7xvKTvp3ob743UsTBQ5hN6NKfFBJUwlW4wiCSCkX0BvWkxKRKqIVZ68gdDn
 mpo7M3h5x7DdGJKbM+s5kpdePp8W/NdBGAbYEuzA+W+E0Jt/mhJL64z9LvrwIX59WsOg
 IcYHd5wnPhTHHO4FTmim4Hj9FeESUHSrRNUMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704882088; x=1705486888;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lJgNZQDQ+DIMBe4Tt1iYyaM+/r15yfvqro7593b4SXo=;
 b=DI5RGGAtHoC16E2X9fKoU4BcKHREAf8W5+yaS/NyLmd+sgcNjfjoM/IpHu/5coRUs4
 DIohkI+kB2B8OAdRMgKS1jKnHR4+LE+EtAeVbI9XTy+JV/lUScC6ZBJ8/hKx0nkN+3/n
 MQ7Ze/cAfVK/LH1iI01JPLGFS1TDflpM3yMquDtBpdqpAraFBJFPW+EQHFej/2rsF+jq
 1GXiudGa8NRP/UByn/VvVoWUKkxSe/IGiaJ8e7HT/iE/4ZZUSK5y/PjJGLDAQtioZBnk
 BkeyBNr8UQ9u56MbKQgHvJZ0Me7O4DqjgOhS6hUuSh3eOxxAJGJUHsYyCr+KpmDSR6Lq
 c3yw==
X-Gm-Message-State: AOJu0Yz8l4uqacKLvqeQ+li1DjhtNS83M5F1gkEQIHbkv/ivBMByGvhs
 tB1ez00TF5DM8IkOFzizJOSEuKdhB8DDlg==
X-Google-Smtp-Source: AGHT+IF/+gLmIPesr477HzxbEH5/LNHNu0FjFJfAV8fdqkokzIHVgVI/uFDJGJR8ItzVxC32I+YI/Q==
X-Received: by 2002:a17:906:5381:b0:a27:8258:8f6b with SMTP id
 g1-20020a170906538100b00a2782588f6bmr1051056ejo.5.1704882088567; 
 Wed, 10 Jan 2024 02:21:28 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 p17-20020a170906785100b00a2b09bfb648sm1948838ejm.5.2024.01.10.02.21.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 02:21:28 -0800 (PST)
Date: Wed, 10 Jan 2024 11:21:26 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Julia Zhang <julia.zhang@amd.com>
Subject: Re: [PATCH 1/1] drm/virtio: Implement device_attach
Message-ID: <ZZ5vpoHKhjrpskgY@phenom.ffwll.local>
Mail-Followup-To: Julia Zhang <julia.zhang@amd.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, David Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>,
 Erik Faye-Lund <kusmabite@gmail.com>,
 Marek =?utf-8?B?T2zFocOhaw==?= <marek.olsak@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Honglei Huang <honglei1.huang@amd.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>, Huang Rui <ray.huang@amd.com>
References: <20240110095627.227454-1-julia.zhang@amd.com>
 <20240110095627.227454-2-julia.zhang@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240110095627.227454-2-julia.zhang@amd.com>
X-Operating-System: Linux phenom 6.5.0-4-amd64 
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
Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 amd-gfx@lists.freedesktop.org, Chen Jiqian <Jiqian.Chen@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Marek =?utf-8?B?T2zFocOhaw==?= <marek.olsak@amd.com>,
 Erik Faye-Lund <kusmabite@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 Huang Rui <ray.huang@amd.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Honglei Huang <honglei1.huang@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@redhat.com>,
 virtualization@lists.linux-foundation.org, Chia-I Wu <olvaffe@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 10, 2024 at 05:56:28PM +0800, Julia Zhang wrote:
> drm_gem_map_attach() requires drm_gem_object_funcs.get_sg_table to be
> implemented, or else return ENOSYS. Virtio has no get_sg_table
> implemented for vram object. To fix this, add a new device_attach to
> call drm_gem_map_attach() for shmem object and return 0 for vram object
> instead of calling drm_gem_map_attach for both of these two kinds of
> object.
> 
> Signed-off-by: Julia Zhang <julia.zhang@amd.com>
> ---
>  drivers/gpu/drm/virtio/virtgpu_prime.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virtio/virtgpu_prime.c
> index 44425f20d91a..f0b0ff6f3813 100644
> --- a/drivers/gpu/drm/virtio/virtgpu_prime.c
> +++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
> @@ -71,6 +71,18 @@ static void virtgpu_gem_unmap_dma_buf(struct dma_buf_attachment *attach,
>  	drm_gem_unmap_dma_buf(attach, sgt, dir);
>  }
>  
> +static int virtgpu_gem_device_attach(struct dma_buf *dma_buf,
> +				     struct dma_buf_attachment *attach)
> +{
> +	struct drm_gem_object *obj = attach->dmabuf->priv;
> +	struct virtio_gpu_object *bo = gem_to_virtio_gpu_obj(obj);
> +
> +	if (virtio_gpu_is_vram(bo))
> +		return 0;

You need to reject attach here because these vram buffer objects cannot be
used by any other driver. In that case dma_buf_attach _must_ fail, not
silently succeed.

Because if it silently succeeds then the subsequent dma_buf_map_attachment
will blow up because you don't have the ->get_sg_table hook implemented.

Per the documentation the error code for this case must be -EBUSY, see the
section for the attach hook here:

https://dri.freedesktop.org/docs/drm/driver-api/dma-buf.html#c.dma_buf_ops

Since you're looking into this area, please make sure there's not other
similar mistake in virtio code.

Also can you please make a kerneldoc patch for struct virtio_dma_buf_ops
to improve the documentation there? I think it would be good to move those
to the inline style and then at least put a kernel-doc hyperlink to struct
dma_buf_ops.attach and mention that attach must fail for non-shareable
buffers.

In general the virtio_dma_buf kerneldoc seems to be on the "too minimal,
explains nothing" side of things :-/

Cheers, Sima

> +
> +	return drm_gem_map_attach(dma_buf, attach);
> +}
> +
>  static const struct virtio_dma_buf_ops virtgpu_dmabuf_ops =  {
>  	.ops = {
>  		.cache_sgt_mapping = true,
> @@ -83,7 +95,7 @@ static const struct virtio_dma_buf_ops virtgpu_dmabuf_ops =  {
>  		.vmap = drm_gem_dmabuf_vmap,
>  		.vunmap = drm_gem_dmabuf_vunmap,
>  	},
> -	.device_attach = drm_gem_map_attach,
> +	.device_attach = virtgpu_gem_device_attach,
>  	.get_uuid = virtgpu_virtio_get_uuid,
>  };
>  
> -- 
> 2.34.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
