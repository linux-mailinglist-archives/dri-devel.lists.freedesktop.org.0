Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 651966F7FED
	for <lists+dri-devel@lfdr.de>; Fri,  5 May 2023 11:26:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D6C610E1CD;
	Fri,  5 May 2023 09:26:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4318B10E1D2
 for <dri-devel@lists.freedesktop.org>; Fri,  5 May 2023 09:26:21 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6032163CB9;
 Fri,  5 May 2023 09:26:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 114A4C433EF;
 Fri,  5 May 2023 09:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683278779;
 bh=lSshFfSGlyCi4G0qcKJd031Akuz+SfzSDmjiM7FKFpw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IOg+47p2FzSo6WXiYzWJqEGAZiRc5D6cLwe4n8/RYwwLqArfccLCr3x+fGPrUACbM
 3hpfrSknlmvxQ8TbCWGivTgknyEGVepFt3BoUTOMunwrf4qKgnDMf70V+QrS1sQ+H2
 SMu+YNYRppB5GdY27xveXRbuBlZ8qMJ5VMRWsZ5gTzptXjnNZtxvP1hJemO9HaitoD
 X1PMNzX5Aa/VHFFZ/lfZ4zSZSPRIkMf6jnR2TEPiknUoBimmHGg4gwTQVGQC2E3+49
 PbAtnCSUAr/eCbG3nyj12sLa/GqsolUKgeOtcBNkt4TrJGUkKFUsnoJOPTqSdYpoym
 zch1EdXtNONUg==
Date: Fri, 5 May 2023 14:56:15 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH] phy: mediatek: Remove unusued ret and check
Message-ID: <ZFTLt5JJVtbX8HQh@matsya>
References: <20230505001945.10179-1-palmer@rivosinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230505001945.10179-1-palmer@rivosinc.com>
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
Cc: kishon@kernel.org, chunkuang.hu@kernel.org, linux@rivosinc.com,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org, chunfeng.yun@mediatek.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04-05-23, 17:19, Palmer Dabbelt wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
> 
> This trips up a maybe-uninitialized warning, but it's actually just not
> used.

Thanks but this is already fixed by 714dd3c29a22 ("phy: mediatek: hdmi:
mt8195: fix uninitialized variable usage in pll_calc") in phy/next and
should be in Linus's tree shortly

-- 
~Vinod
