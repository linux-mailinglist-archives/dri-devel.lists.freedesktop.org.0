Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFD79C8C00
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 14:41:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ACAC10E34F;
	Thu, 14 Nov 2024 13:41:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qyj6CN5x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com
 [209.85.219.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC87A10E2AC
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 13:41:41 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id
 3f1490d57ef6-e380e4825a9so533732276.3
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 05:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731591701; x=1732196501; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Spz/FLEs6rhZtrhf3mKJTQa4j7O7N/nH4uWZ4nNC+/E=;
 b=qyj6CN5xp+rl8PN5OTD6RDU0EJIwczmWr8Tik0Q1daN6MhO+sm8TKtt6KtXUD2gPVm
 wb2Gfj4RDam/PrH6ZYDvcp0gT2OpKb9Pk+MqulEXQrp/OoKezp33abslweKUyzhB8B8d
 tU6ByqyY6QFdcWd3llqQJCR+MA7TMcNOYmWmxSuOPwvgx1YKenGxGvr/9OCSsHipjVYD
 kdQn8Rmc3VnM1dWjSp71rhTVVM6kJMPEdACshC/8JvTb37aEjLrzu2LD9N9dQgrEShWD
 B0YPbiic1uYqDfEKGmQz5C8AZhFXKkjBgGJG7+lE9r5KSq4v7K94vDer/TtmX15KML+Q
 Ys4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731591701; x=1732196501;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Spz/FLEs6rhZtrhf3mKJTQa4j7O7N/nH4uWZ4nNC+/E=;
 b=URtojk30PdEyANz2Lb9jKqrz9OirczrOGtepDvFdnDOqJeYZB+Ie/ssQR6nsiE2zIW
 8Deh+ejMxBx+xQLsDr6wPViPt5RLqAFFyRxJG+B+le+GNxrZ5cgddI76MkXs9CLHBHgt
 MURtJTyX08K3ByFl08hQCmrhsqTH6a7BJfAMTy2jzI3uc7yXFsqwYSz1mWK2b3CAfqJ6
 iL+A7D9Zhi2lsWbcFNc8VyKHngkaDooPvIuabs6JDPnu6nYVYrqmEn1ceJb0TZP+Rxto
 iV/+EfTqVYGv2CZXlNYY5zv/pi95WJu/Kw2YQ1/nLZ6e+WL8wtBcSir/G1ytd/tTtL1Y
 5v7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+ihluhbyjD9Kdc1cIdtGBhkyWaub01MOlWvpmBlq0V1Y7UQ+lNFRb5SmUitM7NG94FI3Bl8c8IHo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJEdH2aFmeA4ihPhcEBaMSAMbMqpHXKzACfbaHZiK6MzXMYpIu
 yReuywXJVDo3dXblQKfn6Cj16y7JZVvJqEHpMhQwW1sN8PKtkMXB5zq1pbGQJB0av9HyQa+igXE
 h6yMbj1qtHxq5eX2abJFCLdEzepKh2Hrw0MSKMQ==
X-Google-Smtp-Source: AGHT+IE9OBhWPTuVNohC5WRAGntCMa66vHJnC0GsF9hH0ovM6xYCWXHrFVChjjSq9tv9jWS0r9j8CiJ3oX8Geq2uOGI=
X-Received: by 2002:a05:6902:2c02:b0:e38:1364:7075 with SMTP id
 3f1490d57ef6-e381364718fmr1343941276.29.1731591700646; Thu, 14 Nov 2024
 05:41:40 -0800 (PST)
MIME-Version: 1.0
References: <20241113-add-display-support-for-qcs615-platform-v2-0-2873eb6fb869@quicinc.com>
 <20241113-add-display-support-for-qcs615-platform-v2-6-2873eb6fb869@quicinc.com>
 <404f006b-46e5-44db-9f22-ec2139468ecc@oss.qualcomm.com>
In-Reply-To: <404f006b-46e5-44db-9f22-ec2139468ecc@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 14 Nov 2024 15:41:29 +0200
Message-ID: <CAA8EJpqQSp5eXoKHHEchKpGq9ZpU0k0RDASA8T+t+SENNx+_fQ@mail.gmail.com>
Subject: Re: [PATCH v2 6/9] drm/msm/dsi: Add support for QCS615
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Fange Zhang <quic_fangez@quicinc.com>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Li Liu <quic_lliu6@quicinc.com>, 
 Xiangxu Yin <quic_xiangxuy@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 14 Nov 2024 at 15:32, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 13.11.2024 12:51 PM, Fange Zhang wrote:
> > From: Li Liu <quic_lliu6@quicinc.com>
> >
> > Add support for DSI 2.3.1 (block used on QCS615).
> > Add phy configuration for QCS615
> >
> > Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
> > Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
> > ---
> >  drivers/gpu/drm/msm/dsi/dsi_cfg.c          | 17 +++++++++++++++++
> >  drivers/gpu/drm/msm/dsi/dsi_cfg.h          |  1 +
> >  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c      |  2 ++
> >  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h      |  1 +
> >  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 21 +++++++++++++++++++++
> >  5 files changed, 42 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> > index 10ba7d153d1cfc9015f527c911c4658558f6e29e..edbe50305d6e85fb615afa41f3b0db664d2f4413 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> > +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> > @@ -221,6 +221,21 @@ static const struct msm_dsi_config sc7280_dsi_cfg = {
> >       },
> >  };
> >
> > +static const struct regulator_bulk_data qcs615_dsi_regulators[] = {
> > +     { .supply = "vdda", .init_load_uA = 21800 },
> > +};
>
> I believe refgen is also present here and you can reuse dsi_v2_4_regulators

This was in feedback for v1... And the patch should be further split,
having DSI and PHY parts separately.

-- 
With best wishes
Dmitry
