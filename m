Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5545779120F
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 09:26:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02B8610E2B0;
	Mon,  4 Sep 2023 07:26:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 332F510E2B0
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 07:26:41 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CBA8C610A3;
 Mon,  4 Sep 2023 07:26:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7B0FC433C9;
 Mon,  4 Sep 2023 07:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693812400;
 bh=TK/g9IrkzPkkAcV6FElhzmHbKGYaCADVqU9+CJcXZk4=;
 h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
 b=pNsyZ71stYVLxfBQF9caE0HKtIdipki6yLoTXtXT7Mw66Om7axxGm5VjWI64q1ic0
 BL0WmraWAgTV/evN2xhFkHe0DT0ZMNxsEvVeKMPD9y20e4wGXY/hqHW2Xdvvdn7//Y
 Oa6Vw6iekiTR8FreOvwWyKUjrck5XMkUdjJDNv15v5iyE8n+2vRsIgD2k9heQlN7N1
 lqIBr33003+RTMR/Vzfr6jUCKTqzRFAFU4etB5MmaSugFSB2w5E/IR/Y2OeEt1Hfxp
 q5GztYLOVWeENy40wkhc9Q7176bQh4UxWjMqZmakUEUTAcQJJTbbcvoTfskX3fqtH3
 yBMi8VHBOn/rA==
Message-ID: <7d3f5701bc09acf2830395ad3b86cd0e.mripard@kernel.org>
Date: Mon, 04 Sep 2023 07:26:36 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Douglas Anderson" <dianders@chromium.org>
Subject: Re: [RFT PATCH 04/15] drm/kmb: Call drm_atomic_helper_shutdown() at
 shutdown time
In-Reply-To: <20230901164111.RFT.4.I20cb02bafa7c2368e4bd579df0716eb62a3a21bf@changeid>
References: <20230901164111.RFT.4.I20cb02bafa7c2368e4bd579df0716eb62a3a21bf@changeid>
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
Cc: edmund.j.dea@intel.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maxime
 Ripard <mripard@kernel.org>, anitha.chrisanthus@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 1 Sep 2023 16:41:15 -0700, Douglas Anderson wrote:
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
