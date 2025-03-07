Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A452A55FA5
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 05:56:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEC9910E7CC;
	Fri,  7 Mar 2025 04:56:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sYxPicWK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 253FB10E7CC;
 Fri,  7 Mar 2025 04:56:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 9A9B6A4546A;
 Fri,  7 Mar 2025 04:50:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 795DFC4CEE3;
 Fri,  7 Mar 2025 04:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741323365;
 bh=2ZLuRs05EFLs3RD0f9DnbMQSSO8CqlO7N/wzQjxQSIw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sYxPicWKpJ28EHWTe/nUB/X51Mr3we/2sf7V7Hy8tKUdZJuGkzg17k1xkGs0D7BDp
 vqt+ZNvrWsMaSEcfV7bsWJchXzGVTs/5/DVTbuDJDitbQ+sSXJZ/QVTj5fTn392nCg
 SQsNw4ouGECX1in1qm/jfOseY46h3BHW4X25SGPy2Zo4ilbElD092GEcJROy9laJSf
 VzwNG9W3nPHcJS1hazQtnCS0lNpIT9BTWT/Zr2PcQcEiRWWc7Uoy4LtiuxZWA9cttP
 LEwgLIVJt2XlfhgtybScKaM0TlMr2cdW65owYyRl2ciez9US9WnPeHbq6mtRIODupL
 xlU+2QJ8J1uLg==
From: Dmitry Baryshkov <lumag@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] drm/msm/dpu: enable CDM for all supported platforms
Date: Fri,  7 Mar 2025 06:55:47 +0200
Message-Id: <174132327773.1133698.16972736017988736297.b4-ty@linaro.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250220-dpu-add-cdm-v2-0-77f5f0df3d9a@linaro.org>
References: <20250220-dpu-add-cdm-v2-0-77f5f0df3d9a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


On Thu, 20 Feb 2025 05:59:21 +0200, Dmitry Baryshkov wrote:
> Enable CDM block on all the platforms where it is supposed to be
> present. Notably, from the platforms being supported by the DPU driver
> it is not enabled for SM6115 (DPU 6.3), QCM2290 (DPU 6.5) and SM6375
> (DPU 6.9)
> 
> 

Applied, thanks!

[1/5] drm/msm/dpu: rename CDM block definition
      https://gitlab.freedesktop.org/lumag/msm/-/commit/51bc064005c5
[2/5] drm/msm/dpu: enable CDM_0 for DPUs 5.x+
      https://gitlab.freedesktop.org/lumag/msm/-/commit/15f2825defeb
[3/5] drm/msm/dpu: enable CDM_0 for DPUs 1.x - 4.x
      https://gitlab.freedesktop.org/lumag/msm/-/commit/d5c1e00ea2de
[4/5] drm/msm/dpu: enable CDM_0 for SC8280XP platform
      https://gitlab.freedesktop.org/lumag/msm/-/commit/b5bbf4fab0a9
[5/5] drm/msm/dpu: enable CDM_0 for X Elite platform
      https://gitlab.freedesktop.org/lumag/msm/-/commit/989a24211eaf

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
