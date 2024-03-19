Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D7CA87F595
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 03:49:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6688A10E664;
	Tue, 19 Mar 2024 02:49:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tEF3tECZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAFAA10E664
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 02:49:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D446660DEA;
 Tue, 19 Mar 2024 02:49:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EDEAC43394;
 Tue, 19 Mar 2024 02:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710816551;
 bh=6IEeWe8fAl6Qfo90w/86AbAPtb+pIixFMGMT5D84h9w=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=tEF3tECZ0dAeyJujgyOOwdeXsb3wHpw6pf172VsJcTJsZm1pdtYnQlceKvDimwART
 5Cs/2k4Z1USVSkud8Em2/pOWX3ZYC4BhXkNlMPZX35qC2DJeGufs2ajgSgKrju+gBY
 JYvOm3dds9pEc+gFZFPoFOed/p4t/UQGX4XByBCIgNgAXqgKTrlkJ09S4ajqRVHmpj
 Y86y1P4PFkP5OFDMw2qExEw09oWn7eXwdd3huaCEQNb36mk8dGxnQxj9SsBazJD+rc
 2hLyCejKhpBp8A/J+UcFZZI6PReY49LA6kOq7vEULX4UCOBKuC4hC4OqcBSF7Ka0XM
 /5ELioEiZ+OKw==
From: Bjorn Andersson <andersson@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Richard Acayan <mailingradian@gmail.com>
Subject: Re: (subset) [PATCH 0/3] drm/panel: Pixel 3a Panel
Date: Mon, 18 Mar 2024 21:48:41 -0500
Message-ID: <171081652646.198276.4591986979489107944.b4-ty@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240209001639.387374-6-mailingradian@gmail.com>
References: <20240209001639.387374-6-mailingradian@gmail.com>
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


On Thu, 08 Feb 2024 19:16:41 -0500, Richard Acayan wrote:
> This adds support for the AMS559NK06 panel with the S6E3FA7 display
> controller and enables the display subsystem on the Pixel 3a.
> 
> Richard Acayan (3):
>   dt-bindings: display: panel-simple-dsi: add s6e3fa7 ams559nk06 compat
>   drm/panel: add samsung s6e3fa7 panel driver
>   arm64: dts: qcom: sdm670-google-sargo: add panel
> 
> [...]

Applied, thanks!

[3/3] arm64: dts: qcom: sdm670-google-sargo: add panel
      commit: 232490b925272d54dd91847a183bdbc2deec904b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
