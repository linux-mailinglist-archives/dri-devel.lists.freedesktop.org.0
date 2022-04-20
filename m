Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C591508397
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 10:39:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52ED310F229;
	Wed, 20 Apr 2022 08:39:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 233F610F229
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 08:39:25 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 97F673200907;
 Wed, 20 Apr 2022 04:39:23 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 20 Apr 2022 04:39:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1650443963; x=
 1650530363; bh=3SrGdyUlIGHjwPve02v+z7KFpEXmCdWDSAufyz8H+V0=; b=M
 EidIBmJtKvdiITV7506Db1V3rtZsA1haJpJScJmKeBbXjPI/O6KXHNPn9EmOVs39
 nJz4OEvhSzZ4IMgJTcuZzM1ovBJWiJ+w1YpbvatLRsr7SslXP6fjCwZBlkXWphEz
 +PHArC6mFPw60sppTSnSkAm9k9ltaKFA+Vr6rzhhRH6d7/fCQ/FAELvfdohQgTq+
 XlipU1lPDh+jXja5csUZZyVBehPp7e9eq9bytFwT5BGXuCzTqjRPTD55mgOX+tz0
 D8HTXX83YcFyDsjB5gOAIc63nQmqODDb1GgtghhjjJaj+ntuybl7MwUMknOzPnhv
 0ZX8N/bXM7r9MbVEY+vUQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; t=1650443963; x=1650530363; bh=3SrGdyUlIGHjw
 Pve02v+z7KFpEXmCdWDSAufyz8H+V0=; b=V4nJywdq0t/iWAywM1mzmyNx/7n3k
 6aulAJdz7ZGJ9nAJqZvon8NLvY9ZBR9pTomqVts4CgUrbwpHyPqcBKUrwydBChZ4
 +gzdC3mJ2s9MuPftgl8Nn681KxZP0qixOdvMp8AG74VNfUu5tiX1SLgFfiJtP1Z3
 phnSN7GY/Er0wRfGixLEI9bt8mgJ8yYgc2z5MKbMn/x1ykNZBgQE3fvoj3fK/hjz
 Y4M8pXW8FaxF1NKTsUK4q8xOUQoG498gCHR+4LI1W5NIfmFN+v52wuPWo3a7Cm7f
 SCzIZ6TEAb74HK1VWtKUQSacxWBcexg8zidkosYwcup74itlivnrY+tDA==
X-ME-Sender: <xms:usZfYv6Ic3YT3G46m2CbXKAs1D45_HeEASJ1XsZ1RgzsKLm56aoNRw>
 <xme:usZfYk6kYxIzPpCtG0EOgyQ_hJVgzJDO89GarWOXyAoiPHgUoKa7NoniLbQlNBudI
 AZFZl0ez9gc3WLcA6M>
X-ME-Received: <xmr:usZfYmdhU21bvNyxX21ssCpPEJ14hOle69kqOgXthCq6MnrNUgFzYQB0BpuRyrbO7okZNrR4874TtCDgEqMwnACC2hZVXcXJwqrEXxQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrvddthedgtdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhephffvufffkffojghfgggtgfesthekredtredtjeenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeejuefggeekfffgueevtddvudffhfejffejjedvvdduudethefhfefhfeeg
 ieekkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:usZfYgJv2tfYgPvfnaPIbY_VMfoLafDNNQB9eWcg6T_S1e3FoY5a9Q>
 <xmx:usZfYjLU2HUq9vebsHAPQeTaZl5vuyZw3hy8rd3rfJ6J5SLseftrVw>
 <xmx:usZfYpzh9XbKkZd3LICKBB50WtsO1VdGg6XXHCRXCjpGa-wb0lvFLA>
 <xmx:u8ZfYgreVhhpa67kTOhSnBkzU0c54xEAJD46ZAFnDw6A9HQgWoMB1Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 20 Apr 2022 04:39:21 -0400 (EDT)
From: Maxime Ripard <maxime@cerno.tech>
To: Stefan Wahren <stefan.wahren@i2se.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>, David Airlie <airlied@linux.ie>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: Re: (subset) [PATCH 1/2] drm/panel/raspberrypi-touchscreen: Avoid
 NULL deref if not initialised
Date: Wed, 20 Apr 2022 10:39:17 +0200
Message-Id: <165044395513.303702.1698535902830603869.b4-ty@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220415162513.42190-2-stefan.wahren@i2se.com>
References: <20220415162513.42190-1-stefan.wahren@i2se.com>
 <20220415162513.42190-2-stefan.wahren@i2se.com>
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
Cc: linux-kernel@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
 dri-devel@lists.freedesktop.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 15 Apr 2022 18:25:12 +0200, Stefan Wahren wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
> 
> If a call to rpi_touchscreen_i2c_write from rpi_touchscreen_probe
> fails before mipi_dsi_device_register_full is called, then
> in trying to log the error message if uses ts->dsi->dev when
> it is still NULL.
> 
> [...]

Applied to drm/drm-misc (drm-misc-fixes).

Thanks!
Maxime
