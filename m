Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 559E38D87DB
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jun 2024 19:25:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F27FE10E149;
	Mon,  3 Jun 2024 17:24:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="ewxxzmI2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3893E10E149
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jun 2024 17:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
 :Subject; bh=iwxVgDKgpII9YwB+g1rLq5aAZrKLOtuFQoD3t7nzPuk=; b=ewxxzmI2dZ1KiJRS
 YLOAoOTNEBjRnVpNLVkbJ8jiuJ1VYzqKuQaAFUvK0qw60+1dWHsFzsyvfiaSzMRh11srltfLzd/gi
 gu+2OPHm1HfV3Qotv2tKhTdpSw1LHoaOPHxOo6281klS9cJpM/43vC3LlBsyyBWhoitjYy0BSdlRS
 fYv21e+55BmIMBx/j6xbkLTXmO6wYS3LH5TzXelFhuiHMidVvXOF/SdDlP/P071DxDYD/+wQbcViE
 Unv8lGVCVPBx1/+bhL1/ELvg+2Q82nbguN8oYl56mjz8i/tqeDsPGoOHHU9ZSsqY5O9YbZuP/Jphf
 jfkKFZWwxWQmZkglxw==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
 (envelope-from <dg@treblig.org>) id 1sEBQL-003zrJ-2E;
 Mon, 03 Jun 2024 17:24:45 +0000
Date: Mon, 3 Jun 2024 17:24:45 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: zack.rusin@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de
Cc: daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/6] drm/vmwgfx: remove unused struct 'vmw_stdu_dma'
Message-ID: <Zl38XRm7TAfb3azW@gallifrey>
References: <20240517232858.230860-1-linux@treblig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20240517232858.230860-1-linux@treblig.org>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 17:21:53 up 26 days, 4:35, 1 user, load average: 0.00, 0.00, 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)
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

* linux@treblig.org (linux@treblig.org) wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> 'vmw_stdu_dma' is unused since
> commit 39985eea5a6d ("drm/vmwgfx: Abstract placement selection")
> Remove it.

Ping.

> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
> index 2041c4d48daa..50022e9e3519 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
> @@ -85,11 +85,6 @@ struct vmw_stdu_update {
>  	SVGA3dCmdUpdateGBScreenTarget body;
>  };
>  
> -struct vmw_stdu_dma {
> -	SVGA3dCmdHeader     header;
> -	SVGA3dCmdSurfaceDMA body;
> -};
> -
>  struct vmw_stdu_surface_copy {
>  	SVGA3dCmdHeader      header;
>  	SVGA3dCmdSurfaceCopy body;
> -- 
> 2.45.1
> 
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
