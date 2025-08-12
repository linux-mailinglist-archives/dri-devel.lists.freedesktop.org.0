Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CBAB23A7B
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 23:15:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18CA110E012;
	Tue, 12 Aug 2025 21:15:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nw3MqJJD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4EDC10E012
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 21:15:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id B6F5FA57A22;
 Tue, 12 Aug 2025 21:15:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2865CC4CEF5;
 Tue, 12 Aug 2025 21:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755033350;
 bh=5mNbdpt5q9TT98oGMkwzue+Mu9ER5hM0os1oH28oc/w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nw3MqJJDL6QM31RSIqJfWv86MH9SR/VBi6Xssr6IRHTstRGO7E3wfnmSGAwmsFTR8
 YILqFFKV4zWkX7Yy3eLAfoR0ZaWxmfhtp0U8D9TQQRpONglsi3jAGU5hahn+c1C8Bm
 sk0/sKtuViuIgnwcfZhmeuw/ESQBD85i/JRL7x6/iR3M/2w4QRJsvyThkUgMT+hvgv
 bRm+3cK17i/PU9pifdtnIzbNzaeBHwlK6qCEK/3K5NeX3PCgZ3kTBOhDg4QIokbVzh
 Fptt3kSm2V+nr9UsLQXaGNX1MUBwE1IK1XZ8KYrJA+VdcCaa6Rda+DN8crUlshigZu
 veaXWaWzbStoQ==
From: Bjorn Andersson <andersson@kernel.org>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Luca Weiss <luca@lucaweiss.eu>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: (subset) [PATCH v4 0/4] Add display support for Fairphone 3
 smartphone
Date: Tue, 12 Aug 2025 16:13:46 -0500
Message-ID: <175503322851.231048.5166314447920112542.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611-fp3-display-v4-0-ef67701e7687@lucaweiss.eu>
References: <20250611-fp3-display-v4-0-ef67701e7687@lucaweiss.eu>
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


On Wed, 11 Jun 2025 18:33:14 +0200, Luca Weiss wrote:
> Add a driver for the HX83112B-based panel, and enable it on Fairphone 3
> to enable display output, and enable GPU as well.
> 
> 

Applied, thanks!

[4/4] arm64: dts: qcom: sdm632-fairphone-fp3: Enable display and GPU
      commit: 4ea55ecb4990aa4142ddae5f713289f4101f046f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
