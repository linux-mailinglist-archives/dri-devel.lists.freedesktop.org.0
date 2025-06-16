Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A5FADAC29
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 11:41:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5498510E31A;
	Mon, 16 Jun 2025 09:41:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="vUk6DQPl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E32A10E31A
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 09:41:05 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-553c31542b1so646216e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 02:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750066864; x=1750671664;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZadNMdHIaOPYoMnd8DCHGg9pjL54W3auftd8ZPyuMno=;
 b=vUk6DQPlvYR6/0uPqA6zuT8waw8AvQ99D20M9ZmfxmP26wGw5/LrQDpeOOcBDn20gV
 Q28s5gp84TOndIcyr2seYFX9ojnaP7oU2j1zpBNEfPSUpYGb2cLkTCTTh0FqItGUedss
 /7KfdyLmotCqMQRlwTUHlqGfiFcQi5Bj5wNDQrraH0hUoQdB5D+gdNjCrGmLNaDn/bC9
 WZ7tLkHMSSo3wPi2aeabnOIteVTxOppPqQS0iLwb5rDAzhbhqN6JBxn782cTsfNlFsUd
 TTBVDg/EferZz/xiq/owvOhFBDpLrLHGLIT6oxUtvpLSUTbAcGopZS6czv5VsokY8kIK
 rELA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750066864; x=1750671664;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZadNMdHIaOPYoMnd8DCHGg9pjL54W3auftd8ZPyuMno=;
 b=P9CiZCeWnjM3KzFAZbS5/jZHWE3JzwyogPvEh6zOKh1gQdj+tzOekqHole0ukwn2xG
 w0BdWobfbcrEvdK1IPy98J0QDoTLgIU1L2H28vU8TZDsOQZ8+vUdmWZ7S1nu2xpu6T0Z
 GPdBqRkYS6AdwlxocRSm6moQJpmK091Uenjneq0XC+++C63nzxMYhi4rlc3ucBE91ru0
 FqPozxxJrJCEReMTqUACxIOCsSk9u+TBRCe1UI67ulVlPZYyp4n7qTs3s7gSComwYeeI
 7yEYnFW/lG5pLP4wR8y8zSl0v1aPBanlKMB60CzMLABPBnJlS/qeFahBWipwa1Yblt15
 09ng==
X-Forwarded-Encrypted: i=1;
 AJvYcCXE3BTY2u5Ys/hTnyQyg1y5OMMfpE+36/qRQyzhPp3SBZjsdFMBiusfG7uzS6ZyTDXfNchjsj8TJuc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyanbhVCYLEuSnC6MqpsNa9WgpEDouwlULULWdIk7mNbQNsL5mn
 oHijFUPe4oz19bP9QQdYGaK0Vx/HIWEIddQYqmXTGm/wyaq2ZkM4AXofmCGZRMe57iil6od9tPI
 loov35Sob6BnJSpdfQzMzlhC/crKx9lu+dUzcmev5Uw==
X-Gm-Gg: ASbGncsHXelt4US4uzQ/TpECa2hQ27D6KWAKnQCl9nCCFtL2hYjqULy+HfRLrU3OMUq
 AD2kP9uoBmshvD/qF6f/psNAoplf1JWu35Sr6OGUK+RUewR7fnNvCmPWgYYG+UxlXPGG3Ud06kh
 tCCTP9G6Jch6VyB3pbx0LbDwnkiR4oV5hxHCXuToFcNq6FuJWeKk2/sGsMaeOodMm7r9oUoowUz
 iI=
X-Google-Smtp-Source: AGHT+IGQWWfUkusHDrOLuRcyzoECeHHGTF7H0pzgq8rg6Tj7LyO4hdSVch5xZMTnr/dQPwUpgGJMqB60ks8Us882nLo=
X-Received: by 2002:a05:6512:12d1:b0:553:663d:7354 with SMTP id
 2adb3069b0e04-553b6f31175mr1628391e87.48.1750066863507; Mon, 16 Jun 2025
 02:41:03 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250614180911eucas1p16c9fb4a8160253c253f623bec2529f70@eucas1p1.samsung.com>
 <20250614-apr_14_for_sending-v4-0-8e3945c819cd@samsung.com>
 <20250614-apr_14_for_sending-v4-4-8e3945c819cd@samsung.com>
