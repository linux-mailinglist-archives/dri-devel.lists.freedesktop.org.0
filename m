Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FC4A305C3
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 09:30:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3F1810E1D8;
	Tue, 11 Feb 2025 08:30:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GPsM920z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8654110E1D8
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 08:30:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AB97B5C0352;
 Tue, 11 Feb 2025 08:29:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18BD5C4CEDD;
 Tue, 11 Feb 2025 08:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739262603;
 bh=KkOLO3+N7FDczkhby7I7NSNhK0zE55+iVoHuoQGhHfU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GPsM920zDczb0Yxbv7ZH2WHn+G3xOMFEpF64NBqd6gsSIm5tbxc1IKsEdAfvHv2Fw
 0W++zDfDwxRFm66KqDgAtlEydhrenhMuobv6sz8L+ACiLe13VptrzGPOWk5z7XADrX
 +3cgoSS6WfiH7G5PmPuX+HpYdMlTM+VbPGejhQZOcJ4OdMv8h0VICBos6cZvJDU6Y5
 IVe/TmIqD4eHPMzO4XKk0YkpPkCe2gs3S8H76b4tmE42OXc0huuELbovx04aoD0Zol
 DoTkj8SHhx8n8GuOJgYIGT+upF+Q78k/WbBj/LcnUgUzVZ7MEQdhHIa9WF66oXtfq4
 Fw2UlaZeNpYhw==
Date: Tue, 11 Feb 2025 09:29:59 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 1/3] dt-bindings: gpu: mali-bifrost: Add compatible
 for MT8370 SoC
Message-ID: <20250211-judicious-tentacled-chihuahua-9bb5b6@krzk-bin>
References: <20250207-mt8370-enable-gpu-v3-0-75e9b902f9c1@collabora.com>
 <20250207-mt8370-enable-gpu-v3-1-75e9b902f9c1@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250207-mt8370-enable-gpu-v3-1-75e9b902f9c1@collabora.com>
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

On Fri, Feb 07, 2025 at 04:18:30PM +0100, Louis-Alexis Eyraud wrote:
> Add a compatible for the MediaTek MT8370 SoC, with an
> integrated ARM Mali G57 MC2 GPU (Valhall-JM, dual core).
> This new compatible is needed for this SoC support, as the other

You *always* need new compatible.

> existing compatibles for the same GPU architecture (MT8188, MT8192) do
> not match the required power domain number.
> The other compatibles (especially MT8186) cannot be reused because of
> GPU architecture difference.

Just FYI: you must not *ever* reuse compatibles. What you wanted is to
mark devices compatible and not. You claim devices are not compatible
because of this and that.

Please fix the commit msg because I am afraid later people will use it:
"I can reuse the compatible because that commit msg was acked".


Best regards,
Krzysztof

