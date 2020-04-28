Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C48D21BC161
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 16:33:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2C166E7EF;
	Tue, 28 Apr 2020 14:33:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 699DA6E7EF
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 14:33:39 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id k13so24944137wrw.7
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Apr 2020 07:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=AjieViA3rnxqYDhF0kJNrJxehbwh0Gzk+1e36Gl2Pak=;
 b=NtgeuWKqE8X8T1xWg2iWqWjvywaHyu3n1L4Ws6gzNcDukV8UildbmlpdQ2V4jvrff9
 iqYGuPQqN1zUhYNJ0ukcqLruOyfKNLdU0ZM0A0aC+z9CHDFjmX0Dff0FE1cA49zICt9w
 cr09OpX2CVF7njP6JJ5vYKHaAwf0G8xa/TrsE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AjieViA3rnxqYDhF0kJNrJxehbwh0Gzk+1e36Gl2Pak=;
 b=eAx1cX9zFrviK1DeX5R4ckfj15qu5AKLnvGp+Wai646VlH3AkPw+eH3HTqcfv2DjtG
 o4z7KAV/JF0gf8DHZ2hOQVtSERTtLK8HKIm3QkiVf98yA1ld/U6/4X1k9MHOnDb05qHy
 yc2uaBMCrtsrqZKF6ettrVNOM04NfNqF/qHb4hHu+Oh3U0TNd9wTl9lKj8CSikj5i/5p
 gkWL8PYl8ltYkPaLStoQ/F7fKaI1Zhvk3nt7qYrpICe+GrL0BcjAV2bjVUMRSBY+HscE
 nxDDypFNR1wyGCyFHShm4SjyDoHMI41Kfzxi8ckw7LNJQVpSXUFz1qL5zzxjYEz9+yZP
 l73A==
X-Gm-Message-State: AGi0PubdrcmZSPsNH3JD6tLAiZaBbAWAxHdOQmL+SV6C0YATJxMtbba5
 RczaQdDqWKo+RvVHDfsAD3TwH4vIgqU=
X-Google-Smtp-Source: APiQypI50Y/dMBlhnWNbEi1tbW+JJ68XwuNtliiwfdwdiAw1WYUWnB3DameCvp4r6I0/G7PXZZx2VQ==
X-Received: by 2002:adf:ea44:: with SMTP id j4mr36157713wrn.38.1588084418072; 
 Tue, 28 Apr 2020 07:33:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l19sm3580012wmj.14.2020.04.28.07.33.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Apr 2020 07:33:37 -0700 (PDT)
Date: Tue, 28 Apr 2020 16:33:35 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Ben Davis <ben.davis@arm.com>
Subject: Re: [PATCH] drm: drm_fourcc: Add uncompressed AFBC modifier
Message-ID: <20200428143335.GO3456981@phenom.ffwll.local>
References: <20200422111758.1787-1-ben.davis@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200422111758.1787-1-ben.davis@arm.com>
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
Cc: airlied@linux.ie, liviu.dudau@arm.com, matteo.franchin@arm.com,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de, nd@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 22, 2020 at 12:17:58PM +0100, Ben Davis wrote:
> AFBC has a mode that allows use of AFBC with an uncompressed buffer,
> we add a new modifier to support this mode.
> 
> Signed-off-by: Ben Davis <ben.davis@arm.com>
> ---
>  include/uapi/drm/drm_fourcc.h | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index 8bc0b31597d8..97c47baef7fc 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -780,6 +780,12 @@ extern "C" {
>   */
>  #define AFBC_FORMAT_MOD_BCH     (1ULL << 11)
>  
> +/* AFBC uncompressed storage mode
> + *
> + * Indicates that the buffer is using uncompressed AFBC mode.

Since this sounds a bit baffling, might be good to spend a few more words
on what exactly this means. If it's just a fancy way of saying
linear/untiled, then this shouldn't be a modifier. If it's some kind of
specific tiling layout, then I think that should be specified (we've been
a bit more lax with the compressor magic soup, but tiled formats are
generally fully specced).
-Daniel
> + */
> +#define AFBC_FORMAT_MOD_USM	(1ULL << 12)
> +
>  /*
>   * Arm 16x16 Block U-Interleaved modifier
>   *
> -- 
> 2.24.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
