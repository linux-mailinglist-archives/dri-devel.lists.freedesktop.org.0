Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFB8B702F52
	for <lists+dri-devel@lfdr.de>; Mon, 15 May 2023 16:12:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75A9210E062;
	Mon, 15 May 2023 14:11:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19A2710E062;
 Mon, 15 May 2023 14:11:51 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-1929818d7faso72026350fac.0; 
 Mon, 15 May 2023 07:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684159910; x=1686751910;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p6klH7lGRee9p3zL+y3yYDz1Mo74eQ/ZGlGDY1d4SJ8=;
 b=sCHYWoEl/r7hKZSDGDmLfCPpPd7E47QEYW3x8MbOxPeCRhv1CV+HlAaIrfm1LcFcLH
 XEbFz9jw+weu9mFwgrF+7KTA2I4/fV7DYR1jKTSmDCBtwZWWhvAHBwMlVqLNtkiEAffk
 jepHKnu4dhzHZOORfj5zJV/j3IA72JK6Jpwozinq7FL4e0q5Hn3KSeOcBNIoheUf41VD
 M7DJDEcSdn/2wS2Dab0jeAE3qPrZj75rtBob/Ck3LJEd0O3nxnoWvfclX1rCrapByNYw
 pohWHW4WLREO3T/Wn1gGrkoAuDeQw7j33xikmKUewSXLJYM0HVJXo6ZscgG4/OtP5VQB
 wTeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684159910; x=1686751910;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p6klH7lGRee9p3zL+y3yYDz1Mo74eQ/ZGlGDY1d4SJ8=;
 b=UJ99YDTaq1s0jj/Z7VqRB50o7HdGL8DXBJIGAm5nvXHTatV8+wNnxTsvPgsUPQbeJZ
 efXzhhZiuvbKJ/wYjAs+AdWiz4o5DhpX6LExvVrIMx0DmAMvEEkG33JyKzzmsWAXUvdq
 hQBM9LViCdFQEDnnT6jXF+ZmmNwk1dOqJ0unvsvDHWVQsDs4lWY4s5G0g8zXkZYJf0A/
 +8WFBBj1QeqqOG1R/o2nDRrpXT1tUdJ5qG6TVHiGnKkW7ixKwsCQ6HaukFUF70b0HvAY
 H4LtlcF/jbieR9KfZzoAocAKGuW3ObMyxDuj/grAHrJCXlCR42grbthdvB8BV5F/MAW+
 gBlQ==
X-Gm-Message-State: AC+VfDzlWDnlNEGncZxiW6k1jVbl56RgnCFnzkFS9PyVbwvAcldEleen
 qKcffTf6SMwWqNaB1RzxkSFvuYvVzJAXATH0+vM=
X-Google-Smtp-Source: ACHHUZ6hswmGitPnovNcuyXvStM5qdj58yGJkZIf508UaOF0AdET+AUn58DT7NbbSC+sp4hSvEY04p3ZxsueM7TOyMg=
X-Received: by 2002:a05:6870:e6d5:b0:18e:3e05:51e6 with SMTP id
 s21-20020a056870e6d500b0018e3e0551e6mr17667911oak.24.1684159910535; Mon, 15
 May 2023 07:11:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230515013428.38798-1-suhui@nfschina.com>
 <ebe9d98c-148d-4694-8f97-96bacd0b9f7d@kili.mountain>
In-Reply-To: <ebe9d98c-148d-4694-8f97-96bacd0b9f7d@kili.mountain>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 15 May 2023 10:11:39 -0400
Message-ID: <CADnq5_Nei-XHsD8DQkpUGZwZAik5X-S1R3znOJGD1X2jAxD6_g@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: remove unnecessary (void*) conversions
To: Dan Carpenter <dan.carpenter@linaro.org>
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
Cc: Su Hui <suhui@nfschina.com>, Xinhui.Pan@amd.com,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 15, 2023 at 3:17=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> On Mon, May 15, 2023 at 09:34:28AM +0800, Su Hui wrote:
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/=
drm/amd/amdgpu/amdgpu_debugfs.c
> > index f60753f97ac5..c837e0bf2cfc 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
> > @@ -1470,7 +1470,7 @@ int amdgpu_debugfs_regs_init(struct amdgpu_device=
 *adev)
> >
> >  static int amdgpu_debugfs_test_ib_show(struct seq_file *m, void *unuse=
d)
> >  {
> > -     struct amdgpu_device *adev =3D (struct amdgpu_device *)m->private=
;
> > +     struct amdgpu_device *adev =3D m->private;
> >       struct drm_device *dev =3D adev_to_drm(adev);
> >       int r =3D 0, i;
> >
>
> This declaration block was originally written in reverse Christmas tree
> order:
>
>         long long long variable name;
>         medium length name;
>         short name;
>
> So you probably want to change the order now that the lengths have
> changed.  Same in the other places as well.

I don't think it's possible due to the variable dependencies unless
you separate the declarations and assignments which doesn't seem like
a net win to me.

Alex

>
> regards,
> dan carpenter
>
