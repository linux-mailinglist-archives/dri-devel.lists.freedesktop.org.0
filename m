Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E52617ACD4C
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 02:43:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18DD910E1BE;
	Mon, 25 Sep 2023 00:43:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B327710E1BE
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Sep 2023 00:43:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 43827B80BD1;
 Mon, 25 Sep 2023 00:43:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25F1AC433C8;
 Mon, 25 Sep 2023 00:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695602633;
 bh=JrcdGjqgw9+ycHqtFQ5zn4FkPwbgBY2SR3LAdaUpWN4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TXa6RkykcTNLOenXGTYGOw3/aaVa/8h6a9J1Pmcbj9YjZOoDfya5SrTpmOM1rsv59
 NSMucUJIZwmSZMIeDZxf3UOmITNMvTCxPsCNaUZDoXtafvI5P9LaQDbrXq0Jh8zODB
 P2ONizcop3EatCOpr0u88/YUMTcYpa9AfS3ZlYp5WRqAR6mHFlvHR9XjbNBdssDevc
 3i8HAl6hEUE84JKTvg5NIDnK52qCMoszDlcJLrn6Ln2XrRXpNvsxxGI7Si090f7Z1j
 vM1vdFiIvxAyGoQIWWfmoJGEjnHaRs/uaN5aj1v+UR/7VxrzhZU2A/nME5Bgj5oUD5
 o5oqhxBQR5CaA==
Date: Mon, 25 Sep 2023 08:43:40 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 2/2] ARM: dts: imx: add support for the ATM0700D4 panel
 attached to sk-imx53
Message-ID: <20230925004340.GX7231@dragon>
References: <20230826215429.1905599-1-dmitry.baryshkov@linaro.org>
 <20230826215429.1905599-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230826215429.1905599-2-dmitry.baryshkov@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonas Karlman <jonas@kwiboo.se>, Robert Foss <robert.foss@linaro.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Aug 27, 2023 at 12:54:29AM +0300, Dmitry Baryshkov wrote:
> The SK-ATM0700D4-Plug is an extension board (provided by the same
> manufacturer, [1]) which can be connected to the SK-IMX53 panel kit. The
> panel can be connected either using the RGB parallel bus or using the
> LVDS connector (recommended). Add DT files describing this "shield",
> both RGB and LVDS connections.
> 
> [1] http://starterkit.ru/html/index.php?name=shop&op=view&id=64
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Applied, thanks!
