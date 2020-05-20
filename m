Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4651DA98E
	for <lists+dri-devel@lfdr.de>; Wed, 20 May 2020 06:59:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DDF86E081;
	Wed, 20 May 2020 04:59:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1C546E081
 for <dri-devel@lists.freedesktop.org>; Wed, 20 May 2020 04:59:05 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 233742075F;
 Wed, 20 May 2020 04:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589950744;
 bh=0uBprx3zgrPmKIHQh5K/KhY5RQol9LDmQGYsEkv3dF8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DD2y4B3oJ/agfWo6rHk87iOaHbnRZ5FQsZK++7S2VyoZVu3SlZFvn//cXTzp+VoI3
 GS96rGLP9TNws7d0NoeaphWlmVS9YPrJp+Mu3SxuGTuHXuEMlTT4nLF3APmJvoQ4aK
 hD+vImzBwT2oM691xBNpGhFh1lJcGGpb3lPQCkGU=
Date: Wed, 20 May 2020 06:59:00 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [RFC PATCH 0/8] Qualcomm Cloud AI 100 driver
Message-ID: <20200520045900.GA2105777@kroah.com>
References: <CAKMK7uG-oP-tcOcNz-ZzTmGondEo-17BCN1kpFBPwb7F8QcM5w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKMK7uG-oP-tcOcNz-ZzTmGondEo-17BCN1kpFBPwb7F8QcM5w@mail.gmail.com>
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
Cc: Olof Johansson <olof.johansson@gmail.com>, wufan@codeaurora.org,
 Arnd Bergmann <arnd@arndb.de>, Jeffrey Hugo <jhugo@codeaurora.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, pratanan@codeaurora.org,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Jason Gunthorpe <jgg@mellanox.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 19, 2020 at 10:41:15PM +0200, Daniel Vetter wrote:
> > Ok, that's a decision you are going to have to push upward on, as we
> > really can't take this without a working, open, userspace.
> 
> Uh wut.
> 
> So the merge criteria for drivers/accel (atm still drivers/misc but I
> thought that was interim until more drivers showed up) isn't actually
> "totally-not-a-gpu accel driver without open source userspace".
> 
> Instead it's "totally-not-a-gpu accel driver without open source
> userspace" _and_ you have to be best buddies with Greg. Or at least
> not be on the naughty company list. Since for habanalabs all you
> wanted is a few test cases to exercise the ioctls. Not the entire
> userspace.

Habanalabs now has their full library opensourced that their tools use
directly, so that's not an argument anymore.

My primary point here is the copyright owner of this code, because of
that, I'm not going to objet to allowing this to be merged without open
userspace code.

thanks,

greg k-h
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
