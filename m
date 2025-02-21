Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E617EA3F80C
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 16:09:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E110D10EA95;
	Fri, 21 Feb 2025 15:09:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AfDKUJbh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF9E810EA85;
 Fri, 21 Feb 2025 15:08:59 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-2f7d35de32dso541519a91.3; 
 Fri, 21 Feb 2025 07:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740150539; x=1740755339; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y1z9enPprBTCltTD6Zq+9N/ViPgRVx/V8w7eQeJHOME=;
 b=AfDKUJbh+kE45/wl8VAQGNuYEDuynH3Munncn+cZD16itOY62nECeSVYRWXn/D3v9v
 S2/E6ea/AB1wST959PReyprX1cRXeFaa4L/epCwtZwrR3Y/hFQZ/3cZWylxpx0OBSEA9
 jS5mSYiJOwyMaoYPu+T7Nh0V6NUdV8KSiXMiMLTkjlZ6lZ27J3KAUcz4AFlO7gIqiY5l
 DPXi0lZ0NjrIpHPCasU2wbWAs2ISE40kllQ31znUbfhfaxjcd2SxuKODBjeYjjcaPMov
 +8JC+Q9Q93EXlGs1cI3V8w9po42OeDHPpAeATjHc7hHeJCilK4MWHkuacxZv2+9chTIi
 eLoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740150539; x=1740755339;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y1z9enPprBTCltTD6Zq+9N/ViPgRVx/V8w7eQeJHOME=;
 b=SSV9qGp2LxR7gtxNs84HYAc80ksPUzF28w3aFwoHpOfqN8oGf7vqGlJ552Duq35gyy
 0tQaVH7t0XR/0/ID/ms6sXvOxMsxdlVEPGBI5I0cyEqTZoSqkHThKevkW7yzXVrZrrnE
 t4TY2pjsjBLvN9XDkqVIyPH7mnVLYjgVsNHfO9wlvrYH1ODZK7/ayUiI2cyE6t/OI/5v
 oB+c3BGfzyNP87IFngxSos0Hym+Dpe6lThQymmL91SHb5ruuUe7oUNMQSpNg+oN/mcw7
 K68S9p1LbfArPGLUrlTf4CCs8MylBytQ3jfVGsQqQGEnFQjse7i2zZH2Gvsr/8LwbaON
 VQjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVo7M+SFAJoNow+wYYRxLxXM8t+RvKbNmT9TnMo/VRnymFemyq7j2KssMfiV4I+7DlOVUiflUqP@lists.freedesktop.org,
 AJvYcCWZyotexvzpz3i/75LUqbpZcZYp381nC91Z/CfmySMfGz7plqTlBF5M3YZPW9fxZtMEQrwdq9/1+LpD@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+C3h3z0vMpy1ea6F/StrW0D0bXwLdYDQnwajOLvUWdidLtWYT
 R5L/80gm7tU4ynt0DTYEm5ToPQC+euw0YPBPgxy1wKIZ/Qt2YkjBREYoM5nlbMjw9a9dvc6UOgM
 14l4sqbn3fIt5M/YaD3fW06ZZ3+4=
X-Gm-Gg: ASbGncsidklze40Ud73KaqN74QAF0W2tiI9ewOKaZULKJYz+2DU1di8xt1ARnZhepBp
 fr6fySxC96+DAI/Nq4DjTqOP9gi8s0ybahsXcI8TwmKN1hpY0X7XMABnew4IAc49ZCYACkbZaIV
 jx5bL7LJg=
X-Google-Smtp-Source: AGHT+IGVbL0tZlk1tlZK53o23pxJBrsTiqCDJQSUOvTrPIgvq9iQeap92OR0l5X250ulFPr8H3Fb1ZA8O3be8c51hRs=
X-Received: by 2002:a17:90b:3b43:b0:2ef:c419:6930 with SMTP id
 98e67ed59e1d1-2fce7b028bcmr2230885a91.6.1740150539294; Fri, 21 Feb 2025
 07:08:59 -0800 (PST)
MIME-Version: 1.0
References: <20250220162750.343139-1-andrealmeid@igalia.com>
 <20250220162750.343139-3-andrealmeid@igalia.com>
In-Reply-To: <20250220162750.343139-3-andrealmeid@igalia.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 21 Feb 2025 10:08:47 -0500
X-Gm-Features: AWEUYZlDBUXP17Cs6I6f-XW5ymhm46Qk9g76RKaCWVyT61CDlmLAQDsLOybc4CY
Message-ID: <CADnq5_O9NnvVObz5BPr4rx0RpWXY-2UWmY0tw=7WhnzG4khf7g@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] drm/amdgpu: Log after a successful ring reset
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel-dev@igalia.com, siqueira@igalia.com
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

Applied.  Thanks!

On Thu, Feb 20, 2025 at 11:28=E2=80=AFAM Andr=C3=A9 Almeida <andrealmeid@ig=
alia.com> wrote:
>
> When a ring reset happens, the kernel log shows only "amdgpu: Starting
> <ring name> ring reset", but when it finishes nothing appears in the
> log. Explicitly write in the log that the reset has finished correctly.
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/am=
d/amdgpu/amdgpu_job.c
> index 100f04475943..698e5799e542 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
> @@ -149,6 +149,7 @@ static enum drm_gpu_sched_stat amdgpu_job_timedout(st=
ruct drm_sched_job *s_job)
>                         amdgpu_fence_driver_force_completion(ring);
>                         if (amdgpu_ring_sched_ready(ring))
>                                 drm_sched_start(&ring->sched, 0);
> +                       dev_err(adev->dev, "Ring %s reset succeeded\n", r=
ing->sched.name);
>                         goto exit;
>                 }
>                 dev_err(adev->dev, "Ring %s reset failure\n", ring->sched=
.name);
> --
> 2.48.1
>
