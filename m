Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C5C77943B
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 18:21:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8777510E6B3;
	Fri, 11 Aug 2023 16:21:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B899A10E6B3;
 Fri, 11 Aug 2023 16:21:36 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-5236a9788a7so2866328a12.0; 
 Fri, 11 Aug 2023 09:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691770895; x=1692375695;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gu8V37ck4bhW/MDHFFxPdQxj3+UGhQMkMY7C4RdA7kU=;
 b=iE5QNHzCs/a84dftki8VPTvxzfS4UsEgOLYbiwuZGVELYQrM2auOZfRbn2xmXEaybz
 LniC3FU0oDl/F+bCXaqR+mdTR2tYvlGPKSpXA2WGpX2/0T62EpBViCPJE+J8uSlJdd4f
 B9zRO3ZU9LE3B93qLUU+LQTF7A3kovZzRMTl1UB+rMLIpPorGCl/Qv+MvWtpd9SH60i8
 YigMmy8UUL1rBUauj/6gMTUfEui7sBuIp7YCDhqF0nUhzcK8cYQ3GHwn+GQq6exDw8Su
 5ZqwSQDQ3xiHLdGobRkcra8le1Hq9jONgFb8MId+bscgVlWoy7JOwl6WsPRHd0E2v2Yd
 UpKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691770895; x=1692375695;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gu8V37ck4bhW/MDHFFxPdQxj3+UGhQMkMY7C4RdA7kU=;
 b=YsMwiClf34o6A5DAY0JR8GAR3KPDzeIlSNmadG/wv634HKWip2NCtbALvmMAKzwyWg
 LSqyOL0tNQVvUKW5LXIHwKuuYU0Yotrf6K3yICBV6TFvQpV1tTn49MQOhqU0MRNmatVJ
 g/83CGLO/JkCwUi2oEubSH/bgj4Umo6w2J+029S+LtNPTRY1P5aEIgTs/T+Fp+ikrxjK
 dfMHl9CQz1WhQxTsEZ2/Ul7mh9JJDDOvwpWqire+cWg4MRHOlSRLg1YNsOJcONYy+W7o
 Jd/7bIucAUAruTxM1Q6EM++61p8D8LFCn5KEYga2HUaT/oI5TJ8YLWDPD2R2HVj6DthE
 s/Fw==
X-Gm-Message-State: AOJu0YygzHac09w01bUvXtKAGUtpCYPdc0XSyjMlb3OcIqyrzJH2LzAu
 zDu35TytNPX+GbOI5IMjh12zwpMqnRDfAHm5eak=
X-Google-Smtp-Source: AGHT+IHxJ7loqb9uBPUfzjEVz2W5ApsU10Ng4qTENXy3nPtyg76zYG6eo2MZZO+e2x4Qu1z+qceCnvjHoMnNVoJMK9Y=
X-Received: by 2002:aa7:c956:0:b0:523:b1b0:f69f with SMTP id
 h22-20020aa7c956000000b00523b1b0f69fmr2241060edt.32.1691770894855; Fri, 11
 Aug 2023 09:21:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230811160505.174574-1-robdclark@gmail.com>
 <CAF6AEGtNgCxsOLyF31=WCdag4Gb7+2FvFEvOWDcqd_TxiTeE3w@mail.gmail.com>
 <d400c787-3c81-4e37-b541-371d6096cf7e@linaro.org>
In-Reply-To: <d400c787-3c81-4e37-b541-371d6096cf7e@linaro.org>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 11 Aug 2023 09:21:22 -0700
Message-ID: <CAF6AEGuHKuW_LGYfC640fBHsf3xzxSiyqL0YVpb5HqE=HSiL4w@mail.gmail.com>
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

On Fri, Aug 11, 2023 at 9:11=E2=80=AFAM Konrad Dybcio <konrad.dybcio@linaro=
.org> wrote:
>
> On 11.08.2023 18:09, Rob Clark wrote:
> > On Fri, Aug 11, 2023 at 9:05=E2=80=AFAM Rob Clark <robdclark@gmail.com>=
 wrote:
> >>
> >> From: Rob Clark <robdclark@chromium.org>
> >>
> >> There isn't actually a a690_gmu.bin.  But it appears that the normal
> >> a660_gmu.bin works fine.  Normally all the devices within a sub-
> >> generation (or "family") will use the same fw, and a690 is in the a660
> >> family.
> >>
> >
> > possibly this could be considered as:
> >
> > Fixes: 5e7665b5e484 ("drm/msm/adreno: Add Adreno A690 support")
> For a lack of a better response, "meh"

It would help route the change back to 6.4.y so we can stop explaining
to folks that they should create a symlink ;-)

> Other than that:
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>
> Perhaps we could take this further and do something like
>
> if (failed to load gmu fw)
>         try loading "gmu.bin"

that (loading random fw) sounds like a bad idea.. plus gmu.bin doesn't exis=
t

BR,
-R

>
> Konrad
> >
> >> Signed-off-by: Rob Clark <robdclark@chromium.org>
> >> ---
> >>  drivers/gpu/drm/msm/adreno/adreno_device.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/=
drm/msm/adreno/adreno_device.c
> >> index 1ed270dae148..756a9cfe1cbf 100644
> >> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> >> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> >> @@ -478,7 +478,7 @@ static const struct adreno_info gpulist[] =3D {
> >>                 .family =3D ADRENO_6XX_GEN4,
> >>                 .fw =3D {
> >>                         [ADRENO_FW_SQE] =3D "a660_sqe.fw",
> >> -                       [ADRENO_FW_GMU] =3D "a690_gmu.bin",
> >> +                       [ADRENO_FW_GMU] =3D "a660_gmu.bin",
> >>                 },
> >>                 .gmem =3D SZ_4M,
> >>                 .inactive_period =3D DRM_MSM_INACTIVE_PERIOD,
> >> --
> >> 2.41.0
> >>
