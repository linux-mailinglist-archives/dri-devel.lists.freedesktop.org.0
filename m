Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CBCA48A9C
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 22:34:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3A6A10EB9B;
	Thu, 27 Feb 2025 21:34:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="jdFrtzEU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E76C110EB9B
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Feb 2025 21:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
 :Subject; bh=uHZuuz0IVdaWI7A2r3gR44iE1/btqOd/7KwGlKdv5sI=; b=jdFrtzEUfaFAzTI9
 BJ8cCJoE1TwRf58Eu7+tc5sa3fEyoHA9qWklQvSLpqFMg61A/jQYwXJCuUH1EKRAOkRb81x2jpj+Q
 Vn/6Ge4D61oCnoP/lyM7JRLGb+xDNZkqsXvhgh+IXdI55vNFJQpkL0icNSfGX/Y6223lo6n/L2ATa
 rNM8p8th8Wf0T7WEX9+gHzEbJ9iHQeGEHYn0pKXk/4PkLg/zWIaYNUroa5HDFi9fXarYZtHuQtxH1
 xU44NNGG4tRbmr4mJkPyCHLDN/Ea5i/Y/z8S6pfZb8oN5y4n8YB2SfSzHsKqf7YdxyOncIwEgYZv/
 KxrAYc4ENdzcXhv8Sw==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
 (envelope-from <dg@treblig.org>) id 1tnlWH-001TD8-1R;
 Thu, 27 Feb 2025 21:34:13 +0000
Date: Thu, 27 Feb 2025 21:34:13 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: airlied@gmail.com, simona@ffwll.ch
Cc: hdegoede@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/vboxvideo: Remove unused hgsmi_cursor_position
Message-ID: <Z8DaVW_U-QtBVSMf@gallifrey>
References: <20241215220014.452537-1-linux@treblig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20241215220014.452537-1-linux@treblig.org>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 21:31:52 up 295 days,  8:45,  1 user,  load average: 0.00, 0.00, 0.00
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
> hgsmi_cursor_position() has been unused since 2018's
> commit 35f3288c453e ("staging: vboxvideo: Atomic phase 1: convert cursor to
> universal plane")
> 
> Remove it.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>

Hi David, Simona,
  Will this one be picked up by drm-next?  It got Hans's
review back on 16 Dec.
( in 2513e942-6391-4a96-b487-1e4ba19b7aeb@redhat.com )

  Thanks,

Dave

> ---
>  drivers/gpu/drm/vboxvideo/hgsmi_base.c      | 37 ---------------------
>  drivers/gpu/drm/vboxvideo/vboxvideo_guest.h |  2 --
>  2 files changed, 39 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vboxvideo/hgsmi_base.c b/drivers/gpu/drm/vboxvideo/hgsmi_base.c
> index 87dccaecc3e5..db994aeaa0f9 100644
> --- a/drivers/gpu/drm/vboxvideo/hgsmi_base.c
> +++ b/drivers/gpu/drm/vboxvideo/hgsmi_base.c
> @@ -181,40 +181,3 @@ int hgsmi_update_pointer_shape(struct gen_pool *ctx, u32 flags,
>  
>  	return rc;
>  }
> -
> -/**
> - * hgsmi_cursor_position - Report the guest cursor position.  The host may
> - *                         wish to use this information to re-position its
> - *                         own cursor (though this is currently unlikely).
> - *                         The current host cursor position is returned.
> - * Return: 0 or negative errno value.
> - * @ctx:              The context containing the heap used.
> - * @report_position:  Are we reporting a position?
> - * @x:                Guest cursor X position.
> - * @y:                Guest cursor Y position.
> - * @x_host:           Host cursor X position is stored here.  Optional.
> - * @y_host:           Host cursor Y position is stored here.  Optional.
> - */
> -int hgsmi_cursor_position(struct gen_pool *ctx, bool report_position,
> -			  u32 x, u32 y, u32 *x_host, u32 *y_host)
> -{
> -	struct vbva_cursor_position *p;
> -
> -	p = hgsmi_buffer_alloc(ctx, sizeof(*p), HGSMI_CH_VBVA,
> -			       VBVA_CURSOR_POSITION);
> -	if (!p)
> -		return -ENOMEM;
> -
> -	p->report_position = report_position;
> -	p->x = x;
> -	p->y = y;
> -
> -	hgsmi_buffer_submit(ctx, p);
> -
> -	*x_host = p->x;
> -	*y_host = p->y;
> -
> -	hgsmi_buffer_free(ctx, p);
> -
> -	return 0;
> -}
> diff --git a/drivers/gpu/drm/vboxvideo/vboxvideo_guest.h b/drivers/gpu/drm/vboxvideo/vboxvideo_guest.h
> index 55fcee3a6470..643c4448bdcb 100644
> --- a/drivers/gpu/drm/vboxvideo/vboxvideo_guest.h
> +++ b/drivers/gpu/drm/vboxvideo/vboxvideo_guest.h
> @@ -34,8 +34,6 @@ int hgsmi_query_conf(struct gen_pool *ctx, u32 index, u32 *value_ret);
>  int hgsmi_update_pointer_shape(struct gen_pool *ctx, u32 flags,
>  			       u32 hot_x, u32 hot_y, u32 width, u32 height,
>  			       u8 *pixels, u32 len);
> -int hgsmi_cursor_position(struct gen_pool *ctx, bool report_position,
> -			  u32 x, u32 y, u32 *x_host, u32 *y_host);
>  
>  bool vbva_enable(struct vbva_buf_ctx *vbva_ctx, struct gen_pool *ctx,
>  		 struct vbva_buffer *vbva, s32 screen);
> -- 
> 2.47.1
> 
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/
