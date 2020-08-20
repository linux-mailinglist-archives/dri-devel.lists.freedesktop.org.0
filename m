Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7145C24C520
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 20:14:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C8B86E9B0;
	Thu, 20 Aug 2020 18:14:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A76F66E9B0;
 Thu, 20 Aug 2020 18:14:41 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id f7so3021951wrw.1;
 Thu, 20 Aug 2020 11:14:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5CM6owDx/tmtrYOZ28Ao2iCnLC9HCs4xM2EFVOquoNs=;
 b=hsbFOKk4Ojo8tb5Z9o0XzLjGhSjFkb8Ca+4pH8WZu7IiC65gdRhgjsegBsNKrWaBQ1
 8uZ3xpPOaN0KmHAizi5xPWAiXBuY3l4eDnUEwg0iC06FrWTlnbR7u47J7lR0tfna1ENW
 ovE9cZDkHQYIsnLTyZUJ2K3/T3r5/lv0s8tsHaMgZinlWLjos3jZzD0uNg/dhHeGk4Hx
 mUgdD/Di8ckbDTFVp1YYtWC5rqsXAczojlgD5bWr0c7KNWJ6HD/vKxsOVOxz+/fDl71C
 Pq8KtjGij8g+uJ5Qtp9m2BXaQS9uSYWnadE6cghBkgm3kiKQ/cfgYBJ+nsq046Rqknx2
 nViw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5CM6owDx/tmtrYOZ28Ao2iCnLC9HCs4xM2EFVOquoNs=;
 b=YLnwe0HVKWXJC4VOpLqs9Fcir1WrES8lHAN98oowYofHwWrQJdi338ytbL0uvsxFOq
 0EwaZbmtEgDDST3489EZC872zFuTJyaKVwhBWt8Zt38i6N9UgIzyk59FSv2zwE77GOi/
 OroxsIWW9Kb7Ie4fprA3vkQEuaRTukUr7jkQ9IAYqZOFNOqnJWw3Jc3U0xrGLr70UO5o
 V1SqWpdX4aPY5xfLMH7e+8y3ZKVOwSS94EDGy1iyuKbjrqPQblmBL0mfh9OAinCL4qei
 +odEGcK3/2E5MDENpEO8KNJKkmdtxuoeidUtwP6TL2l7G7v875G2rRIkCE5s1T5HYnAS
 6xoA==
X-Gm-Message-State: AOAM533ihgZTrtfFHJCC8ZkYNhmLaaZHpY4CyDVMpPVYtGC2UyKMrRGT
 hTgalpYto56WY+zf2nPvvk47UMgijZJLND3hK/A=
X-Google-Smtp-Source: ABdhPJxmJr4GSrlkMn4AAOlyfuTX3rqD/eWrX9bwE1mSbI0EH3yQo0Xdtq5w7tqzm8/yzqY0CdZHlJZP+IceFRRwbQM=
X-Received: by 2002:a5d:494b:: with SMTP id r11mr4563077wrs.419.1597947280424; 
 Thu, 20 Aug 2020 11:14:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200820175809.841479-1-alex.dewar90@gmail.com>
In-Reply-To: <20200820175809.841479-1-alex.dewar90@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 20 Aug 2020 14:14:29 -0400
Message-ID: <CADnq5_M5N5TaMBxxOOkuUVyxPwwYn_opSBGFKiCoNmzv+RR70g@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: Remove unnecessary cast
To: Alex Dewar <alex.dewar90@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Nirmoy Das <nirmoy.das@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Thu, Aug 20, 2020 at 1:59 PM Alex Dewar <alex.dewar90@gmail.com> wrote:
>
> In init_powerplay_table_information() the value returned from kmalloc()
> is cast unnecessarily. Remove cast.
>
> Issue identified with Coccinelle.
>
> Signed-off-by: Alex Dewar <alex.dewar90@gmail.com>
> ---
>  drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_processpptables.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_processpptables.c b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_processpptables.c
> index 195d8539fbb4..740e2fc7a034 100644
> --- a/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_processpptables.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/hwmgr/vega12_processpptables.c
> @@ -252,7 +252,7 @@ static int init_powerplay_table_information(
>         phm_copy_clock_limits_array(hwmgr, &pptable_information->power_saving_clock_max, powerplay_table->PowerSavingClockMax, ATOM_VEGA12_PPCLOCK_COUNT);
>         phm_copy_clock_limits_array(hwmgr, &pptable_information->power_saving_clock_min, powerplay_table->PowerSavingClockMin, ATOM_VEGA12_PPCLOCK_COUNT);
>
> -       pptable_information->smc_pptable = (PPTable_t *)kmalloc(sizeof(PPTable_t), GFP_KERNEL);
> +       pptable_information->smc_pptable = kmalloc(sizeof(PPTable_t), GFP_KERNEL);
>         if (pptable_information->smc_pptable == NULL)
>                 return -ENOMEM;
>
> --
> 2.28.0
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
