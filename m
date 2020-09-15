Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FBF26ACD1
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 21:00:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED7576E8F3;
	Tue, 15 Sep 2020 19:00:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D3836E8F1;
 Tue, 15 Sep 2020 19:00:15 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id e11so628000wme.0;
 Tue, 15 Sep 2020 12:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jbe6ZdGxEwcR9b8K0OVEiXqHGKm+h0uIzkdUkf9gYZY=;
 b=pghfZgdnq8jzq4Y9ctQ7O0/bHaLkehG1bO6eU160MqB/26LXMqmZ02GDPT5ezdRe5e
 MAkvtsbEUdm2eN7RMJQFwu7O7/iGzjKD6+aHT2gV0m7Co8/LxdI8dO440P3v4oKrQvDK
 AFK/P15dkXiNEjTcQ3tcbIhYgjzGMSWyR0EgGHTyt6Zap9pUqv7GYR0Y4Wo1mH7jI9YQ
 luMSDZv1mp3/KlxQOSYRPjzO2rFo5GhOpE2AyqGCWJvlS7S5wjiKCNGE2NFXiqpcumXV
 Afnhd/1SZW5/rImGmQ/PHjTwQ8TM8ITaJfrKM3DlcE08egSPLBaavcfHGEStftXi2hWi
 GEBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jbe6ZdGxEwcR9b8K0OVEiXqHGKm+h0uIzkdUkf9gYZY=;
 b=VwljkxweY55ifHPV3u6YEfatzHjqZap1buNeIHQPaeOkNNCO1GsXIoV/+FChy6pvNh
 bpJ2IcencrqZN9gDjzPjFnHMj1ilPh4uHs8z+DRKTC69BX9Nh+gwll+KjPwQQB/am+5G
 V4hmqPvFcm5Wz/L0xS5fX96VH8U3NdX3Tl5xr2zEWOTRBwDaTcYikgcMcZI6/MItxDAA
 cfeba4teYOaXrVSFCdiqhWXrOaFgUtmCmL/ZGl79JMuSvmeDVmmbqCuQdBy9ptgnTiJ0
 rOy4vFK2VMIlqANqdTUni5SLRv3JmdC2ONVnENsQT5mHWEMNXQOzXtPYjv1qg5i1QxyS
 AkVg==
X-Gm-Message-State: AOAM5304YjwtCUeSRkmRpHjy6LipiYaGLk5GXUb5yMG8z4CmwDtfGxxM
 +Vw0WKZxQ5Ywd3N6cHC4/gYKOvrjIXjiHmb9e84=
X-Google-Smtp-Source: ABdhPJyljGcRfZpn6y481EWeKWChcjJq5SRsk2k7JhjzCh+4uKOhuKOaaAceyLB2dxwuOeEKhlHzqIlKZdCLg7ba1c0=
X-Received: by 2002:a7b:c141:: with SMTP id z1mr785558wmi.79.1600196413885;
 Tue, 15 Sep 2020 12:00:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200908133552.105282-1-chenzhou10@huawei.com>
In-Reply-To: <20200908133552.105282-1-chenzhou10@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 15 Sep 2020 15:00:03 -0400
Message-ID: <CADnq5_PfQKwGyuqtzCOUjvXdfQ8WkmeckaiqF2D5Wac+dmSG4A@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amd/display: Remove duplicate include
To: Chen Zhou <chenzhou10@huawei.com>
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
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "Deucher, Alexander" <alexander.deucher@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Wed, Sep 9, 2020 at 3:05 AM Chen Zhou <chenzhou10@huawei.com> wrote:
>
> Remove duplicate header which is included twice.
>
> Signed-off-by: Chen Zhou <chenzhou10@huawei.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
> index a5d750ed569e..65dc5dcd4eb8 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
> @@ -35,7 +35,6 @@
>  #include "dcn30_dpp.h"
>  #include "dcn10/dcn10_cm_common.h"
>  #include "dcn30_cm_common.h"
> -#include "clk_mgr.h"
>  #include "reg_helper.h"
>  #include "abm.h"
>  #include "clk_mgr.h"
> --
> 2.17.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
