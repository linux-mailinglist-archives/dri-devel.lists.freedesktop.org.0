Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7234ACB11
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 22:17:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2372910F8DE;
	Mon,  7 Feb 2022 21:17:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8058D10F8DE;
 Mon,  7 Feb 2022 21:17:53 +0000 (UTC)
Received: by mail-oo1-xc2a.google.com with SMTP id
 r15-20020a4ae5cf000000b002edba1d3349so15274441oov.3; 
 Mon, 07 Feb 2022 13:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=v+WQ2xVsw1oloryxWnpzmbXz/wxjOTMCRW462Qc7Xqs=;
 b=OcbJiNLwcq0sJ+Fp2kOwKKLiaUv/95AU39rRIU3j1+5ZXPbY/Vqzi2PtntwgWpj5Ml
 fTnmnmSS8KZlEzsgsMmmCweGE2X/N0ej1u78XhcaI6XtkNZ6g/+g/TuVUsxDQUml+Dpe
 uMs+G9iV6LbilyL7ZkyZhOgdkledFfpR7vVRJsjani5xa/2Q3cLGgDSZ4sfhknDGSm/R
 Noh9ntR2Crldtj5S7t83+1zhG6aMj2E2jD43qJLgrzj5bncxqBRnhM/V94F3OhMVk609
 wnZ+69LbP8FisjhLua+Ss1pvnCcF6ohwjkXEvyaURztnFTEYFNVKc0J/E+h8CLJH4qEY
 je7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=v+WQ2xVsw1oloryxWnpzmbXz/wxjOTMCRW462Qc7Xqs=;
 b=DE3IItjrPQFCxnOD7HZr88/hD7FaNtIfQ4o9b3kIGNyRFJ59Mnl1h7fS2SboZv75Tt
 6LHUpAjdJC/VX76CQ/5k2SdNu0H4DWVXZsDpyh3BFK6bwYp0TYek9hvb06duJYRbqgOP
 Xg3F4GgdJ0JygG7VU3QUooLxK1lJpAT2eYey3cJnGnQtwZS0e3dwfNdG4oBQj/HLqrm0
 eoQoEXPcCgHSC5fsvGr0xI0dDDK2jIFW5qZfVoqWrvdrXWrrk57QGWp3+GPaX3muGCsU
 /lQnZ06k6JQhEOob7VcyKXHt8kobn9sOZqZavUK3+fKNTxSl5oILN9s9+DJ1Hs6KafUk
 8vmA==
X-Gm-Message-State: AOAM533XoQzXYvC8EWleKyTS59E5Vdwr2brKHo7SbhwUmKv/RJvE3ONm
 xC5cbVvIlrLxs52YGpVyqooigZlokHZmcd71bdk=
X-Google-Smtp-Source: ABdhPJwxahO9gU4b7vgJU1VxOUJqEJqsTZeca/z/V2pSmCt5TD2eqOzVnHKuDMsSBe3vZzP16U85FdCFWaUpUsoZsn8=
X-Received: by 2002:a05:6870:790c:: with SMTP id
 hg12mr285137oab.73.1644268672692; 
 Mon, 07 Feb 2022 13:17:52 -0800 (PST)
MIME-Version: 1.0
References: <YfskWvNqt81rZZpQ@fedora>
 <DM6PR12MB26199543AD01C2DA18CCFB64E42C9@DM6PR12MB2619.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB26199543AD01C2DA18CCFB64E42C9@DM6PR12MB2619.namprd12.prod.outlook.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Feb 2022 16:17:41 -0500
Message-ID: <CADnq5_OgYywwhy1GJsX=z6pttMVbo2kJc5uOT8WMrEWR8O2Mhg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm: add missing prototypes to amdgpu_dpm_internal
To: "Quan, Evan" <Evan.Quan@amd.com>
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
Cc: "jiapeng.chong@linux.alibaba.com" <jiapeng.chong@linux.alibaba.com>, "Lazar,
 Lijo" <Lijo.Lazar@amd.com>, "Chen, Guchun" <Guchun.Chen@amd.com>,
 "airlied@linux.ie" <airlied@linux.ie>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <maira.canal@usp.br>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>,
 "ndesaulniers@google.com" <ndesaulniers@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nathan@kernel.org" <nathan@kernel.org>, "Tuikov,
 Luben" <Luben.Tuikov@amd.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>, "Zhang,
 Hawking" <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Sun, Feb 6, 2022 at 10:30 PM Quan, Evan <Evan.Quan@amd.com> wrote:
