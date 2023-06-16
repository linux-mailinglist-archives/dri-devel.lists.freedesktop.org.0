Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51EE2733919
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 21:04:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C8EA89518;
	Fri, 16 Jun 2023 19:04:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay6-1.pub.mailoutpod2-cph3.one.com
 (mailrelay6-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:405::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBBBF89518
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jun 2023 19:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=slpsFTuuJfhzqfZVJwsx2EY8rIjp1QtGDSmTxcUXcuY=;
 b=qwT/57LkcSiu54Zr7gtGBRxEZngK3TYjJ9n9+7DVLYV6TFGhNeVl3ArLPsm1ep+ndJp3fgZIQ4mvY
 7cQdVV1cD9IXHvl4nK3va2wqOv5+xzTnma001FFhbBghMOPcb1ERQId3js0lNe3nGhJO//+Nwa3fIK
 2ml+yLIBNVSEdgfitg+FdyRadF1uN1jRvQJNPTIudtjt5G7IGrRY/X8oOKoJGq1GHrEFZzIWi62MPk
 KYlsbizxW/tZoPgKPV3fr56rcyrlCyLrCnNdATONQNVi1vi5MmUou8KDhT61TdElPdOC+44NoBx3JW
 3xsbQEQenZNrjsVyb7h6ywFbtzZx0og==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=slpsFTuuJfhzqfZVJwsx2EY8rIjp1QtGDSmTxcUXcuY=;
 b=w2xD5JbCkAUq97hv0VYkSRhN3uayRSgBgF25HMTZ3NYOg2WEIYlMmzTR8jzEJUFFnMN7g1oYPsAg6
 rOpcVMWBw==
X-HalOne-ID: 929be1da-0c78-11ee-a891-6f01c1d0a443
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay6 (Halon) with ESMTPSA
 id 929be1da-0c78-11ee-a891-6f01c1d0a443;
 Fri, 16 Jun 2023 19:04:10 +0000 (UTC)
Date: Fri, 16 Jun 2023 21:04:09 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 4/5] drm/bridge: tc358762: Guess the meaning of LCDCTRL
 bits
Message-ID: <20230616190409.GI1697490@ravnborg.org>
References: <20230615201902.566182-1-marex@denx.de>
 <20230615201902.566182-4-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230615201902.566182-4-marex@denx.de>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 15, 2023 at 10:19:01PM +0200, Marek Vasut wrote:
> The register content and behavior is very similar to TC358764 VP_CTRL.
> All the bits except for unknown bit 6 also seem to match, even though
> the datasheet is just not available. Add a comment and reuse the bit
> definitions.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
