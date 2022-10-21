Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B37D7606EE1
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 06:25:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92C7F10E5A5;
	Fri, 21 Oct 2022 04:25:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDE9F10E5A5
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 04:25:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 636BD61D7E;
 Fri, 21 Oct 2022 04:25:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23BD3C433C1;
 Fri, 21 Oct 2022 04:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1666326310;
 bh=Wy2yXTuo4Kt3OsucQbZR+6JaTdyrJNPegvCKC+NPjT0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cVAFNFCWsCSCgWBWrmMhXpMMOS9zHJlsZIDHnPANytOGXYSYTa04H834oQMDNDSEq
 Rt4b/ycRVTd/Dyum50s8o0hTy+MZXoYLl6wUgxXDIaEfWRXmS+w8IZKvMt9IDc4LBn
 nQV8h/HREeqUvyM7/qaThCaoCloXcJq0ekVRQ7ws=
Date: Fri, 21 Oct 2022 06:25:59 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
Subject: Re: [PATCH v5 02/10] gna: add GNA DRM device
Message-ID: <Y1IfV5zdh04yIqr7@kroah.com>
References: <20221020175334.1820519-1-maciej.kwapulinski@linux.intel.com>
 <20221020175334.1820519-3-maciej.kwapulinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221020175334.1820519-3-maciej.kwapulinski@linux.intel.com>
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
 Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Derek Kiernan <derek.kiernan@xilinx.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 20, 2022 at 07:53:26PM +0200, Maciej Kwapulinski wrote:
> Signed-off-by: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
> Tested-by: Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>

Obviously we can not take patches without any changelog text at all.

And neither would you want us to.

Again, would you want to review this patch?

thanks,

greg k-h
