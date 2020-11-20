Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 480512BB94B
	for <lists+dri-devel@lfdr.de>; Fri, 20 Nov 2020 23:45:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A2016E93A;
	Fri, 20 Nov 2020 22:45:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFD586E93A;
 Fri, 20 Nov 2020 22:45:19 +0000 (UTC)
Received: by mail-yb1-xb44.google.com with SMTP id v92so10031402ybi.4;
 Fri, 20 Nov 2020 14:45:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IGDOWKKq6xCnwWSk70Q1NBr14x+oJN9x0alo3n+41Pg=;
 b=T3DJ41JXNehc3YEEyUuo5UvcD/cQ+JatOO/tdt3eh50lPdetbDtOJYdAPhYJTPdk1t
 +6AFOHIME9KTQe0XLW8au3BnP8i+FCqBSF74pQAD2VJ1Ta+fC0cRMrVdOZKt7VZbGiKF
 WBy0ZyY5/ccNsVar/FG0NF/kE3neLoEA5W/gWyaynqAljCK3P9et7g2Qt3c4np6pZUPW
 6MkwxwgE+N1arvNhqFf6WtXV4qfl0ecoZublkqxLjM3Gbab8ZSYwDgUdg0c+T3WxgMzG
 0KiY6BJEcezFhOtJfuWg09qtqK5EtWKnDEvtV5zB6oBjXTdXJwbBlisPz9Ze5/LMmB8i
 j1JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IGDOWKKq6xCnwWSk70Q1NBr14x+oJN9x0alo3n+41Pg=;
 b=U0eUpU/WHjyw19Iem7Dr9WcOOUPHrmTRAz+YKU4dJgwE9EyyjM2sWW5+5dc2VwKLWI
 8NbRauU5qJODKz0sq27QnySsV+OhMSZL7dsK3W2NGiN1N0xxOMbk+s2HwSXg7/p6IiO5
 mTXSqXNs+A1U823c6SKPRTmTypKst7qf2wCAW5OV+R28BYF88HAnrsol36m/301CzASx
 Hcp5vzeiWSW7oXfl6TI215vrveQ9ppxm0FMVWeH6ccVnwkHmP3/WXU3IW1ydcX6Eyi35
 J7/jh9ATG8Imm9S4qPBCy4ESlItBJEjL7srxEUApQL+Aa7lOCnrIkD8BDcoSr2N0esW2
 MG/w==
X-Gm-Message-State: AOAM533IpSxr+vqDzCINvoT/0+r2Oc7dxi76pyPyTbFCrJ82XdBnLbu5
 KdjHH//NsxnECSIYyUD6y9aG3+8DW66G/oKqqIs=
X-Google-Smtp-Source: ABdhPJy4XXPGwSb5+sjtbSWzHe15A2qwK1ApZqcOU1rinnFDil8g58upNilSYntsp396xqgfbJ7fwyczHoFalkRV8eI=
X-Received: by 2002:a25:397:: with SMTP id 145mr20533812ybd.6.1605912319170;
 Fri, 20 Nov 2020 14:45:19 -0800 (PST)
MIME-Version: 1.0
References: <cover.1605896059.git.gustavoars@kernel.org>
 <9ac81a4aab74e0b3317172e66a985fe6d1ae4e1b.1605896059.git.gustavoars@kernel.org>
In-Reply-To: <9ac81a4aab74e0b3317172e66a985fe6d1ae4e1b.1605896059.git.gustavoars@kernel.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 20 Nov 2020 17:45:07 -0500
Message-ID: <CADnq5_Ow_b35AuCGO=LncniDDcwSeS9fSpUiJd+vZYfc29TM0g@mail.gmail.com>
Subject: Re: [PATCH 028/141] drm/amd/display: Fix fall-through warnings for
 Clang
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>, Leo Li <sunpeng.li@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, linux-hardening@vger.kernel.org,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 20, 2020 at 1:28 PM Gustavo A. R. Silva
<gustavoars@kernel.org> wrote:
>
> In preparation to enable -Wimplicit-fallthrough for Clang, fix multiple
> warnings by explicitly adding multiple break statements instead of just
> letting the code fall through to the next case.
>
> Link: https://github.com/KSPP/linux/issues/115
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/display/dc/bios/bios_parser.c  | 1 +
>  drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c | 2 ++
>  drivers/gpu/drm/amd/display/dc/core/dc_link.c      | 1 +
>  3 files changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/bios/bios_parser.c b/drivers/gpu/drm/amd/display/dc/bios/bios_parser.c
> index ad394aefa5d9..23a373ca94b5 100644
> --- a/drivers/gpu/drm/amd/display/dc/bios/bios_parser.c
> +++ b/drivers/gpu/drm/amd/display/dc/bios/bios_parser.c
> @@ -1198,6 +1198,7 @@ static enum bp_result bios_parser_get_embedded_panel_info(
>                 default:
>                         break;
>                 }
> +               break;
>         default:
>                 break;
>         }
> diff --git a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
> index 29d64e7e304f..fd1e64fa8744 100644
> --- a/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
> +++ b/drivers/gpu/drm/amd/display/dc/bios/bios_parser2.c
> @@ -903,6 +903,7 @@ static enum bp_result bios_parser_get_soc_bb_info(
>                         break;
>                 case 4:
>                         result = get_soc_bb_info_v4_4(bp, soc_bb_info);
> +                       break;
>                 default:
>                         break;
>                 }
> @@ -1019,6 +1020,7 @@ static enum bp_result bios_parser_get_embedded_panel_info(
>                 default:
>                         break;
>                 }
> +               break;
>         default:
>                 break;
>         }
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> index fec87a2e210c..b9254a87ee73 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> @@ -1052,6 +1052,7 @@ static bool dc_link_detect_helper(struct dc_link *link,
>
>                                 return false;
>                         }
> +                       break;
>                 default:
>                         break;
>                 }
> --
> 2.27.0
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
