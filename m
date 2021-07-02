Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9F43B9F17
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 12:29:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26E9189854;
	Fri,  2 Jul 2021 10:28:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C60B897F3
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jul 2021 10:28:56 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 4a1e50b6-db20-11eb-9082-0050568c148b;
 Fri, 02 Jul 2021 10:28:49 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 8E88F194B1A;
 Fri,  2 Jul 2021 12:28:59 +0200 (CEST)
Date: Fri, 2 Jul 2021 12:28:53 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] drm/dbi: Print errors for mipi_dbi_command()
Message-ID: <YN7qZYNjKCOD0Lim@ravnborg.org>
References: <20210702100455.3928920-1-linus.walleij@linaro.org>
 <YN7qHm9DgHYKvngw@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YN7qHm9DgHYKvngw@ravnborg.org>
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
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 02, 2021 at 12:27:42PM +0200, Sam Ravnborg wrote:
> On Fri, Jul 02, 2021 at 12:04:55PM +0200, Linus Walleij wrote:
> > The macro mipi_dbi_command() does not report errors unless you wrap it
> > in another macro to do the error reporting.
> > 
> > Report a rate-limited error so we know what is going on.
> > 
> > Drop the only user in DRM using mipi_dbi_command() and actually checking
> > the error explicitly, let it use mipi_dbi_command_buf() directly
> > instead.
> > 
> > After this any code wishing to send command arrays can rely on
> > mipi_dbi_command() providing an appropriate error message if something
> > goes wrong.
> > 
> > Suggested-by: Noralf Trønnes <noralf@tronnes.org>
> > Suggested-by: Douglas Anderson <dianders@chromium.org>
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Too fast send, this should read:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

