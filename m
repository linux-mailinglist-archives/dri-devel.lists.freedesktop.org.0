Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ABEF4D03DC
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 17:17:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F134510E071;
	Mon,  7 Mar 2022 16:17:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A889910E071
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Mar 2022 16:17:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EF8D2B81606;
 Mon,  7 Mar 2022 16:17:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 199FBC340EB;
 Mon,  7 Mar 2022 16:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1646669826;
 bh=g7AkI7UmXjqtWe/0nY3r8R1FTcT6BYIuEgvHT7ed2UA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jS6bdkyhDdnlOXciwJ71UjeRz7uCXsBTwcyBL4m2+vLZ4ALa4/pak7K4FPM7Wq219
 lKJ1PnYnJxd53MhCWcP+teEm8/DLCWSx7H1oI0yMOWDo62iVT81CcVJ1EaU8c6aPI2
 VPUBC8hpzXR4POlmZbTWFnkFWCGWBcJIAsDqhphs=
Date: Mon, 7 Mar 2022 17:17:03 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Subject: Re: [PATCH 5.15 000/262] 5.15.27-rc1 review
Message-ID: <YiYv/4EIrx4AV6wi@kroah.com>
References: <20220307091702.378509770@linuxfoundation.org>
 <CA+G9fYtXE1TvxtXZPw++ZkGAUZ4f1rD1tBkMsDb33jsm-C1OZw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYtXE1TvxtXZPw++ZkGAUZ4f1rD1tBkMsDb33jsm-C1OZw@mail.gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, Catalin Marinas <catalin.marinas@arm.com>,
 dri-devel@lists.freedesktop.org, patches@kernelci.org,
 Hou Tao <houtao1@huawei.com>, Tiezhu Yang <yangtiezhu@loongson.cn>,
 shuah@kernel.org, Christoph Hellwig <hch@lst.de>, f.fainelli@gmail.com,
 Will Deacon <will@kernel.org>, jonathanh@nvidia.com, linux@roeck-us.net,
 slade@sladewatkins.com,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 lkft-triage@lists.linaro.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Netdev <netdev@vger.kernel.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, pavel@denx.de, akpm@linux-foundation.org,
 torvalds@linux-foundation.org, sudipm.mukherjee@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 07, 2022 at 06:30:18PM +0530, Naresh Kamboju wrote:
> drivers/gpu/drm/mediatek/mtk_dsi.c: In function 'mtk_dsi_host_attach':
> drivers/gpu/drm/mediatek/mtk_dsi.c:858:28: error: implicit declaration
> of function 'devm_drm_of_get_bridge'; did you mean
> 'devm_drm_panel_bridge_add'? [-Werror=implicit-function-declaration]
>   858 |         dsi->next_bridge = devm_drm_of_get_bridge(dev,
> dev->of_node, 0, 0);
>       |                            ^~~~~~~~~~~~~~~~~~~~~~
>       |                            devm_drm_panel_bridge_add
> drivers/gpu/drm/mediatek/mtk_dsi.c:858:26: warning: assignment to
> 'struct drm_bridge *' from 'int' makes pointer from integer without a
> cast [-Wint-conversion]
>   858 |         dsi->next_bridge = devm_drm_of_get_bridge(dev,
> dev->of_node, 0, 0);
>       |                          ^
> cc1: some warnings being treated as errors

Offending commit now dropped, thanks.


greg k-h
