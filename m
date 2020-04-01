Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C2119AADC
	for <lists+dri-devel@lfdr.de>; Wed,  1 Apr 2020 13:34:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BEB06E922;
	Wed,  1 Apr 2020 11:34:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DB2D6E922
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Apr 2020 11:34:51 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id e9so6791855wme.4
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Apr 2020 04:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=xK3tzxTxkQTfR5JDzqj+R7wEUare7PE5wvI/fahlZE8=;
 b=DRe039WLYQ92YUtWRXBSErdQGEz4CQYstR1pRztgJR9DoJyiZqEZceAq4NOzxiruIs
 g/I+A0/+Hc+TyQs4xlaAV3F5fKCEGbQtGhVqRwgIYD2+CDMdfCKmnZFWC7woGu2GTnQD
 Lqx6l8rSmUI0VWIfRYRcwr07JRAvvYVRqIx4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=xK3tzxTxkQTfR5JDzqj+R7wEUare7PE5wvI/fahlZE8=;
 b=G1TBEU0p94EWTckENGG2LgQwoxy0WHfBpsDDqKYqhirjDOdeXLTfDrHOzKMa62lU4B
 LZ5kfMrPRRpNHW/kBDUvuxZ/h/vT7DI+O0qzy0BvGcSL6qi0hEwrzRWcTgKTO8ENuK9u
 S58t9jBF4HuKmBmC2/oXAaa8yyqVdUgHAkEWXWk0hyZjLFdkkdBh0LoL2LF+wchZcJay
 IvGQEguTDRLV7SIIkUA2Y5XTR9MMZd4U8pxY08MqfpznEH3sPqdwTN9kPqN+vokJHGLs
 MrhNz8sF680AdCLaiHJfc+npZDx0GvmY5OmPyW793VyThcFDdP7Q9YuPAhQDAT2VWB4o
 T1aA==
X-Gm-Message-State: AGi0PuZsXzlgKqN6vZozqO0vWQ1ATgjg9SF6G0wxonQvgmV6aKz0A6Yv
 Eb0Fxn7GT1X6SAM5jbxjdIed/A==
X-Google-Smtp-Source: APiQypIVkMzxuQ369w0EeEgZu+WSVp2DXTahoWIRSBVN2PT86iPiBQ19N6nWHISZG+Uqnw6gIyj9pw==
X-Received: by 2002:a1c:2285:: with SMTP id i127mr4153494wmi.152.1585740890038; 
 Wed, 01 Apr 2020 04:34:50 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w66sm2392664wma.38.2020.04.01.04.34.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Apr 2020 04:34:49 -0700 (PDT)
Date: Wed, 1 Apr 2020 13:34:46 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 1/6] dma-buf: add peer2peer flag
Message-ID: <20200401113446.GR2363188@phenom.ffwll.local>
References: <20200330135536.2997-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200330135536.2997-1-christian.koenig@amd.com>
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 30, 2020 at 03:55:31PM +0200, Christian K=F6nig wrote:
> Add a peer2peer flag noting that the importer can deal with device
> resources which are not backed by pages.
> =

> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> ---
>  drivers/dma-buf/dma-buf.c |  2 ++
>  include/linux/dma-buf.h   | 10 ++++++++++
>  2 files changed, 12 insertions(+)
> =

> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
> index ccc9eda1bc28..570c923023e6 100644
> --- a/drivers/dma-buf/dma-buf.c
> +++ b/drivers/dma-buf/dma-buf.c
> @@ -690,6 +690,8 @@ dma_buf_dynamic_attach(struct dma_buf *dmabuf, struct=
 device *dev,
>  =

>  	attach->dev =3D dev;
>  	attach->dmabuf =3D dmabuf;
> +	if (importer_ops)
> +		attach->peer2peer =3D importer_ops->allow_peer2peer;

So an idea that crossed my mind to validate this, since we need quite some
bad amounts of bad luck if someone accidentally introduces and access to
struct_page in sg lists in some slowpath.

On map_sg, if ->peer2peer is set, we could mangle the struct_page
pointers, e.g. swap high bits for low bits (so that NULL stays NULL). On
unmap_sg we obviously need to undo that, in case the exporter needs those
pointers for its own book-keeping for some reason. I was also pondering
just setting them all to NULL, but that might break some exporters. With
the pointer mangling trick (especially if we flip high for low bits on 64
where this should result in invalid addresses in almost all cases) we
should be able to catch buggy p2p importers quite quickly.

Thoughts? Maybe add as a follow-up patch for testing?
-Daniel
>  	attach->importer_ops =3D importer_ops;
>  	attach->importer_priv =3D importer_priv;
>  =

> diff --git a/include/linux/dma-buf.h b/include/linux/dma-buf.h
> index 1ade486fc2bb..82e0a4a64601 100644
> --- a/include/linux/dma-buf.h
> +++ b/include/linux/dma-buf.h
> @@ -334,6 +334,14 @@ struct dma_buf {
>   * Attachment operations implemented by the importer.
>   */
>  struct dma_buf_attach_ops {
> +	/**
> +	 * @allow_peer2peer:
> +	 *
> +	 * If this is set to true the importer must be able to handle peer
> +	 * resources without struct pages.
> +	 */
> +	bool allow_peer2peer;
> +
>  	/**
>  	 * @move_notify
>  	 *
> @@ -362,6 +370,7 @@ struct dma_buf_attach_ops {
>   * @node: list of dma_buf_attachment, protected by dma_resv lock of the =
dmabuf.
>   * @sgt: cached mapping.
>   * @dir: direction of cached mapping.
> + * @peer2peer: true if the importer can handle peer resources without pa=
ges.
>   * @priv: exporter specific attachment data.
>   * @importer_ops: importer operations for this attachment, if provided
>   * dma_buf_map/unmap_attachment() must be called with the dma_resv lock =
held.
> @@ -382,6 +391,7 @@ struct dma_buf_attachment {
>  	struct list_head node;
>  	struct sg_table *sgt;
>  	enum dma_data_direction dir;
> +	bool peer2peer;
>  	const struct dma_buf_attach_ops *importer_ops;
>  	void *importer_priv;
>  	void *priv;
> -- =

> 2.17.1
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
