Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8883924196
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 16:59:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BD4110E622;
	Tue,  2 Jul 2024 14:59:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NJGoNwDs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4117B10E618;
 Tue,  2 Jul 2024 14:58:59 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id
 d2e1a72fcca58-7066a3229f4so2751799b3a.2; 
 Tue, 02 Jul 2024 07:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719932339; x=1720537139; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xd/gYaSsw123ES2y6SAFKy2GqNwG0P6DwixOAzM0d/w=;
 b=NJGoNwDsb1nD7WM9zr4hvia7zvuoTTkReCbZ3/cYjHMh4CGGREDj3WMhxH8M2zkf5C
 nKHu+ZSTaNyfRYASL+bwJ7nFjwdiY/3ZOXoLCrnUq0zVMLV01/LcAhxPGkW8d0sBDQ3g
 lfZ8uDP/vFWAUjvA8sqH7V3K8JoX2u9cD5ROlKv2Gatrrlohc2AxsxvhdujimjtjNYPd
 7JT2mYpiv446qrK+9CyOdmeS5Rv2pfqlUSFm6YkMlQru/f7lRpd7VSsVUqgYIt8JHt4R
 lyEi5Pefz1YVm6ozNEAp6sF/umRADoR8Ih97CkikhW0VkyMBYg22o3pJ0Lce5v2+YCp3
 u4MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719932339; x=1720537139;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xd/gYaSsw123ES2y6SAFKy2GqNwG0P6DwixOAzM0d/w=;
 b=iT7kfNEuhpcbSVLdlPw5R1ygEEXg2Cc/L93QiKQsufYvBWmRefRzr/jEkau2PdHiHp
 6TScs+dJSYYmSIoVZn+b/x9SDszJhwGt+wOjGast79+TjiFTZi04sFEWQfTD9lZd7c/2
 xYnE0YCBHhmGDVhb7GwCYpEshaGE27Ibc1yzie0xpuSLcE82HCmBMg7PtxEoxE76z84m
 XBnknxm5hjOY4xGinTpQ4YyUrNT/vymfQHG2cw1wULv/j8ZKywE/lL+NGqXwLxP2lRvy
 CcHRurO2lVo/VFRNCBKUFf5k3UNHyUWdW2bLu4yPLIDfqfG9XYBI6PAjXy+aLRYACzI9
 ec0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2gE0GfRKgGHikX97pwYifpstVB/tr2QtBcNhO+TSgjuKzibeQN3gXUqJ2Ui76VjtDB2+6/dd/vHMZW/+IdbTaywC7Yvk/+oZURMnULn5kYkpgHdFftacMbpCcjh0m3Z6QL1pG7gQpND+KF7eliJxC
X-Gm-Message-State: AOJu0YwFh4yz0gMZGWSgB2mOED7OI6bynAcjlTH2RLPlSsTpDIxkY1YO
 D005CJQZsMhoCrTmdPDUwDYPe431Y6rfKbDPpeBMmY/Wdoy2o6Mlpesq/q1+rOa0EpPWFUYvkh0
 uONxAVpkg6/yxWgpXZMNUZ5QuRoQWcg1I
X-Google-Smtp-Source: AGHT+IEQ4JierNF7bQpxvoWM/0SST94e0VkWdILSLE4uBS5WVteG6Gu9MkA66HiTLnYiyOrjLoXkaX5Pch6Hn/SY3FU=
X-Received: by 2002:a05:6a00:92a2:b0:706:747c:76b6 with SMTP id
 d2e1a72fcca58-70aaaee27cdmr7355424b3a.22.1719932338594; Tue, 02 Jul 2024
 07:58:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240702-msm-tiling-config-v1-0-adaa6a6e4523@gmail.com>
 <20240702-msm-tiling-config-v1-2-adaa6a6e4523@gmail.com>
 <CAF6AEGsFtgvKAjvjD5K5Uhw-PSEWrvW2O7reiM2Z7p6=R5wQiQ@mail.gmail.com>
In-Reply-To: <CAF6AEGsFtgvKAjvjD5K5Uhw-PSEWrvW2O7reiM2Z7p6=R5wQiQ@mail.gmail.com>
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 2 Jul 2024 15:58:47 +0100
Message-ID: <CACu1E7E8FWQdiwX8s4L8MEyAX0v6PJgD9fuG=Y_3WA8Zh3hm0w@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/msm: Expand UBWC config setting
To: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
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

