Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3F785A6A7
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 15:57:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E314710E3BF;
	Mon, 19 Feb 2024 14:57:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ScV4WooM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com
 [209.85.128.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CA1B10E3BF
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 14:57:35 +0000 (UTC)
Received: by mail-yw1-f173.google.com with SMTP id
 00721157ae682-6080beb19ddso20186187b3.1
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 06:57:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708354654; x=1708959454; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Szw+QTMnTAcQAZlNeYyyrJj6KbWZ+5DPKy/5tGrWbDo=;
 b=ScV4WooM83ZSMZVq3ii3kVK/JRFWOZ/80EQ/r1XAtrEOiiqO2hVgy1ldLZgYlaAfLQ
 67ABt8Ox/zJlvLLdm825X6tV1NYFIY6K3i775Mk+AOb/oksMsNLQpBkW6Qj+D2wfAvBk
 kDmQTOsjrfHJRcbs1IyjNPHguWBPU33k4Ie34GtrZhdNb5gGmxiDeRj5OCvFCRqTIoas
 oAOAQOGpGeQRDkid8bOPxYWkSWkYBG+PtGUAKEkK/Xggt7tbZOyFDt8vRIzNQvvo+737
 FJ4xm1XMB0VubSrJLjalWAJDvljiAW6YgCOzsmU1ciFPl5MP/p3Cy1IKb4fqFiW64mKC
 enbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708354654; x=1708959454;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Szw+QTMnTAcQAZlNeYyyrJj6KbWZ+5DPKy/5tGrWbDo=;
 b=fCQbYE7IadLhhdtVLWjPeSPznoZz8XV7mkVPnqEkLpiBfo9WkAnblLRACv4N5Vs2Mp
 SFqH5XfdhCy0Wx7PY9lOcFdOhAC5k/tgfjgUllbYIkxFox72L9oqcb5A2l2e9/IzY9+F
 1wB59FDN3ny1gz9cVe1p4Ttb3lopKii3x7jsotBVt+bfFWbgWpeqPV8TgskhndVi1V1J
 VQqEMCQ+QIVcJsrtVI5wIF7Wo6gYPMmcEkHNT++XrvxNUXCEJXoZxsiHjArZ5zG4pqFf
 wy/eTwl9YmVzRXyCh6kyGjpHJq11F4lF282UhcoTuxMD2ouxv6QACdpStirao8cuXTrZ
 p/XA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXvOQRffici0Rk4iWKTts/jCV3JyUYexQX7lQv+npTqfNTh/BC+a9vL/RnVReENMw+bpL89n1Y8bIWkzmxRB0rsvMNLET2eWepDhcwNx4hN
X-Gm-Message-State: AOJu0Yw1xyRlfLujQsQbMYhJIjCbNFELDNcFMvb+NvyLuR9cAG/TtWOv
 1Q5Pn1jCjFigmFFRxldWREagKf724qHUpS9P9xGIji7JSIVkxnZGNy77W6kRfIdt1rAFXaMB8tc
 SMWW9TPQTh/r31/vhyVrZGukAEDeM07nGTOE7tA==
X-Google-Smtp-Source: AGHT+IFwS+iE/0NQYgsx7qVKwDMppWGjVew2/XzNi/ojh9QbxDe0oOmgCSu0UPBrXtjFjsGyUMyo5ZWdgudhKw5Ujrs=
X-Received: by 2002:a81:490e:0:b0:608:ba5:729d with SMTP id
 w14-20020a81490e000000b006080ba5729dmr6119664ywa.19.1708354653839; Mon, 19
 Feb 2024 06:57:33 -0800 (PST)
MIME-Version: 1.0
References: <20240219-topic-rb1_gpu-v1-0-d260fa854707@linaro.org>
 <20240219-topic-rb1_gpu-v1-7-d260fa854707@linaro.org>
In-Reply-To: <20240219-topic-rb1_gpu-v1-7-d260fa854707@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 19 Feb 2024 16:57:23 +0200
Message-ID: <CAA8EJprpZxCV-3xkE0OuGg4jHrHcb=EPKCi_wSy5viP7jVwPvg@mail.gmail.com>
Subject: Re: [PATCH 7/8] arm64: dts: qcom: qcm2290: Add GPU nodes
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

On Mon, 19 Feb 2024 at 15:36, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>
> Describe the GPU hardware on the QCM2290.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/qcm2290.dtsi | 154 ++++++++++++++++++++++++++++++++++
>  1 file changed, 154 insertions(+)
>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
