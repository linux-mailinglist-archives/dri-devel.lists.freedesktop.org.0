Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBB23220C9B
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jul 2020 14:05:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E83B26EB38;
	Wed, 15 Jul 2020 12:05:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83ED96EB38
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jul 2020 12:05:07 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id z13so2397881wrw.5
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jul 2020 05:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=AeobqevlgxW6S/1jvLpikz7Xrm71aKFvBeFHoL5vYBU=;
 b=B0b0XZ+i5RC8QqHCTi1/oPWnTYCTs8binzuyaCBrmwad7iS+ZyuVeakYQlEqMEYp1C
 AQaBkw13rbn/FoTf8p9gawQZJx/soYCdMXyJyompkc8wFsNop8LNAx5W1c+GSPwloEnk
 iZVMtt/kwRUz7kgyjXDD8vPV34og8PbV1h8k8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=AeobqevlgxW6S/1jvLpikz7Xrm71aKFvBeFHoL5vYBU=;
 b=DX9SpY+chNH3Sayd3E3OikXhwXYDPlfcQS4euTvKt71AwWB693EBbftAYAiFP/EGAY
 /Uw+Lco/UNwHAXljxduNxVTgij0f6QbhThsAdXOWLuTzW9wwJyc/+KFZDd7Qe3Sw1cF7
 t42LjeI8tNjpEof6FArx8s29LiMmPhd7udNdRL66x0gRhIhqc1BPKM134CH/lDlo6SHr
 aIH0oJJhKZ+ixnCo039CFEXFSozlaEYCRWu+eydaAyqwhTSrrlz3P08T7lsWkdIEjWqz
 5BWgUqmA6X4ELpgP/NpRmuI0shK4/frkBscV3vLCq3onDETQTosblBlzDGKbf9KnqiJR
 tQew==
X-Gm-Message-State: AOAM533rZpd/sARfp8DKCjSACaMiWsbJV07BveIDM7OYUO8dIS6YkiBl
 cYFtyV9TyFLdw00ldgQL9AwKKw==
X-Google-Smtp-Source: ABdhPJzxbvgaL49qg+VF1cCI2CqYh4iGKEd2eaSGpqaN7AokBtncLtpiemoeX8OdEUnF8geVMYdl+Q==
X-Received: by 2002:a5d:6a06:: with SMTP id m6mr10891043wru.321.1594814706200; 
 Wed, 15 Jul 2020 05:05:06 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id 129sm3169967wmd.48.2020.07.15.05.05.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 05:05:05 -0700 (PDT)
Date: Wed, 15 Jul 2020 14:05:03 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jing Xiangfeng <jingxiangfeng@huawei.com>
Subject: Re: [PATCH] drm: remove redundant assignment to variable 'ret'
Message-ID: <20200715120503.GJ3278063@phenom.ffwll.local>
Mail-Followup-To: Jing Xiangfeng <jingxiangfeng@huawei.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@linux.ie, ajax@redhat.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20200715070559.180986-1-jingxiangfeng@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200715070559.180986-1-jingxiangfeng@huawei.com>
X-Operating-System: Linux phenom 5.6.0-1-amd64 
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
Cc: tzimmermann@suse.de, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 15, 2020 at 03:05:59PM +0800, Jing Xiangfeng wrote:
> The variable ret has been assigned the value '-EINVAL'. The assignment
> in the if() is redundant. We can remove it.

Nope, that's not correct. Before this assignement ret is guaranteed to be
0.
-Daniel

> 
> Signed-off-by: Jing Xiangfeng <jingxiangfeng@huawei.com>
> ---
>  drivers/gpu/drm/drm_auth.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
> index 800ac39f3213..6e1b502f2797 100644
> --- a/drivers/gpu/drm/drm_auth.c
> +++ b/drivers/gpu/drm/drm_auth.c
> @@ -299,7 +299,6 @@ int drm_dropmaster_ioctl(struct drm_device *dev, void *data,
>  
>  	if (file_priv->master->lessor != NULL) {
>  		DRM_DEBUG_LEASE("Attempt to drop lessee %d as master\n", file_priv->master->lessee_id);
> -		ret = -EINVAL;
>  		goto out_unlock;
>  	}
>  
> -- 
> 2.17.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