>
> [AMD Official Use Only]
>
> Thanks for the fix!
> Reviewed-by: Evan Quan <evan.quan@amd.com>
>
> > -----Original Message-----
> > From: Ma=C3=ADra Canal <maira.canal@usp.br>
> > Sent: Thursday, February 3, 2022 8:40 AM
> > To: Quan, Evan <Evan.Quan@amd.com>; Deucher, Alexander
> > <Alexander.Deucher@amd.com>; Koenig, Christian
> > <Christian.Koenig@amd.com>; Pan, Xinhui <Xinhui.Pan@amd.com>;
> > airlied@linux.ie; daniel@ffwll.ch; nathan@kernel.org;
> > ndesaulniers@google.com; Lazar, Lijo <Lijo.Lazar@amd.com>; Tuikov, Lube=
n
> > <Luben.Tuikov@amd.com>; Chen, Guchun <Guchun.Chen@amd.com>;
> > Zhang, Hawking <Hawking.Zhang@amd.com>;
> > jiapeng.chong@linux.alibaba.com
> > Cc: amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; lin=
ux-
> > kernel@vger.kernel.org
> > Subject: [PATCH] drm/amd/pm: add missing prototypes to
> > amdgpu_dpm_internal
> >
> > Include the header with the prototype to silence the following clang
> > warnings:
> >
> > drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_dpm_internal.c:29:6:
> > warning: no
> > previous prototype for function 'amdgpu_dpm_get_active_displays'
> > [-Wmissing-prototypes]
> > void amdgpu_dpm_get_active_displays(struct amdgpu_device *adev)
> >      ^
> > drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_dpm_internal.c:29:1: note:
> > declare
> > 'static' if the function is not intended to be used outside of this
> > translation unit
> > void amdgpu_dpm_get_active_displays(struct amdgpu_device *adev)
> > ^
> > static
> > drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_dpm_internal.c:76:5:
> > warning: no
> > previous prototype for function 'amdgpu_dpm_get_vrefresh'
> > [-Wmissing-prototypes]
> > u32 amdgpu_dpm_get_vrefresh(struct amdgpu_device *adev)
> >     ^
> > drivers/gpu/drm/amd/amdgpu/../pm/amdgpu_dpm_internal.c:76:1: note:
> > declare
> > 'static' if the function is not intended to be used outside of this
> > translation unit
> > u32 amdgpu_dpm_get_vrefresh(struct amdgpu_device *adev)
> > ^
> > static
> > 2 warnings generated.
> >
> > Besides that, remove the duplicated prototype of the function
> > amdgpu_dpm_get_vblank_time in order to keep the consistency of the
> > headers.
> >
> > fixes: 6ddbd37f ("drm/amd/pm: optimize the amdgpu_pm_compute_clocks()
> > implementations")
> >
> > Signed-off-by: Ma=C3=ADra Canal <maira.canal@usp.br>
> > ---
> >  drivers/gpu/drm/amd/pm/amdgpu_dpm_internal.c | 1 +
> >  drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h      | 1 -
> >  drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c   | 1 +
> >  3 files changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/pm/amdgpu_dpm_internal.c
> > b/drivers/gpu/drm/amd/pm/amdgpu_dpm_internal.c
> > index ba5f6413412d..42efe838fa85 100644
> > --- a/drivers/gpu/drm/amd/pm/amdgpu_dpm_internal.c
> > +++ b/drivers/gpu/drm/amd/pm/amdgpu_dpm_internal.c
> > @@ -25,6 +25,7 @@
> >  #include "amdgpu_display.h"
> >  #include "hwmgr.h"
> >  #include "amdgpu_smu.h"
> > +#include "amdgpu_dpm_internal.h"
> >
> >  void amdgpu_dpm_get_active_displays(struct amdgpu_device *adev)
> >  {
> > diff --git a/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h
> > b/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h
> > index 5cc05110cdae..09790413cbc4 100644
> > --- a/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h
> > +++ b/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h
> > @@ -343,7 +343,6 @@ struct amdgpu_pm {
> >       struct amdgpu_ctx       *stable_pstate_ctx;
> >  };
> >
> > -u32 amdgpu_dpm_get_vblank_time(struct amdgpu_device *adev);
> >  int amdgpu_dpm_read_sensor(struct amdgpu_device *adev, enum
> > amd_pp_sensors sensor,
> >                          void *data, uint32_t *size);
> >
> > diff --git a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
> > b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
> > index 7427c50409d4..caae54487f9c 100644
> > --- a/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
> > +++ b/drivers/gpu/drm/amd/pm/legacy-dpm/si_dpm.c
> > @@ -28,6 +28,7 @@
> >  #include "amdgpu_pm.h"
> >  #include "amdgpu_dpm.h"
> >  #include "amdgpu_atombios.h"
> > +#include "amdgpu_dpm_internal.h"
> >  #include "amd_pcie.h"
> >  #include "sid.h"
> >  #include "r600_dpm.h"
> > --
> > 2.34.1
