Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 806CE66CE53
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 19:06:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C0DD10E47E;
	Mon, 16 Jan 2023 18:06:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D69DE10E47E;
 Mon, 16 Jan 2023 18:06:00 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id o66so23988274oia.6;
 Mon, 16 Jan 2023 10:06:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jS6lFIJFjFUtY3mw8cyMrgKm76WlKsu232wNoOu9BFI=;
 b=pJUbclSZ3i6Jdg01liLqHc4w2CrtWVSvaOfhA/DUvmwvBfI9LV/fSr9f0+RsBvfbLx
 mSuHpfqzVwUOvdgr8BT+nESWO/0QhJY7FYtEC48w4a2xddiPX+BPDav7qXMtorGbTXUq
 hjQMR/WAaB4ryPMo9lf54fjFLNek6uWrPFOwM6l8Xd/xDdB6xaxgevUnUfNn/0eWYNTc
 bKMw7E9OC5EgqTES2vcg5jM7PqToB0TgsIByf+obkVK3lyB6P/PcTiK4JkRpIAYBGTyB
 1Id0dsqzXGVrfVIItHtSGIEkdKnSeVlrgExRRUQaOVdZ/2a73hix4y96Jlu2eI2bS7Za
 OBIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jS6lFIJFjFUtY3mw8cyMrgKm76WlKsu232wNoOu9BFI=;
 b=Oj9yd2reWsDbouWrahoPCJ/Elcgk6Tgt5UYsGwqbnzwOf2BCDnkmO8C3i+lqatNfDf
 LRXptjlBx5GmExJ46rwREVosymaW0bgF5+OOL00osjcBB609ugq8CfAxYttACw+cqjMJ
 AY4wGoiShuK71DFYQHccgqwkxxYe19ejdxa6dtzGqWTXvWiEIKhNJro85PyLhI0yUbiU
 CCDVWc0WBPHN99nWXxtum1OqoEEkqYbHLhvH5EC1WasciEaHxB7o6xR7xv2pLlbgPqzf
 tqCuuzh3SUiZjLUAHBk9G7gnBXuwhIICg9Ro1sb4KGQN3YOZMoylWH8uKBjxLDxGKJ3c
 ywgQ==
X-Gm-Message-State: AFqh2koLHt99v1Psi/ptibbJS4u5Pm0q07u4ohaxtp0EmL/rSSiseTxQ
 72RpHRTb1qpmQCEeW4eUK4ID4Bki6wFxaQkUvvw=
X-Google-Smtp-Source: AMrXdXvrZGLO62Oo0eXSOIOLUZCvlkDtQzC8DtTWKD6P/g/Ade7N08+e9NEuxmouzOQHO07H0ArjVT5oqOGIBob8wbI=
X-Received: by 2002:a05:6808:4387:b0:35b:d93f:cbc4 with SMTP id
 dz7-20020a056808438700b0035bd93fcbc4mr8161oib.96.1673892358616; Mon, 16 Jan
 2023 10:05:58 -0800 (PST)
MIME-Version: 1.0
References: <20230116131235.18917-1-tzimmermann@suse.de>
 <20230116131235.18917-2-tzimmermann@suse.de>
In-Reply-To: <20230116131235.18917-2-tzimmermann@suse.de>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 16 Jan 2023 13:05:47 -0500
Message-ID: <CADnq5_P4DgCi_JwXo2fJS=cCBmumsw5Og5ZYt+J4J_Lak74e0Q@mail.gmail.com>
Subject: Re: [PATCH 01/22] drm/amdgpu: Fix coding style
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: linux-aspeed@lists.ozlabs.org, sam@ravnborg.org, linux-mips@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!
On Mon, Jan 16, 2023 at 8:13 AM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Align a closing brace and remove trailing whitespaces. No functional
> changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index e47058c2c294..0993ee91fe18 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -5871,8 +5871,8 @@ void amdgpu_device_invalidate_hdp(struct amdgpu_device *adev,
>  int amdgpu_in_reset(struct amdgpu_device *adev)
>  {
>         return atomic_read(&adev->reset_domain->in_gpu_reset);
> -       }
> -
> +}
> +
>  /**
>   * amdgpu_device_halt() - bring hardware to some kind of halt state
>   *
> --
> 2.39.0
>
