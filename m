Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 585295BB1A2
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 19:34:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD88C10E4E1;
	Fri, 16 Sep 2022 17:33:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [IPv6:2607:f8b0:4864:20::c2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF5AA10E376;
 Fri, 16 Sep 2022 17:33:51 +0000 (UTC)
Received: by mail-oo1-xc2b.google.com with SMTP id
 u3-20020a4ab5c3000000b0044b125e5d9eso3632282ooo.12; 
 Fri, 16 Sep 2022 10:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=fBLKyH7CgKzdu0sdL+2+ttEv7QAignRvxC5/meELxsc=;
 b=PwGUHnprOKMd9ZV8gp1ze2jZNz9YdSVYMqWrvunEtodfENazUhrdo9tAjof2a2Vxgb
 iHTSSQ1yXzRw/pDCLSW4o31+PxpkknLNAjddJ/aHxtW3UH4Q9aRRT327eJA7jpCJkT3M
 35DnMdN0V/3DWivocuFfcxitD1Kua1e75Y4JnV+YaaGVEGzkaqsJksfOeLjgFX/Tej1i
 FlQEPK2POpGDawkmuTDvcUWm+gbr+n8WLsJ0dSF5cv43u2inQVCL1eSfPtBAAOXKNqTh
 Yw/W5unoQMnwTJVzSf2mx5ekedEyUMweHKM6MeYgRN/drZhGUOn4YuZ7/1NZmhcI3TDW
 VgBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=fBLKyH7CgKzdu0sdL+2+ttEv7QAignRvxC5/meELxsc=;
 b=D26n3N6EnTpBAQnjWDF+bNQr/XXLXb1YhD7batdbFEhWl4h0wW8IBAWKA/Vj/yZ7ct
 MqGQ7sQtXsqAMKq//z3lQ1mE+jpB2LlRtoJw6kIb7MlsMs51LG2zGaTdUpk4fu2xFrpH
 HUceABMR4E1YWiiKQFle10alAbnGQXQ7kqkoHm5uy8PXhLJoa8zwsqf/UFxrEIN6dqN/
 RO0O+ejM3M84Rsp8Oz9lQ5FPOLvhLRVmhObZKGWB6Q03Kc9Li/4JS2NGtm5rP3cyT+NM
 pBCuGuTnj4K4poPJhsiqbZwMkg7kGG94HEDPqlB+oRbO9GuWq/xQ0w+aqkybC1nBKnIz
 eSXg==
X-Gm-Message-State: ACrzQf1hBABSD6Q0UGQlmOny36EhXeVcts7uwDLrNZ4AfICL/7AlMi68
 nrURGBh0Ge+aztTWkc/9piG/9qH0426HV/bJuQk=
X-Google-Smtp-Source: AMsMyM5dcaDQ2ebBoOCvWrT/ibg7sU42N2YPxtR4RrgQPXjfLAc8fxWJNwdyIu4G+gxuUl1pRP7DJRT4tdGdNBWvEY4=
X-Received: by 2002:a4a:a78a:0:b0:472:a078:98d6 with SMTP id
 l10-20020a4aa78a000000b00472a07898d6mr2554260oom.97.1663349630965; Fri, 16
 Sep 2022 10:33:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220914171505.54154-1-colin.i.king@gmail.com>
In-Reply-To: <20220914171505.54154-1-colin.i.king@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 16 Sep 2022 13:33:39 -0400
Message-ID: <CADnq5_NY+XfdjLhEf0mppF+paUVQjPP8xm_N=6=-1aG08-f54Q@mail.gmail.com>
Subject: Re: [PATCH][next] drm/amdkfd: Fix spelling mistake "detroyed" ->
 "destroyed"
To: Colin Ian King <colin.i.king@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Xinhui.Pan@amd.com, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Wed, Sep 14, 2022 at 1:15 PM Colin Ian King <colin.i.king@gmail.com> wrote:
>
> There is a spelling mistake in a pr_debug message. Fix it.
>
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> index 7522bf2d2f57..c70c026c9a93 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> @@ -898,7 +898,7 @@ static vm_fault_t svm_migrate_to_ram(struct vm_fault *vmf)
>                 return VM_FAULT_SIGBUS;
>         }
>         if (!mmget_not_zero(svm_bo->eviction_fence->mm)) {
> -               pr_debug("addr 0x%lx of process mm is detroyed\n", addr);
> +               pr_debug("addr 0x%lx of process mm is destroyed\n", addr);
>                 return VM_FAULT_SIGBUS;
>         }
>
> --
> 2.37.1
>
