Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D166B31DFB
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 17:17:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86B2B10EB51;
	Fri, 22 Aug 2025 15:17:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aeX8kKa/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 665FC10EB51
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 15:17:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3C0A260203;
 Fri, 22 Aug 2025 15:17:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE912C4CEED;
 Fri, 22 Aug 2025 15:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755875860;
 bh=XdRY7HKsACkQeqSKAyGk2v2Vlf2LTnVd6fqMdVcahtg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aeX8kKa/dZgcRh5rVfaqoe1CC8NN0aLGou2XiuH7yWo6zZoT0QIhl5aMWgudGWbFY
 PPJfl4qu/m+btSrUwCgNWzdEyti9DSk+4yNowmd5ObzKp71SEHpVRe1OG/T15oBtg8
 9AN3tUi+2Dlzatpa4sax+YkIVrb7+SqyD5H2awAnfF1PN1l3gHGmcimjHYyWWl0XLS
 KDwELS31Lh0WKfWDKLUMyqgWU4sIpyzrjgQzSw4ldlERimgWAAjaK0Yyi7mXII7kK2
 bMuRspo3WJffjr3/yeEtypJUPrix/S0g2/97MTyC+C1McOGFXza9L3Cz4L8nB3UHw8
 +rd3s0ZGFUt4Q==
Date: Fri, 22 Aug 2025 10:17:40 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: airlied@gmail.com, matthias.bgg@gmail.com, krzk+dt@kernel.org,
 louisalexis.eyraud@collabora.com, minghsiu.tsai@mediatek.com,
 dmitry.torokhov@gmail.com, support.opensource@diasemi.com,
 linux-kernel@vger.kernel.org, kernel@collabora.com,
 edumazet@google.com, kuba@kernel.org, jeesw@melfas.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-sound@vger.kernel.org, andrew-ct.chen@mediatek.com,
 linux-input@vger.kernel.org, linux-gpio@vger.kernel.org,
 davem@davemloft.net, mripard@kernel.org, ck.hu@mediatek.com,
 maarten.lankhorst@linux.intel.com, linus.walleij@linaro.org,
 yunfei.dong@mediatek.com, houlong.wei@mediatek.com,
 p.zabel@pengutronix.de, linux-clk@vger.kernel.org,
 tzimmermann@suse.de, chunkuang.hu@kernel.org,
 angelogioacchino.delregno@collabora.com, lgirdwood@gmail.com,
 simona@ffwll.ch, linux-mediatek@lists.infradead.org,
 jmassot@collabora.com, linux-arm-kernel@lists.infradead.org,
 conor+dt@kernel.org, netdev@vger.kernel.org, amergnat@baylibre.com,
 broonie@kernel.org, sean.wang@kernel.org,
 linux-media@vger.kernel.org, tiffany.lin@mediatek.com,
 kyrie.wu@mediatek.corp-partner.google.com, pabeni@redhat.com,
 flora.fu@mediatek.com, andrew+netdev@lunn.ch, mchehab@kernel.org
Subject: Re: [PATCH v1 09/14] dt-bindings: pinctrl: mediatek,mt65xx-pinctrl:
 Allow gpio-line-names
Message-ID: <175587585960.3825744.17420648666303158652.robh@kernel.org>
References: <20250820171302.324142-1-ariel.dalessandro@collabora.com>
 <20250820171302.324142-10-ariel.dalessandro@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250820171302.324142-10-ariel.dalessandro@collabora.com>
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


On Wed, 20 Aug 2025 14:12:57 -0300, Ariel D'Alessandro wrote:
> Current, the DT bindings for MediaTek's MT65xx Pin controller is missing
> the gpio-line-names property, add it to the associated schema.
> 
> Signed-off-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> ---
>  .../devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml    | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

