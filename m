Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA8BA10195
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 08:57:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6AE510E35B;
	Tue, 14 Jan 2025 07:57:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UoSLtcyo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A803310E33D;
 Tue, 14 Jan 2025 07:57:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A4CFF5C56E1;
 Tue, 14 Jan 2025 07:56:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F08EC4CEDD;
 Tue, 14 Jan 2025 07:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736841427;
 bh=ZloWZNduwAPjDvbGadMXp2gP8vQf1XX1e+wOh0WKm7o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UoSLtcyoyKBgQ0ahEo0MIpQJ5CIHFw61HjTFG2rLHJKe/RQ8eqfVGEEbT9uBFIQ1Y
 f1UuX4Bzdl4DPrVun1gYmxjAwRxBWMiBeT+/6EU8QlZZx8r3iolZazKFa92DeE1guA
 XWw5iy9Ixx9Pv2Rhn1LmOjLDlZquKEnx6CZsVC/TPTQZuyZ+D0r/7PAj84UaWciOjH
 0TihPtxkTLaTjhSLbKkV3m4B7UUknwEo9o1a8rURDRXsSfA4z+pdWtCrzSp5kOXjMJ
 wK+C/MaUZpVPOUEQwo5ekuY2uVCMbkUyTVg0iUMCsf/POPIhoWog6Ug1v3RNUa7V1v
 Qt6jRxWMgcsOA==
Date: Tue, 14 Jan 2025 08:57:04 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v3 3/4] dt-bindings: display/msm: Document MDSS on QCS8300
Message-ID: <lyv4bopv3zw62qll5cjjx46ejdjjmssvhabdxj2uq23mcmwqpb@lld6hynsiwfe>
References: <20250113-mdssdt_qcs8300-v3-0-6c8e93459600@quicinc.com>
 <20250113-mdssdt_qcs8300-v3-3-6c8e93459600@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250113-mdssdt_qcs8300-v3-3-6c8e93459600@quicinc.com>
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

On Mon, Jan 13, 2025 at 04:03:10PM +0800, Yongxing Mou wrote:
> +patternProperties:
> +  "^display-controller@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +
> +    properties:
> +      compatible:
> +        items:
> +          - const: qcom,qcs8300-dpu
> +          - const: qcom,sa8775p-dpu
> +
> +  "^displayport-controller@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +
> +    properties:
> +      compatible:
> +        items:
> +          - const: qcom,qcs8300-dp
> +          - const: qcom,sm8650-dp

Parts of qcs8300 display are compatible with sa8775p, other parts with
sm8650. That's odd or even not correct. Assuming it is actually correct,
it deserves explanation in commit msg.

Best regards,
Krzysztof

