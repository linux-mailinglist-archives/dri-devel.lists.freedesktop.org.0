Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C159BA5109
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 22:30:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D20A10E03C;
	Fri, 26 Sep 2025 20:30:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kW0QYxg6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7753B10E03C
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Sep 2025 20:30:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1EA7D442FB;
 Fri, 26 Sep 2025 20:30:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF811C4CEF4;
 Fri, 26 Sep 2025 20:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758918600;
 bh=4Gq7KvjaCB2WFHjOUePwFbctD4FXh5nNheLbEmsCuc0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kW0QYxg6I4w5dsZg2JSo/Xbb6rcY7ewPqlzNVdR56q06BO6p16KmNN2GHNtL9cZFM
 8EFObXPXlBqe5FBWOstFKaXRcB+NdXvtc2V4ergURRYfHOkR8NR18Kx05UCOzKvpHX
 sINOHh4P06RXAt7rfye8i9buZfn17rXuNUUaKbM35OQy0JKgPNS1NleOiF74gFRbP9
 Zm8jSr+BinwyyoWsI/Gkh2ClH4f+JhVULiIJAWnC2RH0y/pngqIjYme9+EfPfAWi60
 fdUMnxcJdxm+EJMTqvS8Feuu40Yng3iiBud7P1VlVr0W6u4wj0vUUOcygQbunImT61
 qQ8SEPtZ2AIZQ==
Date: Fri, 26 Sep 2025 15:29:58 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, imx@lists.linux.dev,
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@gmail.com>,
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Peter Senna Tschudin <peter.senna@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maxime Ripard <mripard@kernel.org>,
 Martyn Welch <martyn.welch@collabora.co.uk>,
 Ian Ray <ian.ray@ge.com>, Conor Dooley <conor+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v2 1/1] dt-bindings: display: bridge: convert
 megachips-stdpxxxx-ge-b850v3-fw.txt to yaml
Message-ID: <175891859618.1448277.6748514316682100995.robh@kernel.org>
References: <20250923205549.200670-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923205549.200670-1-Frank.Li@nxp.com>
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


On Tue, 23 Sep 2025 16:55:48 -0400, Frank Li wrote:
> Convert megachips-stdpxxxx-ge-b850v3-fw.txt to yaml format.
> 
> Additional changes:
> - Only keep one example.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v2
> - add description for port@0 and port@1
> - add both ports to required list
> ---
>  .../megachips,stdp2690-ge-b850v3-fw.yaml      | 111 ++++++++++++++++++
>  .../megachips-stdpxxxx-ge-b850v3-fw.txt       |  91 --------------
>  2 files changed, 111 insertions(+), 91 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/bridge/megachips,stdp2690-ge-b850v3-fw.yaml
>  delete mode 100644 Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
> 

Applied, thanks!

