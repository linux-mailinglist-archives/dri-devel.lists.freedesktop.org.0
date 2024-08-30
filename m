Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C25F9965C39
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 10:59:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F61A10E1D3;
	Fri, 30 Aug 2024 08:59:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com
 [209.85.219.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9383810E1D3;
 Fri, 30 Aug 2024 08:59:35 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id
 3f1490d57ef6-e03caab48a2so1344404276.1; 
 Fri, 30 Aug 2024 01:59:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725008374; x=1725613174;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5sy+VggCqE5ZQFv6S3QPo1m00aK4PzCBfE22ypnHep4=;
 b=iresR+u1656uqJ2QGwTHqVcANehVix9qtWnctL0DHII9P0vJTj++1Tq7/QUR48g7pe
 fQW3HYJDzmLc35FLoXq2jRJtXiuWGgNokVMweacGt4xORr53U5VpWI2+Pm9qpGiCooXw
 6v/BRkzByJlvzVKQeuhu+axE6u/mftZj6eU8Mqa/bI+f7af1dhJy01VQyUh1nM2GD1FI
 tOnilDY1H0L7AiFa7ajCk1tmPSWI7LHaswPWdrPHjjaofbsEmKBtTGQBZLVpAX+Oqzjz
 vEBfk/R2UimDq8++o4GafqDIUDcvcX1DX3F2MdgKqzMTyNFtoll7+Fhycs+WMsQH9QiL
 IDBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVgXcxcPavo0Fi6GtBu1M9Fcy9L9vLVPK29IiBLDfhOD96t7RUvBdpgf//eYV9TQ14zYNFzs2xh@lists.freedesktop.org,
 AJvYcCXQ36knEkHERmjd8nmnF9jX67RioyuDR4iCDRhYXNzzUfiqnEk6cjo9NnfqrurJsMLQxXW9ynDuUplN@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz0p+s61wZw2MpJpTYAd5sICKn3ntCVkwWbfSMkm1moL1Yk6lFy
 p1ypXeBtoYmPpgKsK9X7Kg+FyPD9j7seWtPOkZ0AU8YuDcG5OFyNoU7HB1gN
X-Google-Smtp-Source: AGHT+IFyEZ1Rbp0MEeWujqNy2I+fwPYSSu9GjIC92rQ2Uzxc5eaZceJULNQ5MuGjFeiycuhNHTzn5A==
X-Received: by 2002:a25:824d:0:b0:e0b:de84:9764 with SMTP id
 3f1490d57ef6-e1a5c66722cmr4527275276.14.1725008374086; 
 Fri, 30 Aug 2024 01:59:34 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com.
 [209.85.128.182]) by smtp.gmail.com with ESMTPSA id
 3f1490d57ef6-e1a626e4917sm538100276.52.2024.08.30.01.59.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Aug 2024 01:59:33 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-6b3afc6cd01so20867157b3.1; 
 Fri, 30 Aug 2024 01:59:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXG08F7FM8Pf9XJ0Nn0PLls1s+iQL+241tovTd6RPrUCG7ksk9CklmLI8hXU+vd/iDG1r3uig9Jk2NT@lists.freedesktop.org,
 AJvYcCXWBX2KHOkaBzXNUpAN2kov91QUyDpKKcMUYTOMivSUrQkuNIDiR+WvPvHSPD2bdVLAc0GogMLk@lists.freedesktop.org
X-Received: by 2002:a05:690c:6609:b0:6b2:7494:455c with SMTP id
 00721157ae682-6d3f7facc50mr13558897b3.1.1725008373673; Fri, 30 Aug 2024
 01:59:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240822071056.1342551-1-11162571@vivo.com>
In-Reply-To: <20240822071056.1342551-1-11162571@vivo.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 30 Aug 2024 10:59:20 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWpXqbZqv9DnjHQouxOiqQcMy4qxj42PEYkPrUdm_xszg@mail.gmail.com>
Message-ID: <CAMuHMdWpXqbZqv9DnjHQouxOiqQcMy4qxj42PEYkPrUdm_xszg@mail.gmail.com>
Subject: Re: [PATCH v1] drivers:smumgr:Variable names should be consistent
 with other modules
To: Yang Ruibin <11162571@vivo.com>
Cc: Kenneth Feng <kenneth.feng@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Stephen Rothwell <sfr@canb.auug.org.au>, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 opensource.kernel@vivo.com
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

Hi Yang,

Thanks for your patch!

On Thu, Aug 22, 2024 at 9:11=E2=80=AFAM Yang Ruibin <11162571@vivo.com> wro=
te:
> The variable highest_pcie_level_enabled is named
> hightest_pcie_level_enabled in other modules.
> Please ensure the consistency of variable naming
> and use min macros instead of the triadic operator.

"hightest_pcie_level_enabled" is the wrong spelling, so the other modules
should be fixed instead:

drivers/gpu/drm/amd/pm/powerplay/smumgr/fiji_smumgr.c
drivers/gpu/drm/amd/pm/powerplay/smumgr/polaris10_smumgr.c
drivers/gpu/drm/amd/pm/powerplay/smumgr/vegam_smumgr.c

> Signed-off-by: Yang Ruibin <11162571@vivo.com>

> --- a/drivers/gpu/drm/amd/pm/powerplay/smumgr/iceland_smumgr.c
> +++ b/drivers/gpu/drm/amd/pm/powerplay/smumgr/iceland_smumgr.c

> @@ -1012,19 +1012,18 @@ static int iceland_populate_all_graphic_levels(st=
ruct pp_hwmgr *hwmgr)
>                 lowest_pcie_level_enabled++;
>         }
>
> -       while ((count < highest_pcie_level_enabled) &&
> +       while ((count < hightest_pcie_level_enabled) &&
>                         ((data->dpm_level_enable_mask.pcie_dpm_enable_mas=
k &
>                                 (1 << (lowest_pcie_level_enabled + 1 + co=
unt))) =3D=3D 0)) {
>                 count++;
>         }
>
> -       mid_pcie_level_enabled =3D (lowest_pcie_level_enabled+1+count) < =
highest_pcie_level_enabled ?
> -               (lowest_pcie_level_enabled+1+count) : highest_pcie_level_=
enabled;
> +       mid_pcie_level_enabled =3D min(lowest_pcie_level_enabled + 1 + co=
unt,
> +                                       hightest_pcie_level_enabled);

This is an unrelated change; please create a separate patch for this.

> -
> -       /* set pcieDpmLevel to highest_pcie_level_enabled*/
> +       /* set pcieDpmLevel to hightest_pcie_level_enabled*/
>         for (i =3D 2; i < dpm_table->sclk_table.count; i++) {
> -               smu_data->smc_state_table.GraphicsLevel[i].pcieDpmLevel =
=3D highest_pcie_level_enabled;
> +               smu_data->smc_state_table.GraphicsLevel[i].pcieDpmLevel =
=3D
> +                                       hightest_pcie_level_enabled;
>         }
>
>         /* set pcieDpmLevel to lowest_pcie_level_enabled*/

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
