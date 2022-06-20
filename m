Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFE4551513
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 12:02:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08CB1113104;
	Mon, 20 Jun 2022 10:02:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDFAE113104
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 10:02:17 +0000 (UTC)
Received: from [192.168.1.111] (91-158-154-79.elisa-laajakaista.fi
 [91.158.154.79])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 24368883;
 Mon, 20 Jun 2022 12:02:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1655719335;
 bh=60p2CqtNr66jvuLK0BdcB2OQbzGSe2KUrAuZHRtXCrA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=bz5j/Es+f5ML3hisYSfAifn6RTIxoh9WZW6FEDR0mCI5tqN2MJ9IP1xofsmbRbLpT
 VjYHLIZkKEVlByPil2uF9Q0rgZ4yfQO2zdgh/BdoTWycphhicLjRS90cKKBcYdQfvZ
 3srldnsIg7uMfTSGqzf9tsv0dL1sJrqlq2chh2Go=
Message-ID: <042c77d5-7db1-fa09-4be4-74dbfa85b5e2@ideasonboard.com>
Date: Mon, 20 Jun 2022 13:02:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2] drm/bridge: cdns-dsi: Add support for J721E wrapper
Content-Language: en-US
To: Rahul T R <r-ravikumar@ti.com>, dri-devel@lists.freedesktop.org
References: <20220619140158.30881-1-r-ravikumar@ti.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20220619140158.30881-1-r-ravikumar@ti.com>
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
 jernej.skrabec@gmail.com, robert.foss@linaro.org, andrzej.hajda@intel.com,
 sjakhade@cadence.com, laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 19/06/2022 17:01, Rahul T R wrote:
> Add support for wrapper settings for DSI bridge on
> j721e. Also set the DPI input to DPI0
> 
> Signed-off-by: Rahul T R <r-ravikumar@ti.com>
> ---

Nack... This wouldn't work with some other SoC using CDNS DSI.

See cdns-mhdp8546 for an example of a bit more generic wrapper support.

  Tomi
