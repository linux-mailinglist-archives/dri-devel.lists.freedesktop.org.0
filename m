Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27340A01CEE
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 01:57:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2608D10E145;
	Mon,  6 Jan 2025 00:56:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HzEpbPC8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com
 [209.85.166.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DD5410E145;
 Mon,  6 Jan 2025 00:56:55 +0000 (UTC)
Received: by mail-il1-f175.google.com with SMTP id
 e9e14a558f8ab-3a8165cfae8so48946055ab.0; 
 Sun, 05 Jan 2025 16:56:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736124955; x=1736729755; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YN6aE+MuJlFK2b44/x4t1iC0A/Dr6QJNJOQ49JRdhBA=;
 b=HzEpbPC8pVy18HVaqkwiZukHg3lygt8rG8Z0HKtIGJxY9RaB8ltCJduTMd/ZdVPuIi
 N1UxwjsEAT8Ktxk46AIFbINnofLpflExgciyXfq4N4wRBn9UqMu8hOXlBid6yP2LLMIw
 c2ADtgc3hLrdxo8DaKMwVUVXkJ2T6f3Q0A5um9IXLotx15JZhmTfL+bbVMtIXB9F/qce
 asFDCGTDvQPkhRn1RVidNmYcpq1MJ0JXaihAGQEZITP9Iq7NycgWLlLY1+3OXIoFl4yA
 FTCb8tzL90mvOy6mZxy2vhRV9olmZiWMqRphdzkUGpaZqA48voCt9TzoqaMR9Hz9eTdu
 vofA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736124955; x=1736729755;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YN6aE+MuJlFK2b44/x4t1iC0A/Dr6QJNJOQ49JRdhBA=;
 b=bmmjn6ypaSEt/lkh8aBMcXrNkXOrhkJ/42LxWkwe7EXdTQh04f5+OzmChBMAhy+El9
 Rw94JlsPI6aXjaJ49RIBnt6NUupjVyOBtTbmuAIT/PUde8skr60XjayT3PDomC0+XSoG
 VIR1kIVmrS7vBPNzvg+cerWj3oblLsKIUMRQ3Qtmq0lAPiZwMhZFyRT8o8mcBZAG6UV+
 2/Xis2bCJUA3W1mwLtAXw5C1NIumnIVQO6qZUz8Gy2gFFX3g12Cj53DzakZ8yLe5QIjp
 wRFa9EsrVO/180rS1gjjm6jNi8bdabAEKPQ9xeb1uKloJJ7GeyuxMzPQjoBASMQI5l19
 UEyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWE2pk4RuiogD7Ax9sf1G+ORL/YRH+Ml+3hb7TS5rh7Yw45l3MHBrndlp6CfDjpDTP033/JsiYlzuw=@lists.freedesktop.org,
 AJvYcCXgzN9fcFSO4cw7KV0VCZcGWWEVWVqQIZRo8jpOGgdb/V3lh1cl+Ralk88EZJT5kEvd+ZVOatYYRu2e@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxFvgilh02Sv2LVrx3kPh6OrWeQR45YNTRxiq8lGgFYARUHKo71
 uE4/w6hi0fHPr1hadwDmNJLs+u4riLbDpvGpQ1joYLvOqXMJ18KjokpWGgYHNYmkmf0qSvF5lbh
 kXylM+NAPJCCODf93WJfDumE1MVg=
X-Gm-Gg: ASbGnctQJbcdM/won7w2q+bEel7kS42G66EY4q+YH12xtth0rq5rYzSrMKG+o5SF+/2
 QwxsjkLLiaUz7UGDxdzJd/18a0DCu6SqvFDyayA==
X-Google-Smtp-Source: AGHT+IHJYmBSxrbrAmecPUQ24zUko4o/O+WMOcCAM1FBbr8iLzQz0Mn6QzWXyUlMFbvBdDMqznBqnwfKE3rr7sF3iOQ=
X-Received: by 2002:a05:6e02:1d0c:b0:3ab:a274:d73 with SMTP id
 e9e14a558f8ab-3c2d2276f0bmr356917355ab.7.1736124954550; Sun, 05 Jan 2025
 16:55:54 -0800 (PST)
MIME-Version: 1.0
References: <20241231-gpu-acd-v3-0-3ba73660e9ca@quicinc.com>
 <CAO_MupJ21kOQPZG_=87mC-fQKmL=-K9AgOjriWR=wXCKU0897w@mail.gmail.com>
In-Reply-To: <CAO_MupJ21kOQPZG_=87mC-fQKmL=-K9AgOjriWR=wXCKU0897w@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Sun, 5 Jan 2025 16:55:42 -0800
Message-ID: <CAF6AEGvYFL9Q88c727eFrTgDb+FvnPm2d=6niLu80DM1DJdm5g@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] Support for GPU ACD feature on Adreno X1-85
To: Maya Matuszczyk <maccraft123mc@gmail.com>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>, 
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

