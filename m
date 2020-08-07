Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DBE23E9C6
	for <lists+dri-devel@lfdr.de>; Fri,  7 Aug 2020 11:07:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 197826E98A;
	Fri,  7 Aug 2020 09:07:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7FE06E98A
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Aug 2020 09:07:20 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id p14so1080653wmg.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Aug 2020 02:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=JOA9wGKJGi2uQbVsMvpF/of5bDTR8nbQV/WSggoifAw=;
 b=JsHxkDxKTH7fBzU9eNpTd3aOl8NBMHuR8ArPJwYKI7/5Up4loaNbVlrWWu/rvwsGic
 0YLPBaiEq6djont7VEoMfsSkg756SwekgxK9qd9mg20MSv5xniepGeOtvrHHjG6E3XsI
 gbJKA4HdHNJXCUNwVGLFUa08ZIVk5N/aMm7j0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JOA9wGKJGi2uQbVsMvpF/of5bDTR8nbQV/WSggoifAw=;
 b=cn85QKBM+rMOfUqhn/sfy8RqM/4HHqnXPCA9wxbGv1h9oCoLWo/xLV+xbI3yNWmf8d
 eGWkmktJtfvzCugjCr1E4SIW05r0O6bcyKrNjVY6uzKf/26/o9JUPAATjvDR49QsWdub
 jYrOkDIOYa6ymIrCfqzcQjbC9Rgfgg/ulgCEIANCLcXjlU9APFqrGt64bFuVlN6BbAHF
 1u6gXS3AfzsipClMqWHDq06zz2XverRRovVRioLuRvAgwB5uizXg6Su6CFZ/3MiWMTTx
 Gglsyz5FvbBd4WfCdV7gO96WNh0y6j0uXiiUP7FBlSjCZc6qmnlvokeuubsNX6VnJ79Q
 n4MA==
X-Gm-Message-State: AOAM531YXNT7fVkrNx6V6Rxa07g9Sn6pupd/Tqfsa4ZxYoqGjtGW2Fi2
 hhqfK1qm3zcmt+BrtM5O0J8+3Q==
X-Google-Smtp-Source: ABdhPJzukwMSRt+YMkNNJYx7xO4fRFd2rVxSrhQ4K+K3IBMVF5A5MzEqWeiL7NgdtmxGWhYUwQCetQ==
X-Received: by 2002:a1c:988a:: with SMTP id a132mr11428676wme.14.1596791239633; 
 Fri, 07 Aug 2020 02:07:19 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id j4sm9417820wmi.48.2020.08.07.02.07.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Aug 2020 02:07:18 -0700 (PDT)
Date: Fri, 7 Aug 2020 11:07:06 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Simon Ser <contact@emersion.fr>
Subject: Re: [PATCH] drm: drivers may provide multiple primary planes per CRTC
Message-ID: <20200807090706.GA2352366@phenom.ffwll.local>
References: <TJAyvL7GM0cZ61sbzYMZ7IbVow2d32QQntnAB5_zpBOdcKVIAy8qhZg4En6C8Ka-mUXV-goV21ExVsA8Q3N_lJV4jf6g6llQBQSDs602jgs=@emersion.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <TJAyvL7GM0cZ61sbzYMZ7IbVow2d32QQntnAB5_zpBOdcKVIAy8qhZg4En6C8Ka-mUXV-goV21ExVsA8Q3N_lJV4jf6g6llQBQSDs602jgs=@emersion.fr>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 06, 2020 at 10:33:31AM +0000, Simon Ser wrote:
> Some drivers may expose primary planes compatible with multiple CRTCs.
> Make this clear in the docs: the current wording may be misunderstood as
> "exactly one primary plane per CRTC".
> 
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  drivers/gpu/drm/drm_plane.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index b7b90b3a2e38..108a922e8c23 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -49,8 +49,8 @@
>   * &struct drm_plane (possibly as part of a larger structure) and registers it
>   * with a call to drm_universal_plane_init().
>   *
> - * Cursor and overlay planes are optional. All drivers should provide one
> - * primary plane per CRTC to avoid surprising userspace too much. See enum
> + * Cursor and overlay planes are optional. All drivers should provide at least
> + * one primary plane per CRTC to avoid surprising userspace too much. See enum

I think that's even more confusing, since this reads like there could be
multiple primary planes for a specific CRTC. That's not the case, there'
only one pointer going from drm_crtc->primary to a drm_plane in the
kernel.

The problem is that userspace doesn't have a drm_property to read this
pointer, and needs to guess.

I thought the rule is:

Nth primary plane (or cursor) is the primary plane for the Nth crtc.
Enumaration with increasing drm kms object ids.

And I guess we should explain that on some hw any plane (including primary
ones, since that's only a sw construct) can be freely assinged to crtc.

Yes it's probably the most gloriously bonkers uapi we've come up with.
Might be so bad that a libdrm helper to look up the primary plane for a
crtc (or it's cursor plane if it exists) would be in order :-)

Cheers, Daniel


>   * drm_plane_type for a more in-depth discussion of these special uapi-relevant
>   * plane types. Special planes are associated with their CRTC by calling
>   * drm_crtc_init_with_planes().
> -- 
> 2.28.0
> 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
