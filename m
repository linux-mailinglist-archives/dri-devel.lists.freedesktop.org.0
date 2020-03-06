Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6495517BAC0
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 11:50:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1DA06ECD6;
	Fri,  6 Mar 2020 10:50:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1DD86ECDA
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 10:50:29 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id p2so977319wrw.7
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2020 02:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=lqj1r2+XesR/fgg0h5Zp8P3qsanXcYJ2Wo6lT5aKNU0=;
 b=eMQ4Qfh/shQdBEarZjsy80ZBoZmiDtadXBdBl2WipOlamwZgkExgTdE7XR4O9qD/H3
 SSa1bPhGT8t8YoMCzhpWDT7dxRUbDCb+nqp5Zpbq2SFDJvyenna6flQXGL2C0l7yR/40
 tZ1mAVIw2A4G1eFea4oYh6iQTBJmwIDieLvqg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=lqj1r2+XesR/fgg0h5Zp8P3qsanXcYJ2Wo6lT5aKNU0=;
 b=OfSRsEgWeJRHRt07MPtFvvFW+gEdFkTimP1dgowDbO7U4T06sW/Ax6jqcdWjHbhciG
 Xsp5q/WwFgQuMcNPoCtgu1xDpAW/0PbThiOlOREi4I2E2o2vlsJWCQZF4c1jwIhxgOOp
 SoZI+SBQyT+xuMkgYW+KAWirQtk407SHoE7vWadsDW8hkcrx0omZCqZk6GLvjIFYzDYV
 606lMbqUL1Kpw1Wy63awwW04V2GziX1lEcN7xnKi1WB4fQj4PGG5LJUnzEix5JLvxkTE
 h/IWA4R40awgIqEzSqKO9omJGUeIznOp705oj7y9Kc/K1KfjxYb9Q6ZIElM/Q8qfT3XZ
 zWvw==
X-Gm-Message-State: ANhLgQ1gJGJVePjvdL9zvroptYYdJ+vS7GbTNs+TJ6f3vGXMFdOUL0VJ
 oiOD44HhzphV60/oj5wN5Etmbnm9txo=
X-Google-Smtp-Source: ADFU+vvK8LQqjtAJ72mqtWovLbVlUtPxZCNRoHgeIjCmFWcoNHTF1RZkXRQ0Tv6bXfunwYZfaciwfQ==
X-Received: by 2002:adf:df82:: with SMTP id z2mr3361131wrl.46.1583491828337;
 Fri, 06 Mar 2020 02:50:28 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id w16sm14656890wrp.8.2020.03.06.02.50.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2020 02:50:27 -0800 (PST)
Date: Fri, 6 Mar 2020 11:50:25 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH][next] drm/vc4/vc4_drv.h: Replace zero-length array with
 flexible-array member
Message-ID: <20200306105025.GW2363188@phenom.ffwll.local>
Mail-Followup-To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Eric Anholt <eric@anholt.net>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20200305105707.GA19261@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200305105707.GA19261@embeddedor>
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 05, 2020 at 04:57:07AM -0600, Gustavo A. R. Silva wrote:
> The current codebase makes use of the zero-length array language
> extension to the C90 standard, but the preferred mechanism to declare
> variable-length types such as these ones is a flexible array member[1][2],
> introduced in C99:
> 
> struct foo {
>         int stuff;
>         struct boo array[];
> };
> 
> By making use of the mechanism above, we will get a compiler warning
> in case the flexible array does not occur last in the structure, which
> will help us prevent some kind of undefined behavior bugs from being
> inadvertently introduced[3] to the codebase from now on.
> 
> Also, notice that, dynamic memory allocations won't be affected by
> this change:
> 
> "Flexible array members have incomplete type, and so the sizeof operator
> may not be applied. As a quirk of the original implementation of
> zero-length arrays, sizeof evaluates to zero."[1]
> 
> This issue was found with the help of Coccinelle.
> 
> [1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
> [2] https://github.com/KSPP/linux/issues/21
> [3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")
> 
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
Applied to drm-misc-next, thanks for your patch.
-Daniel

> ---
>  drivers/gpu/drm/vc4/vc4_drv.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
> index f90c0d08e740..5ecb8b4a48a1 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.h
> +++ b/drivers/gpu/drm/vc4/vc4_drv.h
> @@ -65,7 +65,7 @@ struct vc4_perfmon {
>  	 * Note that counter values can't be reset, but you can fake a reset by
>  	 * destroying the perfmon and creating a new one.
>  	 */
> -	u64 counters[0];
> +	u64 counters[];
>  };
>  
>  struct vc4_dev {
> -- 
> 2.25.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
