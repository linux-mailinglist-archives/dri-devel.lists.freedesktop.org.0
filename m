Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C359E3B97
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 14:46:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B84D910ED27;
	Wed,  4 Dec 2024 13:46:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="neemGZuE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DD4610ED27
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 13:46:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D76C55C48E2;
 Wed,  4 Dec 2024 13:45:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6395C4CECD;
 Wed,  4 Dec 2024 13:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733319971;
 bh=ENM0SClxUt2lPvodmnrHzeLBV9BDJq1owuP9D1ySOsA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=neemGZuEgTiKvdyK2nqqBYB/8qfQ02WQDlv9wzIByn8tp5P7+i8Bvs1enmvuyV708
 2y+DTLhmxW610fCYgDcKAGG1exv2oRBeJCd+yRhFI3hAakWRmsWRFDbnoxEkUyxJql
 6ybJkg/fRNts42khtGnjNb6KibyexaOwInuQ2AcYCGUVBUFlYOyDdfT4DP9kl/thF7
 tf3lDdIN5Ldml9S0Tf7i7Qfz1gitRo4lTNtBsBDGAJAGA5fRtcUweosP505AR1vY0P
 HbYaYO4wVYkJ+HHS85KZPM/1k8ODE8AfD1lLGjL4v9cGhehM3cwvqdpaYGwe71Kxsp
 eRmjIsDwlthpg==
Date: Wed, 4 Dec 2024 19:16:07 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Sandor Yu <Sandor.yu@nxp.com>
Cc: dmitry.baryshkov@linaro.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, festevam@gmail.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, mripard@kernel.org,
 kernel@pengutronix.de, linux-imx@nxp.com, oliver.brown@nxp.com,
 alexander.stein@ew.tq-group.com, sam@ravnborg.org
Subject: Re: [PATCH v18 2/8] phy: Add HDMI configuration options
Message-ID: <Z1BdHzfcnj6XJ9D4@vaman>
References: <cover.1730172244.git.Sandor.yu@nxp.com>
 <64f6885b5a5ca89c8214b3138cb58c3133ac2109.1730172244.git.Sandor.yu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <64f6885b5a5ca89c8214b3138cb58c3133ac2109.1730172244.git.Sandor.yu@nxp.com>
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

On 29-10-24, 14:02, Sandor Yu wrote:
> Allow HDMI PHYs to be configured through the generic
> functions through a custom structure added to the generic union.
> 
> The parameters added here are based on HDMI PHY
> implementation practices.  The current set of parameters
> should cover the potential users.

Acked-by: Vinod Koul <vkoul@kernel.org>


-- 
~Vinod
