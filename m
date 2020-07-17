Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6560B225887
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jul 2020 09:31:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C83689FE3;
	Mon, 20 Jul 2020 07:30:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from muru.com (muru.com [72.249.23.125])
 by gabe.freedesktop.org (Postfix) with ESMTP id 487CF6EDF4
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jul 2020 16:28:53 +0000 (UTC)
Received: from atomide.com (localhost [127.0.0.1])
 by muru.com (Postfix) with ESMTPS id CAC0680B0;
 Fri, 17 Jul 2020 16:28:50 +0000 (UTC)
Date: Fri, 17 Jul 2020 09:28:54 -0700
From: Tony Lindgren <tony@atomide.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH v2] drm/omap: force runtime PM suspend on system suspend
Message-ID: <20200717162854.GQ10990@atomide.com>
References: <20200618095153.611071-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200618095153.611071-1-tomi.valkeinen@ti.com>
X-Mailman-Approved-At: Mon, 20 Jul 2020 07:30:37 +0000
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

* Tomi Valkeinen <tomi.valkeinen@ti.com> [200618 09:53]:
> Use SET_LATE_SYSTEM_SLEEP_PM_OPS in DSS submodules to force runtime PM
> suspend and resume.
> 
> We use suspend late version so that omapdrm's system suspend callback is
> called first, as that will disable all the display outputs after which
> it's safe to force DSS into suspend.

This would be great to have merged as a fix for v5.8 as it fixes a
suspend and resume regression:

Fixes: cef766300353 ("drm/omap: Prepare DSS for probing without legacy platform data")
Tested-by: Tony Lindgren <tonY@atomide.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
