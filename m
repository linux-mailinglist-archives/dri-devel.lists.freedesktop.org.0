Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1A7779004
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 14:59:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A0B710E0B6;
	Fri, 11 Aug 2023 12:59:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D148110E0B6
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Aug 2023 12:59:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 37D2E65E66;
 Fri, 11 Aug 2023 12:59:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B893CC433C8;
 Fri, 11 Aug 2023 12:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691758791;
 bh=x+uN9Za/4d0M/iYmnpne9+Q6zWzuYU0ohyG404YXD2E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=d3E/362z7vfoGeQM+O8cuX0jxh+8LY5wg57vKDsJ5qNN+ukjiZCtUoeDvsAfXxWU4
 Vwnh4r7Pnh45+/+w2OKL20kao03cd7XnlnSqi3CjWGyTWVrIpfMt5hCIddHKyMBD52
 91yHnmd77BY0ckqWP6w3fA9EExi2gzxLCm1Ivk4N0nGVjHz/lp8fR1xFbtgajWHDMY
 y6L7zxUD4qvr5R9/hxcJyACpLkqMAcF0cnjqD9kpfMtF3c4EJ78xLXfJd3YtACJDhC
 iSZEHk6cLpvf1hgGd+GF9ddyKVVpg1HjIwr4TPNbzOCmT4UkFrDiz5sHKC68OAPnjQ
 Fp4vpUfFQAjuA==
From: Robert Foss <rfoss@kernel.org>
To: dri-devel@lists.freedesktop.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v4] drm: bridge: samsung-dsim: Fix waiting for empty cmd
 transfer FIFO on older Exynos
Date: Fri, 11 Aug 2023 14:59:38 +0200
Message-ID: <169175865996.293502.7367123633298049810.b4-ty@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230809145641.3213210-1-m.szyprowski@samsung.com>
References: <CGME20230809145649eucas1p1bb67f98aa4b2987b263b0fd84204d8a2@eucas1p1.samsung.com>
 <20230809145641.3213210-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Tomasz Figa <tfiga@chromium.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 9 Aug 2023 16:56:41 +0200, Marek Szyprowski wrote:
> Samsung DSIM used in older Exynos SoCs (like Exynos 4210, 4x12, 3250)
> doesn't report empty level of packer header FIFO. In case of those SoCs,
> use the old way of waiting for empty command tranfsfer FIFO, removed
> recently by commit 14806c641582 ("Drain command transfer FIFO before
> transfer").
> 
> 
> [...]

Fixed formatting warning related to commit message syntax.

Applied, thanks!

[1/1] drm: bridge: samsung-dsim: Fix waiting for empty cmd transfer FIFO on older Exynos
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=15f389da1125



Rob

