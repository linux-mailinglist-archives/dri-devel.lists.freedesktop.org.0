Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B11A31387
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 18:53:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD71E10E241;
	Tue, 11 Feb 2025 17:53:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="X5akSv/m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E396710E241
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 17:53:15 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-30761be8fcfso59730271fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 09:53:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1739296393; x=1739901193;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hY83P5jhCxgHqHTVpMuhAh2S0BdJ9Am5Mi6Xo129a7M=;
 b=X5akSv/m4LiVIjW677NjEOBbGVjDCsNE9aiUOCx4g/gIWd61qGsOG65GY9/a0zQ1VX
 2CXkfy7miSI6fWi6EFeJmJsLSAf6WtXDlqKWwfWRu++NU/IimhTQyNP2B5h/4qn/PWWK
 nfpzC6dMKfcW4iCBk6h7EHukYPcm++Spc7my4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739296393; x=1739901193;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hY83P5jhCxgHqHTVpMuhAh2S0BdJ9Am5Mi6Xo129a7M=;
 b=dXR7c8S5jYYHj80PSXCpjHJN1F+7smH2w3ipW8tv1vxm+paisOIeHBnm8NMXJY0k79
 FEh21gtcvZLTg4boLMJxTNVnMGDVeLfVv8uzlqv3sownP3Dhdzgum2dysCt+SfMKavzO
 oNZLuzY0i4yvUxdziY7tvcaVKoe9HCOM3ZhM9X9Q9IZVoT5xfr5UhyEY2V5THDQny8Pn
 Sh7s3Os9DhFH6wt73Cw3/ZrrjT9nTYhbtkKRaKxQWryWTPkDNtVZ3iJD/Qnz/rK815i4
 ioEWzKImPUMdqD6JkIhyh5sxy4F+cXK8Nb5W1puEzrH9g/21wgtTAoPQghvA/+1p0cbT
 VXsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVvHurCNi++CfvdRkI+0uab5ZbY6/5f7GWGMNgKqK6UWa0osVKMqlcKEM8k1nH3qI3KcoDuO3iHV4s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz4/l+poV0jSNxP9v7EonWuIy7/uquCvQE1UeWZHgFSwKbC0x1+
 SSx6XCqmwVYy7d80gFkBXTKouazNbiwFexK1qJyk8VMPS8XEd8FRRONHteQGvPKU+PXA27kkL8u
 T4A==
X-Gm-Gg: ASbGncvOn7RqaBIQdpKUOXcr0tnWOMNlSknQ8F3uh9Cgu9UHBKBM2U68nUoH/ORPuSm
 El9FseL1SelLMG89c3paP/MJF+PBpbOuEod5JaVeUnYJ5Oc2lAcATcrh5Bdn1CvuPpJwE2Iyjm/
 SyFLLpZbi/AROmj05eraO4eVwUd0Am1BvK+J2PGRZZlwrR49Jg0tl0il8VCIDHhhgIOdqK4hfEH
 jZ2ZPZbWChtptFYmQ26c70uJdyhbiqKJ1vy2l+e1mCHWx1xlwn5R2xMB58dVSoPny3D1JyEtWN2
 Dknl2NBJIXW90U08Hdp/2B5ZzvurZQzot3Su7zy89O5ibWcgbuBqCC4=
X-Google-Smtp-Source: AGHT+IFZ93l0pOrepxzULW0XcTZBQ7FwrbQZwZrx/pbH1A60dpQu9TNNYn4Ijx5gB0/Za8wlu4rA0A==
X-Received: by 2002:a05:6512:4006:b0:544:138d:4b7b with SMTP id
 2adb3069b0e04-54414ae63fbmr6095608e87.52.1739296392502; 
 Tue, 11 Feb 2025 09:53:12 -0800 (PST)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com.
 [209.85.167.46]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5450f7e50d5sm483478e87.156.2025.02.11.09.53.08
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2025 09:53:08 -0800 (PST)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-543cc81ddebso6538409e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 09:53:08 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUiAUFqyDKuTbZKkb2nAGZWK4e3ylfCCatbgw4pG6L+ad3cS8DOFQYUF4EemEOdSaDIMH2uq42HwGA=@lists.freedesktop.org
X-Received: by 2002:a05:6512:239e:b0:545:944:aaf5 with SMTP id
 2adb3069b0e04-5450944ac8dmr2819438e87.9.1739296387978; Tue, 11 Feb 2025
 09:53:07 -0800 (PST)
