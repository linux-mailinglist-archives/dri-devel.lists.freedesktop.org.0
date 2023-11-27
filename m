Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6837FA106
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 14:27:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C6C910E29E;
	Mon, 27 Nov 2023 13:27:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AF1910E29E
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 13:27:26 +0000 (UTC)
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 6D4BD6605835;
 Mon, 27 Nov 2023 13:27:23 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1701091645;
 bh=DvdTt/2joGjmSG0un+grPJz1gQ9C99woeiwQLvx7PIk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ace0jcUMaaLGzfJzHjPcsPWpVDpK61lQJqlhON6SE7GegzdsUn9vpO+Z9u1MI5rId
 1vtulJdlAyIsPGpiW5q+PnkJmR3phB4bqhdb8wLz5wO8XRfckZFk76iONud5D2ea2c
 JCRrx87PpeqCgmT+bMDxeKGUb5XwZIRnf7/z8otHa8CuxabDO+HxOWIPdpbKCqazo1
 1pOmwdm9ZayP4qnNV1RDPygEGag9iiiYiqXbOVwFna0+KNmlE1odL4/4gVKrH2vdvP
 zNZv5Try393NNMHGSByfDITJbKle6eCPibneDaIPvIn3HMTCsvJIeTdPE+9VHcIbIF
 wCZ1f0J5ctnuA==
Message-ID: <18516d3d-f866-41de-9045-ed9b4da94697@collabora.com>
Date: Mon, 27 Nov 2023 14:27:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: mediatek: mt8195: add DSI and MIPI DPHY
 nodes
Content-Language: en-US
To: Michael Walle <mwalle@kernel.org>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jitao Shi
 <jitao.shi@mediatek.com>, Xinlei Lee <xinlei.lee@mediatek.com>
References: <20231123133749.2030661-1-mwalle@kernel.org>
 <20231123133749.2030661-4-mwalle@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231123133749.2030661-4-mwalle@kernel.org>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 23/11/23 14:37, Michael Walle ha scritto:
> Add the two DSI controller node and the associated DPHY nodes.
> Individual boards have to enable them in the board device tree.
> 
> Signed-off-by: Michael Walle <mwalle@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

