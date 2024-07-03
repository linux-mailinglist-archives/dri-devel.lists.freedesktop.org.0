Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C59D1924FAC
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 05:37:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5477010E520;
	Wed,  3 Jul 2024 03:37:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uW2P6mGi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0B9A10E520;
 Wed,  3 Jul 2024 03:37:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 77E65CE0203;
 Wed,  3 Jul 2024 03:37:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFD04C116B1;
 Wed,  3 Jul 2024 03:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719977871;
 bh=832WPZNjC2cU1NTJdZRlTwMLNqACMwDQnZTUfdgZRQI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uW2P6mGinY+vgnxllheTht2kHIOnVn6AF8LR817cLCQSSl26lQNsBQZC3P0483kEu
 aYkb+XU2AAsOSzpLt4lIPndZI8f7dq65Uxy3f0k0ZakxH0tcyv+mjhU84ZY0cWMyRj
 RUuErauTxXB+ljtzCTI0hDQJZIoGhEwtFwCfRK7YSqp35TaQI/BZbJEcGX9ispTSvd
 1cQV+jsmB9HFeYWDlxjHmi0GzJhhjKSnEx7JFUFOCQdZtxXKteSmzx+9aVdeaN8a2O
 j4h5qpJwPivQd6F46ZQMg3mLdkojEghuODdJmB1/sT/IDTL3TxywQ6SxZVwD3hAeOJ
 X5tGXypFY9FVw==
From: Bjorn Andersson <andersson@kernel.org>
To: freedreno <freedreno@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS <devicetree@vger.kernel.org>, 
 Rob Clark <robdclark@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Will Deacon <will@kernel.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>, Joerg Roedel <joro@8bytes.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Sean Paul <sean@poorly.run>,
 Thomas Zimmermann <tzimmermann@suse.de>, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/5] Support for Adreno X1-85 GPU
Date: Tue,  2 Jul 2024 22:37:33 -0500
Message-ID: <171997785354.348959.17891390714770433970.b4-ty@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240629015111.264564-1-quic_akhilpo@quicinc.com>
References: <20240629015111.264564-1-quic_akhilpo@quicinc.com>
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


On Sat, 29 Jun 2024 07:19:33 +0530, Akhil P Oommen wrote:
> This series adds support for the Adreno X1-85 GPU found in Qualcomm's
> compute series chipset, Snapdragon X1 Elite (x1e80100). In this new
> naming scheme for Adreno GPU, 'X' stands for compute series, '1' denotes
> 1st generation and '8' & '5' denotes the tier and the SKU which it
> belongs.
> 
> X1-85 has major focus on doubling core clock frequency and bandwidth
> throughput. It has a dedicated collapsible Graphics MX rail (gmxc) to
> power the memories and double the number of data channels to improve
> bandwidth to DDR.
> 
> [...]

Applied, thanks!

[5/5] arm64: dts: qcom: x1e80100: Add gpu support
      commit: 721e38301b79a6ee8375cb0ebd586699a7f353e3

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
