Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B492E730474
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 18:00:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9966510E467;
	Wed, 14 Jun 2023 16:00:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F023310E0B4;
 Wed, 14 Jun 2023 16:00:17 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0A9BF6441B;
 Wed, 14 Jun 2023 16:00:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82BF2C433CC;
 Wed, 14 Jun 2023 16:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686758416;
 bh=zPad16VQA2o+Tv/QSFx5CXwfrqAoNBmN4FNn4dNqSfE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IqIz4aoYiZIynb4a0IkxtYp1hA3pbZdfOEr9EI/SmjMoK+97BonO9VYTXDWyARNvQ
 gD7yeeIcvMI2ffB/UTlLDd7ftokEJwxtWJzu26+2kTVfStFkKgcIHir2V089tlk1XS
 auPJV9J3SyvAc83wz4nRNY9mzRfvVIUtM/61LTB9PGQLSRD0nbaRU88wBXPvOihMHd
 1Y/JpjbJwD8fRJgvo46FYW+zDjhyVL3MmYE0dm3JMiLMWT99aqB8QKEbcIkO5eR/ul
 GUeH9O7SJpDlWvODlwG9SZPNG5VqIgw5pmgNY7x/u5j5plrzRhy+GOQFLTi9MTuApE
 dABo0JIY+Qt/Q==
From: Bjorn Andersson <andersson@kernel.org>
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH 0/3] drm/msm/adreno: GPU support on SC8280XP
Date: Wed, 14 Jun 2023 09:03:33 -0700
Message-Id: <168675861182.1453524.13931605500633983519.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230208034052.2047681-1-quic_bjorande@quicinc.com>
References: <20230208034052.2047681-1-quic_bjorande@quicinc.com>
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
Cc: devicetree@vger.kernel.org, mani@kernel.org,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
 johan@kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 7 Feb 2023 19:40:49 -0800, Bjorn Andersson wrote:
> This series introduces support for A690 in the DRM/MSM driver and
> enables it for the two SC8280XP laptops.
> 
> Bjorn Andersson (3):
>   drm/msm/adreno: Add Adreno A690 support
>   arm64: dts: qcom: sc8280xp: Add GPU related nodes
>   arm64: dts: qcom: sc8280xp: Enable GPU related nodes
> 
> [...]

Applied, thanks!

[1/3] drm/msm/adreno: Add Adreno A690 support
      (no commit info)
[2/3] arm64: dts: qcom: sc8280xp: Add GPU related nodes
      commit: eec51ab2fd6f447a993c502364704d0cb5bc8cae
[3/3] arm64: dts: qcom: sc8280xp: Enable GPU related nodes
      commit: 598a06afca5a2ab4850ce9ff8146ec728cca570c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
