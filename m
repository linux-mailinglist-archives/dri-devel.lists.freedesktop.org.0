Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A0FB200251
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jun 2020 08:58:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 702206EC20;
	Fri, 19 Jun 2020 06:58:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id 61ADA6E3FE
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jun 2020 14:42:02 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id 8979A80A9;
 Thu, 18 Jun 2020 14:42:53 +0000 (UTC)
Date: Thu, 18 Jun 2020 07:41:58 -0700
From: Tony Lindgren <tony@atomide.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v2] drm/omap: force runtime PM suspend on system suspend
Message-ID: <20200618144158.GE43721@atomide.com>
References: <20200618095153.611071-1-tomi.valkeinen@ti.com>
 <20200618131608.GC43721@atomide.com>
 <b351785a-5be4-edd2-2907-c9b091cbb481@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b351785a-5be4-edd2-2907-c9b091cbb481@ti.com>
X-Mailman-Approved-At: Fri, 19 Jun 2020 06:58:10 +0000
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
Cc: Grygorii Strashko <grygorii.strashko@ti.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

* Tomi Valkeinen <tomi.valkeinen@ti.com> [200618 14:03]:
> On 18/06/2020 16:16, Tony Lindgren wrote:
> > * Tomi Valkeinen <tomi.valkeinen@ti.com> [200618 09:53]:
> > > Use SET_LATE_SYSTEM_SLEEP_PM_OPS in DSS submodules to force runtime PM
> > > suspend and resume.
> > > 
> > > We use suspend late version so that omapdrm's system suspend callback is
> > > called first, as that will disable all the display outputs after which
> > > it's safe to force DSS into suspend.
> > 
> > This looks like a nice way of doing it, would be good to have as a
> > regression fix for the -rc cycle:
> > 
> > Acked-by: Tony Lindgren <tony@atomide.com>
> 
> Thanks. Did you get the full suspend working? I still can't resume, unless I
> use pm_test to avoid the full suspend. So I'm still not sure if things
> really work.

I just tested my fixes branch at commit 80bf72598663 ("ARM: dts: am5729:
beaglebone-ai: fix rgmii phy-mode") with your patch and HDMI cable
attached and suspend and resume works for me:

Tested-by: Tony Lindgren <tony@atomide.com>

I did not have luck the last time I tried am437x-sk-evm, but that
seems like some separate regression that's been around for awhile.
I recall testing it successfully last fall at some point.

Regards,

Tony
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
