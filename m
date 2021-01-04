Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 046452E9B5D
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 17:54:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 454776E02F;
	Mon,  4 Jan 2021 16:54:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 195E989FF6;
 Mon,  4 Jan 2021 16:54:24 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id r9so26566390otk.11;
 Mon, 04 Jan 2021 08:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cth4uifEDzoQnw3xNDMIY6tlbdsSxWaVeVk+M7VOBMc=;
 b=FWld9Hp9KGx+8ZF1QNRkRZfDTB2aRLhd2UE4jFM/yT4Y3vaBqz+ZgD6rW47DidnBW+
 EtC9Hn+LvnAYtw68AeE1j9bBLzgA6yb0mFBQHVlOi/vLo4ou6ekNuNdJB2KjwdNSvKRF
 71+kQ5GWlBzeZfD5AVvwjKEzNFzT17V3WkglC3mwZnrLzDi9YsJfyGf3soNTcG6erkgB
 6nJW5XGjIBuLCGfmj5hJgMk28tDs27u75D0Z1t6eOk96pqNhNWyOGuWB9GsgQEmiuCpU
 lRpaotOS0PDwR4Vh1X6HAKy3pPzOJ4kOCxoUgBsBa+GSTlLXWKRLQz0Z7sneX81xuIpV
 SjsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cth4uifEDzoQnw3xNDMIY6tlbdsSxWaVeVk+M7VOBMc=;
 b=bhaTHg9t+sal+vVA7nYNd7Qrk9+hCa1+XQe642RhMQvH+qs6v9BHcFOOTgpjXtE601
 6DPuFV5/BxvB7yWQ7yfrE9lhjEcMLqaIcvEUi0CeuLqP85G+BNk2S4vBxPEq+vPkB6JI
 CQ2o2smZJiLrir2PrglwYV2NR0XM2zcvH7QX9gaC3+KtOY42NtaWal7daAwT6liXI0tK
 zu0lAlekB+KccCSQ46zmQV/Ikw1fJVi9erSbVJ4A6ODZUN/+6SRueVh9zrq6M1yeBpiC
 hg+VkgIpkqkQR0g7PFlhU6QQEXBls6ZvbmK6NlAS9CLyrodOtAf58P2KnoUT91CLMRXX
 SCFg==
X-Gm-Message-State: AOAM530PxrYIUm8+Z+7JcZHvgOo4XWZgliqA5VR/xDIufU4jbqkWujof
 ygbV3zQ2ZKTkZMmhi+mdTAYL9KXw6tbtHW8IBdmGNCLT
X-Google-Smtp-Source: ABdhPJw67J02jkRmT87wiCNQJ8l91ASJxBB8MGNVgKkgGZwKEgbtfn8z6nkverwcbffyKaa6rK6FONMyboJh8vS+2Dk=
X-Received: by 2002:a9d:75d4:: with SMTP id c20mr38798110otl.311.1609779263477; 
 Mon, 04 Jan 2021 08:54:23 -0800 (PST)
MIME-Version: 1.0
References: <1609376177-42827-1-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1609376177-42827-1-git-send-email-tiantao6@hisilicon.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 4 Jan 2021 11:54:12 -0500
Message-ID: <CADnq5_P2jT4O979T6MfBzvboM0EhYjSJHd94eFo=LevjO+0+4g@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: remove unused including <linux/version.h>
To: Tian Tao <tiantao6@hisilicon.com>
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
Cc: "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 31, 2020 at 5:42 AM Tian Tao <tiantao6@hisilicon.com> wrote:
>
> Remove including <linux/version.h> that don't need it.
>
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c           | 1 -
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c   | 1 -
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c | 1 -
>  3 files changed, 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 5675c1f..3255531 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -60,7 +60,6 @@
>
>  #include <linux/module.h>
>  #include <linux/moduleparam.h>
> -#include <linux/version.h>
>  #include <linux/types.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/pci.h>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> index f6f487e..3244a6e 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> @@ -25,7 +25,6 @@
>
>  #include <linux/string.h>
>  #include <linux/acpi.h>
> -#include <linux/version.h>
>  #include <linux/i2c.h>
>
>  #include <drm/drm_probe_helper.h>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> index 8ab0b90..5b0a4a7 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> @@ -23,7 +23,6 @@
>   *
>   */
>
> -#include <linux/version.h>
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_dp_mst_helper.h>
> --
> 2.7.4
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
