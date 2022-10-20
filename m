Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE9E60661B
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 18:46:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2078C10E77B;
	Thu, 20 Oct 2022 16:46:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F92E10E524
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 16:46:13 +0000 (UTC)
Received: from notapiano (unknown
 [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 2C848660247C;
 Thu, 20 Oct 2022 17:46:10 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1666284371;
 bh=2MohZhSUGqmwuDliCCivOWpeD5bO3MbYBpcUQ98ps4g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Me/Q6NQuidzZgGKz+QB89yUsmqD1HwCytpLajWWi/83SHoUMmxSFEMShEF9wlu16f
 cMmF7zdrGD2HlcRAyvyyi0PYChB/Y0fxufARemPw4b80YPkE5eW1S0CXlUrp8Hjd/M
 ZQbw6cOKjNg2qtszDjPKdot87NRhF/NwqpOcFCRbFyLddnyE8I8D4+q4sJH/+Sg6kB
 JXMaFOWbMKegjcpwj/w6uXO48ENIJKZRDPHe8ujmd/7VrD51vULICJ2gI8GrJfvUTE
 CoVUNKiGjYTfDP32vXnJcW11SN3sAzcZRjV4z7sCSzN6CTsTqAuQT+LYiRL+YCTRdg
 1OH/jpJ2vSRKw==
Date: Thu, 20 Oct 2022 12:46:07 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: xinlei.lee@mediatek.com
Subject: Re: [PATCH v12,3/3] drm: mediatek: Add mt8186 dpi compatibles and
 platform data
Message-ID: <20221020164607.3ysaptgpgn5gfwqj@notapiano>
References: <1666147936-27368-1-git-send-email-xinlei.lee@mediatek.com>
 <1666147936-27368-4-git-send-email-xinlei.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1666147936-27368-4-git-send-email-xinlei.lee@mediatek.com>
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
Cc: chunkuang.hu@kernel.org, airlied@linux.ie, jason-jh.lin@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, rex-bc.chen@mediatek.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 19, 2022 at 10:52:16AM +0800, xinlei.lee@mediatek.com wrote:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Add the compatible because use edge_cfg_in_mmsys in mt8186.

I think the commit message could be improved:

Add support for mt8186. It needs its own mtk_dpi_conf data since
edge_cfg_in_mmsys is set to true for this platform.

> 
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas

> ---
[..]
