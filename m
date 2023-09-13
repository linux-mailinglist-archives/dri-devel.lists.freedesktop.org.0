Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A74679E871
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 14:58:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8794F10E4B9;
	Wed, 13 Sep 2023 12:58:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B7DD10E4B5
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 12:58:17 +0000 (UTC)
Received: from [192.168.88.20] (91-154-35-171.elisa-laajakaista.fi
 [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9B5C5BEB;
 Wed, 13 Sep 2023 14:56:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1694609804;
 bh=M7dKeNMIT1EMz75IrJ+oFJE2UlePCjaNN7ef/pgxLyg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=dRNsrWFAOavc+qboaBX4mH9+K0nLBzN9++lrDVX/oDuhRmE0I4ZUyvotTi7gWIPe6
 EdYkwgNxzdqd8d9L8auDMb3SvtQpfrr2TwBsBsJg1nOxASG2hbJl7ljSTDqa1aH9QW
 xjtP7tZhcuSC69KZoW6074r7ocS/nmsVOujKz4j8=
Message-ID: <9efde4d8-385d-54da-fb0d-55625d3c4571@ideasonboard.com>
Date: Wed, 13 Sep 2023 15:58:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [RFC PATCH] drm: omapdrm: dsi: add refsel also for omap4
Content-Language: en-US
To: Tony Lindgren <tony@atomide.com>
References: <20230913065911.1551166-1-andreas@kemnade.info>
 <48972ab0-e4ed-11b2-31fb-ad93695a4db1@ideasonboard.com>
 <20230913124828.GL5285@atomide.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230913124828.GL5285@atomide.com>
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
Cc: arnd@arndb.de, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Sebastian Reichel <sre@kernel.org>,
 Andreas Kemnade <andreas@kemnade.info>, laurent.pinchart@ideasonboard.com,
 u.kleine-koenig@pengutronix.de, linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/09/2023 15:48, Tony Lindgren wrote:
> * Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> [230913 12:11]:
>> I'm somewhat sure that the upstream driver used to work on omap4 sdp, which
>> has two DSI panels. But I can't even remember what omap4 version it had.
> 
> I think those were both dsi command mode panels though, not video mode?

Yes, true. If the PLL is totally wrong due to refsel, I'm sure a command 
mode panel would also fail. But it's true that video mode panels are 
more sensitive to the clock rate.

  Tomi

