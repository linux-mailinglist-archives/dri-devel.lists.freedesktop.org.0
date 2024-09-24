Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 129A6984103
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2024 10:48:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C27C10E666;
	Tue, 24 Sep 2024 08:48:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wEAAIGXy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89BAE10E666
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 08:48:27 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-6dbc9a60480so44053457b3.0
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Sep 2024 01:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1727167706; x=1727772506; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=O2BW7rW1FYVjlIde6zrnL8EA7RyRxs80o9NImTHzZY0=;
 b=wEAAIGXyXDu7tMhtxz3tYGMJ1WiD5txN8m4IJGbUwUy3luAeGO78OHui9waA6qLfPt
 fKVXIseTgwFpRT9BdE/D7x4wcosLhZ3r55V7TPzcqTHTWnvWYGf4CcBi69hdNac2Ws/+
 P4n7Up5txLzidn+Pox+bEXl7EBEa1DIdQyJK8TISq9DiX7nWjaZceyq15IagUlIkz6fM
 6IjRiWNmVXSMdSKIJ1tnCnzfB7W4jLyYMmDBy/3rqL+ULrZylFjD86WQWRacpwkLmI4v
 cIRqzs8s7CH2FHEauZBHTpGGGyNBJCGggIonbCoJLwiPCich47UnoC4gNi4Fo3x5wr76
 9fBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727167706; x=1727772506;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O2BW7rW1FYVjlIde6zrnL8EA7RyRxs80o9NImTHzZY0=;
 b=pfLFtTeKBx9Y/03P+DfaLCv15Q9O5PC3pPvsmTXuneO9Fwmwi7Fg5/+49icqAcNcMe
 Ns06AzNAtgf+2eAXH/XMJnmvEIhVmGmWjbP8BD96BE9KTIQDiFBwyd4PAiC6+7xJ+3Cn
 CH7ZZa+345YVnZH5GNL/w7LeSLO2oY4ZYtjjSm+MhXQ1TFbrqaLKJVio3Ehf03XRdmtb
 z11HN7HanBzXI/vDneC3JyzXu9TwXnF/prK67Rq8XqWwm55XHrLCEZu+3I4SZkFsrwtQ
 08KgnuvdTUM2IOf4Wy8ZTsKtwb2QhAYaNnf4mqfPSW+Ph1Sr+ioMbjeNi23Ql0xXknqU
 hL+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQdpWeeqsTDG80nJ/LfahZdH+ItnG4PaJUjeAVd7rXfLjUbjkW3N9YT2hr0UWnmo/Q78MsSk9iQ1o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwJ78jcHtnzbvBHr95N0vQjyhfWbQ5iQRqdkniwmsEF1/ys/ibs
 AhcfRRokMmO45w2ywJdSBjL3PZ0XX3hoiWugAESEy0ilofVf0rzHfbAi3BOPqFWxtidcXQI5ro2
 tvS+dFfWLiepc/MAlCaYZT/bkj3qyLZ90eBNabQ==
X-Google-Smtp-Source: AGHT+IFCb5BRAlbLnAzwWjcBmVLE/ekCw6xTHW2PJeqbqJNzwemf1kqX/aZu6O5ynInq2xTnD+jZsJNpJ4482s31YGo=
X-Received: by 2002:a05:690c:3005:b0:6dc:45ef:d933 with SMTP id
 00721157ae682-6dfeefe56famr87702667b3.43.1727167706566; Tue, 24 Sep 2024
 01:48:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240912071437.1708969-1-quic_mahap@quicinc.com>
 <7fcbvouzb7gq6lclrkgs6pxondvj5wvutyw3swg55ugvzfpvd4@2ph7x7ulxoyv>
 <013459fd-fbb0-4225-90e3-a16115154646@quicinc.com>
In-Reply-To: <013459fd-fbb0-4225-90e3-a16115154646@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 24 Sep 2024 10:48:16 +0200
Message-ID: <CAA8EJpooSPgUbZdvDeQcrauAU80sL98uVojVhrK++8=+atsj7g@mail.gmail.com>
Subject: Re: [PATCH 0/5] Add display support for Qualcomm SA8775P platform
To: Mahadevan P <quic_mahap@quicinc.com>
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run, 
 marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, swboyd@chromium.org, 
 konrad.dybcio@linaro.org, danila@jiaxyga.com, bigfoot@classfun.cn, 
 neil.armstrong@linaro.org, mailingradian@gmail.com, quic_jesszhan@quicinc.com, 
 andersson@kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 quic_kalyant@quicinc.com, quic_jmadiset@quicinc.com, 
 quic_vpolimer@quicinc.com
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

On Tue, 24 Sept 2024 at 09:16, Mahadevan P <quic_mahap@quicinc.com> wrote:
>
>
> On 9/12/2024 1:26 PM, Dmitry Baryshkov wrote:
> > On Thu, Sep 12, 2024 at 12:44:32PM GMT, Mahadevan wrote:
> >> Add support for mdss and dpu driver on Qualcomm SA8775P platform.
> >>
> >> ---
> >> This series depends on following series:
> >> https://lore.kernel.org/all/20240816-sa8775p-mm-v3-v1-0-77d53c3c0cef@quicinc.com/
> > As such, it probably can not be merged before 6.14 (the mentioned series
> > will go on 6.13, we usually don't do cross-tree merges into drm). Please
> > rework the bindings to drop the dependency (it is possible, use fake
> > nodes instead of using dispcc + ID). Then you can specify that only the
> > DTS patch depends on the dispcc support, allowing driver changes to go
> > in first.
>
>
> Can we use clocks = <&dummy_dispcc 0>, <&dummy_dispcc 1>,
> <&dummy_dispcc 2>; instead of  clocks =  <&dispcc0
> MDSS_DISP_CC_MDSS_AHB_CLK>, <&dispcc0 MDSS_DISP_CC_MDSS_MDP_LUT_CLK>,
> <&dispcc0 MDSS_DISP_CC_MDSS_MDP_CLK>; in dt bindings?

Please take a look at how other platforms solved that already rather
than inventing a new way. For example, see sm7150, sm8650, x1e80100.

>
> >
> >> ---
> >>
> >> Mahadevan (5):
> >>    dt-bindings: display/msm: Document MDSS on SA8775P
> >>    dt-bindings: display/msm: Document the DPU for SA8775P
> >>    drm/msm: mdss: Add SA8775P support
> >>    drm/msm/dpu: Add SA8775P support
> >>    arm64: dts: qcom: sa8775p: add display dt nodes
> >>
> >>   .../display/msm/qcom,sa8775p-dpu.yaml         | 120 +++++
> >>   .../display/msm/qcom,sa8775p-mdss.yaml        | 225 ++++++++
> >>   arch/arm64/boot/dts/qcom/sa8775p.dtsi         |  85 +++
> >>   .../msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h   | 485 ++++++++++++++++++
> >>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |   3 +-
> >>   .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   3 +-
> >>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   3 +-
> >>   drivers/gpu/drm/msm/msm_mdss.c                |  10 +
> >>   8 files changed, 931 insertions(+), 3 deletions(-)
> >>   create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sa8775p-dpu.yaml
> >>   create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
> >>   create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
> >>
> >> --
> >> 2.34.1
> >>



-- 
With best wishes
Dmitry
