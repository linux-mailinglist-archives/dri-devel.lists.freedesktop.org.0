Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B333A340D01
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 19:31:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CBC46E954;
	Thu, 18 Mar 2021 18:31:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.siol.net (mailoutvs17.siol.net [185.57.226.208])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEE596E954
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 18:31:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Zimbra) with ESMTP id B3235522B1A;
 Thu, 18 Mar 2021 19:31:31 +0100 (CET)
X-Virus-Scanned: amavisd-new at psrvmta12.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta12.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id kDG2-2smJXM8; Thu, 18 Mar 2021 19:31:31 +0100 (CET)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Zimbra) with ESMTPS id 60F0E523BCA;
 Thu, 18 Mar 2021 19:31:31 +0100 (CET)
Received: from kista.localnet (cpe-86-58-17-133.cable.triera.net
 [86.58.17.133]) (Authenticated sender: jernej.skrabec@siol.net)
 by mail.siol.net (Zimbra) with ESMTPA id B6169523AEA;
 Thu, 18 Mar 2021 19:31:30 +0100 (CET)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To: Maxime Ripard <maxime@cerno.tech>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: Re: [PATCH 02/18] drm/bridge: Add HDMI output fmt helper
Date: Thu, 18 Mar 2021 19:31:30 +0100
Message-ID: <3312709.MrizLCItEp@kista>
In-Reply-To: <38906681-737b-462a-d10d-7fb9def141d2@baylibre.com>
References: <20210317154352.732095-1-maxime@cerno.tech>
 <20210317154352.732095-3-maxime@cerno.tech>
 <38906681-737b-462a-d10d-7fb9def141d2@baylibre.com>
MIME-Version: 1.0
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dne sreda, 17. marec 2021 ob 17:08:07 CET je Neil Armstrong napisal(a):
> On 17/03/2021 16:43, Maxime Ripard wrote:
> > The atomic_get_output_bus_fmts bridge callback is there to list the
> > available formats for output by decreasing order of preference.
> > 
> > On HDMI controllers, we have a fairly static list that will depend on
> > what the HDMI sink is capable of and the BPC our controller can output.
> > 
> > The dw-hdmi driver already has that code done in a fairly generic
> > manner, so let's turn that code into an helper for all the HDMI
> > controllers to reuse.
> 
> This code was based on the capabilities of the DW-HDMI IP, copying it as-is
> doesn't make much sense, we should be able to filter out formats the HDMI IP
> doesn't support.

HDMI standard has pretty strict requirements which formats should be 
supported, so cores should have very similar capabilities.

Best regards,
Jernej


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
