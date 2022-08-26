Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0168C5A308A
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 22:38:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EED0510E39C;
	Fri, 26 Aug 2022 20:38:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6B2D10E39C;
 Fri, 26 Aug 2022 20:38:32 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id o204so3342290oia.12;
 Fri, 26 Aug 2022 13:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=5mncRjzin9wlcZNDsEO172TV0Ul8tMZirzBBF90PHYg=;
 b=gG4Knf/gdXVho0oGA/THgGs9YZMmPwAcRCZ9+8qInlAXXKSPV9AiMhXXcHykPvGmNe
 u5ZC9B5lRxzTzTJ+isXDbsWquIYxI8Vj9eq1tlgv9HUApBJnv1oUDyGtjSxrNuENa4OF
 CbscbARS9Vbnx5Tw+NmrSQ9y7il04f8AiKAHpdRzfAhQMrFo9NWKFj6GYZTvwNHRZw8+
 jtyJ/SW/NXIb2kqxs5PHohVlhx6hYF8GxUe2x+tKXPJ5IYTsUj17pihXOh4X/ZJRfe64
 pr3HUm3ntM8le3VxJfgxtGf8l+N7Ks8AgpG5DBpyRlw9KIufMZ1Oh+mutvcKlcZC32IK
 qrhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=5mncRjzin9wlcZNDsEO172TV0Ul8tMZirzBBF90PHYg=;
 b=cVT9h4mIIwyd/xRYEtXBjs9Kwr9qXos8bUH6z2yyGbtE4W1vI0OX6t0mQL1FQQnhJM
 NdQbz0oUHlG/yxixCnpY5+u5+DiiTr7qNmEvhO0tj/PptAmxojkyTagoOikWCkuYH9Kf
 f3b5RZktVfGQcQkTKb9klJiyOqWEkugbzDjgxhC4I8uThMnDqncdIHxBVRt6AJUJstmb
 9jTibsoPK04fuXnkK/rrg/eIbKHjhE+/a3isHyQJBfD2aQmyJVfNplcKdSHYqgi0p/Ot
 iz1dekoejqLudh2CyqBfMYq7e1sWqwSQDe1JfyxqkYijytrk7WUTmfiWy4Bs6SeVAS89
 JqvA==
X-Gm-Message-State: ACgBeo1ilcrVed+jhJYzmlf3Jz48nMIxVEyDJ3rk/8a0P4nNwDw0D3ed
 qSAhP9YBZLP+D09wbtfzQnq8EGh/SpUZW//ceGg2pCvQ
X-Google-Smtp-Source: AA6agR6KadgKBn2RwRHJWrGBEuHgLqVDS6sb61DxTyadIWpwUClXCmOiYv8ghycHEYa/4ConkgAgjXz0ApLVT5ZeDbQ=
X-Received: by 2002:a05:6808:138e:b0:345:13d1:fd66 with SMTP id
 c14-20020a056808138e00b0034513d1fd66mr2405135oiw.96.1661546312148; Fri, 26
 Aug 2022 13:38:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220826072357.252676-1-ye.xingchen@zte.com.cn>
In-Reply-To: <20220826072357.252676-1-ye.xingchen@zte.com.cn>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 26 Aug 2022 16:38:20 -0400
Message-ID: <CADnq5_N+q9=oEYwiYxwRRgYeSfp+XaCxs6fwj9iFJsKhJOL2Tg@mail.gmail.com>
Subject: Re: [PATCH linux-next] drm/amdgpu: Remove the unneeded result variable
To: cgel.zte@gmail.com
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
Cc: Jack.Xiao@amd.com, guchun.chen@amd.com, airlied@linux.ie,
 Bokun.Zhang@amd.com, Zeal Robot <zealci@zte.com.cn>, Xinhui.Pan@amd.com,
 ricetons@gmail.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, Prike.Liang@amd.com,
 dri-devel@lists.freedesktop.org, ye xingchen <ye.xingchen@zte.com.cn>,
 alexander.deucher@amd.com, christian.koenig@amd.com, Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Fri, Aug 26, 2022 at 3:24 AM <cgel.zte@gmail.com> wrote:
>
> From: ye xingchen <ye.xingchen@zte.com.cn>
>
> Return the value sdma_v5_2_start() directly instead of storing it in
> another redundant variable.
>
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
> ---
>  drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
> index 83c6ccaaa9e4..95689ef4be10 100644
> --- a/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
> +++ b/drivers/gpu/drm/amd/amdgpu/sdma_v5_2.c
> @@ -1413,12 +1413,9 @@ static int sdma_v5_2_sw_fini(void *handle)
>
>  static int sdma_v5_2_hw_init(void *handle)
>  {
> -       int r;
>         struct amdgpu_device *adev = (struct amdgpu_device *)handle;
>
> -       r = sdma_v5_2_start(adev);
> -
> -       return r;
> +       return sdma_v5_2_start(adev);
>  }
>
>  static int sdma_v5_2_hw_fini(void *handle)
> --
> 2.25.1
