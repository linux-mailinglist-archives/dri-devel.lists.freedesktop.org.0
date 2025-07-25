Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6AFB1254E
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jul 2025 22:27:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C62310E387;
	Fri, 25 Jul 2025 20:27:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hGN9Hi1i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 993F310E387
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Jul 2025 20:26:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5FBE15C6415;
 Fri, 25 Jul 2025 20:26:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD53CC4CEE7;
 Fri, 25 Jul 2025 20:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753475217;
 bh=gwiksp3J4bGpqvzDaXhOxRpN1GcS86ZmMLM2DmIXBlI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hGN9Hi1imKljswG6X/DBWlkd92MGaNXkl7nCpM96OQLcPyU/TkuYmNgKqvYkbtIVR
 9dckup9w/GKbTvNcPaRj1rQ77iwFaIjwjQJQaekWBHEzdCiBLNfF+qnHajVK1zC8T2
 fEvTe7JTB/wj79CyGw4A/ansr+AR4VppgZXBymyhe5oAQt0Z2tmwxe0DngswssY1h+
 /kyUy6w2NxgYSmTlvqwU4n4bVhYX9RCEZ0BaoTO9ElMI5nyzjj++ig1nJ4q+GO0v9F
 wJwMkqxcH4BdiQte7QQqI9MDqYfQBMxJAWlvaDvqDWvRMUTD3lgPtZMZNoj8a+7PJG
 yUHsU9u7dT27A==
Date: Fri, 25 Jul 2025 15:26:55 -0500
From: Rob Herring <robh@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org, herbert@gondor.apana.org.au,
 davem@davemloft.net, krzk+dt@kernel.org, conor+dt@kernel.org,
 chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, jassisinghbrar@gmail.com,
 mchehab@kernel.org, matthias.bgg@gmail.com,
 chunfeng.yun@mediatek.com, vkoul@kernel.org, kishon@kernel.org,
 sean.wang@kernel.org, linus.walleij@linaro.org, lgirdwood@gmail.com,
 broonie@kernel.org, andersson@kernel.org,
 mathieu.poirier@linaro.org, daniel.lezcano@linaro.org,
 tglx@linutronix.de, atenart@kernel.org, jitao.shi@mediatek.com,
 ck.hu@mediatek.com, houlong.wei@mediatek.com,
 kyrie.wu@mediatek.corp-partner.google.com, andy.teng@mediatek.com,
 tinghan.shen@mediatek.com, jiaxin.yu@mediatek.com,
 shane.chien@mediatek.com, olivia.wen@mediatek.com,
 granquet@baylibre.com, eugen.hristev@linaro.org, arnd@arndb.de,
 sam.shih@mediatek.com, jieyy.yang@mediatek.com,
 frank-w@public-files.de, mwalle@kernel.org, fparent@baylibre.com,
 linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org
Subject: Re: [PATCH 01/38] dt-bindings: display: mediatek: dpi: Allow
 specifying resets
Message-ID: <20250725202655.GA1826181-robh@kernel.org>
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-2-angelogioacchino.delregno@collabora.com>
 <CAGXv+5HTdK8aiUYdtNVhWAvsSNfMPgK6iCqe-Jsb-OBqQBWsBg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGXv+5HTdK8aiUYdtNVhWAvsSNfMPgK6iCqe-Jsb-OBqQBWsBg@mail.gmail.com>
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

On Thu, Jul 24, 2025 at 05:16:21PM +0800, Chen-Yu Tsai wrote:
> On Thu, Jul 24, 2025 at 4:39 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
> >
> > Even though the DPI IP has a reset bit on all MediaTek SoCs, it
> > is optional, and has always been unused until MT8195; specifically:
> > on older SoCs, like MT8173, the reset bit is located in MMSYS, and
> > on newer SoCs, like MT8195, it is located in VDOSYS.
> >
> > For this reason, allow specifying the resets and reset-names on
> > all MediaTek SoCs.
> >
> > Those properties are optional because there are multiple ways to
> > reset this IP and the reset lines in MM/VDO are used only if the
> > IP cannot perform warm-reset.
> >
> > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > ---
> >  .../devicetree/bindings/display/mediatek/mediatek,dpi.yaml | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> > index b659d79393a8..eb4f276e8dc4 100644
> > --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> > +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> > @@ -102,6 +102,13 @@ properties:
> >        - port@0
> >        - port@1
> >
> > +  resets:
> > +    maxItems: 1
> > +
> > +  reset-names:
> > +    items:
> > +      - const: dpi
> > +
> 
> Do we really need the name if there is only one though?

Not really, but if it is already in use then easier to just fix the 
binding than both the binding and dts.

Rob
