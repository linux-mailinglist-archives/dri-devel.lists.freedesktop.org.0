Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71327198ECD
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 10:46:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 277BF6E2C8;
	Tue, 31 Mar 2020 08:46:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D122889E1A
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 08:46:06 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id a25so24880030wrd.0
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 01:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=bllUnVAY6t6DiEc/52hg4CLzdTP9Psy85hgjEAVb1SA=;
 b=LfoLWw6R8QWSImyjRgTbWS0w8UIr5A6t7+Gk7ADGTxv6TENOZGkktD7vbnQnbqIDY5
 ZIFIu36BmbvhhAHxfCM+39XhN/yplGmSjM63ahnjFAYiLzvWT+SsrP23ChNgYBrgTZBb
 9NxwShfku1xXBg5jxZVW6jwnM40GlFGpcx3Vw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=bllUnVAY6t6DiEc/52hg4CLzdTP9Psy85hgjEAVb1SA=;
 b=JFHhbMW/E7va8O/044DctULMOf9CPdkrht3ba4306yvxOG98yr7HnCRZY4YWtt+WY0
 W4H5bXBkJcT9zdG51BrzPKBuht11y5P6AGFJLUaIvXXqDRzbanBKCG4vaGsrBxAYblMa
 d4ZiPF0tTx+hs6cx6SBJKTDAUNrrIPMTKPjpdsmMLoe8GHLKGVEBzAz1kdYjFJloctMl
 X8faQFytWJgcinWUXn/S1zbmPad64eKk25PDX3v2BqgWlweTfjbkl78Q07STGAS3zEp3
 oZ0j7NYEa3+C8jfZXUVup7onBfrSuGTd/lqXWaw49qg7K0g8CLCpj0TvP3XkHMpDdbd7
 G2Vg==
X-Gm-Message-State: ANhLgQ1yE54u/or/aMJ/JtNiRAOEwBpKUiK0wjsk8gtdxdqQVVuUUKln
 OBKsQInfX2gIvttMEeXtjdeJQg==
X-Google-Smtp-Source: ADFU+vvp6p9rK4La4oysQCQSOdQw8L+Yqnqtk5sh0PKr/p+28RdIuCxAESLl926+AD3sWXZRpQh0JA==
X-Received: by 2002:adf:9071:: with SMTP id
 h104mr19442641wrh.359.1585644365488; 
 Tue, 31 Mar 2020 01:46:05 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s11sm26662659wrw.58.2020.03.31.01.46.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2020 01:46:04 -0700 (PDT)
Date: Tue, 31 Mar 2020 10:46:02 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 1/6] dma-buf: add peer2peer flag
Message-ID: <20200331084602.GJ2363188@phenom.ffwll.local>
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

On the series:

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
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
