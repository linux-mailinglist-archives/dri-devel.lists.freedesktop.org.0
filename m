Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BF2CA9FFC
	for <lists+dri-devel@lfdr.de>; Sat, 06 Dec 2025 05:00:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B44C110E07E;
	Sat,  6 Dec 2025 03:59:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KkCkgvZy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA37210E07E
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Dec 2025 03:59:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C6D1060149;
 Sat,  6 Dec 2025 03:59:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39D93C116D0;
 Sat,  6 Dec 2025 03:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764993591;
 bh=Yp+h4dlCyljGscNsyg/vjo3+xpYcb64d7JYudiRzfp8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KkCkgvZydo552dqIhZSMUa22B6nbA4hWiZy/1qRlUooHHb9bDEQUns65d/CuvPx6B
 VA5tP48awwY3zOtpJ+USU+Qtzv9nFK98FyxUZEwVu6Bj2nzIZIKloaITUAH5Oich2W
 SQutnK07It7XpF8LnyHAz5GIdRVpAkZ40t50DRqu9N9U3OUJoHLHDg8aW6cEG6DgUO
 +cikYW8et8GZRcaF5FPslwK27weGO8cflJbUNb0xxA3a5ABNVUXAdXIdjSYQStfauU
 FqHFzh1TbqpnNbVRSu6Fra/mTuUArvnQXeXLyvBVwwuf2XJWhf7lGKlYnfiQtZ3ovM
 UaZoIJ6+hR8ZQ==
From: Bjorn Andersson <andersson@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
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
 phone-devel@vger.kernel.org
Subject: Re: [PATCH v4] arm64: qcom: sdm845-oneplus-enchilada: Specify panel
 name within the compatible
Date: Fri,  5 Dec 2025 22:06:05 -0600
Message-ID: <176499396482.224243.10120913853765639507.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251204-sofef00-rebuild-v4-1-7f6e030ae5b7@ixit.cz>
References: <20251204-sofef00-rebuild-v4-1-7f6e030ae5b7@ixit.cz>
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


On Thu, 04 Dec 2025 11:41:24 +0100, David Heidelberg wrote:
> sofef00 is name of the DDIC, it doesn't contain name of the panel used.
> The DDIC is also paired with other panels, so make clear which panel is
> used.
> 
> New device-tree will work with old driver as expected, due to secondary
> compatible.
> 
> [...]

Applied, thanks!

[1/1] arm64: qcom: sdm845-oneplus-enchilada: Specify panel name within the compatible
      commit: d60e51cbae7e92c4a00cddb2750129094760da60

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
