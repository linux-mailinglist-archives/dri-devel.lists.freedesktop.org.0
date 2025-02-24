Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B1C6A42DDA
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 21:32:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24B2010E390;
	Mon, 24 Feb 2025 20:32:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VWb+AJ2m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 689BE10E390
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 20:32:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id BA4E761134;
 Mon, 24 Feb 2025 20:32:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B2F2C4CEDD;
 Mon, 24 Feb 2025 20:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740429133;
 bh=LEHxu5uUmeaV7+NU70Sza9810F5pHO55NG+jcIxXdLQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VWb+AJ2me2apk+gmPLWDZXowwwAyEGuesvKDYbTkGbZHkofFvMw3X3ejLPs2COr1o
 ZgWG/ZCnkVCXoqmgHOlJyw+MFXK10bkkBCq0uU8+r9oj8XVlreLKT9zfngo86iM40E
 aPuqms5vxELWLUCfMdDPKextu5DeajD2SxRgSCZ2P3x3+EQAI6+YZY9vNjOxIFmkFJ
 EbuLfaAacYExZJfr99LMkww9uW/iEkHAJg3kx8mPaiQhp5p9Ywi4v05Lb9LR3WoPfv
 Lg537vsSWQwVwA2rJXRKVGHKoCT5bnYp/D99eniwkRm/sVY4LM1Kl4VrxGEXC7IfKu
 m3ysrKMt5H7uw==
Date: Mon, 24 Feb 2025 14:32:11 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Maud Spierings <maudspierings@gocontroll.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Liu Ying <victor.liu@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Simona Vetter <simona@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 01/14] dt-bindings: display: simple: add BOE AV101HDT-A10
 panel
Message-ID: <174042913116.4047506.14844482036971785905.robh@kernel.org>
References: <20250224-initial_display-v1-0-5ccbbf613543@gocontroll.com>
 <20250224-initial_display-v1-1-5ccbbf613543@gocontroll.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224-initial_display-v1-1-5ccbbf613543@gocontroll.com>
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


On Mon, 24 Feb 2025 14:50:51 +0100, Maud Spierings wrote:
> add a compatible string for the BOE AV101HDT-A10 10.1" LVDS panel
> 
> Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
> ---
>  Documentation/devicetree/bindings/display/panel/panel-simple.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

