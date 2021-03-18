Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB703406C5
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 14:23:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0815B6E8FA;
	Thu, 18 Mar 2021 13:23:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9BEF6E8FA
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 13:23:10 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id e18so5527986wrt.6
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 06:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=CNLbEsygYvTbZT9PzULJxl1QB3RZcsVceKH9loCrMSo=;
 b=KdYIyjKFSDMwf37jeGQYAFBRtDsdKmXi0mEnmAWl95OFaVIQoCzk0gRXIgTrXcVcpA
 pYMRE3JhuiOIrKJogl/SDmvJxFqPa5pCQfbDE9tKYR8+D+a5enhIpk4tyRHpsipnB2wA
 j/4u8iG7y2qFi5tZ8c7IHhlwHKf0L3GXPA1o0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=CNLbEsygYvTbZT9PzULJxl1QB3RZcsVceKH9loCrMSo=;
 b=NEY7ErmM1665UIpe9LmTVlm/9PjFVlyVv/UIEv/xrkBCgyLULp9UJ04dqaFzT6Zlk8
 Dy6a25DNXGrpkWkqcpXJbNGKFhRlOjb8o1E0GV4Mi5DO1wnjnc5ezk5C/mWIAEpQAhuS
 nZQnQ6y8q/9MIdBDs70WVGzv2PeBQMDaJrTN9kBKxMFMJ7HGI5wivAv6JhfEoLMPQZks
 LMg/dyvEfQi8W7u9QjfhNFG5OTZZZeQ89VqhmHpCIYE1E8uiwpx5WCNH6h81wcjVfBF8
 dmm+XmF3DJ84xVIcov9BKPTp6qZ+oe9NBrp/i48aSMD6CPQWc3Vhxs724I/miOkQO5rM
 f0wg==
X-Gm-Message-State: AOAM532bOm7AmnkUq+SFu00kYEFopw8zlRN8PMpNWkBGqYiP2c9EC0MA
 VOLhS53OFxfPBz86ow57fxLY+w==
X-Google-Smtp-Source: ABdhPJxSKL0C3sE7XtJXFumxv/pxpLWfuUI0p4iswqLbyoLJFVV5FzrdyfhmGdnPQvEPv5SkdtR4+A==
X-Received: by 2002:a5d:4203:: with SMTP id n3mr9606351wrq.116.1616073789483; 
 Thu, 18 Mar 2021 06:23:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c9sm2340158wml.42.2021.03.18.06.23.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 06:23:08 -0700 (PDT)
Date: Thu, 18 Mar 2021 14:23:06 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: Re: [PATCH] drm: Few typo fixes
Message-ID: <YFNUOhpMaS6d0af5@phenom.ffwll.local>
Mail-Followup-To: Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rdunlap@infradead.org
References: <20210318103739.27849-1-unixbhaskar@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210318103739.27849-1-unixbhaskar@gmail.com>
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
Cc: tzimmermann@suse.de, airlied@linux.ie, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 18, 2021 at 04:07:39PM +0530, Bhaskar Chowdhury wrote:
> 
> s/instatiated/instantiated/
> s/unreference/unreferenced/
> 
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>

Queued for 5.13 in drm-misc-next, thanks for your patch.
-Daniel

> ---
>  drivers/gpu/drm/drm_property.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_property.c b/drivers/gpu/drm/drm_property.c
> index 6ee04803c362..27c824a6eb60 100644
> --- a/drivers/gpu/drm/drm_property.c
> +++ b/drivers/gpu/drm/drm_property.c
> @@ -43,7 +43,7 @@
>   * property types and ranges.
>   *
>   * Properties don't store the current value directly, but need to be
> - * instatiated by attaching them to a &drm_mode_object with
> + * instantiated by attaching them to a &drm_mode_object with
>   * drm_object_attach_property().
>   *
>   * Property values are only 64bit. To support bigger piles of data (like gamma
> @@ -644,7 +644,7 @@ EXPORT_SYMBOL(drm_property_blob_get);
>   * @id: id of the blob property
>   *
>   * If successful, this takes an additional reference to the blob property.
> - * callers need to make sure to eventually unreference the returned property
> + * callers need to make sure to eventually unreferenced the returned property
>   * again, using drm_property_blob_put().
>   *
>   * Return:
> --
> 2.26.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
