Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6951490D951
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2024 18:34:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3D6810E720;
	Tue, 18 Jun 2024 16:34:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NE6Yc4J5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D85E10E720;
 Tue, 18 Jun 2024 16:34:03 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id
 4fb4d7f45d1cf-57ccd1111aeso3719409a12.0; 
 Tue, 18 Jun 2024 09:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718728441; x=1719333241; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TpLrStmTGpoo6K4G77AeZx73ca3AbUqkqK/2aKkW3c4=;
 b=NE6Yc4J5+DtC70/24C7jAXZduM2Et8DPGdngr8Wj2vuqvk+v/+O3aRSlKy1mx1wNst
 qgwGvbwQYILIGv9ivjnhn4UGzSuvhDOyGdd02v2jBt7GCwahSJ+B/CT1AqHAathnzyRT
 13+cmRrWdNqHeNjxhIeSdgbXdVaRwhykEk7+Q+QT2sKQkDWQ97xJumwJV30VRQKT9BS6
 F4a9Pf7FRugI9cEnr2Zh9JMTX0Thd5guKyYQfPiIh+wAsCzLJr6mCyFN5bfxX32wCtcG
 QY+gPrLCupqZ41FVqQ3aV6CYPJzCChzklHZI6nqLXV9uWoowTk/fZzUiOY7v3vfJnnvx
 YBnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718728441; x=1719333241;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TpLrStmTGpoo6K4G77AeZx73ca3AbUqkqK/2aKkW3c4=;
 b=LOWDEpXdT3ySNeyHmtexV8rxYux/vT1LDtb1h+LX7AlwWf56sakaMd48qRjexMd4FP
 wnDKaSHjNrkJsU0khjJl/BPVedlZoMXEFYj0ZMyx7b29E9SR3Mpo2ZWOpVbcDNGrh7dN
 uYX42RK77w0rkK8csRD2yETCbPuTfHOBRmUYtDb5CC9FWUq5LIfGtJWqtvMS/QO0U92X
 /aZePaM42rHjJncZdCDp9o+fJYnoro9E0VmLxcBLqnlQlJDLBgAjYMejIsZtkx2bwRwh
 Pvkod6L2M+E6eZatdtldZXXtEfr3wQkosF/eQ4y/KZv17S6V5gDF21cUKGrXK7WcE/eH
 bXig==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXKbAmrK2jvoklcL0xhRvwDQ2sHMyjPnYbLm+dsy2+iosaI4FT/Sh4TlH3UWoYsGFrbzSG6DZP5y1lFAGoJZQEuDIzJNNfZJnU1wrln7eT
X-Gm-Message-State: AOJu0YwY9R8n5b1/+7uTqNIj3ujbwH9k8FrlmV9XTDcc+vMhJur9Jyd0
 UmRtGqF3NCo7rxbgiPJ3rQCVsq9F6OqWShZBOa3/ST27MV/o5ndAQK79Vgv76TcIARrqJTOTRvR
 jucmMqQ9RqPcfp+HweTa9FkiIgXA=
X-Google-Smtp-Source: AGHT+IEshCt8XHunjxXajUUYc8cEJkBcPVr+pyxgi7wON07IhIVY9iZh4sfGDDKi0k0CzdMNcVHTnLUtpJ21Rwioa18=
X-Received: by 2002:a50:930e:0:b0:57a:858d:20ca with SMTP id
 4fb4d7f45d1cf-57d07eabfc1mr9899a12.28.1718728441008; Tue, 18 Jun 2024
 09:34:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240617225127.23476-1-robdclark@gmail.com>
 <20240617225127.23476-5-robdclark@gmail.com>
 <wnnjjljjyl5s3fkwiapux3f76243ngp2ppk2cm7kkhdp5dc4sz@v4wypnga3izv>
In-Reply-To: <wnnjjljjyl5s3fkwiapux3f76243ngp2ppk2cm7kkhdp5dc4sz@v4wypnga3izv>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 18 Jun 2024 09:33:48 -0700
Message-ID: <CAF6AEGvjeGxP+A2umyQHo49G1rAdZkY0bHuemvFP4jgNkspu3Q@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] drm/msm/adreno: Move hwcg table into a6xx specific
 info
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 open list <linux-kernel@vger.kernel.org>
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

On Tue, Jun 18, 2024 at 1:30=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Mon, Jun 17, 2024 at 03:51:14PM GMT, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Introduce a6xx_info where we can stash gen specific stuff without
> > polluting the toplevel adreno_info struct.
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 65 +++++++++++++++++------
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     |  6 +--
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  9 ++++
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  6 ++-
> >  4 files changed, 67 insertions(+), 19 deletions(-)
> >
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
>
> > @@ -98,7 +100,9 @@ struct adreno_info {
> >       struct msm_gpu *(*init)(struct drm_device *dev);
> >       const char *zapfw;
> >       u32 inactive_period;
> > -     const struct adreno_reglist *hwcg;
> > +     union {
> > +             const struct a6xx_info *a6xx;
> > +     };
> >       u64 address_space_size;
> >       /**
> >        * @speedbins: Optional table of fuse to speedbin mappings
>
> My preference would be towards wrapping the adreno_gpu, but that would
> require more significant rework of the driver. Let's see if we can get
> to that later.
>

yeah, it was going to be more re-work, and I'm neck deep in
gpuvm/vm_bind.. I just wanted to land this since it is a pita (and
error prone) to rebase as more gpu's get added ;-)

It isn't entirely unlike how we handle gpu gen specific options in
mesa, where we have a somewhat bigger set of options, so I wouldn't
say that this approach was worse than extending adreno_info.. just
different..

BR,
-R
