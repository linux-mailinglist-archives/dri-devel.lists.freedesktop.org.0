Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA444B50359
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 18:56:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0B9E10E7AF;
	Tue,  9 Sep 2025 16:56:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UdSgX1nH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FD6310E263
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Sep 2025 16:56:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 251BC441FC;
 Tue,  9 Sep 2025 16:56:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BA42C4CEF8;
 Tue,  9 Sep 2025 16:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757437003;
 bh=+r8mDA4yCkz2ncRANEB55SO7yWNFR6rNQqrLvvJyUZQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UdSgX1nHM0h+DGszo8LEfSvtH6HX4Fvhat9I04nfz2X95jYFW67ar/ho2cIvvEK0x
 mfDHom8P1x01fUtsJDdfOHrUYtwynjhhE5uOx2ekZAvOQ3OTNnruzYN8JhhPPt0XhU
 ZCRbdtvDRVFc8n0lKUEC+DJRvWJiSupdMTpGJ7XMkgGFd/mWNh+eeWI/I6dg4IwJNY
 NI3NvPkVUXMau5Zr3JouEo4KLi1XcpKadxCRGtDVcFGMrc77rLnyL4LL6d5paLwr4r
 gGq9WiQr//pT1vo10cQ0zUOnVOArMpF3FpQhyF+sj+cT8BRUxLrFvvnLVC5TkG68rf
 7oyzk/13kYkNg==
From: Bjorn Andersson <andersson@kernel.org>
To: Douglas Anderson <dianders@chromium.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
 Sibi Sankar <quic_sibis@quicinc.com>,
 Rajendra Nayak <quic_rjendra@quicinc.com>, Xilin Wu <wuxilin123@gmail.com>,
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
 Srinivas Kandagatla <srini@kernel.org>,
 Christopher Obbard <christopher.obbard@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Johan Hovold <johan@kernel.org>,
 Rui Miguel Silva <rui.silva@linaro.org>, Abel Vesa <abel.vesa@linaro.org>,
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Konrad Dybcio <quic_kdybcio@quicinc.com>
Subject: Re: [PATCH v7] arm64: dts: qcom: x1e78100-t14s-oled: Add eDP panel
Date: Tue,  9 Sep 2025 11:56:30 -0500
Message-ID: <175743699546.2735486.13197597490732571884.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250814-wip-obbardc-qcom-t14s-oled-panel-v7-1-89966ae886a3@linaro.org>
References: <20250814-wip-obbardc-qcom-t14s-oled-panel-v7-1-89966ae886a3@linaro.org>
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


On Thu, 14 Aug 2025 21:16:19 +0100, Christopher Obbard wrote:
> Add the Samsung ATNA40YK20 eDP panel to the device tree for the
> Snapdragon T14s OLED model.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: x1e78100-t14s-oled: Add eDP panel
      commit: e696e7aa439f1134ca5f91d6c86b332b72e57d9c

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
