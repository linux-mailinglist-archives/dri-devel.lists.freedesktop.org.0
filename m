Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2AA4C9A83
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 02:38:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDBBB10E164;
	Wed,  2 Mar 2022 01:38:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [IPv6:2607:f8b0:4864:20::c30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0211410E164
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Mar 2022 01:38:52 +0000 (UTC)
Received: by mail-oo1-xc30.google.com with SMTP id
 x6-20020a4a4106000000b003193022319cso321889ooa.4
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Mar 2022 17:38:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=rIkwW4M5gVOhf6lStrndyYQMI45yK4r8ntbnRtdBpfQ=;
 b=TKKK6Cm980ULKq4I2QCxffulSprZbP7BMvFu2JAr/2/up2F7lA2dwyqJ12Zt6efIim
 PUS2AW5T8/QbIO7WsJ0Nei+H1tlbhOklnsWn7koBBV49QPJUxR697SSlt5j/U/o6pv13
 gRYOnZ/vjQ6anC866KKgcw89XkP7CotO/+KLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=rIkwW4M5gVOhf6lStrndyYQMI45yK4r8ntbnRtdBpfQ=;
 b=EEWSEDOor9C36M/qHcqaCo+Nv32+0gs9W8eRfALMMCdhdymEYepVWRgB2S30cuHmTf
 Ms+/7WtrhEt+f7FsSrKPONQfHie/dNS2FqQEvkZif37IHZYwZ74saqKn2eLNpR8fh107
 YH3X9YbBGu7ubMCNJjRIuEucSGtN8ddzEEx9L3ojUvW40uu4U1qv84rXETuXHSuUpQXM
 NSE6Bp+eCGlH0xEsLdJjjWHyk8/PBNX8L2YrFMGsK5fD9opcvRqylzpi4gWVTaBVWQRV
 J+s/fRS6ud0DWIbUcwukp9R6GQ9WPVU82enQ4sLDxdxsr/bG2EL5IhtPX/p2BSdm9ojw
 x2/A==
X-Gm-Message-State: AOAM53009aypAbR2fYu76TIbVjEXHRk9nyNE9ZaGRK7b1pza8ryBijsP
 5YC2Kw0q/u6WKt3Gaf35cEKckgahbALQcZ7bTBViPA==
X-Google-Smtp-Source: ABdhPJxzYrMW2U+TG3BLR0861lZPPswIdwTyU+n8hPIaCWD803U1juloOlCoo84blCjcV1MqrGMAewbBXyc6GyGp9bU=
X-Received: by 2002:a4a:9821:0:b0:320:52bb:3806 with SMTP id
 y30-20020a4a9821000000b0032052bb3806mr797405ooi.1.1646185132284; Tue, 01 Mar
 2022 17:38:52 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 1 Mar 2022 17:38:51 -0800
MIME-Version: 1.0
In-Reply-To: <20220302005210.2267725-1-dmitry.baryshkov@linaro.org>
References: <20220302005210.2267725-1-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 1 Mar 2022 17:38:51 -0800
Message-ID: <CAE-0n52brK_6gg5-hYA1cNzk3WVw9f0f_XO3QpUywJzY19u=kg@mail.gmail.com>
Subject: Re: [PATCH 1/5] arm64: dts: qcom: msm8996: Drop flags for mdss irqs
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
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
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-03-01 16:52:06)
> The number of interrupt cells for the mdss interrupt controller is 1,
> meaning there should only be one cell for the interrupt number, not two.
> Drop the second cell containing (unused) irq flags.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
