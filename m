Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD71AEE82F
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 22:25:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 593F110E4BF;
	Mon, 30 Jun 2025 20:25:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="AanQbKGq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E81A10E08D;
 Mon, 30 Jun 2025 20:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1751315118;
 bh=Wd8iVGImoZ4KGRRGZ13eWDlE5yPes2wVWWgg3oEX5Ic=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AanQbKGq6x5chkKHukUYTWUa5+xgfPTycnCZpb6z2wyDIj79tWqot4YXh9ZXuqIqJ
 GFWb198SWE8r57/NK/uQRNl6/kte5dyNbNFpTbksBc3W3MMcSEplpF7aWF0ix8laxq
 EVDqUaRnYjH9wEWHS2oiQpTVH/6+VdUf9PbHWzZRs7Y9tRqFkFZqPzf9uRD6SroyNN
 fU1hYwbfVQiWTqVQh4GvatwDk42ecfgMF6myQCuv2uXs1QU1PPin/PzdPZJFhpuwgk
 sLPg52hDC/B4sctOhukETQBdeh0wMD1A+t4s4cs1c8cbXeL1iCaEmdarTg2qUfzyRY
 AcmSmyaCwngmw==
Received: from localhost.localdomain (unknown [92.206.120.105])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: gerddie)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id CE3B617E0342;
 Mon, 30 Jun 2025 22:25:17 +0200 (CEST)
From: Gert Wollny <gert.wollny@collabora.com>
To: Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: etnaviv@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/5] drm/etnaviv: Add support for running a PPU flop reset
Date: Mon, 30 Jun 2025 22:26:26 +0200
Message-ID: <20250630202703.13844-1-gert.wollny@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618204400.21808-1-gert.wollny@collabora.com>
References: <20250618204400.21808-1-gert.wollny@collabora.com>
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dear all,

this is the third version of the series to add PPU flop reset. 
Changes w.r.t. the previous version are: 

  * initialize the PPU flop reset data in etnaviv_gpu_init (Lucas)
    - consequently drop the patch to identify GPU earlier 
  * also test feature PIPE_3D when forcing the flop reset (Lucas)
  * move a few defines around and fix formatting in some places

Many thanks for any comments, 
Gert 

[PATCH v3 1/5] drm/etnaviv: Add command stream definitions required
[PATCH v3 2/5] drm/etnaviv: move some functions to a header to be
[PATCH v3 3/5] drm/etnaviv: Add a new function to emit a series of
[PATCH v3 4/5] drm/etnaviv: Add PPU flop reset
[PATCH v3 5/5] drm/etnaviv: Add module parameter to force PPU flop
