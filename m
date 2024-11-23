Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5C89D69F5
	for <lists+dri-devel@lfdr.de>; Sat, 23 Nov 2024 17:15:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 631BC10E471;
	Sat, 23 Nov 2024 16:15:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WlL8wfQI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C979510E246;
 Sat, 23 Nov 2024 16:15:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8216D5C0740;
 Sat, 23 Nov 2024 16:14:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34638C4CECD;
 Sat, 23 Nov 2024 16:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1732378530;
 bh=aFqOexa4IuS4Qk6HkPBylQSk76DY92gyVsr7yse+4R0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WlL8wfQIQ175OPh+ZQsI3Mbu5COm0FMjfoeeoe8OIAXddyOGZ9DNI7H+Sv2NqnmO4
 AWw7VHKrl1r1e134LWh6sixEKc+SO/74Ef2Om2bBmqKHN67VJR8ShdoZ73hKYJooWY
 j4FbxdNFTvcAJcV/0YLjJ4bJwg0m+rlRqMlqbGzfURFhaEC/jz+xjcRqJJc1A+c9vj
 0MZPozl9ujeR3Mi68h5iSTbMFgcBfKOj6u7996nTYOBXGi9CS5ZlZf9PbUHqrgd5wP
 QzdUMDD8qRQoX1zvywnF6MXRwiw68cEPPYvAf2MYejUnfFKquR6lbfKRk8oGqvBJB5
 vdeaoEqkN7B0Q==
Date: Sat, 23 Nov 2024 17:15:27 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fange Zhang <quic_fangez@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Li Liu <quic_lliu6@quicinc.com>, 
 Xiangxu Yin <quic_xiangxuy@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 3/9] dt-bindings: display/msm: Add SM6150 MDSS & DPU
Message-ID: <2nqtuatl63ajcahsmhvg3bmfipfhppfkygwh6as7zzwgxzipoo@hcvuv57sqpqu>
References: <20241122-add-display-support-for-qcs615-platform-v3-0-35252e3a51fe@quicinc.com>
 <20241122-add-display-support-for-qcs615-platform-v3-3-35252e3a51fe@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241122-add-display-support-for-qcs615-platform-v3-3-35252e3a51fe@quicinc.com>
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

On Fri, Nov 22, 2024 at 05:56:46PM +0800, Fange Zhang wrote:
> From: Li Liu <quic_lliu6@quicinc.com>
> 
> Document the MDSS and DPU hardware found on the Qualcomm SM6150 platform.
> 
> Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
> Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
> ---

This has a build failure, but nothing here explains dependency.

This cannot be merged and due to build failure cannot be tested by
automation.

Sorry, no review from me, please wait till dependencies come in or
decouple series. Anyway otherwise this *CANNOT* be applied by
maintainers...

Best regards,
Krzysztof

