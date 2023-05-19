Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFE82709E67
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 19:41:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DBA310E087;
	Fri, 19 May 2023 17:41:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE31610E087;
 Fri, 19 May 2023 17:41:13 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id
 5614622812f47-39431e2b2cdso2586270b6e.3; 
 Fri, 19 May 2023 10:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684518073; x=1687110073;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zyC8PnfI9XbbL3zj+lnVWVG5hpCaOmXN3AIjDOl28/4=;
 b=obalH9qRMLvilwY6q3sKWeoK0cZLDmYuPqooShs6Bo6GWuY3cw5Ax/+UWHRhtKsWGF
 1+mJasCGgAtSAUtluHAkY7EOcCoAVqFaImwZdd5zsLdz1Vyf9hu4a/tYqcrHk02E0t3k
 dZCxxsydPp2En9kEb3YxoRJ4qQFNH4yE+QYa2KxdlmUqydsdqkfZhIYK0ewUrc1EU3sG
 q/igIXxQTuvsTVn9eJRk8c0Cjs29WvGzWMrspABgVLhnkA5j9KERZt+Svi3YvIfAkhzR
 d7dtMNl1PJTouGcOI8F1Hemn0wMhZWauSv/Q3hgUltfbIbxnP0ajsV7Ri+pGOaLCBHVB
 d57A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684518073; x=1687110073;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zyC8PnfI9XbbL3zj+lnVWVG5hpCaOmXN3AIjDOl28/4=;
 b=FlH3ckoLGqC0w15S92JzRJiTLFMcQzlo8LCMwUhyUtSq5AeXGJ3bRv7jFks28TJ7ZA
 yQwF36Rsh6dbDCcrtmfcJhCBje1Nj5I6ABsG8Ei3Ja2m0ogX5ovb8QvAYVJKvPP3C0mt
 fE2uVd7HDkrTOpzICyuFtP+TSA1mYhnGuN9+j0TaCBqFHXxYqDn66M7rQB5vdelTdSoq
 /yjMbyOYss5yO25Jj79s3XbaVQFqrbNZW6/QsxZblikcwwy9z9d5YQrS1gURSucC9Hjo
 bwDL3vliyFgk23OUH5oZXs+UDrLoVKocwCAN5qRE8AqN0sgpfJtnOnaLdJLutjQZ+fNy
 YYSQ==
X-Gm-Message-State: AC+VfDwM219bIAzZz2GhPiUdSSiBhGEmb46qD0t/QGNKNMqMXLIokTsj
 EPUUYsfkK7ROCsK26bkoq7fyYgcTbT/EXbqW97o=
X-Google-Smtp-Source: ACHHUZ4UrVLa0agrHncr8UIMxx3FQcGtiLA3QhZsr8KzI+qP/P4/TkwFJt/+/sZZthwoJmnOS95iwVJZitvckESHRbc=
X-Received: by 2002:a05:6808:8dc:b0:38e:c2a4:3530 with SMTP id
 k28-20020a05680808dc00b0038ec2a43530mr1408267oij.9.1684518072697; Fri, 19 May
 2023 10:41:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230411224308.440550-1-marijn.suijten@somainline.org>
 <e6407312-c2fb-e77e-0c9e-abc2a014464a@linaro.org>
In-Reply-To: <e6407312-c2fb-e77e-0c9e-abc2a014464a@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 19 May 2023 10:41:01 -0700
Message-ID: <CAF6AEGsPOb-EzBjRTZC1ik5QB65E4yVhfFei05uS1+CVAJ4weg@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Add Marijn Suijten as drm/msm reviewer
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, phone-devel@vger.kernel.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 11, 2023 at 3:46=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 12/04/2023 01:43, Marijn Suijten wrote:
> > As I get more and more active in the drm/msm space, yet sometimes miss
> > out on patches (where I was involved in previous discussions), add
> > myself as reviewer to make this involvement clear.
> >
> > Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> > ---
> >
> > Note that this is only a slight commitment from my part to look at
> > patches arriving in this area, most notably on the DPU1 driver and only
> > if day-to-day workload allows for it.
>
> I think Marijn does a good job of reviewing incoming patches in the
> mentioned area.
>
> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Acked-by: Rob Clark <robdclark@gmail.com>

>
> >
> >   MAINTAINERS | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 04d7c816d46a..fd1b717c57d8 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -6536,6 +6536,7 @@ M:      Rob Clark <robdclark@gmail.com>
> >   M:  Abhinav Kumar <quic_abhinavk@quicinc.com>
> >   M:  Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >   R:  Sean Paul <sean@poorly.run>
> > +R:   Marijn Suijten <marijn.suijten@somainline.org>
> >   L:  linux-arm-msm@vger.kernel.org
> >   L:  dri-devel@lists.freedesktop.org
> >   L:  freedreno@lists.freedesktop.org
>
> --
> With best wishes
> Dmitry
>
