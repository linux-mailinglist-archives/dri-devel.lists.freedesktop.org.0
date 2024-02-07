Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE17484D281
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 20:59:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FBC910E724;
	Wed,  7 Feb 2024 19:59:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Hr0mnCbH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A30B10E81F
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Feb 2024 19:59:40 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-dc6df28315fso965581276.3
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Feb 2024 11:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707335979; x=1707940779; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GwkfJHLn8/HfkCk/r+wwlW1fJAVG5oLG8A4VHYAkrHI=;
 b=Hr0mnCbHPUNLRTM5u8pMedwqkYyps/8C3I76Z/Q/1rrceMDgMoRfsJRFVsIVOm58uf
 LAgCE+bDMR7lWZwTrWgJBZjAUCsoXaLK6+BCOmyDmJEEOBaXZPZCoCQzZfdHtpvN6z82
 X3z8N1m9DphfxD/ou3F4cPXRVgbomAdoydBKmdMzi58ueIX690gRHb+BtZaznNcF2imq
 IkEbErZDpDi8ht/hSbKgN9YUZ146fQ9dctLsUyT2W/3V61lpzcvdVDkZQIHurA4Uo0ae
 chGdmPwm0oT/UQzAD9IKBzXLcB2LREy4An/eVYbSuT5dCNLOAVaswduLsv0ukRde/4cy
 dXig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707335979; x=1707940779;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GwkfJHLn8/HfkCk/r+wwlW1fJAVG5oLG8A4VHYAkrHI=;
 b=PPTqBTFduV9gbVOcQKg1Fav1huALVlKaHLdJm5wxEwsOgCMnzHLmJJ30VBKfMdfY6d
 j0ryZ9CdjwcT76FWofVuQYvuBZdTC/b93cNwTjUKv6JnuHAZM/XCp4QFfE61OI2a00Sk
 6RQYTaIcevdkJ5P9tO0QmiGGyM29FB5Cv0oj3piJrrocAgYnpkpJzorb2WLedozvvadJ
 +cH91wynUwg8NmcaJC2vZX4GBHIzcV9E93TUE6nThjzd7r858WImyMKk53yLTbsb4uxb
 voMESv4/laubJ9FFhHozA8kQk6qsp5dev8rcyb2bP7vetOCTzfF9yz1uXBudUTTZVEy4
 mzdw==
X-Gm-Message-State: AOJu0YyrXptUVjcsTtUNQhhCB9dfJ1rusUz4Kl8rJ+Kf8jHI6TyyA/Iq
 JQRZr+BsOwD8YhxwYAj4EYepv0gFPjCBzKvDgKZ9v0mrpfvucBHSTqEqyYFyJPaxkBW1GkTqzKk
 P+dFpp+Vmhb85iq3BhpNY9wVk5b976XEgmy92ew==
X-Google-Smtp-Source: AGHT+IEuEU6FhY/I616wY+eWpvyqJscoEtGa/IwbEkSleqQN6CLz65NvHcecJWfYtSCQAm6B9A1dkykyMc95djTRxCc=
X-Received: by 2002:a5b:c0d:0:b0:dc2:4f96:fc38 with SMTP id
 f13-20020a5b0c0d000000b00dc24f96fc38mr5720301ybq.50.1707335979137; Wed, 07
 Feb 2024 11:59:39 -0800 (PST)
MIME-Version: 1.0
References: <20240106-fd-migrate-mdp5-v3-0-3d2750378063@linaro.org>
 <20240106-fd-migrate-mdp5-v3-1-3d2750378063@linaro.org>
 <89d02d5c-4af1-9f40-483f-1efb39b2a33d@quicinc.com>
In-Reply-To: <89d02d5c-4af1-9f40-483f-1efb39b2a33d@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 7 Feb 2024 21:59:28 +0200
Message-ID: <CAA8EJpro3jVPDAGWdpFiukCHTVif--Y-ZhEw=ir7U3ABsa_qbA@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] drm/msm/mdss: generate MDSS data for MDP5 platforms
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
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

