Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4458791256
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 09:36:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B2D610E2BA;
	Mon,  4 Sep 2023 07:36:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C5FA10E2BA
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 07:36:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EE9126121E;
 Mon,  4 Sep 2023 07:36:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EA17C433C8;
 Mon,  4 Sep 2023 07:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693813014;
 bh=1kEqDO+Le0/vd5hsx9Tq9iF6mUzLlU0yolPMHIZIPl0=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=Hyc+AdqHrJ762BvgfQcGmZcibW8ab+UpNM85RE5MY8vbO0DiUI7HN4es6MbLGK7Ba
 Jm3+jZmyQKeuaimVoGBkZgJz7dAQ3PjCIY3jgRcBFPtBPo3Ed3xXFCp1qnZsqkiJJh
 VL0gWbkmPOqPy0mW9QRUsyGG/shEM6P5neuu4VQOrETl1waqcbosGVB2Hlrdfff2TB
 PJSeSqOa9QyYwd0YOyU638/1M58nlCyaQcyLJ7XH4pyRGQLZ+T3XGJvNhbMEZF1SIs
 fh2meoyexKImRKBKQ1owzpSqFPzrUUpTxkco1sdijx754GP2uCwoF12J73P589eCi5
 tzkzU3H3r+nrA==
Message-ID: <d9de015051febb9e10760e7f94aef552.mripard@kernel.org>
Date: Mon, 04 Sep 2023 07:36:51 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Douglas Anderson" <dianders@chromium.org>
Subject: Re: [RFT PATCH 02/15] drm/imx/dcss: Call
 drm_atomic_helper_shutdown() at shutdown time
In-Reply-To: <20230901164111.RFT.2.I134336fce7eac5a63bdac46d57b0888858fc8081@changeid>
References: <20230901164111.RFT.2.I134336fce7eac5a63bdac46d57b0888858fc8081@changeid>
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
 linux-imx@nxp.com, kernel@pengutronix.de, laurentiu.palcu@oss.nxp.com,
 shawnguo@kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 1 Sep 2023 16:41:13 -0700, Douglas Anderson wrote:
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
