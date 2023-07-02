Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 526C6744E18
	for <lists+dri-devel@lfdr.de>; Sun,  2 Jul 2023 16:31:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A082C10E00B;
	Sun,  2 Jul 2023 14:31:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45AC510E00B;
 Sun,  2 Jul 2023 14:31:40 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 46e09a7af769-6b711c3ad1fso3067247a34.0; 
 Sun, 02 Jul 2023 07:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688308299; x=1690900299;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=88WutuRFo5WgJcYE0wkhr8U2pMfpdX9vpFvhW0Euzqw=;
 b=Q6NyYbxP2qEn2Xutl+FCmmv4u6vk4SUdd0kUp1aKMGv2lL0rWAaH/9qukZ808LJrSu
 W0I8koTlOwYKzChZyBTYE1sdeZBOXUOhJiNiiuv8Vn/9eLvcgeCr8NyJvaxhKn5bXn3H
 TZi83tOqNzbqK/7arYfUL9NIfvb7mHFbB+zDIvWr0pMDygLmnSzhjNTf+OMhAXDkuHh3
 YptOeF0ontuAsHf7dGPHLkKoWNVaUSynyViGQm/B/FvldaikeWo451PxAeeLlUKnSq4y
 RONdiCRiIrpf7LsliZP2NvVPE8ROVV18aO/EWv/FVs9mc2r5ARNsjoCQLYcdFppGpDDC
 lbRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688308299; x=1690900299;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=88WutuRFo5WgJcYE0wkhr8U2pMfpdX9vpFvhW0Euzqw=;
 b=iMs8HXG+IKI56pSB4wBEhcsJ2cZJ1u5ET3s3hYdfxxKTyY8Lhasfi5VAUi2yXYGkrJ
 MaTcoU8SM5GIejzNQoku34PJIrva66/j2BHNWrPDmy7FsLi1fXR/3RxH0Ji9n1cbrLns
 p4BoXLOlhwvlADg/nVmDMrrnobp0UNeVHzQTW/nGF/rLKvsH+7wk02odYuiCybL6w9aw
 ZsRpjF0AEIvXWLpX2AAH1waAMHpQj2pxZNeCWtiVZoQWk9xhsjYITSFgiYW1RGgG4+In
 cN3rFcFdhxCzoWfDceNQx5dK2Nuwj3hwQL+wKL/21i95sB/OU9WdyVTv07zYiQb9361l
 paGQ==
X-Gm-Message-State: AC+VfDyqVfx3W+sTK+Ew0lhm5hjzTyCzht455Uzk8aq/TNtNzstHV62t
 gsuIK6EFvhl5gvqjSNUV+eDb2m/uNgK4ryKX1DY=
X-Google-Smtp-Source: ACHHUZ70JPiogGnsvR1zJCU7ntAzo1ZSFvSXj5OfCRUvRh+KkQrmPShZS1FAwuEHFRDFaFf/8Ei7rvSLinqdYERzTrc=
X-Received: by 2002:a9d:7b4e:0:b0:6b8:7fe2:cde5 with SMTP id
 f14-20020a9d7b4e000000b006b87fe2cde5mr9968767oto.24.1688308299043; Sun, 02
 Jul 2023 07:31:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230628-topic-a635-v2-1-5494c881b8be@linaro.org>
 <CAF6AEGsH0BZd_yyn7UtJ3cLbbw2A5qdg8gQ6SORzQKjsMsnvHA@mail.gmail.com>
 <CAA8EJpripp+Hf=GvCit75naGQqK8owHzPb+VuYHin393HcFPwA@mail.gmail.com>
In-Reply-To: <CAA8EJpripp+Hf=GvCit75naGQqK8owHzPb+VuYHin393HcFPwA@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Sun, 2 Jul 2023 07:31:27 -0700
Message-ID: <CAF6AEGsdPhWO+hw3FHiqtMfiF34_RtrvvS4apykHNBbtmdj7fQ@mail.gmail.com>
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

On Sat, Jul 1, 2023 at 5:24=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Sat, 1 Jul 2023 at 18:50, Rob Clark <robdclark@gmail.com> wrote:
> >
> > On Fri, Jun 30, 2023 at 4:12=E2=80=AFPM Konrad Dybcio <konrad.dybcio@li=
naro.org> wrote:
> > >
> > > Recently, a WARN_ON() was introduced to ensure that revn is filled be=
fore
> > > adreno_is_aXYZ is called. This however doesn't work very well when re=
vn is
> > > 0 by design (such as for A635). Fill it in as a stopgap solution for
> > > -fixes.
> > >
> > > Fixes: cc943f43ece7 ("drm/msm/adreno: warn if chip revn is verified b=
efore being set")
> > > Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > > ---
> > > Changes in v2:
> > > - add fixes
> > > - Link to v1: https://lore.kernel.org/r/20230628-topic-a635-v1-1-5056=
e09c08fb@linaro.org
> > > ---
> > >  drivers/gpu/drm/msm/adreno/adreno_device.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu=
/drm/msm/adreno/adreno_device.c
> > > index cb94cfd137a8..8ea7eae9fc52 100644
> > > --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> > > +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > > @@ -345,6 +345,7 @@ static const struct adreno_info gpulist[] =3D {
> > >                 .address_space_size =3D SZ_16G,
> > >         }, {
> > >                 .rev =3D ADRENO_REV(6, 3, 5, ANY_ID),
> > > +               .revn =3D 635,
> > >                 .fw =3D {
> > >                         [ADRENO_FW_SQE] =3D "a660_sqe.fw",
> > >                         [ADRENO_FW_GMU] =3D "a660_gmu.bin",
> > >
> >
> > hmm, I realized a problem with this, it would change what
> > MSM_PARAM_GPU_ID and more importantly MSM_PARAM_CHIP_ID return..  The
> > former should be "harmless", although it isn't a good idea for uabi
> > changes to be a side effect of a fix.  The latter is more problematic.
>
> I'd say MSM_PARAM_GPU_ID is broken for 635 anyway (won't it return 0
> in this case)?
> So the new value should be correct.

no, it is very much intentional that GPU_ID returns 0 for newer GPUs,
userspace should be matching on CHIP_ID.  (Also, we should be moving
away from trying to infer generation/etc from CHIP_ID.. userspace is
farther ahead of the kernel on this.)

> But more importantly, why are we exporting speedbin in
> MSM_PARAM_CHIP_ID only if there is no revn? And why are we exporting
> the speedbin at all as a part of CHIP_ID?

Basically just being paranoid about not changing uabi.  It probably
would be ok to export the speedbin for all, but I'd have to double
check mesa version history.

BR,
-R

> >
> > I think I'm leaning more towards reverting commit cc943f43ece7
> > ("drm/msm/adreno: warn if chip revn is verified before being set") for
> > -fixes.  I'm still thinking about options for a longer term fix.
> >
> > BR,
> > -R
> >
> >
> > > ---
> > > base-commit: 5c875096d59010cee4e00da1f9c7bdb07a025dc2
> > > change-id: 20230628-topic-a635-1b3c2c987417
> > >
> > > Best regards,
> > > --
> > > Konrad Dybcio <konrad.dybcio@linaro.org>
> > >
>
>
>
> --
> With best wishes
> Dmitry
