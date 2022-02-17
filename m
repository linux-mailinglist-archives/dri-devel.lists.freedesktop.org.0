Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6174BAD64
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 00:50:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDF5510E648;
	Thu, 17 Feb 2022 23:50:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6B2910E17D
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 23:49:59 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id m17so12389726edc.13
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 15:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IgGbzOlUTHOWKPpui7MHtfG8jNNY4bniwC/YrreyLuI=;
 b=IhdrQsZx8xawrXEakDHV3a9kOZ8U9S9uUunE5nfMVHp+ZBvfxF1mHvbyZG0jMTuTnG
 +/3fdRSqXEn7uwXzF9F3GkCNY4oC7rJDO48HhEuxRPWaU133PgRgpP39DJ7b6cPyP5cC
 s6paU9KqyRAUfYfpmBrnMSZ3Ip5spynzdF2+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IgGbzOlUTHOWKPpui7MHtfG8jNNY4bniwC/YrreyLuI=;
 b=47HVevuOMR62Lwmd4W/OEEP2pmXds4tj6Mb1lx1pYINTzpDObjbWYcse3YiOOvlwf5
 GHJeeK7l79Z0ZuheWpp4DSqyM2ph5r63ollgmm6nimgRRu7z4aAV8VbgDhzSV6mQHMH+
 CLV1jnysHpgO3+B05ORcUu2rwdWP5mcN6TGNKUJziXjSd8RdMRY2Y7SRtOCS7H0XQyft
 ZfK2h0+VRh+NxqbF0YXcDQKw+wwj5XkCRHKakrWcjZgBVl6KYhx+Bod1Qebxrj7s5+Hq
 CKl18RuVvdNyF/u41E51MWH5Qatr5Ubd7d1MT6lpqHVs8VHB74Dpb7BA3tGVDHCluc46
 RZIA==
X-Gm-Message-State: AOAM533hBrGeugWlG5EAepi/wzwwOLqLL1njbYoEusv+/i9Kk4TwHREc
 NDEjUi79J7iPJwfLeaLVA6JGYm+HUnyKPptqxm0=
X-Google-Smtp-Source: ABdhPJygxgV/M3Vavwepr3LHw3gz8sFhY5PIdFbqZaRvsB9mKs+q+I3GAkxBY/MPODnXZfE39o6cxw==
X-Received: by 2002:a50:9d08:0:b0:410:1013:f3b2 with SMTP id
 v8-20020a509d08000000b004101013f3b2mr5302649ede.13.1645141798145; 
 Thu, 17 Feb 2022 15:49:58 -0800 (PST)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com.
 [209.85.221.46])
 by smtp.gmail.com with ESMTPSA id u26sm1620837ejg.196.2022.02.17.15.49.55
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Feb 2022 15:49:56 -0800 (PST)
Received: by mail-wr1-f46.google.com with SMTP id k1so11628698wrd.8
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 15:49:55 -0800 (PST)
X-Received: by 2002:adf:ef07:0:b0:1e3:333f:a101 with SMTP id
 e7-20020adfef07000000b001e3333fa101mr4100610wro.301.1645141795187; Thu, 17
 Feb 2022 15:49:55 -0800 (PST)
MIME-Version: 1.0
References: <1644494255-6632-1-git-send-email-quic_sbillaka@quicinc.com>
 <1644494255-6632-3-git-send-email-quic_sbillaka@quicinc.com>
In-Reply-To: <1644494255-6632-3-git-send-email-quic_sbillaka@quicinc.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 17 Feb 2022 15:49:36 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U9v40Ld1N5VsEbny7BBtSWuC5rNxWqcuLQocS1bxLcoQ@mail.gmail.com>
Message-ID: <CAD=FV=U9v40Ld1N5VsEbny7BBtSWuC5rNxWqcuLQocS1bxLcoQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/5] arm64: dts: qcom: sc7280: Add support for eDP
 panel on CRD
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
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
Cc: quic_kalyant@quicinc.com,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 quic_khsieh@quicinc.com, quic_vproddut@quicinc.com,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, quic_abhinavk@quicinc.com,
 Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Sean Paul <seanpaul@chromium.org>, Thierry Reding <thierry.reding@gmail.com>,
 Stephen Boyd <swboyd@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>, quic_mkrishn@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Feb 10, 2022 at 3:58 AM Sankeerth Billakanti
<quic_sbillaka@quicinc.com> wrote:
>
> +&pm8350c_gpios {
> +       edp_bl_power: edp-bl-power {
> +               pins = "gpio7";
> +               function = "normal";
> +               qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;

As far as I can tell you're lacking:

#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>

...which is needed to use PMIC_GPIO_STRENGTH_LOW. I'm curious how
you're compiling?
