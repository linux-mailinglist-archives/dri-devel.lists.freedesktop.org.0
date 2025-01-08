Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF2AA06599
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 20:51:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACF3E10E918;
	Wed,  8 Jan 2025 19:51:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SFNnx2h2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com
 [209.85.222.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8B3F10E128;
 Wed,  8 Jan 2025 19:51:52 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id
 af79cd13be357-7b6f95d2eafso16488685a.3; 
 Wed, 08 Jan 2025 11:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736365852; x=1736970652; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CQjSIB+SpA8Xj2XbGtqFG9O6snqi8JpWaZDvK39g3CU=;
 b=SFNnx2h2aU6T+cZGUcQGjQ+4A8tzY+T7MQ8O4Vgih6fzXAyAJ6XbLPE19o3YFK+Vq/
 ZUdnGcxAGGHwFiQND8XkOWZCyCDV6PoQOd1sEWNkuhHVc6NqvnBBAx7NxefOIFQih3e/
 WdivA4ejRu21BP8U3NdCOAHO5QfJSo6+jS9kgLNIs8pd79CpNOWMbfUJFnJ82M9sv90l
 AfaR7zBZNRyYEdmidufCFifAP/uJJjyrg0YmsaB7bubAECUA/nunR7TiEfpwhJ7XHh5G
 5gm2VkcA3nhQj/sJO3hb704frd+KStNdTo6GyI/BRZ3D9Z/aJDaSKJjBYokhR0GzltbC
 Jq4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736365852; x=1736970652;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CQjSIB+SpA8Xj2XbGtqFG9O6snqi8JpWaZDvK39g3CU=;
 b=hmM47WlD1RR/awDnnAhUrqZvU5TM3cK3QQ5OA0Jb8Xs+WbkInEuPmm7mdZTfDVhnwa
 gLJpRqrybEib5DHrC6p5ItSL/4QHP2qTbJoh/ZCRESIQroaux9Jp9yQFR5tfBRrzx9Az
 Qe8WvwUwSwDW0jX85dnq44feWpyEmEvbtRfjrIhgi5o+CNekpNOkbR6Z4zMMXZ752AEq
 7E5dNDDHnb2+jFUn3P5p+bQMsNxh4FHP2jcbT/UYHnSsMQ4CdUsG8zS8BTcTa5335HUn
 MxZQvMld7ew8mvqtCVVl9XEGpr81aGcWIvZz99jtxyIgNk5+h0/0og+LKQkPo/KheVNx
 8o2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgfMi6xb5DhnfzBkNWTa+3Tk+aIe/U9x4tsc9pR1rjf6lHAik2KvP+U4PbidxjAXviGidRMZleq4U=@lists.freedesktop.org,
 AJvYcCVBAKZ655XaH6t5pHYXWiTCenBicF7tvx4zDVQlIEqzI3SnQPk38Lr0QCbHYdkYej5J/hq2hQtNBXRH@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwxNmtD9z5UAUXIFJ2jXT3wlKecJGShK3RhSCutnfYwIFbVLhNQ
 XfUzsso3hi9tLh5IL4nrLIQP058w9DsDA16OCaNptFBqFiXyD6+B+jrlbg31mQ79NbjkNfkZOfM
 MpQZYfKmPkZ7stN44Ub8OSRaP5Aik3KCh6jM=
X-Gm-Gg: ASbGncsMsBsxe0yP3q1XhKda48bBAt89DmWkdGhMINjyI03pc6G7Cbmr6YwzC/Jw+yl
 Ze2odkK/u2naxlVVFsq4imzZo+hUXQghS1/rJ5oFx9gtVbaeal5O9TWdc9I7jl+/Yu6MIp/A=
X-Google-Smtp-Source: AGHT+IFOYu2zI0eI/ZEBSXvRujyJw5sTg9SU8LM20UymNfmWYiLeo3rutyCnE9H4ti6sd4aPiSqdNSeAmK4V7RQnZSM=
X-Received: by 2002:a05:6871:d106:b0:296:e6d9:a2e1 with SMTP id
 586e51a60fabf-2aa066af572mr1855075fac.11.1736356525229; Wed, 08 Jan 2025
 09:15:25 -0800 (PST)
MIME-Version: 1.0
References: <20241231-gpu-acd-v3-0-3ba73660e9ca@quicinc.com>
 <CAO_MupJ21kOQPZG_=87mC-fQKmL=-K9AgOjriWR=wXCKU0897w@mail.gmail.com>
 <CAF6AEGvYFL9Q88c727eFrTgDb+FvnPm2d=6niLu80DM1DJdm5g@mail.gmail.com>
 <20250106195539.tcta6yoyijfrgzhh@hu-akhilpo-hyd.qualcomm.com>
In-Reply-To: <20250106195539.tcta6yoyijfrgzhh@hu-akhilpo-hyd.qualcomm.com>
From: Maya Matuszczyk <maccraft123mc@gmail.com>
Date: Wed, 8 Jan 2025 18:14:46 +0100
X-Gm-Features: AbW1kvZoIa1SIG2WBthB7htvGPGQe3KsLSA-x7LZ0U_Ys8L5v4xzXxkp0ix07rU
Message-ID: <CAO_MupJZ+eGUNGXSd7jwEaC6DeZt60LNW_V_38-Jcpmbiy_9Bg@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] Support for GPU ACD feature on Adreno X1-85
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Viresh Kumar <vireshk@kernel.org>,
 Nishanth Menon <nm@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org
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

