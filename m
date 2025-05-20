Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D69ABD3B8
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 11:44:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFD5910E477;
	Tue, 20 May 2025 09:44:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="RcxKMs/D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DDD310E477
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 09:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1747734244;
 bh=WaDOA0nhLVn0g1cG6OcvRA1CfBIZaKfZuXaM3IJmSSg=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=RcxKMs/DjTuhcwv/Qud8AMpfWEmOOzGLo49z2+n6mJc88iW3vTfZ+KlmoTtlUBNcs
 43h5nuWQQLmqIhpXxFqipz+NA0PZJyrNR3jL+m80XnC3/4AZ2KBG8MBgDbdbPljq3v
 NyCEzRaIXHGzZdNyGaxc/l47F5btNls6+WFL91w22LKDT8oeznNK4OCO/0jbp2WLqc
 kyj7/DpBnYBu7l2sDaZVEhFMjmTDxsnJ0d6KqdEmMADBCmUnU9gipUxKD7mb83Ukfb
 uc3O0tyJWrwCMs1RYGG1qsZlRyIjTG1HBCDHbDPhkKxuWf3uEjKtemXBvaE94/b686
 4A7IWsWhC/b4g==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 52E7F17E0FD3;
 Tue, 20 May 2025 11:44:03 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org, 
 Vignesh Raman <vignesh.raman@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, 
 nfraprado@collabora.com, krzk@kernel.org, daniels@collabora.com, 
 airlied@gmail.com, simona.vetter@ffwll.ch, arnd@kernel.org, 
 ck.hu@mediatek.com, laura.nao@collabora.com, matthias.bgg@gmail.com, 
 tzimmermann@suse.de, mripard@kernel.org, lumag@kernel.org, 
 ville.syrjala@linux.intel.com, jani.nikula@intel.com, arnd@arndb.de, 
 geert+renesas@glider.be, wenst@chromium.org, 
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250512131933.1247830-1-vignesh.raman@collabora.com>
References: <20250512131933.1247830-1-vignesh.raman@collabora.com>
Subject: Re: [PATCH v4] arm64: defconfig: mediatek: enable PHY drivers
Message-Id: <174773424323.2901578.2896521674718860573.b4-ty@collabora.com>
Date: Tue, 20 May 2025 11:44:03 +0200
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

On Mon, 12 May 2025 18:49:24 +0530, Vignesh Raman wrote:
> The mediatek display driver fails to probe on mt8173-elm-hana and
> mt8183-kukui-jacuzzi-juniper-sku16 in v6.14-rc4 due to missing PHY
> configurations.
> 
> Commit 924d66011f24 ("drm/mediatek: stop selecting foreign drivers")
> stopped selecting the MediaTek PHY drivers, requiring them to be
> explicitly enabled in defconfig.
> 
> [...]

Applied to v6.15-next/dts64, thanks!

[1/1] arm64: defconfig: mediatek: enable PHY drivers
      (no commit info)

Cheers,
Angelo


