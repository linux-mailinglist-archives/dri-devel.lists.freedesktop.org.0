Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 945EF9F612A
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 10:15:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D6D710E0EE;
	Wed, 18 Dec 2024 09:15:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SwfvaUxu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA53010E0EE
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Dec 2024 09:15:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6FD05A42092;
 Wed, 18 Dec 2024 09:13:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EAF9C4CECE;
 Wed, 18 Dec 2024 09:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734513317;
 bh=fbWSISg3pqwIP3gp/FXBpL6JXIqp0/i4mzGvP6dEieY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SwfvaUxuNabK48hCNq0fMTSo9p8Pbil63clvCW98USkYSOTvsHZpHiEa+EekRsX6K
 U25tvqI0dMKdIUVo2u4zuGoGRXZvxFrifNwoOuyhoeq6KYD99VOtde2lnh/osEwOUd
 r+7GXex44fQkvDMBfJRlEthMg7vWj99bjueJfG/hOhHI2U+zh1DvW5wrLn1qjBrLUt
 No5sHjxfHAIUWnECmHRFIkcgIVrn5PrBh6fDq3tyfNLF8ONCtIiy5PDz2jmnsoesUO
 GV+3VzPCJCTL3llr3oqIVemH3ilLbQtShBOeY5277hPLmM6KRS7iWaiyiPggA00h0c
 YbWrK2l9+RiSg==
Date: Wed, 18 Dec 2024 10:15:14 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sandor Yu <Sandor.yu@nxp.com>
Cc: dmitry.baryshkov@linaro.org, andrzej.hajda@intel.com, 
 neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 festevam@gmail.com, 
 vkoul@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, 
 mripard@kernel.org, kernel@pengutronix.de, linux-imx@nxp.com,
 oliver.brown@nxp.com, alexander.stein@ew.tq-group.com, sam@ravnborg.org
Subject: Re: [PATCH v20 4/9] dt-bindings: display: bridge: Add Cadence MHDP8501
Message-ID: <euujxcd22nake5s4wioc7ew4rxhqwijh5vucozjorotn3nqdvc@q65uqqj2bjwj>
References: <cover.1734340233.git.Sandor.yu@nxp.com>
 <f2b7beebeb99ca69021ca24744e29af3454f5620.1734340233.git.Sandor.yu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f2b7beebeb99ca69021ca24744e29af3454f5620.1734340233.git.Sandor.yu@nxp.com>
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

On Tue, Dec 17, 2024 at 02:51:46PM +0800, Sandor Yu wrote:
> Add bindings for Cadence MHDP8501 DisplayPort/HDMI bridge.
> 
> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> ---
> v19->v20:
> - remove data type link of data-lanes.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

