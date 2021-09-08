Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1CDF403DDC
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 18:47:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF47B89458;
	Wed,  8 Sep 2021 16:47:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74C7089458
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Sep 2021 16:47:37 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id q11so4250415wrr.9
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Sep 2021 09:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=e2wWGUdeRDgKTZm36gU3XgdflTP+v2IgcK20XiLXdSY=;
 b=b+vknR/fu6IDbSURPZbTqhSJATcn1y84M2/H93SY57XGrYMUPvwefgMBMoJKnkggke
 FjWvNfEJ3Qv73GmTiOhfs64sAfViFNHCEW6LrHH3RWhc7HT0jwbnpDyOcinglXkr/9FX
 jYVT9MK9LYkD1D7KMtVrSC9mZzMvtACgC1+Rs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=e2wWGUdeRDgKTZm36gU3XgdflTP+v2IgcK20XiLXdSY=;
 b=5i/WnxLzIlPTPB/ZS1Eu98BZHlcQhOE+B6PUUnvKmTyycS1t1XTATxnfwfUaLbq4fl
 9NVU4fjZ+73zAcJ42lLEHblJ11dRYAyQdiweK5O0elBvVWSXGoa22K5HYBKl24eQBT1Y
 DrbGM7EKw7Q3j7SRHTLfPo/shHtE46Z9Ln8yMPeB5vHOn24p0IHCUgy+bmL2WFfkFTl/
 Mloz5xq14j+yu+ggdLKIkPwrvfM3GSmgpNXlLVHc6YfWyJUMxThJx2qUs7i1Tt3od1hX
 5ikyhvKFLgXGAmrpFkO+NvOj1lq3ud7D5yF/0xNL2+4wwfrqvKrFBLkFZsi7qrDe8HFe
 oyoA==
X-Gm-Message-State: AOAM530+r2f8yPxD+2WTWBv7oZf1kMLSjLPpAq7LQD6P2SBzSA4ZsLZJ
 SklsmgiioXQCCt/tpgAnO/Mmqg==
X-Google-Smtp-Source: ABdhPJyJRWfYiO5KwS7ok0f6evW2BNjbTfhJESNvFfjFgF4LH0dUi74pD+DIdrReirOF5GApPb2vAQ==
X-Received: by 2002:a5d:4b10:: with SMTP id v16mr5181018wrq.176.1631119655976; 
 Wed, 08 Sep 2021 09:47:35 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t18sm1971871wrp.97.2021.09.08.09.47.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 09:47:35 -0700 (PDT)
Date: Wed, 8 Sep 2021 18:47:33 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jeevan B <jeevan.b@intel.com>
Cc: dri-devel@lists.freedesktop.org, uma.shankar@intel.com,
 kai.vehmanen@linux.intel.com
Subject: Re: [PATCH] Change igt_log level from IGT_LOG_WARN to IGT_LOG_INFO
Message-ID: <YTjpJTbBwuRfypUu@phenom.ffwll.local>
References: <20210907183356.11126-1-jeevan.b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210907183356.11126-1-jeevan.b@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Sep 08, 2021 at 12:03:56AM +0530, Jeevan B wrote:
> change igt_warn to igt_info when unloading the snd module before
> unbinding i915 until WA is fixed.
> 
> Signed-off-by: Jeevan B <jeevan.b@intel.com>

Please submit per

https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/CONTRIBUTING.md#sending-patches

No one (not even CI) pick up igt patches submitted to dri-devel.
-Daniel

> ---
>  tests/core_hotunplug.c | 2 +-
>  tests/device_reset.c   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/core_hotunplug.c b/tests/core_hotunplug.c
> index 2d73e27f..b3661668 100644
> --- a/tests/core_hotunplug.c
> +++ b/tests/core_hotunplug.c
> @@ -164,7 +164,7 @@ static void driver_unbind(struct hotunplug *priv, const char *prefix,
>  			igt_lsof("/dev/snd");
>  			igt_skip("Audio is in use, skipping\n");
>  		} else {
> -			igt_warn("Preventively unloaded snd_hda_intel\n");
> +			igt_info("Preventively unloaded snd_hda_intel\n");
>  		}
>  	}
>  
> diff --git a/tests/device_reset.c b/tests/device_reset.c
> index e6a468e6..982ba5ef 100644
> --- a/tests/device_reset.c
> +++ b/tests/device_reset.c
> @@ -201,7 +201,7 @@ static void driver_unbind(struct device_fds *dev)
>  			igt_lsof("/dev/snd");
>  			igt_skip("Audio is in use, skipping\n");
>  		} else {
> -			igt_warn("Preventively unloaded snd_hda_intel\n");
> +			igt_info("Preventively unloaded snd_hda_intel\n");
>  		}
>  	}
>  
> -- 
> 2.19.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
