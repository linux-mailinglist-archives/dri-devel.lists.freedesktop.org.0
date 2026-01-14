Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A223D2139E
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 21:53:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE48910E694;
	Wed, 14 Jan 2026 20:53:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IHZi+wqG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D74F010E694
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 20:53:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8B9AF40BCD;
 Wed, 14 Jan 2026 20:53:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13EF3C4CEF7;
 Wed, 14 Jan 2026 20:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768423980;
 bh=Gnjj25st9QGTCaY33pJBX4f4Rfu3Pop9v+b0tj9YmY0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IHZi+wqGbmzSAE6BWp8XSIyCMb8IN67048oNU0Ay9YPcF003ZnzIvNBGNV/nBVIyh
 NDUyn8/YrOxa3OmZ+ncBTZs4dzj+y4f1O1QDc43+e8MbBhf+IhfMgrdgxaoyn2rZGI
 vqhp8iIobT8u7vEaa/rQTsSg7FlHldztTZuqxQ1qndMZTSJ9W0ZEt8AFDEzes/sZ30
 ze9b+DX+7W73Eapr0LWbR9f+hBp6CEt5pB+z1HrCmErrW+32v3kOpKKGTsAPqayP1K
 GmI00eP5GjFEv9fgYc4SyRR9nRBcBd13wtySiPA7lRJF4R5cCI63L3lAGHnBLOGjK8
 cKfhMgVgAa+bA==
Date: Wed, 14 Jan 2026 14:52:59 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-kernel@vger.kernel.org, Robert Foss <rfoss@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 devicetree@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH v2] dt-bindings: display: bridge: ldb: Add check for reg
 and reg-names
Message-ID: <176842397781.3190593.16218482428701977852.robh@kernel.org>
References: <20260106012236.295834-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260106012236.295834-1-marek.vasut@mailbox.org>
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


On Tue, 06 Jan 2026 02:22:20 +0100, Marek Vasut wrote:
> Make "reg" property mandatory for all LDB devices and "reg-names"
> mandatory for i.MX8MP and i.MX93 which have two "reg" values. The
> i.MX6SX has only one "reg" value so the "reg-names" property there
> is optional and not needed.
> 
> Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
> ---
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> ---
> V2: Include only reg-names in the required: field for non-MX6SX
> ---
>  .../devicetree/bindings/display/bridge/fsl,ldb.yaml    | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 

Applied, thanks!

