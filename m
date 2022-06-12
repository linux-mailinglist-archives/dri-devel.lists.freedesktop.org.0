Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66496547A62
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jun 2022 15:39:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 821AF10E3A3;
	Sun, 12 Jun 2022 13:39:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay4-1.pub.mailoutpod1-cph3.one.com
 (mailrelay4-1.pub.mailoutpod1-cph3.one.com [46.30.210.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18E4610E3A3
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jun 2022 13:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=eAJJGHIbdHkWSaDmIQWC3bS7RO5oK3AFRovh0PE9eng=;
 b=kLudzk1Gb/xZVB7ssF4sr/L+LJzy2bYDE46CG0yVRNZh7p6G6Xs3lAJlUfYJ/vG8OyrOsP5BTHAii
 Vli5MWG9yGaMJu7yzakodq8dDhplHCFuMXza+74dgwCqrnz33IojAzHBf961rmlSd5C2rkBoyNSQkQ
 1caXJjfUGJIIifitGuZER1NVlN08KyY4fnao9ZT5MOeatWKD2Fmq6odD5eJgyDlLGM9iREzgdhMqwQ
 eptQzt5BTq/uO4kUf6Zn9uEOKekbMLgl82mRjWTJMHW4INqAqb3mNq+Bs8OVIL8a13AMqPhxVLMJcD
 Ze/IGby2TUKS93/L4Jt5yFs/TBDu2aA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=eAJJGHIbdHkWSaDmIQWC3bS7RO5oK3AFRovh0PE9eng=;
 b=l1VJcPipoMr1WWa6mB6d35E2+PSMsFfvRSg4Dm35vQIPgcJ5SV1vTaji0d7xFrzWl0xdYdERB5ac+
 eT9qpfdCA==
X-HalOne-Cookie: df97afa6bf7bf79992ef46d629351bb85d6b2494
X-HalOne-ID: 157a32e2-ea55-11ec-8231-d0431ea8bb10
Received: from mailproxy4.cst.dirpod4-cph3.one.com
 (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
 by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 157a32e2-ea55-11ec-8231-d0431ea8bb10;
 Sun, 12 Jun 2022 13:39:29 +0000 (UTC)
Date: Sun, 12 Jun 2022 15:39:28 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 1/3] drm: of: Mark empty drm_of_get_data_lanes_count and
 drm_of_get_data_lanes_ep static
Message-ID: <YqXskO48hvlqp++c@ravnborg.org>
References: <20220612132152.91052-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220612132152.91052-1-marex@denx.de>
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
Cc: kernel test robot <lkp@intel.com>, Maxime Ripard <maxime@cerno.tech>,
 dri-devel@lists.freedesktop.org, robert.foss@linaro.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jun 12, 2022 at 03:21:50PM +0200, Marek Vasut wrote:
> Mark empty implementations of drm_of_get_data_lanes_count and
> drm_of_get_data_lanes_ep as static inline, just like the rest
> of empty implementations of various functions in drm_of.h .
> Add missing comma to drm_of_get_data_lanes_count_ep() .
> 
> Fixes: fc801750b197 ("drm: of: Add drm_of_get_data_lanes_count and drm_of_get_data_lanes_ep")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> To: dri-devel@lists.freedesktop.org
Acked-by: Sam Ravnborg <sam@ravnborg.org>
