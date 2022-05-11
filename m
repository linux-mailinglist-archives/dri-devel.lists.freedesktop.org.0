Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A041523CA7
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 20:36:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94ACB11299D;
	Wed, 11 May 2022 18:36:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 923B911299A;
 Wed, 11 May 2022 18:36:35 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-edf9ddb312so3850391fac.8; 
 Wed, 11 May 2022 11:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c24hMS7WpiIOCU2zBlghi9w7iiPETthn8Oys+Y9A4/M=;
 b=RVrvvjyYi6+uwGJshrvP26QBJ/UhS/zOMuVWL2YjmVKpp2xtdtezDiLcExQZmwZHQV
 ZXtEc4GRUn6P5ti1v/sUPlehQqCSa1c7PaCBjcwcoot1lttaoYfHuQ0Mq3CqGhkymJ90
 SCyCD0WPdPWIELtR0H+QJL2DPJ7pymcVe76xHh9JC+qcXmNgHxJ9wMSWPk7bWXMwVuae
 59oQ5eHqpVgBQrUs8LofWYBlVup3QkNrZ2JddkjsgLaxOIoJnC2goUXoHxrj6PUQPQh+
 7x2fv+8m1lQmE263riUnFnXz30Fwot93EFqfuM1/C0UsRgygFchQMTFpY6UQ48D2emGE
 vRcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c24hMS7WpiIOCU2zBlghi9w7iiPETthn8Oys+Y9A4/M=;
 b=njJNvKxbmRC3gJ9ofJt+OLn7WDOA6p2exVqfitdBrHB9/HJ/yZYt+GCNCG1wkdNr4t
 jqy49PRPawTEBJJ49a52FTao4omRYymZ3qIp73IteWayFNjvPpgjMhYWTyfftBVgWt9D
 mccqhn5mE3AjSEnofnkhRD6Qj35YQEF576Sta9F/EdyAVU4V+zJdkTXheyiQzHxKTAYN
 n6gzWqS96uUoxXUkqBhBF37j6Kbl8Ogej3+WKADL+6X14pMcMqjd/TW5eY69XHFfT48x
 Z8ekgG44HHzvee/x8VZNBgJBNj2I0j4ACFihBYJnNybV54CSQmRFQeox+glucsR2QbRB
 Hogg==
X-Gm-Message-State: AOAM532R583iymricuRLsUuXaE/LikNwSyhB/3mknCeXKTNZjgeK3YLc
 Yi4G3bDwBaTTCTe4jo2dRgtjAWfbMc6w8GFdo7k=
X-Google-Smtp-Source: ABdhPJxYls/DZkm0AwI7Mcf85JV3K1161l411LCMOeOvx4/neBkQknKQa22bMjyYmKnal6BpYKfScOVBIl1HTjRCRaE=
X-Received: by 2002:a05:6870:311d:b0:de:9b6c:362b with SMTP id
 v29-20020a056870311d00b000de9b6c362bmr3285781oaa.200.1652294194845; Wed, 11
 May 2022 11:36:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220511181935.810735-1-lyude@redhat.com>
In-Reply-To: <20220511181935.810735-1-lyude@redhat.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 11 May 2022 14:36:23 -0400
Message-ID: <CADnq5_OWH-Bat3OyCmHz6hTE++7hPLXqqMgg2=Nk6HB_Qk61JA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Add 'modeset' module parameter
To: Lyude Paul <lyude@redhat.com>
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
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Solomon Chiu <solomon.chiu@amd.com>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 11, 2022 at 2:20 PM Lyude Paul <lyude@redhat.com> wrote:
>
> Many DRM drivers feature a 'modeset' argument, which can be used to
> enable/disable the entire driver (as opposed to passing nomodeset to the
> kernel, which would disable modesetting globally and make it difficult to
> load amdgpu afterwards). Apparently amdgpu is actually missing this
> however, so let's add it!

You can already do that by passing modprobe.blacklist=amdgpu on the
kernel command line.  I don't think we need another option to do that.


>
> Keep in mind that this currently just lets one enable or disable amdgpu, I
> haven't bothered adding a headless mode like nouveau has - however I'm sure
> someone else can add this if needed.

You can do this as well by passing an IP block mask which disables the
display IP, or media IP, etc.

Alex

>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index ebd37fb19cdb..24e6fb4517cc 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -872,6 +872,15 @@ MODULE_PARM_DESC(smu_pptable_id,
>         "specify pptable id to be used (-1 = auto(default) value, 0 = use pptable from vbios, > 0 = soft pptable id)");
>  module_param_named(smu_pptable_id, amdgpu_smu_pptable_id, int, 0444);
>
> +/**
> + * DOC: modeset (int)
> + * Used to enable/disable modesetting for amdgpu exclusively.
> + */
> +bool amdgpu_enable_modeset = true;
> +MODULE_PARM_DESC(modeset,
> +                "Enable or disable display driver (1 = on (default), 0 = off");
> +module_param_named(modeset, amdgpu_enable_modeset, bool, 0444);
> +
>  /* These devices are not supported by amdgpu.
>   * They are supported by the mach64, r128, radeon drivers
>   */
> @@ -2003,6 +2012,11 @@ static int amdgpu_pci_probe(struct pci_dev *pdev,
>         bool is_fw_fb;
>         resource_size_t base, size;
>
> +       if (!amdgpu_enable_modeset) {
> +               DRM_INFO("modeset=0 passed to amdgpu, driver will not be enabled\n");
> +               return -ENODEV;
> +       }
> +
>         /* skip devices which are owned by radeon */
>         for (i = 0; i < ARRAY_SIZE(amdgpu_unsupported_pciidlist); i++) {
>                 if (amdgpu_unsupported_pciidlist[i] == pdev->device)
> --
> 2.35.1
>
