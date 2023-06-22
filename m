Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 219DE739E3C
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 12:17:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AB3110E52B;
	Thu, 22 Jun 2023 10:17:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AAEA10E52B
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 10:17:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 63DD6617C7;
 Thu, 22 Jun 2023 10:17:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D45E1C433C8;
 Thu, 22 Jun 2023 10:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687429037;
 bh=McJw4yj+3Kf9jn1ZwGX0a9V4cQzBuo9RO+rqfuWeUZY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=J2ZDseyurBPtJqc0nQ1uYwN70v9wASKytD4EvYBP+SUkfk9OUd/hkgTQ6MWDUu3Ti
 BFErVIXG2tQy2IGa23ZPj3sPXX9dhs9XsX/yYjDCFsM+cHEawoODeMWkfwDXtWd46Y
 TxLx1aZj1uiW+qW/hpjjbZqp2C3LNmIVNFr6npM3N/TftslXT/sKe3I5hyGFwCnBD6
 aXogCvhF+VsA4XSIbvMTWyr5a7XuGxsBVo6XvfN5E+ieck1B4oWnQaKqDvequLozH6
 E7r6HNAeJPc9E46B+4nbW0LoJtAVXmfpUTDFWAOg0iktmy1bx2JkK8+PpTv1la4/7u
 +ezH1yRfqO0eQ==
From: rfoss@kernel.org
To: linux-rockchip@lists.infradead.org,
 =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megi@xff.cz>
Subject: Re: [PATCH v2] drm: bridge: dw-mipi-dsi: Fix enable/disable of DSI
 controller
Date: Thu, 22 Jun 2023 12:17:10 +0200
Message-Id: <168742902332.865433.11382317679096265094.b4-ty@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230617224915.1923630-1-megi@xff.cz>
References: <20230617224915.1923630-1-megi@xff.cz>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Archit Taneja <architt@codeaurora.org>, Robert Foss <rfoss@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Philippe CORNU <philippe.cornu@st.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Robert Foss <rfoss@kernel.org>

On Sun, 18 Jun 2023 00:48:25 +0200, Ondřej Jirman wrote:
> From: Ondrej Jirman <megi@xff.cz>
> 
> Before this patch, booting to Linux VT and doing a simple:
> 
>   echo 2 > /sys/class/graphics/fb0/blank
>   echo 0 > /sys/class/graphics/fb0/blank
> 
> [...]

Applied, thanks!

[1/1] drm: bridge: dw-mipi-dsi: Fix enable/disable of DSI controller
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=05aa61334592



Rob

