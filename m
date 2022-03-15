Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B8D4D9F25
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 16:50:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDE2210E53C;
	Tue, 15 Mar 2022 15:50:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com
 [IPv6:2607:f8b0:4864:20::c2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1583D10E53B;
 Tue, 15 Mar 2022 15:50:31 +0000 (UTC)
Received: by mail-oo1-xc2c.google.com with SMTP id
 l24-20020a4a8558000000b00320d5a1f938so24903497ooh.8; 
 Tue, 15 Mar 2022 08:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Vz6iB+JIu3yJYB4hqkWbRgwU/6tHLowf4D8LoA0UiMw=;
 b=TEgQpnrWDc42J4tF0pQgCnTLq0H6A9/UzGwgZHtFi41RTPbMqg47bgBSG90lUlObUs
 ukznRNm+2cUYPvHhMkeg6MZcBPxDsQFKRaLwDOwDh+ewmeGwTZ3inz0O8T2F0Ze6LWm6
 QFZgBt1MptFnCfuUzXf6LoFz0aMZmpG199g8IsMHYWnrNvSD4WhAG99utpAthyc+9goQ
 LTJxDnKNP6yDsjxhYrRQpRAoiEZSxs7+S7CRWrP6S3L4z73qrWebPTQtK3a64ynL/i92
 DwF5sfRRJNoqKHBw7PWBSL82GPxeCz0IZACZkZZzo4p8AmxlObwmlEHiFBp938rnsOwM
 Y0lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Vz6iB+JIu3yJYB4hqkWbRgwU/6tHLowf4D8LoA0UiMw=;
 b=lMYvSgKmppa+z2Tc6bNls2M4BI/PWyTcYoyCWfwGBa5sWw0vtZO1wopV6WwrVc3rwv
 gQAF/VtvLixfdoPPy13ANt+6Bj+cy9EukdP9JJLAJ56BSdzPlapanwyX8WrRXKrlsMLS
 LY18hRyJDZbU5DeXbtffJ/l8sxuDksDRjDJ+hTCJGVh8ynBCeWYtj/iVEL2pi5O9GmHq
 5Loks4pyM64yLLkRK44TpIDI9oMYJrArkvZSZ8fkNGi6tGCyT4bcfZ5hvMXohh3/5oKN
 1aBRHz91nNpGHsZELHKc+cUTRbdktts/NsuKJt02PZB3YfxT45cAKVmH47a7U756ob8c
 ktLA==
X-Gm-Message-State: AOAM532zWxDKHHRtT1wh+lgFu8t8xuhdy9qadi8rN0X53TR3ARJ+5s2O
 t/YTE2RakGJh9wEIKLc62AX1PTaPmQ3kPF4fTmo=
X-Google-Smtp-Source: ABdhPJw7QSRbDRqTG+6Ui/vWDvMRavfyAT4JEfkuFfTtnQk5gqxtvGs/iiAAzRMmyjzdBv7fgSI5YeVaINK7RgsXysc=
X-Received: by 2002:a05:6870:630c:b0:da:b3f:324d with SMTP id
 s12-20020a056870630c00b000da0b3f324dmr1819828oao.253.1647359430402; Tue, 15
 Mar 2022 08:50:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220314115354.144023-1-Julia.Lawall@inria.fr>
 <20220314115354.144023-30-Julia.Lawall@inria.fr>
In-Reply-To: <20220314115354.144023-30-Julia.Lawall@inria.fr>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 15 Mar 2022 11:50:19 -0400
Message-ID: <CADnq5_O_YRtkZz5s3mkdVa24THYqMTZPZFVsQpS-+T_cDttj4g@mail.gmail.com>
Subject: Re: [PATCH 29/30] drm/amdgpu: fix typos in comments
To: Julia Lawall <Julia.Lawall@inria.fr>
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
Cc: David Airlie <airlied@linux.ie>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Mon, Mar 14, 2022 at 8:01 AM Julia Lawall <Julia.Lawall@inria.fr> wrote:
>
> Various spelling mistakes in comments.
> Detected with the help of Coccinelle.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index fe660a8e150f..970b065e9a6b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -340,7 +340,7 @@ static void amdgpu_cs_get_threshold_for_moves(struct amdgpu_device *adev,
>         if (free_vram >= 128 * 1024 * 1024 || free_vram >= total_vram / 8) {
>                 s64 min_us;
>
> -               /* Be more aggresive on dGPUs. Try to fill a portion of free
> +               /* Be more aggressive on dGPUs. Try to fill a portion of free
>                  * VRAM now.
>                  */
>                 if (!(adev->flags & AMD_IS_APU))
> @@ -1280,7 +1280,7 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
>                         continue;
>
>                 /*
> -                * Work around dma_resv shortcommings by wrapping up the
> +                * Work around dma_resv shortcomings by wrapping up the
>                  * submission in a dma_fence_chain and add it as exclusive
>                  * fence.
>                  */
>
