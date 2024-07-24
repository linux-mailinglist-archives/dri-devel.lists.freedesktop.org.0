Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5119093B4BA
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2024 18:16:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A71610E74E;
	Wed, 24 Jul 2024 16:16:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="dEGNxeTk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A94F210E755
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 16:16:35 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id
 5614622812f47-3daf0e73a62so2511788b6e.0
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2024 09:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721837795; x=1722442595; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=kKtTi6J8HEB5OCpZPgPDE9GsqwJqSTtYQpQ+3Zz5BCQ=;
 b=dEGNxeTk3tl5+KpzPi3vccXyss80VmiAI50KnKO+59QJFPoFFTjWEudJlHEw0jwvYr
 Iv+aq3MB92LRT2eQ6tlBIiyzO8RWoDs9eQPQ5Irjj0XDt+uss8UD9ic9qPyPqtBKnQz3
 rnvc5CUDkfPDHBme0LdWiZgdWkhAERnth2zp7rsp0FkUZkAkNWNqpemJdZ7M2MFlw29x
 gFGlZ18rIelR/ltADNgVWilftQgpdp/9YiZaHpbTfK1BjUm/+nCZWjjiU6+5277vqXC+
 Mjc7ZNI5bxXxrWEbtxLFXPQ/xqrs1N40wYXsgDW2TT+jCBsvaadsNXR66XdtgaezUvc5
 8l9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721837795; x=1722442595;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kKtTi6J8HEB5OCpZPgPDE9GsqwJqSTtYQpQ+3Zz5BCQ=;
 b=HjOeefkBVArdOlzN78WBnqzHhUoXD74QAFfshFW1batmw09R2C9NetUfK4QeljB7VH
 zWXaCTcPPq5frkNcGEIGdRZvvEU8yFFiNuBGnPEoj0ZqVvXFNh+R8KezYQzNgR1JXuc9
 nNdEiQPGPe6iozQY8BVVxprfz0D4kinMKCCzadXd7JN1RXPYm5nE9i//rFTrODKp+Rx9
 fMydTxbQR9wSmInXmAqlqkD0uWwZ2aesK0wZcjqCWVUaHJbQHrwYKEHWsCMrFsGq0DSe
 fQf5yAsfAKtXNVEVlicLRbB9xFfN9Wuz1Px3Xq3l6ztA+3HSlGzKi3Q9a7hEk3X6e+t6
 W4kw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSvoW2yXEkw0tU34+6IgkgWwER8wd2b2KprkgDJtzFvfvmajDvp30LJItcMiaHGEOGp78rPLw8dhCKkwnIMW4s0Hp2R88UlhiFUl5OpKNM
X-Gm-Message-State: AOJu0YxJVCv5hT+Vjtu6bNeb38/bbSxVY5P7pGABsDeUCFeyszGhMzmj
 NmLmIkOdujpsgPoZj00iTgjVkazlQccz6is/jqKGrBe/fchfyLHoL0rtQs7ktGc=
X-Google-Smtp-Source: AGHT+IGL4mtwKdB32MSZ63+5s36lNy2nWouLYk/6/hosNV4rfjK0ChpvX+4v525bHV4bv4C5KpXHyg==
X-Received: by 2002:a05:6808:2002:b0:3d6:71d4:e90d with SMTP id
 5614622812f47-3db110cb758mr36565b6e.50.1721837794749; 
 Wed, 24 Jul 2024 09:16:34 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:c022:78f5:6e53:c844])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-3dae0990123sm2442748b6e.30.2024.07.24.09.16.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jul 2024 09:16:34 -0700 (PDT)
Date: Wed, 24 Jul 2024 11:16:32 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Marek Vasut <marex@denx.de>
Cc: linux-media@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helge Deller <deller@gmx.de>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Steve Longerbeam <slongerbeam@gmail.com>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH v2 2/2] media: imx: vdic: Introduce mem2mem VDI
 deinterlacer driver
Message-ID: <5aab2235-76cd-4fa6-8957-aed35e83a95e@suswa.mountain>
References: <20240724002044.112544-1-marex@denx.de>
 <20240724002044.112544-2-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240724002044.112544-2-marex@denx.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 24, 2024 at 02:19:38AM +0200, Marek Vasut wrote:
