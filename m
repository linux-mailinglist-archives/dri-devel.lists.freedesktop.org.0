Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B046219E1
	for <lists+dri-devel@lfdr.de>; Tue,  8 Nov 2022 17:56:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0463B10E4C5;
	Tue,  8 Nov 2022 16:56:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0260910E4C7
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Nov 2022 16:56:04 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id 63so18067988ybq.4
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Nov 2022 08:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TN8l2lGtVmcCUipWgzLJOYNCDLR8IIsOAYeFjH7zJ1w=;
 b=g5OU3wWOpPPOiIkbca2HE3EGr3zNuD22/5cVb58DoDhivuCuM0q7rGOcbDSVt6mbM7
 puJ6zoUGLHjZ/1y6uiMnCnkawiLa+M5N9DdXrQ4fzYvPxIjFicmtVpQ8iKuahX6iPh0i
 X33uSN0n5zZzyPl0GscyTiXlC/PF+u4fiNCN8nZFt1t5CQBCzfLjrBf1UE1UaRSAWmsU
 /H/vai7wpg8sZXUHAjh6JncNyIQ3i9u3PIH5a4SM67tfTLu4wIulHKdk3lJ+poqtCJRJ
 eKxusToqrCDwwsWxNYuMzuHTDss2yuC8kvBnCyb0uZnmj2tZGUMLRFR75V/P53l4/ANS
 /5Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TN8l2lGtVmcCUipWgzLJOYNCDLR8IIsOAYeFjH7zJ1w=;
 b=kG+I6XqPV53XGHTPBir66mR1fsD2Bj2D6ayvHfel5iY9V2E169AVqs4AQXAcNp9CiR
 wnykGLMZYlQ9ZOBYSSjTJg+82eGEOXBPxeP7xQ5jWDKGzfe89Q/DMi1NUI36PsWaQewk
 NBIMa2njbvlaDRVzZvWaHirN8pJro7xtMUicY6QK8ak8b5V0E21MXlWNQFwa1lwWQgQW
 rFh1rV5cBKskI9zA4+KKe6ZMjuIxK5UP0dskNC8a4h0TqqfVoMf0tw7RZVSTCR4yuUyd
 zEJrfaAdgJXiW5/0S6dsvnr34YpwJCndbdTv/vyIfjblzJkMBwxLLgaj+v0pyxWj5KRV
 gu1A==
X-Gm-Message-State: ACrzQf1mbOyPR/1PWUvDflMoLePaQ4wHlxYAkSMUGwhiP4CbMXil6YtT
 F9JNiuTc8c6vamM+b+ic2dClfrSsgE4mnT0QymO9Ww==
X-Google-Smtp-Source: AMsMyM56aNnx3FqXLL0Tf26b1gUZQslz7y1AQLBr6u3w0T002wSBE6l9w1Rkr4MeMdq0L5BOCNqcXfrK/a4ieFP1Q3M=
X-Received: by 2002:a25:ba45:0:b0:67a:6298:7bac with SMTP id
 z5-20020a25ba45000000b0067a62987bacmr60069197ybj.194.1667926563854; Tue, 08
 Nov 2022 08:56:03 -0800 (PST)
MIME-Version: 1.0
References: <20221107235654.1769462-1-bryan.odonoghue@linaro.org>
 <20221107235654.1769462-4-bryan.odonoghue@linaro.org>
 <ceffec42-f9af-6bde-8db1-076f0cc2a34f@linaro.org>
 <a8c36604-5f52-0be9-29d7-f64811541c97@linaro.org>
In-Reply-To: <a8c36604-5f52-0be9-29d7-f64811541c97@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 8 Nov 2022 19:55:52 +0300
Message-ID: <CAA8EJpoepOn4ScZT6V7a1T73pWdQKsxUzVKA5KsBy9SFfNVBKQ@mail.gmail.com>
Subject: Re: [PATCH v2 03/18] dt-bindings: msm: dsi-controller-main: Add vdd*
 descriptions back in
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, quic_mkrishn@quicinc.com,
 krzysztof.kozlowski+dt@linaro.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 8 Nov 2022 at 17:42, Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 08/11/2022 12:59, Dmitry Baryshkov wrote:
> >>
> >> Warnings about missing regulators can be resolved by updating the
> >> relevant
> >> dtsi files to point to fixed always-on regulators where appropriate.
> >
> > Ugh. Are they missing or are they optional/not used on these platforms?
>
> Some platforms either don't implement them or worse possibly do
> implement but don't model them when they should.
>
> > Can you possibly list all regulator warnings?
>
>
> Downstream we have
>
> arch/arm/boot/dts/qcom/msm8916-mdss.dtsi
>
> mdss_dsi0: qcom,mdss_dsi@1a98000 {
>         vdda-supply = <&pm8916_l2>;
>         vdd-supply = <&pm8916_l17>;
>         vddio-supply = <&pm8916_l6>;
> };
>
> Looking at something like
>
> arch/arm/boot/dts/qcom/msm8916-mtp.dtsi which references
> arch/arm/boot/dts/qcom/dsi-panel-jdi-1080p-video.dtsi it doesn't appear
> to delete andy of the vdd*-supply references

Good example. We have vdda-supply and vddio-supply in
msm8916-pm8916.dtsi (correct).
And the mentioned vdd-supply is not applicable to this platform. It
powers up the external DSI-to-HDMI bridge. I'd assume that the same
regulator was destined to power up the panel.

So, I'd suggest defining all supplies at the top level and then
pushing all the required: parts into the per-SoC entries.

-- 
With best wishes
Dmitry
