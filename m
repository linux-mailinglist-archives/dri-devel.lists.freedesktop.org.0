Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE609A0670A
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 22:16:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E46F10E944;
	Wed,  8 Jan 2025 21:16:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UEEQYeky";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com
 [209.85.161.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2818710E948;
 Wed,  8 Jan 2025 21:16:13 +0000 (UTC)
Received: by mail-oo1-f54.google.com with SMTP id
 006d021491bc7-5f31f8f4062so135125eaf.3; 
 Wed, 08 Jan 2025 13:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736370912; x=1736975712; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rMIhmiSEfVJ+BWqA4YgIxRvWxMlKC6xy2Wsp+SXaK4A=;
 b=UEEQYekyS8yCNnZinMtPJ49UY/iNqJzOEep0k7Swq1p+ueFvJK8040Ff5VlEoBvtgY
 q5YLCRHj1e0tEHCLtx9HXe4t/yhDZqM0yYtyYely4t2LPEePZj0cDlrgi1EETvV6soD7
 0NbVh0hN5t9PlnIF/zeBLN1l25mLr7RBnJNMim0l6s6FErSbVz33EgkmRLNWiCHPhf5z
 mD46QFDAS44enN4Fpkg5sazGJnvZstSDZBiw21i5e0Oka6ppV3vPME+UvtbvqcgLfuUL
 keVgitjNZ3oIfh7Geij5ztW5i1lKXM2MQOKyLxjc8EXEKvTgHohYN7918kJMSZZH79tT
 59Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736370912; x=1736975712;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rMIhmiSEfVJ+BWqA4YgIxRvWxMlKC6xy2Wsp+SXaK4A=;
 b=i/Bc0oVuL9CuHC2sD6vJ7ecsCj5TvEmMmF0fPEQ5J1YMoLARu8/y4aRiBvrBC9GXtS
 4obi2CK3v/0JxzQtz8xYpmcaop6uzoL4Ug/wXxEp0zmK5t8mt8f7Z+A5dmRj0ZrWdar8
 njoflydeB99g2vsWsh65I9LMBYN8HffGyt3k1wckJwD75oXKlwoi7j/uYBGl81PEMQ43
 7AMDUF89ao2oTXi0FkaV8vueuVH1miOw9Or+pUd8AJt1Ztei6SfoxXB25zeJuR+e6Mn7
 iI+Q//nfgbTj+71BxH8WQNudCwfw9OhsEt3hWnB8r13Z6PpTUoKhwROGY9fwCBOizl2+
 U/RQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEwg8IY089AgDh3x9HJaQian2AftUeI71qTsLSEr6tajhTu0o1iS3OV0fAFtZeCd7DilXFKG7/1PA=@lists.freedesktop.org,
 AJvYcCX6HtcSzEob0IvfmmPqO73kKuVfLYYAyYdyJa5tt/N245sikF5kH8BIAamzUE9inCOCeQ1Dw6J7YCW7@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzlzWFxt8842ZY2UvgJjNL0h/HPNd4lewPH8uEwGSG/xRrS3dVL
 3PE8Y0M69ciICJS6r54b48WrLApdH6/BXBr51zO7WBNJcT1he/kPGBT4XV0B3B3MpXIMht8u1hk
 YipYS2UrW5dc2acly7WvygAiB/wo=
X-Gm-Gg: ASbGncvk0F3lai644SZX4HxUQUbAcYcyFjgmLV7LYgwiIdNm60jhrt07xd1U5k/pbdc
 LYHx82qQw1RsTCa+wONb16xzVemh5kDVN0ITvUXhoZr5Blv44AKOs/Oxow1RRnyxitkmXq0D7
X-Google-Smtp-Source: AGHT+IHlXxeBVrwNiRJpStkRv3Fwe/nP4ij3BlZqHQWN7ErX2VOVjegnWYzp4FJ/MfeSVqZWzL+ObDp0S7Fu593f4Sk=
X-Received: by 2002:a05:6871:a110:b0:29e:7067:4eac with SMTP id
 586e51a60fabf-2aa067199b7mr2450431fac.23.1736370912440; Wed, 08 Jan 2025
 13:15:12 -0800 (PST)
MIME-Version: 1.0
References: <20250109-gpu-acd-v4-0-08a5efaf4a23@quicinc.com>
In-Reply-To: <20250109-gpu-acd-v4-0-08a5efaf4a23@quicinc.com>
From: Maya Matuszczyk <maccraft123mc@gmail.com>
Date: Wed, 8 Jan 2025 22:14:36 +0100
X-Gm-Features: AbW1kvYFvW2kP1UkSKXNNDpLZqKRBQo82H7gTNUrdM7cUUo07-UKccvOzF9Au_o
Message-ID: <CAO_Mup+bedwaZadYitd9OufghQbmseE-s1RBS3_jEnLw2fS_7w@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] Support for GPU ACD feature on Adreno X1-85
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
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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

