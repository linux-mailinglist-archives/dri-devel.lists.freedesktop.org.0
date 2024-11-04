Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 930AD9BB9EA
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2024 17:12:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59F3810E48A;
	Mon,  4 Nov 2024 16:12:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bdwUCbNm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4248610E481
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2024 16:12:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 711435C47B2;
 Mon,  4 Nov 2024 16:11:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D564C4CECE;
 Mon,  4 Nov 2024 16:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1730736759;
 bh=CSI8nmFVeCBUZm3j23aCaLtGEVXGHX7F+EO7hopFI+Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bdwUCbNmHML9PrNRdfy29kUrRCJ+UtUsiVXu0fQDqOvjEDs1MiwEtWWsiE4TNtwCr
 15ttqIq17BRC9+3YTw8CQf1lIqQSb8DpE8Aqd6NFQjCvWdh6tnVjypmIbECUbk5EqU
 Rs+HYZR/snvujBQGJylaQ71jiUH+YmzyUYqQsTU8tzG/jq3jInKe5RrOyUeoI0BRrr
 X+OVVN4KzoshoecdzH9MWUr0wVrs2UhQpRNybBQbQKg6EFVcIJQG0KZrZgsd859jzN
 WQwHpxAZZwXAIcnelk0ZpR10LFHinC8ACu2kJ9+5k8K3burokUgzCmfAdxnBjizLpx
 gTsgy9KArpFbQ==
Date: Mon, 4 Nov 2024 10:12:37 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: thierry.reding@gmail.com, linux-kernel@vger.kernel.org,
 krzk+dt@kernel.org, tzimmermann@suse.de, mchehab@kernel.org,
 mripard@kernel.org, geert+renesas@glider.be, jonas@kwiboo.se,
 nfraprado@collabora.com, jernej.skrabec@gmail.com,
 kernel@pengutronix.de, prabhakar.mahadev-lad.rj@bp.renesas.com,
 quic_jesszhan@quicinc.com, Laurent.pinchart@ideasonboard.com,
 sam@ravnborg.org, arnd@arndb.de, neil.armstrong@linaro.org,
 imx@lists.linux.dev, devicetree@vger.kernel.org,
 dmitry.baryshkov@linaro.org, s.hauer@pengutronix.de,
 tomi.valkeinen@ideasonboard.com, shawnguo@kernel.org,
 simona@ffwll.ch, will@kernel.org, conor+dt@kernel.org,
 marex@denx.de, quic_bjorande@quicinc.com, andrzej.hajda@intel.com,
 catalin.marinas@arm.com, rfoss@kernel.org,
 sakari.ailus@linux.intel.com, airlied@gmail.com,
 maarten.lankhorst@linux.intel.com, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, hverkuil@xs4all.nl,
 biju.das.jz@bp.renesas.com, festevam@gmail.com
Subject: Re: [PATCH v5 08/13] dt-bindings: display: Document dual-link LVDS
 display common properties
Message-ID: <173073675713.309604.179338628102616229.robh@kernel.org>
References: <20241104032806.611890-1-victor.liu@nxp.com>
 <20241104032806.611890-9-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104032806.611890-9-victor.liu@nxp.com>
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


On Mon, 04 Nov 2024 11:28:01 +0800, Liu Ying wrote:
> Dual-link LVDS displays receive odd pixels and even pixels separately from
> dual LVDS links.  One link receives odd pixels and the other receives even
> pixels.  Some of those displays may also use only one LVDS link to receive
> all pixels, being odd and even agnostic.  Document common properties for
> those displays by extending LVDS display common properties defined in
> lvds.yaml.
> 
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v5:
> * Use patternProperties to define port@0 and port@1.  (Biju)
> * Require port@0 or port@1.
> 
> v4:
> * Squash change for advantech,idk-2121wr.yaml and
>   panel-simple-lvds-dual-ports.yaml with lvds-dual-ports.yaml.  (Rob)
> * Improve description in lvds-dual-ports.yaml.  (Krzysztof)
> 
> v3:
> * New patch.  (Dmitry)
> 
>  .../bindings/display/lvds-dual-ports.yaml     | 63 +++++++++++++++++++
>  .../display/panel/advantech,idk-2121wr.yaml   | 14 +----
>  .../panel/panel-simple-lvds-dual-ports.yaml   | 20 +-----
>  3 files changed, 65 insertions(+), 32 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/lvds-dual-ports.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

