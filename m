Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F197E5E1D
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 20:04:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3569510E81F;
	Wed,  8 Nov 2023 19:04:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56E5B10E821;
 Wed,  8 Nov 2023 19:04:15 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-1f00b95dc43so4272941fac.3; 
 Wed, 08 Nov 2023 11:04:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699470254; x=1700075054; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PIAfp4n5FTAxG5B/n8MBsaBM3cT8s3lVCrtfOSkbjqw=;
 b=njmhSleLqVaHJsWSvHkxzjrctoMFRNjNqrwEM/QFEUl9D1Mqn0fEcdvfIxJK3rO6fj
 sNywdhRlvtYu/sxGFoWCKjSK44wBcDDGo76aXOQvgM663K5y1VGesrlmRMI42ba2wlgJ
 9EKi9ulYeyKst0l6HrFmtyZRbUWoC/FSmDjPni/T+0TMme2Vy9ueqAZM9jx95HUjWg7y
 bMpKdoV5FannPwYP2JtQK6CuO/FI1d+5ztXS4QfnTf5m6TVPo0irdPI6ogIy7Yk/OKBu
 w6Ar7kh52UPsFrSBIOhqV9ECpdPOGw5ouzbuGc+qB4CkgkyzSy3BofaXJNu6zGjQHys6
 RlCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699470254; x=1700075054;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PIAfp4n5FTAxG5B/n8MBsaBM3cT8s3lVCrtfOSkbjqw=;
 b=As10YWQ6THfJVMZkM86SFGRRSU9yLLvhV7kzbRhLGegBSC7kdq48LVFJ8kUrjpB/X7
 1uZ1TCwPgePrMrDP+fdBnrBvAIingVsxcI8sQjVqV0F1A3cr9X9kxPtHoxLeo+erQdxp
 nnDlYOFBOqaSPLIZ2s6r7CZ4aekF8Q9eRX/EDSdZfVBFD7oRrs13J6xSH/komLniTmrX
 qdVJ9IXmiyubsZ3y6FxJBHg3xf0/iC0qYY2dxarDjHMgZom+yF8BRqpqvUOICaOd4+rf
 TBu4LTGdhvcOS8VtyrTzp+TFAvuZqxuhygTv5MzrRjwekHiP6wdBASXHmYjWm2IfgekI
 gKMg==
X-Gm-Message-State: AOJu0YyxmswNV2TRm3cWsnsW+mgxulh8UxC0kSTewAQcwKRJ1mygTl3U
 cT4qRMoeeZfuclkSmBkZ2y12V/Qu9mE+mElvw0hSzNpt
X-Google-Smtp-Source: AGHT+IFMQHWb9vtoHBrkxGDELJboskZE0aJf095yx+v+npphVWFwsJlmyOfvUZWdSPLGSEwyBKaIWu1ACGNqXJ8U2Oo=
X-Received: by 2002:a05:6870:9551:b0:1ea:7bd1:c495 with SMTP id
 v17-20020a056870955100b001ea7bd1c495mr2449172oal.27.1699470254574; Wed, 08
 Nov 2023 11:04:14 -0800 (PST)
MIME-Version: 1.0
References: <20231107162830.36856-1-hunter.chasens18@ncf.edu>
 <2853fe7e-7d39-9b32-87b2-93845f16ae51@amd.com>
In-Reply-To: <2853fe7e-7d39-9b32-87b2-93845f16ae51@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 8 Nov 2023 14:04:03 -0500
Message-ID: <CADnq5_O4AXB_x8uv1bx0XZHt+mqxtKdaH0XAFFouuJ0X_QCNhA@mail.gmail.com>
Subject: Re: [PATCH v3] drm: amd: Resolve Sphinx unexpected indentation warning
To: "Lazar, Lijo" <lijo.lazar@amd.com>
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
Cc: linux-doc@vger.kernel.org, Xinhui.Pan@amd.com, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Hunter Chasens <hunter.chasens18@ncf.edu>, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Tue, Nov 7, 2023 at 11:17=E2=80=AFPM Lazar, Lijo <lijo.lazar@amd.com> wr=
ote:
>
>
>
> On 11/7/2023 9:58 PM, Hunter Chasens wrote:
> > Resolves Sphinx unexpected indentation warning when compiling
> > documentation (e.g. `make htmldocs`). Replaces tabs with spaces and add=
s
> > a literal block to keep vertical formatting of the
> > example power state list.
> >
> > Signed-off-by: Hunter Chasens <hunter.chasens18@ncf.edu>
>
> Reviewed-by: Lijo Lazar <lijo.lazar@amd.com>
>
> Thanks,
> Lijo
>
> > ---
> >   drivers/gpu/drm/amd/pm/amdgpu_pm.c | 13 +++++++------
> >   1 file changed, 7 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/p=
m/amdgpu_pm.c
> > index 517b9fb4624c..576202bf64f3 100644
> > --- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> > +++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
> > @@ -989,12 +989,13 @@ static ssize_t amdgpu_get_pp_features(struct devi=
ce *dev,
> >    * Reading back the files will show you the available power levels wi=
thin
> >    * the power state and the clock information for those levels. If dee=
p sleep is
> >    * applied to a clock, the level will be denoted by a special level '=
S:'
> > - * E.g.,
> > - *   S: 19Mhz *
> > - *   0: 615Mhz
> > - *   1: 800Mhz
> > - *   2: 888Mhz
> > - *   3: 1000Mhz
> > + * E.g., ::
> > + *
> > + *  S: 19Mhz *
> > + *  0: 615Mhz
> > + *  1: 800Mhz
> > + *  2: 888Mhz
> > + *  3: 1000Mhz
> >    *
> >    *
> >    * To manually adjust these states, first select manual using
