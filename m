Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C0759ED3D
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 22:18:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3747410E173;
	Tue, 23 Aug 2022 20:18:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD08110E173
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 20:18:08 +0000 (UTC)
Received: from notapiano (unknown [194.36.25.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C25AA6601E70;
 Tue, 23 Aug 2022 21:18:03 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1661285887;
 bh=3HtXjX4gyHmU0D4ZFCriKrikrXvs5wvAt9U4bZ/suVQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ezfM/oUp6/AuRLjhow5JNV5fK54K3j1G+aWnWYXn4cTK1ZLqKWrWn1aEleUvpwpSU
 dNfQq02+hg2K7p9NE0q6DJsPVeFzDAMc5XvjsNjQLg12J7T/78CBUrg9/LccOV1tvf
 jFzNLcpOXWzmYU2noLOEaw3+j2DWRQdSZDhHDNcXdDwuT0s75Hg22SQ/IeU/Hb9vWh
 ymVIbv2HxqnldjJipD3KwxkJ4+mRZoN7MejPeGbIkWuZFNAWyhcRs0d2WeyDxEQmZ7
 WyXAJcpMygBHOpodZkF9MZe5IB4XrL/I2Ai5D2NBzG5Jnq9FQtG1IB6ajrxb7Jas7G
 E2AH0/6f3Gfzw==
Date: Tue, 23 Aug 2022 16:17:59 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: xinlei.lee@mediatek.com
Subject: Re: [PATCH v3,1/2] soc: mediatek: Add mmsys func to adapt to dpi
 output for MT8186
Message-ID: <20220823201758.ffbgb5t5odoicgir@notapiano>
References: <1661236702-30682-1-git-send-email-xinlei.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1661236702-30682-1-git-send-email-xinlei.lee@mediatek.com>
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
Cc: chunkuang.hu@kernel.org, Jitao Shi <jitao.shi@mediatek.com>,
 airlied@linux.ie, jason-jh.lin@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, yongqiang.niu@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, rex-bc.chen@mediatek.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Aug 23, 2022 at 02:38:22PM +0800, xinlei.lee@mediatek.com wrote:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Add mmsys function to manipulate dpi output format configuration for MT8186.
> 
> Co-developed-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas
