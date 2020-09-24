Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F27AE2770BF
	for <lists+dri-devel@lfdr.de>; Thu, 24 Sep 2020 14:17:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2767A6E417;
	Thu, 24 Sep 2020 12:17:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc43.google.com (mail-oo1-xc43.google.com
 [IPv6:2607:f8b0:4864:20::c43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4B966E417
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 12:17:42 +0000 (UTC)
Received: by mail-oo1-xc43.google.com with SMTP id k13so726177oor.2
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Sep 2020 05:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7HN/HI4dwoGWhFGZaqsVrimFaGkQhy54n7OCWCnDDtM=;
 b=dSH8FEbIB4cFd19+AsZS6btZzKrYEzAmPhSb0WCqhiYF36qSv5h8pDfTJbFz+Qxp+j
 oxN6+UiHZtTkF9oWnbdvAlPloEM5oh9p5+GS7rqslhd3+YniZBsVzX8PaQ9Q2Sf4qVN6
 hhHA8TQUm1N2J//yMqennU0VH4XKduafoG0DA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7HN/HI4dwoGWhFGZaqsVrimFaGkQhy54n7OCWCnDDtM=;
 b=sDxkTBbbVyUYJ8iz7CD0AFcFBUg67BNyPcsNFLPeSCcY14ktFSKUss/jA8/cgtT67d
 a1cXd/R86GBJbG3ysC5OHzXjboL8ZUQoL6af/ZH8WA6Ti2S69hX+IezjTKBX/OamByjW
 JJzVewx5WYwNUDqUaz4jguyG4nst1tXYrV6GvYRtGg0eWCIOIvtDgU5UarSGGCRBLCLy
 Kqitb4DV8ejBNrYK5CPzbqeaalyQwfyzaZMNW1zazRSsQYp1BDsQQUgHn/rso9yvgEMO
 Yb6oUX4uMXWJcUL8SdYz+IyMUfBfm7bAOl+fiN4W6zA3hbbB5q/u7M8Xke2Jk9rEaB2y
 AAHw==
X-Gm-Message-State: AOAM530XwPpATdRno5eXRqe35RyjmLnMqF3NU31qveYEo98YOZzO8sBy
 AmwPbiccIdY5NV27w3T2JpdDsp/qfrELEq4EtFrKXQ==
X-Google-Smtp-Source: ABdhPJz/V0WNYrr+r6E1miqNu5wyBbxnQTWKTNNcEVyvUVBoTyyd8eXv6ECanpkYGPZ/3EmRuPKhQ7KjKtsVRaMTFVA=
X-Received: by 2002:a4a:e592:: with SMTP id o18mr3075813oov.28.1600949862219; 
 Thu, 24 Sep 2020 05:17:42 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20200924112530eucas1p13af17d649767ed51c619d303392fa1e1@eucas1p1.samsung.com>
 <7b709254-9412-8473-250c-0c4e006259b3@samsung.com>
In-Reply-To: <7b709254-9412-8473-250c-0c4e006259b3@samsung.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 24 Sep 2020 14:17:31 +0200
Message-ID: <CAKMK7uEMXdFQV3rO9fCMYbf52n3DOhyGi-9WBTreeHJkm1+n-Q@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: mark FRAMEBUFFER LAYER as Orphan
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 24, 2020 at 1:25 PM Bartlomiej Zolnierkiewicz
<b.zolnierkie@samsung.com> wrote:
>
> It has been a fun ride since 2017 but unfortunately I don't have
> enough time to look after it properly anymore.
>
> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Thanks a lot for all the work you put in in picking up patches and
cleaning up drivers for compile testing! Very much appreciated.

I think for now we can just leave fbdev in drm-misc, with people
picking up patches ad-hoc (and maintainers serving as fallbacks).

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I guess you'll push this yourself as the last one, for closure and all :-)

Also drm-misc commit rights will stay around for you (except if you
want to hand that in) so if you have and display/gpu patches you can
still push them through the usual flow.

Cheers, Daniel
> ---
>  MAINTAINERS |    3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> Index: b/MAINTAINERS
> ===================================================================
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6894,10 +6894,9 @@ F:       drivers/net/wan/dlci.c
>  F:     drivers/net/wan/sdla.c
>
>  FRAMEBUFFER LAYER
> -M:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
>  L:     dri-devel@lists.freedesktop.org
>  L:     linux-fbdev@vger.kernel.org
> -S:     Maintained
> +S:     Orphan
>  Q:     http://patchwork.kernel.org/project/linux-fbdev/list/
>  T:     git git://anongit.freedesktop.org/drm/drm-misc
>  F:     Documentation/fb/
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
