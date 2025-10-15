Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49520BDD922
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 10:59:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78DE110E75F;
	Wed, 15 Oct 2025 08:59:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="fiHu5AEM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 226AB10E75F
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 08:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1760518763;
 bh=XCOa6UKMhp1ANTY93PkNLWmuW4ZzjeRtQ3m+yYFujDQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=fiHu5AEM86zk+RnqhjIILNMO66Za6N7CHFpcg1o4H5JZ70pcbus27J6Hk7uv1BV0r
 pdK+20Ruz9ynZp9ZviI7augpG2ZJk2avc1+DiwyC2dYrrzHOPlx3VBod5e/NyNhusR
 eJJ5DtlBV4KrutK2/E7ckvjnsMMF2U1b/e0vVb4/hSPWUTwGhR03M/S/Tqm7zNB8El
 6LQjk/5UswIBswaDAaEZaiO2QflDq36Ibkv6VaSno5ZYSel72NsLp3lwZ/RI/werdw
 oPT/D6rGLLskHGoFMOAIkn2FKeZZmyL5WGq7/lUjCCRiKFAdxX47tccjXhiBxxmTSJ
 gBXIwzR7Lg2vg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id CE5B017E12EB;
 Wed, 15 Oct 2025 10:59:22 +0200 (CEST)
Message-ID: <da324c96-2cba-46cf-af69-c9eaf7ea697f@collabora.com>
Date: Wed, 15 Oct 2025 10:59:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/5] pmdomain: mediatek: Add support for MFlexGraphics
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, Chia-I Wu <olvaffe@gmail.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-hardening@vger.kernel.org, linux-pm@vger.kernel.org
References: <20251015-mt8196-gpufreq-v7-0-0a6435da2080@collabora.com>
 <20251015-mt8196-gpufreq-v7-5-0a6435da2080@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251015-mt8196-gpufreq-v7-5-0a6435da2080@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Il 15/10/25 10:50, Nicolas Frattaroli ha scritto:
> Various MediaTek SoCs use GPU integration silicon named "MFlexGraphics"
> by MediaTek. On the MT8196 and MT6991 SoCs, interacting with this
> integration silicon is required to power on the GPU.
> 
> This glue silicon is in the form of an embedded microcontroller running
> special-purpose firmware, which autonomously adjusts clocks and
> regulators.
> 
> Implement a driver, modelled as a pmdomain driver with a
> set_performance_state operation, to support these SoCs.
> 
> The driver also exposes the actual achieved clock rate, as read back
> from the MCU, as common clock framework clocks, by acting as a clock
> provider as well.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

