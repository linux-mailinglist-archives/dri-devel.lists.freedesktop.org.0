Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C099354DD19
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 10:43:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75683113A94;
	Thu, 16 Jun 2022 08:43:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79B98113A92
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 08:43:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 82EA0B82291;
 Thu, 16 Jun 2022 08:43:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AF60C34114;
 Thu, 16 Jun 2022 08:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1655368981;
 bh=254RCbxo4FfZtCOL3JaXO+g0LVlpONTzvmsMgyFher8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NMawHAL2CRg6wix7iwPCHkoIrl8oFmn1vWzHiUp2QxVXetAEvnKnMutMYJijrejj1
 GwGtIScIfvKZ33v8HeW+NtmYmz/gcJuskYLzZ6okPtBQyP1UtS3ps3UUf4KWwsladG
 KYrPNhMn1OorOiXskAay3GozWO3k4NGFNBvtqGEM=
Date: Thu, 16 Jun 2022 10:42:57 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Dave Airlie <airlied@gmail.com>
Subject: Re: [Linaro-mm-sig] Re: [PATCH] drivers: tty: serial: Add missing
 of_node_put() in serial-tegra.c
Message-ID: <YqrtESygyL7k3/iV@kroah.com>
References: <20220615104833.3963552-1-windhl@126.com>
 <Yqm6LvDGqaRMaUHa@kroah.com>
 <CAPM=9twCiqyakgPLz0v=7-abUhzLb8ZZH7-U65PV8qtQOP7Xww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPM=9twCiqyakgPLz0v=7-abUhzLb8ZZH7-U65PV8qtQOP7Xww@mail.gmail.com>
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
Cc: linux-tegra@vger.kernel.org, heliang <windhl@126.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, linux-serial@vger.kernel.org,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 16, 2022 at 06:23:26AM +1000, Dave Airlie wrote:
> On Wed, 15 Jun 2022 at 20:53, Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Wed, Jun 15, 2022 at 06:48:33PM +0800, heliang wrote:
> > > In tegra_uart_init(), of_find_matching_node() will return a node
> > > pointer with refcount incremented. We should use of_node_put()
> > > when it is not used anymore.
> > >
> > > Signed-off-by: heliang <windhl@126.com>
> >
> > We need a real name please, one you sign documents with.
> 
> How do we enforce that? What if Wong, Adele or Beyonce submit a patch?

As per our rules in the kernel, we can not accept a signed-off-by by a
known anonymous person.  When you can obviously see that the name is
incorrect (as has happened recently with different names being used for
the from: and the s-o-b lines in the email address), you have to ask for
clarification.  It's something that all maintainers should be doing.

> What happens if that patch gets reposted, with S-o-b: He Liang
> <windhl@126.com> or Hel Iang, Heli Ang? Do you know any of those are
> real names? What happens if they post a real name in
> Mandarin/Thai/Cyrillic, can you validate it?

I would love for people to use their names in their native language,
there's no need to make up english-sounding names at all.  We have many
examples of this in commits already, I would be happy if we get more.

And yes, validating names in those languages is usually not very
difficult.

thanks,

greg k-h