On Tue, Jul 2, 2024 at 3:31=E2=80=AFPM Rob Clark <robdclark@gmail.com> wrot=
e:
>
> On Tue, Jul 2, 2024 at 5:56=E2=80=AFAM Connor Abbott <cwabbott0@gmail.com=
> wrote:
> >
> > According to downstream we should be setting RBBM_NC_MODE_CNTL to a
> > non-default value on a663 and a680, we don't support a663 and on a680
> > we're leaving it at the wrong (suboptimal) value. Just set it on all
> > GPUs. Similarly, plumb through level2_swizzling_dis which will be
> > necessary on a663.
> >
> > ubwc_mode is expanded and renamed to ubwc_swizzle to match the name on
> > the display side. Similarly macrotile_mode should match the display
> > side.
> >
> > Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> > ---
> >  drivers/gpu/drm/msm/adreno/a5xx_gpu.c   |  4 ++++
> >  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 36 ++++++++++++++++++++++++-=
--------
> >  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  3 ++-
> >  3 files changed, 33 insertions(+), 10 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/ms=
m/adreno/a5xx_gpu.c
> > index c003f970189b..33b0f607f913 100644
> > --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> > @@ -1788,5 +1788,9 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *=
dev)
> >         else
> >                 adreno_gpu->ubwc_config.highest_bank_bit =3D 14;
> >
> > +       /* a5xx only supports UBWC 1.0, these are not configurable */
> > +       adreno_gpu->ubwc_config.macrotile_mode =3D 0;
> > +       adreno_gpu->ubwc_config.ubwc_swizzle =3D 0x7;
> > +
> >         return gpu;
> >  }
> > diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/ms=
m/adreno/a6xx_gpu.c
> > index c98cdb1e9326..7a3564dd7941 100644
> > --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > @@ -499,8 +499,17 @@ static void a6xx_calc_ubwc_config(struct adreno_gp=
u *gpu)
> >         gpu->ubwc_config.uavflagprd_inv =3D 0;
> >         /* Whether the minimum access length is 64 bits */
> >         gpu->ubwc_config.min_acc_len =3D 0;
> > -       /* Entirely magic, per-GPU-gen value */
> > -       gpu->ubwc_config.ubwc_mode =3D 0;
> > +       /* Whether to enable level 1, 2 & 3 bank swizzling.
> > +        * UBWC 1.0 always enables all three levels.
> > +        * UBWC 2.0 removes level 1 bank swizzling, leaving levels 2 & =
3.
> > +        * UBWC 4.0 adds the optional ability to disable levels 2 & 3.
>
> I guess this is a bitmask for BIT(level_n)?

Yes, I'll add that to the comment. BIT(0) is level 1, BIT(1) is level
2, and BIT(2) is level 3. I got that convention from msm_mdss.c.

>
> > +        */
> > +       gpu->ubwc_config.ubwc_swizzle =3D 0x6;
> > +       /* Whether to use 4-channel macrotiling mode or the newer 8-cha=
nnel
> > +        * macrotiling mode introduced in UBWC 3.1. 0 is 4-channel and =
1 is
> > +        * 8-channel.
> > +        */
>
> Can we add these comments as kerneldoc comments in the ubwc_config
> struct?  That would be a more natural place for eventually moving ubwc
> config to a central systemwide table (and perhaps finally properly
> dealing with the setting differences for DDR vs LPDDR)

Sure. These comments started right next to the code setting the
registers and sort of naturally migrated here but I guess that's
better.

FWIW, I think that in a central systemwide table we'd want to define
the config struct slightly differently, by instead storing the UBWC
version and deriving most of these parameters from that as kgsl
downstream and mdss upstream do. There would be a few extra parameters
that remain:

- highest bank bit
- minimum access length
- levels 2 & 3 bank swizzling enable/disable (level 1 can be inferred
from the version, but maybe we still want to have it to keep all the
bank swizzle config in one place?)

Everybody seems to also have macrotile_mode as a separate parameter,
but that can be avoided by adding UBWC 3.1 and then deriving it from
"ubwc_version >=3D 3.1".

I haven't taken that step here in adreno because I didn't want to
define UBWC versions in UABI yet when it's not necessary, and if we
don't have that then it's not quite necessary to refactor the driver
yet.

Connor

