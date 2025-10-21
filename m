Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D670ABF42A8
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 02:43:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2DFE10E548;
	Tue, 21 Oct 2025 00:43:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cEtkjrjS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 421B910E108
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 00:43:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E6CCD43E40;
 Tue, 21 Oct 2025 00:43:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65B00C4CEFB;
 Tue, 21 Oct 2025 00:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761007390;
 bh=4RCzmBSn1YK3dNU1eu6WlsS+oiC3sOWT4kMWZcs60Is=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cEtkjrjSI92wIHZJsTGhCickdT6aybd2B/sEoCNPQBq/fTzMFYu6KnoutQup+d3Ro
 lM5gStw8JWQUxulUM1ObqQoPovLRzmAZd6pDkxLZNOvipZeJs8WuC5drCdqW3pVzlM
 h/BndLLXV6OHUq6iIpQRcM7bJYk9icyWPTB5HiUu6//tb+H7Qb/DdZ+aG3zjCUS/Ty
 PRoWZxS854wCjMVNWDg3mNdhBMvr5w0gjQF3eaI2lbwC9unraJMT4P1SItRyPIjrWH
 8Pxo7LIrp/88tlKL+LQ5d1imWkZr7hsHbzmQNAOzfATefCser5tkqQeUtnFxqAIwLz
 OaSBPwcvab96Q==
Date: Mon, 20 Oct 2025 17:43:08 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Meghana Malladi <m-malladi@ti.com>
Cc: <horms@kernel.org>, <namcao@linutronix.de>, <jacob.e.keller@intel.com>,
 <christian.koenig@amd.com>, <sumit.semwal@linaro.org>, <sdf@fomichev.me>,
 <john.fastabend@gmail.com>, <hawk@kernel.org>, <daniel@iogearbox.net>,
 <ast@kernel.org>, <pabeni@redhat.com>, <edumazet@google.com>,
 <davem@davemloft.net>, <andrew+netdev@lunn.ch>,
 <linaro-mm-sig@lists.linaro.org>, <dri-devel@lists.freedesktop.org>,
 <linux-media@vger.kernel.org>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>, Vignesh Raghavendra
 <vigneshr@ti.com>, Roger Quadros <rogerq@kernel.org>, <danishanwar@ti.com>
Subject: Re: [PATCH net-next v3 0/6] Add AF_XDP zero copy support
Message-ID: <20251020174308.59b87130@kernel.org>
In-Reply-To: <20251014105613.2808674-1-m-malladi@ti.com>
References: <20251014105613.2808674-1-m-malladi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 14 Oct 2025 16:26:06 +0530 Meghana Malladi wrote:
> This series adds AF_XDP zero coppy support to icssg driver.
> 
> Tests were performed on AM64x-EVM with xdpsock application [1].
> 
> A clear improvement is seen Transmit (txonly) and receive (rxdrop)
> for 64 byte packets. 1500 byte test seems to be limited by line
> rate (1G link) so no improvement seen there in packet rate
> 
> Having some issue with l2fwd as the benchmarking numbers show 0
> for 64 byte packets after forwading first batch packets and I am
> currently looking into it.

This series stopped applying, could you please respin?
-- 
pw-bot: cr
