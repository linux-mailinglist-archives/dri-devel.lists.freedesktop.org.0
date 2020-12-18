Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA882DE3AF
	for <lists+dri-devel@lfdr.de>; Fri, 18 Dec 2020 15:09:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 649236E0BF;
	Fri, 18 Dec 2020 14:09:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DEF86E0BF
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 14:09:31 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id t30so2341848wrb.0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Dec 2020 06:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=yDnIPSQWcvMepAojVqRspJryjFn3579Go+ZTdN6VXMY=;
 b=UfycRBOMdVrDH3spAZB7lqVtSVjBpmZDUCBLaWoCYlw2zmEqUdtSb0aPuJUC1CET/2
 fIb9rltQQtgqqweK/XeQoS/jx4oD6dB7fozEx/TQPXp7yZPQgKmBM4OcmpCSbF5p3g5w
 GRK4ZTpyvf7nnU3ui+V3130RqLYE8HQ2W9oIw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=yDnIPSQWcvMepAojVqRspJryjFn3579Go+ZTdN6VXMY=;
 b=HLs3/SRbuSOQfgdcMJ6j1FNAv//KpKlDXezxTYcFUqKsBwZCpVLT6BVvcCe+rMRGv1
 ghCnr8NTHeZGznEb2YgV//gKGtnjxIpN3YpMMXn3o5fp5mYNLq1tAj4sMePunaAzZs6e
 dYr+ygpKsrnUrYByd4zDreJEKHAraHtYe2UL3giQy/X2IlpE5n9r1kj0g5S36XobchQG
 inUyNeofDoQ6AnU8PtnzA1sMCnZttzbVEcdz8Xdlu5JvcNNsi+tmNiIFi1bmR+fYVACw
 2jKKEOIIcyGwQXsAVv3RXiXW9w1dIQoV/w81Oqn/MZrmFcrJgurpOOx3csJClC0V7Zrq
 7kig==
X-Gm-Message-State: AOAM531q9Jr/74nTfTm4juRIgvOfbqvYRAcGBhxUXrmGv56UN4xHRJ64
 lb+GUabz1tLgadj7yciwnL+ARzpHiVhjsQ==
X-Google-Smtp-Source: ABdhPJwOimXegvcZ0Iqzh9BjmIlorJu+D7hkybIVwar2y81t96NaLBQBF9hpnMMBRnedaHS1Fdmpmg==
X-Received: by 2002:a5d:6845:: with SMTP id o5mr4660066wrw.421.1608300569950; 
 Fri, 18 Dec 2020 06:09:29 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id a25sm7339785wmb.25.2020.12.18.06.09.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Dec 2020 06:09:29 -0800 (PST)
Date: Fri, 18 Dec 2020 15:09:27 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH] drm/qxl: don't allocate a dma_address array
Message-ID: <X9y4F7oIqCXt+5l8@phenom.ffwll.local>
References: <20201218134243.110884-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201218134243.110884-1-christian.koenig@amd.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 18, 2020 at 02:42:43PM +0100, Christian K=F6nig wrote:
> That seems to be unused.
> =

> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> Reviewed-by: David Airlie <airlied@redhat.com>

Dave asked me to pull this into drm-next directly, so I've done that.

For next time around please reference the bug reporter and credit them
properly. I've fixed that up while applying.

Cheers, Daniel

> ---
>  drivers/gpu/drm/qxl/qxl_ttm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
> index d8ecfb8b3193..66640f4947bd 100644
> --- a/drivers/gpu/drm/qxl/qxl_ttm.c
> +++ b/drivers/gpu/drm/qxl/qxl_ttm.c
> @@ -116,7 +116,7 @@ static struct ttm_tt *qxl_ttm_tt_create(struct ttm_bu=
ffer_object *bo,
>  	ttm =3D kzalloc(sizeof(struct ttm_tt), GFP_KERNEL);
>  	if (ttm =3D=3D NULL)
>  		return NULL;
> -	if (ttm_dma_tt_init(ttm, bo, page_flags, ttm_cached)) {
> +	if (ttm_tt_init(ttm, bo, page_flags, ttm_cached)) {
>  		kfree(ttm);
>  		return NULL;
>  	}
> -- =

> 2.25.1
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
