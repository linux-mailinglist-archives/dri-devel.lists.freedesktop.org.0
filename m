Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D37164DE4
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 19:47:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF23088F9B;
	Wed, 19 Feb 2020 18:47:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 161A188F9B
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 18:47:11 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id w1so1477124ljh.5
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 10:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anholt-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8qdBelafRS90mTJR0ZDhtL9NP9IOAcj+85dHIAJNr6Y=;
 b=g/hXqb8CuIqhNgD9Aswj3CS8reUvchKD3YqrkSYdHc1XyfIaTm0iuYRJGW+4Hv2amW
 U4jy2Pbu0q4W8wAf2jA6gK2MCum2ae1wu9MGDw+XOHopf5JhfEIekVcXwGY16IY06UfG
 MJ+T9jeRz5aBpVE5xAkeWsdwp/C8mu3RDBkDhEplrfJi3F3Hfjir5Lz6AXWUDBbL2aN/
 UcsGyxAx3lnoSwZq9Y9cEFTZLndcpbXeBTRxZ7lmubVxJRq2RVmpMeK3CUS2Ffl13Ren
 Q5R6zf3ovrbbSa8n87WduWq9MaaD2B8AtXDhGgOZ3kPEPfpADXy7m/Vq0NHSEEbs+B7Q
 lkfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8qdBelafRS90mTJR0ZDhtL9NP9IOAcj+85dHIAJNr6Y=;
 b=EN2Lt8xkrE2PtSfH/KLhTUeVhYc9+1s7xTsKeu/e6nT+FgYFimU42SjlY/r3ZflNYd
 GWmocGyqSezgHTdibdsbOL7QsSAA5TH/pLggI/k34j4INOoZUM2UueRrmDIqtAEVe52V
 B3/ktu5ZOoRBg1Tg6KJCEqt+JEpDN2EwS5XWnsSeqMTaYH2C3KRfrJfsTiZ3tfgtWmg2
 6XRAkhDqk+jpoTXQ1qC6w1B8kr/bk9tPaG1cvGOLZ1uXC/TcsG1vsldLKC7qz0DxB1p9
 IlB2BP5P0b3MrbnDVA9cgZUakzAYUjyCpmKAQMc5FZfKUm+SP7UDE+KljwklHNIu7mMP
 0eZQ==
X-Gm-Message-State: APjAAAXXQKmr9v/hWCZNd/5q6Q/6HjSzNcVyQOPTyzPVf7svDix91YNU
 lsdGSzBqWWHoax/ubVRM6MRs+Q5TwlOCsV7MHvyHxA==
X-Google-Smtp-Source: APXvYqxA8uqB6LLhbUTY2CBVeT9BkI9HDujCxv9SmCmpPAjbCdsc2LCwJ4xqHohQStpPlOjiBLUjOuMxDy7AU78zpEY=
X-Received: by 2002:a05:651c:327:: with SMTP id
 b7mr15305071ljp.22.1582138029452; 
 Wed, 19 Feb 2020 10:47:09 -0800 (PST)
MIME-Version: 1.0
References: <20200218172821.18378-1-wambui.karugax@gmail.com>
 <20200218172821.18378-7-wambui.karugax@gmail.com>
In-Reply-To: <20200218172821.18378-7-wambui.karugax@gmail.com>
From: Eric Anholt <eric@anholt.net>
Date: Wed, 19 Feb 2020 10:46:58 -0800
Message-ID: <CADaigPXx=sT58fPabvBBMdopQ3Gz4=_r76dj0CY=y=8bNteVKA@mail.gmail.com>
Subject: Re: [PATCH] drm/v3d: make v3d_debugfs_init return 0
To: Wambui Karuga <wambui.karugax@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, gregkh@linuxfoundation.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 18, 2020 at 9:28 AM Wambui Karuga <wambui.karugax@gmail.com> wrote:
>
> As drm_debugfs_create_files should return void, remove its use as the
> return value of v3d_debugfs_init and have the function return 0
> directly.

If we're going this route, then this function should be returning void, too.

>
> Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
> ---
>  drivers/gpu/drm/v3d/v3d_debugfs.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/v3d/v3d_debugfs.c b/drivers/gpu/drm/v3d/v3d_debugfs.c
> index 9e953ce64ef7..57dded6a3957 100644
> --- a/drivers/gpu/drm/v3d/v3d_debugfs.c
> +++ b/drivers/gpu/drm/v3d/v3d_debugfs.c
> @@ -261,7 +261,8 @@ static const struct drm_info_list v3d_debugfs_list[] = {
>  int
>  v3d_debugfs_init(struct drm_minor *minor)
>  {
> -       return drm_debugfs_create_files(v3d_debugfs_list,
> -                                       ARRAY_SIZE(v3d_debugfs_list),
> -                                       minor->debugfs_root, minor);
> +       drm_debugfs_create_files(v3d_debugfs_list,
> +                                ARRAY_SIZE(v3d_debugfs_list),
> +                                minor->debugfs_root, minor);
> +       return 0;
>  }
> --
> 2.25.0
>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
