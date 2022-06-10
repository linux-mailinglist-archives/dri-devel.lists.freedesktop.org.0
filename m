Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2699C546EA7
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 22:49:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CD73113F32;
	Fri, 10 Jun 2022 20:49:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay3-1.pub.mailoutpod1-cph3.one.com
 (mailrelay3-1.pub.mailoutpod1-cph3.one.com [46.30.210.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29043113F32
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 20:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
 message-id:subject:cc:to:from:date:from;
 bh=ACZk3VjAixXI/UfuGjHePmP+cJsCymKcbZ3TtJqGdg8=;
 b=tptHn4+MOhdFBnj3Qsn24UgVlUrX1VnSxOAONv3aLxouY1P0q80VnsgB3JOrXqom3229LyHf1Rk3a
 WH50Ric5a5PykNQdtoi3mNKPwHFBYBpS91QYNfQYZFs8lrxt9Pr8yebDrdxtg7JRRlHuPeKc+UP5pE
 ZWGhF3qiSGU87pYY2633xNTEb6aQqbrQ8uPI0NAcXY6ImPBqKAfwM8BfQ6BpWD5EP4N/NHBxCihVQC
 yTUzzPMKXAO/yw65JIY1U+VKDjW+c3kkTTA4ujjJ9XlEPR1GrQuolxdRpkjkU0feWA7abCW3KsGenl
 QSSN6YDKYxgH2Ejun5PJ6a8fbD4BlVw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-transfer-encoding:content-type:mime-version:references:
 message-id:subject:cc:to:from:date:from;
 bh=ACZk3VjAixXI/UfuGjHePmP+cJsCymKcbZ3TtJqGdg8=;
 b=CYZ+3pMf7fEHyrQx7MXlBDkSVpUZA6brYTcjj+epgEOImeaCxFHxMS1nkst/Xsx6rURbHc6wKr4qA
 PYb6WPECA==
X-HalOne-Cookie: c6820af80656695f5a8dc50bdf7a07dee5e9d6b9
X-HalOne-ID: c7b2c282-e8fe-11ec-be77-d0431ea8bb03
Received: from mailproxy3.cst.dirpod4-cph3.one.com
 (80-162-45-141-cable.dk.customer.tdc.net [80.162.45.141])
 by mailrelay3.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id c7b2c282-e8fe-11ec-be77-d0431ea8bb03;
 Fri, 10 Jun 2022 20:49:11 +0000 (UTC)
Date: Fri, 10 Jun 2022 22:49:09 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Stephen Kitt <steve@sk2.org>
Subject: Re: [PATCH] staging: ftbft: Use backlight helper
Message-ID: <YqOuRQ33bo1Y7Q+B@ravnborg.org>
References: <20220607185516.1129900-1-steve@sk2.org>
 <YqOoI6g6GVw0Z1s/@ravnborg.org>
 <20220610224306.325a6c91@heffalump.sk2.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220610224306.325a6c91@heffalump.sk2.org>
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
Cc: linux-fbdev@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
 Len Baker <len.baker@gmx.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 10, 2022 at 10:43:06PM +0200, Stephen Kitt wrote:
> Hi Sam,
> 
> On Fri, 10 Jun 2022 22:22:59 +0200, Sam Ravnborg <sam@ravnborg.org> wrote:
> > On Tue, Jun 07, 2022 at 08:55:16PM +0200, Stephen Kitt wrote:
> > > backlight_properties.fb_blank is deprecated. The states it represents
> > > are handled by other properties; but instead of accessing those
> > > properties directly, drivers should use the helpers provided by
> > > backlight.h.
> > > 
> > > Instead of manually checking the power state in struct
> > > backlight_properties, use backlight_is_blank().
> > > 
> > > Signed-off-by: Stephen Kitt <steve@sk2.org>
> > > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > Cc: "Noralf Trønnes" <noralf@tronnes.org>
> > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > Cc: Javier Martinez Canillas <javierm@redhat.com>
> > > Cc: Len Baker <len.baker@gmx.com>
> > > Cc: dri-devel@lists.freedesktop.org
> > > Cc: linux-fbdev@vger.kernel.org
> > > Cc: linux-staging@lists.linux.dev
> > > ---
> > >  drivers/staging/fbtft/fb_ssd1351.c | 3 +--
> > >  drivers/staging/fbtft/fbtft-core.c | 3 +--
> > >  2 files changed, 2 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/staging/fbtft/fb_ssd1351.c
> > > b/drivers/staging/fbtft/fb_ssd1351.c index 6fd549a424d5..b8d55aa8c5c7
> > > 100644 --- a/drivers/staging/fbtft/fb_ssd1351.c
> > > +++ b/drivers/staging/fbtft/fb_ssd1351.c
> > > @@ -196,8 +196,7 @@ static int update_onboard_backlight(struct
> > > backlight_device *bd) "%s: power=%d, fb_blank=%d\n",
> > >  		      __func__, bd->props.power, bd->props.fb_blank);  
> > Could you try to kill this use of props.fb_blank too?      ^^^^^^
> > A local variable should do the trick.
> 
> I have a pending patch changing this to show props.state instead, that way
> the debug info shows all the backlight-relevant information from props. How
> does that sound?
In the end we want to have only _one_ state for backlight, so the
simpler solution that just use one of the helpers would be better.
For this driver there is no reason to do much anyway.

	Sam