Thanks,

Tested-by: Maya Matuszczyk <maccraft123mc@gmail.com>

=C5=9Br., 8 sty 2025 o 21:40 Akhil P Oommen <quic_akhilpo@quicinc.com> napi=
sa=C5=82(a):
>
> This series adds support for ACD feature for Adreno GPU which helps to
> lower the power consumption on GX rail and also sometimes is a requiremen=
t
> to enable higher GPU frequencies. At high level, following are the
> sequences required for ACD feature:
>         1. Identify the ACD level data for each regulator corner
>         2. Send a message to AOSS to switch voltage plan
>         3. Send a table with ACD level information to GMU during every
>         gpu wake up
>
> For (1), it is better to keep ACD level data in devicetree because this
> value depends on the process node, voltage margins etc which are
> chipset specific. For instance, same GPU HW IP on a different chipset
> would have a different set of values. So, a new schema which extends
> opp-v2 is created to add a new property called "qcom,opp-acd-level".
>
> ACD support is dynamically detected based on the presence of
> "qcom,opp-acd-level" property in GPU's opp table. Also, qmp node should b=
e
> present under GMU node in devicetree for communication with AOSS.
>
> The devicetree patch in this series adds the acd-level data for X1-85
> GPU present in Snapdragon X1 Elite chipset.
>
> The last two devicetree patches are for Bjorn and all the rest for
> Rob Clark.
>
> ---
> Changes in v4:
> - Send correct acd data via hfi (Neil)
> - Fix dt-bindings error
> - Fix IB vote for the 1.1Ghz OPP
> - New patch#2 to fix the HFI timeout error seen when ACD is enabled
> - Link to v3: https://lore.kernel.org/r/20241231-gpu-acd-v3-0-3ba73660e9c=
a@quicinc.com
>
> Changes in v3:
> - Rebased on top of v6.13-rc4 since X1E doesn't boot properly with msm-ne=
xt
> - Update patternProperties regex (Krzysztof)
> - Update MAINTAINERS file include the new opp-v2-qcom-adreno.yaml
> - Update the new dt properties' description
> - Do not move qmp_get() to acd probe (Konrad)
> - New patches: patch#2, #3 and #6
> - Link to v2: https://lore.kernel.org/r/20241021-gpu-acd-v2-0-9c25a62803b=
c@quicinc.com
>
> Changes in v2:
> - Removed RFC tag for the series
> - Improve documentation for the new dt bindings (Krzysztof)
> - Add fallback compatible string for opp-table (Krzysztof)
> - Link to v1: https://lore.kernel.org/r/20241012-gpu-acd-v1-0-1e5e91aa95b=
6@quicinc.com
>
> ---
> Akhil P Oommen (7):
>       drm/msm/adreno: Add support for ACD
>       drm/msm/a6xx: Increase HFI response timeout
>       drm/msm: a6x: Rework qmp_get() error handling
>       drm/msm/adreno: Add module param to disable ACD
>       dt-bindings: opp: Add v2-qcom-adreno vendor bindings
>       arm64: dts: qcom: x1e80100: Add ACD levels for GPU
>       arm64: dts: qcom: x1e80100: Add OPPs up to Turbo L3 for GPU
>
>  .../bindings/opp/opp-v2-qcom-adreno.yaml           | 97 ++++++++++++++++=
++++++
>  MAINTAINERS                                        |  1 +
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi             | 27 +++++-
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c              | 96 ++++++++++++++++=
++---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |  1 +
>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c              | 38 ++++++++-
>  drivers/gpu/drm/msm/adreno/a6xx_hfi.h              | 21 +++++
>  drivers/gpu/drm/msm/adreno/adreno_device.c         |  4 +
>  8 files changed, 270 insertions(+), 15 deletions(-)
> ---
> base-commit: dbfac60febfa806abb2d384cb6441e77335d2799
> change-id: 20240724-gpu-acd-6c1dc5dcf516
>
> Best regards,
> --
> Akhil P Oommen <quic_akhilpo@quicinc.com>
>
