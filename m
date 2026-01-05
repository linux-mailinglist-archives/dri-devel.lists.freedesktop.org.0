Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03625CF4076
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 15:08:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51C5310E3E1;
	Mon,  5 Jan 2026 14:08:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Bwn72LJI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D17B10E3E1
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 14:08:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 15E4643FFD;
 Mon,  5 Jan 2026 14:08:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A1FBC4AF09;
 Mon,  5 Jan 2026 14:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767622082;
 bh=bi86ofjhU/mHBq/m/0w31toaGLJU4PVhJwFISrEiBkI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Bwn72LJI3FEUMdixE7dH60eJl29Fef+CyhD3PXFr7v05QTpGZbNKbykbMxtlu7Le6
 Yapr/R1tIMMGr//IKLFwLO1ytOTONDaYRAVQKJEQ/noq50d4BwQRm5+X6pos6xbf99
 rLavPdDhVwJyTRz7Ep2A87uOh8sF1li20gOyS1G6ojcqUzFcIj26qbKH8hrskqSWc7
 UWcdeJ2MP7mu59MXqor1J30jdbDCZy3t8xYa7JwIm0cb0h1r2l0EQUckp4Q0lcjFZp
 hdW2T5SYvY0hcXbXyKvi5iQ4vrqIxluqRkXespPcCNbI27O4cdfMRpv8/AINzv8Qrx
 XH+OIE1jw6UlQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Casey Connolly <casey.connolly@linaro.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Petr Hodina <phodina@protonmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Amit Pundir <amit.pundir@linaro.org>, Casey Connolly <casey@connolly.tech>,
 Joel Selvaraj <foss@joelselvaraj.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v7 0/8] Add support for Pixel 3 and Pixel 3 XL
Date: Mon,  5 Jan 2026 08:07:15 -0600
Message-ID: <176762206382.2923194.3685391400254348366.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251214-pixel-3-v7-0-b1c0cf6f224d@ixit.cz>
References: <20251214-pixel-3-v7-0-b1c0cf6f224d@ixit.cz>
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


On Sun, 14 Dec 2025 15:51:16 +0100, David Heidelberg wrote:
> This adds initial device tree support for the following phones:
> 
>  - Google Pixel 3 (blueline)
>  - Google Pixel 3 XL (crosshatch)
> 
> Both phone boards use the same identifiers and differ only slightly
> in their connected peripherals.
> 
> [...]

Applied, thanks!

[1/8] dt-bindings: arm: qcom: Add Pixel 3 and 3 XL
      commit: 3845bc888660a238920fdba2f85fe284f01fb95f
[8/8] arm64: dts: qcom: Add support for Pixel 3 and Pixel 3 XL
      commit: a678adbf2d22edcb9078f8ad56706891a0ac9e80

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
