Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF991BE288
	for <lists+dri-devel@lfdr.de>; Wed, 29 Apr 2020 17:25:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 209F96E9F2;
	Wed, 29 Apr 2020 15:25:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99BF56E9F0;
 Wed, 29 Apr 2020 15:24:58 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id x4so2500017wmj.1;
 Wed, 29 Apr 2020 08:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zjOeTQqRQtIBclXH1kdBKnLsff8nhyMZrdrXsY6z7Es=;
 b=X/ulaxB/6Apyr7kAkKvHNrsDORGTl2+KD1I2EjtZJ6rcoKxavRh4Pz1v+jxDYkF3yM
 jbgwPsXVqxiayh1Zdsq31g2GAnoFH6jnKOEBK7lvwRAeP8OUXCmDvUWk3ZWERxNnHbSC
 uZOYe2iDreW/OmCT2Q7XvQFI3IoWyYE1c1HRINaPmkrgzhfSAogxikj0hb/4sUB+Lf9j
 B0SXycfl/w2vRPJoZzjV8eNzbiK3N5P7p7h3x6OBlrkHym0dX0yhy0Q8xcsuCCV3Dq1J
 inYJaAsxoQSeTYfTmsnWnstf8PMLxDRHx81dhHQ6pBG+C7MqBUelxrnePvpoBLbhC2vV
 b9sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zjOeTQqRQtIBclXH1kdBKnLsff8nhyMZrdrXsY6z7Es=;
 b=AybMoJ1pqaOzCDthpvrq/DnCEwfwRmorKH9ujKm5ixbAI3IicSJpB0Li3VAyEI8RcX
 RDAQRmTIBhQI+h9jHFP9BQJmQRXOsk0NpflS4/0WsTEaTIscICrt1bTEHY8e+MhDKMxP
 mnxywcyblGYHjVBZqAkWlZIBiB0mNqGsNKrT45ZyTcd3aHDOCwJBIO65d5sjB7udq8sn
 XUPvOGokYFI8Hpk7jYvht/IVeyogTSaSAk4h3goW890mCh2TK+ldJBpQIeaMiW9oqtaR
 zeeUQy9ElcRZjVp64pmH7nmNl7dWtEHtYBFJVGLp/Stx3BsXWJqZphbdWaSa1jqZEYjh
 6dxg==
X-Gm-Message-State: AGi0Pub5VgilEDZ3q5eRiXstc+8BtoTEdXm0s3QEsgs+ydNta9n7f3VV
 /FDd9c7NZ8TRulQPoOL9HT9RDCI6Vr5DkzTmEMC2Tw==
X-Google-Smtp-Source: APiQypIxiVdSfHPCe/FFEwwHjoIPW70Czk4NcFBf+IaZVL7iTbl6w4kP4EvAVlbgSK1GlUyyI2j8y5a2IELQqIg8LXI=
X-Received: by 2002:a7b:cc0e:: with SMTP id f14mr3856407wmh.39.1588173897248; 
 Wed, 29 Apr 2020 08:24:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200428063003.24687-1-yanaijie@huawei.com>
In-Reply-To: <20200428063003.24687-1-yanaijie@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 29 Apr 2020 11:24:45 -0400
Message-ID: <CADnq5_MvXg0MbLbFVViCf78hyV+xjrnO9=GoSsc7-ScG_-u2ng@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu/smu10: remove duplicate assignment of
 smu10_hwmgr_funcs members
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
Cc: Dave Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, "Quan, Evan" <evan.quan@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 28, 2020 at 8:47 AM Jason Yan <yanaijie@huawei.com> wrote:
>
> The struct member 'asic_setup' was assigned twice, let's remove one:
>
> static const struct pp_hwmgr_func smu10_hwmgr_funcs = {
>         ......
>         .asic_setup = NULL,
>         ......
>         .asic_setup = smu10_setup_asic_task,
>         ......
> };
>
> This fixes the following coccicheck warning:
>
> drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c:1357:52-53:
> asic_setup: first occurrence line 1360, second occurrence line 1388
>
> Signed-off-by: Jason Yan <yanaijie@huawei.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c b/drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c
> index 1cc30f750c26..4f8c1b85e688 100644
> --- a/drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c
> +++ b/drivers/gpu/drm/amd/powerplay/hwmgr/smu10_hwmgr.c
> @@ -1357,7 +1357,6 @@ static int smu10_asic_reset(struct pp_hwmgr *hwmgr, enum SMU_ASIC_RESET_MODE mod
>  static const struct pp_hwmgr_func smu10_hwmgr_funcs = {
>         .backend_init = smu10_hwmgr_backend_init,
>         .backend_fini = smu10_hwmgr_backend_fini,
> -       .asic_setup = NULL,
>         .apply_state_adjust_rules = smu10_apply_state_adjust_rules,
>         .force_dpm_level = smu10_dpm_force_dpm_level,
>         .get_power_state_size = smu10_get_power_state_size,
> --
> 2.21.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
