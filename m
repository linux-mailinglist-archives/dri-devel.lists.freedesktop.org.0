Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE3B792C51
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 19:20:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDC6810E137;
	Tue,  5 Sep 2023 17:20:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2086110E128;
 Tue,  5 Sep 2023 17:20:35 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id
 5614622812f47-3a9f87adfe1so2166457b6e.1; 
 Tue, 05 Sep 2023 10:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693934434; x=1694539234; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=egYVobOFWuQdqjUEm4ZqKsY7Z50WC1t7+JHeJD3kmhA=;
 b=XTT8/4JgramINfh2CR53eQ+bjD9Pz5bhim+tODdqvv+CY7SpObxMSXzEgaZuQB3AS9
 DmQqosEIAImkirGJCOQEuCTZZyomcXg675hEbE957qVuLoF9zOokkpJkHg6JizKsmv+S
 khYiDRyCrtvWfSWBJmYZBxOoLeFy677YmVLqNVUmjXTXoJ0Uta//w8ZYPTvlHQ4Ww0JH
 u6taDzp4GgzfFXrlxLisvawKIlpG9JEnKntREznadzt+RJbJ5U/Nugfot+un17CTY2nR
 I3m4z3/gtrmHOlu2wKmPmu5NQeDkZF+YTI+ByDr/q/EbRkukV0mdkVG6y/xUzLjdp5j/
 uTjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693934434; x=1694539234;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=egYVobOFWuQdqjUEm4ZqKsY7Z50WC1t7+JHeJD3kmhA=;
 b=PR9TDh2oZ2Q9UyBxmnFS2yVuGUi5H6sTp30ek7a6opm4S9AJg51Y5RojxmAngzaIB4
 i3mxCcpCLTUHQkNJUcAZjB4Q6lvqkSN1MD269hgRblaPXZORUWEMSkgMP4NNk/rqGFMQ
 p3Cx+rq9l+pohwDu6dByT+P2LxujLx771wA3eNPQW1vm1lGJ/tv7aC8tKQTpVfE9xauN
 gvAykS8J5D31z47DH/x4Faokg9/eRMxTsXya8pHL9+pIAJR19frOHebC+/t2d8d2cmUH
 T9DEMC4t0K0NtsJB/RJIoTK5ye+uzdxmFzpzHYKCBDDp8xPwemCnyTiVhLDH+pqk8tUW
 6pYg==
X-Gm-Message-State: AOJu0YxdkElB5LuB9sbgpmM3aPSYPcdLMOflnYy0yjAn5bE4mobiuhsV
 wFSFISmQYWy3Hcg4saJJWSlU9XozFAMIuNbeYKk=
X-Google-Smtp-Source: AGHT+IH3pexwwwaLVpB98fPK/JpecnRxp70TiquGAO7pJC/SgsuI+6nqiWAxDzNgHEj6QTnxUCmibNW7V0by24Ms4z0=
X-Received: by 2002:a05:6808:1304:b0:3a7:65ae:9ccf with SMTP id
 y4-20020a056808130400b003a765ae9ccfmr17483691oiv.22.1693934434263; Tue, 05
 Sep 2023 10:20:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230901070240.31027-1-jiapeng.chong@linux.alibaba.com>
 <a975bbdb-8cd9-35b2-ce98-f711439db3a5@amd.com>
In-Reply-To: <a975bbdb-8cd9-35b2-ce98-f711439db3a5@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 5 Sep 2023 13:20:23 -0400
Message-ID: <CADnq5_O9zME2oxfSB1Gy6NMfOietEqN08Os36s6Vc2Kpdj0VQQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: clean up some inconsistent indenting
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Xinhui.Pan@amd.com,
 Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied and dropped the printk.

Alex

On Fri, Sep 1, 2023 at 3:40=E2=80=AFAM Christian K=C3=B6nig <christian.koen=
ig@amd.com> wrote:
>
> Am 01.09.23 um 09:02 schrieb Jiapeng Chong:
> > No functional modification involved.
> >
> > drivers/gpu/drm/amd/amdgpu/nbio_v7_11.c:34 nbio_v7_11_get_rev_id() warn=
: inconsistent indenting.
>
>
> We should probably not have a printk here in the first place.
>
> Christian.
>
> >
> > Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> > Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=3D6316
> > Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/nbio_v7_11.c | 5 ++---
> >   1 file changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/nbio_v7_11.c b/drivers/gpu/drm/=
amd/amdgpu/nbio_v7_11.c
> > index 7c08e5f95e97..76e21357dd4d 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/nbio_v7_11.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/nbio_v7_11.c
> > @@ -31,10 +31,9 @@
> >   static u32 nbio_v7_11_get_rev_id(struct amdgpu_device *adev)
> >   {
> >       u32 tmp;
> > -         printk("%s, getid\n",__func__);
> > -
> > -             tmp =3D RREG32_SOC15(NBIO, 0, regRCC_STRAP1_RCC_DEV0_EPF0=
_STRAP0);
> >
> > +     printk("%s, getid\n", __func__);
> > +     tmp =3D RREG32_SOC15(NBIO, 0, regRCC_STRAP1_RCC_DEV0_EPF0_STRAP0)=
;
> >       tmp &=3D RCC_STRAP0_RCC_DEV0_EPF0_STRAP0__STRAP_ATI_REV_ID_DEV0_F=
0_MASK;
> >       tmp >>=3D RCC_STRAP0_RCC_DEV0_EPF0_STRAP0__STRAP_ATI_REV_ID_DEV0_=
F0__SHIFT;
> >
>
