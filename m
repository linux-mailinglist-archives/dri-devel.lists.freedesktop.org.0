Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C32A5538BE
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 19:18:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 568A510F017;
	Tue, 21 Jun 2022 17:18:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7E4E10F017
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 17:18:14 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id d128so10618449qkg.8
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jun 2022 10:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qwgcxcNcyUJ2NZcZ15e/v3/JFQqPvu5+AV1dXV2vsco=;
 b=TRn64fJDhOElfdcTPwyz6sItOyqoiDKFp52IyHdMNOTBQcCEhFotFhbieaj7qSREL8
 3kGY1lhmsXg3/711w7p4yz2xDmezK97ZjDhH25hVdCPA/4g4FUTMDfgN2vSWX/ZhArl0
 nNZETnIyH2zeO4mPe268fsAerKKK5cWu6jwDZJaN4Y1VTofp0cWGYy7YtPNfrcyKxeX1
 y2CUij5/SY1Qv53A/TY/LJpo4tbrvweyd9Evb7XGjxNlMjDc/es/LordtDmcKhzYuguh
 xSlzNflRpZl8OppZX6apzOLrVnhL2PUvipQoqWarhBbf7mk012ZXQ8zb+/Kj8HpdvrbZ
 41Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qwgcxcNcyUJ2NZcZ15e/v3/JFQqPvu5+AV1dXV2vsco=;
 b=5b1o5J65xu9976M3NJN/+uS7+d3C8jYlILjFasREMZzntPExyg1x5KKTqf00SyUXA9
 I2m+kLndtQKaZuAqPJc75pZsLuJ+bm8Qt5rdtEQs+qtkACvLEzJyAKkZ3ddQTuI0n04K
 GY0oH+mzBCN/w1SIrrmmOEPPeNU/xGjtfPRVniO11iGKzEgwWeWg8w0hrIbvdPFCa8jp
 BEXVlAUGRxVLQ0qWLXiLPFs4M0XGzBhtWdvxzWd4IBq8ig0Jpu7kJex1SWkFa/pTDrXB
 +thgTD9dKwBoC46Hdaq69SzS6gfxJa+abFsfLRrpy1Lm6R7eGElp/B2w+2k0wAFO7pS5
 zWHw==
X-Gm-Message-State: AJIora9qkE2UUb1BY6XCr/j4y4LhesfHtDKdfrQOztew3bM4RGtMn4yu
 7WiCS6w/baCO8FFA4OaJyuHt1Rs6u36WRlKtHaolxw==
X-Google-Smtp-Source: AGRyM1smc0gwmosrHI+DQL1uoC4Ig2j2XwTOLwa6CjLVbxx4AvthhD2XSWSsKcJldKX7/++f3DvVCyYjrta4Yu1yNpk=
X-Received: by 2002:a05:620a:4156:b0:6a6:f8d2:6d9e with SMTP id
 k22-20020a05620a415600b006a6f8d26d9emr21165057qko.30.1655831893778; Tue, 21
 Jun 2022 10:18:13 -0700 (PDT)
MIME-Version: 1.0
References: <1655830891-19025-1-git-send-email-quic_khsieh@quicinc.com>
 <1655830891-19025-3-git-send-email-quic_khsieh@quicinc.com>
In-Reply-To: <1655830891-19025-3-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 21 Jun 2022 20:18:02 +0300
Message-ID: <CAA8EJppZSuEOAh_K-wqQtC4Zx-W5ig02Oe7ZukJnF_Z=6pEDfA@mail.gmail.com>
Subject: Re: [PATCH v15 2/3] phy: qcom-qmp: add regulator_set_load to dp phy
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
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
Cc: quic_sbillaka@quicinc.com, quic_abhinavk@quicinc.com, airlied@linux.ie,
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 dianders@chromium.org, vkoul@kernel.org, agross@kernel.org,
 bjorn.andersson@linaro.org, linux-arm-msm@vger.kernel.org,
 quic_aravindh@quicinc.com, swboyd@chromium.org, sean@poorly.run,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 21 Jun 2022 at 20:02, Kuogee Hsieh <quic_khsieh@quicinc.com> wrote:
>
> This patch add regulator_set_load() before enable regulator at
> DP phy driver.
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 43 ++++++++++++++++++++++++-------
>  1 file changed, 33 insertions(+), 10 deletions(-)
>

-- 
With best wishes
Dmitry
