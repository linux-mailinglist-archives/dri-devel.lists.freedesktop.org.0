Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54609A9E962
	for <lists+dri-devel@lfdr.de>; Mon, 28 Apr 2025 09:33:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A505610E1F9;
	Mon, 28 Apr 2025 07:33:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="unUU/Akh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 272AE10E1F9
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Apr 2025 07:33:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E9E6E4A2A4;
 Mon, 28 Apr 2025 07:33:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71EDDC4CEE4;
 Mon, 28 Apr 2025 07:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1745825626;
 bh=XKpU8zNPyDsCQA5Q8cj48yTBFsShn/3ZGGxL741ISWs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=unUU/AkhCOp4usx245M9wzfpW+MZVEAYh2wi5kvjjtrAEuse4Hxf65cJZoCT5sjuV
 DhNEEXjRjD2fn1YM58jsIunBu/BGcB22rxV4r3/+nuPNwdHfzgoDCb2r7jA3tIIVyX
 qSrhXSFd63f7St+heKVnmsmBySarcNgWxIXBhumT6fg/6WHWRasbX7zBElD6iC3U97
 t3VzgnlGrintBwXh6fR30kPfcr4cj0IOBhrPKDHpWn1PcQMWZGgPZE+qVV1s2JHgHa
 1e0OhZQMe4E4RkxqZUy6GrUw0JJmfmrbWcJrRZ/1QeRVgWpA47DPaYcEKkRmcqeD3Y
 +GRalgLikh7MQ==
Date: Mon, 28 Apr 2025 09:33:44 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kory Maincent <kory.maincent@bootlin.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH RFC v2 2/5] dt-bindings: display: panel: ili9881c: Add
 data-lanes property
Message-ID: <20250428-celadon-termite-of-music-74b5eb@kuoka>
References: <20250424-feature_sfto340xc-v2-0-ff7da6192df2@bootlin.com>
 <20250424-feature_sfto340xc-v2-2-ff7da6192df2@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250424-feature_sfto340xc-v2-2-ff7da6192df2@bootlin.com>
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

On Thu, Apr 24, 2025 at 05:07:40PM GMT, Kory Maincent wrote:
> Add the data-lanes property to specify the number of DSI lanes used by the
> panel. This allows configuring the panel for either two, three or four
> lanes.

That's the property of DSI controller, not the panel. I do not
understand why this is different than every other panel binding and your
commit msg should explain that. If you do something than everyone else
it is a clear hint you need to explain that.

Best regards,
Krzysztof

