Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B09188B4A
	for <lists+dri-devel@lfdr.de>; Tue, 17 Mar 2020 17:57:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DF2F6E58B;
	Tue, 17 Mar 2020 16:57:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 253356E58B
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 16:57:33 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id h4so6046923wru.2
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Mar 2020 09:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=wrfChOUz/lAaBXiE3qY2UNw2+SxM9+DHELQmHfgnM64=;
 b=GrvBiO890g/VncbMjDzgbmrlwtosSNomp7QQc4Q1ksYopcgnqyo199zvFrfrAyBL8y
 JUc/9D6ixg8Mh8PdAhK0nJ0ZEsyrJDYwvgCb9RDAQELwMd/TDSJ128ls95P6HlVi90Vc
 yKMOhcftgm7t6pyG+4H2D/ggA2v6HONmXEgPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=wrfChOUz/lAaBXiE3qY2UNw2+SxM9+DHELQmHfgnM64=;
 b=eHCrDh+Rg3bhr72ZTKeOE5oIIEfK3aaoTSaVWrpB78BUDxWTpsZih7tG7ZJCdDwomV
 VYihPCS7gL4cMSC6YA2wL7XeG+WcLfC59tJ5JtTOrwFOhaDqIyahxBeBFyOMPESpb+dD
 GlzQU0iYdt/pUBUYHkgqEbIrBVX9QkvuGK5BcIIzHlNzW3X9DjiM88xwsNVPKtVFc9ao
 VY8bW6EykM18sb0aNUIxwSBIHHKPfIK3Gi4aapQQCfLB7lYYTTUQ4nn7rgRDFwcS1r6Z
 igj0/DM8FjbqBIt7Pau0kyYwnsktHnBSTtMulmroDxHIT+92p2Bloya34Dbq9oPODZr4
 tD5Q==
X-Gm-Message-State: ANhLgQ1kj/JVZu8eBWbLjNFHXVK0GpEB/XrkAmUWDUI0tLMaQz3Hwzd7
 kWRJMM+ztbnBX/4xFH64hUCpaQ==
X-Google-Smtp-Source: ADFU+vspECOtqtMTvLpFlQUwdK8IeDVk+/wKnuMtgt4gmzOuA3KijQEyjlIBgw/c5JZcSajTRdOe7Q==
X-Received: by 2002:a05:6000:41:: with SMTP id k1mr7434833wrx.53.1584464251820; 
 Tue, 17 Mar 2020 09:57:31 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c5sm508387wma.3.2020.03.17.09.57.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Mar 2020 09:57:31 -0700 (PDT)
Date: Tue, 17 Mar 2020 17:57:29 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Qiujun Huang <hqjagain@gmail.com>
Subject: Re: [PATCH] drm/lease: fix WARNING in idr_destroy
Message-ID: <20200317165729.GQ2363188@phenom.ffwll.local>
Mail-Followup-To: Qiujun Huang <hqjagain@gmail.com>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@linux.ie, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <1584329768-16119-1-git-send-email-hqjagain@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1584329768-16119-1-git-send-email-hqjagain@gmail.com>
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 16, 2020 at 11:36:08AM +0800, Qiujun Huang wrote:
> leases has been destroyed:
> drm_master_put
>     ->drm_master_destroy
>             ->idr_destroy
> 
> so the "out_lessee" needn't to call idr_destroy again.
> 
> Reported-and-tested-by: syzbot+05835159fe322770fe3d@syzkaller.appspotmail.com
> Signed-off-by: Qiujun Huang <hqjagain@gmail.com>
> ---
>  drivers/gpu/drm/drm_lease.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_lease.c b/drivers/gpu/drm/drm_lease.c
> index b481caf..54506c2 100644
> --- a/drivers/gpu/drm/drm_lease.c
> +++ b/drivers/gpu/drm/drm_lease.c
> @@ -577,11 +577,14 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
>  
>  out_lessee:
>  	drm_master_put(&lessee);
> +	goto err_exit;

I think this is correct, but also confusioning and inconsistent with the
existing style. Most error cases before drm_lease_create explicit destroy
the idr, except the one for drm_lease_create.

Instead of your patch I'd
- remove the idr_destry from the error unrolling here
- add it the to drm_lease_create error case
- add a comment above the call to drm_lease_crete that it takes ownership
  of the lease idr

Can you pls respin and retest to make sure that patch is still correct?

Thanks, Daniel

>  
>  out_leases:
> -	put_unused_fd(fd);
>  	idr_destroy(&leases);
>  
> +err_exit:
> +	put_unused_fd(fd);
> +
>  	DRM_DEBUG_LEASE("drm_mode_create_lease_ioctl failed: %d\n", ret);
>  	return ret;
>  }
> -- 
> 1.8.3.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
