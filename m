Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AA5744AB0
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jul 2023 19:16:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D68B10E0F4;
	Sat,  1 Jul 2023 17:16:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [IPv6:2607:f8b0:4864:20::c2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6531710E08F;
 Sat,  1 Jul 2023 17:16:54 +0000 (UTC)
Received: by mail-oo1-xc2f.google.com with SMTP id
 006d021491bc7-56347da4a50so1939232eaf.2; 
 Sat, 01 Jul 2023 10:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688231813; x=1690823813;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2FOHhHz8+MfElfgvBPpP2HygXloGAXdP6WQyskY3Lqw=;
 b=VhxPXvhCs3ycjCDO+Dy2nynhvaVsZodu/cPsKh6TdrZx+2ydCj1/D7Cdey9FlrWBuZ
 OWgtDy/JF4UyIcL89ZsWD0/17vlpIYzg+md98ADu6lqrVi102cNU3u9pShepwJRAhzxT
 1j95E4deSkM0xcLcctYo7UaaqcByTbidYW+tNqKHZTQuHeWyBZz6lH/Fun4hSp0tCU6w
 5CrHPdS9+aoFH/06lkOicO1kzKGIbENarQw7q5cYkQpzW8mS9yaXak9nPP1E1hAbKozO
 6yDMAUPU/p9D1A8W+KQ+7Ea9T6SSzFIDWfGwOj8wlZGTUprtYGutbBQfDboJfvDs5UYJ
 e/jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688231813; x=1690823813;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2FOHhHz8+MfElfgvBPpP2HygXloGAXdP6WQyskY3Lqw=;
 b=T7g4WHegpwOgZqoGZvrHeB9d6LVl4WFAFNAHr6NS0JJeVVy6+b0nRUfZRxyC+27ecy
 tiFHmJPAXj1dCjNFzhv0WNXtmBUYaySyGtjDWoVn62k0LkUsQzQymgl6VmScsZjFpPGX
 j/7JnnxIfXqzOwVFS1OANI8cEtN3neTXmqBQAyHj7/rCLsCHt7YPe88R2x9sgbZXczMw
 6V1oRiMGhYRGr3cPxi7ZJATVMwjPMEGtZAWnvP8FGmL4YKeXA44kOS5UMsHkTbpT/NZx
 z2d56ejp1P9uc0v/jsUEg4s0dvGrhScJJkKEj19KkhdTXJutvyPDn385jJfbe2B+z+Ny
 ztMQ==
X-Gm-Message-State: AC+VfDxfXTNN5Fv9ge+8giq642hbSDgPUsReyKYUfhR99XFh5XXyg9Zt
 5g1H7eIno5JWi5lur6G9xNYLgyGWcStaZFppbds=
X-Google-Smtp-Source: ACHHUZ5U44GWnVjlc4/4StJf+Bvj8Unvd3fhQwc7n0VbSC+OiNVi57XgfziYn+IsJTTl47k6q7YLRYMD5kVNNIK+YcM=
X-Received: by 2002:a4a:4158:0:b0:565:9e41:85d8 with SMTP id
 x85-20020a4a4158000000b005659e4185d8mr4409368ooa.6.1688231812920; Sat, 01 Jul
 2023 10:16:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230628-topic-a635-v2-1-5494c881b8be@linaro.org>
 <CAF6AEGsH0BZd_yyn7UtJ3cLbbw2A5qdg8gQ6SORzQKjsMsnvHA@mail.gmail.com>
In-Reply-To: <CAF6AEGsH0BZd_yyn7UtJ3cLbbw2A5qdg8gQ6SORzQKjsMsnvHA@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Sat, 1 Jul 2023 10:16:41 -0700
Message-ID: <CAF6AEGvBsnLU18cMwh_yoYAJe59k7kSFNaA4RB12yYxoU4PMbQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/adreno: Assign revn to A635
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jul 1, 2023 at 8:49=E2=80=AFAM Rob Clark <robdclark@gmail.com> wrot=
e:
>
> On Fri, Jun 30, 2023 at 4:12=E2=80=AFPM Konrad Dybcio <konrad.dybcio@lina=
ro.org> wrote:
> >
> > Recently, a WARN_ON() was introduced to ensure that revn is filled befo=
re
> > adreno_is_aXYZ is called. This however doesn't work very well when revn=
 is
> > 0 by design (such as for A635). Fill it in as a stopgap solution for
> > -fixes.
> >
> > Fixes: cc943f43ece7 ("drm/msm/adreno: warn if chip revn is verified bef=
ore being set")
> > Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> > ---
> > Changes in v2:
> > - add fixes
> > - Link to v1: https://lore.kernel.org/r/20230628-topic-a635-v1-1-5056e0=
9c08fb@linaro.org
> > ---
> >  drivers/gpu/drm/msm/adreno/adreno_device.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/d=
rm/msm/adreno/adreno_device.c
> > index cb94cfd137a8..8ea7eae9fc52 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> > @@ -345,6 +345,7 @@ static const struct adreno_info gpulist[] =3D {
> >                 .address_space_size =3D SZ_16G,
> >         }, {
> >                 .rev =3D ADRENO_REV(6, 3, 5, ANY_ID),
> > +               .revn =3D 635,
> >                 .fw =3D {
> >                         [ADRENO_FW_SQE] =3D "a660_sqe.fw",
> >                         [ADRENO_FW_GMU] =3D "a660_gmu.bin",
> >
>
> hmm, I realized a problem with this, it would change what
> MSM_PARAM_GPU_ID and more importantly MSM_PARAM_CHIP_ID return..  The
> former should be "harmless", although it isn't a good idea for uabi
> changes to be a side effect of a fix.  The latter is more problematic.
>
> I think I'm leaning more towards reverting commit cc943f43ece7
> ("drm/msm/adreno: warn if chip revn is verified before being set") for
> -fixes.  I'm still thinking about options for a longer term fix.

This is what I came up with as far as better way to solve this:

https://patchwork.freedesktop.org/series/120108/

BR,
-R

> BR,
> -R
>
>
> > ---
> > base-commit: 5c875096d59010cee4e00da1f9c7bdb07a025dc2
> > change-id: 20230628-topic-a635-1b3c2c987417
> >
> > Best regards,
> > --
> > Konrad Dybcio <konrad.dybcio@linaro.org>
> >
