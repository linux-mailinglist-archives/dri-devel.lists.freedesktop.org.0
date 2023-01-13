Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7FE669B82
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 16:11:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72A6B10E1ED;
	Fri, 13 Jan 2023 15:11:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay4-1.pub.mailoutpod2-cph3.one.com
 (mailrelay4-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:403::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03C2910E1ED
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jan 2023 15:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
 message-id:subject:cc:to:from:date:from;
 bh=7xo0lUqCXtQjj7HGe3/XSw+dtrQw47PwsMVRGQgaRxU=;
 b=Gfuwc/lJ0xNywxrgcVr48BselpyBkpaBoWwhUvL4mNqL5Mggl/50eqdxrH5JAiNCigYYziRwepSy1
 jf931xWWfONpIG3UUMGPj2OlCIzmzlG1XOpaiJ8uXIQUBvkodfkXPiq1h42+4Z8/xqVM3B7YUYXUXn
 Bgn3Y37MFtMLD8ip4InSORuFJ+o6BCtD0wquGdfuWYB8UgyVB4N/G3xSK78jf4f7mHHusqoKLcz/Ek
 2sDNYyAmb8Ljqiv7mKIwKkr8UKf0M815JRqi2Br1igGgnQpvp6fyUoaRPEwP+meOlBzp8S8wr8QxJN
 iNhMIMUezmGK0c8XDHAFxMWfS3/485A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
 message-id:subject:cc:to:from:date:from;
 bh=7xo0lUqCXtQjj7HGe3/XSw+dtrQw47PwsMVRGQgaRxU=;
 b=cKLS8SjnnALmqkSd3WPu/c5io07sZiabEUQ2OZ/dbK4D3ulg8nzrS6MoL+o1QiSQGboUHCBXVJKjl
 xIECvdcCA==
X-HalOne-ID: 9997ceb3-9354-11ed-a77e-87783a957ad9
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay4 (Halon) with ESMTPSA
 id 9997ceb3-9354-11ed-a77e-87783a957ad9;
 Fri, 13 Jan 2023 15:11:49 +0000 (UTC)
Date: Fri, 13 Jan 2023 16:11:48 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v2 02/10] drm: Include <linux/of.h> where needed
Message-ID: <Y8F0tM/mt0EQyfwo@ravnborg.org>
References: <20230111130206.29974-1-tzimmermann@suse.de>
 <20230111130206.29974-3-tzimmermann@suse.de>
 <Y77fCmivLygHyuZ+@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y77fCmivLygHyuZ+@intel.com>
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
Cc: f.fainelli@gmail.com, Thomas Zimmermann <tzimmermann@suse.de>,
 amd-gfx@lists.freedesktop.org, liviu.dudau@arm.com,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com,
 james.qian.wang@arm.com, alexander.deucher@amd.com,
 bcm-kernel-feedback-list@broadcom.com, christian.koenig@amd.com,
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Ville,
On Wed, Jan 11, 2023 at 06:08:42PM +0200, Ville Syrjälä wrote:
> On Wed, Jan 11, 2023 at 02:01:58PM +0100, Thomas Zimmermann wrote:
> > Include <linux/of.h> in source files that need it. Some of DRM's
> > source code gets OF header via drm_crtc_helper.h and <linux/fb.h>,
> > which can leed to unnecessary recompilation.
> > 
> > In drm_modes.c, add a comment on the reason for still including
> > <linux/fb.h>. The header file is required to get KHZ2PICOS(). The
> > macro is part of the UAPI headers, so it cannot be moved to a less
> > prominent location.
> 
> I never liked that KHZ2PICOS() thing in there. Maybe we should
> just nuke it and see if anyone notices?
https://github.com/search?q=KHZ2PICOS&type=code

tells me that it will be noticed.
So it is part of the UAPI

	Sam
