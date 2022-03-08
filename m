Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BABB4D1967
	for <lists+dri-devel@lfdr.de>; Tue,  8 Mar 2022 14:42:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B272210E48E;
	Tue,  8 Mar 2022 13:42:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0D3010E48E
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Mar 2022 13:42:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 81A161F433C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646746922;
 bh=AUBI82xQKetEKH7Mx6YE728kuNJKmLzt6+6XJDt5Mes=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=LazTXcR5ieNSLqwAi7CvqlhlkxdusS1kLqhWCbbWDNGvDtf73NxW2k32sig2YH7+4
 GLYm8HrYCD6x+iqYT5U9irK2VsD+Y2zqI+EeHsG+K+mnRmgtIxTqcITz/plNDMnKXu
 J0kKsWjXYi8Luy2djuEPVK0xZBMe5vq5Gu33jZZcXUPWLW690Gsfmw7CHvUeK+H81a
 9bkNClUh/ZOb+j4qw0FIjmkpLy8KDYMzznDGN6cbMuRziOyaABvtQHkj4eIo1mdLK+
 saSo8MTM+2oX2+3K0CsB3yB30X5KEolCGxlY0Vi19Jtz4n6BDQywKRgr6t0B4WGT4M
 r1X37uN96bv5Q==
Message-ID: <d6fa28ef-fdbb-2b6c-acaa-4c35bb631ab4@collabora.com>
Date: Tue, 8 Mar 2022 14:41:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [RESEND v13 07/22] soc: mediatek: mmsys: specify 64BIT dependency
 for MTK_MMSYS
Content-Language: en-US
To: "Nancy.Lin" <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, wim@linux-watchdog.org,
 linux@roeck-us.net
References: <20220308093018.24189-1-nancy.lin@mediatek.com>
 <20220308093018.24189-8-nancy.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220308093018.24189-8-nancy.lin@mediatek.com>
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
Cc: devicetree@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, srv_heupstream@mediatek.com,
 David Airlie <airlied@linux.ie>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 singo.chang@mediatek.com, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Nathan Chancellor <nathan@kernel.org>,
 linux-mediatek@lists.infradead.org, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 08/03/22 10:30, Nancy.Lin ha scritto:
> Because mtk-mutex change to use unsigned long mutex module type,
> it should depend 64BIT. This is a preparation for adding support for
> mt8195 vdosys1 mutex.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> ---
>   drivers/soc/mediatek/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
> index fdd8bc08569e..24f792c46444 100644
> --- a/drivers/soc/mediatek/Kconfig
> +++ b/drivers/soc/mediatek/Kconfig
> @@ -68,6 +68,7 @@ config MTK_SCPSYS_PM_DOMAINS
>   config MTK_MMSYS
>   	bool "MediaTek MMSYS Support"
>   	default ARCH_MEDIATEK
> +	depends on 64BIT
>   	depends on HAS_IOMEM
>   	help
>   	  Say yes here to add support for the MediaTek Multimedia

Breaking old platforms is forbidden.

MT2701 and MT7623N are 32-bit ARM SoCs and:
- mt2701 needs mmsys only; but
- mt7623n needs mmsys and mutex.

Besides, this is an easy fix: just change your unsigned long to a fixed size u64.
