Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B854916031
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 09:42:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4626F10E5D0;
	Tue, 25 Jun 2024 07:42:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="z/7tCTKM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C3AC10E5C2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 07:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1719301318;
 bh=fTwKzgDAtpJ7fS3y7s9o/r1cT4erRfQd8eIF/4pTaM8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=z/7tCTKMxE5Tifq9HPtAVVlG40A6lcXzeY1tS/lPtujX3nCTC0AO+EYXvxtFjJV9d
 ITh9rvkjXCVdH1T+gjaWifWQsWZp13jO61gkqNEDVbx+4NLEVnfgI2aD2U6Nw3mqsi
 V19UoLzDZP0Tuy+1SfEcagDiCnBDNwFz5kdMwTCZlBlkuzv+EugVGzd28SBesTTZ7q
 ybKjOKFX+GMAKQYwJO2cUIY5+e46FJQW/CT8WZqlMUQl+NDLl+Q1d0l335f3XfrLxo
 RHGrVHw8+JUeiYyTGJPyu4w0Gq3GLUotTloXSy5jH+IcDvfOSyub0g8TPgLtAEYD3r
 rR/KpHcGql7DA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 3325C378216A;
 Tue, 25 Jun 2024 07:41:58 +0000 (UTC)
Message-ID: <8f3d6c71-4c4d-4f56-94ba-f61ae5b61dd1@collabora.com>
Date: Tue, 25 Jun 2024 09:41:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: Fix bit depth overwritten for mtk_ovl_set
 bit_depth()
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jason-ch Chen <jason-ch.chen@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>
References: <20240624095726.18818-1-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240624095726.18818-1-jason-jh.lin@mediatek.com>
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

Il 24/06/24 11:57, Jason-JH.Lin ha scritto:
> Refine the value and mask define of bit depth for mtk_ovl_set bit_depth().
> Use cmdq_pkt_write_mask() instead of cmdq_pkt_write() to avoid bit depth
> settings being overwritten.
> 
> Fixes: fb36c5020c9c ("drm/mediatek: Add support for AR30 and BA30 overlays")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


