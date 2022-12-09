Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C76647C65
	for <lists+dri-devel@lfdr.de>; Fri,  9 Dec 2022 03:49:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72A2410E21E;
	Fri,  9 Dec 2022 02:49:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81ED910E03C
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Dec 2022 02:49:23 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id bj12so8381695ejb.13
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Dec 2022 18:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kali.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=53YW0ORFneqyG93srJ8jF+XX7zmPAnIboOzrEPTG0Ts=;
 b=THue66vB24/bYK1OKRCFn3bh/J/RhSIiO/22Xzu3S1OMJvLXwxUmZzaqbERTDmNPxX
 QG0p0q4606ivku/eGXQWQOeiIDGlgB5VSdhbxtsaFHyeVmlMcQ41A6JCmWrIFMjeLbed
 1QPWt9QMzlb32nmtD26qU5ryEWB5T3z82YP51rFbEtE90bFRGxb4WH0CwWFZ9sNZBDie
 YpGntb2COBf6JNsjRbynRwGQ5E9OEJXMlPt6aroZeRuLOjBeyF6GVdtPNDf/rxNqW9gD
 L5jh4FvWCbafrPqPi9eRB4EyDyH9EMgnUDC9O/kvvfbe8z/Ww1BknWX/k4YRHHKzjFg+
 S5oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=53YW0ORFneqyG93srJ8jF+XX7zmPAnIboOzrEPTG0Ts=;
 b=6zKoXMPDC47FqfcwLeUqSFm6SQ0yw0WfQ7Gt6PPhQ8ojAkKNmFqWibH+L8GwpV9vdr
 /PX+vbUyIquPYOkDjQEl8B3F+e7a+wIdfcIWzaf19KUwTEDdERLlaoD6oV7ZNVZqxBsp
 noNqjYGG2MB1TUKuVd+qKj4u4gp6dsybopOAoij3MaNOqdVrocVoQSY8dW7b+MCVWuNr
 78gxGvvvYzVgqIMQrSFzKTENOfCBU/jMBEksySG3TmW9F7+CfGCWN4yqmdd+446S8XSS
 eR9tbmCqw79K7lrpanamlQ8fiPckKep1BGI8Vy2+bFHZYsZVCP0v3txlF+9ulYiFlg6q
 l3Bw==
X-Gm-Message-State: ANoB5pkjFfVF7T0OSj60xGtxhJUmaghqefI6yg1xomeYR+KL9heZSJZ8
 oNMEhOA6G1DqblO3n2qcQim/LY5qzBOGRAA9Olyr/Q==
X-Google-Smtp-Source: AA0mqf6doDwZB2F+lKd6wShNarKCxmm1N6/epMJ03LBGs+paMSVEE2cZP89QidB84RL5HCl7NJLWWsopNGHRAj14smU=
X-Received: by 2002:a17:906:c44a:b0:7c0:d6bb:fd7 with SMTP id
 ck10-20020a170906c44a00b007c0d6bb0fd7mr18360425ejb.726.1670554161785; Thu, 08
 Dec 2022 18:49:21 -0800 (PST)
MIME-Version: 1.0
References: <20221207220012.16529-1-quic_bjorande@quicinc.com>
In-Reply-To: <20221207220012.16529-1-quic_bjorande@quicinc.com>
From: Steev Klimaszewski <steev@kali.org>
Date: Thu, 8 Dec 2022 20:49:10 -0600
Message-ID: <CAKXuJqirYDCGfOP=YMOGdacB_v0GNty7HZ+p0U19a8DpBMDGKQ@mail.gmail.com>
Subject: Re: [PATCH v5 00/12] drm/msm: Add SC8280XP support
To: Bjorn Andersson <quic_bjorande@quicinc.com>
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, freedreno@lists.freedesktop.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 7, 2022 at 4:00 PM Bjorn Andersson
<quic_bjorande@quicinc.com> wrote:
>
> This introduces support for the SC8280XP platform in the MDSS, DPU and
> DP driver. It reworks the HDP handling in the DP driver to support
> external HPD sources - such as the dp-connector, or USB Type-C altmode.
>
> It then introduces the display clock controllers, mdss, dpu and
> displayport controllers and link everything together, for both the MDSS
> instances on the platform, and lastly enables EDP on the compute
> reference device and 6 of the MiniDP outputs on the automotive
> development platform.
>
>
> The patches was previously sent separately, but submitting them together
> here as they (except dts addition) goes in the same tree.
>
> Bjorn Andersson (12):
>   dt-bindings: display/msm: Add binding for SC8280XP MDSS
>   drm/msm/dpu: Introduce SC8280XP
>   drm/msm: Introduce SC8280XP MDSS
>   dt-bindings: msm/dp: Add SDM845 and SC8280XP compatibles
>   drm/msm/dp: Stop using DP id as index in desc
>   drm/msm/dp: Add DP and EDP compatibles for SC8280XP
>   drm/msm/dp: Add SDM845 DisplayPort instance
>   drm/msm/dp: Rely on hpd_enable/disable callbacks
>   drm/msm/dp: Implement hpd_notify()
>   arm64: dts: qcom: sc8280xp: Define some of the display blocks
>   arm64: dts: qcom: sc8280xp-crd: Enable EDP
>   arm64: dts: qcom: sa8295-adp: Enable DP instances
>
>  .../bindings/display/msm/dp-controller.yaml   |   3 +
>  .../display/msm/qcom,sc8280xp-dpu.yaml        | 122 +++
>  .../display/msm/qcom,sc8280xp-mdss.yaml       | 143 +++
>  arch/arm64/boot/dts/qcom/sa8295p-adp.dts      | 243 ++++-
>  arch/arm64/boot/dts/qcom/sc8280xp-crd.dts     |  72 +-
>  arch/arm64/boot/dts/qcom/sc8280xp.dtsi        | 838 ++++++++++++++++++
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 217 +++++
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   1 +
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c |  18 +
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |   3 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |   2 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
>  drivers/gpu/drm/msm/dp/dp_display.c           | 151 ++--
>  drivers/gpu/drm/msm/dp/dp_display.h           |   1 +
>  drivers/gpu/drm/msm/dp/dp_drm.c               |   3 +
>  drivers/gpu/drm/msm/dp/dp_drm.h               |   4 +
>  drivers/gpu/drm/msm/msm_drv.h                 |   1 +
>  drivers/gpu/drm/msm/msm_mdss.c                |   4 +
>  18 files changed, 1770 insertions(+), 57 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sc8280xp-dpu.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sc8280xp-mdss.yaml
>
> --
> 2.37.3
>

Tested on Lenovo Thinkpad X13s
Tested-by: Steev Klimaszewski <steev@kali.org>
