Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B79D2CF5D3
	for <lists+dri-devel@lfdr.de>; Fri,  4 Dec 2020 21:49:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 368006E249;
	Fri,  4 Dec 2020 20:49:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x341.google.com (mail-ot1-x341.google.com
 [IPv6:2607:f8b0:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1A536E249;
 Fri,  4 Dec 2020 20:49:01 +0000 (UTC)
Received: by mail-ot1-x341.google.com with SMTP id o11so3850646ote.4;
 Fri, 04 Dec 2020 12:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ETBT8tLrqWhU3nQJzSd6pnShSvogFC7sNASc+9sqs84=;
 b=X+FBgvPnntPzx4qoAbpgm6nFj7+d26T0HuVa/rSpQ3DzJFvuqolcnpaLkYRm79Q8+M
 XeLX4Tx6t+uTQGlrNgSe2lHw4cqJWCV/Vt+OVDN+QAKXVg3bz3d1QV2OJcHbgaZfHcn5
 OodPePv4psMzAqlr39L1ykKMfWMeVWe0Xp/plL040gAMHCKYHpOSmBJXewtTcNOKX9Wy
 TAsznwK1xKd7zA3QcQNSYYJlP0mW2yEQ8hToZUjghT42SleNCa+E3rHe85lwc58XZmgl
 WiJEomjQze0QEXjx09VcEIVmbnXOthYItD3khx/jdY2QDY2OA+QP7hRJRnO3XtWhn50g
 XSgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ETBT8tLrqWhU3nQJzSd6pnShSvogFC7sNASc+9sqs84=;
 b=QkQrXr0cOU8AYdsqPGf1zaxBJ/aRAvqCes6XYO4AWEeJSB7q2X0eFcH3NdzfOX7jkH
 2MMJYxISHpKczgP4y7KSqLtbQOrJR2Z1/74ql2CDKmGgWwhjuTNPNrVy6k/PcZFoH5kM
 40oNXp9eizGCQO6m8Z7sTLSC/L2NEFdndMiip0SOKp24uD4rtaPED0H3aQmYhgXQxVFy
 il+Pe1ZCpLiAGo4vYkTUpMlx7QT4hIAJvf2jBUspeGNC7/q9lWSDF57P7RyTDT/ZXAps
 dIVM2tHQLrrHFmuQgDXVSFViqT9iDyL8v3PUkbC+538a6CHRToJrD68USXi6tuy5+U20
 7Xmw==
X-Gm-Message-State: AOAM530KTMu0E7hPSmqzmYTme7ZjhzhUc5LFfR77d/7n7qH4dUQwSJY6
 S55m3I0cvF0WkFn0cTwLe49GCnV/MZJFqk1PyWc=
X-Google-Smtp-Source: ABdhPJzt4EfSu2Fb07W12172LWrggEAFHBbB7GRVJsw4ZlpnGKoPlkzO6SAaE4FBLON5IzCEG/DCXK8DNNX8h5GLXl0=
X-Received: by 2002:a05:6830:1b7b:: with SMTP id
 d27mr2649539ote.132.1607114941003; 
 Fri, 04 Dec 2020 12:49:01 -0800 (PST)
MIME-Version: 1.0
References: <20201203230652.1480863-1-arnd@kernel.org>
 <BYAPR12MB2888D809724EADE2AAB77B74B0F10@BYAPR12MB2888.namprd12.prod.outlook.com>
In-Reply-To: <BYAPR12MB2888D809724EADE2AAB77B74B0F10@BYAPR12MB2888.namprd12.prod.outlook.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Fri, 4 Dec 2020 15:48:49 -0500
Message-ID: <CADnq5_PFVyL5sBc3zx5rLRV6NX2O8f_vZ7emWcDOEEwgaqqU1g@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: fix debugfs creation/removal, again
To: "Zhou1, Tao" <Tao.Zhou1@amd.com>
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
Cc: Arnd Bergmann <arnd@kernel.org>, Arnd Bergmann <arnd@arndb.de>, "Chen,
 Guchun" <Guchun.Chen@amd.com>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Ma,
 Le" <Le.Ma@amd.com>, "Yang, Stanley" <Stanley.Yang@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Clements,
 John" <John.Clements@amd.com>, "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Li, Dennis" <Dennis.Li@amd.com>, "Zhang, Hawking" <Hawking.Zhang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Dec 4, 2020 at 1:17 AM Zhou1, Tao <Tao.Zhou1@amd.com> wrote:
>
> [AMD Public Use]
>
> Reviewed-by: Tao Zhou <tao.zhou1@amd.com>

Applied.  Thanks!

Alex

>
> > -----Original Message-----
> > From: Arnd Bergmann <arnd@kernel.org>
> > Sent: Friday, December 4, 2020 7:07 AM
> > To: Deucher, Alexander <Alexander.Deucher@amd.com>; Koenig, Christian
> > <Christian.Koenig@amd.com>; David Airlie <airlied@linux.ie>; Daniel Vetter
> > <daniel@ffwll.ch>; Li, Dennis <Dennis.Li@amd.com>; Zhou1, Tao
> > <Tao.Zhou1@amd.com>; Chen, Guchun <Guchun.Chen@amd.com>
> > Cc: Arnd Bergmann <arnd@arndb.de>; Zhang, Hawking
> > <Hawking.Zhang@amd.com>; Clements, John <John.Clements@amd.com>;
> > Yang, Stanley <Stanley.Yang@amd.com>; Ma, Le <Le.Ma@amd.com>; amd-
> > gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; linux-
> > kernel@vger.kernel.org
> > Subject: [PATCH] drm/amdgpu: fix debugfs creation/removal, again
> >
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > There is still a warning when CONFIG_DEBUG_FS is disabled:
> >
> > drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:1145:13: error:
> > 'amdgpu_ras_debugfs_create_ctrl_node' defined but not used [-
> > Werror=unused-function]
> >  1145 | static void amdgpu_ras_debugfs_create_ctrl_node(struct
> > amdgpu_device *adev)
> >
> > Change the code again to make the compiler actually drop this code but not
> > warn about it.
> >
> > Fixes: ae2bf61ff39e ("drm/amdgpu: guard ras debugfs creation/removal based
> > on CONFIG_DEBUG_FS")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> >  drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c | 13 +++++--------
> > drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h |  6 ------
> >  2 files changed, 5 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> > b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> > index 9d11b847e6ef..c136bd449744 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c
> > @@ -1167,7 +1167,7 @@ static void
> > amdgpu_ras_debugfs_create_ctrl_node(struct amdgpu_device *adev)
> >                       con->dir, &con->disable_ras_err_cnt_harvest);
> >  }
> >
> > -void amdgpu_ras_debugfs_create(struct amdgpu_device *adev,
> > +static void amdgpu_ras_debugfs_create(struct amdgpu_device *adev,
> >               struct ras_fs_if *head)
> >  {
> >       struct amdgpu_ras *con = amdgpu_ras_get_context(adev); @@ -1189,7
> > +1189,6 @@ void amdgpu_ras_debugfs_create(struct amdgpu_device *adev,
> >
> >  void amdgpu_ras_debugfs_create_all(struct amdgpu_device *adev)  { -#if
> > defined(CONFIG_DEBUG_FS)
> >       struct amdgpu_ras *con = amdgpu_ras_get_context(adev);
> >       struct ras_manager *obj;
> >       struct ras_fs_if fs_info;
> > @@ -1198,7 +1197,7 @@ void amdgpu_ras_debugfs_create_all(struct
> > amdgpu_device *adev)
> >        * it won't be called in resume path, no need to check
> >        * suspend and gpu reset status
> >        */
> > -     if (!con)
> > +     if (!IS_ENABLED(CONFIG_DEBUG_FS) || !con)
> >               return;
> >
> >       amdgpu_ras_debugfs_create_ctrl_node(adev);
> > @@ -1212,10 +1211,9 @@ void amdgpu_ras_debugfs_create_all(struct
> > amdgpu_device *adev)
> >                       amdgpu_ras_debugfs_create(adev, &fs_info);
> >               }
> >       }
> > -#endif
> >  }
> >
> > -void amdgpu_ras_debugfs_remove(struct amdgpu_device *adev,
> > +static void amdgpu_ras_debugfs_remove(struct amdgpu_device *adev,
> >               struct ras_common_if *head)
> >  {
> >       struct ras_manager *obj = amdgpu_ras_find_obj(adev, head); @@ -
> > 1229,7 +1227,6 @@ void amdgpu_ras_debugfs_remove(struct amdgpu_device
> > *adev,
> >
> >  static void amdgpu_ras_debugfs_remove_all(struct amdgpu_device *adev)  { -
> > #if defined(CONFIG_DEBUG_FS)
> >       struct amdgpu_ras *con = amdgpu_ras_get_context(adev);
> >       struct ras_manager *obj, *tmp;
> >
> > @@ -1238,7 +1235,6 @@ static void amdgpu_ras_debugfs_remove_all(struct
> > amdgpu_device *adev)
> >       }
> >
> >       con->dir = NULL;
> > -#endif
> >  }
> >  /* debugfs end */
> >
> > @@ -1286,7 +1282,8 @@ static int amdgpu_ras_fs_init(struct amdgpu_device
> > *adev)
> >
> >  static int amdgpu_ras_fs_fini(struct amdgpu_device *adev)  {
> > -     amdgpu_ras_debugfs_remove_all(adev);
> > +     if (IS_ENABLED(CONFIG_DEBUG_FS))
> > +             amdgpu_ras_debugfs_remove_all(adev);
> >       amdgpu_ras_sysfs_remove_all(adev);
> >       return 0;
> >  }
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h
> > b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h
> > index 4667cce38582..762f5e46c007 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ras.h
> > @@ -592,14 +592,8 @@ int amdgpu_ras_sysfs_create(struct amdgpu_device
> > *adev,  int amdgpu_ras_sysfs_remove(struct amdgpu_device *adev,
> >               struct ras_common_if *head);
> >
> > -void amdgpu_ras_debugfs_create(struct amdgpu_device *adev,
> > -             struct ras_fs_if *head);
> > -
> >  void amdgpu_ras_debugfs_create_all(struct amdgpu_device *adev);
> >
> > -void amdgpu_ras_debugfs_remove(struct amdgpu_device *adev,
> > -             struct ras_common_if *head);
> > -
> >  int amdgpu_ras_error_query(struct amdgpu_device *adev,
> >               struct ras_query_if *info);
> >
> > --
> > 2.27.0
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
