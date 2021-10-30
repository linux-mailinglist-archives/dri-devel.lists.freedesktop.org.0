Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 173B7440B57
	for <lists+dri-devel@lfdr.de>; Sat, 30 Oct 2021 20:50:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDAD789FF7;
	Sat, 30 Oct 2021 18:50:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A653489FF7
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Oct 2021 18:49:59 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 3857bcff-39b2-11ec-ac3c-0050568cd888;
 Sat, 30 Oct 2021 18:50:15 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id D3152194C35;
 Sat, 30 Oct 2021 20:49:55 +0200 (CEST)
Date: Sat, 30 Oct 2021 20:49:53 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Paul Cercueil <paul@crapouillou.net>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Christophe Branchereau <cbranchereau@gmail.com>,
 list@opendingux.net, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] gpu/drm: ingenic: Remove bogus register write
Message-ID: <YX2T0dbyaYkIbUgs@ravnborg.org>
References: <20211030100032.42066-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211030100032.42066-1-paul@crapouillou.net>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul,

On Sat, Oct 30, 2021 at 11:00:32AM +0100, Paul Cercueil wrote:
> Commit 1bdb542da736 ("drm/ingenic: Simplify code by using hwdescs
> array") caused the dma_hwdesc_phys_f{0,1} variables to be used while
> uninitialized in a mmio register write, which most certainly broke the
> ingenic-drm driver.
> 
> However, the very same patchset also submitted commit 6055466203df
> ("drm/ingenic: Upload palette before frame"), which restored a correct
> behaviour by doing the register writes in a different place in the code.
> 
> What's left of this, is just to remove the bogus register writes in the
> probe function.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> Reported-by: kernel test robot <lkp@intel.com>

Thank you lkp...
Acked-by: Sam Ravnborg <sam@ravnborg.org>
