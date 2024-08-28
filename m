Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1301B96290D
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 15:44:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8259A10E367;
	Wed, 28 Aug 2024 13:44:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jatasa6p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com
 [209.85.208.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 521848984C;
 Wed, 28 Aug 2024 13:44:56 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-5bed0a2ae0fso8374698a12.1; 
 Wed, 28 Aug 2024 06:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724852695; x=1725457495; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ciXe1ww20uosaznXPzWGEWV1+7lWqnPArDIYHddKD0U=;
 b=jatasa6p5RibN02IliPXMJnloaGfYtgpcgGko0s+RCFAJ8844ovBlJes+bX0vw7Mjn
 05roExI/HZtAYSve8pwE5YEyE9pxBSjvnJ5m48VSJ3Py46iBQKSajDv6Bki1WiQqxkeX
 COdOSNwB/MAEtZvDBwbktlgVccwAfFeCVl/F61m+9GdX5jM3Qh8z1pylQfTsp4nsp5Ls
 JrELAKc3X/wPBMyqmuT1eVo15jsPB4KN3V7H1XVDOYtEk0BStvph+qdmX06gxcy2fBDJ
 YowRnMkhoY1LS+GBV7l7901f+r0aQmJ4XXDTQG8/Dwbd3jkONVTPhaA+c1eDE5JlWFOE
 UaYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724852695; x=1725457495;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ciXe1ww20uosaznXPzWGEWV1+7lWqnPArDIYHddKD0U=;
 b=mXh6OZz01ggZtBLALB7oXTKVuNstqQyoZjkyMGHDV1AsIe2ILRZIOoR3rCZCjrSu2m
 rE3oi6G2aQSPWhgDKK12+mv7zgjDRNGbmlVz+Sf2pgL9KgcwYDXpIgmaIWavI1eFjTfP
 8WaVqHGOuq2mLP5QZV9DceaC6O4hgWAFPFd1qR+uqC4f/wtFhmEjPBzG6w6djT49jhru
 kTUWQrQdDkKQxOluPDYTPgZ1AM47FXrQmRTD3qXM8w0wmQxBqXPc0xxVv1mzxw28K9sQ
 dnGcWpGxiusFGw2jUcLWEUQZ6227x2Dn/tK69XeuNTwtyM48fXbwTd30yVfL8SHSmfhd
 mvvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAm6GhIQHX8Qie8JmQ23tCRy6jlb0Azo+3n3bFQmgC6nRL0vZQZlme1t7BWV/NyttP7xiQUzQD0JI=@lists.freedesktop.org,
 AJvYcCWrZaaaVf65mntE+2YE7+7knDtxbRwWjRdUdIDpxR2hW+tlDiOulLJnPys1ULAYVBi0zIV1qUkitpn2@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yybic4tMrvMYNyfJp5Yqmw68xEvmB3fd7g4jugpg2HrtS/rye6+
 IJop4nicfuh1dfkziU40Zq/2z4VF+FDGKNnATZtF6J7oCy/zDZDZLOT8LRWM6bAd5d6mq11YtDJ
 MGcInzs1ZfrrrL8F6j+oJQ/93UO4=
X-Google-Smtp-Source: AGHT+IHPu8zMojXcBjKjl7uQQ/A0MIXY4TDdF/0Kugs7vRBs83nkNiGEGQeIcX8ZoYaJMmCepv+AwPgyGZ2Wwetqz0c=
X-Received: by 2002:a05:6402:1ecc:b0:5be:fa43:8017 with SMTP id
 4fb4d7f45d1cf-5c08916617emr12707264a12.16.1724852693909; Wed, 28 Aug 2024
 06:44:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240719-topic-a621-v1-0-850ae5307cf4@linaro.org>
 <20240719-topic-a621-v1-3-850ae5307cf4@linaro.org>
 <CAF6AEGs23d5OqKst+ik-kMMXPCS_0=-a8ndskv3j4NduOVR1Vw@mail.gmail.com>
 <CAF6AEGuB5oB6RZLk+PfYMTV8ybboJymcvzJVu9ByHdu=KyvV+w@mail.gmail.com>
 <CAF6AEGtkikykNKHz0905HZ4FOJYieO5R3jr6-OO8QLYqok25BA@mail.gmail.com>
 <3ead166f-8108-4503-ae81-7605585c816b@kernel.org>
In-Reply-To: <3ead166f-8108-4503-ae81-7605585c816b@kernel.org>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 28 Aug 2024 06:44:42 -0700
Message-ID: <CAF6AEGtAMF4efKZo-ogwXc5JGHdoYJ0EfMTtOrkF1J4=zc9yPg@mail.gmail.com>
Subject: Re: [PATCH 3/5] drm/msm/a6xx: Store gmu_cgc_mode in struct a6xx_info
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
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

On Wed, Aug 28, 2024 at 4:16=E2=80=AFAM Konrad Dybcio <konradybcio@kernel.o=
rg> wrote:
>
> On 27.08.2024 10:12 PM, Rob Clark wrote:
> > resending with updated Konrad email addr
> >
> > On Mon, Aug 26, 2024 at 2:09=E2=80=AFPM Rob Clark <robdclark@gmail.com>=
 wrote:
> >>
> >> On Mon, Aug 26, 2024 at 2:07=E2=80=AFPM Rob Clark <robdclark@gmail.com=
> wrote:
> >>>
> >>> On Fri, Jul 19, 2024 at 3:03=E2=80=AFAM Konrad Dybcio <konrad.dybcio@=
linaro.org> wrote:
> >>>>
> >>>> This was apparently almost never set on a6xx.. move the existing val=
ues
> >>>> and fill out the remaining ones within the catalog.
> >>>>
> >>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> >>>> ---
>
> [...]
>
> >>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>>> @@ -402,7 +402,7 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, b=
ool state)
> >>>>         struct a6xx_gmu *gmu =3D &a6xx_gpu->gmu;
> >>>>         const struct adreno_reglist *reg;
> >>>>         unsigned int i;
> >>>> -       u32 val, clock_cntl_on, cgc_mode;
> >>>> +       u32 val, clock_cntl_on;
> >>>>
> >>>>         if (!(adreno_gpu->info->a6xx->hwcg || adreno_is_a7xx(adreno_=
gpu)))
> >>>>                 return;
> >>>> @@ -417,10 +417,8 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, =
bool state)
> >>>>                 clock_cntl_on =3D 0x8aa8aa82;
> >>>>
> >>>>         if (adreno_is_a7xx(adreno_gpu)) {
> >>>> -               cgc_mode =3D adreno_is_a740_family(adreno_gpu) ? 0x2=
0222 : 0x20000;
> >>>> -
> >>>
> >>> This does appear to change the gmu_cgc_mode in nearly all cases.. was
> >>> this intended?
> >>
> >> Hmm, and this will only get written for a7xx, so we're dropping the
> >> reg write for a690..
>
> Right, this patch is a lot to chew through.. It:
>
> - adds the proper magic value per gpu gen
> - removes the sneaky a690 write
> - uses the new struct entry
>
> but also
>
> - fails to remove the if (a7xx) check
>
> so I suppose for v2 I can split it into:
>
> 1. add the magic values
> 2. fix the if (a7xx) check
> 3. use the struct value and drop the a690 one
>
> does that sound good?

Yeah, I would prefer if it were split up to make it clear that the
magic value changes were intentional

ps.  there is a _bit_ more time to get this in to msm-next for v6.12,
but not much

BR,
-R

> Konrad
