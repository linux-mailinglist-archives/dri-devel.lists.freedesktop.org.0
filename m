Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A707CF407F
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 15:08:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F4C610E3E5;
	Mon,  5 Jan 2026 14:08:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="U9Tp6Kii";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D251B10E3E5
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 14:08:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B8EE443C74;
 Mon,  5 Jan 2026 14:08:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C1B0C2BCB3;
 Mon,  5 Jan 2026 14:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767622109;
 bh=aJh9t1bM6vf+VmVosxIK7IbHvrg9FWsW2VSp0svG2Zo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=U9Tp6KiixL4SZK+/Ueu0twwIlMKdhEjIMUbYiGdl045pCtHJYEUjgqWpxBbipuWwL
 f7bNEV6wPVV9BSVXv6DtSxDgdn7Ne7rChs33QhcUcjgCiKAUb17/r5BVTuPEEBGpBg
 dO+mw9fE55d/Y0OwY7ARRN2PuwjWnZ83ycAcGwVU5zYVfjybmWoazgJYEuD+i38hRf
 B8g6pkqKYjNI4RNVSUHvIibQrTRcV5I/+fqLfNpBV6/hppH5zVURH+fpWk1luH+orV
 2hNUEXfRuBvd+MZG+iDpHajFEE8oKoZvdF0QLTUt0mci3IafaHUIgeQGOPr25bWxA2
 DQa7MY3WD7PMQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Maud Spierings <maud_spierings@hotmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/3] arm64: dts: qcom: x1e80100-vivobook-s15: add more
 missing features
Date: Mon,  5 Jan 2026 08:07:34 -0600
Message-ID: <176762206363.2923194.7383607598616456313.b4-ty@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251220-asus_usbc_dp-v3-0-5e244d420d0f@hotmail.com>
References: <20251220-asus_usbc_dp-v3-0-5e244d420d0f@hotmail.com>
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


On Sat, 20 Dec 2025 12:38:56 +0100, Maud Spierings wrote:
> There are still many missing features on this machine, add the ps8830
> retimers for display over usb-c, the simple bridge/HDMI port and set up
> to use IRIS.
> 
> Currently IRIS gives a ETIMEDOUT, not sure what that is coming from.
> 
> lots of these patches are very strongly based on the work of other
> maintainers of these snapdragon machines, like the HDMI part on that of
> Neil Armstrong, many thanks to those who laid the baseline for me to
> follow.
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: qcom: x1e80100-vivobook-s15: enable ps8830 retimers
      commit: c0d377798d6f6d3efddee5ef7d96b608a071f833
[2/3] arm64: dts: qcom: x1e80100-vivobook-s15: add HDMI port
      commit: 34d76723c41018ef52480ca3849b3ed3afbd8b22
[3/3] arm64: dts: qcom: x1e80100-vivobook-s15: enable IRIS
      commit: b7415c490d8d75b8dc7500b9c02cf8e5852110e6

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
