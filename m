Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09C13A26787
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 00:06:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75E4A10E58D;
	Mon,  3 Feb 2025 23:06:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="s/Oqgb1r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5D6E10E58E
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 23:06:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 099E95C69D0;
 Mon,  3 Feb 2025 23:05:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07A40C4CEF0;
 Mon,  3 Feb 2025 23:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738623980;
 bh=8BS2LzvHcY78r1DdXYDr56TTF+ncuwdpHMuL/41500s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=s/Oqgb1r/aQwrhI+H5DguR4mvIzCqhBGEL1v2+HGxur3qlKR10e5vJyTvtKuLnzpt
 2Py18GBs3H7WVtbqksGT2LX6xTei47UOovGqk9O6fXrdcnOYIU31eKwhofsVhY9CQD
 o8s2StGGt9Q303awQLnXL3V9NJiEDaGMjdbfcbybvutzdfXzPji6De2oE8c0fnKj1O
 CiT83JoMsJQGL+Z+8/G1vO0v8CAKVXxBYyTyM9PGzcf1awaq3Q1bEyMv18ZxsChxPl
 o0WMur3EI03qosHXattpMjJUmPh9wgahW5UKkBjAswivrhsSbgZLptVjTXwLNAjDz4
 xSH7cilbv7Izw==
Date: Mon, 3 Feb 2025 17:06:18 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: rafael@beims.me
Cc: Simona Vetter <simona@ffwll.ch>, Rafael Beims <rafael.beims@toradex.com>,
 Robert Foss <rfoss@kernel.org>,
 Joao Paulo Goncalves <joao.goncalves@toradex.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>, dri-devel@lists.freedesktop.org,
 Adrien Grassein <adrien.grassein@gmail.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: display: bridge: lt8912b: Add I2S audio
 input port
Message-ID: <173862397834.518293.5664388217181154431.robh@kernel.org>
References: <20250203192401.244651-1-rafael@beims.me>
 <20250203192401.244651-2-rafael@beims.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203192401.244651-2-rafael@beims.me>
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


On Mon, 03 Feb 2025 16:23:55 -0300, rafael@beims.me wrote:
> From: Rafael Beims <rafael.beims@toradex.com>
> 
> Add the I2S audio input port for audio over HDMI support.
> 
> Signed-off-by: Rafael Beims <rafael.beims@toradex.com>
> ---
>  .../bindings/display/bridge/lontium,lt8912b.yaml          | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

