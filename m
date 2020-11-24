Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B83E32C29C4
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 15:35:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D87BB89FCA;
	Tue, 24 Nov 2020 14:35:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84D1589FCA
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 14:35:29 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id 64so9129991wra.11
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Nov 2020 06:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Rbfn0budLHmIrbAEQnbX0TB1KJiCFqQBLaK3ZTepOkg=;
 b=lfoHbkRXOccRnm6ZSwyBTBhvKD7n6el/1PaaNxyKWLdTLW7WkOYSAZopGIXvtZpTJS
 VrvfJV6OYSub2RevvxuPSZ4OsgKKAkRQjc/dSCa1k591l4FS5A6bXojcL1wGT6ndQSfG
 tBBID15a08BQ0TxE6SlCoan48bRSMnpFSqW5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Rbfn0budLHmIrbAEQnbX0TB1KJiCFqQBLaK3ZTepOkg=;
 b=Pw2tmFo7sC4DUtjXfKur27MhkScvrJ2OYraUi8JdMTKcf4VyiUOFyiLYRX9I7MTv4F
 eKhuw5hkQ6NL9uvs4CdQgXDGogxBFPQoMF0i8YwfFQDBrptJcAxaMXzD5I1aBwJsYJ93
 HFht2vWxMU1xFnGYOr0K3oZ7b6TfRhnxuRnnGZHMkFUmLVlwzAqcOjjQS9cBdhXh4Kex
 9cYn/RhNDUv6P5X2jXLxdOyUSmRBl8WXDLrdhCMInO+YoEtuguqJBhT3jlkz2hIRYSLF
 6bSSuwmhmb6rUKp9T2QYZnQ4eS/AZm2ls2n1d4yli9N9S2eUQSvhsAGsfHryWVeOkC3M
 D7UQ==
X-Gm-Message-State: AOAM532e6ja8+0YypVjul6yYVq/lfrp654/mCU27ohL5nGJP/rFMaWp9
 jMqFb07UR6fNDwIFLIZXui6rTuW5cQtvDg==
X-Google-Smtp-Source: ABdhPJzhsXDiPd1yge7CEjnkD/Y0eyTLt/LbEBto2/cEOQstFbWfBzjevYt9T+1WrrMkZsEHIq7jzQ==
X-Received: by 2002:adf:e544:: with SMTP id z4mr5695704wrm.83.1606228528264;
 Tue, 24 Nov 2020 06:35:28 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w11sm5580132wmg.36.2020.11.24.06.35.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 06:35:27 -0800 (PST)
Date: Tue, 24 Nov 2020 15:35:25 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: fix kernel-doc warnings for SCALING_FILTER
Message-ID: <20201124143525.GO401619@phenom.ffwll.local>
References: <zJEUxNx4GwiY4FnqlVsuXdAWuH624SQ9VfN54NeH5E@cp7-web-043.plabs.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <zJEUxNx4GwiY4FnqlVsuXdAWuH624SQ9VfN54NeH5E@cp7-web-043.plabs.ch>
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>,
 dri-devel@lists.freedesktop.org, Uma Shankar <uma.shankar@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 20, 2020 at 11:06:22AM +0000, Simon Ser wrote:
> This patch fixes the following kernel-doc warnings:
> =

>     /home/simon/src/linux/Documentation/gpu/drm-kms:466: ./drivers/gpu/dr=
m/drm_crtc.c:236: WARNING: Unexpected indentation.
>     /home/simon/src/linux/Documentation/gpu/drm-kms:466: ./drivers/gpu/dr=
m/drm_crtc.c:237: WARNING: Block quote ends without a blank line; unexpecte=
d unindent.
>     /home/simon/src/linux/Documentation/gpu/drm-kms:472: ./drivers/gpu/dr=
m/drm_blend.c:203: WARNING: Unexpected indentation.
>     /home/simon/src/linux/Documentation/gpu/drm-kms:472: ./drivers/gpu/dr=
m/drm_blend.c:204: WARNING: Block quote ends without a blank line; unexpect=
ed unindent.
> =

> Signed-off-by: Simon Ser <contact@emersion.fr>
> Fixes: 5c759eda9b04 ("drm: Introduce plane and CRTC scaling filter proper=
ties")
> Cc: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Cc: Uma Shankar <uma.shankar@intel.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/drm_blend.c |  2 +-
>  drivers/gpu/drm/drm_crtc.c  | 12 ++++++------
>  2 files changed, 7 insertions(+), 7 deletions(-)
> =

> diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
> index ae2234aae93d..5c2141e9a9f4 100644
> --- a/drivers/gpu/drm/drm_blend.c
> +++ b/drivers/gpu/drm/drm_blend.c
> @@ -196,10 +196,10 @@
>   * exposed and assumed to be black).
>   *
>   * SCALING_FILTER:
> - *
>   *     Indicates scaling filter to be used for plane scaler
>   *
>   *     The value of this property can be one of the following:
> + *
>   *     Default:
>   *             Driver's default scaling filter
>   *     Nearest Neighbor:
> diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
> index f927976eca50..74090fc3aa55 100644
> --- a/drivers/gpu/drm/drm_crtc.c
> +++ b/drivers/gpu/drm/drm_crtc.c
> @@ -230,14 +230,14 @@ struct dma_fence *drm_crtc_create_fence(struct drm_=
crtc *crtc)
>   *
>   * 	Setting MODE_ID to 0 will release reserved resources for the CRTC.
>   * SCALING_FILTER:
> - *	Atomic property for setting the scaling filter for CRTC scaler
> + * 	Atomic property for setting the scaling filter for CRTC scaler
>   *
> - *	The value of this property can be one of the following:
> - *	Default:
> - *		Driver's default scaling filter
> - *	Nearest Neighbor:
> - *		Nearest Neighbor scaling filter
> + * 	The value of this property can be one of the following:
>   *
> + * 	Default:
> + * 		Driver's default scaling filter
> + * 	Nearest Neighbor:
> + * 		Nearest Neighbor scaling filter
>   */
>  =

>  /**
> -- =

> 2.29.2
> =

> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
