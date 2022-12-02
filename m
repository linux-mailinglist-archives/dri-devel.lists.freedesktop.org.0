Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0C2640523
	for <lists+dri-devel@lfdr.de>; Fri,  2 Dec 2022 11:49:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A886D10E6D3;
	Fri,  2 Dec 2022 10:49:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7965110E6D3
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Dec 2022 10:49:53 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1p13c7-0003mG-UB; Fri, 02 Dec 2022 11:49:51 +0100
Message-ID: <f876ba1f1c1db7fc6ffdb1efc76adecd029e2ea6.camel@pengutronix.de>
Subject: Re: [PATCH] [RFC] drm/etnaviv: Disable softpin
From: Lucas Stach <l.stach@pengutronix.de>
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Date: Fri, 02 Dec 2022 11:49:50 +0100
In-Reply-To: <d063b82d-7557-8f97-114e-3e7828c6dfb8@denx.de>
References: <20221201232100.221606-1-marex@denx.de>
 <6dc1400c0f39849ca5ba675e25e26e5f4a663e78.camel@pengutronix.de>
 <d063b82d-7557-8f97-114e-3e7828c6dfb8@denx.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: David Airlie <airlied@linux.ie>, etnaviv@lists.freedesktop.org,
 Russell King <linux+etnaviv@armlinux.org.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Freitag, dem 02.12.2022 um 11:20 +0100 schrieb Marek Vasut:
> On 12/2/22 09:59, Lucas Stach wrote:
> > Am Freitag, dem 02.12.2022 um 00:21 +0100 schrieb Marek Vasut:
> > > Currently softpin suffers from assorted race conditions exposed by newer
> > > versions of mesa 22.2.y and 22.3.y . Those races are difficult to fix in
> > > older kernel versions due to massive amount of backports necessary to do
> > > so. Disable softpin by default until Linux 6.1.y is out, which contains
> > > the necessary fixes to make softpin work reliably.
> > > 
> > Sorry, but that's a NACK. The userspace driver depends on softpin for
> > GPUs with texture descriptors, so this introduces a hard functional
> > regression for those GPUs. I.e. they would go from "require race fixes
> > that are already on the way to upstream" to not working at all.
> 
> I expected that NAK.
> 
> But then, what options do we have here, except for a massive convoluted 
> backport, which might bring bugs of its own ?

There is no other option. The kernel driver in the LTS releases does
have a buggy softpin implementation. If someone cares about being able
to keep their system on the LTS kernel, then that someone either needs
to carry out the backports of the fixes with the necessary diligence or
sponsor someone to do it.

Regards,
Lucas

