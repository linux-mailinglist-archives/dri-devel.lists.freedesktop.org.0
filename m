Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D25AC5F0DEB
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 16:48:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 753B810ED36;
	Fri, 30 Sep 2022 14:48:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6495710E1B6;
 Fri, 30 Sep 2022 14:48:42 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id m130so4932135oif.6;
 Fri, 30 Sep 2022 07:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=IrD2HiOAvlqhSlCj89Kg6AmBSA4GqWLvYu4q+ahkxqw=;
 b=FTvf7jWuva7dVerCSj72BQDqO1vmZDve/XbFr29Mq3HYSofxF+vBpy5/iZIer9Og4Y
 9h9F3CcvgYFpfZv/yejrKiCERLYeqz2LvHnqwyadSVZvy1nEtIRl4rT3HlqWRWLdN9Fl
 6z0FgRXM7sbCz6Z/CQe/zjsqbO0WbtHUvFQJuxhfcMd++iUyY6+M4itfmhGQZbhoBV+/
 z/5sGbycYevtssfYgpjygcJfdUu/LmcZ9NcHFq80jtTHXwXBv/Qdeq1Le8d1AVN+kh6m
 a/h4uMAu3+3AcZPIHZjPsE86B4QD+PgbXUNdsEbbs59ljH5g3agTf5/GQHtlACPfj0hV
 k7EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=IrD2HiOAvlqhSlCj89Kg6AmBSA4GqWLvYu4q+ahkxqw=;
 b=jDqpIBApu4X1qa8zWM3kt69tqwXV4HCtu2A73AhEYCDJfD9xeF3j7/OuV+dKfoKgQy
 zpAltMB0y+UiUtMrWJs3oJvyYLRbDAslTETgPTYX2pm+K2PrXzSNN/ByPVrjXjA+i5Ba
 JDKgPnZEZHJQlGrrOBlFZ6AyFPmwkT5smblPU3LP83FJLySSvRwT51pGcoh9sGXFb5QN
 ZVSE8vu4VHsj8AqXAqicZDE+BvPtCkjwzKOjxXtKfAiiTYn4rUxZVnoMDy+VAzg3zl3U
 FDub6bh3L9U4fU0c4ZDbIyaqTsntIcOs0LOqmgpYYWZUkV5vqGH0b/+QZKVtP122C7Oi
 9siQ==
X-Gm-Message-State: ACrzQf39FMzhbVRYwCaJOTwu//UWKv2+6idCo0ktBrqr/+006fYxPe5b
 MaX7snNhW0Q2u7sUWO6+IutYWj0Rf+Td5YoJLzU=
X-Google-Smtp-Source: AMsMyM6sqVe8c4bTD9YFY2G/C+1svDf3GvVoxIluh8OGYmkdHCKavHRdrDmDo8TK3DWsOb6b2Gm9Uq4Bb3RTeg+9OAc=
X-Received: by 2002:a05:6808:2194:b0:350:cb3d:ecd2 with SMTP id
 be20-20020a056808219400b00350cb3decd2mr9930656oib.46.1664549321709; Fri, 30
 Sep 2022 07:48:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220930053859.100235-1-yang.lee@linux.alibaba.com>
 <20220930053859.100235-2-yang.lee@linux.alibaba.com>
In-Reply-To: <20220930053859.100235-2-yang.lee@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 30 Sep 2022 10:48:30 -0400
Message-ID: <CADnq5_O24ZXhE3qfKajjtP1gj8Pd8DO7ZVrQE6QN5cY_vf4Gvw@mail.gmail.com>
Subject: Re: [PATCH -next 2/2] drm/amd/display: clean up one inconsistent
 indenting
To: Yang Li <yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: sunpeng.li@amd.com, Abaci Robot <abaci@linux.alibaba.com>,
 Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied the series.  Thanks!

On Fri, Sep 30, 2022 at 1:39 AM Yang Li <yang.lee@linux.alibaba.com> wrote:
>
> clean up one inconsistent indenting
>
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=2321
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dcn301/dcn301_resource.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_resource.c b/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_resource.c
> index 559e563d5bc1..f04595b750ab 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn301/dcn301_resource.c
> @@ -852,7 +852,7 @@ static struct hubbub *dcn301_hubbub_create(struct dc_context *ctx)
>                 vmid->masks = &vmid_masks;
>         }
>
> -        hubbub3->num_vmid = res_cap_dcn301.num_vmid;
> +       hubbub3->num_vmid = res_cap_dcn301.num_vmid;
>
>         return &hubbub3->base;
>  }
> --
> 2.20.1.7.g153144c
>
