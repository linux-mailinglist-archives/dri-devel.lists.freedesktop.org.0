Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB0B54DC2FA
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 10:37:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3854410E0CD;
	Thu, 17 Mar 2022 09:37:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E32C410E0CD
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 09:36:58 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id h23so5877269wrb.8
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Mar 2022 02:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=O1i7cT2ko1hGy64hM+B681n9QzyGnrB/xnsaByZUNh8=;
 b=bT3V2iREkpKRmBDY+g7eALtr2ZrQzwNd3hRJ8VsYaZQdh4QtwfMbuvSO2LYeQck2+m
 blb5DQOnSiZn9qqTx7mM3L6osuzQv91f7qSuuELZYtAgFdShTDmlAlhAO+/4/qeqIahJ
 w2bbZqr2KyIMqNh+SX3GTt0IaCKm1NIHnbjNs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=O1i7cT2ko1hGy64hM+B681n9QzyGnrB/xnsaByZUNh8=;
 b=YOHIplqX1cX7Vq+4bKkjVHBuQL8LJOBAwXlcGPYm/MbTpUogbpp5i3R49+YnBtSHVW
 eRC5opAIIxDqlgCF0r2egQW0R2S5IUIx4gS+NeIzWDgZIpuJ1ZVcpL3ilIi6FIOaSPAu
 sbfW2/CQj0cNhpVbf6hejoHt4pzirOxZT40OnkQOm3suGpoIt5UF219yOBqgGCot2Y08
 zg2P1UH5R81KGAqjMl3PqTgua1fAqkMwQBr9PWxShuiUmcnUVUprPkap+pSjpzbWLgKL
 ofjC3GDE30wyTkvUIrYgeoxUbQVFy++YmMj5gO8VRo/nkHoR9KsMCLG5jHc4UoqyrKuo
 7hOQ==
X-Gm-Message-State: AOAM533jmw0VDlO7TiCqmVUqqBelM+uvFnSHjsH0q/CvfNGa/Cj0f7cn
 NpPhK/jK2PAI+AF9p0W3Q4QLTg==
X-Google-Smtp-Source: ABdhPJyBrD7lqlP9xmnBLxk8QITal87n7bvpbobiyjAncbEh+KRG7YowAhGzRkaFfT/qWpV6bR+A+w==
X-Received: by 2002:a5d:47c8:0:b0:1ef:8e97:2b8c with SMTP id
 o8-20020a5d47c8000000b001ef8e972b8cmr3264671wrc.545.1647509817467; 
 Thu, 17 Mar 2022 02:36:57 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 k9-20020adfd849000000b00203d18bf389sm3442926wrl.17.2022.03.17.02.36.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 02:36:56 -0700 (PDT)
Date: Thu, 17 Mar 2022 10:36:55 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [RESEND PATCH] drm/doc: Clarify what ioctls can be used on
 render nodes
Message-ID: <YjMBN8XcQLmQJuWc@phenom.ffwll.local>
Mail-Followup-To: Jeffrey Hugo <quic_jhugo@quicinc.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, corbet@lwn.net,
 pekka.paalanen@collabora.com, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1646667156-16366-1-git-send-email-quic_jhugo@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1646667156-16366-1-git-send-email-quic_jhugo@quicinc.com>
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
Cc: pekka.paalanen@collabora.com, tzimmermann@suse.de, corbet@lwn.net,
 airlied@linux.ie, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 07, 2022 at 08:32:36AM -0700, Jeffrey Hugo wrote:
> The documentation for render nodes indicates that only "PRIME-related"
> ioctls are valid on render nodes, but the documentation does not clarify
> what that means.  If the reader is not familiar with PRIME, they may
> beleive this to be only the ioctls with "PRIME" in the name and not other
> ioctls such as set of syncobj ioctls.  Clarify the situation for the
> reader by referencing where the reader will find a current list of valid
> ioctls.
> 
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>

Applied to drm-misc-next, thanks for the patch.
-Daniel

> ---
> 
> I was confused by this when reading the documentation.  Now that I have
> figured out what the documentation means, I would like to add a clarification
> for the next reader which would have helped me.
> 
>  Documentation/gpu/drm-uapi.rst | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> index 199afb5..ce47b42 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -148,7 +148,9 @@ clients together with the legacy drmAuth authentication procedure.
>  If a driver advertises render node support, DRM core will create a
>  separate render node called renderD<num>. There will be one render node
>  per device. No ioctls except PRIME-related ioctls will be allowed on
> -this node. Especially GEM_OPEN will be explicitly prohibited. Render
> +this node. Especially GEM_OPEN will be explicitly prohibited. For a
> +complete list of driver-independent ioctls that can be used on render
> +nodes, see the ioctls marked DRM_RENDER_ALLOW in drm_ioctl.c  Render
>  nodes are designed to avoid the buffer-leaks, which occur if clients
>  guess the flink names or mmap offsets on the legacy interface.
>  Additionally to this basic interface, drivers must mark their
> -- 
> 2.7.4
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
