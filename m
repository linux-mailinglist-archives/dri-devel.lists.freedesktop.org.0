Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F31744E3D
	for <lists+dri-devel@lfdr.de>; Sun,  2 Jul 2023 16:56:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D106E10E14C;
	Sun,  2 Jul 2023 14:56:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com
 [IPv6:2607:f8b0:4864:20::c2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41D8510E145;
 Sun,  2 Jul 2023 14:56:37 +0000 (UTC)
Received: by mail-oo1-xc2b.google.com with SMTP id
 006d021491bc7-55b85b94bb0so1770935eaf.0; 
 Sun, 02 Jul 2023 07:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688309796; x=1690901796;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LnmGb9vKhvzi0XZPMqQ1ONABGe8k3k8AgsBTL2GUhi4=;
 b=QBxJ8F4qsF9q3pHTHu1sm2WXY6dxOl4OxFU4lGR0w/kk6B32FeW77ydj3AiWQNjtr4
 gPh0kcsXER7eaXmpG1zZxMVtmYjmDNTv26A9IP/yjZsZ663ouyL4CrEn0L/NukfCMwEr
 giF3RLjszk0crTJ9soBbz/pP0b2jJhRepfiPxwEb2L82cOsmY0HRGUElgspT9j9M7cQy
 dPNxd09U+eBIp8MlKwRO0RiJMKResR4jqGcmcH9RtobQha4s/XR3rcwqeluO2lXOsPzD
 BRFcmm5LTN8N8lsNJD2TG+r6Wht/3u/7tRBm05ghgt5GxzNWXXKTQ+tnuBPu4BT8TKJa
 cO2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688309796; x=1690901796;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LnmGb9vKhvzi0XZPMqQ1ONABGe8k3k8AgsBTL2GUhi4=;
 b=ioTqF7Db+lWrDqMt/WQsa7Yg845i6IyIOZJQVOwVbOlnmEBBOPhs9zr+9NTNbriVVb
 8OOJo+NFdZX9ZPiAQ/84Qp53BQ1kYqYN6y6Jjs+N5oLdv95QipVjAtML8H3iVjy1l+Pk
 SBGvobT/NlsD+R/Hlx6/DLbY5be8DEOgXvaWgL80A0/taqvKwqjJHU7+t2P+OazAhJ7u
 kbK3w7+yQ1ZSHrOd6r1NuzZ8mVSSiy4RoLZtVekg5hhHUu8bzNWCclpcqgwa2ZaJIqju
 qvIInfG1GOGoyWekZ1sxvFcS+m6VGHpbsKpEctF8zjqi0tCZ3+tD8bFAYC9RVcbfHY8v
 2WuQ==
X-Gm-Message-State: AC+VfDy5VMU7jKd7FmcvFg6vwvhanz5MbvIP46WvkecKEvqHZ/xFNHtx
 yU/qToQ/rl81ieiQwgeDVoZG/ZbEQYQ+nXL72EE=
X-Google-Smtp-Source: ACHHUZ48R2opv8q9VHF9PDqXVetMrGp5glWf4N9VKvHQgw3ILmXreuejWtmmif3rgCMtfF9lIquqA6gJLD6NiiRqzrU=
X-Received: by 2002:a4a:4997:0:b0:560:c32a:8e10 with SMTP id
 z145-20020a4a4997000000b00560c32a8e10mr4769999ooa.0.1688309796025; Sun, 02
 Jul 2023 07:56:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230628-topic-a635-v2-1-5494c881b8be@linaro.org>
 <CAF6AEGsH0BZd_yyn7UtJ3cLbbw2A5qdg8gQ6SORzQKjsMsnvHA@mail.gmail.com>
 <CAA8EJpripp+Hf=GvCit75naGQqK8owHzPb+VuYHin393HcFPwA@mail.gmail.com>
 <CAF6AEGsdPhWO+hw3FHiqtMfiF34_RtrvvS4apykHNBbtmdj7fQ@mail.gmail.com>
 <5e70cb31-61a7-55d7-b3a5-5051e6d338e9@linaro.org>
In-Reply-To: <5e70cb31-61a7-55d7-b3a5-5051e6d338e9@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Sun, 2 Jul 2023 07:56:24 -0700
Message-ID: <CAF6AEGv3S2FUgSsCTLOtp63ge5ONSMQfS7Yn6nxr6b8a6Q5YZg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/adreno: Assign revn to A635
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jul 2, 2023 at 7:34=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On 02/07/2023 17:31, Rob Clark wrote:
> > On Sat, Jul 1, 2023 at 5:24=E2=80=AFPM Dmitry Baryshkov
> > <dmitry.baryshkov@linaro.org> wrote:
> >>
> >> On Sat, 1 Jul 2023 at 18:50, Rob Clark <robdclark@gmail.com> wrote:
> >>>
> >>> On Fri, Jun 30, 2023 at 4:12=E2=80=AFPM Konrad Dybcio <konrad.dybcio@=
linaro.org> wrote:
> >>>>
> >>>> Recently, a WARN_ON() was introduced to ensure that revn is filled b=
efore
> >>>> adreno_is_aXYZ is called. This however doesn't work very well when r=
evn is
> >>>> 0 by design (such as for A635). Fill it in as a stopgap solution for
> >>>> -fixes.
> >>>>
> >>>> Fixes: cc943f43ece7 ("drm/msm/adreno: warn if chip revn is verified =
before being set")
> >>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> >>>> ---
> >>>> Changes in v2:
> >>>> - add fixes
> >>>> - Link to v1: https://lore.kernel.org/r/20230628-topic-a635-v1-1-505=
6e09c08fb@linaro.org
> >>>> ---
> >>>>   drivers/gpu/drm/msm/adreno/adreno_device.c | 1 +
> >>>>   1 file changed, 1 insertion(+)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gp=
u/drm/msm/adreno/adreno_device.c
> >>>> index cb94cfd137a8..8ea7eae9fc52 100644
> >>>> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> >>>> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> >>>> @@ -345,6 +345,7 @@ static const struct adreno_info gpulist[] =3D {
> >>>>                  .address_space_size =3D SZ_16G,
> >>>>          }, {
> >>>>                  .rev =3D ADRENO_REV(6, 3, 5, ANY_ID),
> >>>> +               .revn =3D 635,
> >>>>                  .fw =3D {
> >>>>                          [ADRENO_FW_SQE] =3D "a660_sqe.fw",
> >>>>                          [ADRENO_FW_GMU] =3D "a660_gmu.bin",
> >>>>
> >>>
> >>> hmm, I realized a problem with this, it would change what
> >>> MSM_PARAM_GPU_ID and more importantly MSM_PARAM_CHIP_ID return..  The
> >>> former should be "harmless", although it isn't a good idea for uabi
> >>> changes to be a side effect of a fix.  The latter is more problematic=
.
> >>
> >> I'd say MSM_PARAM_GPU_ID is broken for 635 anyway (won't it return 0
> >> in this case)?
> >> So the new value should be correct.
> >
> > no, it is very much intentional that GPU_ID returns 0 for newer GPUs,
> > userspace should be matching on CHIP_ID.  (Also, we should be moving
> > away from trying to infer generation/etc from CHIP_ID.. userspace is
> > farther ahead of the kernel on this.)
>
> Thanks for the explanation. So in theory we can change this to always
> return 0? Or must we keep it to keep UABI / compatibility?
>
> I'm trying to understand if we can drop revn at all.

I'm not sure how likely it is that someone would try a very old mesa
with a new kernel, but that combo would break if we dropped revn
completely and returned 0 for GPU_ID.  But I would like to move away
from using revn internally.  (And probably move away from the patch-id
wildcard matching, and instead just explicitly list all known patch-id
values so we can start treating CHIP_ID as just an opaque identifier.)

BR,
-R

>
> >
> >> But more importantly, why are we exporting speedbin in
> >> MSM_PARAM_CHIP_ID only if there is no revn? And why are we exporting
> >> the speedbin at all as a part of CHIP_ID?
> >
> > Basically just being paranoid about not changing uabi.  It probably
> > would be ok to export the speedbin for all, but I'd have to double
> > check mesa version history.
>
> Thanks!
>
> >
> > BR,
> > -R
> >
> >>>
> >>> I think I'm leaning more towards reverting commit cc943f43ece7
> >>> ("drm/msm/adreno: warn if chip revn is verified before being set") fo=
r
> >>> -fixes.  I'm still thinking about options for a longer term fix.
> >>>
> >>> BR,
> >>> -R
> >>>
> >>>
> >>>> ---
> >>>> base-commit: 5c875096d59010cee4e00da1f9c7bdb07a025dc2
> >>>> change-id: 20230628-topic-a635-1b3c2c987417
> >>>>
> >>>> Best regards,
> >>>> --
> >>>> Konrad Dybcio <konrad.dybcio@linaro.org>
> >>>>
> >>
> >>
> >>
> >> --
> >> With best wishes
> >> Dmitry
>
> --
> With best wishes
> Dmitry
>
