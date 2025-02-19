Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93933A3CD6D
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 00:24:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDDA710E8AB;
	Wed, 19 Feb 2025 23:24:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rEBMraJG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 310 seconds by postgrey-1.36 at gabe;
 Wed, 19 Feb 2025 23:24:32 UTC
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28B1C10E8A9;
 Wed, 19 Feb 2025 23:24:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id EA9BF61237;
 Wed, 19 Feb 2025 23:19:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6D54C4CED1;
 Wed, 19 Feb 2025 23:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740007161;
 bh=Um6KDVtjj/1Q+GA8/c1ulY+pNu3rjuUxz6Ww640jVDM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rEBMraJGAmvESM6pAv6dzebKxMKStV5tXLXYF9LU2CjsBcpShjQVOKYOemmh1NT9G
 u4Io0QJCw7Kau2a8GILje5TbO2bDbPIr2GXcoR5ocLiVEVonrBl7pDf1FlkFM07sOF
 XyO/WrcwpgjTqq3xzGH7G9OWOgELJCmMjST5L7Wruqxc0eCnFukoXx6Av/iMheARuC
 EBzTcBilNx0a61tQqMTapWHdoccjWQUm3odP2eiK2T2LIE5yeI6DoJFmIUrk0EkBMB
 q9jMH91Dfp1dV25TShmkBWNbKfaXEDeFmEg52JjSOOABQfOlmGcAl3sZMTz0pOuUU4
 P6fLJ9m/poJqQ==
Date: Wed, 19 Feb 2025 17:19:20 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>, devicetree@vger.kernel.org,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 linux-kernel@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Jonathan Marek <jonathan@marek.ca>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>,
 Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v2 01/16] dt-bindings: display/msm: dsi-controller-main:
 Combine if:then: entries
Message-ID: <174000715960.3160076.7982262940377785281.robh@kernel.org>
References: <20250217-b4-sm8750-display-v2-0-d201dcdda6a4@linaro.org>
 <20250217-b4-sm8750-display-v2-1-d201dcdda6a4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217-b4-sm8750-display-v2-1-d201dcdda6a4@linaro.org>
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


On Mon, 17 Feb 2025 17:41:22 +0100, Krzysztof Kozlowski wrote:
> Several devices have the same clock inputs, thus they can be in the same
> if:then: clause, making everything smaller.  No functional impact.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/display/msm/dsi-controller-main.yaml  | 64 ++--------------------
>  1 file changed, 5 insertions(+), 59 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