On Wed, 7 Feb 2024 at 20:25, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 1/5/2024 3:34 PM, Dmitry Baryshkov wrote:
> > Older (mdp5) platforms do not use per-SoC compatible strings. Instead
> > they use a single compat entry 'qcom,mdss'. To facilitate migrating
> > these platforms to the DPU driver provide a way to generate the MDSS /
> > UBWC data at runtime, when the DPU driver asks for it.
> >
> > It is not possible to generate this data structure at the probe time,
> > since some platforms might not have MDP_CLK enabled, which makes reading
> > HW_REV register return 0.
> >
>
> I would have expected a crash if clock was not enabled and we tried to
> access the hw_rev register.

No, for all the platforms I tested it returns 0 instead.
However this doesn't make any difference, we don't read the register
in MDP5 case until all clocks are enabled.

>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/msm_mdss.c | 51 ++++++++++++++++++++++++++++++++++++++++++
> >   1 file changed, 51 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> > index 455b2e3a0cdd..566a5dd5b8e8 100644
> > --- a/drivers/gpu/drm/msm/msm_mdss.c
> > +++ b/drivers/gpu/drm/msm/msm_mdss.c
> > @@ -3,6 +3,7 @@
> >    * Copyright (c) 2018, The Linux Foundation
> >    */
> >
> > +#include <linux/bitfield.h>
> >   #include <linux/clk.h>
> >   #include <linux/delay.h>
> >   #include <linux/interconnect.h>
> > @@ -213,6 +214,49 @@ static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss)
> >       }
> >   }
> >
> > +#define MDSS_HW_MAJ_MIN              GENMASK(31, 16)
> > +
> > +#define MDSS_HW_MSM8996              0x1007
> > +#define MDSS_HW_MSM8937              0x100e
> > +#define MDSS_HW_MSM8956              0x1010
>
> This should be 0x100B in the docs I see.

Yes, I mixed MSM8956 and MSM8953 here. The code support the latter one.

>
> > +#define MDSS_HW_MSM8998              0x3000
> > +#define MDSS_HW_SDM660               0x3002
> > +#define MDSS_HW_SDM630               0x3003
> > +
> > +/*
> > + * MDP5 platforms use generic qcom,mdp5 compat string, so we have to generate this data
> > + */
> > +static const struct msm_mdss_data *msm_mdss_generate_mdp5_mdss_data(struct msm_mdss *mdss)
> > +{
> > +     struct msm_mdss_data *data;
> > +     u32 hw_rev;
> > +
> > +     data = devm_kzalloc(mdss->dev, sizeof(*data), GFP_KERNEL);
> > +     if (!data)
> > +             return NULL;
> > +
> > +     hw_rev = readl_relaxed(mdss->mmio + HW_REV);
> > +     hw_rev = FIELD_GET(MDSS_HW_MAJ_MIN, hw_rev);
> > +
> > +     if (hw_rev == MDSS_HW_MSM8996 ||
> > +         hw_rev == MDSS_HW_MSM8937 ||
> > +         hw_rev == MDSS_HW_MSM8956 ||
> > +         hw_rev == MDSS_HW_MSM8998 ||
> > +         hw_rev == MDSS_HW_SDM660 ||
> > +         hw_rev == MDSS_HW_SDM630) {
> > +             data->ubwc_dec_version = UBWC_1_0;
> > +             data->ubwc_enc_version = UBWC_1_0;
> > +     }
> > +
> > +     if (hw_rev == MDSS_HW_MSM8996 ||
> > +         hw_rev == MDSS_HW_MSM8998)
> > +             data->highest_bank_bit = 2;
> > +     else
> > +             data->highest_bank_bit = 1;
> > +
> > +     return data;
> > +}
> > +
> >   const struct msm_mdss_data *msm_mdss_get_mdss_data(struct device *dev)
> >   {
> >       struct msm_mdss *mdss;
> > @@ -222,6 +266,13 @@ const struct msm_mdss_data *msm_mdss_get_mdss_data(struct device *dev)
> >
> >       mdss = dev_get_drvdata(dev);
> >
> > +     /*
> > +      * We could not do it at the probe time, since hw revision register was
> > +      * not readable. Fill data structure now for the MDP5 platforms.
> > +      */
> > +     if (!mdss->mdss_data && mdss->is_mdp5)
> > +             mdss->mdss_data = msm_mdss_generate_mdp5_mdss_data(mdss);
> > +
> >       return mdss->mdss_data;
> >   }
> >
> >



-- 
With best wishes
Dmitry
