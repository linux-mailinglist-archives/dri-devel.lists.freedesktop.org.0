Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB3894E985
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 11:17:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B7CF10E063;
	Mon, 12 Aug 2024 09:16:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="IJzlZ806";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35F0910E063
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 09:16:58 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-530eed61afdso447190e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 02:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1723454216; x=1724059016; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fozpmkVWWoUxRzczgwDre6X/R/fGJO0cgQAfwJipm1Q=;
 b=IJzlZ806aXg5yZna/g5cJq+ULX4Q4fjWvELiT7OBAkFmtdjk+L55/4tM8v8snq3OUd
 sJHQilBDZknj8twsDlUv38c4WqLqEU4w3f42M800Tc0l1qeRpN+nMM+PNcL7Rm6wRELY
 XfO3GKbf2CiDSc5SEIosOqEpNYMu8BPFYLQSA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723454216; x=1724059016;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fozpmkVWWoUxRzczgwDre6X/R/fGJO0cgQAfwJipm1Q=;
 b=R+P4HiymZP+ETjolJ9mABc+TZyq/tNRetSKXkEZyOsmuRMHs5cOyJVxAdVtLzqDXpx
 6pDDVcWoRpDh7HEg9gTzcCk4xvIO7sIr7/Nfzm/8761XWEo54Gm8WFUs6iMDEWB2pDg+
 V6X1NSeiOgweZYszkWaDD8V1TCqzXULOPSjqEasnldl56BtPd6Ha8OO9EMfBo1hJR49T
 kiJTjMdh5fubsQDXlIjEtNw415MtSAmje3HK92JiqxqfOsYWqR54zdwrt8NXiZQyYSW0
 Y8F/9uAV46c2HsmIP72GrnJFNzyzmrKfO8KNxrQWLR4aDrjH799v7b0O6Q2E7JQe/hvj
 /CBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWHDNDITSUwj5mKkKi+wUCZqFqFc3HNsLzAF4blwSbtPqDjssymYl9QsFrrh4wjDRYAtxn49Qdcf4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwkTGIYNvqaIy81Q2nyn/aWFiO18Y0xvy+oWcSLXTauR7sbVDFB
 mO3AnmJUE/PL7+ZpIKqG876z3RV/sgBlHpZBHeDH8ME615VcatRMgwRE87G0bcM=
X-Google-Smtp-Source: AGHT+IHKBjjM9DjOVxrp2iTIQMmX+DJ0sYeTd6fdCEHk+BQHbEmoLJVR94CfcpRFMvbYy+bSd0R12Q==
X-Received: by 2002:a05:6512:3b29:b0:52f:413:30de with SMTP id
 2adb3069b0e04-530eea25cc4mr3498999e87.7.1723454215812; 
 Mon, 12 Aug 2024 02:16:55 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a80bb090253sm216583666b.16.2024.08.12.02.16.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Aug 2024 02:16:55 -0700 (PDT)
Date: Mon, 12 Aug 2024 11:16:53 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Mohammed Anees <pvmohammedanees2003@gmail.com>
Cc: airlied@gmail.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: Add missing documentation for struct
 drm_plane_size_hint
Message-ID: <ZrnTBWq0fpKhCvpB@phenom.ffwll.local>
Mail-Followup-To: Mohammed Anees <pvmohammedanees2003@gmail.com>,
 airlied@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240811101653.170223-1-pvmohammedanees2003@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240811101653.170223-1-pvmohammedanees2003@gmail.com>
X-Operating-System: Linux phenom 6.9.10-amd64 
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

On Sun, Aug 11, 2024 at 06:16:51AM -0400, Mohammed Anees wrote:
> This patch takes care of the following warnings during documentation
> compiling:
> 
> ./include/uapi/drm/drm_mode.h:869: warning: Function parameter or struct member 'width' not described in 'drm_plane_size_hint'
> ./include/uapi/drm/drm_mode.h:869: warning: Function parameter or struct member 'height' not described in 'drm_plane_size_hint'
> 
> Signed-off-by: Mohammed Anees <pvmohammedanees2003@gmail.com>

Applied to drm-misc-next, thanks.
-sima

> ---
>  include/uapi/drm/drm_mode.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
> index d390011b8..c082810c0 100644
> --- a/include/uapi/drm/drm_mode.h
> +++ b/include/uapi/drm/drm_mode.h
> @@ -859,6 +859,8 @@ struct drm_color_lut {
>  
>  /**
>   * struct drm_plane_size_hint - Plane size hints
> + * @width: The width of the plane in pixel
> + * @height: The height of the plane in pixel
>   *
>   * The plane SIZE_HINTS property blob contains an
>   * array of struct drm_plane_size_hint.
> -- 
> 2.43.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
