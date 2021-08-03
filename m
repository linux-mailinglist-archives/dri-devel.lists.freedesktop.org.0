Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E35F3DF463
	for <lists+dri-devel@lfdr.de>; Tue,  3 Aug 2021 20:12:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2720689F8B;
	Tue,  3 Aug 2021 18:12:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D98D789F8B
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Aug 2021 18:11:57 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 538184d5-f486-11eb-8d1a-0050568cd888;
 Tue, 03 Aug 2021 18:12:12 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id BE280194B79;
 Tue,  3 Aug 2021 20:12:19 +0200 (CEST)
Date: Tue, 3 Aug 2021 20:11:52 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Markuss Broks <markuss.broks@gmail.com>
Cc: linux-kernel@vger.kernel.org, linus.walleij@linaro.org,
 phone-devel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/panel: s6d27a1: Add driver for Samsung S6D27A1
 display panel
Message-ID: <YQmG6EbBherV+8px@ravnborg.org>
References: <YQlWk5yoAAe4SRZX@ravnborg.org>
 <20210803172458.10971-1-markuss.broks@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210803172458.10971-1-markuss.broks@gmail.com>
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

Hi Markuss,
On Tue, Aug 03, 2021 at 08:24:50PM +0300, Markuss Broks wrote:
> This adds a driver for Samsung S6D27A1 display controller and panel.
> This panel is found in the Samsung GT-I8160 mobile phone,
> and possibly some other mobile phones.
> 
> This display needs manufacturer commands to configure it to a working state;
> the commands used in this driver were taken from downstream driver
> by Gareth Phillips; sadly, there is almost no documentation on what they
> actually do.
> 
> This driver re-uses the DBI infrastructure to communicate with the display.
> 
> This driver is heavily based on WideChips WS2401 display controller
> driver by Linus Walleij and on other panel drivers for reference.
> 
> Signed-off-by: Markuss Broks <markuss.broks@gmail.com>

Thnaks for the very quick response.

Please provide a changelog so we can follow what has changed.
Sometimes we revisit patches week and 100 patches later and cannot
remember any feedback.

Like for example (my style):
v3:
  - fixed checkpatch warnings (sam)
  - ...

v2:
  - dropped backlight (sam)
  - dropped kernel-doc (sam)
  - bla bla (someone)

There are many different styles - pick one.



Also two other things.
checkpatch --strict reports a few issues to be fixed:

    total: 0 errors, 5 warnings, 6 checks, 344 lines checked

One of them is a missing binding!

And the patch fails to apply. Please rebase on top of -next or
drm-misc-next.

Thanks in advance!

	Sam