>
> BR,
> -R
>
> > +       gpu->ubwc_config.macrotile_mode =3D 0;
> >         /*
> >          * The Highest Bank Bit value represents the bit of the highest=
 DDR bank.
> >          * This should ideally use DRAM type detection.
> > @@ -510,7 +519,7 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu=
 *gpu)
> >         if (adreno_is_a610(gpu)) {
> >                 gpu->ubwc_config.highest_bank_bit =3D 13;
> >                 gpu->ubwc_config.min_acc_len =3D 1;
> > -               gpu->ubwc_config.ubwc_mode =3D 1;
> > +               gpu->ubwc_config.ubwc_swizzle =3D 0x7;
> >         }
> >
> >         if (adreno_is_a618(gpu))
> > @@ -536,6 +545,7 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu=
 *gpu)
> >                 gpu->ubwc_config.amsbc =3D 1;
> >                 gpu->ubwc_config.rgb565_predicator =3D 1;
> >                 gpu->ubwc_config.uavflagprd_inv =3D 2;
> > +               gpu->ubwc_config.macrotile_mode =3D 1;
> >         }
> >
> >         if (adreno_is_7c3(gpu)) {
> > @@ -543,12 +553,12 @@ static void a6xx_calc_ubwc_config(struct adreno_g=
pu *gpu)
> >                 gpu->ubwc_config.amsbc =3D 1;
> >                 gpu->ubwc_config.rgb565_predicator =3D 1;
> >                 gpu->ubwc_config.uavflagprd_inv =3D 2;
> > +               gpu->ubwc_config.macrotile_mode =3D 1;
> >         }
> >
> >         if (adreno_is_a702(gpu)) {
> >                 gpu->ubwc_config.highest_bank_bit =3D 14;
> >                 gpu->ubwc_config.min_acc_len =3D 1;
> > -               gpu->ubwc_config.ubwc_mode =3D 0;
> >         }
> >  }
> >
> > @@ -564,21 +574,26 @@ static void a6xx_set_ubwc_config(struct msm_gpu *=
gpu)
> >         u32 hbb =3D adreno_gpu->ubwc_config.highest_bank_bit - 13;
> >         u32 hbb_hi =3D hbb >> 2;
> >         u32 hbb_lo =3D hbb & 3;
> > +       u32 ubwc_mode =3D adreno_gpu->ubwc_config.ubwc_swizzle & 1;
> > +       u32 level2_swizzling_dis =3D !(adreno_gpu->ubwc_config.ubwc_swi=
zzle & 2);
> >
> >         gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL,
> > +                 level2_swizzling_dis << 12 |
> >                   adreno_gpu->ubwc_config.rgb565_predicator << 11 |
> >                   hbb_hi << 10 | adreno_gpu->ubwc_config.amsbc << 4 |
> >                   adreno_gpu->ubwc_config.min_acc_len << 3 |
> > -                 hbb_lo << 1 | adreno_gpu->ubwc_config.ubwc_mode);
> > +                 hbb_lo << 1 | ubwc_mode);
> >
> > -       gpu_write(gpu, REG_A6XX_TPL1_NC_MODE_CNTL, hbb_hi << 4 |
> > +       gpu_write(gpu, REG_A6XX_TPL1_NC_MODE_CNTL,
> > +                 level2_swizzling_dis << 6 | hbb_hi << 4 |
> >                   adreno_gpu->ubwc_config.min_acc_len << 3 |
> > -                 hbb_lo << 1 | adreno_gpu->ubwc_config.ubwc_mode);
> > +                 hbb_lo << 1 | ubwc_mode);
> >
> > -       gpu_write(gpu, REG_A6XX_SP_NC_MODE_CNTL, hbb_hi << 10 |
> > +       gpu_write(gpu, REG_A6XX_SP_NC_MODE_CNTL,
> > +                 level2_swizzling_dis << 12 | hbb_hi << 10 |
> >                   adreno_gpu->ubwc_config.uavflagprd_inv << 4 |
> >                   adreno_gpu->ubwc_config.min_acc_len << 3 |
> > -                 hbb_lo << 1 | adreno_gpu->ubwc_config.ubwc_mode);
> > +                 hbb_lo << 1 | ubwc_mode);
> >
> >         if (adreno_is_a7xx(adreno_gpu))
> >                 gpu_write(gpu, REG_A7XX_GRAS_NC_MODE_CNTL,
> > @@ -586,6 +601,9 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gp=
u)
> >
> >         gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL,
> >                   adreno_gpu->ubwc_config.min_acc_len << 23 | hbb_lo <<=
 21);
> > +
> > +       gpu_write(gpu, REG_A6XX_RBBM_NC_MODE_CNTL,
> > +                 adreno_gpu->ubwc_config.macrotile_mode);
> >  }
> >
> >  static int a6xx_cp_init(struct msm_gpu *gpu)
> > diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/=
msm/adreno/adreno_gpu.h
> > index cff8ce541d2c..b2da660c10c7 100644
> > --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> > @@ -194,9 +194,10 @@ struct adreno_gpu {
> >                 u32 rgb565_predicator;
> >                 u32 uavflagprd_inv;
> >                 u32 min_acc_len;
> > -               u32 ubwc_mode;
> > +               u32 ubwc_swizzle;
> >                 u32 highest_bank_bit;
> >                 u32 amsbc;
> > +               u32 macrotile_mode;
> >         } ubwc_config;
> >
> >         /*
> >
> > --
> > 2.31.1
> >
