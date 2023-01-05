Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C54C65F01E
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 16:32:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F08B10E04E;
	Thu,  5 Jan 2023 15:31:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7145A10E04E
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 15:31:54 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id i9so53244431edj.4
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jan 2023 07:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=w25CRq7X7QjgBESktEU1bcMhIgiIAnO0X2JwG3jpv7o=;
 b=C6cDu+/RJPWocSFLdJZyzSCN20uorOp8GLhpSp39aEbh4DEbSQZ1SofgnwFM7REYki
 w3n/2wdOQA1Xqvbh9CuS/OCzs8Dcl7B/LJiVIMnJQeFGVvbmfFW8Yd4SucomUGeKDHpw
 WJKvm9mJUkZlkxuhC/4gbhQ8bUJ4/27WYqiKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w25CRq7X7QjgBESktEU1bcMhIgiIAnO0X2JwG3jpv7o=;
 b=OKTjGptWk1HN1lHL2fqwwl8GjkJqTLc75zkIEZbG42FZp7b3OHZMMjt3xH4qLKvR+U
 7Ljbk0AyOKU6CV/AWgVMxRHFX+vRvNNJ9nuJJS78mHPQk3wdDaL0mg90LL1iUr+PopE/
 2vcyZAfS2tPo3Ay5kByWt3BGjlv4t9PVTszkuAyWvbt97yQ0Vq3ktR5IUuW+8m7F17I+
 9lMLbx2BUwZY01XvNv7wppPxDR9c1JcOMGX32TBXslLl/rRJ9QWnCXquhPGlCNH5k0YZ
 B+YQ1Cgpa02cqvZM2ttNo3z9yH45WjZwi9H3pT6oN1HUnjGYB5iy1y1X105/Hy+wWHIo
 RXog==
X-Gm-Message-State: AFqh2koCieJp55fVBMA6S8k984tZ7RAVXpvaJC5K/MVKReqvHCm+enac
 JhOKLQadtpTw70TZCWx4jbjdGw==
X-Google-Smtp-Source: AMrXdXu3eF2dkR/y6JRlNEUkke8JcZQH1E7woxI0rS6tqozMIb1lnt67cxrnOlkgD5jw7IlQANIAzA==
X-Received: by 2002:a05:6402:530d:b0:47e:f535:e9a0 with SMTP id
 eo13-20020a056402530d00b0047ef535e9a0mr42430505edb.24.1672932712949; 
 Thu, 05 Jan 2023 07:31:52 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 p25-20020aa7cc99000000b004678b543163sm16011020edt.0.2023.01.05.07.31.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 07:31:51 -0800 (PST)
Date: Thu, 5 Jan 2023 16:31:49 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: Re: [PATCH RFC 1/4] drm/panfrost: Provide a dummy show_fdinfo()
 implementation
Message-ID: <Y7btZUve7rDA/ctq@phenom.ffwll.local>
References: <20230104130308.3467806-1-boris.brezillon@collabora.com>
 <20230104130308.3467806-2-boris.brezillon@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230104130308.3467806-2-boris.brezillon@collabora.com>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Christopher Healy <healych@amazon.com>, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 04, 2023 at 02:03:05PM +0100, Boris Brezillon wrote:
> Provide a dummy show_fdinfo() implementation exposing drm-driver and
> drm-client-id. More stats will be added soon.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_drv.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index 2fa5afe21288..6ee43559fc14 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -515,7 +515,22 @@ static const struct drm_ioctl_desc panfrost_drm_driver_ioctls[] = {
>  	PANFROST_IOCTL(MADVISE,		madvise,	DRM_RENDER_ALLOW),
>  };
>  
> -DEFINE_DRM_GEM_FOPS(panfrost_drm_driver_fops);
> +static void panfrost_show_fdinfo(struct seq_file *m, struct file *f)
> +{
> +	struct drm_file *file = f->private_data;
> +	struct panfrost_file_priv *panfrost_priv = file->driver_priv;
> +
> +	seq_printf(m, "drm-driver:\t%s\n", file->minor->dev->driver->name);
> +	seq_printf(m, "drm-client-id:\t%llu\n", panfrost_priv->sched_entity[0].fence_context);

I think at this point we really need to not just have a document that says
what this should look like, but drm infrastructure with shared code.
Drivers all inventing their fdinfo really doesn't seem like a great idea
to me.
-Daniel

> +}
> +
> +static const struct file_operations panfrost_drm_driver_fops = {
> +	.owner = THIS_MODULE,
> +	DRM_GEM_FOPS,
> +#ifdef CONFIG_PROC_FS
> +	.show_fdinfo = panfrost_show_fdinfo,
> +#endif
> +};
>  
>  /*
>   * Panfrost driver version:
> -- 
> 2.38.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
