Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE71148DAF
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2020 19:18:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1F3C6E445;
	Fri, 24 Jan 2020 18:18:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D4C06E445
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Jan 2020 18:18:17 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 66DCF2001F;
 Fri, 24 Jan 2020 19:18:13 +0100 (CET)
Date: Fri, 24 Jan 2020 19:18:12 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/4] drm/tiny/repaper: Make driver OF-independent
Message-ID: <20200124181812.GA7883@ravnborg.org>
References: <20200122105403.30035-1-andriy.shevchenko@linux.intel.com>
 <20200124164233.GA6043@ravnborg.org>
 <20200124173134.GJ32742@smile.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200124173134.GJ32742@smile.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8
 a=KfoDjS5_q7SDp-6UDooA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 David Lechner <david@lechnology.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andy.

On Fri, Jan 24, 2020 at 07:31:34PM +0200, Andy Shevchenko wrote:
> On Fri, Jan 24, 2020 at 05:42:33PM +0100, Sam Ravnborg wrote:
> > On Wed, Jan 22, 2020 at 12:54:00PM +0200, Andy Shevchenko wrote:
> > > There is one OF call in the driver that limits its area of use.
> > > Replace it to generic device_get_match_data() and get rid of OF dependency.
> > > 
> > > While here, cast SPI driver data to certain enumerator type.
> 
> > >  enum repaper_model {
> > > +	EXXXXCSXXX = 0,
> > >  	E1144CS021 = 1,
> > >  	E1190CS021,
> > >  	E2200CS021,
> > The new enum value is not used in the following - is it necessary?
> 
> Yes. It explicitly prevents to use 0 for real device.
> 
> This is due to device_get_match_data() returns content of data pointer and thus
> we may not distinguish 0 from NULL pointer.
A name that told this was not a valid name would be descriptive.
As it is now it looks like a wildcard that matches everythign else.

With a more descriptive name:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>


	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
