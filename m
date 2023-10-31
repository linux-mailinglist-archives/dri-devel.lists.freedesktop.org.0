Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B8667DCD2A
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 13:46:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C923A10E498;
	Tue, 31 Oct 2023 12:46:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83DD710E130;
 Tue, 31 Oct 2023 12:46:42 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-540105dea92so8680017a12.2; 
 Tue, 31 Oct 2023 05:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698756401; x=1699361201; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jKZa5dSJEe2OFosspYgbHn2/m1CBCfZ471gmM0Ox3Zg=;
 b=CUtHVmnPvhXFYeRE5KwyIFcYp8jUFNWHtTO6Yyr672AQmTxKQAxsX6L6Cm8UwDVVW+
 bQhOaO1QaZBqcaxyPjFiPafAohQNzHkQVcEJZksf44fVt9TyNO0rqEUYAQ2QXFovKZPR
 UJETt5SGpjgRCxDpmKGEs4bVso6Bx6uqks8wjqiSCsjltlHWPaiCIi7/fWAZ73Eh1iEC
 otbzWbyY31o+ZlBav2KPOvG8j4cuORJP8gBCwIhKiJN8PUQzGTyIqyYA1TdcPjf/2jm7
 ISjnOw4pV9cG9F8YGBC59NJ/VC0bD2pC5sKbl4VEnUwM97TXqoZtO8vcXTXIuiDma98B
 8LTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698756401; x=1699361201;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jKZa5dSJEe2OFosspYgbHn2/m1CBCfZ471gmM0Ox3Zg=;
 b=ZtMg2/hM5xryHK0NU7P1lvGmoRBOZOJf4T7k5ZB6MbmaMyvjmsl6fG7PUgEjjCc7pP
 4ekPVrzHt6MOkeGpfDqzvjpmKe9m79RB3Le1mJBFegZG3M9XkaKiEq+FrZ+p8v1irxHn
 bOOc2nypjGaxp5t+VJgH6p/GH7ajrUDUQ3wzM0tioTZnPx2QxqkEFtPr30m6J2w56JEd
 8uiGmullFGGronYUUarsBasRCJNunLnqNj5s034cKBsO/SNZZtNsI/D27j/T2g9ih9kA
 gfe9ryBAZD+oeHB87/CJ60Sl0o3bGQcQfMkqG5oITUi9vtYIO7ke0ojVfkVACZyOjIc4
 scEA==
X-Gm-Message-State: AOJu0YxdFmLTMtXr0lsqDsWSiOZ+zf3S+wfSf/BcSBhMUo6O/I34rvjn
 GL16b1udKxbv1t/ATat779WnuNPA+w80cbsORos=
X-Google-Smtp-Source: AGHT+IFgPFGHLLpf2/dBd95JgtG0UZj1klCPTGGWfafBuQ68PFpBgQ0Bbk2zw5laV2W44PGxbqXvObQrh8RUIMJRs9g=
X-Received: by 2002:aa7:d3c1:0:b0:53f:bd95:d963 with SMTP id
 o1-20020aa7d3c1000000b0053fbd95d963mr9235785edr.32.1698756400670; Tue, 31 Oct
 2023 05:46:40 -0700 (PDT)
MIME-Version: 1.0
References: <20231030-sc8280xp-dpu-safe-lut-v1-1-6d485d7b428f@quicinc.com>
 <20231031081931.GC11778@thinkpad>
In-Reply-To: <20231031081931.GC11778@thinkpad>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 31 Oct 2023 05:46:28 -0700
Message-ID: <CAF6AEGv4w=a8kpkM63OU8DJ_nND5acG6nNuz8r4qnAT8Acyw+g@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: Add missing safe_lut_tbl in sc8280xp catalog
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
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
 Doug Anderson <dianders@chromium.org>,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, stable@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Johan Hovold <johan@kernel.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 31, 2023 at 1:19=E2=80=AFAM Manivannan Sadhasivam
<manivannan.sadhasivam@linaro.org> wrote:
>
> On Mon, Oct 30, 2023 at 04:23:20PM -0700, Bjorn Andersson wrote:
> > During USB transfers on the SC8280XP __arm_smmu_tlb_sync() is seen to
> > typically take 1-2ms to complete. As expected this results in poor
> > performance, something that has been mitigated by proposing running the
> > iommu in non-strict mode (boot with iommu.strict=3D0).
> >
> > This turns out to be related to the SAFE logic, and programming the QOS
> > SAFE values in the DPU (per suggestion from Rob and Doug) reduces the
> > TLB sync time to below 10us, which means significant less time spent
> > with interrupts disabled and a significant boost in throughput.
> >
> > Fixes: 4a352c2fc15a ("drm/msm/dpu: Introduce SC8280XP")
> > Cc: stable@vger.kernel.org
> > Suggested-by: Doug Anderson <dianders@chromium.org>
> > Suggested-by: Rob Clark <robdclark@chromium.org>
> > Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b=
/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> > index 1ccd1edd693c..4c0528794e7a 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> > @@ -406,6 +406,7 @@ static const struct dpu_perf_cfg sc8280xp_perf_data=
 =3D {
> >       .min_llcc_ib =3D 0,
> >       .min_dram_ib =3D 800000,
> >       .danger_lut_tbl =3D {0xf, 0xffff, 0x0},
> > +     .safe_lut_tbl =3D {0xfe00, 0xfe00, 0xffff},
>
> What does these values represent? And how SAFE is to override the default=
 QoS
> values?
>
> I'm not too familiar with the MSM DRM driver, so please excuse my ignoran=
ce.

for realtime dma (like scanout) there is a sort of "safe" signal from
the dma master to the smmu to indicate when it has enough data
buffered for it to be safe to do tlbinv without risking underflow.
When things aren't "safe" the smmu will stall tlbinv.  This is just
configuring the thresholds for the "safe" signal.

BR,
-R

> - Mani
>
> >       .qos_lut_tbl =3D {
> >               {.nentry =3D ARRAY_SIZE(sc8180x_qos_linear),
> >               .entries =3D sc8180x_qos_linear
> >
> > ---
> > base-commit: c503e3eec382ac708ee7adf874add37b77c5d312
> > change-id: 20231030-sc8280xp-dpu-safe-lut-9769027b8452
> >
> > Best regards,
> > --
> > Bjorn Andersson <quic_bjorande@quicinc.com>
> >
>
> --
> =E0=AE=AE=E0=AE=A3=E0=AE=BF=E0=AE=B5=E0=AE=A3=E0=AF=8D=E0=AE=A3=E0=AE=A9=
=E0=AF=8D =E0=AE=9A=E0=AE=A4=E0=AE=BE=E0=AE=9A=E0=AE=BF=E0=AE=B5=E0=AE=AE=
=E0=AF=8D
