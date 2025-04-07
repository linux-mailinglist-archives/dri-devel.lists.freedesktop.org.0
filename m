Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5AEA7DF74
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 15:37:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2136E10E474;
	Mon,  7 Apr 2025 13:37:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CAOTyETx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 914B810E469;
 Mon,  7 Apr 2025 13:37:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2C7D161148;
 Mon,  7 Apr 2025 13:36:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 103DEC4CEDD;
 Mon,  7 Apr 2025 13:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744033022;
 bh=z2YPPx/huYycm4RmyXI94B1UPAuAdtuMmpycOF2eNfE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CAOTyETxd6/g/MkX2N0+SDWbWzuP8ChrEt+8pQsd8Z1UN96yLAPX3mrm6rJKWgLc/
 GP3x7AwaHvtA0Jtsx74qQL2k+hZvMWDteDH/YB3GoICpZh4luvFSChhFJHTH/lrV20
 b+hXqyVtsiPwIggNMD8GmUD89BGniYLY3gCSsYq2n5lrrqmhhmW7ymG9qjFjP9yL3G
 /21cC3rQ6NjDx16wg2OaOfTpM7WbaY3YLdy1K6ptgw2JG8eYkTxWxNzd7W8wntLB0W
 4Tfy8s1qXT8M64MxdC+TayfHbH8QdysTiNhdTtVqqRFlGfQW4YpwRQqzBksqUAloUU
 COfTxc/kQ16Aw==
Date: Mon, 7 Apr 2025 08:37:01 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 dri-devel@lists.freedesktop.org, Simona Vetter <simona@ffwll.ch>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>,
 Rob Clark <robdclark@gmail.com>, Konrad Dybcio <konradybcio@kernel.org>,
 freedreno@lists.freedesktop.org, ~postmarketos/upstreaming@lists.sr.ht,
 Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: msm: qcom,mdss: Document interconnect
 paths
Message-ID: <174403302028.2068916.9679649068590207721.robh@kernel.org>
References: <20250406-msm8953-interconnect-v1-0-a23e22e236e0@lucaweiss.eu>
 <20250406-msm8953-interconnect-v1-1-a23e22e236e0@lucaweiss.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250406-msm8953-interconnect-v1-1-a23e22e236e0@lucaweiss.eu>
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


On Sun, 06 Apr 2025 22:55:03 +0200, Luca Weiss wrote:
> Document two interconnect paths found on the MDSS on MSM8953.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
> There's also some interconnect paths defined in the mdp5 schema, both
> drivers accept it. Newer mdss schemas seem to prefer mdp0-mem + cpu-cfg
> in the mdss schema instead of in the dpu subnode. Since there's no
> cpu-cfg defined with mdp5, I've added these paths here.
> ---
>  Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

