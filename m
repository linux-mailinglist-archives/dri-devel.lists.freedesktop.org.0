Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BEB55A1C7
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 21:26:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4940E10F1EC;
	Fri, 24 Jun 2022 19:26:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod1-cph3.one.com
 (mailrelay3-1.pub.mailoutpod1-cph3.one.com [46.30.210.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7463510F1EC
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 19:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=N4LqqSh7dJuYwGG9L2JN3NhWlzBEDsaF865TXVNORE8=;
 b=BqqQWoJAoSFuQpUVMeR4zQpk1kOAZdKeMDnHOcU4ecsNAIbk7EBdpEXJmozVWar6mxruE+8PgLvKw
 fJxY0x5XK1sG8oQupOu8ae/RXkbKcBXIac91O8lZqAf23UHggA1uRIgiypQUY7KENu9B3GRk/u7O1e
 zCNWJiuxTl41Le8wMdThA4B+A4WsSdp32Rmh9wApjdrHek/TTyQvhDpCFBILLLpoi9bZA/FeH4df6z
 ticUehwMWwqPATDI6DjBEGPitDsqtgNnhjtfbX9k4SLWp+1kBLO0Pmtp67bJ/3v+KSjW3K+XnsRivn
 aa1ptAmJeuOL1RjV19K1rOoePCCS+HQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=N4LqqSh7dJuYwGG9L2JN3NhWlzBEDsaF865TXVNORE8=;
 b=0HBj0lU3xLLIsUytD2Zr7QnEyVJeyNAsSzJtPxXNgn/1kbEznPIDrkfCopo56heyJ+Y9LGu+HTz7V
 Mxs3MGQDw==
X-HalOne-Cookie: 9555f21197756298a45ed21bb7b695fe29b19f8d
X-HalOne-ID: 8daf18fa-f3f3-11ec-be7c-d0431ea8bb03
Received: from mailproxy3.cst.dirpod3-cph3.one.com
 (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
 by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 8daf18fa-f3f3-11ec-be7c-d0431ea8bb03;
 Fri, 24 Jun 2022 19:26:32 +0000 (UTC)
Date: Fri, 24 Jun 2022 21:26:30 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2 08/68] drm/connector: Introduce
 drmm_connector_init_with_ddc
Message-ID: <YrYP5n48MPSrDOYI@ravnborg.org>
References: <20220622143209.600298-1-maxime@cerno.tech>
 <20220622143209.600298-9-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220622143209.600298-9-maxime@cerno.tech>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 22, 2022 at 04:31:09PM +0200, Maxime Ripard wrote:
> Let's create a DRM-managed variant of drm_connector_init_with_ddc that will
> take care of an action of the connector cleanup.
> 
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
