Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C889C15F4EF
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2020 19:25:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E2A56FB78;
	Fri, 14 Feb 2020 18:25:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A57B6E854
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 18:25:11 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id y11so11990958wrt.6
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Feb 2020 10:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=2v+GbDgoBeXkfNQ+uPKJ4b5v6lv/LCiGoeI5/c1pCwk=;
 b=egbkHbC31/YhDg1VmB5sT3a5h0Kd7EKe0qtYoL4U/ny71evn0bseAzLeKOqEEG0YPs
 g4FPsCzY2SHlrNVtlkq6L5/JwNrT52GXKeWzuUXkODzWvc1EdEbU6W8ZSNxsHm18+Fki
 icj3t5cRrP4ZGZWNYCCGYWVDv1gIOCpJtFBs0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=2v+GbDgoBeXkfNQ+uPKJ4b5v6lv/LCiGoeI5/c1pCwk=;
 b=BdCOxQDw9sB8cOj5lwzUlyid0YGrL4Rq/di3zkFQSAh5Hd5CtfbGqPYtgUyioisrQo
 O/0mBRETH2nPAzpZPF4NwS/ySx0c7Zd13JcfrTpbf8z8hk600hqkKhzYDMrVqzmj2nlo
 YtVqKsETD+8pghpy6GHwjHjXUZNmQJNjCH1uYS9XyPVj+jLg7TDDtryDWBjNH7ESRXmi
 pj8npRb3cnjhOfG+deMxhPYKFaRJDKThfC18iomfq8LILj9rVemkNBQjcwNCKn8nrz7o
 JSqxhEdr8sFOQAkPDinl+vAKnt6aJmC5B4RxrnQpZOujdAu9MzvttTzU1W8qUXYhMWQ0
 lYvQ==
X-Gm-Message-State: APjAAAUo8dtoxzixAIrT6ddVPqeDipslpg+l/evvLENVGPxGRJfx02oN
 Wc32oYs9ArWjdBL2/owdHeBRrkozxiw=
X-Google-Smtp-Source: APXvYqxvnSdhkfrz6JtmNai++r29ZoWmc0+KBKkFhTTQh97u0Qh45uAjpdW1mvHJ+nElDGQ1b6Sokw==
X-Received: by 2002:adf:dd52:: with SMTP id u18mr5202104wrm.131.1581704709694; 
 Fri, 14 Feb 2020 10:25:09 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g21sm7939394wmh.17.2020.02.14.10.25.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 10:25:09 -0800 (PST)
Date: Fri, 14 Feb 2020 19:25:07 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH RESEND] drm/mcde: Fix Sphinx formatting
Message-ID: <20200214182507.GX2363188@phenom.ffwll.local>
Mail-Followup-To: Jonathan =?iso-8859-1?Q?Neusch=E4fer?=
 <j.neuschaefer@gmx.net>, dri-devel@lists.freedesktop.org,
 Linus Walleij <linus.walleij@linaro.org>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org
References: <20200214163815.25442-1-j.neuschaefer@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200214163815.25442-1-j.neuschaefer@gmx.net>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 14, 2020 at 05:38:15PM +0100, Jonathan Neusch=E4fer wrote:
> - Format the pipe diagram as a monospace block.
> - Fix formatting of the list. Without the empty line, the first dash is
>   not parsed as a bullet point.
> =

> Signed-off-by: Jonathan Neusch=E4fer <j.neuschaefer@gmx.net>
> ---
> Previous copy: https://lore.kernel.org/lkml/20191002153827.23026-2-j.neus=
chaefer@gmx.net/
> =

> It seems that this patch got lost, somehow.

Occasionally happens with the committer model we have, especially for
smaller drivers. Thanks for resending, applied to drm-misc-next now.
-Daniel

> ---
>  drivers/gpu/drm/mcde/mcde_drv.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> =

> diff --git a/drivers/gpu/drm/mcde/mcde_drv.c b/drivers/gpu/drm/mcde/mcde_=
drv.c
> index 9a09eba53182..c535abed4765 100644
> --- a/drivers/gpu/drm/mcde/mcde_drv.c
> +++ b/drivers/gpu/drm/mcde/mcde_drv.c
> @@ -20,11 +20,11 @@
>   * input formats including most variants of RGB and YUV.
>   *
>   * The hardware has four display pipes, and the layout is a little
> - * bit like this:
> + * bit like this::
>   *
> - * Memory     -> Overlay -> Channel -> FIFO -> 5 formatters -> DSI/DPI
> - * External      0..5       0..3       A,B,    3 x DSI         bridge
> - * source 0..9                         C0,C1   2 x DPI
> + *   Memory     -> Overlay -> Channel -> FIFO -> 5 formatters -> DSI/DPI
> + *   External      0..5       0..3       A,B,    3 x DSI         bridge
> + *   source 0..9                         C0,C1   2 x DPI
>   *
>   * FIFOs A and B are for LCD and HDMI while FIFO CO/C1 are for
>   * panels with embedded buffer.
> @@ -43,6 +43,7 @@
>   * to change as we exploit more of the hardware capabilities.
>   *
>   * TODO:
> + *
>   * - Enabled damaged rectangles using drm_plane_enable_fb_damage_clips()
>   *   so we can selectively just transmit the damaged area to a
>   *   command-only display.
> --
> 2.20.1
> =


-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
