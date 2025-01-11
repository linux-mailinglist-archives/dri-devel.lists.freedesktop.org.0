Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB3AA0A26C
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jan 2025 10:51:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F44310E4CD;
	Sat, 11 Jan 2025 09:51:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BIjTofQn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8120C10E0CC;
 Sat, 11 Jan 2025 09:51:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 864E05C4D89;
 Sat, 11 Jan 2025 09:51:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82EE6C4CED2;
 Sat, 11 Jan 2025 09:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736589103;
 bh=PktPUpb/tRLHLjiGg+FbkVcP6k7A0rn964PryI06Log=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BIjTofQn1SJrvkJolD3wL/WDhla1G9vLMPrfVwaqOHYyS2UwV6rjcP19ZKzsj9SKI
 srNs4urpo1hzmUnmTkjb2XwuwLCNKLqG6ZyEPfRK1Xtt5aFo/GLydq0+7ayhg3htWD
 HY2BxhxTXTrpF3wjGMWna7CpNVwJ3YMI0f+pVAb4BrI2mQe4nZMa4ZeSo/LUa5zBEH
 TQPxIZUkGDybUsdBc/0RqdBeCzEatXSwVMgwsA44wE6afll7vTI7ppmFTGvIbJvxl4
 9AEJrHV0NHrbfL8Ox2ErFXZRyOm2yMORZkFFn1gpBG1/XkvvhwHQWl9JWqCxDMOJ+D
 OZXSgD7KCWboA==
Date: Sat, 11 Jan 2025 10:51:39 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 3/4] dt-bindings: nvmem: qfprom: Add X1E80100
 compatible
Message-ID: <dqirlou2bcntkqo3t7hnkigvgrtfm5fh5nufks55mfaqyis7hg@6gu6xfk6gz74>
References: <20250109-x1e-speedbin-b4-v1-0-009e812b7f2a@quicinc.com>
 <20250109-x1e-speedbin-b4-v1-3-009e812b7f2a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250109-x1e-speedbin-b4-v1-3-009e812b7f2a@quicinc.com>
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

On Thu, Jan 09, 2025 at 04:12:40AM +0530, Akhil P Oommen wrote:
> Document compatible string for the QFPROM on X1E80100 platform.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---

This shouldn't be really RFC...

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

