Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C20B4F778A
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 09:32:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0C8D10E59E;
	Thu,  7 Apr 2022 07:32:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BC8810E14F;
 Wed,  6 Apr 2022 13:39:49 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id l26so4391274ejx.1;
 Wed, 06 Apr 2022 06:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=iyJLK8l5hs8KCNBFxlx1llqa+FYfySe8JZbdJuv2BSY=;
 b=AZPHzmAkPb4vBz8KQIFg70PyU76BInADKyX8st0Ig2+U518SEl0fYZpUw9xiNqn87K
 aFxAL3Rzj+bm6m248CxtYI2apq5TfG0PFHHUmZ81yjVBfZyky+nQJ/y68jjzZEoz3IVP
 2ZeHrhjWp7zRdPFnB94aJ4/AKOIGQDHMVIHBYN9336v/0QdlpMxxmRvr9byy1Bbv4vDL
 t/8yFF66Fj9bRZzxcLG0bXKl15HjhRZclLJAUz756gQUgnTvBYY20cHN7doi1i5nWcX4
 ErVcNb4eFZDmVj0lZzaKcxqtV9IkWmD3avg4JPdWRFGAV0+pyTjszJMDk1upXk7xhzUN
 JwKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iyJLK8l5hs8KCNBFxlx1llqa+FYfySe8JZbdJuv2BSY=;
 b=mHkxQxX1Bk2WnsX38WHq0QTcUekcCGLsX8NvjN/IkfWfDVfeP3zYMTTEhkcrv0uM1D
 NW5P5F9dXe1RstcqKcPwa52jO+v28uugG/feK3WMmgHUPf/sX/P3JrQZsO0Lx5LvAGn0
 BiU5bHdamfCRGLhSpKMKp12pkfHxGuFN+ypdkCAJtXNccFw10WpHfBHF931P+x6IJdEZ
 wv9bf8JiLiwmK6+qE/2BElw+On+VWp0JSWPFFEfrTfVDWyISa2mW6TenwidZLK+qn3vZ
 OEF7RJCWWY9Dj4xSzH2fhWqfdBPZVi6qCiNJLpusUmjKe0KFv2C34Gf6vIg0BakxXljk
 KMXA==
X-Gm-Message-State: AOAM531rEWQhIDAMzlXSYBJFr3Yq5SJYKoaDr3uU5XFe+newnQrTdXJN
 rxAPsftlchQ6HvN4O/QfXz4uf9YG/pBKEvrCGPQ=
X-Google-Smtp-Source: ABdhPJxMIvTQA11CZ2AiXt7TtQTnJBNSoAaXV+VAZQ4YGkON/JIi45sEq/1i4BR871lm6N50qVjEtGN9q8EZB893/WU=
X-Received: by 2002:a17:906:7947:b0:6da:892f:2503 with SMTP id
 l7-20020a170906794700b006da892f2503mr8161523ejo.710.1649252387873; Wed, 06
 Apr 2022 06:39:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220405213800.90205-1-h0tc0d3@gmail.com>
 <CADnq5_PXDyOXX2p4FswWWyY6sw8nXmajhUzx-=ke+6jiZn3ZPA@mail.gmail.com>
In-Reply-To: <CADnq5_PXDyOXX2p4FswWWyY6sw8nXmajhUzx-=ke+6jiZn3ZPA@mail.gmail.com>
From: =?UTF-8?B?0JPRgNC40LPQvtGA0LjQuQ==?= <h0tc0d3@gmail.com>
Date: Wed, 6 Apr 2022 16:39:46 +0300
Message-ID: <CAD5ugGDAKGtKLavhqSDObbGRu1WSyE04eQRhUv4Dk7dC+PrK6w@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Unnecessary code in gfx_v7_0.c
To: Alex Deucher <alexdeucher@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Thu, 07 Apr 2022 07:32:25 +0000
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
Cc: Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 Guchun Chen <guchun.chen@amd.com>, David Airlie <airlied@linux.ie>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Melissa Wen <mwen@igalia.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Joseph Greathouse <Joseph.Greathouse@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>,
 Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Alex Deucher, Thanks, that's what I thought too. But this code is
uninformative, and without it is clear what this code is doing. If you
need to provide additional information on how the code works, then for
me it's better to leave a comment.
This is actually more like a bug than an explanation of what the code is do=
ing.

=D1=81=D1=80, 6 =D0=B0=D0=BF=D1=80. 2022 =D0=B3. =D0=B2 16:20, Alex Deucher=
 <alexdeucher@gmail.com>:
>
> On Wed, Apr 6, 2022 at 4:00 AM Grigory Vasilyev <h0tc0d3@gmail.com> wrote=
:
> >
> > The code is useless and doesn't change the value.
> >
> > (0 << GB_ADDR_CONFIG__ROW_SIZE__SHIFT) =3D 0
> > gb_addr_config | 0 =3D gb_addr_config
> >
> > Perhaps there could be 1 instead of 0, but this does not correspond wit=
h
> > the logic of the switch.
>
> It doesn't do anything, but it helps the developer to understand how
> the driver state maps to hardware state.
>
> Alex
>
> >
> > Signed-off-by: Grigory Vasilyev <h0tc0d3@gmail.com>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c | 6 ++----
> >  1 file changed, 2 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c b/drivers/gpu/drm/am=
d/amdgpu/gfx_v7_0.c
> > index 1cb5db17d2b9..5ed84a6467ee 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c
> > @@ -4409,16 +4409,14 @@ static void gfx_v7_0_gpu_early_init(struct amdg=
pu_device *adev)
> >         /* fix up row size */
> >         gb_addr_config &=3D ~GB_ADDR_CONFIG__ROW_SIZE_MASK;
> >         switch (adev->gfx.config.mem_row_size_in_kb) {
> > -       case 1:
> > -       default:
> > -               gb_addr_config |=3D (0 << GB_ADDR_CONFIG__ROW_SIZE__SHI=
FT);
> > -               break;
> >         case 2:
> >                 gb_addr_config |=3D (1 << GB_ADDR_CONFIG__ROW_SIZE__SHI=
FT);
> >                 break;
> >         case 4:
> >                 gb_addr_config |=3D (2 << GB_ADDR_CONFIG__ROW_SIZE__SHI=
FT);
> >                 break;
> > +       default:
> > +               break;
> >         }
> >         adev->gfx.config.gb_addr_config =3D gb_addr_config;
> >  }
> > --
> > 2.35.1
> >
