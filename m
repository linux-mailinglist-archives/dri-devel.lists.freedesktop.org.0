Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D64B07794D1
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 18:38:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 478AD10E6C3;
	Fri, 11 Aug 2023 16:37:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AC4B10E6C3;
 Fri, 11 Aug 2023 16:37:57 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-523ba00a581so1946676a12.2; 
 Fri, 11 Aug 2023 09:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691771876; x=1692376676;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VT/SmJhISmZKZXN9VK1TnacIwXyQQJWpUU7uVo+Tn1Y=;
 b=V4G6qJfzXhgLZduK+jHGALXK+pNctrhszcOTkE65wM8+Ux7NuscXIiaTud4WkNTNOa
 TSWsmBFf8A8FWWFHA05pGLL9eB1nCJcjoGlUf+cK76vCXRTPBfFBmlJDPmoJcg+kH2go
 7wpQTMWRxwqux2HgussrxC6lbsWLhTcRzChznxXXsFpc6UQfCL/70yVBijDOpnbj4hXX
 3vqtnePoYbyYGCDOqN7u7YoRUM+ksxaJgCs2R2JeXEg/2ZhS1XEK7asq40PuU/GEg3ai
 9UyxbRgKXNjpDCCDrcSjdlvYZMJD5Kh99Aj70i3IyAqtUL+EI4f1gTV8tbKdIgRwWNm9
 mdBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691771876; x=1692376676;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VT/SmJhISmZKZXN9VK1TnacIwXyQQJWpUU7uVo+Tn1Y=;
 b=l9PEkxgupBH32P94/uSPq+qSWODusC2x1rhRAcjYSxretlNzMIE2wURJtqXIuxQgpF
 kEHFGBscA9pY0b8CPxgvSLwB4MsXLKH61X0LTBilT4cgCAcEgSz/wCc1F7uGaFh2HMff
 if6Rw46nXFnKIePftePqnSLkV9PMLbIeg4Syq1rZhR2i8iqZrua9ylLMWlYS5LCM4IhG
 nvkG7ZKb1Rp9WtskXkSy2PZ6oXugItv1nkhY0dktrAQQ09RCv0EXZ0OF6CcFPh+nJiHc
 a6YPIwQzCs64Dd0G9x2CIf7lQeAd/UwHu/YcZd8IjzVJcIq5AkpsQUufHFPyX0QhlkUb
 uzpQ==
X-Gm-Message-State: AOJu0YwvSib7oUaa9VAMvWVcHtIJYsfjedSI2NCzqlsYRJMUBnPzm3BD
 hj+oUnPf8VkG9pZV3825ltnGVM5m2DPdHadmRMKRVXAz
X-Google-Smtp-Source: AGHT+IH6+8ONwhE6CktCQhdjK3oK4cF89EDdZADFIS/Q6JElEuvXjVagjwV/Ofm16PJVLXwTcOmzrbpQohWQNuLXMKw=
X-Received: by 2002:a05:6402:799:b0:51d:95f2:ee76 with SMTP id
 d25-20020a056402079900b0051d95f2ee76mr1958836edy.27.1691771875598; Fri, 11
 Aug 2023 09:37:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230811160505.174574-1-robdclark@gmail.com>
 <CAF6AEGtNgCxsOLyF31=WCdag4Gb7+2FvFEvOWDcqd_TxiTeE3w@mail.gmail.com>
 <d400c787-3c81-4e37-b541-371d6096cf7e@linaro.org>
 <CAF6AEGuHKuW_LGYfC640fBHsf3xzxSiyqL0YVpb5HqE=HSiL4w@mail.gmail.com>
 <39ffcd61-eb56-41c5-ac43-9ace2595c11b@linaro.org>
In-Reply-To: <39ffcd61-eb56-41c5-ac43-9ace2595c11b@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 11 Aug 2023 09:37:43 -0700
Message-ID: <CAF6AEGu+NJ-7zte3Cnfr9SG_EcED0oZQag34exi4W-_u80zzGg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a690: Switch to a660_gmu.bin
To: Konrad Dybcio <konrad.dybcio@linaro.org>
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 11, 2023 at 9:31=E2=80=AFAM Konrad Dybcio <konrad.dybcio@linaro=
.org> wrote:
>
> On 11.08.2023 18:21, Rob Clark wrote:
> > On Fri, Aug 11, 2023 at 9:11=E2=80=AFAM Konrad Dybcio <konrad.dybcio@li=
naro.org> wrote:
> >>
> >> On 11.08.2023 18:09, Rob Clark wrote:
> >>> On Fri, Aug 11, 2023 at 9:05=E2=80=AFAM Rob Clark <robdclark@gmail.co=
m> wrote:
> >>>>
> >>>> From: Rob Clark <robdclark@chromium.org>
> >>>>
> >>>> There isn't actually a a690_gmu.bin.  But it appears that the normal
> >>>> a660_gmu.bin works fine.  Normally all the devices within a sub-
> >>>> generation (or "family") will use the same fw, and a690 is in the a6=
60
> >>>> family.
> >>>>
> >>>
> >>> possibly this could be considered as:
> >>>
> >>> Fixes: 5e7665b5e484 ("drm/msm/adreno: Add Adreno A690 support")
> >> For a lack of a better response, "meh"
> >
> > It would help route the change back to 6.4.y so we can stop explaining
> > to folks that they should create a symlink ;-)
> Ok fair!
>
> >
> >> Other than that:
> >>
> >> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> >>
> >> Perhaps we could take this further and do something like
> >>
> >> if (failed to load gmu fw)
> >>         try loading "gmu.bin"
> >
> > that (loading random fw) sounds like a bad idea.. plus gmu.bin doesn't =
exist
> I guess we still should hear from Qualcomm on this one, but I
> do believe that "aXYZ_gmu.bin" is really "gmu firmware, tagged
> at aXYZ release". They're even versioned and adreno-gpulist.h
> downstream contains the minimum version for each SKU.

We definitely can't use a660_gmu.bin as is on a630 family devices, for
example.  Maybe that is just down to sw <-> fw interface changes but
it means linux-firmware would still need to keep separate a630_gmu.bin
and a660_gmu.bin, otherwise new l-f with old kernel would explode.

That doesn't mean they are unrelated.. I think they probably just
branch the fw for each family.

BR,
-R

> Konrad
