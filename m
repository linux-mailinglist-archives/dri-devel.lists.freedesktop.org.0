Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5BE36F02F
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 21:23:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB8076F497;
	Thu, 29 Apr 2021 19:23:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 052DF6F497;
 Thu, 29 Apr 2021 19:23:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5829C6144E;
 Thu, 29 Apr 2021 19:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619724190;
 bh=OI/1szp0Xz/VR6hQfYsOdCzY1+KuV4hjYKsyihyrzaI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=qiBeWbFqFd2JW+/IeA0A/6z7EAL745roaQhToyMH5LNFjKEyPoMKYvXTHyRihqrig
 rZTQj+E6Inw21VxjBrXQUX8Vt2kWY54i9gpdF4vecvViXPX7bXhpXcSn6JejUef+3s
 tYPO8UIUxpwyGtAD2ilee+FGOT82PpKTDBnJbdcLxOmjsQbG/A2fig/7l6ZRLD7bJr
 mA27SVK4k79jN37lAwBEQlMN5Q9PcVM2qqAFUy/fKRKeHK+kDNFjTRS7GBs8UeY5Xo
 2c2iT/7Il0qf2lcp/D9X45wDwUd6yN6EEQfEe4mtYE9SkGdzWuiJi6vxpvWNQkfedK
 r4rmnpGLXkE0A==
Date: Thu, 29 Apr 2021 14:23:08 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Subject: Re: [PATCH v5 08/27] PCI: add support for dev_groups to struct
 pci_device_driver
Message-ID: <20210429192308.GA510492@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c315d0d0-6fd8-0510-99c6-dd72bd583c0a@amd.com>
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
Cc: ckoenig.leichtzumerken@gmail.com, gregkh@linuxfoundation.org,
 daniel.vetter@ffwll.ch, Felix.Kuehling@amd.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-pci@vger.kernel.org,
 Alexander.Deucher@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 29, 2021 at 12:53:15PM -0400, Andrey Grodzovsky wrote:
> On 2021-04-28 12:53 p.m., Bjorn Helgaas wrote:
> > On Wed, Apr 28, 2021 at 11:11:48AM -0400, Andrey Grodzovsky wrote:
> > > This is exact copy of 'USB: add support for dev_groups to
> > > struct usb_device_driver' patch by Greg but just for
> > > the PCI case.

> > ...
> > The usual commit citation format is 7d9c1d2f7aca ("USB: add support
> > for dev_groups to struct usb_device_driver") so it's easier to locate
> > the commit.
> > 
> > I see there is also b71b283e3d6d ("USB: add support for dev_groups to
> > struct usb_driver").  I don't know enough about USB to know whether
> > 7d9c1d2f7aca or b71b283e3d6d is a closer analogue to what you're doing
> > here, but I do see that struct usb_driver is far more common than
> > struct usb_device_driver.
> > 
> > PCI has struct pci_driver, but doesn't have the concept of a struct
> > pci_device_driver.
> 
> Since we don't have pci_device_driver then pci_driver is the best place
> for it then, no ?

Of course.  My point was just that maybe you should say this is
similar to b71b283e3d6d ("USB: add support for dev_groups to struct
usb_driver"), not similar to 7d9c1d2f7aca ("USB: add support for
dev_groups to struct usb_device_driver").

Bjorn
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
