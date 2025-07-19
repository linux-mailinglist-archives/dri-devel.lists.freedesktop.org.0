Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFBFCB0AFFF
	for <lists+dri-devel@lfdr.de>; Sat, 19 Jul 2025 14:48:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F7FA10E064;
	Sat, 19 Jul 2025 12:48:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="R/ICxzhC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD7B210E064
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 12:48:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A89745C4C05;
 Sat, 19 Jul 2025 12:48:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1F72C4CEE3;
 Sat, 19 Jul 2025 12:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752929331;
 bh=SZBlAvUTaxgU1cxYHSeOXy3gDq5jLgGKKRP+AKro3v8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=R/ICxzhC8cEnWzVqs6l0MMBpXp9Cr+LlIIHRlcWf/5bkvFgBTYqHOTSSHdENxad1z
 HKyzzNJa/JKo5GhK81201QRJyEoSByW+qCRw5ZiKDuUakmtF94kU7iPTpyUc81qioL
 IJWUHwS4eWsDvKbcs+vYVny8mm/TNm5F/I3D8FNx+OD/Ui3+IieaEatr9iBxR6RDUC
 H6lRoDbStOH0XnoSevoOCNzAChIYWAWUkyKoEb3w2aYl7sRcUQM1Tef1iMks3XQEAl
 jHJRCrujjtOsUGuzvdj0GBxhEZAlBIYEHdAfMwVmLQSmOYb0S6hlSAO/5a7yVyTsOK
 p7Srn1KUSC6Kg==
From: Sven Peter <sven@kernel.org>
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Neal Gompa <neal@gompa.dev>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Sven Peter <sven@kernel.org>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] Bindings and DTS for Apple SoC GPUs
Date: Sat, 19 Jul 2025 14:48:38 +0200
Message-Id: <175292930365.11148.17885193055707166260.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250710-sgx-dt-v3-0-299bb3a65109@gmail.com>
References: <20250710-sgx-dt-v3-0-299bb3a65109@gmail.com>
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

On Thu, 10 Jul 2025 00:21:43 +0200, Sasha Finkelstein wrote:
> This patch series adds the DT bindings and tree entries for the GPU
> present in Apple M-series SoCs. The driver itself is in Rust and
> upstream is currently missing several prerequisite bindings, so will
> be sent later.
> 
> The kernel and m1n1 (bootloader) that are using those bindings are
> available at the following branches:
> Kernel: https://github.com/WhatAmISupposedToPutHere/linux/tree/starlight
> m1n1: https://github.com/WhatAmISupposedToPutHere/m1n1/tree/bootloader-cal-blobs
> 
> [...]

Applied to git@github.com:AsahiLinux/linux.git (asahi-soc/for-next), thanks!

[1/2] dt-bindings: gpu: Add Apple SoC GPU
      https://github.com/AsahiLinux/linux/commit/23a6959ff34e
[2/2] arm64: dts: Add Apple SoC GPU
      https://github.com/AsahiLinux/linux/commit/930759aaf34f

Best regards,
-- 
Sven Peter <sven@kernel.org>

