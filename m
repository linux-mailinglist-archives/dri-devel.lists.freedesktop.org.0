Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 036BE7568B4
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 18:07:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB63710E03C;
	Mon, 17 Jul 2023 16:07:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB69310E03C
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 16:07:51 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 567096113A;
 Mon, 17 Jul 2023 16:07:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC5AAC433C7;
 Mon, 17 Jul 2023 16:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689610070;
 bh=iXIYteTk4ukjDs/e/8vdGRE/qy4ZaA4iRgqB5Mrtjdg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BoL6fejipreN6OGGBVpE13gCI5dRes8NBMbeXfAQKKiqXkbvVfhBwi2PGNin+aRwH
 mw5yrUUTFJcEFt0NO7eFCtEgVYHoUzL5n61ckxo4N7kWaJdktR9HlyYhMzkp0H5H4D
 xQeCapJ1lmSv+VdjzFQiklVdcTlWaz5nV+d++E4b0hhXz+qE4wWP1yiQuuLPhB7KEc
 JQYVc+5n9p5HQDuvLylPJtEP0CO4QCBHg9+zi5TPbVIDMqIDYodugmbb2dNMgtG9Bq
 xG/aakL/uGjCrIgBmyzkz+95NP3RzEFgUK+VHmbvByIRT46Cw2KfyUZ8YMA5e0ESaW
 ssuRuGCAtq3Kg==
From: Robert Foss <rfoss@kernel.org>
To: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
 <nfraprado@collabora.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Xin Ji <xji@analogixsemi.com>,
 Jonas Karlman <jonas@kwiboo.se>, Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [PATCH] drm/bridge: anx7625: Use common macros for HDCP
 capabilities
Date: Mon, 17 Jul 2023 18:07:32 +0200
Message-ID: <168961003702.2938487.17405338529770325814.b4-ty@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230710091203.1874317-1-wenst@chromium.org>
References: <20230710091203.1874317-1-wenst@chromium.org>
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
Cc: dri-devel@lists.freedesktop.org, Robert Foss <rfoss@kernel.org>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 10 Jul 2023 17:12:01 +0800, Chen-Yu Tsai wrote:
> The DRM DP code has macros for the DP HDCP capabilities. Use them in the
> anx7625 driver instead of raw numbers.
> 
> 

Applied, thanks!

[1/1] drm/bridge: anx7625: Use common macros for HDCP capabilities
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=41639b3a8b0f



Rob

