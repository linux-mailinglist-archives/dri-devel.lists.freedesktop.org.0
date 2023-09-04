Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E5F791212
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 09:27:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62E2410E2AC;
	Mon,  4 Sep 2023 07:27:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C053110E2AC
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 07:27:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 16715CE0E16;
 Mon,  4 Sep 2023 07:27:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0359CC433C8;
 Mon,  4 Sep 2023 07:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693812436;
 bh=zS+k6SmfaPf7quDUXWLnC5FUAjLDdauLMkbmb5Ev2aY=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=pxeD5oCW/zTniYTuovwvrai8EtpSH9fm8CngPOFps19j4rVRk/8pV+pOeSww/BLtf
 whX4b6l0cDNTwsrEjX8Hh+g5OgrYpGLPZmJ9xr7cXcKPFDwNEw4wY79hd8Y+3LkQid
 urVrQuN8XqfphF5u1o5v8UK+gPJIvY7cZaTrg6O+f1Tg44C9RLhfMrOk/SXkO7kvvT
 mHEbuI35H2yT7tnFy6P/MRaTrr1/3gcSkGG10zACp2sFbVFSgMJ3ZK72tsDT9acu8L
 6UlV9N/Q0cqQ19zTqpSfgBu/4pT6DFYXP6P4Z3a05eSQrueKJjurLWOliC7ajwokLl
 UrTBMNdG7O3LQ==
Message-ID: <060226e5823e782a87c50b68d356e27b.mripard@kernel.org>
Date: Mon, 04 Sep 2023 07:27:13 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Douglas Anderson" <dianders@chromium.org>
Subject: Re: [RFT PATCH 05/15] drm/mediatek: Call
 drm_atomic_helper_shutdown() at shutdown time
In-Reply-To: <20230901164111.RFT.5.I2b014f90afc4729b6ecc7b5ddd1f6dedcea4625b@changeid>
References: <20230901164111.RFT.5.I2b014f90afc4729b6ecc7b5ddd1f6dedcea4625b@changeid>
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
Cc: chunkuang.hu@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, Maxime
 Ripard <mripard@kernel.org>, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 1 Sep 2023 16:41:16 -0700, Douglas Anderson wrote:
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
