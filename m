Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0696F5AF45F
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 21:25:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69C3E10E1D2;
	Tue,  6 Sep 2022 19:25:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C644F10E1D2
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 19:25:22 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 n23-20020a7bc5d7000000b003a62f19b453so10230190wmk.3
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Sep 2022 12:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date; bh=O7HFSBd6XXtgczqxk8rJIEgRQ1dsVZ7RdrRe4zB43BQ=;
 b=W6LImk3qCnRM04osl5Ur9jTV8Nl1Pnmr0Q8v74EVcYgRMeGZoxuj7cW7rcgLX4jrMf
 Eiyos7XlKMjnaJ52wkEG5ubnR6BRrd3VMTPFNCUmMAT2Jb4HTfrS3djtJhyKvAz7j2xw
 JCnw2JfKE0ELWOtcwLu7+o9JrkvzXBCztp1O0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date;
 bh=O7HFSBd6XXtgczqxk8rJIEgRQ1dsVZ7RdrRe4zB43BQ=;
 b=TAymkxgAc1w4EZcct5+uPxp397BOZujmijtgUZvJDJQ1hk7WivfIJHcAILR/WBAYPz
 TkmVHIR2/8UyPK0TdqxPi+JxnAb1OADW8vhoTR48eWmuehoiSlBnDCr/nOrPlk6fWCf8
 MH3d+jNc5D2hO60qHeOQJk5OEtFpSG+WB7lvsy+e3ojey63pY4T9uiiQGhINOBg13iOj
 b+HeCi93ZkNi9nDH2GEOqp7IWpL2IcxFYQ43N/537ti6rbHDv+G0cm1LEToVfS/ICf68
 WkG+EPDELPc/fEmu8MmaWcB1mcksmMBQZl32yanY1XklBXBEyaAuRNl1qaBD9i8Apb3Q
 w/ZA==
X-Gm-Message-State: ACgBeo2LhPNp9ih+F0CSZsDgzm250qdvhJilrx8mAK8VTgGmur2+hYSM
 GmGLeF0DfugXz4uGYDRswUcETQ==
X-Google-Smtp-Source: AA6agR6y8oDo3luv78yosJfIkhgfExQRhucenfJOK7BenFEnE+87Wy3bt6e6H/YvRgAnXmqYxPzIwg==
X-Received: by 2002:a05:600c:3ac6:b0:3a5:c03f:510d with SMTP id
 d6-20020a05600c3ac600b003a5c03f510dmr14693176wms.120.1662492320836; 
 Tue, 06 Sep 2022 12:25:20 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 p8-20020a1c5448000000b003a63a3b55c3sm22643853wmi.14.2022.09.06.12.25.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 12:25:20 -0700 (PDT)
Date: Tue, 6 Sep 2022 21:25:18 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Alisa Khabibrakhmanova <khabibrakhmanova@ispras.ru>
Subject: Re: [PATCH] drm/via: Add new condition to via_dma_cleanup()
Message-ID: <YxeengBAncBqNab0@phenom.ffwll.local>
Mail-Followup-To: Alisa Khabibrakhmanova <khabibrakhmanova@ispras.ru>,
 David Airlie <airlied@linux.ie>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, ldv-project@linuxtesting.org
References: <YuAjDvYey1hhI1AJ@ravnborg.org>
 <20220729090643.240778-1-khabibrakhmanova@ispras.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220729090643.240778-1-khabibrakhmanova@ispras.ru>
X-Operating-System: Linux phenom 5.18.0-4-amd64 
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
Cc: ldv-project@linuxtesting.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 29, 2022 at 12:06:43PM +0300, Alisa Khabibrakhmanova wrote:
> Pointer dev_priv->mmio, which was checked for NULL at via_do_init_map(),
> is passed to via_do_cleanup_map() and is dereferenced there without check.
> 
> The patch adds the condition in via_dma_cleanup() which prevents potential NULL
> pointer dereference.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: 22f579c621e2 ("drm: Add via unichrome support")
> Signed-off-by: Alisa Khabibrakhmanova <khabibrakhmanova@ispras.ru>

This seems to have fallen through cracks, I applied it to drm-misc-next
now.

Thanks for your patch.
-Daniel

> ---
>  drivers/gpu/drm/via/via_dri1.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/via/via_dri1.c b/drivers/gpu/drm/via/via_dri1.c
> index d695d9291ece..691e3ceb0062 100644
> --- a/drivers/gpu/drm/via/via_dri1.c
> +++ b/drivers/gpu/drm/via/via_dri1.c
> @@ -2961,7 +2961,7 @@ int via_dma_cleanup(struct drm_device *dev)
>  		drm_via_private_t *dev_priv =
>  		    (drm_via_private_t *) dev->dev_private;
>  
> -		if (dev_priv->ring.virtual_start) {
> +		if (dev_priv->ring.virtual_start && dev_priv->mmio) {
>  			via_cmdbuf_reset(dev_priv);
>  
>  			drm_legacy_ioremapfree(&dev_priv->ring.map, dev);
> -- 
> 2.34.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
