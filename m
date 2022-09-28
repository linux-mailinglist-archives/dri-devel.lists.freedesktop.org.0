Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 385905EDEB3
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 16:23:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA43B10E578;
	Wed, 28 Sep 2022 14:22:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20B0810E578
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 14:22:47 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id dv25so27413604ejb.12
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 07:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=WGcuGfkA0NNROaRfJ7RegLwzZPlW3SABFiduRXSBKF0=;
 b=ihxwsYc23t+RIPEj9ErW4RTMh/idLnefTnL5RE3Yp0QEI2poOaZ0NjHNTztTXBCs9H
 EgfbWFYvsJ9EZyVVIfCZ5ZG5/y0wFDSxsMjSvwJlJHnLHfwezvz7t9xs5i66D5gWbUHm
 z/5HTwCM6QbNfGK503ZkGk9iuBP9+BjASLeXvEUpYdzUqsrdGSrIc80YQshx7Sxhx4x6
 b1o2WaiZP7aVGXvz+AIEoSCKsIL8p/yAH01OzWw+Cm/P3POjP1wxhApxrsNjztgLoMF3
 5xhhRvMvgMBrHgv0bO3pOfaXtQI6IBke9biCWyKJNsAbYjEC3c+QR7Yq4rq4x0I66N14
 Ip9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=WGcuGfkA0NNROaRfJ7RegLwzZPlW3SABFiduRXSBKF0=;
 b=Cosf5IbayKcrfNHcuHWcXQvXsca2Es0QoUz4Vqt5VFyViH6R7/tV7JQ6oLKOgTZg7s
 CrR/pmuCK1eMlYxUrv0YaqiWU4pRGjebURZ36sgJGef6mlMMpj05a1ndmcUsN7XFy4zp
 LHVYDrEoH2VvOrgTZ4Uv7o1GkTO3uk+WGM8XyPs2UiSWAwwyq+8J/w9T+93nJN3XSx3J
 kXKK9hU+l50ckj5z/j/pO1s7nAHrDju3wLN54NPTbyffD1xJ+hcQeP4XHx8pGEBx+8TA
 AzC1ub+umkuRNdIG1/mxDkg9IzD9hk7wJmerLZ7+ao9o+rgBpJT4aOnjR94oGdpNQJKD
 0fjw==
X-Gm-Message-State: ACrzQf07HPYTDiXzk2BHyzm8eWi+SMZAz06mHDH15V0oq+SPUj2q/I4c
 PFA5eH8P2TvXMzEA6q8T/K7LbZeLvZ4PnEfSitymlQ==
X-Google-Smtp-Source: AMsMyM7SALhgOzAjbIZo1w1hmRcT7YJOAI6uYBsKyg2LUP0qzO21ocvpCKgqsEX0jKpE40cTUXKhDcGECF2kx66wlmg=
X-Received: by 2002:a17:906:730e:b0:783:87a1:b5db with SMTP id
 di14-20020a170906730e00b0078387a1b5dbmr13751710ejc.383.1664374965417; Wed, 28
 Sep 2022 07:22:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220922124306.34729-1-dev@pschenker.ch>
In-Reply-To: <20220922124306.34729-1-dev@pschenker.ch>
From: Robert Foss <robert.foss@linaro.org>
Date: Wed, 28 Sep 2022 16:22:34 +0200
Message-ID: <CAG3jFyuziotbv4F0EaKbrgOqbXZ1fDSi_T=CB2AufyjrUMqmRA@mail.gmail.com>
Subject: Re: [PATCH 0/4] drm/bridge: lt8912b: Fix corrupt display output due
 to wrong bridge config
To: Philippe Schenker <dev@pschenker.ch>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Adrien Grassein <adrien.grassein@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 22 Sept 2022 at 14:43, Philippe Schenker <dev@pschenker.ch> wrote:
>
> From: Philippe Schenker <philippe.schenker@toradex.com>
>
> This patch-set fixes the lt8912b driver that currently does not take
> care whether or not the attached display has postiive or negative syncs
> and or reports on EDID if it needs HDMI mode or DVI.
>
> This series addresses also an issue where the LVDS startup sequence was
> written to the wrong I2C address (the lt8912 has three). This caused
> writing into reserved registers and causing an unstable HDMI picture
> that manifests itself only sometimes and depending on the monitor with a
> flickering and a repeating of going black and coming up again. While at
> it move also some sensible comments to the sequence.
>
>
> Francesco Dolcini (2):
>   drm/bridge: lt8912b: fix corrupted image output
>   drm/bridge: lt8912b: clarify lvds output status
>
> Philippe Schenker (2):
>   drm/bridge: lt8912b: add vsync hsync
>   drm/bridge: lt8912b: set hdmi or dvi mode
>
>  drivers/gpu/drm/bridge/lontium-lt8912b.c | 39 +++++++++++++++++-------
>  1 file changed, 28 insertions(+), 11 deletions(-)
>
> --
> 2.37.3
>

Thanks for the series & the reviews.

Applied to drm-misc-next.
