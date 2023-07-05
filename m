Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9371B748ACB
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 19:43:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28C8E10E185;
	Wed,  5 Jul 2023 17:43:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay1-1.pub.mailoutpod2-cph3.one.com
 (mailrelay1-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:400::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C9C310E185
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 17:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=Cvo8ihmUG+kRO7whocPLZFDZowhRtMUilA9p0FqtzFM=;
 b=mNUIcNUEUh9wO+290wUnPA4sgtHP6wGFQtvEnLBo3z49TueUFxuf+NxxnPpU60/ytDC6yPa8TKJDY
 ZDVvwX8Jpvk7SHY4+CMqkspSnlopUbpT3fM7CHDan8Nr0zra/0AHOv0+4MsVpjwSx6pr3KNspQmjS/
 i3p4lpZyGwwSjmzZQu3uFl/0Pw+HhSpyLXaac6Me8EyEKiOuZrfkY5D4z2t8aV7ZN/wfr7NGbcqXP8
 NYSKb3TNS6RpAZr26+C7e3xbxDEWq1FIxum5Kh3BAV2qru+oIoC40r3tb2IOrDjwCmn11h9Iz+mNAN
 YO/U5+JUQhDIyfTNvesJj4joELyMH/Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=Cvo8ihmUG+kRO7whocPLZFDZowhRtMUilA9p0FqtzFM=;
 b=pDo/7O4RO4JMVI6z81c7vrhIiudGntSVAHWIaWn3Qog59ukQmrrQBqe4K8IohWr5UyjVJYINkzEQL
 7NV/c6WBg==
X-HalOne-ID: 624a4008-1b5b-11ee-9555-99461c6a3fe8
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay1 (Halon) with ESMTPSA
 id 624a4008-1b5b-11ee-9555-99461c6a3fe8;
 Wed, 05 Jul 2023 17:43:02 +0000 (UTC)
Date: Wed, 5 Jul 2023 19:43:01 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH 1/1] drm: panel-simple: add missing bus flags for Tianma
 tm070jvhg[30/33]
Message-ID: <20230705174301.GB106478@ravnborg.org>
References: <20230125145215.3631071-1-alexander.stein@ew.tq-group.com>
 <4295711.5fSG56mABF@steina-w>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4295711.5fSG56mABF@steina-w>
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
Cc: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Markus Niebel <Markus.Niebel@ew.tq-group.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alexander,
On Wed, Jul 05, 2023 at 03:22:39PM +0200, Alexander Stein wrote:
> Hi,
> 
> another gentle ping
> 
> Best regards,
> Alexander
> 
> Am Mittwoch, 25. Januar 2023, 15:52:15 CEST schrieb Alexander Stein:
> > From: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> > 
> > The DE signal is active high on this display, fill in the missing
> > bus_flags. This aligns panel_desc with its display_timing.
> > 
> > Fixes: 9a2654c0f62a ("drm/panel: Add and fill drm_panel type field")
> > Fixes: b3bfcdf8a3b6 ("drm/panel: simple: add Tianma TM070JVHG33")
> > Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

I hope someone else will pick it up.

	Sam
