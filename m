Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21281B04FAC
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 06:03:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B1D110E502;
	Tue, 15 Jul 2025 04:03:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="k/jWNrds";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35B9910E502
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 04:03:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9FD805C5439;
 Tue, 15 Jul 2025 04:03:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F034C4CEE3;
 Tue, 15 Jul 2025 04:03:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752552187;
 bh=RzbwxuJaFCbrVE5Vc09Rl3dqeW9ci/Csn6XWWJ2T4Pk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=k/jWNrdsUMdUNl6ZgaF3LGtr96yCcXOg7fBUu2BE0/25G+A+dRPSL9jR/Afj0SaAT
 RuA7/unR9MPxCSebKQhTv6AOv8KBK6F0tQxDhd31pCA1JQT5rUhFEDJbSotfmgPvpG
 YtO0wnjW4FkgoTc8aTV15ff3U7PKhbg73TX+RMunzYKx18E7yP31JmaJjwTE6wvq/U
 l22xRdvrc52lVpgbvt6H8Upm0z33WHD/G84RMAq54Xd4JIEVZtoIAR+/v/Apf2N20D
 +o+Da3spgbaQW7/81hJ6O6XjEPzPh10hbwP67+q6/kIL/rmxdYp3bAqpm+ZtC29aFa
 cRBD3HIG94RJg==
Date: Mon, 14 Jul 2025 23:03:06 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Richard Yao <richard@scandent.com>
Cc: devicetree@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>, Conor Dooley <conor+dt@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Akshay Athalye <akshay@scandent.com>
Subject: Re: [PATCH 2/3] dt-bindings: ilitek-ili9881c: Add Tianxinwei
 TWX700100S0 support
Message-ID: <175255218541.29438.10753274216810305494.robh@kernel.org>
References: <20250714191729.2416-1-richard@scandent.com>
 <20250714191729.2416-3-richard@scandent.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250714191729.2416-3-richard@scandent.com>
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


On Mon, 14 Jul 2025 15:17:22 -0400, Richard Yao wrote:
> Document the compatible value for Tianxinwei TWX700100S0 panel.
> 
> Signed-off-by: Richard Yao <richard@scandent.com>
> ---
>  .../devicetree/bindings/display/panel/ilitek,ili9881c.yaml       | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

