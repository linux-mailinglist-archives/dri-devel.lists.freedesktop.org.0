Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 066443B9F13
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 12:27:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 658D86E0C4;
	Fri,  2 Jul 2021 10:27:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C1796E0C4
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jul 2021 10:27:00 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 09107fc0-db20-11eb-8d1a-0050568cd888;
 Fri, 02 Jul 2021 10:27:00 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 512D5194B05;
 Fri,  2 Jul 2021 12:27:03 +0200 (CEST)
Date: Fri, 2 Jul 2021 12:26:56 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] drm/dbi: Print errors for mipi_dbi_command()
Message-ID: <YN7p8M9t5vHgyHCz@ravnborg.org>
References: <20210701222518.3895552-1-linus.walleij@linaro.org>
 <YN6n5MzuwDNuJyW8@ravnborg.org>
 <CACRpkdaJ6JPMFYud154gLm6nKjv8SbS4CfhnqcijCJMz0B3smQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdaJ6JPMFYud154gLm6nKjv8SbS4CfhnqcijCJMz0B3smQ@mail.gmail.com>
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
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

On Fri, Jul 02, 2021 at 11:58:52AM +0200, Linus Walleij wrote:
> On Fri, Jul 2, 2021 at 7:45 AM Sam Ravnborg <sam@ravnborg.org> wrote:
> 
> > > -     ret = mipi_dbi_command(dbi, MIPI_DCS_SOFT_RESET);
> > > +     ret = mipi_dbi_command_buf(dbi, MIPI_DCS_SOFT_RESET, NULL, 0);
> > >       if (ret) {
> > >               DRM_DEV_ERROR(dev, "Failed to send reset command (%d)\n", ret);
> > >               if (dbidev->regulator)
> >
> > I do not see the value in this change??
> > There are many other mipi_dbi_command() users and the error return
> > continues to be checked?!??!
> 
> When we change the mipi_dbi_command() macro to check the error
> value we can no longer retrieve the return value from the macro
> so we need to use the call the command buf directly so that we
> can obtain the return code.
Thanks, got it now.

	Sam
