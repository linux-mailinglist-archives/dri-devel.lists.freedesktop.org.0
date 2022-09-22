Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 713015E660D
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 16:43:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 653C110EBD7;
	Thu, 22 Sep 2022 14:42:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com
 [IPv6:2607:f8b0:4864:20::e32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A299110EBD7;
 Thu, 22 Sep 2022 14:42:53 +0000 (UTC)
Received: by mail-vs1-xe32.google.com with SMTP id m66so10511362vsm.12;
 Thu, 22 Sep 2022 07:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=qUbEpdRlteNF9t/zkLoFalPqmUoMmG/wjzQPvDY2tIU=;
 b=cRQjexIBjXl7gyOlBbjD4BxO7xCbxVxm05gcC0VaPBw85KlZd2jp6bfkCDDbAaaw6Z
 JJ9sbw2hJRMS8BCb1mGGGcmzg3+0hzRczED9AmTRLDtcLFAAfNz+K9BWAs5Ky9RJnS1V
 MVYfAI3bP8pB30C85R4R7+oEFEATLB5zoDU7wBS9CgpBYmlXDZedVIPnksxuvpQ4uTPn
 ZuzA+r++PmlcwrNTPQSX9zNXnOvcCby6EAqmBMf2wflRHgbSfM0V/tL119Xhs6v6ez7v
 gL2v7s290DIeMsbisda6u93PmWyXWa39Yg9mG0dwQzFYnaCIC8rA0sSpyX24dOd2vDvu
 5LBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=qUbEpdRlteNF9t/zkLoFalPqmUoMmG/wjzQPvDY2tIU=;
 b=sunSYVhg3mO/x90ASK5DqmrSigheKv4Ad/6VzphdfzkHFaEo5x0ZuYuHix0eyk5P5F
 cwAe3XnxAd9rMAWejG6Cc3kl5pehprstHWsmAqUKVowXbQzJXl04kSUvcDIqEMg4PzMT
 edkYzWVNQ3PkyG4+dikT8+YYopgQ9vDRSm7mRXE6qX2tnyNS8vMX/2Xmpau1ZfJUdDeN
 ZaC3dJeK/2cV/hR+ba48G6eFDlqoio7fQu2A+zODHS7fIBUAQCAu7MOxKntL0X8/PcnH
 A2uNkgJPmituOBDDFd5z0wy7kpWY7NpfZqDa+MBm0MV5SysFKDX5tvq2xgmAON/0X0lW
 T5Gg==
X-Gm-Message-State: ACrzQf3uo0GQiFkNLNkriHfYlXFTFDu4mfvY2SsfZbCQ6Cx5//XkYxWP
 J6KgszxdPxUypP4sXiHB2b0dFkozShWJOGM2+wI=
X-Google-Smtp-Source: AMsMyM5ggAbS6Hr6jcyxUdmDL6w7BbRsD7NIlHa8FKpKme07LNbivsRL9X4WPCeEQ6oBvoWMJNXDoE93uxCzopKH9L8=
X-Received: by 2002:a67:b80f:0:b0:398:9de6:2d6b with SMTP id
 i15-20020a67b80f000000b003989de62d6bmr1531131vsf.1.1663857772696; Thu, 22 Sep
 2022 07:42:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220922041756.1681845-1-floridsleeves@gmail.com>
 <a103064d-b213-5b8f-2a72-039236777c57@amd.com>
In-Reply-To: <a103064d-b213-5b8f-2a72-039236777c57@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 22 Sep 2022 10:42:40 -0400
Message-ID: <CADnq5_OZgEs3aFWPNi7HiH9owTm+8_LfhBqNEWC0qKP=_2FCpA@mail.gmail.com>
Subject: Re: [PATCH v2] drivers/amd/pm: check the return value of
 amdgpu_bo_kmap
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: jiapeng.chong@linux.alibaba.com, lijo.lazar@amd.com, guchun.chen@amd.com,
 airlied@linux.ie, dri-devel@lists.freedesktop.org, Xinhui.Pan@amd.com,
 amd-gfx@lists.freedesktop.org, Li Zhong <floridsleeves@gmail.com>,
 darren.powell@amd.com, alexander.deucher@amd.com, evan.quan@amd.com,
 mario.limonciello@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Thu, Sep 22, 2022 at 2:49 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 22.09.22 um 06:17 schrieb Li Zhong:
> > amdgpu_bo_kmap() returns error when fails to map buffer object. Add the
> > error check and propagate the error.
> >
> > Signed-off-by: Li Zhong <floridsleeves@gmail.com>
>
> We usually use "r" as return and error variables, but that's just a nit.
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> > ---
> >   drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c | 5 ++++-
> >   1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c b/drivers=
/gpu/drm/amd/pm/powerplay/amd_powerplay.c
> > index 1eb4e613b27a..ec055858eb95 100644
> > --- a/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
> > +++ b/drivers/gpu/drm/amd/pm/powerplay/amd_powerplay.c
> > @@ -1485,6 +1485,7 @@ static int pp_get_prv_buffer_details(void *handle=
, void **addr, size_t *size)
> >   {
> >       struct pp_hwmgr *hwmgr =3D handle;
> >       struct amdgpu_device *adev =3D hwmgr->adev;
> > +     int err;
> >
> >       if (!addr || !size)
> >               return -EINVAL;
> > @@ -1492,7 +1493,9 @@ static int pp_get_prv_buffer_details(void *handle=
, void **addr, size_t *size)
> >       *addr =3D NULL;
> >       *size =3D 0;
> >       if (adev->pm.smu_prv_buffer) {
> > -             amdgpu_bo_kmap(adev->pm.smu_prv_buffer, addr);
> > +             err =3D amdgpu_bo_kmap(adev->pm.smu_prv_buffer, addr);
> > +             if (err)
> > +                     return err;
> >               *size =3D adev->pm.smu_prv_buffer_size;
> >       }
> >
>
