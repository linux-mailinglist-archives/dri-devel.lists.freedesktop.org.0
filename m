Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F077390E9E9
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2024 13:42:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 036DF10E099;
	Wed, 19 Jun 2024 11:42:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ezkOXUhv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E11BA10E099
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2024 11:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1718797342;
 bh=9nbzgzoMSz4g+t+2ea0rpY+XNFLSLRWc62G32S+O2Hs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ezkOXUhvHectTqnAcLrhzNGBcHg0uPI4mgEc0gMmVkR4o6ewz6Sbxha3wkztemMX6
 uL3bzjdXpLqqY9By9GL5Bz22MupxTL5Qoadk4KDY1o/2AzE80dgdRMInlEv+Dn0ibx
 JK4rOev2qmubnpn1wxRFmsZiDm30OFcjLHvlNxyr6BQw8r54L+6FM7p0Wuf52nqwMU
 mFN5YM8nUfFHLeG2DbVOF/hj/bmyL2X+GqCJw3UIkPQMuKjq3NBYOFzklf6wXtjLgw
 E+5Ke0utNmc8ROdmwksPXzWNnwqW/VbJueTgBkNtNqiaMxpqkwrZzUJwMsCszJ/N3G
 WBxe4JGqAi+tg==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 969F737804CF;
 Wed, 19 Jun 2024 11:42:21 +0000 (UTC)
Date: Wed, 19 Jun 2024 13:42:20 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, steven.price@arm.com,
 matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 0/2] drm/panfrost: Add MT8188 support
Message-ID: <20240619134220.683ae228@collabora.com>
In-Reply-To: <20240611085602.491324-1-angelogioacchino.delregno@collabora.com>
References: <20240611085602.491324-1-angelogioacchino.delregno@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Tue, 11 Jun 2024 10:56:00 +0200
AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
wrote:

> Changes in v3:
>  - Added comment stating that MT8188 uses same supplies as MT8183
>    as requested by Steven
> 
> Changes in v2:
>  - Fixed bindings to restrict number of power domains for MT8188's
>    GPU to three like MT8183(b).
> 
> This series adds support for MT8188's Mali-G57 MC3.
> 
> AngeloGioacchino Del Regno (2):
>   dt-bindings: gpu: mali-bifrost: Add compatible for MT8188 SoC
>   drm/panfrost: Add support for Mali on the MT8188 SoC

Queued to drm-misc-next.

Thanks,

Boris

> 
>  .../devicetree/bindings/gpu/arm,mali-bifrost.yaml      |  5 ++++-
>  drivers/gpu/drm/panfrost/panfrost_drv.c                | 10 ++++++++++
>  2 files changed, 14 insertions(+), 1 deletion(-)
> 

