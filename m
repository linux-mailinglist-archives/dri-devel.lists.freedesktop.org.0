Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7B786FE52
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 11:07:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C82F410FF1F;
	Mon,  4 Mar 2024 10:07:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="vFQED+jr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8139D10FF1C
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 10:07:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D1A2560E0B;
 Mon,  4 Mar 2024 10:07:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0E30C433C7;
 Mon,  4 Mar 2024 10:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1709546820;
 bh=zb/zWbcIFlXjIUKTmNwLYZYzIs7lgmlr0WsOLv3bGM4=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=vFQED+jrVivsCkVNX9kKYt7DPzzYt/Rk9c9km9Aznn2wrlkew3cUY9oHHRJ8z/S6O
 /pws0eG1f8CMlrDEypWbmgb7MhhxFrXHL86F4X4b+tknwqSXk7NBYuOLQABnbcAafL
 E6NIW4q854fOKV5k10yCljLg/5TnxPc7dtA0QGPbNlHpE2081JRIY3VdWv0y4hN5f0
 Uf6DtbXU7gvYE2Bofpnj9vErgbzvdngC3bzCF992nXl1CDkLLE2B5iZXBB/EqIFEEn
 hMBtXyOmhTxLrnPB4qGPuR3iSdQ7SiBkeAxaCk0FOLFqZ2HeD9qMdUA1qz9/8xRvRc
 /GEa7kMKTaxhw==
Message-ID: <b29f024c2ab6d532dcd5143dc302b8ce@kernel.org>
Date: Mon, 04 Mar 2024 10:06:57 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Frank Oltmanns" <frank@oltmanns.dev>
Subject: Re: [PATCH v3 2/5] clk: sunxi-ng: a64: Set minimum and maximum rate
 for PLL-MIPI
In-Reply-To: <20240304-pinephone-pll-fixes-v3-2-94ab828f269a@oltmanns.dev>
References: <20240304-pinephone-pll-fixes-v3-2-94ab828f269a@oltmanns.dev>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 stable@vger.kernel.org, "Chen-Yu
 Tsai" <wens@csie.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Daniel Vetter" <daniel@ffwll.ch>, "David
 Airlie" <airlied@gmail.com>, "Diego Roversi" <diegor@tiscali.it>,
 =?utf-8?b?R3VpZG8gR8O8bnRoZXI=?= <agx@sigxcpu.org>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jessica
 Zhang" <quic_jesszhan@quicinc.com>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>, "Ondrej
 Jirman" <megi@xff.cz>, "Purism Kernel Team" <kernel@puri.sm>,
 "Rob Herring" <robh+dt@kernel.org>, "Sam
 Ravnborg" <sam@ravnborg.org>, "Samuel Holland" <samuel@sholland.org>, "Stephen
 Boyd" <sboyd@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>
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

On Mon, 4 Mar 2024 08:29:18 +0100, Frank Oltmanns wrote:
> When the Allwinner A64's TCON0 searches the ideal rate for the connected
> panel, it may happen that it requests a rate from its parent PLL-MIPI
> which PLL-MIPI does not support.
> 
> This happens for example on the Olimex TERES-I laptop where TCON0
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
