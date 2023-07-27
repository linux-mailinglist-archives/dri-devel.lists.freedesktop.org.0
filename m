Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9709C764DB7
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 10:37:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC24310E1D7;
	Thu, 27 Jul 2023 08:37:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1413D10E1D7
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 08:37:43 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id
 3f1490d57ef6-cc4f4351ac7so638449276.2
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 01:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690447062; x=1691051862;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pWMWGlQcZrS+qSRQi4fySJuX8GoJmganqqgkAyb3ZRQ=;
 b=paElh1x1Q7WNWaCwsablC8sigHPxSMEmMiI11BuNLqLhV7w37xfsUjukUaFba0G16D
 UsZMOe5WDZbZnHo55478HibTcLSCIA4JmQRxKYvECGAScIpKpeHemO2pGuiCkJg3DCHR
 qr5mVSdBUvWZbrxpO+Mf80etC5PLo9I8CRyQ58nqbq/qA6/0w094/vXgap67wPAMEYsL
 WoN510uEcbg03im1Xm6iVk7uh9/Ii/Qoml+15cY4qmALiKTnnlYu4Arf8JU0uix34eM5
 fUx6ZvgoL+uUolo8QM0UZDrzKv207pTC6ZRBS/d+VwL1DQSDK2WyC+vk1/kxYXG1pPev
 o4vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690447062; x=1691051862;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pWMWGlQcZrS+qSRQi4fySJuX8GoJmganqqgkAyb3ZRQ=;
 b=EE3zvAtjln81Bc9XFKnAp8oaMbeA9gw1xIEzHp07OaxdcugRuzEJAdevY25pKHo8xo
 Nu+bFlbsPrAQt8KOP+YtcfZBZClQSxZNobPGhY23AQriL7ec0v/PuvxdpwsFhGjg4zAL
 DCH5GSh1ypyJ6zmQ7SAmQFSkb/2QJzS8u/xBMXYqCcqcT7nNEQOsRvNNmksm9YmqO19F
 17N2fZEEyJ7U0lkLanIFvck6kLblfIDE/coNav5yyNvOJ/VxmZaB8tF4b0Dmj7tPawgV
 8Mk6pXXgSm/oOYjYmsTJ8tHaKxBOnupenHJQDTyzr2ENuZOq9pD4T5NPYmKtjALtNbHw
 PGXQ==
X-Gm-Message-State: ABy/qLbcdBItBfcSbKFaWZ6Q5xiNRTogypuECDZLGvva5jvlaEV5zTLe
 L70AAOwHiZv4tLMh7oHYzkmmf4pgg1AYYyHw0nOOpQ==
X-Google-Smtp-Source: APBJJlF1jpC3f3gk+ztU5YHmd4eGGIE2cxjSaq/QbE6KaSY4NpZgLaWwb5QMQcEbkYY2Ir4qh4wUR49wKLdTYMUHnEE=
X-Received: by 2002:a25:ca07:0:b0:d0a:fbef:1590 with SMTP id
 a7-20020a25ca07000000b00d0afbef1590mr4355706ybg.37.1690447062045; Thu, 27 Jul
 2023 01:37:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230521171026.4159495-1-dmitry.baryshkov@linaro.org>
 <20230521171026.4159495-5-dmitry.baryshkov@linaro.org>
 <61b0792d-aa62-03ea-bb2c-aa9392251519@quicinc.com>
 <CAA8EJpp+uO_BZVQ9A+ZjKe3+b_H=xJc_yCfd8bKSPenU8Mf5FQ@mail.gmail.com>
 <13784945-8029-9b21-f226-8692e348ec1e@quicinc.com>
In-Reply-To: <13784945-8029-9b21-f226-8692e348ec1e@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 27 Jul 2023 11:37:30 +0300
Message-ID: <CAA8EJpruxo0_BXyJZYGFDBd=rW+KYhywT1z4dPeV+7KTFvX14Q@mail.gmail.com>
Subject: Re: [PATCH 4/6] drm/msm/mdss: populate missing data
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
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
Cc: Sean Paul <sean@poorly.run>, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 27 Jul 2023 at 02:14, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 7/26/2023 3:58 PM, Dmitry Baryshkov wrote:
> > On Thu, 27 Jul 2023 at 01:30, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 5/21/2023 10:10 AM, Dmitry Baryshkov wrote:
> >>> As we are going to use MDSS data for DPU programming, populate missing
> >>> MDSS data. The UBWC 1.0 and no UBWC cases do not require MDSS
> >>> programming, so skip them.
> >>>
> >>
> >> Can you pls point me to the downstream references you used for msm8998?
> >
> > msm-3.18, drivers/video/msm/mdss/mdss_mdp.c
> >
> > See the function mdss_mdp_hw_rev_caps_init(). It sets has_ubwc for MDP
> > 1.07 (msm8996), 1.14 (msm8937) / 1.16  (msm8953) and 3.0 (msm8998).
> >
>
> It sets has_ubwc but I still cannot locate where it says version is 1.0.
> Because the 0x58 register reads 0 and not 1 for msm8998.

What would be the version then? 0.0 sounds strange. I'm yet to check
whether UBWC works on 8996 / 8998.

> >> Was that just taken from catalog? If so I would ask for the reference
> >> for the catalog too.
> >>
> >> As per the register the decoder version is 0x0 and not 1.
> >>
> >> Even encoder version is 0 from what i see and not 1. Thats why a
> >> dec_version of UBWC_1_0 is not doing anything i assume.
> >>


-- 
With best wishes
Dmitry
