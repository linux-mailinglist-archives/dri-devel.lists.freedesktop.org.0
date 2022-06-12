Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDBC547A64
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jun 2022 15:40:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97B5710E37C;
	Sun, 12 Jun 2022 13:40:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod1-cph3.one.com
 (mailrelay2-1.pub.mailoutpod1-cph3.one.com [46.30.210.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C27CD10E37C
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jun 2022 13:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=hZEHWvav1Jepf6UoBHe83To8AOLLh3HtDQwPxjDrqCQ=;
 b=HWCrFzBHyEgvlLfwS1fWc9N473LWEIwbC6Zz/e66o2sPzbb9xmHkvlnsdp6DASAEsollXQEVDuAMk
 NJGGJoGfzXigVfboKJLlNvBSVZ7AIsmY7aZ+dgeqJKdfqYf/CS1sqzUdUkh+sXVXTVRjGOfN09P1r9
 ffvwnEQ3Yaa0ZtQ+JC1iHXnbG19pePeFQ69L12EO02EJYF37AChl7m30ZqXdotsoQXZqTQhwJE6LoK
 30bjw/UWwB45l79Ya6zQJA4RWCvnlZ4jFbZUA1PB0ESpYxhg2cmjyUo0frs7eE2D+2uECHfNa4WVxV
 pyVTTy77BAHioGNlT+j+okXn61Jw9Gw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=hZEHWvav1Jepf6UoBHe83To8AOLLh3HtDQwPxjDrqCQ=;
 b=uaBh08fAnhkP3Urvblu/SAgCjTy3Fkda6dO84gW9wvAy7EghtW1DoBYup2th3Teux4i/qrJGvByis
 EHE1Q1cCQ==
X-HalOne-Cookie: 038efdcf957f36d5af18414c301cc481c7c00896
X-HalOne-ID: 2864f864-ea55-11ec-a912-d0431ea8a290
Received: from mailproxy2.cst.dirpod4-cph3.one.com
 (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
 by mailrelay2.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 2864f864-ea55-11ec-a912-d0431ea8a290;
 Sun, 12 Jun 2022 13:40:01 +0000 (UTC)
Date: Sun, 12 Jun 2022 15:39:59 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 3/3] drm/bridge: rcar: Drop unused variables due to
 drm_of_get_data_lanes_count_ep
Message-ID: <YqXsrwYLde/GPJoq@ravnborg.org>
References: <20220612132152.91052-1-marex@denx.de>
 <20220612132152.91052-3-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220612132152.91052-3-marex@denx.de>
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

On Sun, Jun 12, 2022 at 03:21:52PM +0200, Marek Vasut wrote:
> The rcar_mipi_dsi_parse_dt() now contains two uninitialized variables
> due to conversion to common drm_of_get_data_lanes_count_ep() helper.
> Drop them.
> 
> Fixes: d643daaf1694 ("drm/bridge: rcar: Convert to drm_of_get_data_lanes_count_ep")
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
