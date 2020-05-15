Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 885511D4B25
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 12:39:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BFF66EC6A;
	Fri, 15 May 2020 10:39:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D4946EC6A
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 10:39:38 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AE6FF207CB;
 Fri, 15 May 2020 10:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589539178;
 bh=PrM+xPGfJLUiyDISNpS4vjvmsRnmHt+gojfva9KvB1U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=xKedetK3gPz0GVdrzVQ0d2O10La+Y6bjL3cWBrZWWII43x/E4CYjMQXu8/BW6fZUM
 rh3QHk9e8A0x0zyw3F8au4UiM9tovwygfrHoJpIIAwzwWPGPmslwTrjQg5pd9oAXCN
 MBdfy7hljbo4joxXXgyVWcCioRg2NLkQcvSja5rc=
Date: Fri, 15 May 2020 12:39:36 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Emil Velikov <emil.l.velikov@gmail.com>
Subject: Re: [PATCH 10/11] kernel/power: constify sysrq_key_op
Message-ID: <20200515103936.GA1712181@kroah.com>
References: <20200513214351.2138580-1-emil.l.velikov@gmail.com>
 <20200513214351.2138580-10-emil.l.velikov@gmail.com>
 <CAJZ5v0iM5H03=RTtk2sZtUzaW0XJ+AaX1M00C8QjvaNz0ZE3bQ@mail.gmail.com>
 <CACvgo52myKJ+3s8pYPnqNBxWqg6bCHQXqGJrLwmrSvocuqU=pg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACvgo52myKJ+3s8pYPnqNBxWqg6bCHQXqGJrLwmrSvocuqU=pg@mail.gmail.com>
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
Cc: Len Brown <len.brown@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Jiri Slaby <jslaby@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, May 15, 2020 at 11:11:57AM +0100, Emil Velikov wrote:
> On Thu, 14 May 2020 at 12:21, Rafael J. Wysocki <rafael@kernel.org> wrote:
> >
> > On Wed, May 13, 2020 at 11:46 PM Emil Velikov <emil.l.velikov@gmail.com> wrote:
> > >
> > > With earlier commits, the API no longer discards the const-ness of the
> > > sysrq_key_op. As such we can add the notation.
> > >
> > > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > Cc: Jiri Slaby <jslaby@suse.com>
> > > Cc: linux-kernel@vger.kernel.org
> > > Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>
> > > Cc: Len Brown <len.brown@intel.com>
> > > Cc: linux-pm@vger.kernel.org
> > > Signed-off-by: Emil Velikov <emil.l.velikov@gmail.com>
> >
> > Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> >
> Thanks
> 
> > and I'm assuming that this is going to be applied along with the rest
> > of the series.
> >
> I believe so, although I have not heard anything from the TTY maintainers yet.

I will take them all, thanks.

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
