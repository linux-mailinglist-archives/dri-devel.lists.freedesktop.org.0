Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 281C572EF34
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jun 2023 00:27:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE0AF10E3F0;
	Tue, 13 Jun 2023 22:27:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7334010E3EE;
 Tue, 13 Jun 2023 22:27:24 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D9F7263624;
 Tue, 13 Jun 2023 22:27:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E5DEC433CB;
 Tue, 13 Jun 2023 22:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686695242;
 bh=/giBIYOdbVKt2nNPEKWExWP7ihJj262AshCzdvOhLBc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jgGjBs9WX6i9EZ2M0O5qxYt4hvTVwuhDRjrgugdkXrs5wHyNNusDDKLVhFz5qwF/s
 x/WheKzPw+j27KOO4pe7fnbmUhvXQ8k5pZRZiCmSbWmthMO9qZsab8aqvFiyOb+Yae
 YUhg47AcP64zUQKSWPJjuQ7KehFEyHnGRb3d88hWtpup2OTtUtmLWmR1dkEViJ9bLX
 f3seWqRkHx3r4CeO/EfiTNTc9t0cV/n4PVcv82RDumVPvEGTtw9P2RSZJd8tVAQYIM
 IDDYPsEOTrc76WguNTLbxbhwpQfQbxGeyTSSIjA9FL2l4wNRO/mYMlcGG0ZaYUThBN
 EtGrBT1y//5+A==
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Andy Gross <agross@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v4 0/2] arm64: dts: qcom: add DP Controller to SM8550 DTS
Date: Tue, 13 Jun 2023 15:30:19 -0700
Message-Id: <168669542892.1315701.7023894164338964260.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230601-topic-sm8550-upstream-dp-v4-0-ac2c6899d22c@linaro.org>
References: <20230601-topic-sm8550-upstream-dp-v4-0-ac2c6899d22c@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 13 Jun 2023 09:30:11 +0200, Neil Armstrong wrote:
> The DP output is shared with the USB3 SuperSpeed lanes and is
> usually connected to an USB-C port which Altmode is controlled
> by the PMIC Glink infrastructure.
> 
> DT changes tying the DP controller to the USB-C port on the QRD
> board will be sent later.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: qcom: sm8550: fix low_svs RPMhPD labels
      commit: bbde65f9da9291a77636e1467b28f27ced1b4ece
[2/2] arm64: dts: qcom: sm8550: add display port nodes
      commit: 66adfbc4d33993865a180016db73520a15e754c9

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
