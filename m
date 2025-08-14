Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE531B271D0
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 00:43:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC6D410E228;
	Thu, 14 Aug 2025 22:43:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jqDCwQKK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AC3010E11D;
 Thu, 14 Aug 2025 22:43:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 00EC5A56E64;
 Thu, 14 Aug 2025 22:42:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E49AC4CEED;
 Thu, 14 Aug 2025 22:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755211378;
 bh=EXYID1DQZNvp8ko5yQcdAojT8GVsj+vCFjSTUgEPMYc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jqDCwQKKodWGi2aoDMhh4VFfJsfX8z/ZGVwIOlYWLGfU8N8dLiOnw8aPUDtK33ozn
 XHYlwVqQEYDbLW8NC1CfTqjOBylIseYqtVX5MmQEncKUTcUIEWnr2/NSqBamGdiXMo
 9r9/BZ8aD2hMEsC7VFF4YViy3Udb1coCl+bS3j/87SPV1atLQ0/CokiXkcMYdli/8f
 kGTg1WYK3O0UqGzB/5WNRFl9PfoygHeQ9BbRE21tzjrr8CVe/BmzIZL7A5ShiplyLK
 /SwsFS+TKTl/xMtMDlWWQLUeoAFGQqij+S+IwQGOiMZ3k9cUAZa5auaiP/eLN8Dj7k
 t1WHglpeot+IA==
Date: Thu, 14 Aug 2025 17:42:57 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, Dmitry Baryshkov <lumag@kernel.org>,
 Abel Vesa <abel.vesa@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Mahadevan <quic_mahap@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 David Airlie <airlied@gmail.com>, freedreno@lists.freedesktop.org,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Clark <robin.clark@oss.qualcomm.com>
Subject: Re: [PATCH v5 4/6] dt-bindings: display/msm: drop
 assigned-clock-parents for dp controller
Message-ID: <175521137747.4052414.4732058801340253621.robh@kernel.org>
References: <20250809-dp_mst_bindings-v5-0-b185fe574f38@oss.qualcomm.com>
 <20250809-dp_mst_bindings-v5-4-b185fe574f38@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250809-dp_mst_bindings-v5-4-b185fe574f38@oss.qualcomm.com>
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


On Sat, 09 Aug 2025 12:16:18 +0300, Dmitry Baryshkov wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> DP controller schema documents assigned-clocks and
> assigned-clock-parents. However these assignments should not be a part
> of the ABI: there are no actual requirements on the order of the
> assignments, MST cases require different number of clocks to be
> assigned, etc.
> 
> Instead of fixing up the documentation, drop the assigned-clock-parents
> and assigned-clocks from the bindings. The generic clock/clock.yaml
> already covers these properties.
> 
> Suggested-by: Krzysztof Kozlowski <krzk@kernel.org>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/display/msm/dp-controller.yaml         | 10 ----------
>  1 file changed, 10 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

