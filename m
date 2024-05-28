Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8968C8D1293
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2024 05:32:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2017910E2EE;
	Tue, 28 May 2024 03:32:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Z7zU4TmQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EBD110E2EE;
 Tue, 28 May 2024 03:32:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id AE947CE1170;
 Tue, 28 May 2024 03:32:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C555C3277B;
 Tue, 28 May 2024 03:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716867160;
 bh=ITVmDH7VJaoEg2XKzY//RgBj1ab2sf6hRESd42NWe3k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Z7zU4TmQpwldrjEkzIUM6a807er/kTBA7VwEnu5HyPlBi6GrVl9ajxezci4ncNLDg
 ZZKNCMB7VF2+NR25SZXZdIS4ZrZ51Ko2CADeqqVReGJ9Kdvu2mAfwDczZuYYO8+8qr
 uFE29zAMf928OogM9b4oGsAesgvvVxhTgz27SLYLO7m1q3X4AdUKmk8gnBAqWKvB19
 D19SFfM4LhQWBuWeGK/r98zlIxiOBCoxlzrY5PQJC3r0W/gdcpJvC9f1qcJQYIWUPB
 r90NPxkmjsfAy6vf1OluomgY0TgKi8Lca8R5LbVhEUqTlNuEq8LvmutXW7HwITwIHe
 5qn4yVb9wAdWQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Adam Skladowski <a39.skl@gmail.com>
Cc: phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/8] MSM8976 MDSS/GPU/WCNSS support
Date: Mon, 27 May 2024 22:32:07 -0500
Message-ID: <171686715139.523693.1894869664497791698.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240121194221.13513-1-a39.skl@gmail.com>
References: <20240121194221.13513-1-a39.skl@gmail.com>
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


On Sun, 21 Jan 2024 20:40:58 +0100, Adam Skladowski wrote:
> This patch series provide support for display subsystem, gpu
> and also adds wireless connectivity subsystem support.
> 
> Adam Skladowski (8):
>   arm64: dts: qcom: msm8976: Add IOMMU nodes
>   dt-bindings: dsi-controller-main: Document missing msm8976 compatible
>   dt-bindings: msm: qcom,mdss: Include ommited fam-b compatible
>   arm64: dts: qcom: msm8976: Add MDSS nodes
>   dt-bindings: drm/msm/gpu: Document AON clock for A506/A510
>   arm64: dts: qcom: msm8976: Add Adreno GPU
>   arm64: dts: qcom: msm8976: Declare and wire SDC pins
>   arm64: dts: qcom: msm8976: Add WCNSS node
> 
> [...]

Applied, thanks!

[1/8] arm64: dts: qcom: msm8976: Add IOMMU nodes
      commit: 418c2ffd7df9bfc25c21172bd881b78d7569fb4d

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