MIME-Version: 1.0
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
 <20250204-bridge-connector-v2-35-35dd6c834e08@kernel.org>
 <CAD=FV=X0axD+QMfdp_VLBB9AkGcnNSrYVY4-B=ydqAe_6wY9vw@mail.gmail.com>
 <20250211-taupe-moth-of-awe-0722e1@houat>
In-Reply-To: <20250211-taupe-moth-of-awe-0722e1@houat>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 11 Feb 2025 09:52:55 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WriQU4bGrPrrZDncKS0HmL4sfTguGBs9DbVx6yg2ezXw@mail.gmail.com>
X-Gm-Features: AWEUYZnY62phbKZjaL_kWfEqpOtD7hrns2gkLGvyvEMHSIpK0Kgi3V6PvSqjqQk
Message-ID: <CAD=FV=WriQU4bGrPrrZDncKS0HmL4sfTguGBs9DbVx6yg2ezXw@mail.gmail.com>
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

On Tue, Feb 11, 2025 at 5:14=E2=80=AFAM Maxime Ripard <mripard@kernel.org> =
wrote:
>
> On Fri, Feb 07, 2025 at 05:44:38PM -0800, Doug Anderson wrote:
> > On Tue, Feb 4, 2025 at 7:01=E2=80=AFAM Maxime Ripard <mripard@kernel.or=
g> wrote:
> > >
> > > The TI sn65dsi86 driver follows the drm_encoder->crtc pointer that is
> > > deprecated and shouldn't be used by atomic drivers.
> > >
> > > This was due to the fact that we did't have any other alternative to
> > > retrieve the CRTC pointer. Fortunately, the crtc pointer is now provi=
ded
> > > in the bridge state, so we can move to atomic callbacks and drop that
> > > deprecated pointer usage.
> > >
> > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > ---
> > >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 50 ++++++++++++++++++++++---=
----------
> > >  1 file changed, 32 insertions(+), 18 deletions(-)
> >
> > I'm about out of time for now, but I finally managed to at least test
> > this and can confirm it _doesn't_ work. If I take the rest of the
> > series without this patch then things seem OK. When I add this patch
> > then the splash screen on my Chromebook comes up but the browser never
> > boots. :(
>
> Thanks for testing still :)
>
> Could you add your tested-by on the previous patches if you found that
> they were working?

Two of the previous patches didn't compile (which I replied about). I
was going to wait till v3 and then reply with Tested-by on any patches
that were at least exercised on my basic test.



