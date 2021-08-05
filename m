Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B783E0D4F
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 06:33:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 939B589E01;
	Thu,  5 Aug 2021 04:33:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [IPv6:2607:f8b0:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3C8B89E01;
 Thu,  5 Aug 2021 04:32:59 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 o2-20020a9d22020000b0290462f0ab0800so3887995ota.11; 
 Wed, 04 Aug 2021 21:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WPmSYKxM3hDxf4j2HGMY4KEBqM5rWpME+JCZGt0gVjw=;
 b=d6lgTlgZ4XtRuTrGFwjnfu6FMANDeGYNkF3HVRgAEz3zNJWeXPay2/77o5xUFwchyy
 fZ+RxFE6PKyFPBCA/PrBqv7fb7Ru/8F66ANYljfjpCZek/EgK9BnwwHV0KtaiOXGOBHC
 awwvqO+5eU4YhGFJjXO4OaZpU6kBceP9x20lc/jksWMCQHnZ8orlDNKyp4wj86imwnCD
 6YKPbF79Crl7D4d2jD8s0rV9wTcK0I3OjHVcLIxaFULDXF9ynJoOKulQ9ZfLCD/pGLv1
 zFEDI6x2G+joB+ZOQckwYoiMZ1LQcX9rian6mNKcuPDevnN7/eoOCrSnqHj1w21TH/v7
 BVog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WPmSYKxM3hDxf4j2HGMY4KEBqM5rWpME+JCZGt0gVjw=;
 b=lQQzjMORBMHxMXBSrntUCAwQriRgvp7Hu/isFVAZQ9Bkdd05TjidmpThzXqh61cAKZ
 Z2FR9OyflO/aQTOTtXod4a7Zg6huUbO6TVfd7DsDWmh3uYg73sEAGobd7ssKvyE3uNZf
 luSgL4I/wUWJDU6aEosY+pAqlbzDGaP0mp68om+ZxTHQTnnH0gFp9ekCTfmcjqidrZVK
 1lBqi0qAlvFfoSZlqTux7F3CsTOn3jd7Lw7m9rK4MvOMg11Owqbj9DyKiPBr+UIaXldl
 CHx0hW/EqFUW8xiadI8DSUcQuffkZPvLepNeXWIf5BDXoPlTPvDVP2eR4clg4ouTuFXY
 X5Rw==
X-Gm-Message-State: AOAM532j8qeZSzxHGTeDS7/eIwvm2QDasO6QAQROrU3JLfd+Hgv8pPct
 97lmRemSdeqvrTTICAS6iYclToc91Zi1HhlacH0=
X-Google-Smtp-Source: ABdhPJxVoTU6a30brhTf1IeElqkRglO5k+x+tHkN0DLsz3Nd4Duri9Cmng8GzMH9mtkqISPNR9a5gCNiMTCPSizufzw=
X-Received: by 2002:a9d:70c3:: with SMTP id w3mr2216613otj.311.1628137979011; 
 Wed, 04 Aug 2021 21:32:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210804015132.29617-1-islituo@gmail.com>
 <f515880f-17f8-66b3-20d9-c1a46a252463@amd.com>
In-Reply-To: <f515880f-17f8-66b3-20d9-c1a46a252463@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 5 Aug 2021 00:32:47 -0400
Message-ID: <CADnq5_MSp=PAqbaTrS771ssKJzVpT2LyDTjZCSx2hh-DFo3MXg@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: drop redundant null-pointer checks in
 amdgpu_ttm_tt_populate() and amdgpu_ttm_tt_unpopulate()
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Tuo Li <islituo@gmail.com>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, 
 xinhui pan <Xinhui.Pan@amd.com>, Dave Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Dave Airlie <airlied@redhat.com>, 
 "Kuehling, Felix" <Felix.Kuehling@amd.com>, Oak Zeng <Oak.Zeng@amd.com>, 
 Nirmoy Das <nirmoy.das@amd.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
 "Yang, Philip" <Philip.Yang@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, 
 linux-media <linux-media@vger.kernel.org>, 
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Jia-Ju Bai <baijiaju1990@gmail.com>, TOTE Robot <oslab@tsinghua.edu.cn>
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

Applied.  Thanks!

Alex

On Wed, Aug 4, 2021 at 2:49 AM Christian K=C3=B6nig <christian.koenig@amd.c=
om> wrote:
>
> Am 04.08.21 um 03:51 schrieb Tuo Li:
> > The varialbe gtt in the function amdgpu_ttm_tt_populate() and
> > amdgpu_ttm_tt_unpopulate() is guaranteed to be not NULL in the context.
> > Thus the null-pointer checks are redundant and can be dropped.
> >
> > Reported-by: TOTE Robot <oslab@tsinghua.edu.cn>
> > Signed-off-by: Tuo Li <islituo@gmail.com>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/=
amd/amdgpu/amdgpu_ttm.c
> > index 3a55f08e00e1..719539bd6c44 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> > @@ -1121,7 +1121,7 @@ static int amdgpu_ttm_tt_populate(struct ttm_devi=
ce *bdev,
> >       struct amdgpu_ttm_tt *gtt =3D (void *)ttm;
> >
> >       /* user pages are bound by amdgpu_ttm_tt_pin_userptr() */
> > -     if (gtt && gtt->userptr) {
> > +     if (gtt->userptr) {
> >               ttm->sg =3D kzalloc(sizeof(struct sg_table), GFP_KERNEL);
> >               if (!ttm->sg)
> >                       return -ENOMEM;
> > @@ -1146,7 +1146,7 @@ static void amdgpu_ttm_tt_unpopulate(struct ttm_d=
evice *bdev,
> >       struct amdgpu_ttm_tt *gtt =3D (void *)ttm;
> >       struct amdgpu_device *adev;
> >
> > -     if (gtt && gtt->userptr) {
> > +     if (gtt->userptr) {
> >               amdgpu_ttm_tt_set_user_pages(ttm, NULL);
> >               kfree(ttm->sg);
> >               ttm->sg =3D NULL;
>
