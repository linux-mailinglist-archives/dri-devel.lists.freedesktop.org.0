Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5FA2A3381
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 20:00:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8C0F6E505;
	Mon,  2 Nov 2020 19:00:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19C456E47E;
 Mon,  2 Nov 2020 19:00:27 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id e2so10526944wme.1;
 Mon, 02 Nov 2020 11:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F52hESqbsB1MPJOrdkRKIslrWAc4TnNYL/WsFrJgJKw=;
 b=toR2HRVdMm7mruxLONthC9XCLQ2NZM7kvv76jNtete8uCBDGb7+45cxZPdkRDrH59n
 mn2jusHu9DC1CUcCHVwWrwrx9yQo08XLXrLovUsOY5/VwQ6fZZt1KTBDX5NmBVMIkDJ/
 EqzMvk5nkdMc/DdJ3rJLd0EEbCXCRxhE6F4DpSADFhnaACYbCq0Hnc2XlDtBEEdM65eK
 mEBe1NZXRRvstr8m9KiSpO7zQoHflmYdRbRXgRC4upO1zH0T0LlMuSyVJXcvmbZwW+F8
 OFSAa6P+DaJTq+YT2/qF24jsGzErQR+Di5uTo15pZT5amGCHl13xKVdMKuoS8iWJur+C
 ptag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F52hESqbsB1MPJOrdkRKIslrWAc4TnNYL/WsFrJgJKw=;
 b=HK+Qg6tcreIy3wqx7Rq5fhz7s8kdhMKHkCR/cv3lYPxcvpM0tuRcDlQIsJcivoa7n1
 fmbX9IbxN6kUfRYw/p22lBCorfpNbuWsMMCydlZ0c4zLVKhwQYFnXS54F5ajtb0jfY1V
 Le30GDy/GBgT3D0qAgcJvKz1JBfFKkCBKZG4ZuU/kP883lQLXXmXvAeEkkYKUMvB1PGW
 iU+CWQwlfFf6Xg/yjE6joowRPx1Ec9sb/32B3Ggg6G8UaYkAHUzDE9G2W8ydG9aD4Yho
 d4ylPlc9Yfxqqc/R8y628Y1GN7LA9eGcZP/jfx4bQbhABT3UHprmPmigrE+d9F3mD1Hy
 UzgQ==
X-Gm-Message-State: AOAM533DXxHqD/6/GScyEXjdZSson/k8jBhkpV5v7SV6D6dIv5Vt0vXS
 x9keUdQFNQKEJOCCt8fx5+W1/xXSE+stcQ3NLJE=
X-Google-Smtp-Source: ABdhPJytQUYMUMSyXdcmVlTI70Lb9uFFEdcAtoiyeavU7SDPkzfzLliepONejZLqlw/MJVxGDHVXT7e6qiW+8huN4SQ=
X-Received: by 2002:a05:600c:25a:: with SMTP id
 26mr19186350wmj.39.1604343625759; 
 Mon, 02 Nov 2020 11:00:25 -0800 (PST)
MIME-Version: 1.0
References: <20201102141654.699468-1-colin.king@canonical.com>
In-Reply-To: <20201102141654.699468-1-colin.king@canonical.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 2 Nov 2020 14:00:14 -0500
Message-ID: <CADnq5_NJ=X1A+R5rHCvLZAXWpAL-3YiN_ksrzY8Kjuaoj1ybeg@mail.gmail.com>
Subject: Re: [PATCH][next] drm/amdgpu: fix spelling mistake: "Successed" ->
 "Succeeded"
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
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Mon, Nov 2, 2020 at 9:17 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There is a spelling mistake in a deb_dbg message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> index 28a5c0d21b71..c99c2180785f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> @@ -296,7 +296,7 @@ static void amdgpu_vram_mgr_do_reserve(struct ttm_resource_manager *man)
>                 if (drm_mm_reserve_node(mm, &rsv->mm_node))
>                         continue;
>
> -               dev_dbg(adev->dev, "Reservation 0x%llx - %lld, Successed\n",
> +               dev_dbg(adev->dev, "Reservation 0x%llx - %lld, Succeeded\n",
>                         rsv->mm_node.start, rsv->mm_node.size);
>
>                 vis_usage = amdgpu_vram_mgr_vis_size(adev, &rsv->mm_node);
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
