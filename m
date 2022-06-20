Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6B45515BE
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jun 2022 12:26:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D1FC112FE6;
	Mon, 20 Jun 2022 10:26:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F18A9112FE6
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jun 2022 10:26:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BDF3AB80FEA;
 Mon, 20 Jun 2022 10:26:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E754DC3411B;
 Mon, 20 Jun 2022 10:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1655720763;
 bh=Wal+H1rMTMUMX67N1hK9qOOenXwy00Js2GP0OU5lLmA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nLD/STKXRr4oGH09HyHcudKrcxGfa2TnFtj0fGs+YchvfpQ/yHENjP/tlZc0XSBcp
 a3JfWGHDkUt4EwoQd8oaukI/RVZq4dBRo4E2obYlxv3X4k0juV6YtlUIB2Ou/jgdEE
 ZO/ExEnaVlHTsyeSHYOLsfyVm1dTWcmbORoXqA+U=
Date: Mon, 20 Jun 2022 12:26:00 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
Subject: Re: [PATCH v3 00/14] Driver of Intel(R) Gaussian & Neural Accelerator
Message-ID: <YrBLOPHGAZgFJvWN@kroah.com>
References: <85a6nq45uh.fsf@linux.intel.com>
 <20220620094907.4101274-1-maciej.kwapulinski@linux.intel.com>
 <YrBEP4P9JA60LeOB@kroah.com> <86czf3wsrg.fsf@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86czf3wsrg.fsf@linux.intel.com>
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
Cc: arnd@arndb.de, corbet@lwn.net, guy.zadicario@intel.com,
 dragan.cvetic@xilinx.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 andy.shevchenko@gmail.com, derek.kiernan@xilinx.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 20, 2022 at 12:08:34PM +0200, Maciej Kwapulinski wrote:
> 
> Greg KH <gregkh@linuxfoundation.org> writes:
> 
> > On Mon, Jun 20, 2022 at 11:49:07AM +0200, maciej.kwapulinski@linux.intel.com wrote:
> >> Please share your thoughts.
> >
> > No code here to share thoughts about :(
> 
> code will be published in comming weeks to dri-devel ML

Saying "we will send patches sometime in the future" is a bit odd when
we have thousands of patches each week in our inbox to review now.  Why
not help us out with that workload?  :)

thanks,

greg k-h
