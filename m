Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E78BF09E4
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 12:42:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FE1F10E40E;
	Mon, 20 Oct 2025 10:42:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Zl4Jb5px";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C84010E40D;
 Mon, 20 Oct 2025 10:42:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 96CD661E09;
 Mon, 20 Oct 2025 10:42:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEF49C116B1;
 Mon, 20 Oct 2025 10:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760956923;
 bh=y88yYtIPcaKLSXHBMpyAJOyLtM4yqPgxQ5m4nmmLOt8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zl4Jb5pxnPEcz+uK0jeCu2YANwi9b1R3aLdth2hh2VBk5w310sxGKnJV6I/KVz/gm
 JGM2jZ0GYDpQNaGfvoFVKKg29WL/gVsIGjHQyyD3dM01n1cJ0QApF+wOaIEw8zYN1B
 vNNChZ2ndEQC3PegGl9+yAV50B+W9TYzU38legl9hbpashEOVFJ/sJE/C2D6KMmThc
 psrQEfoqHw+Fz3tJbUs2eSN3PHEbMHk+PRh5f2B2lrF5+yQyp8jNhr9zec3C7ufZOg
 AeNBPcDLUITnlrn7TZdbfpBKGi9I1iAxGJ8zFmUnuBxPWm4bJov/iEdJRZY4ZIS0xE
 bH7itmnJ4ewAA==
Date: Mon, 20 Oct 2025 12:42:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/7] dt-bindings: display: msm: Document the Glymur
 Mobile Display SubSystem
Message-ID: <20251020-swinging-herring-of-coffee-adfdea@kuoka>
References: <20251014-glymur-display-v2-0-ff935e2f88c5@linaro.org>
 <20251014-glymur-display-v2-1-ff935e2f88c5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251014-glymur-display-v2-1-ff935e2f88c5@linaro.org>
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

On Tue, Oct 14, 2025 at 03:38:26PM +0300, Abel Vesa wrote:
> Add MDSS/MDP display subsystem for Qualcomm Glymur SoC, which is
> is 2 minor version increase compared to SM8750.

This suggests that at least some of the compatibles listed in the
binding would be compatible with SM8750. None of them are, so I find the
message confusing.

> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  .../bindings/display/msm/qcom,glymur-mdss.yaml     | 264 +++++++++++++++++++++
>  1 file changed, 264 insertions(+)

Best regards,
Krzysztof

