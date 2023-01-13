Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28313669B9E
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 16:14:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4801410EA18;
	Fri, 13 Jan 2023 15:14:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay5-1.pub.mailoutpod2-cph3.one.com
 (mailrelay5-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:404::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5221910EA18
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 15:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=nU6Umbs8xvssLaxiDid1viysD8CdNgNOb375wva8qTw=;
 b=uaAdaM2ARupJKUPlVVFpwz2TEuIdfQfNoFnkArk2urZIbkVDnbiWaE5AXTWVx5DEMPrbnwpXCeITK
 6niDIDopKjoefaRLefStlm9x2luW0TIVH2Amf3Rtv/UcSDcUZMekm+4BHsmDWbQuELrgAa9Z43JOAd
 nV+t97c3Ry8Y2FR+E5iYatW7OiyIjHfmR/IZI9Vlnjf/ssxY+9fpt1V9I5Bgw06PDECBz9ftnJyYBl
 NQyJhCVBdqomeDYlcctS0sCrQ31xTwAqmLck5vh0T4UiyU+GX4TeVRZT4ePu87VJRwCktG4HAIIgVb
 tV7MdJ4NgthEowpQ2FCkMCEItw5JXYg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=nU6Umbs8xvssLaxiDid1viysD8CdNgNOb375wva8qTw=;
 b=b4ZPlwgR0sPJLfZZcM5eQU9vpvaSv4I77zFBtilkteLXeT+gcTKuaBs12FtQLbzBkGbm4Dgs9l5cA
 4NPMxamDg==
X-HalOne-ID: ee2cf748-9354-11ed-a11c-7703b0afff57
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay5 (Halon) with ESMTPSA
 id ee2cf748-9354-11ed-a11c-7703b0afff57;
 Fri, 13 Jan 2023 15:14:13 +0000 (UTC)
Date: Fri, 13 Jan 2023 16:14:11 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v2 00/10] drm: Do not include <linux/fb.h> unnecessarily
Message-ID: <Y8F1Q+sXAOQIFD/n@ravnborg.org>
References: <20230111130206.29974-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230111130206.29974-1-tzimmermann@suse.de>
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
Cc: f.fainelli@gmail.com, amd-gfx@lists.freedesktop.org, liviu.dudau@arm.com,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com,
 james.qian.wang@arm.com, alexander.deucher@amd.com,
 bcm-kernel-feedback-list@broadcom.com, christian.koenig@amd.com,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas.
On Wed, Jan 11, 2023 at 02:01:56PM +0100, Thomas Zimmermann wrote:
> Remove unnecessary include statements for <linux/fb.h>. I recently
> changed this header and had to rebuild a good part of DRM. So avoid
> this by removing the dependency.
> 
> Several files include <linux/fb.h> via drm_fb_helper.h. So in v2 I
> added additional patches that remove some of those include statements
> as well.
> 
> Some source files require the OF or backlight headers. Include those
> instead.
> 
> v2:
> 	* add more patches to handle drm_fb_helper.h includes
> 	* fix komeda build (kernel test robot)

Whole series are:
Acked-by: Sam Ravnborg <sam@ravnborg.org>

Except for the patches where I added an explicit r-b.

	Sam
