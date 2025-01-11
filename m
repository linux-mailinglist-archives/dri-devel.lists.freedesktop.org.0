Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 633ACA0A270
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jan 2025 10:52:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2FC210E56B;
	Sat, 11 Jan 2025 09:52:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UQs5mjEp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35D3310E0CC;
 Sat, 11 Jan 2025 09:52:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id CCEC1A406D1;
 Sat, 11 Jan 2025 09:50:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0000DC4CED2;
 Sat, 11 Jan 2025 09:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736589122;
 bh=tGKSfvWlIMipvHYav8xp3Z6hEOUagetMjdcm0V8O+Ps=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UQs5mjEp8Equ5Bd7h0U5rypvCHcqAs/Ebpq1AO+cjDI+t+Qpyzm0FE/+Xdb2B/Ynq
 nO5rjSneN80Bv3aZy62sqRtD7CkHwssDEU5hwAanpRx3kzRBscTYQwQMZKfDY4Sd+6
 BfbMXv3ol4R9XLac0Z6ykAMG6eqTtb9yEggC3lEiG6IChJqPGoCum9WwymJLez3Rza
 oAHZOYsb/44azfABVET3KmYCJXGYTxAhUVkNDgABq0muWesODI/MkhYqmEy5TJf06P
 e/cr/Um7MI9fIvGp2dVgPHwgdwPId/FgRdGvEaNzqx2x/oKwAKJzARp3GVPJhiWgBj
 7kZBIV85x/mIg==
Date: Sat, 11 Jan 2025 10:51:59 +0100
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
Subject: Re: [PATCH RFC 2/4] dt-bindings: power: qcom,rpmpd: add Turbo L5
 corner
Message-ID: <pwfbagd4fxhjwu5h23ztrpoghhdu7ia372rmlgivmzkxm6hu2m@jfzefdzvjrif>
References: <20250109-x1e-speedbin-b4-v1-0-009e812b7f2a@quicinc.com>
 <20250109-x1e-speedbin-b4-v1-2-009e812b7f2a@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250109-x1e-speedbin-b4-v1-2-009e812b7f2a@quicinc.com>
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

On Thu, Jan 09, 2025 at 04:12:39AM +0530, Akhil P Oommen wrote:
> Update the RPMH level definitions to include TURBO_L5 corner.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>  include/dt-bindings/power/qcom-rpmpd.h | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

