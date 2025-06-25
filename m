Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D54BEAE826B
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 14:14:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9601510E71B;
	Wed, 25 Jun 2025 12:14:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QDo8DZNN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F90710E104;
 Wed, 25 Jun 2025 12:14:46 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-ae0a420431bso377839466b.2; 
 Wed, 25 Jun 2025 05:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1750853684; x=1751458484; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=iuZ7V/wPf3y/FuOkP5B9PvK8oLIv24UDDjFzXY+F+6w=;
 b=QDo8DZNNpc7nCS7SlH5dtW3GV0fkK0vePLg43g/QCml7VlPJC2mLwPRpmgE2xhjehT
 yUlALeKdbT4esq2NzcdcVJ1OcQMpYVd9WzDnl1NmTdGQAMgB+9RVYoPRslAYKxNBYnqZ
 k8YXCWp8Coe6fYKfNeCq8jyycnYWDX+P6iihKw5lws5rDhNBGg4lv2vgxRSZ8hfQiYzM
 kLKuuSqld37kgjSMB0/MH7AQXnupCbNPz5RhmV839PaLjtTFtlOa48G4kLuK5BW7XWUJ
 hk97BNHd/9yl7HME1IvOyqn9ZjNLDgmzDvIQvyvjTjycmUrwLvNP8R0S7rZyyPLp0rIY
 QqxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750853684; x=1751458484;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iuZ7V/wPf3y/FuOkP5B9PvK8oLIv24UDDjFzXY+F+6w=;
 b=mGZINHgezsqfYfew5Ru4iaMxflF+B8pqZ3XVsfdBI8PbAeP4Bxl2pMsmvijJLzqdXo
 msoGoPxu0rYMH4JCcsB//MOgN6YIJ5ZfYcfrh+aXe9pb5tfXoyza/crEWUQrd60S1OhW
 nYSMAIDIkVPN3GQ8IC1teNGP6be/Alwkx2mrHrIc0iJbM8HOzrarE7YaJowo4kT7Zydi
 5xqf0C03wWmv8ywK6/OqIpY8CWL39zPPR9rftF10RVbYKF0o+Jc6+EIqWCNyiZTfVG4C
 uJatThRjBemcNHZ0zPJFPRPY4KaiDJkTa/TtYbf+aCLLWp6lAGv9ahuwEdkxjlqZdj4F
 a41w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWW6mkPdES3QjZvwE1eU9EkuHhEWcsYD4VQxlf9tBAR8IE0IUXrzLIId1hipWiWE6yTsg645P9M6KY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxpqxO37zsiEhSMWP+0AzBvzpsLBmjZRxMRGMtkls3/HsAsVSCg
 0e+o/CRwJ2+vNX2uxz2VqL0s/uTchHzfn+qCz5d0cwF48xBEWrpU0JQFBOcaudfI83EBecO3H0y
 DK3fJogAHI205wS/B0eBfERzmthSrCUo=
X-Gm-Gg: ASbGncu/scs4z/XkeOs1Bvnoyjc1Q7HV+crdkVPy3mp2yWQx1IRKZpqw1VnCsMPzKpk
 jUHXNwrq0rZMUf81iFt7bekAOEXADHtGl0sXIm/32k1YzGec5ih7RV43mM0ljsPyblTEd2xJXiJ
 jBKm/dvWM5COYLWzYe8xc62ehKsEFMTNYLaalIvHtBnY+x4XWHrgM8f5CAwG/JPiQhO/boiRwdY
 EQtkw==
X-Google-Smtp-Source: AGHT+IHQisugn9wv5S38QH8dRQR8tubX+c6FKqY5F5WfDU1aAk8yUXJkFRJXGjaZAVrapZK5cnPibWbIOLtP8+vEWrs=
X-Received: by 2002:a17:906:3b0e:b0:ad8:9257:571b with SMTP id
 a640c23a62f3a-ae0becba9a8mr231678666b.16.1750853683947; Wed, 25 Jun 2025
 05:14:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250621152657.1048807-1-superm1@kernel.org>
In-Reply-To: <20250621152657.1048807-1-superm1@kernel.org>
From: Xaver Hugl <xaver.hugl@gmail.com>
Date: Wed, 25 Jun 2025 14:14:32 +0200
X-Gm-Features: Ac12FXxxP103t8t9tCV4vFIb5b84CmOf48g7S9uOWfB8pUo4MSCmc1hEiLjx4t4
Message-ID: <CAFZQkGxUwodf5bW0qQkXoPoz0CFFA1asJfUxFftMGgs5-VK2Hw@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] Add support for 'power saving policy' property
To: Mario Limonciello <superm1@kernel.org>
Cc: amd-gfx@lists.freedesktop.org, Simon Ser <contact@emersion.fr>, 
 Harry Wentland <Harry.Wentland@amd.com>, dri-devel@lists.freedesktop.org, 
 Leo Li <sunpeng.li@amd.com>, Sean Paul <seanpaul@google.com>, 
 Mario Limonciello <mario.limonciello@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I have some more concerns / different direction I'd like to go with
this stuff, let's please hold on it for now and talk about it at the
display next hackfest again.

- Xaver

Am Sa., 21. Juni 2025 um 17:27 Uhr schrieb Mario Limonciello
<superm1@kernel.org>:
>
> From: Mario Limonciello <mario.limonciello@amd.com>
>
> During the Display Next hackfest 2024 one of the topics discussed
> was the need for compositor to be able to relay intention to drivers
> that color fidelity is preferred over power savings.
>
> To accomplish this a new optional DRM property is being introduced called
> "power saving policy".  This property is a bit mask that can be configured
> with requests of "Require color accuracy" or "Require low latency"
> that can be configured by the compositor.
>
> When a driver advertises support for this property and the compositor
> sets it to "Require color accuracy" then the driver will disable any power
> saving features that can compromise color fidelity.
>
> In practice the main feature this currently applies to is the
> "Adaptive Backlight Modulation" feature within AMD DCN on eDP panels.
>
> When the compositor has marked the property  "Require color accuracy" then
> this feature will be disabled and any userspace that tries to turn it on
> will get an -EBUSY return code.
>
> Compositors can also request that low latency is critical which in
> practice should cause PSR and PSR2 to be disabled.
>
> When the compositor has restored the value back to no requirements then
> the previous value that would have been programmed will be restored.
>
> This was previously accepted at version 4 but reverted because userspace
> didn't have a matching implementation.
> One was now created for KDE:
>  * https://invent.kde.org/plasma/kwin/-/merge_requests/6028
>
> There was also a bug reported that Xorg crashed with this change. It's
> fixed by this PR:
>  * https://gitlab.freedesktop.org/xorg/driver/xf86-video-amdgpu/-/merge_requests/102
>
> Mario Limonciello (2):
>   drm: Introduce 'power saving policy' drm property
>   drm/amd: Add power_saving_policy drm property to eDP connectors
>
>  drivers/gpu/drm/amd/amdgpu/amdgpu_display.c   |  4 ++
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 52 +++++++++++++++++--
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  2 +
>  drivers/gpu/drm/drm_connector.c               | 49 +++++++++++++++++
>  include/drm/drm_connector.h                   |  2 +
>  include/drm/drm_mode_config.h                 |  5 ++
>  include/uapi/drm/drm_mode.h                   |  9 ++++
>  7 files changed, 118 insertions(+), 5 deletions(-)
>
> --
> 2.43.0
>
