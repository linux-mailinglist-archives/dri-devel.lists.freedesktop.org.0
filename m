Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D43EC57F480
	for <lists+dri-devel@lfdr.de>; Sun, 24 Jul 2022 11:40:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97249C0548;
	Sun, 24 Jul 2022 09:40:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay1-1.pub.mailoutpod1-cph3.one.com
 (mailrelay1-1.pub.mailoutpod1-cph3.one.com [46.30.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B5D5C0545
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Jul 2022 09:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
 message-id:subject:cc:to:from:date:from;
 bh=aVS5uIC+mjDavci9rdhNl/UO0dQNLZJHDBatr8gkvyQ=;
 b=XYFrJ6eQ9qHYQFTETP6D7s5jTvRU1H+UsuWZO2R4/4NQST49fwxyoxMoI5A5dVnEHBe+FJlgC8VXb
 5Fdhx5i13jFu4zfGqv9CjmqNyEHguB8V8nIq6vnVQLrcZOr6EMRJQv7VN2VG9zLRZKxkihxvJfRiRO
 wzS9svJgvibw6HnLd3wasemm/ojW6lFkUX9tsQ9kAyn/zc1ekMbfoVGV215laXLBgJ8jRpIfgpWiFO
 vVQjJhIlx475ki7KbUiAaqFGNbuagcEivgxeEUe0DMzKWmPdzeAo1dagMRc7MsDaKDl0o90mpDa8ya
 3QO7+k3VRtDa0GYOm0OrBQUI/o2kEvQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
 message-id:subject:cc:to:from:date:from;
 bh=aVS5uIC+mjDavci9rdhNl/UO0dQNLZJHDBatr8gkvyQ=;
 b=RyKALO8DhG6P2eEvPBtyr+Q8r66noN5Zph2oVHQyTMcFa4RHF7sGuAWBrfDjSSM89yjKgS2vi0NXS
 mtdInBbBw==
X-HalOne-Cookie: c2f428ac2057f2d00c557b432ba6528e15260b16
X-HalOne-ID: a3ec57f2-0b34-11ed-a6c8-d0431ea8a283
Received: from mailproxy1.cst.dirpod3-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay1.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id a3ec57f2-0b34-11ed-a6c8-d0431ea8a283;
 Sun, 24 Jul 2022 09:40:23 +0000 (UTC)
Date: Sun, 24 Jul 2022 11:40:22 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 1/4] video: fb: imxfb: Drop platform data support
Message-ID: <Yt0ThsMUi34pyuPL@ravnborg.org>
References: <20220723175720.76933-1-u.kleine-koenig@pengutronix.de>
 <YtxKv0ZUbg6V+a2w@ravnborg.org>
 <20220723220218.2jxejv55aix5sqra@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220723220218.2jxejv55aix5sqra@pengutronix.de>
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
Cc: linux-fbdev@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Helge Deller <deller@gmx.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Uwe,

On Sun, Jul 24, 2022 at 12:02:18AM +0200, Uwe Kleine-König wrote:
> Hi Sam,
> 
> On Sat, Jul 23, 2022 at 09:23:43PM +0200, Sam Ravnborg wrote:
> > On Sat, Jul 23, 2022 at 07:57:17PM +0200, Uwe Kleine-König wrote:
> > > No source file but the driver itself includes the header containing the
> > > platform data definition. The last user is gone since commit
> > > 8485adf17a15 ("ARM: imx: Remove imx device directory").
> > > 
> > > So we can safely drop platform data support.
> > > 
> > > Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> > 
> > Do imxfb offer something that is not supported by the DRM drivers?
> > If yes then the clean-up is good, if not then we could drop the driver?
> 
> It's for different i.MX variants. imxfb is for i.MX2x while the DRM
> drivers in mainline are for i.MX6. (Not sure about the i.MX3 and i.MX5x
> variants.)
> 
> Somewhere in the middle of my todo list is to mainline an i.MX2x DRM
> driver that could replace the imxfb driver. If I only had a bit more
> time ...

There is drm/mxsfb, where Kconfig says:
"including i.MX23, i.MX28, i.MX6SX, i.MX7 and i.MX8M".

So there is already something but if this is a 1:1 replacement I dunno.

	Sam
