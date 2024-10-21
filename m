Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45AB69A6DD1
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 17:15:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95E3410E043;
	Mon, 21 Oct 2024 15:15:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=criticallink.com header.i=@criticallink.com header.b="sUEgUrzk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D631410E043
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 15:15:06 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-539f1292a9bso5527173e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 08:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=criticallink.com; s=google; t=1729523705; x=1730128505;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GvLvAGoaEs4cLCLummjUn/fSa2RxeVRTPvPMgQ05vWA=;
 b=sUEgUrzkCH4/HPYGTtf2e8N81fyFBs64M2OdpmJbGE7Mod5UTnjaqcr4ze/q9ETSVu
 6f8sV7Ts7kAD52mzYMtLPNZ6UWgS6V4vzvcumWnB60POK/nolXCYxtWYdBNNcTCI6j+z
 uU9c8aYRd1UhbeLpe8ITJ8wfPCWr8n5XsO1WeofFOcIu0+mPUzmxO+W7+GMeOHnroD3E
 UBV+H+MJvJdvsBY7xy29RrtZ1H8JUgm1HQYjeWSZ4HwR3s4kZC1rtEa6BnYN7cmckpuz
 dJuP4GLTq2bpVJ5Aamj7wfEPn0DOenA9E8JJK5r+BbmKrb27sHwT1cNyUPs3gc0gZwTW
 wE2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729523705; x=1730128505;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GvLvAGoaEs4cLCLummjUn/fSa2RxeVRTPvPMgQ05vWA=;
 b=N9RdC2bNYQrdccknesHHNjNkonx/tQiIfex0jHxc1LUpWAoSh1kULMboao6oxN1F4D
 dQsmKYsokfX4zmp8CDA+Vg5PEIHWT/a5QZoHiyHavsvGeI3JIC6vb93KhwBBEXxDSWUT
 9Z7bFYlRdQ1JoyiI0/cqxDjQTMPzcceEQVJ+zieoxNv/XzhB2MzPecarOk8YPO2oBHO6
 e2yKV8AcW1ZVzINCtJNhp+pMQ3oTihLS8GjeixMyE/RWCsoWSdQNqNuvrJ8mDn8s4Gdw
 gzde4DJXqEJ+54O5zkKZkTjXFu581AHDdkQx3gQtgnrXPFNeg2BoDulk9dPFyfwP+fl9
 TkXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUvMiUnI6GKhLBgGfMd4A/akvCcVKr6F33z3wpt+QZHOMLRS9FvJrbpT6dSsYSiJn0eKTqj8MsHbaU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwhC0U4TZzu5+foxUbPSj6mKSm+y/1xQZqRenx76/xy3wr+waaV
 9rGvzb+Aj5lAZzSmtuP5cExFQIRwFDkP8z+FyDqzdzfXPhWfA1tBmidW7Gcv6ZoL7Hf2xnkk1W2
 HnG+kd6IM3r4PfKyi/FF7DVsN2hUB3dSo1aH3
X-Google-Smtp-Source: AGHT+IH5PS65InXxWy7zQvIKXC5DV3lRT7k9uy1hS9BXMEO9QulVaI6d3S3/tVIqUPBmpDRG0ReoxzC3NqxZUA7H7xY=
X-Received: by 2002:a05:6512:2813:b0:533:44e7:1b2a with SMTP id
 2adb3069b0e04-53a154b2d95mr5431587e87.40.1729523704965; Mon, 21 Oct 2024
 08:15:04 -0700 (PDT)
MIME-Version: 1.0
References: <20241021-tidss-irq-fix-v1-0-82ddaec94e4a@ideasonboard.com>
 <20241021-tidss-irq-fix-v1-6-82ddaec94e4a@ideasonboard.com>
In-Reply-To: <20241021-tidss-irq-fix-v1-6-82ddaec94e4a@ideasonboard.com>
From: Jon Cormier <jcormier@criticallink.com>
Date: Mon, 21 Oct 2024 11:14:53 -0400
Message-ID: <CADL8D3Ykxbz7W=Av774sk9HaEnvneLNZcxmGsGaL2XDEFgpzAw@mail.gmail.com>
Subject: Re: [PATCH 6/7] drm/tidss: Fix race condition while handling
 interrupt registers
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Devarsh Thakkar <devarsht@ti.com>, Jyri Sarha <jyri.sarha@iki.fi>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org
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

On Mon, Oct 21, 2024 at 10:08=E2=80=AFAM Tomi Valkeinen
<tomi.valkeinen@ideasonboard.com> wrote:
>
> From: Devarsh Thakkar <devarsht@ti.com>
>
> The driver has a spinlock for protecting the irq_masks field and irq
> enable registers. However, the driver misses protecting the irq status
> registers which can lead to races.
>
> Take the spinlock when accessing irqstatus too.
>
> Fixes: 32a1795f57ee ("drm/tidss: New driver for TI Keystone platform Disp=
lay SubSystem")
> Cc: stable@vger.kernel.org
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> [Tomi: updated the desc]
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/tidss/tidss_dispc.c | 4 ++++
>  drivers/gpu/drm/tidss/tidss_irq.c   | 2 ++
>  2 files changed, 6 insertions(+)

Reviewed-by: Jonathan Cormier <jcormier@criticallink.com>
Tested an equivalent patch for several weeks.
Tested-by: Jonathan Cormier <jcormier@criticallink.com>

>
> diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/=
tidss_dispc.c
> index 515f82e8a0a5..07f5c26cfa26 100644
> --- a/drivers/gpu/drm/tidss/tidss_dispc.c
> +++ b/drivers/gpu/drm/tidss/tidss_dispc.c
> @@ -2767,8 +2767,12 @@ static void dispc_init_errata(struct dispc_device =
*dispc)
>   */
>  static void dispc_softreset_k2g(struct dispc_device *dispc)
>  {
> +       unsigned long flags;
> +
> +       spin_lock_irqsave(&dispc->tidss->wait_lock, flags);
>         dispc_set_irqenable(dispc, 0);
>         dispc_read_and_clear_irqstatus(dispc);
> +       spin_unlock_irqrestore(&dispc->tidss->wait_lock, flags);
>
>         for (unsigned int vp_idx =3D 0; vp_idx < dispc->feat->num_vps; ++=
vp_idx)
>                 VP_REG_FLD_MOD(dispc, vp_idx, DISPC_VP_CONTROL, 0, 0, 0);
> diff --git a/drivers/gpu/drm/tidss/tidss_irq.c b/drivers/gpu/drm/tidss/ti=
dss_irq.c
> index 3cc4024ec7ff..8af4682ba56b 100644
> --- a/drivers/gpu/drm/tidss/tidss_irq.c
> +++ b/drivers/gpu/drm/tidss/tidss_irq.c
> @@ -60,7 +60,9 @@ static irqreturn_t tidss_irq_handler(int irq, void *arg=
)
>         unsigned int id;
>         dispc_irq_t irqstatus;
>
> +       spin_lock(&tidss->wait_lock);
>         irqstatus =3D dispc_read_and_clear_irqstatus(tidss->dispc);
> +       spin_unlock(&tidss->wait_lock);
>
>         for (id =3D 0; id < tidss->num_crtcs; id++) {
>                 struct drm_crtc *crtc =3D tidss->crtcs[id];
>
> --
> 2.43.0
>
