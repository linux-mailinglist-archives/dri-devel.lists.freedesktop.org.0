Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5E1397777
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 18:05:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C31CB6E046;
	Tue,  1 Jun 2021 16:05:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F9376E046
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jun 2021 16:05:17 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id n2so14983333wrm.0
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Jun 2021 09:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=6hYvV1ZLP+xMrFDhtMUMFiYVGTkJ+UiqIQSVG/EohRE=;
 b=HLjN80P0ak7Jx9CtCQYucHtcNmJ6urFt2HolmpDzUZ2je8iVTeqGx8fQ1TOJrci8bv
 xHosrB8C2ihkl3nQJwyf/Qs+xfI33Eod1BG/RkgRt3CmFQRoYCg6qTNtKzpAdjKOiWmB
 kCfu9Jm3JAyBAi0QkbqJYy0h+f7jR698S8DrE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=6hYvV1ZLP+xMrFDhtMUMFiYVGTkJ+UiqIQSVG/EohRE=;
 b=iBZyInIdmUC7gPmtgy0uv5OlptqKrwSEqA36G9UHeqfx717LB+kw1dU4k9MkPGxu4i
 prBY2xhoU8fej50BXFCbJ4EFl7k5eZ8W724Qpk0bPUKi6y6E68bmLY8lWRMQBWVSVeth
 N1iKaqmyJ/+fz9HNqW0Eq80B9Qx/gKrgE4Eysg+Lniq42BO9Qq1irFpM+hXf4gkHbFAI
 hIOb23iL8byRdKktH5hAwVjzlWUi9KhkNPGn8eCWp2rojefKyFubBZWXXhomkgobKp6I
 BHF8enXmzN/7HbgfiBAD9w7xjVq9yBQbc8cZa79fc8uxQna5fOavTe5je7/wIw3pmt/j
 a7MA==
X-Gm-Message-State: AOAM531lPXFkIfL8GzD9rRbKNTvmEOVF8Pjq3ovLDSJO3oJUWdSCRRA+
 HGQAAH3v/DmR/lteCKmFD9hXug==
X-Google-Smtp-Source: ABdhPJzq2ewoSxbWvhQouYQM3hTC5PtMTjQisz0uB+MLFo9IL0F9rkkfvAdPT+tbNS77wjgurbim8g==
X-Received: by 2002:adf:e58d:: with SMTP id l13mr28459183wrm.369.1622563516048; 
 Tue, 01 Jun 2021 09:05:16 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d131sm3143120wmd.4.2021.06.01.09.05.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 09:05:15 -0700 (PDT)
Date: Tue, 1 Jun 2021 18:05:13 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: lijian_8010a29@163.com
Subject: Re: [PATCH] video: fbdev: atyfb: mach64_cursor.c: deleted the
 repeated word
Message-ID: <YLZauT5Awwf3UlOw@phenom.ffwll.local>
Mail-Followup-To: lijian_8010a29@163.com, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 lijian <lijian@yulong.com>
References: <20210601012747.38884-1-lijian_8010a29@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210601012747.38884-1-lijian_8010a29@163.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, lijian <lijian@yulong.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 01, 2021 at 09:27:47AM +0800, lijian_8010a29@163.com wrote:
> From: lijian <lijian@yulong.com>
> 
> deleted the repeated word 'be' in the comments.
> 
> Signed-off-by: lijian <lijian@yulong.com>

Applied to drm-misc-next, thanks for your patch.
-Daniel

> ---
>  drivers/video/fbdev/aty/mach64_cursor.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/video/fbdev/aty/mach64_cursor.c b/drivers/video/fbdev/aty/mach64_cursor.c
> index b06fa6e42e6e..4ad0331a8c57 100644
> --- a/drivers/video/fbdev/aty/mach64_cursor.c
> +++ b/drivers/video/fbdev/aty/mach64_cursor.c
> @@ -46,7 +46,7 @@
>   * The Screen position of the top left corner of the displayed
>   * cursor is specificed by CURS_HORZ_VERT_POSN. Care must be taken
>   * when the cursor hot spot is not the top left corner and the
> - * physical cursor position becomes negative. It will be be displayed
> + * physical cursor position becomes negative. It will be displayed
>   * if either the horizontal or vertical cursor position is negative
>   *
>   * If x becomes negative the cursor manager must adjust the CURS_HORZ_OFFSET
> -- 
> 2.25.1
> 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
