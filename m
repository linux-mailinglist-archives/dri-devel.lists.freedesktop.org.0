Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC8D999D32
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 08:54:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F14D910E2D9;
	Fri, 11 Oct 2024 06:54:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="b/YVyCFX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A8D410EA45
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 06:54:01 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-e2923d5b87aso170423276.3
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 23:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728629640; x=1729234440; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=17oCjGzef/2UE8bCOde+fsQlgIs92oMXKbycZ1wrAZI=;
 b=b/YVyCFXLKJrGS9u0GJQjHKn1a9ST/V2vtdrGQ5YZ6/HzjuDloCnFzDUMkvHP/EIIn
 RIB5U5Ncb41NXnfHINB/BALUniukQgkNsQnPFSeW2QLLURfObjg2ywu1gCdAFHAhMAje
 cgFYLaN/p2/7Dfn87Li5OF2F1/qbR8b98aPPW9CfgFuzDaym/lTsqdb/qWciAkkOXfiX
 p02McF1H7SvwxbvcS+4vXbmOitP+wvvBwP3rkjCI6WfUyz6En7x2OvqQ9IWrzID3xGQn
 X+wiBpo1n6XBxYndNlUmMm9vhWQtWBdQYE/EK7XBkzjKO77COB6C1GC2Szt2qVWXxxTe
 x6dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728629640; x=1729234440;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=17oCjGzef/2UE8bCOde+fsQlgIs92oMXKbycZ1wrAZI=;
 b=dOnH280ikf7pG46mBFNgxriAsNFKDnOuWByRv/We48vfMOmH5MB0aIYbqR6IQxr/pe
 JSGtcrGQWV9jUOYhwhojZFzYY2ixcFWn5oFa2jlwCBVfKwnxchxaXTvoCB1sr5yqBJZH
 jw7fKI3ZSup9Mutj8dsdq6XqJAdeAth5SSTsxVJFDtaVg92CBBu8Du+gNhaDdoZFsJoQ
 pcciI8V28DTBGtayJDbc4bH4bBCuH3hzfjDU1aI/Z7D0Ww3egELXmIlHBXXgW+l+p+Fz
 fEYJkq8cejZM8gp/fnIGyZCmnjuNTeHmqXiE5eDpb3slLdEjfLNFaO4UPWPLaAXSsSG3
 azEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXjjjkHbgP8ABpsL+NCvTINMfPSozlrChcFfFAmtQu4AeW0jqf+65Lq/GGMUx0CW/03lVFRxB90I8Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw68Y41LBFoJCwRX9we6gJrzDbTCAzvJD1inCgydpsT6IfVKTjL
 AoCOFrHBQ4K9FuQyDug0zWtuIddGoC/YKUaqfPkuMEK4PnmMog5yRohaubnIFWEbY9DV8V/zHhv
 tqhMU0ZrBYh9k+oUIgIZSod4/WF7UHIUB9xmNeQ==
X-Google-Smtp-Source: AGHT+IEcKrVhYkTlegrRYlks5vwNXkS8Zs44m1DY8Xw3QedwmulZZ7MGGC1XpVbTOaR1CUfuKx1qdvJf7YjcaChKFkY=
X-Received: by 2002:a05:6902:e06:b0:e28:e5e8:5e3d with SMTP id
 3f1490d57ef6-e2918e5e2dcmr1023240276.0.1728629640142; Thu, 10 Oct 2024
 23:54:00 -0700 (PDT)
MIME-Version: 1.0
References: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
 <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-11-76d4f5d413bf@linaro.org>
 <olzxobeurhyi76tdn7mq3wegxth4c7a2ys7dikajkx4d5y5z7i@3vkyjy3hg57s>
In-Reply-To: <olzxobeurhyi76tdn7mq3wegxth4c7a2ys7dikajkx4d5y5z7i@3vkyjy3hg57s>
From: Jun Nie <jun.nie@linaro.org>
Date: Fri, 11 Oct 2024 14:53:49 +0800
Message-ID: <CABymUCO0u8hOLtie7typUQ3XV4AAds3RhT_hF23WB5Ruiz9AnQ@mail.gmail.com>
Subject: Re: [PATCH v2 11/14] drm/msm/dpu: Share SSPP info for multi-rect case
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B410=E6=
=9C=8810=E6=97=A5=E5=91=A8=E5=9B=9B 21:21=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, Oct 09, 2024 at 04:50:24PM GMT, Jun Nie wrote:
> > Share SSPP info for multi-rect case if virtual plane is not enabled.
> > Otherwise, the 2nd half of DMA content is not displayed due to sspp
> > pointer of r_pipe is null.
>
> Fixes?

Yeah. It is to fix bug in non virtual plane mode. Do you suggest to split
to another patch set?
>
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/dr=
m/msm/disp/dpu1/dpu_plane.c
> > index 904ebec1c8a18..898fc2937954e 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > @@ -1042,6 +1042,11 @@ static int dpu_plane_atomic_check(struct drm_pla=
ne *plane,
> >               pipe->multirect_index =3D DPU_SSPP_RECT_0;
> >               pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_PARALLEL;
> >
> > +             /*
> > +              * Signifies that r_pipe is to be used if the width of th=
e 2nd
> > +              * pipe is not 0. This does not apply to virtual plane ca=
se.
> > +              */
> > +             r_pipe->sspp =3D pipe->sspp;
> >               r_pipe->multirect_index =3D DPU_SSPP_RECT_1;
> >               r_pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_PARALLEL;
> >       }
> >
> > --
> > 2.34.1
> >
>
> --
> With best wishes
> Dmitry
