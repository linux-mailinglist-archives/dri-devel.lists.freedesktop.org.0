Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD0385F4E6
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 10:46:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7338010E8E0;
	Thu, 22 Feb 2024 09:46:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DyPStr+N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1300F10E8DE
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 09:46:38 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-dcc84ae94c1so7208199276.1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Feb 2024 01:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708595198; x=1709199998; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JrHiV4SbPrNlHGeovFDnwlGAOJlYDpe2wRYcFnz5Qkw=;
 b=DyPStr+Nn9J1y5gvBWtIULlEOd9NARaUX2/kNpV051mcUzlYEJdSeavv/YoXNwpfCu
 hL3JaBPYcyxLwJk6mwZgp68P0Y96YkJP7mbUmKH/ojMxRvyFfW4X72jLX+o0j4vmlse1
 W/H4k36WriZj1BDNsOR5uFY5XdvUNJ9LAyvtBx+Kofxn+Up+GSKBtSW38Gz4yzz4Ki/U
 hj79jKmRO4KtH2vewApVgieA8kHVdSBCGtViNUvGJIg6QBmgu0fCiiasiox+Cwld0sQH
 lh5vaFGBUeP39JO5MNCSPMjqqW7YhjMyseNKYh3w4TmqFrJsbjKZQQY23Mc72dDCUaxE
 CKXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708595198; x=1709199998;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JrHiV4SbPrNlHGeovFDnwlGAOJlYDpe2wRYcFnz5Qkw=;
 b=UnM+aXLqSPh4+fEbN4PKKD4OqyG7uazbpyAWp1lZUODmqkW70NHEZD7pX+00RnANH5
 PG4cr2FOqpe9kFBZq/xJ88bG+6Gjgkfac6RTXLSLRor/OzkiyXZA4UfG9Th8qe/gc+tb
 3GCMzalngdxylS1/y7oJGrzZDzoslLVBu84AOZNPEEZmwFlhoqHpJBC1DtZ5QQ2A5+ey
 ORP4wE59oUek+q4onAURO97IhzX0SACL6QDFwIiQH91EnsTcj6dm8SifVORTA7YmelV7
 LURuK+e4o5sToMxeEWW2zH1e0oYzKLKlUB72pPb6q+AJ3VdZSXM3K6udWBPEyYTYunHw
 Gsdg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVS3It2pXV3a9ighhaWVvRrEQ9paqz9ECXfWZTZ2f5NV/0CQZ+N4WkmMF+6FIfRNEj0s9pr++nbuW/YwTYQaZl7+4Jvl7/HPsfoQ9T6/KPw
X-Gm-Message-State: AOJu0YyFavOXyJdth/5W5FuUcl2SogEM4hOA7QkngQ2HMo/QQxetzrvj
 CwXil+yDBJXsz+RZUcnMPNC74bDNXg1fAniuww7DS4DdhuMtLmf0/Jd8XakXfo8NFZR09Jp7SDj
 Mb+zSaou4bINsJg2a1iIEFa6g3LOwk4+Qufh5FQ==
X-Google-Smtp-Source: AGHT+IGEyFWMc/Bnv5N7cDt95kU2F8T66cMEz+jPU0sJPw/x3JWrXvmnu3gbf07WKBKu3lfbVlW8M9QwMg8fyGR6PUA=
X-Received: by 2002:a25:c805:0:b0:dcc:8114:5a54 with SMTP id
 y5-20020a25c805000000b00dcc81145a54mr1737712ybf.43.1708595197808; Thu, 22 Feb
 2024 01:46:37 -0800 (PST)
MIME-Version: 1.0
References: <20240221-rb3gen2-dp-connector-v1-0-dc0964ef7d96@quicinc.com>
 <20240221-rb3gen2-dp-connector-v1-3-dc0964ef7d96@quicinc.com>
 <CAA8EJpo=9vhM+5YzaFxUoYRuEWQyrMS8wLNPSF3K=bN5JwWyDw@mail.gmail.com>
 <8313a7c3-3ace-4dee-ad27-8f51a06cd58c@linaro.org>
 <CAA8EJpqFj5nf8d_=Uoup7qg+nQrxqQU-DHbL3uSP138m9AcXLw@mail.gmail.com>
 <8fcb5816-2d59-4e27-ba68-8e0ed6e7d839@linaro.org>
In-Reply-To: <8fcb5816-2d59-4e27-ba68-8e0ed6e7d839@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 22 Feb 2024 11:46:26 +0200
Message-ID: <CAA8EJporaUuddHHqpyYHiYSu=toHmrDxSHf9msZUJoym4Nz72g@mail.gmail.com>
Subject: Re: [PATCH 3/9] arm64: dts: qcom: sc7280: Enable MDP turbo mode
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Bjorn Andersson <quic_bjorande@quicinc.com>,
 Douglas Anderson <dianders@chromium.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 cros-qcom-dts-watchers@chromium.org, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
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

On Thu, 22 Feb 2024 at 11:28, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
>
>
> On 2/22/24 10:04, Dmitry Baryshkov wrote:
> > On Thu, 22 Feb 2024 at 10:56, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
> >>
> >>
> >>
> >> On 2/22/24 00:41, Dmitry Baryshkov wrote:
> >>> On Thu, 22 Feb 2024 at 01:19, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
> >>>>
> >>>> The max frequency listed in the DPU opp-table is 506MHz, this is not
> >>>> sufficient to drive a 4k@60 display, resulting in constant underrun.
> >>>>
> >>>> Add the missing MDP_CLK turbo frequency of 608MHz to the opp-table to
> >>>> fix this.
> >>>
> >>> I think we might want to keep this disabled for ChromeOS devices. Doug?
> >>
> >> ChromeOS devices don't get a special SoC
> >
> > But they have the sc7280-chrome-common.dtsi, which might contain a
> > corresponding /delete-node/ .
>
> What does that change? The clock rates are bound to the
> SoC and the effective values are limited by link-frequencies
> or the panel driver.

Preventing the DPU from overheating? Or spending too much power?

-- 
With best wishes
Dmitry
