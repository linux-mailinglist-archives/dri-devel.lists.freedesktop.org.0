Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F93B1A6896
	for <lists+dri-devel@lfdr.de>; Mon, 13 Apr 2020 17:15:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B921E89E8C;
	Mon, 13 Apr 2020 15:15:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3682589E4C;
 Mon, 13 Apr 2020 15:15:53 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id h2so9632132wmb.4;
 Mon, 13 Apr 2020 08:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZOE2P5jEH093/SFJkXAgVgRQaZk9Rt+ir8LjiFeoQis=;
 b=aff51BbTFzKsXCpL5YhrA7DxEgyrrRCPmWwZUOL3KHYaxbOFqz2qgeZWsZxz0soAsP
 UWdXdUwjE6+rqWK6X8x3JrDIYZfySNLGRtMr/hGTw4BxYQRgRoQqIkjhy2Ui+DsPeJU/
 3w0XtJekYhySKH5t6TkwnBpWYKOJ4cQhY4Kihj0k5hGnmRfZBPSGH8M9wCx1VD/i5Kaa
 8oVeKu6Q9+fxZPQRI6RJcb/7+6nXXHMalCRkZ8eBwVXKpH9stjFi02JGZ+ai3Avkzitp
 nTZry48J4GQGvTh6EATNQOiLsE7Poc6LQl+TgMJ7Dw+MxALVuie46Z3gUHxr/1ERsuBg
 /NdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZOE2P5jEH093/SFJkXAgVgRQaZk9Rt+ir8LjiFeoQis=;
 b=Y5szM0bdjU36rV0jPc4Umf5VtuspxMzbLd6G2yBZpS/MeETPEjGMJjAMtSzKRH8VZ5
 cECbcX/3a8eLdF/l9+6iKGXPkQ5d4KhJwe256smjcYmhH/jq+V/v9uuqvdcrsR0xOODh
 q18tOTyTio7j9E1+QmxKGwmoyfVB3RURkYBgwxlYzFuZmydyFrTwx1qwdjmGCls4y53r
 SqFl/vf1x9QaItl6+LZqLLVJH6TsCt9IIn3tiEozUIvKIQdRmIqCO9R6V8dN5wXpAnO1
 rKDAfkuwjmBymmmVzCHmAspjdvn8MB3ZVBuS7Vn4Bm0wz3/c9uQVJFptHWEmb+zvZH75
 yqyA==
X-Gm-Message-State: AGi0PuZt+kPnz/zVVwLbf3+S5r+gdRbtsEjJJw/Szdq+6t5dQw6VduRa
 R9Hjeb6CkaFLNwjZY8ETs1CVbXZrcV9RLEYvxx0=
X-Google-Smtp-Source: APiQypLHuiS6scHkDpSNfTRPyoEdHVy8Bj6zjoCNDYrKSaz9THG91uzh6/pXXdN3L1Hm1QzrZ4lPTVZY3QJSZiT3zhA=
X-Received: by 2002:a7b:cc0e:: with SMTP id f14mr2795738wmh.39.1586790951873; 
 Mon, 13 Apr 2020 08:15:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200413143235.22945-1-yanaijie@huawei.com>
In-Reply-To: <20200413143235.22945-1-yanaijie@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 13 Apr 2020 11:15:40 -0400
Message-ID: <CADnq5_NejL35EFrK3doJHQXE3z5qeE_KVydB4AxbmGC=-_-++Q@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: remove dead code in si_dpm.c
To: Jason Yan <yanaijie@huawei.com>
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
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, Dave Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Hulk Robot <hulkci@huawei.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Mon, Apr 13, 2020 at 10:06 AM Jason Yan <yanaijie@huawei.com> wrote:
>
> This code is dead, let's remove it.
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Jason Yan <yanaijie@huawei.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/si_dpm.c | 20 --------------------
>  1 file changed, 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/si_dpm.c b/drivers/gpu/drm/amd/amdgpu/si_dpm.c
> index 0860e85a2d35..c00ba4b23c9a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/si_dpm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/si_dpm.c
> @@ -345,26 +345,6 @@ static const struct si_dte_data dte_data_tahiti =
>         false
>  };
>
> -#if 0
> -static const struct si_dte_data dte_data_tahiti_le =
> -{
> -       { 0x1E8480, 0x7A1200, 0x2160EC0, 0x3938700, 0 },
> -       { 0x7D, 0x7D, 0x4E4, 0xB00, 0 },
> -       0x5,
> -       0xAFC8,
> -       0x64,
> -       0x32,
> -       1,
> -       0,
> -       0x10,
> -       { 0x78, 0x7C, 0x82, 0x88, 0x8E, 0x94, 0x9A, 0xA0, 0xA6, 0xAC, 0xB0, 0xB4, 0xB8, 0xBC, 0xC0, 0xC4 },
> -       { 0x3938700, 0x3938700, 0x3938700, 0x3938700, 0x3938700, 0x3938700, 0x3938700, 0x3938700, 0x3938700, 0x3938700, 0x3938700, 0x3938700, 0x3938700, 0x3938700, 0x3938700, 0x3938700 },
> -       { 0x2AF8, 0x2AF8, 0x29BB, 0x27F9, 0x2637, 0x2475, 0x22B3, 0x20F1, 0x1F2F, 0x1D6D, 0x1734, 0x1414, 0x10F4, 0xDD4, 0xAB4, 0x794 },
> -       85,
> -       true
> -};
> -#endif
> -
>  static const struct si_dte_data dte_data_tahiti_pro =
>  {
>         { 0x1E8480, 0x3D0900, 0x989680, 0x2625A00, 0x0 },
> --
> 2.21.1
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
