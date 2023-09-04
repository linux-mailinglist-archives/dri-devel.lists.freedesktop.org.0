Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6618B7912A7
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 09:55:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4739E10E2E7;
	Mon,  4 Sep 2023 07:55:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E5F710E2C9
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 07:55:10 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 88C356131F;
 Mon,  4 Sep 2023 07:55:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 780EFC433C8;
 Mon,  4 Sep 2023 07:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693814108;
 bh=hrumtQoV1/ACtGoSsBTZdx/2I2D/Z7gcCZhcW0zrn04=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=fedbdDOEevGhM4eFrSwwvCxC+lMbRQCn/Kk45uAI61D5+yf9T61g7cdwMKzNMgKwE
 5CxaHynR/tzzj963O7X/bR7SbWRsbT/Ge7eNRNT9ntR1B0DbuDzQJhpyChN1Bf9W9/
 dGbcLCsVpPIHrGA1aQd+s6/Dj7iCsOuYOxVufmwqLidf0ognf3hh0SH+Dd9L1q3DV7
 UmSg+CxCxfRyLAJKtGdWxw3ddKJYc+T5BMD/2xSBL1BHM3H87SdbyFnN+UfmDf3bcS
 +ex24+ORJzpZ7QUCF/35NcWTCmU52S/ZPCcG2tUCCWEkV6Xf0vO0jGMN2rTtF2UbW2
 cfPn18KN+rvfQ==
Message-ID: <daec0568ae87cf84bd0e57ce40cf9162.mripard@kernel.org>
Date: Mon, 04 Sep 2023 07:55:06 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Douglas Anderson" <dianders@chromium.org>
Subject: Re: [RFT PATCH 13/15] drm/imx/ipuv3: Call
 drm_atomic_helper_shutdown() at shutdown/unbind time
In-Reply-To: <20230901164111.RFT.13.I0a9940ff6f387d6acf4e71d8c7dbaff8c42e3aaa@changeid>
References: <20230901164111.RFT.13.I0a9940ff6f387d6acf4e71d8c7dbaff8c42e3aaa@changeid>
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
Cc: Maxime Ripard <mripard@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-imx@nxp.com, kernel@pengutronix.de, shawnguo@kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 1 Sep 2023 16:41:24 -0700, Douglas Anderson wrote:
> Based on grepping through the source code this driver appears to be
> missing a call to drm_atomic_helper_shutdown() at system shutdown time
> and at driver unbind time. Among other things, this means that if a
> panel is in use that it won't be cleanly powered off at system
> shutdown time.
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
