Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76DCEC2EE37
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 02:54:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CA0510E045;
	Tue,  4 Nov 2025 01:54:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OHCHWg78";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAC5510E045
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 01:54:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id EE78C601E3;
 Tue,  4 Nov 2025 01:54:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E7B7C4CEE7;
 Tue,  4 Nov 2025 01:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762221288;
 bh=EFH8iZ/G2w8bUIhBezkXWpFBQbj4f9VLSoXOG3u/BPI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OHCHWg78fFwg10Ibsbz8T+L3pQu8RwbXz52JXBPvCCG5gqqGsuvts3lAfPlIAW3yh
 aADcxh+Ts2vEgQ1Qx1JEI40p4YjPHE55SXTd7sMdS2GuRltqyW0cLWvzkn4yPnPE8y
 BI3mPT6fr5vUOreFJAFMGBli0WUodN+Vz23+isDdpGD4r7SNUzcTWy+8zw3WVigQS8
 tGbw7afmeif/reBzT09R5e+a/r4x/hZfapiOgIVb55mXvgctbYwq9DVC2hZC34tVo3
 zivWg5uc4H0HFmVBNohGUtTKRoqlqQN99/3kknto6nQlC8wxRoJqxLGv/6YTyiOjTX
 Q+drWpv0D8+YQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Casey Connolly <casey.connolly@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, David Heidelberg <david@ixit.cz>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 phone-devel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v6 0/4] (subset) Add OnePlus 6T display (Samsung
 S6E3FC2X01 DDIC with AMS641RW panel)
Date: Mon,  3 Nov 2025 19:58:14 -0600
Message-ID: <176222149546.1132260.16054473586834002338.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251103-s6e3fc2x01-v6-0-d4eb4abaefa4@ixit.cz>
References: <20251103-s6e3fc2x01-v6-0-d4eb4abaefa4@ixit.cz>
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


On Mon, 03 Nov 2025 12:45:49 +0100, David Heidelberg wrote:
> This patchset enables the display on the OnePlus 6T smartphone.
> 
> (subset) Patches document the panel, pinctrls, and GPIOs.
> 
> Since the display node is shared between the OnePlus 6 and 6T,
> the following warning appears:
> 
> [...]

Applied, thanks!

[1/4] arm64: dts: qcom: sdm845-oneplus: Update compatbible and add DDIC supplies
      commit: 69b8bbde238a1503ac45998a911ea56ddb7610cf
[2/4] arm64: dts: qcom: sdm845-oneplus: Group panel pinctrl
      commit: 6c55c3c261ed7c17fa7823daf4d8f716504ad46e
[3/4] arm64: dts: qcom: sdm845-oneplus: Implement panel sleep pinctrl
      commit: 8dda2fecf76b6c4db5f4c1b81a765b73a7a878ed
[4/4] arm64: dts: qcom: sdm845-oneplus: Describe TE gpio
      commit: a3da84c36b1a6b80814b5a72ca1546648aba9e75

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
