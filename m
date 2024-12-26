Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 941B39FCE8E
	for <lists+dri-devel@lfdr.de>; Thu, 26 Dec 2024 23:39:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9595B10E031;
	Thu, 26 Dec 2024 22:39:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HPD66hky";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [IPv6:2604:1380:45d1:ec00::3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ED6B10E031;
 Thu, 26 Dec 2024 22:39:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id AA679A40F53;
 Thu, 26 Dec 2024 22:37:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3627C4CEDE;
 Thu, 26 Dec 2024 22:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1735252753;
 bh=zzHpg02nt2xCzx11z3qrPTPt9BM7ACn4sX/GXztIxTA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HPD66hkyp6ULiLZXVVRtebU8omymUvvQ5tyb6NNu7Zjb5rPsoV6+LqUPyqKMV9BDY
 WBb8rplUSniQ5Zt54PRmW6ALOmYx71t45dHQXeaCE5rvRvkMfK7u0G3tnKcnVUN7Id
 etXoVXDg4Kaf+oyoLL63VV8xaiFmkQ+ZXNNf2hVquXpv6ZkJz2tMVzPaInDYMWzF3T
 Gc1vluxcP3Pf6PEj0nu3INYMdT6m6vQ3yOqYFbDNgGKMyr+cvmLIaDdu/ahA4Y7pkd
 VtK5LVAQ10OBgT3d8SixJ0Et575CCX6+iOhxZtzKobdLJAHDMs/Fxg1HuVZk5NGoEp
 g77FEx4NghSzw==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konradybcio@kernel.org>,
 Richard Acayan <mailingradian@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: (subset) [PATCH v2 0/4] drm/msm/adreno: Add A615 GPU for SDM670
 and Pixel 3a
Date: Thu, 26 Dec 2024 16:38:42 -0600
Message-ID: <173525273245.1449028.4895991910861314242.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20240806214452.16406-7-mailingradian@gmail.com>
References: <20240806214452.16406-7-mailingradian@gmail.com>
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


On Tue, 06 Aug 2024 17:44:54 -0400, Richard Acayan wrote:
> This adds support for the speed-binned A615 GPU on SDM670.
> 
> Changes since v1 (20240730013844.41951-6-mailingradian@gmail.com):
> - add Acked-by tag (1/4)
> - add OPPs exclusive to some speed bins (3/4)
> - enable GMU by default (3/4)
> 
> [...]

Applied, thanks!

[3/4] arm64: dts: qcom: sdm670: add gpu
      commit: cd89483a1327c0317a655cca1daf9521c7ec7529
[4/4] arm64: dts: qcom: sdm670-google-sargo: enable gpu
      commit: fbf7cfa3ea986e5bf426748aa8afa386df61456f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
