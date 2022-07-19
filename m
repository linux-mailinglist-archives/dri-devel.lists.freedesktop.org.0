Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDD5578EE5
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 02:13:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 768DC1139E6;
	Tue, 19 Jul 2022 00:13:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 621211139E6
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 00:13:18 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 l9-20020a056830268900b006054381dd35so10590809otu.4
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Jul 2022 17:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=tcMPkgy5AkYVoz+3cfHB2slyw4qwE3dhd9DnPWhtJMc=;
 b=LLO39Dfu3dhAmJv6RF2nqh5TD7PjF/dptrPchH8NYHTaBeUmpa988m24WqNUmZ6mrj
 csCZTfbPCAg4mBav+WbY79TzDknZUQ5qLQ/DbNqRgOWzWuYrlP4Kt2OTH2BguR1fL6/N
 6UKFk98Y27/36eSRjwlMm9G4KZRPKD1p12tYs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=tcMPkgy5AkYVoz+3cfHB2slyw4qwE3dhd9DnPWhtJMc=;
 b=WxlWtrTD4dhR2+gQFWcta0VYRuNike0rOy4uWvE1NPKkQ06Gq9UX9U1o+sRWM2TJnb
 EAiLpFfAamOYxlA8vhqQVN/Vnpdgjn09cxObubHUHsxJun1ewOLxPh52WdbIoqSNxkxJ
 Kpu3qN4D1iH2memw6OgH/NhxGtfWUm0d0QTJeS6utSk41HTtHX6ENqmbNUMnAFsqqzQN
 rJ1oARTgaqTQ4QxkKWPOdaXQs825u5+JY56QFwL50GsELLDsCynM48VaHbPK4ydGdjIq
 T6P47MRdnNyOFLBaIB9Ps3KfxRyrPGKCqjDDUZiQFU9zcXNrfmya9rFuUXV5BPRyX4lt
 dWcw==
X-Gm-Message-State: AJIora8Py7ezQfG+gw5FjAUp1qsaxq116pAQOIM6suP5g1DDDQljP0UT
 zhwJScFBA0YpabjFVN3bO03Xa8Mc2btyagUQVTk4lw==
X-Google-Smtp-Source: AGRyM1vWi89aXjlaCd34r6iFy+/kWv2yYLIXV7zIq7RVPWxgUmLtiyM6+wg9JULu4OxUrtKaNySQPrm92VWaoteipX0=
X-Received: by 2002:a05:6830:1d88:b0:61c:8b2a:22b0 with SMTP id
 y8-20020a0568301d8800b0061c8b2a22b0mr7059089oti.3.1658189597554; Mon, 18 Jul
 2022 17:13:17 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 18 Jul 2022 20:13:17 -0400
MIME-Version: 1.0
In-Reply-To: <20220710084133.30976-4-dmitry.baryshkov@linaro.org>
References: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
 <20220710084133.30976-4-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 18 Jul 2022 20:13:17 -0400
Message-ID: <CAE-0n53ONeCzX5jAOmGACjgXqLGSSmsj1jY60WL4MhP0OfPrsA@mail.gmail.com>
Subject: Re: [PATCH v2 3/9] arm64: dts: qcom: sc7280: split register block for
 DP controller
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Clark <robdclark@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-07-10 01:41:27)
> Follow the schema for the DP controller and declare 5 register regions
> instead of using a single region for all the registers. Note, this
> extends the dts by adding p1 region to the DP node (to be used for DP
> MST).
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
