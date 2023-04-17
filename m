Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC336E414C
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 09:39:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BD5910E285;
	Mon, 17 Apr 2023 07:39:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34B3410E285
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 07:39:03 +0000 (UTC)
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown
 [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 291FA6602F91;
 Mon, 17 Apr 2023 08:39:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1681717141;
 bh=EiNOtPE+lhG3aPoSAyOgtZ67mh+dWMxFs/Uq9B0YnJ8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=lU0itS7YxkQVm5YQFoUgsqWn6Vd06iFLiHynBxqblggbo2MEPzBT9spA2Zqfk4UFJ
 Cbn6jnVbdcE6SP9XuzTJUpIa+a26j8PNE5v1HgXyYTB7WakjfRLirje5oUn7+TtKnd
 bLcSHcZvINymW6HM5iAOoi/D+yz/GJAGpB4jOX8Zjk4TD0ZZ2renr3eNnM2c+Al26Z
 eoq+f8VLGcbey/5VL4MV2Tbg+sprTWOj8W89BZyma/PlYpbTWa/J1mV/8LqvmAAXVV
 9ekNPLBtSrrSH9BW4YLhf3RIVVkMKjoBceZ393ExGtxsz1AYo0+QFBRYctCQPodwsw
 Wea+5pJxYXv8A==
Message-ID: <447c1e8a-b3cd-0515-3998-edf3d2f5d476@collabora.com>
Date: Mon, 17 Apr 2023 09:38:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] phy: mediatek: fix returning garbage
To: Tom Rix <trix@redhat.com>, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, chunfeng.yun@mediatek.com, vkoul@kernel.org,
 kishon@kernel.org, matthias.bgg@gmail.com, nathan@kernel.org,
 ndesaulniers@google.com, granquet@baylibre.com
References: <20230414122253.3171524-1-trix@redhat.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230414122253.3171524-1-trix@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 14/04/23 14:22, Tom Rix ha scritto:
> clang reports
> drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c:298:6: error: variable
>    'ret' is uninitialized when used here [-Werror,-Wuninitialized]
>          if (ret)
>              ^~~
> ret should have been set by the preceding call to mtk_hdmi_pll_set_hw.
> 
> Fixes: 45810d486bb4 ("phy: mediatek: add support for phy-mtk-hdmi-mt8195")
> Signed-off-by: Tom Rix <trix@redhat.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


