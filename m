Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 040B12A7AC3
	for <lists+dri-devel@lfdr.de>; Thu,  5 Nov 2020 10:42:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEB4D6E1A2;
	Thu,  5 Nov 2020 09:42:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E197E6E1A2
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Nov 2020 09:42:18 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id h22so910460wmb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Nov 2020 01:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=wpa/gH6WKVvOZOF65OKK1Df7hL/w51tUR5ocafirz/U=;
 b=gGpve2b5nT5gDe0F41+nOJ8S0JtPp+K/fkbykHKZpJakWRrlBTuW9/X4OP3lckOq4S
 wFC6L2TgfvMVBEyrEUg0CaryizLLCP6ZWidtrdKSBVVAH8mjIY62v2CsJQrEZDf7Ly6U
 pP0JtMJnmCpKC98YGUdp8xOqeDtcn7vXs6s8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=wpa/gH6WKVvOZOF65OKK1Df7hL/w51tUR5ocafirz/U=;
 b=YtwNxa//Ww6ZPMdQrYvvVXUSKWJ3cJoP+qEEc86T8VE15fEZqw/hlhdbw76iF3uwCb
 ucbCZRIKCiI5dAloWrAImtcIChgRnjk4tPJtxj1xIni2EGdohGiMB0B7LYhXlbYJ+m5Y
 Kku9bGQ0DiqWvgHM+Ojpwf9u9/faA5x3OTwvKbVwynh5slNv+DuUoIIBytiUdMDZ9wSU
 KdTrWfP134rWA0peLS5u5RiFpshIDxFSWT0qvszBpsCT3rtubtR0b5rIBPyloYnbcFg9
 xpHufX3DwF3qmnukP3Ib9ZKxkEupC0ZviwDUy/7glmCWBoZHOBRoGhAeoWgFYLVu27wp
 fSgg==
X-Gm-Message-State: AOAM533AQcKBPexhBVOgPt3FlJ78R5TJRkIt2Ce2cGbpJejm3rMiVh4v
 GbzRMwub4XxOJj3SD7R6SHC9vQ==
X-Google-Smtp-Source: ABdhPJzLdA/5MB4X8lL2FOSUeAQLRPyPZzE5Hwhd3ddv0IHLtJIf4ldo5XuVgoPqCzuJ52+HNerkLg==
X-Received: by 2002:a1c:2d8f:: with SMTP id t137mr1729198wmt.26.1604569337681; 
 Thu, 05 Nov 2020 01:42:17 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w11sm1875170wmg.36.2020.11.05.01.42.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 01:42:16 -0800 (PST)
Date: Thu, 5 Nov 2020 10:42:15 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Deepak R Varma <mh12gx2825@gmail.com>
Subject: Re: [PATCH] drm/vgm: replace idr_init() by idr_init_base()
Message-ID: <20201105094215.GT401619@phenom.ffwll.local>
Mail-Followup-To: Deepak R Varma <mh12gx2825@gmail.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20201104112338.GA29271@localhost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201104112338.GA29271@localhost>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 04, 2020 at 04:53:38PM +0530, Deepak R Varma wrote:
> idr_init() uses base 0 which is an invalid identifier. The new function
> idr_init_base allows IDR to set the ID lookup from base 1. This avoids
> all lookups that otherwise starts from 0 since 0 is always unused.
> 
> References: commit 6ce711f27500 ("idr: Make 1-based IDRs more efficient")
> 
> Signed-off-by: Deepak R Varma <mh12gx2825@gmail.com>

Tiny typo in the commit message summary: s/vgm/vgem/

Also can you pls resbumit this with intel-gfx mailing list on cc (like for
i915)? There's a CI bot there which runs a few vgem tests, would be good
to confirm nothing has been broken.

Otherwise lgtm.

Thanks, Daniel

> ---
>  drivers/gpu/drm/vgem/vgem_fence.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vgem/vgem_fence.c b/drivers/gpu/drm/vgem/vgem_fence.c
> index 17f32f550dd9..2902dc6e64fa 100644
> --- a/drivers/gpu/drm/vgem/vgem_fence.c
> +++ b/drivers/gpu/drm/vgem/vgem_fence.c
> @@ -233,7 +233,7 @@ int vgem_fence_signal_ioctl(struct drm_device *dev,
>  int vgem_fence_open(struct vgem_file *vfile)
>  {
>  	mutex_init(&vfile->fence_mutex);
> -	idr_init(&vfile->fence_idr);
> +	idr_init_base(&vfile->fence_idr, 1);
>  
>  	return 0;
>  }
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
