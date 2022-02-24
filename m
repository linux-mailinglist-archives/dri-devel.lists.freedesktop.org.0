Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB394C22AF
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 04:52:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C34610E1A5;
	Thu, 24 Feb 2022 03:52:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D13210E5CB
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 03:52:00 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id p19so1385808ybc.6
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 19:52:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=C3V/dtxV15Mn7k63x16wvKI7YuLTRLAtDoW+UZHVNSQ=;
 b=JpTyQ9fwmnCkQTdb4pTZ4OG7pAZVm7gwL2969nPUypAx3k22so+gM3I0W2ci/jvCA5
 BDPZMmcHgO3YLsB+3wl8ORdfR8CU0QCz0p728ige4gFTPcamGc/2PpHz7ciUiyqBI3Tu
 X9cjP50jWu0UKjTUkHmEzjal1OhvJNpAH3BzU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=C3V/dtxV15Mn7k63x16wvKI7YuLTRLAtDoW+UZHVNSQ=;
 b=HihhBj4xJreVupTBotSoc97QNv4ARaAFsnz+IwiW2lLzeDACIxZ1d4aRSzIyUKWAB5
 XkqrpOs1MjCx7OdRMcbQk5vqIUopsr8TkheaBS2WhRlm0bmlNN2S+tVpGrTG0QDgB7mF
 s6UWZao7xrT4F5j9rxMeiIvR69EBW10a6A1sjRbOlqSD16h8wEGcFLPowqUqifYpm5vx
 BUmWcJan/dL9rYxeFPbqxwqh8AW13L3Sj85mrpnCEsvd2/KfiesJOQKRvc40IDC55q6t
 6U/m1MH6+bnTc0C8Y9iWTBebiHHLhTzHP0nA2Fvn9gZ/i2oMLVEXjWftQAgqSkP5KKrn
 Gxxw==
X-Gm-Message-State: AOAM533BwU4oT1HtJaqpYXE55U9E0oaJ+8QCeKP7QraVf2JsybF5xeaP
 z135Qj/9EcOPweGJEJ0p4CKTZy4ienL7uYF776Gd9g==
X-Google-Smtp-Source: ABdhPJyiaPY/OEbo9lDvhKxowTvqVlkhYSSAXktn3qviviBrH2qstZAw3K9LBrLE61G6q3rwWoSQxKBMDVgyXk0nark=
X-Received: by 2002:a25:a486:0:b0:61d:a523:acd0 with SMTP id
 g6-20020a25a486000000b0061da523acd0mr753461ybi.203.1645674719716; Wed, 23 Feb
 2022 19:51:59 -0800 (PST)
MIME-Version: 1.0
References: <20220201174643.843102-1-nfraprado@collabora.com>
In-Reply-To: <20220201174643.843102-1-nfraprado@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 24 Feb 2022 11:51:48 +0800
Message-ID: <CAGXv+5HbBroWkR4gLA2EXOcki4wgZ6XahO1J-VOctgKX5K9k7w@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: mt8183: jacuzzi: Fix bus properties in
 anx's DSI endpoint
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, kernel@collabora.com,
 Xin Ji <xji@analogixsemi.com>, linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

(CC-ed DRM bridge maintainers and the dri-devel ML)

On Wed, Feb 2, 2022 at 1:47 AM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> mt8183-kukui-jacuzzi has an anx7625 bridge connected to the output of
> its DSI host. However, after commit fd0310b6fe7d ("drm/bridge: anx7625:
> add MIPI DPI input feature"), a bus-type property started being required
> in the endpoint node by the driver to indicate whether it is DSI or DPI.
>
> Add the missing bus-type property and set it to 5
> (V4L2_FWNODE_BUS_TYPE_PARALLEL) so that the driver has its input
> configured to DSI and the display pipeline can probe correctly.

Don't people find it odd that this is setting the bus-type to "parallel"
(5) for the device to use DSI? Instead of "MIPI CSI-2 D-PHY" (4) or even
"MIPI CSI-2 C-PHY" (1) which is specified in the binding? It's completely
backwards.

Would it be possible to fix the binding and driver at this point?


Thanks
ChenYu

> While at it, also set the data-lanes property that was also introduced
> in that same commit, so that we don't rely on the default value.
>
> Fixes: fd0310b6fe7d ("drm/bridge: anx7625: add MIPI DPI input feature")
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
>
> ---
> v1: https://lore.kernel.org/all/20220120224204.773117-1-nfraprado@collabo=
ra.com
>
> Changes in v2:
> - (thanks Rob) Use proper format when refering to commit in commit
>   message as pointed out by checkpatch
>
>  arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi b/arc=
h/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> index 8f7bf33f607d..e8f133dc96b9 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> @@ -171,6 +171,8 @@ port@0 {
>
>                         anx7625_in: endpoint {
>                                 remote-endpoint =3D <&dsi_out>;
> +                               bus-type =3D <5>;
> +                               data-lanes =3D <0 1 2 3>;
>                         };
>                 };
>
> --
> 2.35.1
>
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
