Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0D780C512
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 10:45:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6614210E380;
	Mon, 11 Dec 2023 09:45:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F08810E380
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 09:45:48 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-5cdc0b3526eso32562277b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 01:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702287947; x=1702892747; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LpS2X863BqCbckfOeGv1uweVgiUEsH3nVqhMXbPH/Mk=;
 b=OmbPdSzcGDO37sJ/MdapfbjEuvvzhtTFfmiptTvSD4hxAWByykC6W4VPWqfzFIiK5H
 hdMjFaqcBGZwKV8OJLDd/DqDDXQJ2jUizps0bi/L+q3GCJeaq/Hi0XCYKyEcfnoxRnIt
 88pqKJ2UQgdgwU4paN0/iQyxzPwOe9IR2DOXuOiGyMuwW5Mhj3y6ghPOKhC97F3+6zyR
 GiVfXIA4v8Gar8MOJkWVabJg4zYgTIyzWbDHcNC/cMDH3I+aREpIXfbrzPFYe9pQYvIq
 diB7KSQ7SSYGus3vfpYXvHj4fBiPSB7hyDHSR05q3QOQcwZA/XtDnQmv8OkzK2dMmmx4
 E/9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702287947; x=1702892747;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LpS2X863BqCbckfOeGv1uweVgiUEsH3nVqhMXbPH/Mk=;
 b=VlZuuMNVj6LLgMXqQS1QaopH+mxEBoBFVMmKaCImXPFKpPkx77/byQjEv2AXcSyf3i
 kuiczP5vQzLOwN71RvAqgRtRDj2hatsvOfY0LQfYGwNUUZF8GKHpoWOcCwDctYeKB6vy
 QgkdBQgPjXIdF5R1fYit46u5pC+2cGAkNtycVP+H1p8tCe4wkrARPczCeu73Fnkrg9WS
 DvRQquDvnxVGdI/KrS+aI6FJ+4imUBs4WFIy2X7eQyJygVzFnIRLgdqmcmG0EcUnY/DQ
 dBhZogYeBE/yaELaxdSSx3uKHm0BNBg1LM9rm7rIzaADmFfX36k12Vdwbyl17zFWBC1D
 vtOw==
X-Gm-Message-State: AOJu0Yya04ip8gseTwx2zxZw/YvHqLPatXtckxEq2EbtxUOqQShp243z
 av6395f2RXmFSWKm78FXkQN5SPfqc3prHtoiU8Wp8A==
X-Google-Smtp-Source: AGHT+IEdA2lchCkngKTLdWfeiqjIhis9dj4VJ2FHzG1FAryLDvngRcwgqBCjKabE9igBrprRTqwIRGCFN7ETgILY5SY=
X-Received: by 2002:a0d:e907:0:b0:5d8:9242:47ae with SMTP id
 s7-20020a0de907000000b005d8924247aemr2975958ywe.19.1702287947149; Mon, 11 Dec
 2023 01:45:47 -0800 (PST)
MIME-Version: 1.0
References: <20231209232132.3580045-1-dmitry.baryshkov@linaro.org>
 <20231209232132.3580045-5-dmitry.baryshkov@linaro.org>
 <92ae6379-5126-4a02-ad30-b5dd43d4d251@linaro.org>
In-Reply-To: <92ae6379-5126-4a02-ad30-b5dd43d4d251@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 11 Dec 2023 11:45:36 +0200
Message-ID: <CAA8EJprf0WyE=HBo3Yuh13-m0HMKmH6L+-8xW8oDXWHZtoerjA@mail.gmail.com>
Subject: Re: [PATCH 4/9] arm64: dts: qcom: sm8150-hdk: enable HDMI output
To: Konrad Dybcio <konrad.dybcio@linaro.org>
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
Cc: devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 11 Dec 2023 at 11:31, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> On 10.12.2023 00:21, Dmitry Baryshkov wrote:
> > Add DSI outputs and link them to the onboard Lontium LT9611 DSI-to-HDMI
> > bridge, enabling HDMI output on this board. While adding the display
> > resources, also drop the headless ("amd,imageon") compat string from the
> > GPU node, since the board now has output.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> [...]
>
>
> > +
> > +     lt9611_irq_pin: lt9611-irq-state {
> > +             pins = "gpio9";
> > +             function = "gpio";
> > +             bias-disable;
> No drive-strength?

For the input pin with no bias? I'm not sure. And yes, it was c&p from RB3.

> Otherwise lokos good at a glance!


-- 
With best wishes
Dmitry
