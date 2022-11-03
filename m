Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 057FE618A1D
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 22:03:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52AA710E2C6;
	Thu,  3 Nov 2022 21:03:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E99E10E2C6
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Nov 2022 21:03:23 +0000 (UTC)
Received: from notapiano (unknown
 [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 226E06602946;
 Thu,  3 Nov 2022 21:03:19 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1667509401;
 bh=V56w4IKznjfuluhA6fSqo5+nAAWn0dApHy/TY9w79jE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NBDxFm4mr3csQUybIFz6G8NVG3xGYl5esnOpE/eqWpP9gCja7xQavnK4b5gi1XIUc
 7NnK3ZmYRS8LblLRQQnY/MCmj6IT7TBhpaxZO0VOJTZGQYbNZsReicy0HO/YiPVM0f
 BukU7YNF8lWGC4g97/IxrFWtMGj56uH4a+fLrRWddhmjcRrSTeFFiy4IJwUYlbUWaB
 yPIQ/OUvDxt7PCkarmBvnKioNvpgUEXSGanRypyDIr1evtuXZmyZS0urJtkgmB0fkg
 FvA9xFkb3m/2wZ5Nnr1YTYcktbMqqAE3Af66MWebop77thtljgybt5r2ATLu56Z7P/
 f8A+qx4NTc1rw==
Date: Thu, 3 Nov 2022 17:03:15 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: "Nancy.Lin" <nancy.lin@mediatek.com>
Subject: Re: [PATCH v27 2/7] drm/mediatek: add ETHDR support for MT8195
Message-ID: <20221103210315.lm2d3n4uolra44no@notapiano>
References: <20221103032610.9217-1-nancy.lin@mediatek.com>
 <20221103032610.9217-3-nancy.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221103032610.9217-3-nancy.lin@mediatek.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org,
 David Airlie <airlied@linux.ie>, "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 singo.chang@mediatek.com, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Nathan Chancellor <nathan@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, wim@linux-watchdog.org,
 linux@roeck-us.net,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 03, 2022 at 11:26:05AM +0800, Nancy.Lin wrote:
[..]
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_ethdr.h
[..]
> +void mtk_ethdr_unregister_vblank_cb(struct device *dev);
> +void mtk_ethdr_enable_vblank(struct device *dev);
> +void mtk_ethdr_disable_vblank(struct device *dev);
> +#endif
> +

As warned by git when applying the patch, you have an extra new line at the end
here.

Applying: drm/mediatek: add ETHDR support for MT8195
.git/rebase-apply/patch:454: new blank line at EOF.
+
warning: 1 line adds whitespace errors.
