Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01184C2F326
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 04:49:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 624E210E508;
	Tue,  4 Nov 2025 03:49:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YCoXatok";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1E0B10E508;
 Tue,  4 Nov 2025 03:49:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 29F46444A5;
 Tue,  4 Nov 2025 03:49:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33761C4CEF7;
 Tue,  4 Nov 2025 03:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762228176;
 bh=6pjQezU4iwekhElF+PBuaDe7tVtkK82fk5KyzqXZ8Cw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YCoXatokCFxgWqIhTzyTAdEYOahZgkdImF9ovuBfWpKFctgxRRSzyE9Egag2hKZej
 DovnzgGxYSntC/DoKCHBW0+X8MtqT61p0TtPrh5EWor7chSFr1v5n3oUK6v2A0iSyx
 zcggZIw7Eu7PHzY0tCDEeT5HLORySxOGJZhPyAnplgDWFPE13JoZbmUXGVcd+Hp7Qb
 WtdUiywXmFq2l164tZek/Szryui98qGlgwKoeKbjVv/bP4fqru1TO8uX6QnZ+5wOZf
 TjS4rE3OmzY8ExnBmZR7OX6W6iw+9GCDXI6Sxspsr+Rd4+mR43VlrHdKlnQrv6UiNu
 V2gnxLxE5/Gjg==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH 00/17] drm/msm/adreno: Introduce Adreno 8xx
 family support
Date: Mon,  3 Nov 2025 21:53:00 -0600
Message-ID: <176222838011.1146775.11549730263195869073.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
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


On Tue, 30 Sep 2025 11:18:05 +0530, Akhil P Oommen wrote:
> This series adds the A8xx HWL along with Adreno 840 GPU support to the
> drm-msm driver. A8x is the next generation in the Adreno family,
> featuring a significant hardware design change. A major update to the
> design is the introduction of 'Slice' architecture. Slices are sort of
> mini-GPUs within the GPU which are more independent in processing Graphics
> and compute workloads. Also, in addition to the BV and BR pipe we saw in
> A7x, CP has more concurrency with additional pipes.
> 
> [...]

Applied, thanks!

[01/17] soc: qcom: ubwc: Add config for Kaanapali
        commit: 85d55d8cc3ef7f77b249c97e9fac6a0fc5f5daa7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
