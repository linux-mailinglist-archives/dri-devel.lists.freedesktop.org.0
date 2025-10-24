Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0799C0748A
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 18:24:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD9E310E215;
	Fri, 24 Oct 2025 16:24:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=temperror (0-bit key; unprotected) header.d=antheas.dev header.i=@antheas.dev header.b="Jhq59xWb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay13.grserver.gr (relay13.grserver.gr [178.156.171.147])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3FC610E215
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 16:24:25 +0000 (UTC)
Received: from relay13 (localhost [127.0.0.1])
 by relay13.grserver.gr (Proxmox) with ESMTP id 362C05E5EC
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 19:24:25 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by relay13.grserver.gr (Proxmox) with ESMTPS id 6188D5E63B
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 19:24:24 +0300 (EEST)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by linux3247.grserver.gr (Postfix) with ESMTPSA id 3FA64200801
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 19:24:23 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
 s=default; t=1761323063;
 bh=oQdGwlfEvbtCsB8/gEbcoDWrOnl5p/sble/6szBPxSw=;
 h=Received:From:Subject:To;
 b=Jhq59xWbriV20LiL+cr5/2u3yPA/vh7ZbxTe93aO8c5Q3iocM/BCM3GdwCXkXOhIi
 hukCvAJ769AuxQkeapK6tGQ3GJwoE6XBH+Fe0O07qSbe1MnwntydyimL97MqDxsxuX
 TPTRxsqnRbLCCgbn+wquoM3nIDNzNjkKWhbf+AvfXSWvzJBvuFyqrkJBirCxy4ZYP/
 +zU5fHo4Ia7VcZHZAvq/wMSUCqxQzLKrSnJZamQdli8pdtOoLou7iTsw73tA1SY8r5
 7OYwsPmuX6q0hh7hZE/FzwNYOmuqrITVSc4NGdRRArPQxcRKn0JDKBqni3yb/40reG
 tv/Q+33ze9eQA==
Authentication-Results: linux3247.grserver.gr;
 spf=pass (sender IP is 209.85.208.177) smtp.mailfrom=lkml@antheas.dev
 smtp.helo=mail-lj1-f177.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-36a448c8aa2so19633371fa.0
 for <dri-devel@lists.freedesktop.org>;
 Fri, 24 Oct 2025 09:24:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXzvSXVRO478r83sSoLrf2UWUk2f6Xwl+5f/j+dLlxd9DvyWdEsTeJzrTqZZ68FPKdGRuJ7qFWsryg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzeie3xkrPr5IVc7ypw8Kd5Q8vyrxv0FVJ8PHPuZ1SYsJGrTrCL
 6yqsUzuYF07SzGxNPv3Sh+ja3L9wJe6SnhYMTtCCHN/YfUFNoTRJ1N8lWU0/pM5p3Nqq4uc4YpP
 rCiNZSiiSj21yGmKZeDB8qmaPxvK0a3c=
X-Google-Smtp-Source: AGHT+IH5FOSurMzNSYAPrkNE9P+crWNlqQYYEhIXZVibnYOAmJfgnkVPquyinjMDDrWg5WSrf+OeT57Af1RwtKlUvyw=
X-Received: by 2002:a2e:a906:0:b0:337:e190:6814 with SMTP id
 38308e7fff4ca-378e43595b5mr9138621fa.20.1761323062708; Fri, 24 Oct 2025
 09:24:22 -0700 (PDT)
MIME-Version: 1.0
References: <20251024152152.3981721-1-lkml@antheas.dev>
 <20251024152152.3981721-4-lkml@antheas.dev>
 <61da9864-b7c8-43f1-b437-36756077b545@amd.com>
 <27439123-98aa-4096-a4e4-3c8eecb3aaca@amd.com>