pon., 6 sty 2025 o 20:55 Akhil P Oommen <quic_akhilpo@quicinc.com> napisa=
=C5=82(a):
>
> On Sun, Jan 05, 2025 at 04:55:42PM -0800, Rob Clark wrote:
> > fwiw, I did see some perf boost (was mainly looking at gfxbench aztec
> > ruins vk high/normal, and also a separate mesa MR that fixes some LRZ
> > issues with turnip, so I don't remember how much boost was related to
> > which offhand)..  I've not seen corruption yet (gnome-shell / f41),
> > although what you describe sounds cache-line(ish) and could be just
> > timing related.  You could limit max freq via
> > /sys/devices/platform/soc@0/3d00000.gpu/devfreq/3d00000.gpu/max_freq
> > and see if that "fixes" things.  I don't really expect this patchset
> > to introduce these sorts of issues, but maybe the increased freq
> > exposes some preexisting conditions?
>
> Actually, ACD related issues may show up as weird glitches in HW because
> of HW spec violation. These issues are very very rare in production
> devices though. And the behavior may vary between devices due to silicon
> variations.
>
> @Maya, thanks for testing this series. Sorry, one of my patch is buggy.
> Could you please apply the below diff and check once?
>
> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> @@ -725,7 +725,7 @@ static int a6xx_hfi_enable_acd(struct a6xx_gmu *gmu)
>         }
>
>         /* Send ACD table to GMU */
> -       ret =3D a6xx_hfi_send_msg(gmu, HFI_H2F_MSG_ACD, &msg, sizeof(msg)=
, NULL, 0);
> +       ret =3D a6xx_hfi_send_msg(gmu, HFI_H2F_MSG_ACD, acd_table, sizeof=
(*acd_table), NULL, 0);
>         if (ret) {
>                 DRM_DEV_ERROR(gmu->dev, "Unable to ACD table (%d)\n", ret=
);
>                 return ret;
>
> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> @@ -109,7 +109,7 @@ static int a6xx_hfi_wait_for_ack(struct a6xx_gmu *gmu=
, u32 id, u32 seqnum,
>
>         /* Wait for a response */
>         ret =3D gmu_poll_timeout(gmu, REG_A6XX_GMU_GMU2HOST_INTR_INFO, va=
l,
> -               val & A6XX_GMU_GMU2HOST_INTR_INFO_MSGQ, 100, 5000);
> +               val & A6XX_GMU_GMU2HOST_INTR_INFO_MSGQ, 100, 1000000);
>
>         if (ret) {
>                 DRM_DEV_ERROR(gmu->dev,
>

With this change on top of this patch series I'm seeing an increase in
vkmark scores roughly in line with increased frequency.



>
> -Akhil
> >
> > BR,
> > -R
> >
> > On Sun, Jan 5, 2025 at 9:56=E2=80=AFAM Maya Matuszczyk <maccraft123mc@g=
mail.com> wrote:
> > >
> > > Hi,
> > > I've applied this series for testing, and I've no performance
> > > increase, and some screen corruption, there's some lines(mostly white=
)
> > > on my yoga slim 7x that appear on the bottom of the screen. When I
> > > move my cursor in swaywm over it, the lines get occluded by the curso=
r
> > > and screenshots don't show these lines.
> > >
> > > Best Regards,
> > > Maya Matuszczyk
> > >
> > > pon., 30 gru 2024 o 22:11 Akhil P Oommen <quic_akhilpo@quicinc.com> n=
apisa=C5=82(a):
> > > >
> > > > This series adds support for ACD feature for Adreno GPU which helps=
 to
> > > > lower the power consumption on GX rail and also sometimes is a requ=
irement
> > > > to enable higher GPU frequencies. At high level, following are the
> > > > sequences required for ACD feature:
> > > >         1. Identify the ACD level data for each regulator corner
> > > >         2. Send a message to AOSS to switch voltage plan
> > > >         3. Send a table with ACD level information to GMU during ev=
ery
> > > >         gpu wake up
> > > >
> > > > For (1), it is better to keep ACD level data in devicetree because =
this
> > > > value depends on the process node, voltage margins etc which are
> > > > chipset specific. For instance, same GPU HW IP on a different chips=
et
> > > > would have a different set of values. So, a new schema which extend=
s
> > > > opp-v2 is created to add a new property called "qcom,opp-acd-level"=
.
> > > >
> > > > ACD support is dynamically detected based on the presence of
> > > > "qcom,opp-acd-level" property in GPU's opp table. Also, qmp node sh=
ould be
> > > > present under GMU node in devicetree for communication with AOSS.
> > > >
> > > > The devicetree patch in this series adds the acd-level data for X1-=
85
> > > > GPU present in Snapdragon X1 Elite chipset.
> > > >
> > > > The last two devicetree patches are for Bjorn and all the rest for
> > > > Rob Clark.
> > > >
> > > > ---
> > > > Changes in v3:
> > > > - Rebased on top of v6.13-rc4 since X1E doesn't boot properly with =
msm-next
> > > > - Update patternProperties regex (Krzysztof)
> > > > - Update MAINTAINERS file include the new opp-v2-qcom-adreno.yaml
> > > > - Update the new dt properties' description
> > > > - Do not move qmp_get() to acd probe (Konrad)
> > > > - New patches: patch#2, #3 and #6
> > > > - Link to v2: https://lore.kernel.org/r/20241021-gpu-acd-v2-0-9c25a=
62803bc@quicinc.com
> > > >
> > > > Changes in v2:
> > > > - Removed RFC tag for the series
> > > > - Improve documentation for the new dt bindings (Krzysztof)
> > > > - Add fallback compatible string for opp-table (Krzysztof)
> > > > - Link to v1: https://lore.kernel.org/r/20241012-gpu-acd-v1-0-1e5e9=
1aa95b6@quicinc.com
> > > >
> > > > ---
> > > > Akhil P Oommen (6):
> > > >       drm/msm/adreno: Add support for ACD
> > > >       drm/msm: a6x: Rework qmp_get() error handling
> > > >       drm/msm/adreno: Add module param to disable ACD
> > > >       dt-bindings: opp: Add v2-qcom-adreno vendor bindings
> > > >       arm64: dts: qcom: x1e80100: Add ACD levels for GPU
> > > >       arm64: dts: qcom: x1e80100: Add OPPs up to Turbo L3 for GPU
> > > >
> > > >  .../bindings/opp/opp-v2-qcom-adreno.yaml           | 97 ++++++++++=
++++++++++++
> > > >  MAINTAINERS                                        |  1 +
> > > >  arch/arm64/boot/dts/qcom/x1e80100.dtsi             | 25 +++++-
> > > >  drivers/gpu/drm/msm/adreno/a6xx_gmu.c              | 96 ++++++++++=
++++++++---
> > > >  drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |  1 +
> > > >  drivers/gpu/drm/msm/adreno/a6xx_hfi.c              | 36 ++++++++
> > > >  drivers/gpu/drm/msm/adreno/a6xx_hfi.h              | 21 +++++
> > > >  drivers/gpu/drm/msm/adreno/adreno_device.c         |  4 +
> > > >  8 files changed, 268 insertions(+), 13 deletions(-)
> > > > ---
> > > > base-commit: dbfac60febfa806abb2d384cb6441e77335d2799
> > > > change-id: 20240724-gpu-acd-6c1dc5dcf516
> > > >
> > > > Best regards,
> > > > --
> > > > Akhil P Oommen <quic_akhilpo@quicinc.com>
> > > >
> > > >
