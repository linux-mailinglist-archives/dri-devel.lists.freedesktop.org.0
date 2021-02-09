Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0AC314CD4
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 11:23:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F137E6EAC8;
	Tue,  9 Feb 2021 10:23:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 239616EAC8
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 10:23:18 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id l12so20987704wry.2
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Feb 2021 02:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=8ruksgeR7S7IxfRPp/AabdJUyLlp9XKych0sXSQ/dfY=;
 b=O/Zj2LQHClvVs1hdqFJkLDpgyfl16W4D7gsuUrwMrRBkzYucXjQeukXLvH4+HVoxt8
 tmzrEjxstFhU4MyiubRIqnbiZxf99sFCqYQ11TE1uWLK/1Zd/m5pugtTIa3YBZbffaR7
 o4RTqUuD7RZCwbqVwulH1QZ73uhmLtgLEychQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8ruksgeR7S7IxfRPp/AabdJUyLlp9XKych0sXSQ/dfY=;
 b=ePj7eNxvLepWhaQbnkrr/smOMvSjNUAOLfBZneQ9s1rSqD8UXZNfePD80BCEjrKkeK
 Mtgi13y0NB1NtrN3r3jbwfvjDmROBwcr9xlZB6CgFLJdk7AKo1d9hadZtqYF9Y0LD84G
 IOKQyirHXg5pGjcP7V/E/1duyLPuUbA3fjRnHWgeQqgj5hBl5oGNp1RidrK6FytbgGMD
 yjjIJeJqtXHOs1kdjdr2DqalYitXuFRKnPrn4xox8z/F5GaIKQrr8hue8sAQBBibZtt2
 g4Qme0TG7iIsbrPb8Q4djmEB6d1j08MX9T3Xyj+s5O57Ikku8ukGyNPfg+TnJbLEqMUF
 vkBg==
X-Gm-Message-State: AOAM530KjFqlQE4/8vUKaMsb/MzAOKne+cQSa3yNXUvTZEjFxKMoQMkm
 wM+P4wq6kli5xKQzbyBXs8/kyw==
X-Google-Smtp-Source: ABdhPJwEDHTkqfjU0Fr24VJFs+mqwcChGFKVJQq4Ivn90chCVUglbsaugH58kd3qjr+vs01P6tzVYw==
X-Received: by 2002:a5d:4a0b:: with SMTP id m11mr7701350wrq.51.1612866196812; 
 Tue, 09 Feb 2021 02:23:16 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id u206sm3835237wme.12.2021.02.09.02.23.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 02:23:16 -0800 (PST)
Date: Tue, 9 Feb 2021 11:23:14 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH 1/4] drm/gma500: Remove in_atomic() usage.
Message-ID: <YCJikjv/jmXdxgeC@phenom.ffwll.local>
References: <20210208233119.391103-1-bigeasy@linutronix.de>
 <20210208233119.391103-2-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210208233119.391103-2-bigeasy@linutronix.de>
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
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 09, 2021 at 12:31:16AM +0100, Sebastian Andrzej Siewior wrote:
> The driver is using msleep() if it is safe to use based on in_atomic().
> This is not needed this macro is only used from
> i2c_algorithm::master_xfer() which is always invoked from preemptible
> context.
> 
> Remove in_atomic() because it is superfluous. Remove wait_for_atomic()
> because it has no users.
> 
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Applied to drm-misc-next, thanks for your patch.
-Daniel

> ---
>  drivers/gpu/drm/gma500/intel_gmbus.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/gma500/intel_gmbus.c b/drivers/gpu/drm/gma500/intel_gmbus.c
> index 370bd6451bd9b..eb0924473a218 100644
> --- a/drivers/gpu/drm/gma500/intel_gmbus.c
> +++ b/drivers/gpu/drm/gma500/intel_gmbus.c
> @@ -44,13 +44,13 @@
>  			ret__ = -ETIMEDOUT;				\
>  			break;						\
>  		}							\
> -		if (W && !(in_atomic() || in_dbg_master())) msleep(W);	\
> +		if (W && !(in_dbg_master()))				\
> +			msleep(W);					\
>  	}								\
>  	ret__;								\
>  })
>  
>  #define wait_for(COND, MS) _wait_for(COND, MS, 1)
> -#define wait_for_atomic(COND, MS) _wait_for(COND, MS, 0)
>  
>  #define GMBUS_REG_READ(reg) ioread32(dev_priv->gmbus_reg + (reg))
>  #define GMBUS_REG_WRITE(reg, val) iowrite32((val), dev_priv->gmbus_reg + (reg))
> -- 
> 2.30.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
