Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA12FA80920
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 14:51:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3678110E22D;
	Tue,  8 Apr 2025 12:51:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="W+/RyYYl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72DB910E22D;
 Tue,  8 Apr 2025 12:51:21 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-3032a9c7cfeso1051414a91.1; 
 Tue, 08 Apr 2025 05:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744116681; x=1744721481; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jJefxB8FLGWpi/gmyGyC0hTJwrgS8z3n6ed8v3Y5FJ8=;
 b=W+/RyYYl4/wb1gpHzZ81zNmlaHwVXNCBggNuLdU5OyLxYXWyTDgCQeLigYzioOKEQ1
 asWxWkUAIwnbHXAonhOC3ArJT0Ls+rm9cZY4Ds3lBokgUTwrmA1PGXw6jxdTuZBem2fM
 GKY72SSUZPyaKOmvkwbIpKRsB9opD2o3wajaMDKo5JgyrSjVid0YH7+hb083jk9t+L+3
 HigTEZBfbeeStBfluRwOLJse59X7deVrMTGo4N7gNzGCY4R74UX9KSr4btllmsD5BX7j
 KzHdb4y6dExe09uXl+K1eiImihItPwa1lnGHOxbJzSorZ3ERy38rK/uUgNBaUNF7NNm4
 Puug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744116681; x=1744721481;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jJefxB8FLGWpi/gmyGyC0hTJwrgS8z3n6ed8v3Y5FJ8=;
 b=WbVLs6H6zacdnjfmot9Q9vTY/AGk5C6DlkY9LfJzIhN1FcYUB2xo9QFRf5Qz9BxFt8
 XjqzTMrgpcFjs2opXIJI1qOd4R7pWnfUwBvc/kAFcQ3ym8TIL5CHV1R0/Nx0zt0CPVuT
 jbZHNExjCDsjBw1ou3oygjelra/tOGvb4u88J3NwGEMuhGmj9XSwsGaxx1BMNYSMOdup
 YUOx8fpaUagqXs1zvnXWOHf6LPYEYA74zuNEc3OYkosZPXGjune2AJskvSpV8b6mGFkA
 D6nt9DdtmOIUlkosDy8sxJrssL2/ayhMpSVBXx59/+db0a3ijPwnZzzRmaVtuFMa5Ha1
 HXkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHNW5aRnCoP12mfNrvpaQs3GHPPVKAzMS4YIoTIcopW+Mg54VYX6hchzQjV8waJBynT1RHQEPT@lists.freedesktop.org,
 AJvYcCWh7zgt9QR1G0AOpb5sNYcRKsSS1O2vnmjUQxEdx3SJNqDMsYdqUWvkQtRU1AypwLmJGdMb7kBtYKle@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yywy39pTfEVuUdnZ6zyFFKx/81ut1zOfqZXtz4I3ypN/OeHnJKI
 FV129613Np6N2BCyOamOuoDbFL/axqdu/3mcAd3kwKp1ueHXWz0p2dsWiA+setywHbWUWeDPsOl
 fIpLj6/N6d28BIidvnT4gTWFp74k=
X-Gm-Gg: ASbGncstF9RwdekPZBZ1mJngyWgWHDAPvAhaHascQM+z34UnI5dcXlZHSbMbp1C2yJJ
 Ua5Ho/tp5Lg4pMSx6ildmv9bQvI0Mx5eCymhgIz6dLSjKNQp7KWX3VMJslDam5Mr8jRVRgZ4T1S
 p9s4hi42rhdHE9ptfbhLJfYhKtww==
X-Google-Smtp-Source: AGHT+IE3BGwIB7veoj6eje0Tze9/r/Sfa9ZWHYQiSGUExiNmqGzA6W8+JIfoimN+DZu/Gni15fMcKjpQ8CFj3IA9bI4=
X-Received: by 2002:a17:90b:3a88:b0:301:ba2b:3bc6 with SMTP id
 98e67ed59e1d1-306a496b929mr7897756a91.7.1744116681025; Tue, 08 Apr 2025
 05:51:21 -0700 (PDT)
MIME-Version: 1.0
References: <CADnq5_O+TMVD0B28Q6CgzhAi1aDR5ofjogE18HDXrJOJ1XwbDQ@mail.gmail.com>
 <20250408081638.5295-1-arefev@swemel.ru>
In-Reply-To: <20250408081638.5295-1-arefev@swemel.ru>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 8 Apr 2025 08:51:09 -0400
X-Gm-Features: ATxdqUGGeuAEy76obe-8bptynlXwPr_CzRnD4kBRgOpWKyyCycqmaT_JREsPGPI
Message-ID: <CADnq5_NHD9ULZ21tApHk=c2z+brnms9XotGUvpOri8G3Df594g@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/pm/smu11: Prevent division by zero
To: Denis Arefev <arefev@swemel.ru>
Cc: Jun.Ma2@amd.com, airlied@gmail.com, alexander.deucher@amd.com, 
 amd-gfx@lists.freedesktop.org, christian.koenig@amd.com, 
 dri-devel@lists.freedesktop.org, kenneth.feng@amd.com, kevinyang.wang@amd.com, 
 lijo.lazar@amd.com, linux-kernel@vger.kernel.org, 
 lvc-project@linuxtesting.org, mario.limonciello@amd.com, simona@ffwll.ch, 
 srinivasan.shanmugam@amd.com
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

Oh, sorry, I've picked it up now.  Thanks!

Alex

On Tue, Apr 8, 2025 at 4:16=E2=80=AFAM Denis Arefev <arefev@swemel.ru> wrot=
e:
>
> > ---
> >  drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c b/drivers/g=
pu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
> > index 189c6a32b6bd..54229b991858 100644
> > --- a/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
> > +++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/smu_v11_0.c
> > @@ -1200,7 +1200,7 @@ int smu_v11_0_set_fan_speed_rpm(struct smu_contex=
t *smu,
> >         uint32_t crystal_clock_freq =3D 2500;
> >         uint32_t tach_period;
> >
> > -       if (speed =3D=3D 0)
> > +       if (!speed || speed > UINT_MAX/8)
> >                 return -EINVAL;
> >         /*
> >          * To prevent from possible overheat, some ASICs may have requi=
rement
> > --
> > 2.43.0
> >
>
> Hi Alex.
>
> The patch 'drm/amd/pm/smu11: Prevent division by zero' was sent
> separately, not part of the patch series, maybe that's why it wasn't
> accepted. Should I resend it?
>
> Regards, Denis.
>
