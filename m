Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BF777E71D
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 18:59:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBAA010E391;
	Wed, 16 Aug 2023 16:59:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EC0C10E391
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 16:59:26 +0000 (UTC)
Received: from [192.168.88.20] (91-154-35-171.elisa-laajakaista.fi
 [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 04739223;
 Wed, 16 Aug 2023 18:58:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1692205092;
 bh=qL8j5qkM/ioz7U94Qh0NCq/z7yI3gA+ae9rI0TA7xWE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=eF+yvHtaLVinq2N80Q2GU0vwWOHQbKR7IDYp1h/zC7mAcVop5tIQG7ZlB/Z2khqTk
 Gxw6q8Gw02MJsaYq6UGIdGARBRXhM3uVgkloFCkFlVJ0RA1AQSGBjgrtfnKjojiTK3
 hTxMyy255rAg0KuHK7YM5n2lIUtxHRRC6THdUA8Q=
Message-ID: <7ab235b0-2bac-46a4-7a79-9270768ac3d9@ideasonboard.com>
Date: Wed, 16 Aug 2023 19:59:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 00/12] drm/bridge: tc358768: Fixes and timings
 improvements
Content-Language: en-US
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>,
 Maxim Schwalm <maxim.schwalm@gmail.com>,
 Francesco Dolcini <francesco@dolcini.it>
References: <20230816-tc358768-v2-0-242b9d5f703a@ideasonboard.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230816-tc358768-v2-0-242b9d5f703a@ideasonboard.com>
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
Cc: Thierry Reding <treding@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Aradhya Bhatia <a-bhatia1@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/08/2023 14:25, Tomi Valkeinen wrote:
> This series contains various fixes and cleanups for TC358768. The target
> of this work is to get TC358768 working on Toradex's AM62 based board,
> which has the following display pipeline:
> 
> AM62 DPI -> TC358768 -> LT8912B -> HDMI connector
> 
> The main thing the series does is to improve the DSI HSW, HFP and VSDly
> calculations.
> 
>   Tomi
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
> Changes in v2:
> - Add "drm/tegra: rgb: Parameterize V- and H-sync polarities" so that
>    Tegra can configure the polarities correctly.
> - Add "drm/bridge: tc358768: Default to positive h/v syncs" as we don't
>    (necessarily) have the polarities set in the mode.
> - Drop "drm/bridge: tc358768: Add DRM_BRIDGE_ATTACH_NO_CONNECTOR
>    support" as it's not needed for DRM_BRIDGE_ATTACH_NO_CONNECTOR
>    support.
> - Link to v1: https://lore.kernel.org/r/20230804-tc358768-v1-0-1afd44b7826b@ideasonboard.com

Looks like I forgot to add the reviewed-bys from Peter. Sorry about 
that! Will add to v3.

  Tomi

