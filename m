Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70DC03C5B99
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 13:57:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E551589BBD;
	Mon, 12 Jul 2021 11:57:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6413189BB2
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 11:57:11 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id t3so27543083edt.12
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 04:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KSgOvh6ofyhg54g1zcETr9WEU5FOa2hVMdZdpUy5T24=;
 b=Iv0wQvabWN46znY51TE6h6qdHawqmMHwHuEBvFNGCc7/YjBRwWmW4b6HjlgbcxRaF4
 8ikG539ydmhbxcfqWlUqezgspm0EavfHFpLonpvKgPCRCVzzDbKwizigYvJqCMWnT4pS
 LAzJycgT/iX8Z/NwyonZn789ZiIkJgzrQgryCYS2G/7W+89Cs7QGcBByXj2DeI/iKtP4
 cxnla5kkZyKz6TjaXPcReJKoSwZt7cf4DAJjcc8rT8bPdvT/3ypWLYMW3K0rmpNeMVgc
 v8FTbrmNYEJtZENXh5adZbm7L245NL17Mxw9xVek98oXUEPMnvefDSldUGwJkGOPoFzL
 NQqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KSgOvh6ofyhg54g1zcETr9WEU5FOa2hVMdZdpUy5T24=;
 b=JxuDZ4yrT17EpzaLh/dbpotxaywRyWl6a3M0nR5wXJ/k02dqZbbEAbG+h8OEHJ1HtG
 d0FWtQl11Gjd2nyRgXWlwaw9W/+AJ2J1VnfJ21bC7b42ubqFJ+SNN2/aUN/wtK9EYzUc
 brGctrgnKU0MWaRW4kZ5uJwybWasKK/Yg6BY9eyxGSFb9e2N6bdCFCaquGzJke9Dklkh
 0hkJd20rG17lVfzxGYJewQPDMZlKkN36U6bNqUFScTfL3WT7bvv36Fs85LvUdLCStOe7
 VULBv2g2ewBE1nRbp8TNbO3aSSfxU5gxhuagtT13+0cpj8lmS1v1vqpYuXMIPkp3PnK/
 J+bg==
X-Gm-Message-State: AOAM530+FW5OGbu7/767l7/a1RV9jjVZ+rrucFopqGea7+3yLNu+/+Nk
 tDueFCw6Bmr/hcxJdcSJZkFKZyS/06SfXYbuT/w=
X-Google-Smtp-Source: ABdhPJxWtUe0dvHU4YUAcTHq9Qxa7swP+GCLvd/mN0P5xfUQ3EfJkelcHaieBfSXSHLVnYLatoPttODXDG1dzq+QDcA=
X-Received: by 2002:a05:6402:2706:: with SMTP id
 y6mr3147342edd.192.1626091030012; 
 Mon, 12 Jul 2021 04:57:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210705074633.9425-1-tzimmermann@suse.de>
In-Reply-To: <20210705074633.9425-1-tzimmermann@suse.de>
From: Sumera Priyadarsini <sylphrenadin@gmail.com>
Date: Mon, 12 Jul 2021 17:26:04 +0530
Message-ID: <CACAkLur8SVqZt69CrfN+0rE4AstPBQPHbwJMnBM_TDTBFXVqdA@mail.gmail.com>
Subject: Re: [PATCH 0/4] vkms: Switch to shadow-buffered plane state
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 David Airlie <airlied@linux.ie>, Melissa Wen <melissa.srw@gmail.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 5, 2021 at 1:16 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Vkms copies each plane's framebuffer into the output buffer; essentially
> using a shadow buffer. DRM provides struct drm_shadow_plane_state, which
> handles the details of mapping/unmapping shadow buffers into memory for
> active planes.
>
> Convert vkms to the helpers. Makes vkms use shared code and gives more
> test exposure to shadow-plane helpers.
>
> Thomas Zimmermann (4):
>   drm/gem: Export implementation of shadow-plane helpers
>   drm/vkms: Inherit plane state from struct drm_shadow_plane_state
>   drm/vkms: Let shadow-plane helpers prepare the plane's FB
>   drm/vkms: Use dma-buf mapping from shadow-plane state for composing
>
>  drivers/gpu/drm/drm_gem_atomic_helper.c | 55 ++++++++++++++++++++++--
>  drivers/gpu/drm/vkms/vkms_composer.c    | 26 ++++++-----
>  drivers/gpu/drm/vkms/vkms_drv.h         |  6 ++-
>  drivers/gpu/drm/vkms/vkms_plane.c       | 57 ++++++-------------------
>  include/drm/drm_gem_atomic_helper.h     |  6 +++
>  5 files changed, 86 insertions(+), 64 deletions(-)
>
>
> base-commit: 3d3b5479895dd6dd133571ded4318adf595708ba
> --
> 2.32.0
>
Hi,

Thanks for the patches. The switch to shadow-plane helpers also solved
a bug that was causing a kernel
panic during some IGT kms_flip subtests on the vkms virtual hw patch.

Tested-by: Sumera Priyadarsini <sylphrenadin@gmail.com>

Cheers,
Sumera
