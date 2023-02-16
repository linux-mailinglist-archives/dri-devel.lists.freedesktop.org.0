Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEA3699FCB
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 23:32:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74CFF10E341;
	Thu, 16 Feb 2023 22:32:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12F2D10E341
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Feb 2023 22:32:35 +0000 (UTC)
Received: from notapiano (unknown
 [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 2CDAD66021BB;
 Thu, 16 Feb 2023 22:32:32 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1676586753;
 bh=BzIGU+CnzDqDmo4i4mfAIbOxauz9KQjP4bPTNMrSrjE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GudBLn5ToXmtRjopanrmapzvk2T2D6ZQq2px1IOPZWgx5PCDNY4iQ6fRgAsdSfevB
 5z+v9eArMJPhnTIOKRGkWNzYZpi3WJn8DjEI1mrcQs2TXaRERCMeYlpXmCyllIWiOS
 t9xf/J3K8m8NUEs7XtAmEG1pDLjEh4rC/g6Y2Vkyshs4mEtEKhAfQzPM7qeTCBfkCX
 NyUGXjwwP2zLqTOZOs5vRfhQGr3zolvFFFFKKiyo4Io+Au6u3Z9vkDbVPQtgWl3kdk
 BxOp2klhZqZTPSh/bnL51zVyfU1sKbxyy58GPFQCJwN7Sa8vx3cgOxJQm3J0qk50YM
 YNqDDWsH34J3Q==
Date: Thu, 16 Feb 2023 17:32:27 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH] drm/bridge: anx7625: Use common macros for DP power
 sequencing commands
Message-ID: <20230216223227.sysy3mo4yhnsb42a@notapiano>
References: <20230116072406.3971025-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230116072406.3971025-1-wenst@chromium.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Xin Ji <xji@analogixsemi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 16, 2023 at 03:24:06PM +0800, Chen-Yu Tsai wrote:
> The DRM DP code has macros for the DP power sequencing commands. Use
> them in the anx7625 driver instead of raw numbers.
> 
> Fixes: 548b512e144f ("drm/bridge: anx7625: send DPCD command to downstream")
> Fixes: 27f26359de9b ("drm/bridge: anx7625: Set downstream sink into normal status")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

In the same way, 0x68028 should be switched for DP_AUX_HDCP_BCAPS and 0x01 for
DP_BCAPS_HDCP_CAPABLE, though those aren't part of power sequencing, so are
actually better off in a separate commit.

Thanks,
Nícolas
