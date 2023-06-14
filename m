Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB900730473
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 18:00:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A71510E154;
	Wed, 14 Jun 2023 16:00:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C47210E149;
 Wed, 14 Jun 2023 16:00:19 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1F29063FB4;
 Wed, 14 Jun 2023 16:00:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC4D1C433CC;
 Wed, 14 Jun 2023 16:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686758418;
 bh=axFekjr54sw0KjPsVIliju7NLE77XPWr8/EwmApJkHo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=u3ARJp6AhqbxM6n8ZkLdxu+ktlppWCY3gmEMGT0LVOxgLVKrw7dMJI3zSfLWv9b7R
 NxdTSE8RucHckQ/1EHJeEeN4OwOfq8aFBAv9AqJAnGIMYyWPbMkzfgiGVk9BmX4nL/
 2PL2Hk+8cu3Ej5hSiTeuYKSNSGNIrRYGbHRPUqv+IbteH30t7B7gTFQnmAysidySoe
 7UozY4W85+3z7eSO12VYAWZSc1PSO8ofpSiHm+LfAu3sWHcddQkgq3ji+dlVNPKQ9E
 ew0jvfsrFhKNWv0h/jHOSA6HXTCUKWw9gKKweQ6HwHdvouxqQ64tuBFKoyNVuSa0kH
 ObPpEbtRlCPkw==
From: Bjorn Andersson <andersson@kernel.org>
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH v4 0/2] drm/msm/adreno: GPU support on SC8280XP
Date: Wed, 14 Jun 2023 09:03:35 -0700
Message-Id: <168675861183.1453524.15760956769812748282.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230614142204.2675653-1-quic_bjorande@quicinc.com>
References: <20230614142204.2675653-1-quic_bjorande@quicinc.com>
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
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 johan@kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 14 Jun 2023 07:22:02 -0700, Bjorn Andersson wrote:
> With the A690 support merged in the drm/msm driver, this series adds the
> DeviceTree pieces to make it go on sc8280xp.
> 
> Note that in order for the GPU driver to probe, the last change
> requires (which is now in linux-next):
> https://lore.kernel.org/linux-arm-msm/20230410185226.3240336-1-dmitry.baryshkov@linaro.org/
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: sc8280xp: Add GPU related nodes
      commit: eec51ab2fd6f447a993c502364704d0cb5bc8cae
[2/2] arm64: dts: qcom: sc8280xp: Enable GPU related nodes
      commit: 598a06afca5a2ab4850ce9ff8146ec728cca570c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
