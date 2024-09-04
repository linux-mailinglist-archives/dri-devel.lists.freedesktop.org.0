Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B6E96B63D
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 11:13:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09B8C10E1F9;
	Wed,  4 Sep 2024 09:13:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Vkz5c7K+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5D2710E1F9
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 09:13:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6C1B2A40117;
 Wed,  4 Sep 2024 09:13:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96995C4CEC2;
 Wed,  4 Sep 2024 09:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1725441226;
 bh=MYuWrpI57eWvfXTVBG8wRa47ghh9A7+OUqw8WpXjn6A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Vkz5c7K+nsAveINoqWfTiRoZyWlaiQyw8mqLVTLmxHeNyFQDjUCkPTLJQMPfgpNQS
 UVTVXVcogfE0b6d/0WW2hHw9P5WYjXq9gu9zL7t5INH0FNKivXfXljctqXG8FA1gRv
 HnwpwcqmqNNA8DF6AULzvEH9dBkmdgIIUaLjQ6Kc=
Date: Wed, 4 Sep 2024 11:13:43 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: Paul Pu <hui.pu@gehealthcare.com>, p.zabel@pengutronix.de,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Lucas Stach <l.stach@pengutronix.de>, HuanWang@gehealthcare.com,
 taowang@gehealthcare.com, sebastian.reichel@collabora.com,
 ian.ray@gehealthcare.com, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] drm/imx/ipuv3: ipuv3-plane: Round up plane width for
 IPUV3_CHANNEL_MEM_DC_SYNC
Message-ID: <2024090442-handrail-backwash-1493@gregkh>
References: <20240904024315.120-1-hui.pu@gehealthcare.com>
 <20240904075417.53-1-hui.pu@gehealthcare.com>
 <918336db-3c3e-4b5e-a9c8-096c9290f9d1@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <918336db-3c3e-4b5e-a9c8-096c9290f9d1@nxp.com>
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

On Wed, Sep 04, 2024 at 04:48:51PM +0800, Liu Ying wrote:
> On 09/04/2024, Paul Pu wrote:
> > Cc: stable@vger.kernel.org # 5.15+
> 
> Why 5.15+ ?

Because the commit referenced in Fixes: was backported there.

If you want to be picky, just drop the "# 5.15+" and our tools will rely
on the Fixes: tag and everyone will be happy.

thanks,

greg k-h
