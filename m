Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 285A33E5983
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 13:56:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EB1B88FD2;
	Tue, 10 Aug 2021 11:56:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com
 [209.85.222.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1F2688FD2
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 11:56:25 +0000 (UTC)
Received: by mail-ua1-f46.google.com with SMTP id m39so3165074uad.9
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 04:56:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vTRTCfqQ7bKYYtx3wTVwrv32a2MPEzZV5U+TIgC3RG0=;
 b=Sl0oR7sHrwrFWz9DkB0HbQ0OGBXlwmZzHSs4R0WRS2s3RLnc4KfAMFm9SWITBZtEdT
 FsO5/70KYsvAJh5ZoBXlRdLKMT15p7ExiqBsvBmlFPpQq246RtFQCn89nrtYmzdNamq6
 nwBCzv8wD8XfNGqdvBRVFKc6fS4w9LevIRtyHLEKXJ5LaYFaF7ol3+xUD8NeTFUe3gci
 F9fNh650K4j/O+T9hNpzjXIzKjOne0KKPDSJ/QHckc9oKeIPBnBOBUJMio0ZwDqzbXg6
 6z//hWSKuN8n/HKIihtxdJHkL2BGHiWpBviEcjlq+DoyHOZ2ZSMdrdfirSdx8DYuGUt+
 yrZQ==
X-Gm-Message-State: AOAM533ZbeFZewpOZZ+upvRlsOe9lxPADyTNoExrLLpofVLipId68htl
 J8hpq41Kvq6V/VVHpJcHdSmsN6Z3DKFiWGTuoiY=
X-Google-Smtp-Source: ABdhPJyR2Wvm/hKsOkev5kLwifwC9ps3gs3wke1iEGJOM8WXZs2YY+H/TR/IYi2UOLmV4+KtCuV/PadScY60L640eDY=
X-Received: by 2002:ab0:6710:: with SMTP id q16mr20053424uam.106.1628596584126; 
 Tue, 10 Aug 2021 04:56:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210806120417.49878-1-broonie@kernel.org>
In-Reply-To: <20210806120417.49878-1-broonie@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 10 Aug 2021 13:56:12 +0200
Message-ID: <CAMuHMdXNAe3_TK-YWDwxjQ1uRMb0zLSSgx7w7FYCXvRmxG3pAQ@mail.gmail.com>
Subject: Re: linux-next: manual merge of the drm tree with the drm-fixes tree
To: Mark Brown <broonie@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Chengming Gui <Jack.Gui@amd.com>, Tao Zhou <tao.zhou1@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mark, Stephen,

On Fri, Aug 6, 2021 at 6:11 PM Mark Brown <broonie@kernel.org> wrote:
> Today's linux-next merge of the drm tree got a conflict in:
>
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>
> between commit:
>
>   e00f543d3596 ("drm/amdgpu: add DID for beige goby")
>
> from the drm-fixes tree and commit:
>
>   a8f706966b92 ("drm/amdgpu: add pci device id for cyan_skillfish")
>
> from the drm tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>
>
> diff --cc drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 5ed8381ae0f5,d637b0536f84..000000000000
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@@ -1213,13 -1212,9 +1212,16 @@@ static const struct pci_device_id pciid
>         {0x1002, 0x740F, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_ALDEBARAN|AMD_EXP_HW_SUPPORT},
>         {0x1002, 0x7410, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_ALDEBARAN|AMD_EXP_HW_SUPPORT},
>
>  +      /* BEIGE_GOBY */
>  +      {0x1002, 0x7420, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_BEIGE_GOBY},
>  +      {0x1002, 0x7421, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_BEIGE_GOBY},
>  +      {0x1002, 0x7422, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_BEIGE_GOBY},
>  +      {0x1002, 0x7423, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_BEIGE_GOBY},
>  +      {0x1002, 0x743F, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_BEIGE_GOBY},
>  +
> +       /* CYAN_SKILLFISH */
> +       {0x1002, 0x13FE, PCI_ANY_ID, PCI_ANY_ID, 0, 0, CHIP_CYAN_SKILLFISH|AMD_IS_APU},
> +
>         {0, 0, 0}
>   };

next-20210806 and later have a different resolution, duplicating the
BEIGE_GOBY entries before and after the CYAN_SKILLFISH entry.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
