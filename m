Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 712B520CD51
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jun 2020 10:32:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EA9089FFD;
	Mon, 29 Jun 2020 08:32:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 860566E17C
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 08:32:45 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id z15so4351166wrl.8
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 01:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=23nm8X/59x0OUJfRGELxyK4MEVbjkM7gMx55iJc65NY=;
 b=hY/E6tepXWfWo8nIWdDdepy3wK7Xap3rfPs7trzbuh5gw/YgrECI0ht9jsuGdv5UpC
 YPrjAbD8407eM4Ggj5u0GxMBStzjf8wu1pbRnPj076DORg7xlLRXTGbE0GE+A58BAdhU
 YkFZTXE0G8VE91V+DC5HK1NuYI0tlv+hi7aP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=23nm8X/59x0OUJfRGELxyK4MEVbjkM7gMx55iJc65NY=;
 b=OPZA6Ak1NFmkxx2RDb7lG4ki8JAQypFBaD+EZdAwlSwlir9YYuwVFY1WZz+NkeYz8/
 tHa2jRNko330tgf309qTtr8SFzOluqDufyevLHY08MPVd62uH6rIh8qepKRYBv0W3Cek
 X4rngfWzR4MZqoWhTS5Yfqx62tnlSPhLjlv7+/pj0cCoYFC16tV7ItIcGMiIC9jhx4qO
 SLReL0Hrq1tgi+NQDKZsH3/KjHRGs9qFvBiuV6WqFkbTu76PUf12pLw8t/OEEerUNLao
 wdDepMz0kdp9VxiXzijereV/hLmbrptXw063YdNuGIFmRk3ij6Oywr8/0+DMapqCVmsJ
 KroA==
X-Gm-Message-State: AOAM531L50TN/FAkh34RhjNV33p7l7LElO0ObkffdyZakcqj2rve6KSH
 NBfiQ1JJQvhIMmHZ2GsGteKYxQ==
X-Google-Smtp-Source: ABdhPJwe0HvLtEroDnV2T2RVkeEqoeCIZs5DLboQiCTA66mPV9lr7+FEBTv/HuGFr4K/09TRc8atcA==
X-Received: by 2002:adf:e88b:: with SMTP id d11mr6940426wrm.378.1593419564155; 
 Mon, 29 Jun 2020 01:32:44 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d132sm27608298wmd.35.2020.06.29.01.32.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 01:32:43 -0700 (PDT)
Date: Mon, 29 Jun 2020 10:32:41 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Brian Starkey <brian.starkey@arm.com>
Subject: Re: [PATCH v2] drm: drm_fourcc: Add generic alias for 16_16_TILE
 modifier
Message-ID: <20200629083241.GJ3278063@phenom.ffwll.local>
References: <20200626163256.46duuouu6ebvtakw@DESKTOP-E1NTVVP.localdomain>
 <20200626164800.11595-1-brian.starkey@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200626164800.11595-1-brian.starkey@arm.com>
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
Cc: andrzej.p@samsung.com, liviu.dudau@arm.com, dri-devel@lists.freedesktop.org,
 matteo.franchin@arm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 26, 2020 at 05:48:00PM +0100, Brian Starkey wrote:
> In cases such as DRM_FORMAT_MOD_SAMSUNG_16_16_TILE, the modifier
> describes a generic pixel re-ordering which can be applicable to
> multiple vendors.
> 
> Define an alias: DRM_FORMAT_MOD_GENERIC_16_16_TILE, which can be
> used to describe this layout in a vendor-neutral way, and add a
> comment about the expected usage of such "generic" modifiers.
> 
> Changes in v2:
>  - Move note about future cases to comment (Daniel)
> 
> Signed-off-by: Brian Starkey <brian.starkey@arm.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  include/uapi/drm/drm_fourcc.h | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index 299f9ac4840b..cb3db4a21012 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -345,8 +345,33 @@ extern "C" {
>   * When adding a new token please document the layout with a code comment,
>   * similar to the fourcc codes above. drm_fourcc.h is considered the
>   * authoritative source for all of these.
> + *
> + * Generic modifier names:
> + *
> + * DRM_FORMAT_MOD_GENERIC_* definitions are used to provide vendor-neutral names
> + * for layouts which are common across multiple vendors. To preserve
> + * compatibility, in cases where a vendor-specific definition already exists and
> + * a generic name for it is desired, the common name is a purely symbolic alias
> + * and must use the same numerical value as the original definition.
> + *
> + * Note that generic names should only be used for modifiers which describe
> + * generic layouts (such as pixel re-ordering), which may have
> + * independently-developed support across multiple vendors.
> + *
> + * In future cases where a generic layout is identified before merging with a
> + * vendor-specific modifier, a new 'GENERIC' vendor or modifier using vendor
> + * 'NONE' could be considered. This should only be for obvious, exceptional
> + * cases to avoid polluting the 'GENERIC' namespace with modifiers which only
> + * apply to a single vendor.
> + *
> + * Generic names should not be used for cases where multiple hardware vendors
> + * have implementations of the same standardised compression scheme (such as
> + * AFBC). In those cases, all implementations should use the same format
> + * modifier(s), reflecting the vendor of the standard.
>   */
>  
> +#define DRM_FORMAT_MOD_GENERIC_16_16_TILE DRM_FORMAT_MOD_SAMSUNG_16_16_TILE
> +
>  /*
>   * Invalid Modifier
>   *
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
