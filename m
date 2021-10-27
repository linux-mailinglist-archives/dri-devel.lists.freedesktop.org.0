Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA9B43C812
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 12:50:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFD0C6E880;
	Wed, 27 Oct 2021 10:50:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28A406E880
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 10:50:25 +0000 (UTC)
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi
 [91.158.153.130])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 73D8C596;
 Wed, 27 Oct 2021 12:50:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1635331823;
 bh=zm4Ju6KVTGGgCUZE6E5NbqKgafTnv49emwOdqb/igeM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=t9zvf566p9pZogIQS2Lt1fMmdSavnByjeMOGTLSwgvfWspEjikzuBDFpZ2wIZpL6m
 Abx0rK465ZcFz3ESIHdSawcf2DEr3Z8Tly/A6vtPya4NDNtjP73zt0MQ74WCH5z6pN
 nsMenkNQHS22OS58Y26eZtWdRgTT0b1+ZLUcT6Mo=
Subject: Re: [PATCH v6 5/9] drm/omap: omap_plane: subclass drm_plane_state
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: linux-omap@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, khilman@baylibre.com,
 Benoit Parrot <bparrot@ti.com>
References: <20211018142842.2511200-1-narmstrong@baylibre.com>
 <20211018142842.2511200-6-narmstrong@baylibre.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <2a92e285-e575-2b31-cdbd-4be9245f0339@ideasonboard.com>
Date: Wed, 27 Oct 2021 13:50:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211018142842.2511200-6-narmstrong@baylibre.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/10/2021 17:28, Neil Armstrong wrote:
> From: Benoit Parrot <bparrot@ti.com>
> 
> In preparation to add omap plane state specific extensions we need to
> subclass drm_plane_state and add the relevant helpers.
> 
> The addition of specific extension will be done separately.
> 
> Signed-off-by: Benoit Parrot <bparrot@ti.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>   drivers/gpu/drm/omapdrm/omap_plane.c | 36 +++++++++++++++++++++++++---
>   1 file changed, 33 insertions(+), 3 deletions(-)

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

  Tomi
