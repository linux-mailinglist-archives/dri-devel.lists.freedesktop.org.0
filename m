Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F164721BEE5
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jul 2020 23:01:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 483016ED17;
	Fri, 10 Jul 2020 21:01:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B59D16ED16;
 Fri, 10 Jul 2020 21:01:32 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id z2so7229208wrp.2;
 Fri, 10 Jul 2020 14:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6+r5bXWhv/RQ5xFOE17P6y/DtE6DdUph31T/6lnjgyI=;
 b=Xj0O+fppYfdFYtGXu/8QJhYwJ7qRKnFTirnizTXoFo5bZj6n94L2JJj0BdRzJwzAb5
 xZRyrEv3g4yyg5OvsM4snf2LCqod8codoTvAxrPCUxbIvksvMH1AU8WPvenGlYrpxSQf
 6BjZ3/b3VUh3+MkQZawapsKpjwcb2Ex6HXUZFheK4SJDgNSlkTZm5VxobjBO1AQ5WX5K
 aaZGH6qaz17M8SlXpxudD5NTY4oJewCMG4Q6skZFj/xPz2y1jeXWQLe2zCpIrQxxh940
 SMoOyMYtdW1UeDYAgsdG/e20KOUC8x8x3GL5LKFyb7Zb02f8D42khsD14r13TK76VWQc
 2R5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6+r5bXWhv/RQ5xFOE17P6y/DtE6DdUph31T/6lnjgyI=;
 b=ph5EAdZpjVgFVVi26W+2FvoMfByMePQTsXlKdMIcRfOZtf4zyWH6ZQjPQKpJW9V4/9
 uF+kjIZsa0C1AqAzKba2YepGgn602/rrcEt/O4M7sCxR/TyV33BE00r4pI4AgHdYkdlF
 9z+xel58fZOxThxK92Qq0HS5tQSk3Rzy+qRr25OkTHlimvR7QpGcJCtybWbN7kw+MAbX
 G414nNWXbYfuyIS1VkrAqKwbhBBJz1Sh8bqorVKmJndVeVf4V5VnCYO/buOPOOl8qP/Z
 BFlFIs1URE3mAkcy9bqjPy/qdfFYJ4LZzL4FK05zdTJKJMu9moOBzi+DFH6K0ja/KTNo
 IqJQ==
X-Gm-Message-State: AOAM532Mzr4637I+N1IBQnAibZote3whOLY0uSpUxBWXe6flfuXKkkoH
 MX0gDJUotnurgkO8nhkhSIiVECGI2mF8smgXtBY=
X-Google-Smtp-Source: ABdhPJypPwO8Bo/INW0FnA8A7BrNDcU34sqKrdYu805RwMp6HxYo7wINlncuUBXunFISVe1eQrqua5IIzU9mGV+XpdY=
X-Received: by 2002:adf:dd8d:: with SMTP id x13mr68186470wrl.362.1594414891375; 
 Fri, 10 Jul 2020 14:01:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200710083758.3304139-1-colin.king@canonical.com>
In-Reply-To: <20200710083758.3304139-1-colin.king@canonical.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 10 Jul 2020 17:01:19 -0400
Message-ID: <CADnq5_MWvu0JDbBMR1_wDqozxMahX6uAJBppTLKwPLOmdtTGSQ@mail.gmail.com>
Subject: Re: [PATCH][next] drm/amdgpu: fix spelling mistake "Falied" ->
 "Failed"
To: Colin King <colin.king@canonical.com>
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 10, 2020 at 4:38 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in a DRM_ERROR error message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> index e20695b44dbe..40706334f7a8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_psp.c
> @@ -1984,7 +1984,7 @@ static int psp_suspend(void *handle)
>
>         ret = psp_tmr_terminate(psp);
>         if (ret) {
> -               DRM_ERROR("Falied to terminate tmr\n");
> +               DRM_ERROR("Failed to terminate tmr\n");
>                 return ret;
>         }
>
> --
> 2.27.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
