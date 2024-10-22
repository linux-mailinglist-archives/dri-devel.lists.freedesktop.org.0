Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD319A9E29
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 11:16:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE50910E633;
	Tue, 22 Oct 2024 09:16:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="EdvnfT1u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0BB610E62C
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 09:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1729588573;
 bh=WK7Q9BUHHXh2dfmzyOC4ceHjQml49UTueInTaVAVVuc=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=EdvnfT1uX8a/GhmvQ0G/2JiRwCTIX7JqJIx+csY8BP+vUU2KQ8mneX/cGkW61yeS5
 AMQdE6OrUVfPvduAB9no+O4ph88nG7KCZ2r/shTaUoCBIRfWZl6t2vo5jNcTFYvDkH
 uXbxCfGeB4KJMJUlsfVKmczxQ4h/3RwkN8MuWthUeeWTKJ0gpq27XjsSw9oujGWeU1
 bEyZgJTE7s9ZPmM7ENSO+dH0IE3IqFjHh+DDU5/DD6vDnPpBbgTxrDHzrzOTdfFjSl
 oR43sqSZlg0FbuLKdXtYrD+zxvVa6R62zcVfvE5TZoh4LgesktKUisO/WAIyxLBJnR
 isJQiA/HZfgvA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id B834D17E139E;
 Tue, 22 Oct 2024 11:16:12 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, 
 p.zabel@pengutronix.de, airlied@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 matthias.bgg@gmail.com, shawn.sung@mediatek.com, yu-chang.lee@mediatek.com, 
 ck.hu@mediatek.com, jitao.shi@mediatek.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 wenst@chromium.org, kernel@collabora.com, sui.jingfeng@linux.dev, 
 michael@walle.cc, sjoerd@collabora.com, 
 Simona Vetter <simona.vetter@ffwll.ch>
In-Reply-To: <20241017103809.156056-1-angelogioacchino.delregno@collabora.com>
References: <20241017103809.156056-1-angelogioacchino.delregno@collabora.com>
Subject: Re: (subset) [PATCH v13 0/3] drm/mediatek: Add support for OF graphs
Message-Id: <172958857271.72613.71247328907828550.b4-ty@collabora.com>
Date: Tue, 22 Oct 2024 11:16:12 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
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

On Thu, 17 Oct 2024 12:38:06 +0200, AngeloGioacchino Del Regno wrote:
> Changes in v13:
>  - Added comment in commit description of patch [1/3] to warn about
>    new port scheme.
>  - The series is now fully reviewed, tested, hence *ready*.
> 
> Changes in v12:
>  - Added comment to describe graph for OVL_ADAPTOR in patch [3/3]
>    as suggested by CK Hu.
> 
> [...]

Applied to v6.12-next/dts64, thanks!

[2/3] dt-bindings: arm: mediatek: mmsys: Add OF graph support for board path
      commit: 713a20e598f8f8fb6660b6c38eb5071aa3fc85c6

Cheers,
Angelo


