Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FAE35B5A2F
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 14:34:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76B0B10E434;
	Mon, 12 Sep 2022 12:33:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65DDE10E434
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Sep 2022 12:33:56 +0000 (UTC)
Received: from pendragon.ideasonboard.com (unknown [89.101.193.67])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 74E8E59D;
 Mon, 12 Sep 2022 14:33:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1662986034;
 bh=OCONmltQ48JY/YT9CDPBBkFazBRp8ZnFJ3hSFJK1fdM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bPVtIkUEjXS4bAh+FpQWcljgMTF8Yu0sGxpznz++6eX4xXaNb0kp+yDCR1m54/oIK
 3LgUXp2+3lZm7yK5+29RSjQ3iZhh1zmaMI1Q2IlYmkGxWufXJupFchAg+OVI9K4fGt
 +ASpBdLYh5up9lRx2MRWvyVd/LjJjOoonXfH7EfQ=
Date: Mon, 12 Sep 2022 15:33:39 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Robert Foss <robert.foss@linaro.org>
Subject: Re: [PATCH v1 0/2] Revert chrontel-ch7033 byteswap order series
Message-ID: <Yx8nI/AMk/Gu8o/J@pendragon.ideasonboard.com>
References: <20220912113856.817188-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220912113856.817188-1-robert.foss@linaro.org>
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
Cc: devicetree@vger.kernel.org, andrzej.hajda@intel.com,
 krzysztof.kozlowski+dt@linaro.org, jonas@kwiboo.se, airlied@linux.ie,
 tzimmermann@suse.de, narmstrong@baylibre.com,
 Chris Morgan <macromorgan@hotmail.com>, dianders@chromium.org,
 jernej.skrabec@gmail.com, linux-kernel@vger.kernel.org, lkundrak@v3.sk,
 robh+dt@kernel.org, dri-devel@lists.freedesktop.org, javierm@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Rob,

On Mon, Sep 12, 2022 at 01:38:54PM +0200, Robert Foss wrote:
> After applying the "chrontel-ch7033: Add byteswap order option" series,
> Laurent reported an issues with the approach. Since no fix has been submitted
> for the issues outlined in time for the next kernel release, I'd like to
> revert this series for now.
> 
> Just to be clear I would very much like to see a v3 of this[1] series, where the
> issues outlined have been fixed.
> 
> [1] https://lore.kernel.org/all/20220902153906.31000-1-macroalpha82@gmail.com/
> 
> Robert Foss (2):
>   Revert "dt-bindings: Add byteswap order to chrontel ch7033"
>   Revert "drm/bridge: ti-sn65dsi86: Implement bridge connector
>     operations for DP"

For the series,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  .../display/bridge/chrontel,ch7033.yaml       | 13 ---------
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c         | 28 -------------------
>  2 files changed, 41 deletions(-)

-- 
Regards,

Laurent Pinchart
