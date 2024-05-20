Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2BB8C9F8E
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 17:22:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8982E10E12B;
	Mon, 20 May 2024 15:21:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7749A10E12B
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 15:21:56 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 37E5C1063
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 08:22:19 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 03B263F762
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 08:21:54 -0700 (PDT)
Date: Mon, 20 May 2024 16:21:51 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: linux@treblig.org
Cc: mripard@kernel.org, airlied@gmail.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/komeda: remove unused struct 'gamma_curve_segment'
Message-ID: <Zktqj8lONGfcl-AU@e110455-lin.cambridge.arm.com>
References: <20240516133724.251750-1-linux@treblig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240516133724.251750-1-linux@treblig.org>
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

On Thu, May 16, 2024 at 02:37:24PM +0100, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> 'gamma_curve_segment' looks like it has never been used.
> Remove it.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>

Acked-by: Liviu Dudau <liviu.dudau@arm.com>

Thanks for the clean up!

Best regards,
Liviu

> ---
>  drivers/gpu/drm/arm/display/komeda/komeda_color_mgmt.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_color_mgmt.c b/drivers/gpu/drm/arm/display/komeda/komeda_color_mgmt.c
> index d8e449e6ebda..50cb8f7ee6b2 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_color_mgmt.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_color_mgmt.c
> @@ -72,11 +72,6 @@ struct gamma_curve_sector {
>  	u32 segment_width;
>  };
>  
> -struct gamma_curve_segment {
> -	u32 start;
> -	u32 end;
> -};
> -
>  static struct gamma_curve_sector sector_tbl[] = {
>  	{ 0,    4,  4   },
>  	{ 16,   4,  4   },
> -- 
> 2.45.0
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
