Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F7CB96519
	for <lists+dri-devel@lfdr.de>; Tue, 23 Sep 2025 16:39:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C718E10E638;
	Tue, 23 Sep 2025 14:39:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ANjomnT7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B67B310E634
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 14:39:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E404F60052;
 Tue, 23 Sep 2025 14:39:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B57EC113CF;
 Tue, 23 Sep 2025 14:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758638344;
 bh=7y7/yuACkZLW79g5K5sIcU1j82Ksu2UcLf91irlmAcg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ANjomnT7tvAlSvx7jeHkZqzpLc2fb96iYwhxRZrRaCXSqjMjrkqllXf6P0ALKVP0y
 s3nI2y2MQxTpYk9losq0G3Q33MJWvh5B0X+KRd15ayCOGw7tSLWqycG7rpRmiscHYX
 QeM2U4ZvQ00/Atfe6dDO8CRnKqR57PwxmPEmDfdrX6VAQ3dFDl6CpmKGZVf3+4nu6F
 SHU/jZjtyWZrtTpXbmECEy7ut43ONk0H6gbinCYk4DvAIeTuqKZBRgRYXNP+lKDiXW
 qmBk652g99F7+dxUQaGQfWmNpJA7bUnqgJtqSukaC24NAlPfYv9fwAoLjwl/MnpwOi
 nbQ5VWDe9aXpg==
Date: Tue, 23 Sep 2025 09:39:03 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Simona Vetter <simona@ffwll.ch>, Jassi Brar <jassisinghbrar@gmail.com>,
 Chia-I Wu <olvaffe@gmail.com>, Steven Price <steven.price@arm.com>,
 linux-mediatek@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 kernel@collabora.com, Kees Cook <kees@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 David Airlie <airlied@gmail.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Liviu Dudau <liviu.dudau@arm.com>, linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 devicetree@vger.kernel.org, linux-hardening@vger.kernel.org,
 linux-pm@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v4 4/8] dt-bindings: mailbox: Add MT8196 GPUEB Mailbox
Message-ID: <175863834028.3197589.1266826496329321064.robh@kernel.org>
References: <20250923-mt8196-gpufreq-v4-0-6cd63ade73d6@collabora.com>
 <20250923-mt8196-gpufreq-v4-4-6cd63ade73d6@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923-mt8196-gpufreq-v4-4-6cd63ade73d6@collabora.com>
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


On Tue, 23 Sep 2025 13:39:57 +0200, Nicolas Frattaroli wrote:
> The MediaTek MT8196 SoC includes an embedded MCU referred to as "GPUEB",
> acting as glue logic to control power and frequency of the Mali GPU.
> This MCU runs special-purpose firmware for this use, and the main
> application processor communicates with it through a mailbox.
> 
> Add a binding that describes this mailbox.
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---
>  .../mailbox/mediatek,mt8196-gpueb-mbox.yaml        | 64 ++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

