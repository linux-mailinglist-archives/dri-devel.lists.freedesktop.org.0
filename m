Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E61779075
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 15:11:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD33910E0BB;
	Fri, 11 Aug 2023 13:11:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98A9810E0BB
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Aug 2023 13:11:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 12B18670D1;
 Fri, 11 Aug 2023 13:11:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C33AC433C7;
 Fri, 11 Aug 2023 13:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691759472;
 bh=pG3W4BLj7SgzrM4zNOHBhfQefULPrxthb+ERJhVwLC8=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=KTOB/32G033PH0vXjKjn04M2yVMUcJpk7+vbVwtMco6ejh4bPwS3WsGT+EtBVNmuU
 6J2B5ZZs8zKIeuce3OhzUNlkrUWkkDQIAeG9VUGqmI8XeHGo7Yc1r0krxjsXS76t6O
 +YC/09TThM5RB9bvFUMWUEIBwulheuxWq28rScvcd4LJHWuW9lIi7lnUIkKEPAy5WU
 E28JPZCbkaifF3zDXpic37OspNGpcYQDbFUmpZew6gHreDEYzig2PG+IsXWX1EdeNi
 96QcwafT8JscdGXhBDwmmWx+4ikUOhs9GF3tjMuun07RnqZNbOCvoP7x9Vwn1F6xpy
 nCO62yCclLruw==
From: Robert Foss <rfoss@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20230810063229.597533-1-alexander.stein@ew.tq-group.com>
References: <20230810063229.597533-1-alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH 1/1] drm/bridge: lvds-codec: Implement
 atomic_get_input_bus_fmts for LVDS encoder
Message-Id: <169175946799.299738.6869346167471033796.b4-ty@kernel.org>
Date: Fri, 11 Aug 2023 15:11:07 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.10.1
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 10 Aug 2023 08:32:29 +0200, Alexander Stein wrote:
> atomic_get_input_bus_fmts is only implemented for LVDS decoders, resulting
> that LVDS encoders only support bus format MEDIA_BUS_FMT_FIXED. This
> results in warnings like:
> mxsfb 21c8000.lcdif: Bridge does not provide bus format, assuming
>  MEDIA_BUS_FMT_RGB888_1X24.
> Please fix bridge driver by handling atomic_get_input_bus_fmts.
> 
> [...]

Applied, thanks!

[1/1] drm/bridge: lvds-codec: Implement atomic_get_input_bus_fmts for LVDS encoder
      https://cgit.freedesktop.org/drm/drm-misc/commit/?id=b31f784ffff9



Rob