> > > @@ -374,12 +377,15 @@ static int __maybe_unused ti_sn65dsi86_resume(s=
truct device *dev)
> > >          * panel (including the aux channel) w/out any need for an in=
put clock
> > >          * so we can do it in resume which lets us read the EDID befo=
re
> > >          * pre_enable(). Without a reference clock we need the MIPI r=
eference
> > >          * clock so reading early doesn't work.
> > >          */
> > > -       if (pdata->refclk)
> > > -               ti_sn65dsi86_enable_comms(pdata);
> > > +       if (pdata->refclk) {
> > > +               drm_modeset_lock(&pdata->bridge.base.lock, NULL);
> > > +               ti_sn65dsi86_enable_comms(pdata, drm_bridge_get_curre=
nt_state(&pdata->bridge));
> > > +               drm_modeset_unlock(&pdata->bridge.base.lock);
> > > +       }
> >
> > I believe grabbing the locks here is the problem. Sure enough,
> > commenting that out fixes things. Also, if I wait long enough:
> >
> > [  247.151951] INFO: task DrmThread:1838 blocked for more than 122 seco=
nds.
> > [  247.158862]       Tainted: G        W
> > 6.14.0-rc1-00226-g4144859f9421 #1
> > [  247.166474] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs"
> > disables this message.
> > [  247.174541] task:DrmThread       state:D stack:0     pid:1838
> > tgid:1756  ppid:1      task_flags:0x400040 flags:0x00000a0d
> > [  247.185904] Call trace:
> > [  247.188450]  __switch_to+0x12c/0x1e0 (T)
> > [  247.192520]  __schedule+0x2d0/0x4a0
> > [  247.196132]  schedule_preempt_disabled+0x50/0x88
> > [  247.200904]  __ww_mutex_lock+0x3d8/0xa68
> > [  247.204970]  __ww_mutex_lock_slowpath+0x24/0x38
> > [  247.209653]  ww_mutex_lock+0x7c/0x140
> > [  247.213441]  drm_modeset_lock+0xd4/0x110
> > [  247.217493]  ti_sn65dsi86_resume+0x78/0xe0
> > [  247.221730]  __rpm_callback+0x84/0x148
> > [  247.225619]  rpm_callback+0x34/0x98
> > [  247.229232]  rpm_resume+0x320/0x488
> > [  247.232842]  __pm_runtime_resume+0x54/0xa8
> > [  247.237073]  ti_sn_bridge_gpio_get+0x48/0xb8
> > [  247.241486]  gpiod_get_raw_value_commit+0x70/0x178
> > [  247.246436]  gpiod_get_value_cansleep+0x34/0x88
> > [  247.251122]  panel_edp_resume+0xf0/0x270
> > [  247.255187]  __rpm_callback+0x84/0x148
> > [  247.259072]  rpm_callback+0x34/0x98
> > [  247.262685]  rpm_resume+0x320/0x488
> > [  247.266293]  __pm_runtime_resume+0x54/0xa8
> > [  247.270536]  panel_edp_prepare+0x2c/0x68
> > [  247.274591]  drm_panel_prepare+0x54/0x118
> > [  247.278743]  panel_bridge_atomic_pre_enable+0x60/0x78
> > [  247.283965]  drm_atomic_bridge_chain_pre_enable+0x110/0x168
> > [  247.289723]  drm_atomic_helper_commit_modeset_enables+0x204/0x288
> > [  247.296005]  msm_atomic_commit_tail+0x1b4/0x510
> > [  247.300690]  commit_tail+0xa8/0x178
> > [  247.304298]  drm_atomic_helper_commit+0xec/0x180
> > [  247.309066]  drm_atomic_commit+0xa8/0xf8
> > [  247.313125]  drm_mode_atomic_ioctl+0x718/0xcd8
> > [  247.317717]  drm_ioctl+0x1ec/0x450
> > [  247.321248]  __arm64_sys_ioctl+0x3e4/0x4d8
> > [  247.325494]  invoke_syscall+0x4c/0xf0
> > [  247.329284]  do_el0_svc+0x70/0xf8
> > [  247.332717]  el0_svc+0x38/0x68
> > [  247.335886]  el0t_64_sync_handler+0x20/0x128
> > [  247.340296]  el0t_64_sync+0x1b0/0x1b8
> >
> > I guess the problem is that the HPD gpio (which is given to the panel)
> > is implemented by ti-sn65dsi86. It's been a long time, but probably we
> > don't need to "enable comms" just to access a GPIO, but there's only
> > one level of runtime PM. Maybe the fix would be to separately enable
> > pm_runtime for the various sub-devices and the GPIO? ...and then the
> > "aux" channel enables comms and the bridge one also grabs a PM runtime
> > reference to the aux sub-device? Not sure I have time to dig into that
> > myself now.
>
> I don't know the hardware, so I can't really comment, unfortunately.
> I'll drop it if it's broken.

Though it's unsafe, you could drop the locks and replace them with a
comment saying that they should be grabbed here if we can figure out
the deadlock. I don't think the newer code is any less safe without
the locks than the existing code, right?

-Doug