In-Reply-To: <20250614-apr_14_for_sending-v4-4-8e3945c819cd@samsung.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 16 Jun 2025 11:40:50 +0200
X-Gm-Features: AX0GCFt1wszk0eSWs2NPgAoE3A4kwN-NyBJ_b5il4mUmGBJkPe4uMiqiWgyvPn0
Message-ID: <CAMRc=MfdBd6HBwM4F1TcjDvwbOJ03kxgRk4hJQ8HFK7Wz2XBAg@mail.gmail.com>
Subject: Re: [PATCH v4 4/8] drm/imagination: Use pwrseq for TH1520 GPU power
 management
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Binns <frank.binns@imgtec.com>, 
 Matt Coster <matt.coster@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Ulf Hansson <ulf.hansson@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
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

On Sat, Jun 14, 2025 at 8:09=E2=80=AFPM Michal Wilczynski
<m.wilczynski@samsung.com> wrote:
>
> Update the Imagination PVR DRM driver to leverage the pwrseq framework
> for managing the power sequence of the GPU on the T-HEAD TH1520 SoC.
>
> To cleanly handle the TH1520's specific power requirements in the
> generic driver, this patch implements the "driver match data" pattern. A
> has_pwrseq flag in a new pvr_soc_data struct is now associated with
> thead,th1520-gpu compatible string in the of_device_id table.
>
> At probe time, the driver checks this flag. If true, it calls
> devm_pwrseq_get("gpu-power"), requiring a valid sequencer and deferring
> probe on failure. In this mode, all power and reset control is delegated
> to the pwrseq provider. If the flag is false, the driver skips this
> logic and falls back to its standard manual power management. Clock
> handles are still acquired directly by this driver in both cases for
> other purposes like devfreq.
>
> The runtime PM callbacks, pvr_power_device_resume() and
> pvr_power_device_suspend(), are modified to call pwrseq_power_on() and
> pwrseq_power_off() respectively when the sequencer is present.  A helper
> function, pvr_power_off_sequence_manual(), is introduced to encapsulate
> the manual power-down logic.
>
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---

[snip]

>
> +static int pvr_power_off_sequence_manual(struct pvr_device *pvr_dev)
> +{
> +       int err;
> +
> +       err =3D reset_control_assert(pvr_dev->reset);
> +
> +       clk_disable_unprepare(pvr_dev->mem_clk);
> +       clk_disable_unprepare(pvr_dev->sys_clk);
> +       clk_disable_unprepare(pvr_dev->core_clk);
> +
> +       return err;
> +}
> +
>  int
>  pvr_power_device_suspend(struct device *dev)
>  {
> @@ -252,11 +266,10 @@ pvr_power_device_suspend(struct device *dev)
>                         goto err_drm_dev_exit;
>         }
>
> -       clk_disable_unprepare(pvr_dev->mem_clk);
> -       clk_disable_unprepare(pvr_dev->sys_clk);
> -       clk_disable_unprepare(pvr_dev->core_clk);
> -
> -       err =3D reset_control_assert(pvr_dev->reset);
> +       if (pvr_dev->pwrseq)
> +               err =3D pwrseq_power_off(pvr_dev->pwrseq);
> +       else
> +               err =3D pvr_power_off_sequence_manual(pvr_dev);
>
>  err_drm_dev_exit:
>         drm_dev_exit(idx);
> @@ -276,44 +289,55 @@ pvr_power_device_resume(struct device *dev)
>         if (!drm_dev_enter(drm_dev, &idx))
>                 return -EIO;
>
> -       err =3D clk_prepare_enable(pvr_dev->core_clk);
> -       if (err)
> -               goto err_drm_dev_exit;
> +       if (pvr_dev->pwrseq) {
> +               err =3D pwrseq_power_on(pvr_dev->pwrseq);
> +               if (err)
> +                       goto err_drm_dev_exit;
> +       } else {
> +               err =3D clk_prepare_enable(pvr_dev->core_clk);
> +               if (err)
> +                       goto err_drm_dev_exit;
>
> -       err =3D clk_prepare_enable(pvr_dev->sys_clk);
> -       if (err)
> -               goto err_core_clk_disable;
> +               err =3D clk_prepare_enable(pvr_dev->sys_clk);
> +               if (err)
> +                       goto err_core_clk_disable;
>
> -       err =3D clk_prepare_enable(pvr_dev->mem_clk);
> -       if (err)
> -               goto err_sys_clk_disable;
> +               err =3D clk_prepare_enable(pvr_dev->mem_clk);
> +               if (err)
> +                       goto err_sys_clk_disable;
>

In order to decrease the number of if-elses, would it make sense to
put the "manual" and "pwrseq" operations into their own separate
functions and then store addresses of these functions in the device
match data struct as function pointers (instead of the has_pwrseq
flag)? This way we'd just call them directly.

Bart
