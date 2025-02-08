Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B78FEA2D2BB
	for <lists+dri-devel@lfdr.de>; Sat,  8 Feb 2025 02:45:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A171010EBB5;
	Sat,  8 Feb 2025 01:44:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="ZhZvbE+O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com
 [209.85.208.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C06CA10EBB5
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Feb 2025 01:44:56 +0000 (UTC)
Received: by mail-lj1-f182.google.com with SMTP id
 38308e7fff4ca-307d9a13782so22777281fa.2
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Feb 2025 17:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1738979093; x=1739583893;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jbjV8m+TBGStFUUXZqFnjiUZmRlgUrbxjlmh11C3PiE=;
 b=ZhZvbE+OU+fy4w+lX5E1Z2R+in5xheG8ljqfQV+/ORe4lfNHv7h6O/gXmcNAMyjbzh
 CTl/1yH6sXQU4OA5VhVT8ICM50UrO7uDcBRRTcbJ97bBCXfnAzB6EYBn6/K2oDnEElTG
 EqObgrnZtMKQI5mfzJGE16S5+pTNkCmscyFHI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738979093; x=1739583893;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jbjV8m+TBGStFUUXZqFnjiUZmRlgUrbxjlmh11C3PiE=;
 b=ZfU0gXgy5UUTQxXerTsL+tsGyqPtB1cs5ohmJhhlH783ZhR4fs59trS6gYWdcxrlmW
 AR82ca8V4KvXU+7E1N3Nm94ZBQlIdoOtBtp6IRRZAWQGSLENq+HJDS0hNWbLbIxx3JZ8
 YR/Gjlaz01xRspaw9mFKKolBOe+ifRvI7xmXJ07DO2TfZHGCFpsfImZA1Qe3UXF9pGGA
 tHT76nsIZXkt8m4ri4C/9qJ/lotcNrz3sA95Tq2OLAFaAw/sRpUfRpKZyLfR+D6KeEf5
 /wvbzBDtApCAgWOwE59E9vB2C0vHwKOcN1RoW9rWTqfmJ84z0Fc6RLw4FKr2C7eu8Q7s
 qtEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFCM2UEfizVH4nXnP0sXlP7G7/mSdbshUQnAZAyZysGSI0ExeLmcfaNsGPWXYlN3n7NTNad+Zrpsg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxBfwWE2yXuewUFiAs06G/GzLRYwouzvO3emINojiMBxVM0sQuN
 roWH73jsY+bHmoSABsa5Nxz0g9KVUr8T2xYbB56QbNG/VArB+4AGfx2dS22wCZNnt5JpfuK9JSK
 KkY1v
X-Gm-Gg: ASbGnctolzL/cLNRZR1J7IUM3CTfPLzjrx5Pp+Trxo9IKoescNnG7l36L/LzZ5IG7BG
 M/poxvcifCbsJo/58k93yGMpVimMELbPtINdDPL9tadk1iDaeurHxV66bAeqbxP/HrexQMDcUST
 tGg2j51asO14xWeSoq1bvOIuh+wlAann4czr/ASYkg4nwHiek50UO4Fks9I835R2gi+9n9J6OSF
 iDDNU0vum0rs3LhAlrEldli+Kp412U5y04eHFq4E3EekOnfycw7NSyZlAd5CUEKFOEfc0d2Bu1P
 WgUJXzgjv+uU8FXoPCAo6hPUpAHmczfbADAV5c80V9x1Mr3hn9hfY5Q=
X-Google-Smtp-Source: AGHT+IFnRxu6Okjk7DbXiwj0foNim1l69Q1X2b8+e0wH20LqXNJ3EDFVREhN6oC/2adsAuwrM0x+HQ==
X-Received: by 2002:a2e:bcd2:0:b0:304:68e5:eabd with SMTP id
 38308e7fff4ca-307e57c7b0bmr19446251fa.3.1738979092565; 
 Fri, 07 Feb 2025 17:44:52 -0800 (PST)
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com.
 [209.85.167.52]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-307de18d860sm5974431fa.25.2025.02.07.17.44.51
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Feb 2025 17:44:51 -0800 (PST)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-54505191cdcso138500e87.2
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Feb 2025 17:44:51 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCXUBi/g/4BaLic2LeK8DR46YwKCEcFA06usml5WTXfZTOZXB3HErMzsq1bwYjdiEQbXN7LfxMRlp70=@lists.freedesktop.org
X-Received: by 2002:a05:6512:328d:b0:545:17b:3cf9 with SMTP id
 2adb3069b0e04-545017b3e22mr754880e87.48.1738979090969; Fri, 07 Feb 2025
 17:44:50 -0800 (PST)
MIME-Version: 1.0
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
 <20250204-bridge-connector-v2-35-35dd6c834e08@kernel.org>
In-Reply-To: <20250204-bridge-connector-v2-35-35dd6c834e08@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 7 Feb 2025 17:44:38 -0800
X-Gmail-Original-Message-ID: <CAD=FV=X0axD+QMfdp_VLBB9AkGcnNSrYVY4-B=ydqAe_6wY9vw@mail.gmail.com>
X-Gm-Features: AWEUYZnarrh0TSQ__CM8Ry5C0vmBnGGx4hlsNFveb-3-H15QutiQYqNVRSaSaOo
Message-ID: <CAD=FV=X0axD+QMfdp_VLBB9AkGcnNSrYVY4-B=ydqAe_6wY9vw@mail.gmail.com>
Subject: Re: [PATCH v2 35/35] drm/bridge: ti-sn65dsi86: Use bridge_state crtc
 pointer
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Stephen Boyd <swboyd@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hi,

On Tue, Feb 4, 2025 at 7:01=E2=80=AFAM Maxime Ripard <mripard@kernel.org> w=
rote:
>
> The TI sn65dsi86 driver follows the drm_encoder->crtc pointer that is
> deprecated and shouldn't be used by atomic drivers.
>
> This was due to the fact that we did't have any other alternative to
> retrieve the CRTC pointer. Fortunately, the crtc pointer is now provided
> in the bridge state, so we can move to atomic callbacks and drop that
> deprecated pointer usage.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 50 ++++++++++++++++++++++-------=
------
>  1 file changed, 32 insertions(+), 18 deletions(-)

I'm about out of time for now, but I finally managed to at least test
this and can confirm it _doesn't_ work. If I take the rest of the
series without this patch then things seem OK. When I add this patch
then the splash screen on my Chromebook comes up but the browser never
boots. :(


> @@ -374,12 +377,15 @@ static int __maybe_unused ti_sn65dsi86_resume(struc=
t device *dev)
>          * panel (including the aux channel) w/out any need for an input =
clock
>          * so we can do it in resume which lets us read the EDID before
>          * pre_enable(). Without a reference clock we need the MIPI refer=
ence
>          * clock so reading early doesn't work.
>          */
> -       if (pdata->refclk)
> -               ti_sn65dsi86_enable_comms(pdata);
> +       if (pdata->refclk) {
> +               drm_modeset_lock(&pdata->bridge.base.lock, NULL);
> +               ti_sn65dsi86_enable_comms(pdata, drm_bridge_get_current_s=
tate(&pdata->bridge));
> +               drm_modeset_unlock(&pdata->bridge.base.lock);
> +       }

I believe grabbing the locks here is the problem. Sure enough,
commenting that out fixes things. Also, if I wait long enough:

[  247.151951] INFO: task DrmThread:1838 blocked for more than 122 seconds.
[  247.158862]       Tainted: G        W
6.14.0-rc1-00226-g4144859f9421 #1
[  247.166474] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
disables this message.
[  247.174541] task:DrmThread       state:D stack:0     pid:1838
tgid:1756  ppid:1      task_flags:0x400040 flags:0x00000a0d
[  247.185904] Call trace:
[  247.188450]  __switch_to+0x12c/0x1e0 (T)
[  247.192520]  __schedule+0x2d0/0x4a0
[  247.196132]  schedule_preempt_disabled+0x50/0x88
[  247.200904]  __ww_mutex_lock+0x3d8/0xa68
[  247.204970]  __ww_mutex_lock_slowpath+0x24/0x38
[  247.209653]  ww_mutex_lock+0x7c/0x140
[  247.213441]  drm_modeset_lock+0xd4/0x110
[  247.217493]  ti_sn65dsi86_resume+0x78/0xe0
[  247.221730]  __rpm_callback+0x84/0x148
[  247.225619]  rpm_callback+0x34/0x98
[  247.229232]  rpm_resume+0x320/0x488
[  247.232842]  __pm_runtime_resume+0x54/0xa8
[  247.237073]  ti_sn_bridge_gpio_get+0x48/0xb8
[  247.241486]  gpiod_get_raw_value_commit+0x70/0x178
[  247.246436]  gpiod_get_value_cansleep+0x34/0x88
[  247.251122]  panel_edp_resume+0xf0/0x270
[  247.255187]  __rpm_callback+0x84/0x148
[  247.259072]  rpm_callback+0x34/0x98
[  247.262685]  rpm_resume+0x320/0x488
[  247.266293]  __pm_runtime_resume+0x54/0xa8
[  247.270536]  panel_edp_prepare+0x2c/0x68
[  247.274591]  drm_panel_prepare+0x54/0x118
[  247.278743]  panel_bridge_atomic_pre_enable+0x60/0x78
[  247.283965]  drm_atomic_bridge_chain_pre_enable+0x110/0x168
[  247.289723]  drm_atomic_helper_commit_modeset_enables+0x204/0x288
[  247.296005]  msm_atomic_commit_tail+0x1b4/0x510
[  247.300690]  commit_tail+0xa8/0x178
[  247.304298]  drm_atomic_helper_commit+0xec/0x180
[  247.309066]  drm_atomic_commit+0xa8/0xf8
[  247.313125]  drm_mode_atomic_ioctl+0x718/0xcd8
[  247.317717]  drm_ioctl+0x1ec/0x450
[  247.321248]  __arm64_sys_ioctl+0x3e4/0x4d8
[  247.325494]  invoke_syscall+0x4c/0xf0
[  247.329284]  do_el0_svc+0x70/0xf8
[  247.332717]  el0_svc+0x38/0x68
[  247.335886]  el0t_64_sync_handler+0x20/0x128
[  247.340296]  el0t_64_sync+0x1b0/0x1b8

I guess the problem is that the HPD gpio (which is given to the panel)
is implemented by ti-sn65dsi86. It's been a long time, but probably we
don't need to "enable comms" just to access a GPIO, but there's only
one level of runtime PM. Maybe the fix would be to separately enable
pm_runtime for the various sub-devices and the GPIO? ...and then the
"aux" channel enables comms and the bridge one also grabs a PM runtime
reference to the aux sub-device? Not sure I have time to dig into that
myself now.
