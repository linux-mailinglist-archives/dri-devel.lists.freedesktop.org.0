Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE4148DB4C
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jan 2022 17:08:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17A3910E3C4;
	Thu, 13 Jan 2022 16:08:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B0DB10E3C4
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jan 2022 16:08:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 9CFC71F45F46
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1642090092;
 bh=JMfu4BU6+0yOopVEx4qUzDgVJ/etcVmMV5JMvlOPMX4=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=RCA4CIRbKQVDz6ybVGfGi5nfu9ntyftOi2ZS9uIROEl9t5BCHaDtbUS7GTwxxDtqB
 6BnHLS56PvcK4uoRxysNbjizXpT2lNHowzT5kOU/A1trt15B3aXkXxHZh5P4wQR3I4
 xisbvK60MvRLpVFkycuL1riQm2VQlJKdokWugMdQZKNlUJKz/mGoweE8/bKHEYoKnm
 m4mv3cqNHFCZOTgwDubjBEkq1zQ7ZmxhjEsBj0I0JycE+SDdYhTwv4Jtx2L/lrLweN
 F9svoaJbAjC3oRtSni6nyzWQDZG1IDaRsQ9J+ow9IcsfPbkHr2etViUha4BLjiZi6t
 ov8nutG+rz+Hg==
Subject: Re: [PATCH v11 10/22] soc: mediatek: add mtk-mutex support for mt8195
 vdosys1
To: "Nancy.Lin" <nancy.lin@mediatek.com>, CK Hu <ck.hu@mediatek.com>
References: <20220110084645.31191-1-nancy.lin@mediatek.com>
 <20220110084645.31191-11-nancy.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <64582c90-f307-5918-fb49-94e0beb2cf23@collabora.com>
Date: Thu, 13 Jan 2022 17:08:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220110084645.31191-11-nancy.lin@mediatek.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, srv_heupstream@mediatek.com,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, singo.chang@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Il 10/01/22 09:46, Nancy.Lin ha scritto:
> Add mtk-mutex support for mt8195 vdosys1.
> The vdosys1 path component contains ovl_adaptor, merge5,
> and dp_intf1. Ovl_adaptor is composed of several sub-elements.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