> diff --git a/drivers/staging/media/imx/imx-media-dev.c b/drivers/staging/media/imx/imx-media-dev.c
> index be54dca11465d..a841fdb4c2394 100644
> --- a/drivers/staging/media/imx/imx-media-dev.c
> +++ b/drivers/staging/media/imx/imx-media-dev.c
> @@ -57,7 +57,52 @@ static int imx6_media_probe_complete(struct v4l2_async_notifier *notifier)
>  		goto unlock;
>  	}
>  
> +	imxmd->m2m_vdic[0] = imx_media_mem2mem_vdic_init(imxmd, 0);
> +	if (IS_ERR(imxmd->m2m_vdic[0])) {
> +		ret = PTR_ERR(imxmd->m2m_vdic[0]);
> +		imxmd->m2m_vdic[0] = NULL;
> +		goto unlock;
> +	}
> +
> +	/* MX6S/DL has one IPUv3, init second VDI only on MX6Q/QP */
> +	if (imxmd->ipu[1]) {
> +		imxmd->m2m_vdic[1] = imx_media_mem2mem_vdic_init(imxmd, 1);
> +		if (IS_ERR(imxmd->m2m_vdic[1])) {
> +			ret = PTR_ERR(imxmd->m2m_vdic[1]);
> +			imxmd->m2m_vdic[1] = NULL;
> +			goto uninit_vdi0;
> +		}
> +	}
> +
>  	ret = imx_media_csc_scaler_device_register(imxmd->m2m_vdev);
> +	if (ret)
> +		goto uninit_vdi1;
> +
> +	ret = imx_media_mem2mem_vdic_register(imxmd->m2m_vdic[0]);
> +	if (ret)
> +		goto unreg_csc;
> +
> +	/* MX6S/DL has one IPUv3, init second VDI only on MX6Q/QP */
> +	if (imxmd->ipu[1]) {
> +		ret = imx_media_mem2mem_vdic_register(imxmd->m2m_vdic[1]);
> +		if (ret)
> +			goto unreg_vdic;
> +	}
> +
> +	mutex_unlock(&imxmd->mutex);
> +	return ret;

Since it looks like you're going to do another version of this, could
you change this to return 0;

> +
> +unreg_vdic:
> +	imx_media_mem2mem_vdic_unregister(imxmd->m2m_vdic[0]);
> +	imxmd->m2m_vdic[0] = NULL;
> +unreg_csc:
> +	imx_media_csc_scaler_device_unregister(imxmd->m2m_vdev);
> +	imxmd->m2m_vdev = NULL;
> +uninit_vdi1:
> +	if (imxmd->ipu[1])
> +		imx_media_mem2mem_vdic_uninit(imxmd->m2m_vdic[1]);
> +uninit_vdi0:
> +	imx_media_mem2mem_vdic_uninit(imxmd->m2m_vdic[0]);
>  unlock:
>  	mutex_unlock(&imxmd->mutex);
>  	return ret;

[ snip ]

> +static int ipu_mem2mem_vdic_querycap(struct file *file, void *priv,
> +				     struct v4l2_capability *cap)
> +{
> +	strscpy(cap->driver, "imx-m2m-vdic", sizeof(cap->driver));
> +	strscpy(cap->card, "imx-m2m-vdic", sizeof(cap->card));
> +	strscpy(cap->bus_info, "platform:imx-m2m-vdic", sizeof(cap->bus_info));

These days strscpy() is a magic function where the third parameter is
optional.

	strscpy(cap->driver, "imx-m2m-vdic");
	strscpy(cap->card, "imx-m2m-vdic");
	strscpy(cap->bus_info, "platform:imx-m2m-vdic");

Shazaaam!  Magic!

> +	cap->device_caps = V4L2_CAP_VIDEO_M2M | V4L2_CAP_STREAMING;
> +	cap->capabilities = cap->device_caps | V4L2_CAP_DEVICE_CAPS;
> +
> +	return 0;
> +}

regards,
dan carpenter

