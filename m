Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D307517BA8C
	for <lists+dri-devel@lfdr.de>; Fri,  6 Mar 2020 11:40:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E10946ECCC;
	Fri,  6 Mar 2020 10:40:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD8586ECCE
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Mar 2020 10:40:42 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id p2so941700wrw.7
 for <dri-devel@lists.freedesktop.org>; Fri, 06 Mar 2020 02:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=3uwQmoeCVMR1OjRUyFcSdUC36g6Oo2T6mj6l89+Qx08=;
 b=Iw0ZWJATxL79py60HW/tvolmLUL5DiTJF3n+O9KSkscsoVaDd1sC+1a99B/XaFEnvD
 pufFlRVL3+f+wG50aKPpypMk0JrVexnVpCKewc0I7WHWdopgdwRd8hv6V7g5QwBmbzwS
 QJ68Po5jb2PQb1aJ9Oo25pmODM/axP3qzitM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=3uwQmoeCVMR1OjRUyFcSdUC36g6Oo2T6mj6l89+Qx08=;
 b=ZataWWo0H70DNUtX7y1aPJj4zKOxGWA0fXDPrV+jvjZzzPwM9Lak2ZN0+P+i6EHyH5
 ctXvjaPXwnPXCPO6kNliiLr7tHRnh3aNUyzPBAo7Q5iO86uwMkdhalxdljHe/wgesPlA
 o/y757T2mpmoR/oJatEf/Fvu1pMpKPsQC92yBdX1dJJnKGHkFS09hkb8FGFXINU8r22O
 i9FAFuPT0xdl+/8JQP6gnjh+mVH+FOh2mhzM02WUFeE9P3vpGPoVTT2Ukg1YTBWxYbNI
 g+dPLgNOzV1nVq1o8SGnCq1RXheIiFKUqHEF20ii0KPAoVEDsVQVnzAcDi7I53BAa388
 Rsbg==
X-Gm-Message-State: ANhLgQ1ar+RSsKo0ZLPepuqSRkdXQpUadKi/02T4jZLQu52fJ3oy4qfw
 W7ju85T3wriIN6GBVL4C+/Ve6g==
X-Google-Smtp-Source: ADFU+vt7qifkWSBCAuJEHAUYhMENNpFsi58HIatC73FFg/bEqMfF/ZaCUxUJrkB7PDaKqB+vx7xcIA==
X-Received: by 2002:a05:6000:4:: with SMTP id h4mr2203376wrx.14.1583491241522; 
 Fri, 06 Mar 2020 02:40:41 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id t14sm16353673wrp.63.2020.03.06.02.40.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2020 02:40:40 -0800 (PST)
Date: Fri, 6 Mar 2020 11:40:39 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH][next] drm/gma500/intel_bios.h: Replace zero-length array
 with flexible-array member
Message-ID: <20200306104039.GU2363188@phenom.ffwll.local>
Mail-Followup-To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20200305105306.GA18788@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200305105306.GA18788@embeddedor>
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

On Thu, Mar 05, 2020 at 04:53:06AM -0600, Gustavo A. R. Silva wrote:
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
>  drivers/gpu/drm/gma500/intel_bios.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/gma500/intel_bios.h b/drivers/gpu/drm/gma500/intel_bios.h
> index a1f9ce9465a5..0e6facf21e33 100644
> --- a/drivers/gpu/drm/gma500/intel_bios.h
> +++ b/drivers/gpu/drm/gma500/intel_bios.h
> @@ -227,7 +227,7 @@ struct bdb_general_definitions {
>  	 * number = (block_size - sizeof(bdb_general_definitions))/
>  	 *	     sizeof(child_device_config);
>  	 */
> -	struct child_device_config devices[0];
> +	struct child_device_config devices[];
>  };
>  
>  struct bdb_lvds_options {
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
