Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 221D3730470
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 18:00:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A68210E134;
	Wed, 14 Jun 2023 16:00:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0EB410E134;
 Wed, 14 Jun 2023 16:00:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2082B64416;
 Wed, 14 Jun 2023 16:00:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FFD9C433CB;
 Wed, 14 Jun 2023 16:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686758417;
 bh=1X3QAOHMv18jPXA9aP5gteykIFEWVG+CIyEYl8dRj+Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=C4AWc+Ov62cEL9m+jkX+8syY9nIiu/0hOe3bxgObFDpzs4jQJRIyq/ppXxgG2XoDr
 54CTp6mwu3q662CXKkiF7CWo23yGht/2Y7ZAmhDk/Nhn8zDedybcYGkwk+8DbaTkDW
 Q7lT9DJ4XLPnm3wb6nztSAj0ypazmGllvvFzQf7gvFYWU/MXPaZGlqx42Pkakl/54I
 u3q+aJhXoAcCjZEXmNQEnvM/Pn8Q+uPc5k3zKNkfcltBHadyEccZHe3Jal1uJqIa58
 lGce1ASmoQMFVSeQzkO+671tzDG+Fx28qEMgqJzhpiFRf7Nib6XEvvp7V8OPoKysL7
 Qs6ipid0DG7Iw==
From: Bjorn Andersson <andersson@kernel.org>
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Subject: Re: [PATCH v2 0/3] drm/msm/adreno: GPU support on SC8280XP
Date: Wed, 14 Jun 2023 09:03:34 -0700
Message-Id: <168675861182.1453524.13825528487008901071.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230523011522.65351-1-quic_bjorande@quicinc.com>
References: <20230523011522.65351-1-quic_bjorande@quicinc.com>
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

On Mon, 22 May 2023 18:15:19 -0700, Bjorn Andersson wrote:
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
