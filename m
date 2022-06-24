Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB51955A35F
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 23:16:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4655C10EB87;
	Fri, 24 Jun 2022 21:16:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 348DF10EB87
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 21:16:51 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 r81-20020a1c4454000000b003a0297a61ddso2502298wma.2
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 14:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=9La6nHnkFsYUylBsgtyucaDofDgQHjmfYDQousPpK10=;
 b=hVidKmGV6qyBizTce0qFSwAa8MwTH1Q8gbqszG6BIItP4hr59A7XgwNLP/m0ePuOCR
 VZoWcg8BGp+bEnKw9+NrCaurH9al4ZwCmQkSqU6inkmqMLlMiAqm+9sGQEVW1bcvHiVH
 QMtxaagBOz9JpTuEuwqgaFfW+cLeOu4ToraL0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9La6nHnkFsYUylBsgtyucaDofDgQHjmfYDQousPpK10=;
 b=HKtu+XhF3nt587QF4nwQqYswnS35YGbbaw8ejUN9+C6upirKJ5F4/Vw2LinjoGfQ7n
 dOEXfSdA2tUD0pHeNddzd6tLjJBa+l2mcrGk2+ArxR5dwOMQ0V+ooaR71HQYrsonBxQD
 qeijBGdz2qrdr0JMuY6xop1Go8Kflr09lWM7xI0wQg+ZJpmLhuqsh9p6Z6nRkM5X14fO
 SQ8S9wdOUNXW1/rSz+onstQaVCUBXSxYk6csjjnZzPE8NQ2SOXZh8ThWgUnwVeSNvcKh
 nKUdXS5OMi7g7t6xIElFHivKVapyO5FeRRicfE7zINkF0vXMMwCN7QkitWkHLi6NbpKK
 uFPQ==
X-Gm-Message-State: AJIora8tcXM9hkMJvuiQn1/wqEhcsYvdWtCNKCtSi9xoDspF8sHK1WiU
 FNqXjzcvLyexpqf2Q9VRy0rjeg==
X-Google-Smtp-Source: AGRyM1vP7hXgB45fqBRTFCT362WPljUZIClPdOTAqG4dJLExuamwgf6cgaRASOaTL9HQffFqk+SV5w==
X-Received: by 2002:a05:600c:3b96:b0:397:485a:f5c5 with SMTP id
 n22-20020a05600c3b9600b00397485af5c5mr1080709wms.185.1656105409744; 
 Fri, 24 Jun 2022 14:16:49 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 ay26-20020a5d6f1a000000b0021baf5e590dsm3200099wrb.71.2022.06.24.14.16.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jun 2022 14:16:48 -0700 (PDT)
Date: Fri, 24 Jun 2022 23:16:46 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] drm/fourcc: Add formats for packed YUV 4:4:4 AVUY and
 XVUY permutations
Message-ID: <YrYpvmInnq5Muahz@phenom.ffwll.local>
References: <20220616185210.22018-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220616185210.22018-1-laurent.pinchart@ideasonboard.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 16, 2022 at 09:52:10PM +0300, Laurent Pinchart wrote:
> Add FourCCs for two missing permutations of the packed YUV 4:4:4 color

For a second I thought this 4:4:4 is the bit packing, but it's the 444
sampling rate thing.

Man formats are confusing.

> components, namely AVUY and XVUY.
> 
> These formats are needed by the NXP i.MX8 ISI. While the ISI is
> supported by a V4L2 device (corresponding formats have been submitted to
> V4L2), it is handled in userspace by libcamera, which uses DRM FourCCs
> for pixel formats.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  include/uapi/drm/drm_fourcc.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index f1972154a594..399d950c53e3 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -205,7 +205,9 @@ extern "C" {

I build script to make sure we don't accidentally assign duplicated codes
would be nice, this is pain to check.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

>  #define DRM_FORMAT_VYUY		fourcc_code('V', 'Y', 'U', 'Y') /* [31:0] Y1:Cb0:Y0:Cr0 8:8:8:8 little endian */
>  
>  #define DRM_FORMAT_AYUV		fourcc_code('A', 'Y', 'U', 'V') /* [31:0] A:Y:Cb:Cr 8:8:8:8 little endian */
> +#define DRM_FORMAT_AVUY8888	fourcc_code('A', 'V', 'U', 'Y') /* [31:0] A:Cr:Cb:Y 8:8:8:8 little endian */
>  #define DRM_FORMAT_XYUV8888	fourcc_code('X', 'Y', 'U', 'V') /* [31:0] X:Y:Cb:Cr 8:8:8:8 little endian */
> +#define DRM_FORMAT_XVUY8888	fourcc_code('X', 'V', 'U', 'Y') /* [31:0] X:Cr:Cb:Y 8:8:8:8 little endian */
>  #define DRM_FORMAT_VUY888	fourcc_code('V', 'U', '2', '4') /* [23:0] Cr:Cb:Y 8:8:8 little endian */
>  #define DRM_FORMAT_VUY101010	fourcc_code('V', 'U', '3', '0') /* Y followed by U then V, 10:10:10. Non-linear modifier only */
>  
> -- 
> Regards,
> 
> Laurent Pinchart
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
