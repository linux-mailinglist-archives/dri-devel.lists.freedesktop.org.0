Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC06E780C40
	for <lists+dri-devel@lfdr.de>; Fri, 18 Aug 2023 15:07:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAD4210E0AD;
	Fri, 18 Aug 2023 13:07:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2775510E0AD
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Aug 2023 13:07:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5621E240008;
 Fri, 18 Aug 2023 13:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1692364049;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SgWmG66tweyk6BVD1n2nSVGkr9i51MiHVZ8BvH7oGeQ=;
 b=ctVB/zN3MLCt65XMQ1SShOaH7O8BrJJFpyH64L4qOmGN9bkMzUCZiGmJKqcQkPEIHVqzq8
 1LQlgJCL8rqspAKNq/lhAm2+6kfyVwIOknoNTYT3d9FnQTlf74+eCiaw41xtlKo4lBkIGQ
 c47RiU+hOadZM1C5PBAf5oG/Pq0Zjy84i4A1aIBiy9j/YaZ7TUeUiSi9E/G0p2iq1K08Q/
 hpti8crmBS9Fe/mZlsfXT4azN4dw0HQmBowOZhDEmzvFp2uvbe7h8dGe5MfZ0MZVm3NOJ7
 XycOx5fSKHukjsnmXr1bzTkBmkDDuP45SGtwzIYe99/bpBqmKkqZ4OFjfKRozw==
Date: Fri, 18 Aug 2023 15:07:25 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH v2 2/4] drm/bridge: imx: add bridge wrapper driver for
 i.MX8MP DWC HDMI
Message-ID: <20230818150725.64d8d54b@booty>
In-Reply-To: <20221216210742.3233382-2-l.stach@pengutronix.de>
References: <20221216210742.3233382-1-l.stach@pengutronix.de>
 <20221216210742.3233382-2-l.stach@pengutronix.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: luca.ceresoli@bootlin.com
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Liu Ying <victor.liu@nxp.com>,
 dri-devel@lists.freedesktop.org, patchwork-lst@pengutronix.de,
 Andrzej Hajda <andrzej.hajda@intel.com>, Rob Herring <robh+dt@kernel.org>,
 Robert Foss <robert.foss@linaro.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Lucas,

On Fri, 16 Dec 2022 22:07:40 +0100
Lucas Stach <l.stach@pengutronix.de> wrote:

> Add a simple wrapper driver for the DWC HDMI bridge driver that
> implements the few bits that are necessary to abstract the i.MX8MP
> SoC integration.
> 
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Tested-by: Marek Vasut <marex@denx.de>

I realized I had sent my Tested-by to v1 when v2 was already out. So,
in case you still need some encouragement for keeping on with this
series:

[Tested on a custom board using modetest on v6.5-rc6]
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
