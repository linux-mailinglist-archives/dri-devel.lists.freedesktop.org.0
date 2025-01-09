Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB830A0742D
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 12:06:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7286610ED68;
	Thu,  9 Jan 2025 11:06:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="bebKQrx4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD43310ED68
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 11:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1736420767;
 bh=NSINwedzb+CJzoeaWNPp6t+VsGjFzCBylsKLc9BhvNY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=bebKQrx4PJq5NB9s3v4vJRKv4kTMaJryl50QSDFYTGLHA+OG48MLHXlhPjUwSsBpo
 kRXCJ3x/FTRThqPmtdZjN5pwbdwFCK3gXYB9fxJAMT+VmVD2AFKQHBjeWLud5CoXtK
 1m/XZ0JNYT02b3MUnORnZ6cj90JIoOBCY+Lpq1xmd1kTVDC3OdlMgHn2/9Dcm8AB+Q
 QeHbu5uv8P/4t5gusqp6qyZ0SA3aJQ0u3dsYT7ZYoGqGVdrTlICojrRMPpoLuZeysF
 E0tD3EXkJA8Ltgc6KePrZyTIp6Xvy/qV9p1YNplHhjlcwS545sagXH35dDHQtUHci5
 vTqqC9nQkqgLA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id A00FD17E1562;
 Thu,  9 Jan 2025 12:06:05 +0100 (CET)
Message-ID: <21be2199-cf26-4669-afb7-98ab296e2d75@collabora.com>
Date: Thu, 9 Jan 2025 12:06:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/6] arm64: dts: mediatek: add display support for
 mt8365-evk
To: Alexandre Mergnat <amergnat@baylibre.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20231023-display-support-v6-0-c6af4f34f4d8@baylibre.com>
 <20231023-display-support-v6-6-c6af4f34f4d8@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20231023-display-support-v6-6-c6af4f34f4d8@baylibre.com>
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

Il 09/01/25 11:37, Alexandre Mergnat ha scritto:
> MIPI DSI:
> - Add "vsys_lcm_reg" regulator support and setup the "mt6357_vsim1_reg",
> to power the pannel plugged to the DSI connector.
> - Setup the Display Parallel Interface.
>    - Add the startek kd070fhfid015 pannel support.
> 
> HDMI:
> - Add HDMI connector support.
> - Add the "ite,it66121" HDMI bridge support, driven by I2C1.
> - Setup the Display Parallel Interface.
> 
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>


Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

