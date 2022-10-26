Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF08C60DB09
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 08:16:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01A7910E44B;
	Wed, 26 Oct 2022 06:16:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5144210E44B
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 06:16:02 +0000 (UTC)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi
 [91.154.32.225])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 93F334F8;
 Wed, 26 Oct 2022 08:15:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1666764960;
 bh=ZXopEcCpgH9eAwwp4/DUAyOe27gRPmMK5DaQ4UaceFM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=sfh179/ytkHAXPeEtgIME61E17s1TeKe7J+HRFQfASn9dZEqWVtVtjKaZlNIVSHW6
 A+aEvb3QxuujNAMDEQHgqIKDImJ/lX/dT3oBY3Xm7WpljGNFQN0h9hPxtFHQS0eISk
 +y+D0tZCPLapo3yQRqr4tF+8szZA6HEHD20xh/S0=
Message-ID: <d65d7963-0a37-612b-c953-106548d729ab@ideasonboard.com>
Date: Wed, 26 Oct 2022 09:15:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v8 3/5] drm/bridge: cdns-dsi: Move to drm/bridge/cadence
Content-Language: en-US
To: Rahul T R <r-ravikumar@ti.com>, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
References: <20221021171820.15984-1-r-ravikumar@ti.com>
 <20221021171820.15984-4-r-ravikumar@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20221021171820.15984-4-r-ravikumar@ti.com>
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
Cc: mparab@cadence.com, a-bhatia1@ti.com, jonas@kwiboo.se, airlied@linux.ie,
 jpawar@cadence.com, narmstrong@baylibre.com, linux-kernel@vger.kernel.org,
 jernej.skrabec@gmail.com, vigneshr@ti.com, devicetree@vger.kernel.org,
 robert.foss@linaro.org, andrzej.hajda@intel.com, sjakhade@cadence.com,
 lee.jones@linaro.org, laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 21/10/2022 20:18, Rahul T R wrote:
> Move the cadence dsi bridge under drm/bridge/cadence
> directory, to prepare for adding j721e wrapper
> support
> 
> Signed-off-by: Rahul T R <r-ravikumar@ti.com>
> ---
>   drivers/gpu/drm/bridge/Kconfig                        | 11 -----------
>   drivers/gpu/drm/bridge/Makefile                       |  1 -
>   drivers/gpu/drm/bridge/cadence/Kconfig                | 11 +++++++++++
>   drivers/gpu/drm/bridge/cadence/Makefile               |  2 ++
>   .../bridge/{cdns-dsi.c => cadence/cdns-dsi-core.c}    |  0
>   5 files changed, 13 insertions(+), 12 deletions(-)
>   rename drivers/gpu/drm/bridge/{cdns-dsi.c => cadence/cdns-dsi-core.c} (100%)

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi

