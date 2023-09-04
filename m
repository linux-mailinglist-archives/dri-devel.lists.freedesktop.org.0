Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 570C779121B
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 09:28:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 439D010E2B6;
	Mon,  4 Sep 2023 07:28:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DFB910E2B6
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 07:28:23 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5ABCB611CB;
 Mon,  4 Sep 2023 07:28:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71653C433C8;
 Mon,  4 Sep 2023 07:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693812502;
 bh=2jeuNIWsN5F7oxkSoe26j7sx09fm8BoytW8BbawJMew=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=mLVj+2eOex7XCmOwOcEZCZAu8CSjOEhAmeuKB3pfp4l56rHKl6xRz7LasbkfKODkT
 E8fiOQZ1dvcMjqz/O3B0DWhT5VBEVHnjEmfEGkSrbO+07lG5j+3gwPQAQukrTIynkx
 sTdotMBEU+o9KuU1xgQy7J+UEUOXIizdZoL4BGG9JmsM05VlM1K9CsRGvbfsWdSidj
 h2qlJDSNUhM9suhO08LtiuQFR9pRGtqFfMS7VTE0ffYlckAZjl//XUjIjio+Yg1gSW
 RogOYDKzGuxs9sqTh3gn3BFbX1zs3RXf7mxcM6MwS7h6SGAQkZGSXH6spw5HQjQ2wN
 kFCbndpiNERUw==
Message-ID: <04f988ff0694824089a46d60444e89ac.mripard@kernel.org>
Date: Mon, 04 Sep 2023 07:28:20 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Douglas Anderson" <dianders@chromium.org>
Subject: Re: [RFT PATCH 08/15] drm/arcpgu: Call drm_atomic_helper_shutdown()
 at shutdown time
In-Reply-To: <20230901164111.RFT.8.I8a0a246fea222059881d01a8fff2adcf7ef3d7a4@changeid>
References: <20230901164111.RFT.8.I8a0a246fea222059881d01a8fff2adcf7ef3d7a4@changeid>
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
Cc: abrodkin@synopsys.com, linux-kernel@vger.kernel.org, Maxime
 Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 1 Sep 2023 16:41:19 -0700, Douglas Anderson wrote:
> Based on grepping through the source code this driver appears to be
> missing a call to drm_atomic_helper_shutdown() at system shutdown
> time. Among other things, this means that if a panel is in use that it
> won't be cleanly powered off at system shutdown time.
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
