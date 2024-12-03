Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2379E2810
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 17:50:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9720310E253;
	Tue,  3 Dec 2024 16:50:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kyW7aAvf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F3F910E253
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 16:50:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id EE490A417D6;
 Tue,  3 Dec 2024 16:48:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE083C4CECF;
 Tue,  3 Dec 2024 16:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733244609;
 bh=hl4qjq6wBEq5/6rBW02XlLyDQNXhu4x9H//HnoHXZC0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kyW7aAvfsRsd+goXqPtxbrF2GZ9SUIgO8a/u1AJ8BIEnmbS5M3rvY8PwauYRqY69E
 wMH5EFRYngFm5G+VV1tipxqdIFc41sJlBO0qh3qPCzE4sbfpkOA5o2Vyiy1qWqgIFB
 tDM8h/jaa0EONYCKZBgvbq7BzhmLostW8/EjWPzgZMtsAzVQxFUDMqN0NCdgm9ZDLg
 4fb6XRDcTbDHRJQdleIIvXoILAqO8mFQ9vF1/QKq2tdmUJNpeYz4vXfsC5H4pgkF5H
 yXF+ZFN/xAJAxY7eBbV6DIDQiMKdXO9IDBGv7yUgvqUy0TKwnw3Vi60mUCL2qMjhMk
 nZROfofiKrMYw==
Date: Tue, 3 Dec 2024 10:50:07 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, conor+dt@kernel.org,
 airlied@gmail.com, mripard@kernel.org, devicetree@vger.kernel.org,
 ck.hu@mediatek.com, linux-kernel@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, kernel@collabora.com,
 tzimmermann@suse.de, krzk+dt@kernel.org
Subject: Re: [PATCH v1 1/7] dt-bindings: display: mediatek: Add binding for
 HDMIv2 DDC
Message-ID: <173324460711.1946104.15731375026648249870.robh@kernel.org>
References: <20241120124512.134278-1-angelogioacchino.delregno@collabora.com>
 <20241120124512.134278-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241120124512.134278-2-angelogioacchino.delregno@collabora.com>
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


On Wed, 20 Nov 2024 13:45:06 +0100, AngeloGioacchino Del Regno wrote:
> Add a binding for the Display Data Channel (DDC) IP in MediaTek
> SoCs with version 2 HDMI TX IP.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../mediatek/mediatek,mt8195-hdmi-ddc.yaml    | 41 +++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi-ddc.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

