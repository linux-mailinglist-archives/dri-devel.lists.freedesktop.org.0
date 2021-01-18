Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10FE72FAC4A
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jan 2021 22:13:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 211166E591;
	Mon, 18 Jan 2021 21:13:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACD5C6E58E;
 Mon, 18 Jan 2021 21:13:40 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id d13so17724151wrc.13;
 Mon, 18 Jan 2021 13:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DfnA+OcAFtcFxr40jr50iORRAFqvfHPsv5cZyKe+q38=;
 b=kf4hcAQVI7z5D5nCKKuzsC9xlBGTr6pcXf2bXzpyb9Vg1yxZryQb5rVAczfXwwMB/O
 w0ytaMNItFQpH5QEcHdBCppcQke40xV9cTnVyaHzfHjcHarRkwFiEP5Tg0hCZN3V5m1m
 hbtVC7T0YMhs5T9rBfF2JUVrVYnmCHr0rjxgHghCN7O6NS/5TrsBOkizPTEi1+37Cbrh
 XUuHWX31En/fpzPOC0+UuoE2twEcws7bG8pylBQMEz5ix+tDoxoHFCdXD3QTCEokX9Xi
 1MjI3jMzZ3VLADyM9sMKKPpt46Xl7bnNgjwTwI3GBEQDnNfNX2YYNfeoa6YS3ii/CkPU
 2adQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DfnA+OcAFtcFxr40jr50iORRAFqvfHPsv5cZyKe+q38=;
 b=V01VYYKkmtX5gsB0QPt0cUXOkUAb5bPBgBKVZX55oLJ0DYK8AfeRJsKtRtTIjDyFIZ
 RLF/FXkmimYTHeN9CXzaeswUOcF0tKhAIrrBZsEsMIpnU7+uCIkuCGjO3rRdb/tZVVF0
 8608LNpeKIqEkT4h0BX5aer1iyAFKZu5kxhpNs+fN3bC240B4+H7omMocMDeUHvCVP5Z
 L7lx6KOgajOVXsri4QCYUNxVEpLTjcf4PyKneS0LDjwz6QHvm7MWFRK/f39Gw5JmnJm6
 x1u5OejyLuUBDF4xxHayXVsfpnePmW4lUr5zjc80EJfSfCaZNqjbThblCH/Xfbc8O+Y7
 v1bg==
X-Gm-Message-State: AOAM532JOmS/iWMS6d7ypfobyLDVLYexaXYOh11UX7SAjgaB44dIcFNn
 NLp2VRv07vznYEkps6hqBOke6moCNOAhZZX4r3I=
X-Google-Smtp-Source: ABdhPJwNOfYdNWJWdIYge61E+UF9gSVsMDMzVfyui5Xghpvq/H1vicFDjuRCKS1ARBjA6DEcTHQinCCBWD3lyiMeF/o=
X-Received: by 2002:a5d:6909:: with SMTP id t9mr1174197wru.327.1611004419225; 
 Mon, 18 Jan 2021 13:13:39 -0800 (PST)
MIME-Version: 1.0
References: <1608597876-32367-1-git-send-email-isaacm@codeaurora.org>
 <1608597876-32367-6-git-send-email-isaacm@codeaurora.org>
In-Reply-To: <1608597876-32367-6-git-send-email-isaacm@codeaurora.org>
From: Rob Clark <robdclark@gmail.com>
Date: Mon, 18 Jan 2021 13:16:03 -0800
Message-ID: <CAF6AEGunsv5r_DmNsMbYwa4KQxRmK9J+5Bd12LYG4pQ=hrCe4Q@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] drm/msm: Add dependency on io-pgtable-arm format
 module
To: "Isaac J. Manjarres" <isaacm@codeaurora.org>
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
Cc: Android Kernel Team <kernel-team@android.com>,
 Will Deacon <will@kernel.org>, pdaly@codeaurora.org,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 Pratik Patel <pratikp@codeaurora.org>,
 freedreno <freedreno@lists.freedesktop.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 21, 2020 at 4:44 PM Isaac J. Manjarres
<isaacm@codeaurora.org> wrote:
>
> The MSM DRM driver depends on the availability of the ARM LPAE io-pgtable
> format code to work properly. In preparation for having the io-pgtable
> formats as modules, add a "pre" dependency with MODULE_SOFTDEP() to
> ensure that the io-pgtable-arm format module is loaded before loading
> the MSM DRM driver module.
>
> Signed-off-by: Isaac J. Manjarres <isaacm@codeaurora.org>

Thanks, I've queued this up locally

BR,
-R

> ---
>  drivers/gpu/drm/msm/msm_drv.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 535a026..8be3506 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -1369,3 +1369,4 @@ module_exit(msm_drm_unregister);
>  MODULE_AUTHOR("Rob Clark <robdclark@gmail.com");
>  MODULE_DESCRIPTION("MSM DRM Driver");
>  MODULE_LICENSE("GPL");
> +MODULE_SOFTDEP("pre: io-pgtable-arm");
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>
> _______________________________________________
> iommu mailing list
> iommu@lists.linux-foundation.org
> https://lists.linuxfoundation.org/mailman/listinfo/iommu
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
