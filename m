Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD778521DAC
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 17:09:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1319710E040;
	Tue, 10 May 2022 15:09:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF00910E05C;
 Tue, 10 May 2022 15:09:27 +0000 (UTC)
Received: by mail-oo1-xc33.google.com with SMTP id
 q7-20020a4adc47000000b0035f4d798376so2334133oov.6; 
 Tue, 10 May 2022 08:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xz5dj/sAI16FlyJ/oMGNXUrGgnVqkXZ5u3e0YW3gpHs=;
 b=PtrL5qWveEvv6rrV6LCRolslMgz2D5A05Filc1C4eA/tW3SXB586KpETA/BPDuw2K5
 tVQWrrkFShOhj3P6/zbYLmkTeglTiwkevgQdp68+vQSDDARFHbkFUEtM0/MN1b3aFSm4
 vM/9ukGaR4N8+FdJQZeUQaN7qjGEXqBZBSiqrzPoBePqORYTC1liLmB/DdIfiAg4g7q1
 zHfiJzsNz9JOtXIFaCk7cGYgEdfiZGcGQx1TtIERtkEQPkPEhNVSM/ySzvupMxrSR52u
 jy+sDL6AjEId0S5DG5lJBft0cwUUMVx1gPu+uaePTy2tmzSA1s3ekTM0htfITXWHskKE
 1Srw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xz5dj/sAI16FlyJ/oMGNXUrGgnVqkXZ5u3e0YW3gpHs=;
 b=ZLbHwv7TKDVJJ9jb2pyZX02B/GameFAb6qWGM6uGkPF5OldzzHg055uMH9Li3V+t5L
 WzdRoHz6F+u5oAizF3H9LrbvjymwrBhGPXZoPkyYJovAPl9R44Gcnry7vZi9fngFjq3C
 5C0Z7HmLX3MbzwLwKyhK9FZuQ+/DTSPsmSzqyUMq6wYjg9pC8pA7K5Uf9sV4T5xG+qMV
 ygjwx527Vn6jn6PlwCXsxdLQM2yfvDvlJjIBi4ovQWCa/qa6Ab75P9zAKth5iZFw3eYc
 dM0s9PRKG6LYAL+4MnRDAFibGbiQv+ZIoCLxfcSlCvBaTpDckAHJ1FbXEJO0EvlSmVqg
 ZuBQ==
X-Gm-Message-State: AOAM531ilPR0hDkRhc0JrJbFWWVf8TLOhak2GP2DvNIxqfoEzU7iIvGd
 csF13zoU/uZuosQZshijWNsdBxJprVAYb+lVsCc=
X-Google-Smtp-Source: ABdhPJxNg9Nb8TbOJv6OiCoApQXhEYw+7atDL1anmm12hsxZez/BrbxD1eJXy1tAN/8hP0gam/1pP6JWHg2zwDu7Gjg=
X-Received: by 2002:a4a:4a86:0:b0:35e:a2d3:763b with SMTP id
 k128-20020a4a4a86000000b0035ea2d3763bmr8169819oob.23.1652195366837; Tue, 10
 May 2022 08:09:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220510060440.67178-1-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20220510060440.67178-1-jiapeng.chong@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 10 May 2022 11:09:15 -0400
Message-ID: <CADnq5_NxH5WzL6=5ZG2Cb0CBPU3FwP7ZS2ZMzyYHZ00XKe3E5w@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: clean up some inconsistent indenting
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
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
Cc: Dave Airlie <airlied@linux.ie>, xinhui pan <Xinhui.Pan@amd.com>,
 Abaci Robot <abaci@linux.alibaba.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Tue, May 10, 2022 at 2:05 AM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> Eliminate the follow smatch warning:
>
> drivers/gpu/drm/amd/amdgpu/nbio_v7_7.c:35 nbio_v7_7_get_rev_id() warn:
> inconsistent indenting.
>
> drivers/gpu/drm/amd/amdgpu/nbio_v7_7.c:214 nbio_v7_7_init_registers()
> warn: inconsistent indenting.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/nbio_v7_7.c | 17 ++++++++---------
>  1 file changed, 8 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/nbio_v7_7.c b/drivers/gpu/drm/amd/amdgpu/nbio_v7_7.c
> index e32c874b42b5..cdc0c9779848 100644
> --- a/drivers/gpu/drm/amd/amdgpu/nbio_v7_7.c
> +++ b/drivers/gpu/drm/amd/amdgpu/nbio_v7_7.c
> @@ -32,8 +32,7 @@ static u32 nbio_v7_7_get_rev_id(struct amdgpu_device *adev)
>  {
>         u32 tmp;
>
> -               tmp = RREG32_SOC15(NBIO, 0, regRCC_STRAP0_RCC_DEV0_EPF0_STRAP0);
> -
> +       tmp = RREG32_SOC15(NBIO, 0, regRCC_STRAP0_RCC_DEV0_EPF0_STRAP0);
>         tmp &= RCC_STRAP0_RCC_DEV0_EPF0_STRAP0__STRAP_ATI_REV_ID_DEV0_F0_MASK;
>         tmp >>= RCC_STRAP0_RCC_DEV0_EPF0_STRAP0__STRAP_ATI_REV_ID_DEV0_F0__SHIFT;
>
> @@ -211,14 +210,14 @@ static void nbio_v7_7_init_registers(struct amdgpu_device *adev)
>  {
>         uint32_t def, data;
>
> -               def = data = RREG32_SOC15(NBIO, 0, regBIF0_PCIE_MST_CTRL_3);
> -               data = REG_SET_FIELD(data, BIF0_PCIE_MST_CTRL_3,
> -                       CI_SWUS_MAX_READ_REQUEST_SIZE_MODE, 1);
> -               data = REG_SET_FIELD(data, BIF0_PCIE_MST_CTRL_3,
> -                       CI_SWUS_MAX_READ_REQUEST_SIZE_PRIV, 1);
> +       def = data = RREG32_SOC15(NBIO, 0, regBIF0_PCIE_MST_CTRL_3);
> +       data = REG_SET_FIELD(data, BIF0_PCIE_MST_CTRL_3,
> +                            CI_SWUS_MAX_READ_REQUEST_SIZE_MODE, 1);
> +       data = REG_SET_FIELD(data, BIF0_PCIE_MST_CTRL_3,
> +                            CI_SWUS_MAX_READ_REQUEST_SIZE_PRIV, 1);
>
> -               if (def != data)
> -                       WREG32_SOC15(NBIO, 0, regBIF0_PCIE_MST_CTRL_3, data);
> +       if (def != data)
> +               WREG32_SOC15(NBIO, 0, regBIF0_PCIE_MST_CTRL_3, data);
>
>  }
>
> --
> 2.20.1.7.g153144c
>