In-Reply-To: <27439123-98aa-4096-a4e4-3c8eecb3aaca@amd.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Fri, 24 Oct 2025 18:24:11 +0200
X-Gmail-Original-Message-ID: <CAGwozwHAJAvgZEgn1M0ioRP4dT2urMUtQQzNXKXydu0ueoOzsA@mail.gmail.com>
X-Gm-Features: AWmQ_blfIZoPfA-q7agy553x9fEuFss57l-a8Lv0j387NBYXYo5gCy0b2IiG7tc
Message-ID: <CAGwozwHAJAvgZEgn1M0ioRP4dT2urMUtQQzNXKXydu0ueoOzsA@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] drm/amdgpu: only send the SMU RLC notification on
 S3
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Perry Yuan <perry.yuan@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: <176132306359.2578081.7045291936752289994@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 24 Oct 2025 at 18:20, Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
>
>
> On 10/24/2025 10:54 AM, Mario Limonciello wrote:
> >
> >
> > On 10/24/2025 10:21 AM, Antheas Kapenekakis wrote:
> >> From: Alex Deucher <alexander.deucher@amd.com>
> >>
> >> For S0ix, the RLC is not powered down. Rework the Van Gogh logic to
> >> skip powering it down and skip part of post-init.
> >>
> >> Fixes: 8c4e9105b2a8 ("drm/amdgpu: optimize RLC powerdown notification
> >> on Vangogh")
> >> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4659
> >> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> >> Tested-by: Antheas Kapenekakis <lkml@antheas.dev>
> >> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> >> ---
> >>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c       | 8 +++++---
> >>   drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c        | 6 ++++++
> >>   drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c | 3 +++
> >>   3 files changed, 14 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/
> >> drm/amd/amdgpu/amdgpu_device.c
> >> index 3d032c4e2dce..220b12d59795 100644
> >> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> >> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> >> @@ -5243,9 +5243,11 @@ int amdgpu_device_suspend(struct drm_device
> >> *dev, bool notify_clients)
> >>       if (amdgpu_sriov_vf(adev))
> >>           amdgpu_virt_release_full_gpu(adev, false);
> >> -    r = amdgpu_dpm_notify_rlc_state(adev, false);
> >> -    if (r)
> >> -        return r;
> >> +    if (!adev->in_s0ix) {
> >> +        r = amdgpu_dpm_notify_rlc_state(adev, false);
> >> +        if (r)
> >> +            return r;
> >> +    }
> >
> > Just FYI this is going to clash with my unwind failed suspend series [1].
> >
> > This is fine, just whichever "lands" first the other will need to rework
> > a little bit and I wanted to mention it.
> >
> > Link: https://lore.kernel.org/amd-gfx/20251023165243.317153-2-
> > mario.limonciello@amd.com/ [1]
> >
> > This does have me wondering though why amdgpu_dpm_notify_rlc_state() is
> > even in amdgpu_device_suspend()?  This is only used on Van Gogh.
> > Should we be pushing this deeper into amdgpu_device_ip_suspend_phase2()?
> >
> > Or should we maybe overhaul this to move the RLC notification into
> > a .set_mp1_state callback instead so it's more similar to all the other
> > ASICs?
> >
>
> My proposal as such is here:
>
> https://lore.kernel.org/amd-gfx/20251024161216.345691-1-mario.limonciello@amd.com/
>
> It would need some testing though to make sure it didn't break Steam
> Deck or Steam Deck OLED.

I will give it a quick go on my OLED.


> >>       return 0;
> >>   }
> >> diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/
> >> drm/amd/pm/swsmu/amdgpu_smu.c
> >> index fb8086859857..244b8c364d45 100644
> >> --- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
> >> +++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
> >> @@ -2040,6 +2040,12 @@ static int smu_disable_dpms(struct smu_context
> >> *smu)
> >>           smu->is_apu && (amdgpu_in_reset(adev) || adev->in_s0ix))
> >>           return 0;
> >> +    /* vangogh s0ix */
> >> +    if ((amdgpu_ip_version(adev, MP1_HWIP, 0) == IP_VERSION(11, 5, 0) ||
> >> +         amdgpu_ip_version(adev, MP1_HWIP, 0) == IP_VERSION(11, 5,
> >> 2)) &&
> >> +        adev->in_s0ix)
> >> +        return 0;
> >> +
> >
> > How about for GPU reset, does PMFW handle this too?
> >
> >>       /*
> >>        * For gpu reset, runpm and hibernation through BACO,
> >>        * BACO feature has to be kept enabled.
> >> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c b/
> >> drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
> >> index 2c9869feba61..0708d0f0938b 100644
> >> --- a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
> >> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
> >> @@ -2217,6 +2217,9 @@ static int vangogh_post_smu_init(struct
> >> smu_context *smu)
> >>       uint32_t total_cu = adev->gfx.config.max_cu_per_sh *
> >>           adev->gfx.config.max_sh_per_se * adev-
> >> >gfx.config.max_shader_engines;
> >> +    if (adev->in_s0ix)
> >> +        return 0;
> >> +
> >>       /* allow message will be sent after enable message on Vangogh*/
> >>       if (smu_cmn_feature_is_enabled(smu, SMU_FEATURE_DPM_GFXCLK_BIT) &&
> >>               (adev->pg_flags & AMD_PG_SUPPORT_GFX_PG)) {
> >
>
>

