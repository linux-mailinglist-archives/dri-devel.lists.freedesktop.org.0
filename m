Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83730861EE8
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 22:24:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C947010ECD4;
	Fri, 23 Feb 2024 21:24:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ZDASKHJ9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com
 [209.85.219.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2057810ECD5
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 21:24:32 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id
 3f1490d57ef6-dc6d24737d7so1170577276.0
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Feb 2024 13:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708723471; x=1709328271; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=akuPkkgI0y/oHinOKr0HxoZmwUf171P0m6vGM5/O5Js=;
 b=ZDASKHJ9MFjyjz1SPVySQ+izlWWRkI3yArPa13CKM90KaDV7njpTTmdt5sBD4BHbu3
 lvmjm3aralPoH7NMUuZtvSo85/kh0trJS8nqO/+SPkdirybzfcnQhl9q3AE9g0E21ZaA
 wuU1RyHxNNDC5zzkdaRdl48plsDuRpeYyFOxr8Nc6lSsctBerBhaEiQF6cqMdbG50zS6
 tDWVFrupy9boHEPzF3w00NkP/qiKoBfCsp/0968/5+8rC0OvmMSMLGqZjud0NnNmmDjy
 Fltx/DkCBYnRN3wQxmV4hgv/AXS0aKTUNrEOcBMtzck3y74acoSvMyQyjsFEhnyhbpX3
 XvGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708723471; x=1709328271;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=akuPkkgI0y/oHinOKr0HxoZmwUf171P0m6vGM5/O5Js=;
 b=F9Byj8NJihfMqbpRNOqfEA7fNxD0gljfmzbMpR8U+rC09ZnPJxulwXBcGftPTIQcdS
 W8tZfMysv7kVeIWAov4oGG5CyGO9wEkL/yJ2ztyPPfJgv90VIo4WbYKuipVLhNs98BdB
 WrGz7qtXzoRTH5eITxcmxry6Tk3Bf2qActXkq5DBGEKFetLDD1L1bWOO86plXupjd0qo
 2Orm+NkIBomVOFQLkYy5mJGAdlGpTDL6NJZziNiZPoXKwWIEEE8QiTHlhL2WoGD3BSx6
 yFHNbDG1nPwrkTCoknaonJlRVtuHIu/AeqV9O8aazv3KW1EQqh35dJDRWwU/eC4eR5Ep
 w6CA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVidPW9ha1hinHkkLw9e+zUQgJ/2pTgkjEfFOPMuFkjMQLeHjk4uDhQi3v0+vG11EKeX58l6Hhw/a4ol1MPFXKFqFoSSMmyAVB4faQSMcep
X-Gm-Message-State: AOJu0Yya8HGRHng70v43XlPip+KOnqf46OLctm9KQOmxgF/cTbBw3eZy
 vh8dsN4UUOt1ZRq/XhXG0BTibvTid+k6lOWJY/5fc4j+PbmYAlmH0wzPFXt79l8n0EthNs8wcYw
 NbJKAwg42jVHeU/OzkI6wLLgwbol7nzdfN0CIVw==
X-Google-Smtp-Source: AGHT+IFbG9R3qzPDyULutJwOdT2KkYVwoLnuTNnZQAQUOT10IOJuFq9jx8p8pvPNgR7Ok5iVzV0j+sTC9nwDRCxlZ88=
X-Received: by 2002:a25:c511:0:b0:db9:9537:2c39 with SMTP id
 v17-20020a25c511000000b00db995372c39mr1121626ybe.2.1708723471023; Fri, 23 Feb
 2024 13:24:31 -0800 (PST)
MIME-Version: 1.0
References: <20240219-topic-rb1_gpu-v2-0-2d3d6a0db040@linaro.org>
 <20240219-topic-rb1_gpu-v2-2-2d3d6a0db040@linaro.org>
In-Reply-To: <20240219-topic-rb1_gpu-v2-2-2d3d6a0db040@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 23 Feb 2024 23:24:19 +0200
Message-ID: <CAA8EJprR=tPUsFit7DEzh0U9TDOm8TY29m=JVJwXQwH6vEN49A@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] clk: qcom: clk-alpha-pll: Add HUAYRA_2290 support
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-kernel@lists.infradead.org, 
 iommu@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
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

On Fri, 23 Feb 2024 at 23:21, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> Commit 134b55b7e19f ("clk: qcom: support Huayra type Alpha PLL")
> introduced an entry to the alpha offsets array, but diving into QCM2290
> downstream and some documentation, it turned out that the name Huayra
> apparently has been used quite liberally across many chips, even with
> noticeably different hardware.
>
> Introduce another set of offsets and a new configure function for the
> Huayra PLL found on QCM2290. This is required e.g. for the consumers
> of GPUCC_PLL0 to properly start.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/clk/qcom/clk-alpha-pll.c | 47 ++++++++++++++++++++++++++++++++++++++++
>  drivers/clk/qcom/clk-alpha-pll.h |  3 +++
>  2 files changed, 50 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
