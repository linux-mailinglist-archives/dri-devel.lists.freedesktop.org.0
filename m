Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 243D8205752
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jun 2020 18:35:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48E4F6EA00;
	Tue, 23 Jun 2020 16:35:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF89E6EA00
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jun 2020 16:35:52 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id i3so24199640ljg.3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jun 2020 09:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fEg6d25UGfcPYY7V+Hk1VnYd/BQrvpNa49hlVGHxeMA=;
 b=e5UWG/uq7VlzVdXxW7H1FtNuYg9CuE0jZ+f195RVA75WoKMrBfXE99E0IyqjmT6B93
 CVUcGT3+r/Y7uGMiJXh8wn7+nX1Juwa+379k82vm9KCjn1MtgLexvNJW8KKAS83NdTfq
 bvEzIPJi0wmZ2GKpd5bvXa3XLMLI1ms5+Ppn2c/m/oRNuLtUTDaWUt6zQIp6oMTey0fH
 xHzwX1EmVIu6qDUGQkwT/NrSTVq8+IOgAwnkJt5Qe2uIx++GLGEY7OZEPSsjvftBl0Te
 R+Xe18DrNiV/eJ2GI5BYFGNnKTlCBjirbxqWeXJuH61OlvJ2WQXaF9VDvMzhOt8L4rVN
 iPJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fEg6d25UGfcPYY7V+Hk1VnYd/BQrvpNa49hlVGHxeMA=;
 b=YCbMpYhPtzlSh+ZUsNs/eV9jF79r1W/RCc5yDrvGwcqrtCI31tzRkMfQhgmrlrmj0K
 nQKO7FpbHXKcKCzRPGTaUh451P23SKs99k46OY7bMFGNykMlTbtcggqx1JAtvmRqnUm+
 gjkq5GSeqNiu+0wLFXMWEPjaPy3VLLW0DhqQ9cc+IWpFdREzdujB5aPZiFJE8xW8gfuc
 vcnlRqnCkDxVA6Zl5ke6YOpvcn/Bka6vXh96NUEbOeP4mjQYF+9KZoVVuAqUo8gs2g3v
 5nbntH3pHbvV4zU8/z2lChF3CHayW8VpUUwoyQmmQUiWe9nbTIt8ZSUAsa/L7vXkEh7t
 5kxg==
X-Gm-Message-State: AOAM530lLL3aq87FD0pClFRC4HlsgJ0SMkb/kw3fqoxDKJwgG5YOUDL0
 OUOt71hEsvQsQ4o+Joy/GKn/W4NpTY6581OrRhI=
X-Google-Smtp-Source: ABdhPJx7RZSTdg9v9+N1buYRGoXyIHiqxid7CrjNsjgZq8odaQKJBKeuXj1I1etNdvQWsOzD471lJ9LYfU2F7bphppQ=
X-Received: by 2002:a2e:8783:: with SMTP id n3mr6787289lji.224.1592930151040; 
 Tue, 23 Jun 2020 09:35:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200622204537.26792-1-efremov@linux.com>
In-Reply-To: <20200622204537.26792-1-efremov@linux.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Tue, 23 Jun 2020 18:35:40 +0200
Message-ID: <CAMeQTsYAomJnjc6eVnDxQL+FC3nG+n1ZDqUPGgDpU=tt9d+JMA@mail.gmail.com>
Subject: Re: [PATCH] drm/gma500: Fix direction check in psb_accel_2d_copy()
To: Denis Efremov <efremov@linux.com>
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
Cc: David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>, stable@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>, Alan Cox <alan@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 22, 2020 at 10:45 PM Denis Efremov <efremov@linux.com> wrote:
>
> psb_accel_2d_copy() checks direction PSB_2D_COPYORDER_BR2TL twice.
> Based on psb_accel_2d_copy_direction() results, PSB_2D_COPYORDER_TL2BR
> should be checked instead in the second direction check.
>
> Fixes: 4d8d096e9ae8 ("gma500: introduce the framebuffer support code")
> Cc: stable@vger.kernel.org
> Signed-off-by: Denis Efremov <efremov@linux.com>
> ---
>  drivers/gpu/drm/gma500/accel_2d.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/gma500/accel_2d.c b/drivers/gpu/drm/gma500/accel_2d.c
> index adc0507545bf..8dc86aac54d2 100644
> --- a/drivers/gpu/drm/gma500/accel_2d.c
> +++ b/drivers/gpu/drm/gma500/accel_2d.c
> @@ -179,8 +179,8 @@ static int psb_accel_2d_copy(struct drm_psb_private *dev_priv,
>                 src_x += size_x - 1;
>                 dst_x += size_x - 1;
>         }
> -       if (direction == PSB_2D_COPYORDER_BR2TL ||
> -           direction == PSB_2D_COPYORDER_BL2TR) {
> +       if (direction == PSB_2D_COPYORDER_BL2TR ||
> +           direction == PSB_2D_COPYORDER_TL2BR) {

Hi Denis,

Sorry, I don't follow. The code seems already correct to me.

src_x and dst_x gets adjusted when going from right to left
src_y and dst_y gets adjusted when going from bottom to top.

PSB_2D_COPYORDER_TL2BR needs no adjustment because it is the normal
blit direction.

Thanks
Patrik

>                 src_y += size_y - 1;
>                 dst_y += size_y - 1;
>         }
> --
> 2.26.2
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
