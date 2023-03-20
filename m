Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A76A6C0D22
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 10:23:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C29810E2A3;
	Mon, 20 Mar 2023 09:23:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7827710E2A3
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 09:23:38 +0000 (UTC)
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id DAECC66015F1;
 Mon, 20 Mar 2023 09:23:35 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1679304216;
 bh=kLvg39Gaq3ED8iaOlpcmqwM+ANaZdEUpeHZ6xeDIhuU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=BM3SozDIU+HOpZ4vQEVxgOpyG3uXs4uOSCEw/s3e5vIlqAogkS0jXUEQcTW8oFysn
 rfD7/qrIwRvJ9qge9FuEvzVcCG3/ebS3Iaw4S377uU0leeDvlecpJUoM2sqX6zwKGo
 p+Q+T6eRn4M96IQunabLTIGGaR59+pMlE0yz8syY9jqbf/R1dtT2HpOpg3VrbsRRCD
 9MLqJ8mcMNcBTZjnxrYg/TY55hEmLSmrP9YhA8hSTT8rhBR1tJvclYQs4GTiuuDmVQ
 FHsc3qTrgdNOP9ZPkgm4A9Zq1he+gpnEeOql80mmuPijVi497gA732e5YEFE2PteTU
 NpV293LM8BMxw==
Message-ID: <7a651e39-aab6-1723-c28f-756756ae74e3@collabora.com>
Date: Mon, 20 Mar 2023 10:23:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [v3, PATCH] drm/mediatek: add dma buffer control for drm plane
 disable
Content-Language: en-US
To: Yongqiang Niu <yongqiang.niu@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, CK Hu <ck.hu@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
References: <20230320030449.5397-1-yongqiang.niu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230320030449.5397-1-yongqiang.niu@mediatek.com>
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
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-mediatek@lists.infradead.org,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 20/03/23 04:04, Yongqiang Niu ha scritto:
> Fixes: 41016fe1028e4 (drm: Rename plane->state variables in atomic update and disable)
> dma buffer release before overlay disable, that will cause
> m4u translation fault warning.
> 
> add dma buffer control flow in mediatek driver:
> get dma buffer when drm plane disable
> put dma buffer when overlay really disable
> 

The Fixes tag currently has wrong format, and it goes here, not at the beginning;
Please fix.

P.S. The right format is:
Fixes: commitid ("commit title")

> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>


Regards,
Angelo