fwiw, I did see some perf boost (was mainly looking at gfxbench aztec
ruins vk high/normal, and also a separate mesa MR that fixes some LRZ
issues with turnip, so I don't remember how much boost was related to
which offhand)..  I've not seen corruption yet (gnome-shell / f41),
although what you describe sounds cache-line(ish) and could be just
timing related.  You could limit max freq via
/sys/devices/platform/soc@0/3d00000.gpu/devfreq/3d00000.gpu/max_freq
and see if that "fixes" things.  I don't really expect this patchset
to introduce these sorts of issues, but maybe the increased freq
exposes some preexisting conditions?

BR,
-R

On Sun, Jan 5, 2025 at 9:56=E2=80=AFAM Maya Matuszczyk <maccraft123mc@gmail=
.com> wrote:
>
> Hi,
> I've applied this series for testing, and I've no performance
> increase, and some screen corruption, there's some lines(mostly white)
> on my yoga slim 7x that appear on the bottom of the screen. When I
> move my cursor in swaywm over it, the lines get occluded by the cursor
> and screenshots don't show these lines.
>
> Best Regards,
> Maya Matuszczyk
>
> pon., 30 gru 2024 o 22:11 Akhil P Oommen <quic_akhilpo@quicinc.com> napis=
a=C5=82(a):
> >
> > This series adds support for ACD feature for Adreno GPU which helps to
> > lower the power consumption on GX rail and also sometimes is a requirem=
ent
> > to enable higher GPU frequencies. At high level, following are the
> > sequences required for ACD feature:
> >         1. Identify the ACD level data for each regulator corner
> >         2. Send a message to AOSS to switch voltage plan
> >         3. Send a table with ACD level information to GMU during every
> >         gpu wake up
> >
> > For (1), it is better to keep ACD level data in devicetree because this
> > value depends on the process node, voltage margins etc which are
> > chipset specific. For instance, same GPU HW IP on a different chipset
> > would have a different set of values. So, a new schema which extends
> > opp-v2 is created to add a new property called "qcom,opp-acd-level".
> >
> > ACD support is dynamically detected based on the presence of
> > "qcom,opp-acd-level" property in GPU's opp table. Also, qmp node should=
 be
> > present under GMU node in devicetree for communication with AOSS.
> >
> > The devicetree patch in this series adds the acd-level data for X1-85
> > GPU present in Snapdragon X1 Elite chipset.
> >
> > The last two devicetree patches are for Bjorn and all the rest for
> > Rob Clark.
> >
> > ---
> > Changes in v3:
> > - Rebased on top of v6.13-rc4 since X1E doesn't boot properly with msm-=
next
> > - Update patternProperties regex (Krzysztof)
> > - Update MAINTAINERS file include the new opp-v2-qcom-adreno.yaml
> > - Update the new dt properties' description
> > - Do not move qmp_get() to acd probe (Konrad)
> > - New patches: patch#2, #3 and #6
> > - Link to v2: https://lore.kernel.org/r/20241021-gpu-acd-v2-0-9c25a6280=
3bc@quicinc.com
> >
> > Changes in v2:
> > - Removed RFC tag for the series
> > - Improve documentation for the new dt bindings (Krzysztof)
> > - Add fallback compatible string for opp-table (Krzysztof)
> > - Link to v1: https://lore.kernel.org/r/20241012-gpu-acd-v1-0-1e5e91aa9=
5b6@quicinc.com
> >
> > ---
> > Akhil P Oommen (6):
> >       drm/msm/adreno: Add support for ACD
> >       drm/msm: a6x: Rework qmp_get() error handling
> >       drm/msm/adreno: Add module param to disable ACD
> >       dt-bindings: opp: Add v2-qcom-adreno vendor bindings
> >       arm64: dts: qcom: x1e80100: Add ACD levels for GPU
> >       arm64: dts: qcom: x1e80100: Add OPPs up to Turbo L3 for GPU
> >
> >  .../bindings/opp/opp-v2-qcom-adreno.yaml           | 97 ++++++++++++++=
++++++++
> >  MAINTAINERS                                        |  1 +
> >  arch/arm64/boot/dts/qcom/x1e80100.dtsi             | 25 +++++-
> >  drivers/gpu/drm/msm/adreno/a6xx_gmu.c              | 96 ++++++++++++++=
++++---
> >  drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |  1 +
> >  drivers/gpu/drm/msm/adreno/a6xx_hfi.c              | 36 ++++++++
> >  drivers/gpu/drm/msm/adreno/a6xx_hfi.h              | 21 +++++
> >  drivers/gpu/drm/msm/adreno/adreno_device.c         |  4 +
> >  8 files changed, 268 insertions(+), 13 deletions(-)
> > ---
> > base-commit: dbfac60febfa806abb2d384cb6441e77335d2799
> > change-id: 20240724-gpu-acd-6c1dc5dcf516
> >
> > Best regards,
> > --
> > Akhil P Oommen <quic_akhilpo@quicinc.com>
> >
> >
