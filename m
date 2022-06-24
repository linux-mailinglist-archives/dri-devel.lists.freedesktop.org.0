Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA06F55A1C6
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jun 2022 21:26:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 799DB10F1C5;
	Fri, 24 Jun 2022 19:26:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay1-1.pub.mailoutpod1-cph3.one.com
 (mailrelay1-1.pub.mailoutpod1-cph3.one.com [46.30.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CA4110F1A8
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jun 2022 19:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=MVzEcrEvTmR1c7ooAX2D/T1zoqlRZt5FwNCntwVG0/c=;
 b=Kgrrt9joZK/hxRaYHCWqV+D1aOH6UzAf1lZw3fxx7Pb1E9DSmYrbpqc9hRy1ega0px3ADqo6MVb9H
 G+RXZsbmtekQbjRTzKQvnkRQtGXlM/Gd9BFFaTO9oME9ysY0eHg6qCVnlmXuc5+2EC6IVoqAyldHAz
 UECKV/PAyCahjk322LoomNUnLxjU6htTvB86n7xTOUlD5NzyBLCZtrCd0Kg1SaegIXxoc1J8bXZDyb
 cB1gz8wb5FnU3MmlY8cLDtCMyKm7dgDWFH8C7syxQTn/H5arrJymxKdiqliVV372mgfi42JkzZ4gl+
 hZT6qk28Ua3iF0FEozOSdbv5JevnRUA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=MVzEcrEvTmR1c7ooAX2D/T1zoqlRZt5FwNCntwVG0/c=;
 b=P2d8OpoUObkIq037Z2U+nwf4LlRNJ9ie2xIXyUxM7A0kSSzQzzakwEXlNvp98iwGKFajXyvk157Fc
 kyO7WWXDA==
X-HalOne-Cookie: 4139e03ce9fc05034ff3cdfe346f8efbd87b6fad
X-HalOne-ID: 84aeed86-f3f3-11ec-a6c4-d0431ea8a283
Received: from mailproxy2.cst.dirpod3-cph3.one.com
 (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
 by mailrelay1.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 84aeed86-f3f3-11ec-a6c4-d0431ea8a283;
 Fri, 24 Jun 2022 19:26:17 +0000 (UTC)
Date: Fri, 24 Jun 2022 21:26:15 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v2 07/68] drm/connector: Introduce drmm_connector_init
Message-ID: <YrYP14Crvh4gxNHQ@ravnborg.org>
References: <20220622143209.600298-1-maxime@cerno.tech>
 <20220622143209.600298-8-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220622143209.600298-8-maxime@cerno.tech>
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

On Wed, Jun 22, 2022 at 04:31:08PM +0200, Maxime Ripard wrote:
> Unlike other DRM entities, there's no helper to create a DRM-managed
> initialisation of a connector.
> 
> Let's create an helper to initialise a connector that would be passed as an
> argument, and handle the cleanup through a DRM-managed action.
> 
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
