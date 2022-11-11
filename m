Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67FA0625E17
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 16:17:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56F7110E85E;
	Fri, 11 Nov 2022 15:17:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFFC210E849
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 15:17:23 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id 21so8052962edv.3
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 07:17:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=496UFFIC10qt1M6UVRQKPJnGchRATjnymhhjWaLmr1w=;
 b=RSyI8hdVimJvxqP1L25E2r+IvvfMghhQQhG4xOOGVGNagBkKs6PdvtDlIFJedry2gy
 c4NW9SoTQO+eAxMKq9tmrqF+NJVhiOQvpkx7SAriIF+w8Fa/PfUuCJkpNNmzTkfgxyWe
 mFLzBV3BZO794b6pKcm/Gfvtjgus14npORj6oBVn7ULgjX/RZckFZLa316Wk7nrU3doP
 /4PuEyIa+MCiCVTrIVb1gTKTM4y8FKJa+1AL90s5UDqqVSPNYnC1JP7oAZPUvt08XcKz
 qhPCywtOwwhNgCRuc+ykquvOBHCdJ90Z1WHv+UypB4qihvG51Pxrd9HhHzZlfD3roSPn
 MzhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=496UFFIC10qt1M6UVRQKPJnGchRATjnymhhjWaLmr1w=;
 b=fw2VMmGollfyWA+LS/xL9JvrOtCwSkivdULQATyzWDj2YQhOmvFihKcWGvWKSZbcBx
 3KW682OmqNBjJya0V/D17yACVak8GxGQvBd8ulceeVUWzx1pUtuWcdUIonkoJj1jgovr
 hXaynFbAc/y/diSzr6Dkpj+LkWdGCAHfBYevN2WCAhfwdkP8H9LMPseiwW7ongkEe2UN
 x1t3sB6Q1tnaFO7+vO30rUDxdSS6a640bUHbgMa+u2LXzW1ABgKKiNpQwqnJ6MtKTrHs
 beNRGmoK3ALE6h+cZovxWkFqqQqG/oEEWmgp5XMXSsQn40/g9dztiRpMew6tuZSh1eyO
 ryrQ==
X-Gm-Message-State: ANoB5plQpf8CIXNyRKQCxmT7gW2AHcK19USRtY7lmYL92wJIQp2dIGK5
 PRSOxL9P8UFNZH5CZ6Aj/kO/wl4sO6gdceqEf/msNw==
X-Google-Smtp-Source: AA0mqf7rUnO1t4y0ADfVMEYjKFri9CWgvqhmDL2US1Uq9KFQrYcX4hZNCB5JQzEzP8ka8n7ON29oaQb+5yBamEHWx7E=
X-Received: by 2002:a05:6402:298a:b0:461:4c59:12d6 with SMTP id
 eq10-20020a056402298a00b004614c5912d6mr1877018edb.250.1668179842232; Fri, 11
 Nov 2022 07:17:22 -0800 (PST)
MIME-Version: 1.0
References: <20221028120812.339100-1-robert.foss@linaro.org>
 <20221028120812.339100-9-robert.foss@linaro.org>
 <eeeefa55-1782-2768-8d47-0f315ed9888b@linaro.org>
In-Reply-To: <eeeefa55-1782-2768-8d47-0f315ed9888b@linaro.org>
From: Robert Foss <robert.foss@linaro.org>
Date: Fri, 11 Nov 2022 16:17:11 +0100
Message-ID: <CAG3jFyvp1q=VvL6XXLTtkF2BsxUbXCu5+3-psi80A=avkgrAoA@mail.gmail.com>
Subject: Re: [PATCH v1 8/9] arm64: dts: qcom: sm8350-hdk: Enable display & dsi
 nodes
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
Cc: airlied@linux.ie, konrad.dybcio@somainline.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, angelogioacchino.delregno@somainline.org,
 vinod.koul@linaro.org, Jonathan Marek <jonathan@marek.ca>,
 quic_vpolimer@quicinc.com, agross@kernel.org, quic_jesszhan@quicinc.com,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, swboyd@chromium.org, robh+dt@kernel.org,
 sean@poorly.run, quic_kalyant@quicinc.com, loic.poulain@linaro.org,
 dianders@chromium.org, linux-kernel@vger.kernel.org, vkoul@kernel.org,
 dmitry.baryshkov@linaro.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 29 Oct 2022 at 00:03, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 28/10/2022 08:08, Robert Foss wrote:
> > Enable the display subsystem and the dsi0 output for
> > the sm8350-hdk board.
> >
> > Signed-off-by: Robert Foss <robert.foss@linaro.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sm8350-hdk.dts | 22 ++++++++++++++++++++++
> >  1 file changed, 22 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> > index e6deb08c6da0..6e07feb4b3b2 100644
> > --- a/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> > +++ b/arch/arm64/boot/dts/qcom/sm8350-hdk.dts
> > @@ -213,10 +213,32 @@ &cdsp {
> >       firmware-name = "qcom/sm8350/cdsp.mbn";
> >  };
> >
> > +&dispcc {
> > +     status = "okay";
> > +};
> > +
> > +&dsi0 {
> > +     status = "okay";
>
> Status is the last property.

Ack.

>
>
> Best regards,
> Krzysztof
>
