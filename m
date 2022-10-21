Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D983B607225
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 10:27:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 674D210E63B;
	Fri, 21 Oct 2022 08:27:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF6AF10E63B
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 08:27:21 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0BEAF61DF8;
 Fri, 21 Oct 2022 08:27:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E66C3C433D7;
 Fri, 21 Oct 2022 08:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1666340840;
 bh=7ZxoYK8HOALCQPoUSmoOdfoXqPofWoWwhh5tzgb9b0o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U61pf1Ot4LFYA+cDK/4uMCPCBBHBEJTkaU2P+3nrvxzox5krMLmha7yTJRlx/ZjOf
 qHXQDggo1ZuYibhGWMIuLOr8zd7y72bhyLr8Xbsqz1ux2xkoYPn8Zi2pUf2l8scQlo
 dKMKz9R4HNmIOPU/xYFTf2U5xOV1Dt/8VHxMh8EM=
Date: Fri, 21 Oct 2022 10:27:17 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: [PATCH v5 01/10] gna: add PCI driver module
Message-ID: <Y1JX5WlGm218/TOk@kroah.com>
References: <20221020175334.1820519-1-maciej.kwapulinski@linux.intel.com>
 <20221020175334.1820519-2-maciej.kwapulinski@linux.intel.com>
 <Y1IeJplXNHM+VvCJ@kroah.com>
 <12aeed77-081c-ac40-4b6e-0415d551804e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12aeed77-081c-ac40-4b6e-0415d551804e@gmail.com>
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
Cc: Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 Dragan Cvetic <dragan.cvetic@xilinx.com>, linux-doc@vger.kernel.org,
 Tomasz Jankowski <tomasz1.jankowski@intel.com>,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Derek Kiernan <derek.kiernan@xilinx.com>,
 Jianxun Zhang <jianxun.zhang@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Oct 21, 2022 at 03:10:06PM +0700, Bagas Sanjaya wrote:
> On 10/21/22 11:20, Greg Kroah-Hartman wrote:
> > On Thu, Oct 20, 2022 at 07:53:25PM +0200, Maciej Kwapulinski wrote:
> >> Add a new PCI driver for Intel(R) Gaussian & Neural Accelerator
> > 
> > Please drop all of the (R) stuff in here, and in the Kconfig file and in
> > the .c files.  If your lawyers insist on it, please point them at me and
> > I will be glad to discuss it with them.
> > 
> >>  Documentation/gpu/drivers.rst    |  1 +
> >>  Documentation/gpu/gna.rst        | 64 ++++++++++++++++++++++++++++++++
> > 
> > Why not just put the tiny documentation file in the .c code itself?
> > That way it stays up to date and might actually be noticed?
> > 
> 
> I think the documentation should be on separate patch.

Not if it is in the .c file.
