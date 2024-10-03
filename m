Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B49AD98FAE4
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 01:45:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3510C10E9BC;
	Thu,  3 Oct 2024 23:45:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HIW611QG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 693CC10E9BA;
 Thu,  3 Oct 2024 23:45:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B61B35C5C57;
 Thu,  3 Oct 2024 23:45:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6589EC4CEC5;
 Thu,  3 Oct 2024 23:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727999121;
 bh=NAs1w9Pm/QkiRiaXhoHxmWIHtYDJEIlbdvaJveECviQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HIW611QGGx4Afz7XENQRvz1XXTgdwsfaVMz1frRWtPn+AdNCxryL8WeOjqECTSYM0
 FU3lUOQsUu/3JV0/+SN+5GNqTzH36Ieodz7Am6EjB8dN9AINv4zqZhT9CwuEC1JDtb
 jDmOwGsykWmJUYZUm4jwnbceuo33QQJFRqEw6e/+mPMqextPNTW/vzIfLUsn6DSBLM
 Dr+RRU2GvXZ8qFqzhkLDn/i3P4jTJWaSQu5ONr8IoquV61ST40oWTEETsM8WngIaci
 3guHKe3qfGjPrs+BS06GfqcZkC6/M61UAgcqWcoNxZbaHZ34wTf/8Srn48Gt8XTS4U
 wMN7iUVUhQ1hw==
Date: Thu, 3 Oct 2024 18:45:20 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 freedreno@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Rob Clark <robdclark@gmail.com>, David Airlie <airlied@gmail.com>,
 devicetree@vger.kernel.org, Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>, Sean Paul <sean@poorly.run>,
 linux-arm-msm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH 1/5] dt-bindings: display/msm: merge SC8280XP DPU into
 SC7280
Message-ID: <172799911629.1878572.17327003017449730476.robh@kernel.org>
References: <20241003-dt-binding-display-msm-merge-v1-0-91ab08fc76a2@linaro.org>
 <20241003-dt-binding-display-msm-merge-v1-1-91ab08fc76a2@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241003-dt-binding-display-msm-merge-v1-1-91ab08fc76a2@linaro.org>
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


On Thu, 03 Oct 2024 10:14:18 +0200, Krzysztof Kozlowski wrote:
> Split of the bindings was artificial and not helping - we end up with
> multiple binding files for very similar devices thus increasing the
> chances of using different order of reg and clocks entries.
> 
> Unify DPU bindings of SC7280 and SC8280XP, because they are the same.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/display/msm/qcom,sc7280-dpu.yaml      |   5 +-
>  .../bindings/display/msm/qcom,sc8280xp-dpu.yaml    | 122 ---------------------
>  2 files changed, 4 insertions(+), 123 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

