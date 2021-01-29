Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 95FD03087E8
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jan 2021 11:45:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F50A6EACA;
	Fri, 29 Jan 2021 10:45:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C86C56EACA
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 10:45:42 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E542364ECD;
 Fri, 29 Jan 2021 10:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1611917142;
 bh=OkCVjX905HoVydXGS1X0BLagSVkyIgVkgCw7A3EM88E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nUmZiIBU85/wtqESFprVXRBhTOQl+DpAh5VYkxuNVDzaQoFLSdiHqS96wAqbcP022
 aVbE9K9iHi+X3/M8qeg3x5VPM2f3VTIwk682HrhqmYyGXaGHLAUl0VKn8MGqSKxPIc
 95CIqB/XIE4CwFS04Vfk7qKGx4GzhFojx7l2/sqI=
Date: Fri, 29 Jan 2021 11:45:37 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v12] staging: fbtft: add tearing signal detect
Message-ID: <YBPnUWVY5BThoPYg@kroah.com>
References: <1611838435-151774-1-git-send-email-zhangxuezhi3@gmail.com>
 <CAHp75Vd=ijxnamuSYuxNLeyhGMCod=HaXWrQ0W0+3QCsQAychg@mail.gmail.com>
 <20210129130110.00003bb1@gmail.com>
 <CAHp75Vdi4H_zY3+QPSq_wmdf20B9xPeqsOT10JHfMLJESX77gA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHp75Vdi4H_zY3+QPSq_wmdf20B9xPeqsOT10JHfMLJESX77gA@mail.gmail.com>
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
Cc: "open list:STAGING SUBSYSTEM" <devel@driverdev.osuosl.org>,
 "open list:FRAMEBUFFER LAYER" <linux-fbdev@vger.kernel.org>,
 Deepak R Varma <mh12gx2825@gmail.com>, oliver.graute@kococonnector.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stefano Brivio <sbrivio@redhat.com>, carlis <zhangxuezhi3@gmail.com>,
 Colin King <colin.king@canonical.com>, zhangxuezhi1@yulong.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 29, 2021 at 12:23:08PM +0200, Andy Shevchenko wrote:
> On Fri, Jan 29, 2021 at 7:01 AM carlis <zhangxuezhi3@gmail.com> wrote:
> > On Thu, 28 Jan 2021 16:33:02 +0200
> > Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > On Thu, Jan 28, 2021 at 2:58 PM Carlis <zhangxuezhi3@gmail.com> wrote:
> > >
> > > Thanks for your contribution, my comments below.
> > >
> > > > From: zhangxuezhi <zhangxuezhi1@yulong.com>
> > >
> > > You probably have to configure your Git to use the same account for
> > > author and committer.
> >
> > hi,you mean like below:
> >         Carlis <zhangxuezhi1@yulong.com>
> > ?
> 
> I meant that you shouldn't probably have a From: line in the commit message.

It's fine, some people like to be sure about this, there is no problem
with it being there at all.

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
