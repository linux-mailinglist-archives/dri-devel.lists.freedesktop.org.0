Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC891C48A3
	for <lists+dri-devel@lfdr.de>; Mon,  4 May 2020 22:55:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 846B7896DD;
	Mon,  4 May 2020 20:55:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCA3689385;
 Mon,  4 May 2020 20:55:34 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id v8so914185wma.0;
 Mon, 04 May 2020 13:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=D74sKgkjH8kEt1DBLxWzvZF+Obr5z/6LSX69jqkqQw8=;
 b=HvHUZNe65rDYdW4kKTWoeqknOC1SQWoSE8cIVsqrb86YZT6cata1M3ML3uHUNzbBKo
 X0DsxVHHB6e+2nV7y6OCfjmxdZGCoI0JP8mZpgg4q5Rh2wAjiKVoYi93uu+V+7GgefZX
 MtJEwSslqt6DWRLbeKOW54pHSHXY7qzbOUQP0Yg1Cbn/ITDWTS91tt2YmGZIfS+w1+DI
 /mO3lCOlfL5krGrqb1mCStLgIhz7KlrkVY9+z8jcR7ys/IIWbcxK3vFg3HDbiTdiZg4X
 YwcqHqylvpDWQRA3P3CK8c6i6rX9ZFGzSuSIkFzZSNEuXBnIyPZeEU2dFafZLrI5HKnp
 E57Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D74sKgkjH8kEt1DBLxWzvZF+Obr5z/6LSX69jqkqQw8=;
 b=pTjk+jrtroeItyeihF9KPfBn79w02fljWGFV8vS3qLcfsj4Oi0tFdAE3YluOQK97Ms
 7bEqpHRaXU9DwwqyXCZEcyu9BIWelO4oNVmQjTiflymh+RMaJS19jWLECVelrlKIptVh
 P+AyA/qdq8BuHBLbwqjguM24fgnlYm3qOEjvT2UF+5Jaruhw15/QYyHhHKLvEoARGQWa
 EcjQ6nJbGZGmyPrWDvpMHdmU3Jn+xYe0+DW52++0sFuTkB3Z5WMV6A2dcVQncZGkHdcu
 yeCMdfDl0NhD862KqvE+okrMyAGmjd3TyqgtoyhK749CKVLZeJB6P/kUiYJK9BbqvJic
 upvg==
X-Gm-Message-State: AGi0PuZRlK6597zeGnCPs9pMdG6nTmYtN3Z+a6J/5vGNV8RLDm+mT7Gz
 uREiS/rP+cnfPEOxug2s0ZGgChaN/mTWzojBNrw=
X-Google-Smtp-Source: APiQypLEqt41go0K6FSI41aP25wXmLXUEZ/h96Kj/ynd2shsYPGH60k9MDypR3NiiQ0YH7znFbTDOvS5DtN4lfu61iE=
X-Received: by 2002:a7b:cc8e:: with SMTP id p14mr16270788wma.70.1588625733293; 
 Mon, 04 May 2020 13:55:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200504113213.40403-1-yanaijie@huawei.com>
In-Reply-To: <20200504113213.40403-1-yanaijie@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 4 May 2020 16:55:22 -0400
Message-ID: <CADnq5_Ogi0eYn-U_171Pi71EhVOm7_htoT7-ROaSWyOT8_FQWQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: remove unused variable 'ret' in
 dm_suspend()
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
Cc: "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Dave Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Mon, May 4, 2020 at 9:20 AM Jason Yan <yanaijie@huawei.com> wrote:
>
> Fix the following coccicheck warning:
>
> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c:1574:5-8: Unneeded
> variable: "ret". Return "0" on line 1586
>
> Signed-off-by: Jason Yan <yanaijie@huawei.com>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 9c2a07626d2c..2b7588371170 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -1571,7 +1571,6 @@ static int dm_suspend(void *handle)
>  {
>         struct amdgpu_device *adev = handle;
>         struct amdgpu_display_manager *dm = &adev->dm;
> -       int ret = 0;
>
>         WARN_ON(adev->dm.cached_state);
>         adev->dm.cached_state = drm_atomic_helper_suspend(adev->ddev);
> @@ -1583,7 +1582,7 @@ static int dm_suspend(void *handle)
>
>         dc_set_power_state(dm->dc, DC_ACPI_CM_POWER_STATE_D3);
>
> -       return ret;
> +       return 0;
>  }
>
>  static struct amdgpu_dm_connector *
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
