Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0523C361003
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 18:20:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 005896EA7F;
	Thu, 15 Apr 2021 16:20:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc36.google.com (mail-oo1-xc36.google.com
 [IPv6:2607:f8b0:4864:20::c36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF1A26EA7F;
 Thu, 15 Apr 2021 16:20:28 +0000 (UTC)
Received: by mail-oo1-xc36.google.com with SMTP id
 t140-20020a4a3e920000b02901e5c1add773so4263521oot.1; 
 Thu, 15 Apr 2021 09:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4wy9+FSYsHBNYRRKB8rjo0Aurqevxrj+BEYYslbcwfQ=;
 b=cBcAin6sml73IfOxqihWogeWPV+X/rC4KvlNxcRfdFy3+vfft12MtwmdPItF0gvDXe
 5DulcxJe8LzdfYVHy3xPIXtjqyEhs1EjzWnY5dJVf1ALw0jhKPGHF44LXveEBpVaQb9j
 nxNhNW+IVe4x0/ngrTkjzjbJQ3UrwOJlP/iavPuKafuK+g7cS77VXCjNeBkndEn8lfgH
 fiiy+MF008A0ShNEKPD9lthEkDj+tTjzyS4tw5fwLEPo8XrIJM90vK/CXQDjvo/58AoJ
 lLtEVEm3st1DTgV7nXBSmNzut4IStBQvg/cHzqXK62fzbUekA7uS8nwrNsg9GCx7sLkd
 n5eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4wy9+FSYsHBNYRRKB8rjo0Aurqevxrj+BEYYslbcwfQ=;
 b=OhNgxPS5I9eWj9ISxLUIBODLbPygFt2Uji9P4y0DB5M2JJU3WuX+OyHcGfpCq5BvBE
 IwNBOrw0fLnLxUsHK4VhrQYugFnzGSG4sFqgdRaRVE5meMSplCcxThoIFl+OCsahm+sQ
 RNl5d6pb+QoQeNuYXFYDULhZHF2+WpbGEQAxNkEh7Ga4p2evRHLny0DWlefMlS8SDLK5
 soF3oxDtNbXeevoLDrO8OcQuCLrCIVW2YUwluNJe3+jZytn7MNza1oAn3FZomJblKKdq
 8T80ZLFY4tlpJnZdycTeONEPCKQjg/XX1WM85CAkxoVnEfvlZ6NYe0BVqsvk+3rWXF+4
 vB8A==
X-Gm-Message-State: AOAM532Dkr1+1OjGyYbgtbJoFpl4VRDEVEoFkuPBCGRD9bpxvufD/ekR
 xusD8o6VwB8yh796G7wvDVXJSuNq9WuLt7a184A=
X-Google-Smtp-Source: ABdhPJxS3N09Snz488dSxKq8qMJh5tRsGiKdDxpn2eYSpvVMwBt2NmG+/+tHw6cbDHAW8x2kFyAY7enUtwmSLN0amYg=
X-Received: by 2002:a4a:2410:: with SMTP id m16mr3241288oof.90.1618503628040; 
 Thu, 15 Apr 2021 09:20:28 -0700 (PDT)
MIME-Version: 1.0
References: <1618284379-28126-1-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1618284379-28126-1-git-send-email-tiantao6@hisilicon.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 15 Apr 2021 12:20:16 -0400
Message-ID: <CADnq5_M-236qN22kyypzVDvOj0RnFLegqoiTkSFuquqe6o0JYg@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon/cik: remove set but not used variables
To: Tian Tao <tiantao6@hisilicon.com>
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
Cc: Dave Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 12, 2021 at 11:26 PM Tian Tao <tiantao6@hisilicon.com> wrote:
>
> The value of pipe_id and queue_id  are not used under certain
> circumstances, so just delete.
>
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/radeon/cik.c | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/cik.c b/drivers/gpu/drm/radeon/cik.c
> index 8b7a4f7..42a8afa 100644
> --- a/drivers/gpu/drm/radeon/cik.c
> +++ b/drivers/gpu/drm/radeon/cik.c
> @@ -7948,8 +7948,6 @@ int cik_irq_process(struct radeon_device *rdev)
>                         DRM_ERROR("Illegal register access in command stream\n");
>                         /* XXX check the bitfield order! */
>                         me_id = (ring_id & 0x60) >> 5;
> -                       pipe_id = (ring_id & 0x18) >> 3;
> -                       queue_id = (ring_id & 0x7) >> 0;
>                         switch (me_id) {
>                         case 0:
>                                 /* This results in a full GPU reset, but all we need to do is soft
> @@ -7971,8 +7969,6 @@ int cik_irq_process(struct radeon_device *rdev)
>                         DRM_ERROR("Illegal instruction in command stream\n");
>                         /* XXX check the bitfield order! */
>                         me_id = (ring_id & 0x60) >> 5;
> -                       pipe_id = (ring_id & 0x18) >> 3;
> -                       queue_id = (ring_id & 0x7) >> 0;
>                         switch (me_id) {
>                         case 0:
>                                 /* This results in a full GPU reset, but all we need to do is soft
> --
> 2.7.4
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
