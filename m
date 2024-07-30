Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC40494236E
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 01:35:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82E0010E364;
	Tue, 30 Jul 2024 23:35:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QCcP3vkw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15F9E10E364
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 23:35:12 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-67b709024bfso41998747b3.3
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Jul 2024 16:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722382511; x=1722987311; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=t18N7TxwywgKr/21lDDD70XKNrpMULBuVi+5i1r6AJE=;
 b=QCcP3vkwCc0lQfWO86VFMGAj8FGP5ZTCEzm/p1nFelIEU1AGUkyxQwLdaS6y5GKmIA
 3ivt+HvsHSQFQgt7A31u1Uc5KM1LiTHyFkIxxj9tgF2iwZNTadN8G8Xu4v/JVoB9zgRb
 Ls/YgcL23DSN/VF+u2f7uU8kjJ49y6KM3SAp5bQivZJZlBU5Fd3ftQhadIj/JD2Yude4
 7jilp80+ii37OTcWElXf+FF1I2zh7KIHCx/HzuOu2cPDpwCJdONGMYA+CN4iYCVKeprI
 zqQS/lXwIJ83LAxMK4r7NV4Mn2/xnoJJ43WqAqzTtSz1NFzvFI0hZpoqJi9/mJzgveY/
 T1cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722382511; x=1722987311;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t18N7TxwywgKr/21lDDD70XKNrpMULBuVi+5i1r6AJE=;
 b=UwvPwNWcTrhgrrePqUyRXl1oSbhuacIskw9AifQCb8ymsxrLLQ1k1Ckkq3RAISJQpu
 Z1ReHufplCAdxb8z2QemeXI1AfN0fT/AnctzzR3hHvETuBX6JSH+uoiRe4J8jek0BTyw
 X84on5w6S7yLlN8d+K3mVVYl/jKoFxTGPEQjMzKirilRVGnBds9PDboQRnGpY2eWr051
 2nl/2NE/orCZhziGD1YNshSzkqek/6p3lqiTanrmsczopyrm/yA1dO6LiIs02Lf02lzt
 AIoHgOrcYGdJTg/+lybrFo6M5kuHVo5zb1XgkY9KMnUq290UJKEOHeueDAm1zmqk8kES
 P6Cw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNYfDddq/VQhNcI+q8lxwrZsrRroFlSMKuhUyETmptUJKfhOF16a2szOiKODiUjCTv2EWRtzQMorVYILMGcV8WQKVny4m4TAVTUz9gGauT
X-Gm-Message-State: AOJu0YzKSlx75AVniBk/5NZvgfrXPRUn6UzE1ql5tvQ7c8oB255qWQEu
 S3kJ8TOmP9+XRD9VlizSMc2zNO03fR4TCsTMKBvCIDuPDlu9ePIL2UyCQEVpj3Nr0D7BLK/RosK
 K4U38tEs0wVvTE5vwNuIupJwNZ0OTd11CTag5uQ==
X-Google-Smtp-Source: AGHT+IF5Qu44QrOZ4VrsYyLpvrmeLZVdMHwBqXOOZMpIBMYFD1xy6BhuFX59kqGp3Tq+s0ubsGow/En+HH7guzdfyGk=
X-Received: by 2002:a0d:fd01:0:b0:63b:c16e:a457 with SMTP id
 00721157ae682-67a069151f6mr132078237b3.13.1722382510997; Tue, 30 Jul 2024
 16:35:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240730195012.2595980-1-quic_abhinavk@quicinc.com>
 <CAA8EJpp0pQ9j6qQbQajUj=qHdYWeiB2nedT0oQhxsGjs3t53CA@mail.gmail.com>
 <Zqlor3Ug70d65rLT@hu-bjorande-lv.qualcomm.com>
In-Reply-To: <Zqlor3Ug70d65rLT@hu-bjorande-lv.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 31 Jul 2024 02:34:58 +0300
Message-ID: <CAA8EJpok+M3xYqtKDM=N=+fc778ipUdYcnNBLLEXMkpNjjy5rQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dp: enable widebus on all relevant chipsets
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Abel Vesa <abel.vesa@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org, 
 quic_jesszhan@quicinc.com, swboyd@chromium.org, dianders@chromium.org, 
 andersson@kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org
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

On Wed, 31 Jul 2024 at 01:27, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
>
> On Tue, Jul 30, 2024 at 11:58:19PM +0300, Dmitry Baryshkov wrote:
> > Hi Abhinav,
> >
> > On Tue, 30 Jul 2024 at 22:50, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> > >
> > > Hardware document indicates that widebus is recommended on DP on all
> > > MDSS chipsets starting version 5.x.x and above.
> > >
> > > Follow the guideline and mark widebus support on all relevant
> > > chipsets for DP.
> > >
> > > Fixes: 766f705204a0 ("drm/msm/dp: Remove now unused connector_type from desc")
> > > Fixes: 1b2d98bdd7b7 ("drm/msm/dp: Add DisplayPort controller for SM8650")
> >
> > The issues are present in the following commits. Please consider using
> > them instead:
> >
> > Fixes: 757a2f36ab09 ("drm/msm/dp: enable widebus feature for display port")
> > Fixes: 1b2d98bdd7b7 ("drm/msm/dp: Add DisplayPort controller for SM8650")
> >
>
> But are we really fixing any bugs/issues here? While the docs do
> recommend widebus, we're effectively enabling more harware/features.
>
> Unless there's a strong reason (which I'm not confident that the commit
> message entails), I think we should drop the fixes-tags and just bring
> this to 6.12...

I'm fine either way. I'll check tomorrow if this is required to fix
https://gitlab.freedesktop.org/drm/msm/-/issues/43.



-- 
With best wishes
Dmitry
