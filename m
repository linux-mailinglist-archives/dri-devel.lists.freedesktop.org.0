Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F04B47383E5
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 14:35:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BADF310E45B;
	Wed, 21 Jun 2023 12:35:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5601710E45B
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 12:35:53 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 47DF961557;
 Wed, 21 Jun 2023 12:35:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FE66C433C8;
 Wed, 21 Jun 2023 12:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1687350951;
 bh=oA00j8SGsLAfEE2VYW2tmV+p21e21DY6z9zt4CBGWzg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=plI0rSWQA3yJ724Fs/ZEMHXQBhKx71Pgr6JGwLaqP5VX85hybAGMxOUCNwCAj3zH4
 01R6RYv8ahxwPy01W59HkDebG5pu82PYPAKoSxb51846Bjpmfl67LE3UO59hZHpDET
 lkQy1Am4zYyX88NPy7gM1WNTA99RCAJXdAj3KIJ0=
Date: Wed, 21 Jun 2023 14:35:46 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH] dma-buf: keep the signaling time of merged fences
Message-ID: <2023062104-goggles-filter-b939@gregkh>
References: <20230621073204.28459-1-christian.koenig@amd.com>
 <2023062140-bartender-closable-9fa9@gregkh>
 <44be4e13-a157-35ec-6ff7-e3a0fce057e4@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <44be4e13-a157-35ec-6ff7-e3a0fce057e4@amd.com>
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
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 juan.hao@nxp.com, stable@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 21, 2023 at 02:05:07PM +0200, Christian König wrote:
> Am 21.06.23 um 13:02 schrieb Greg KH:
> > On Wed, Jun 21, 2023 at 09:32:04AM +0200, Christian König wrote:
> > > Some Android CTS is testing for that.
> > > 
> > > Signed-off-by: Christian König <christian.koenig@amd.com>
> > > CC: stable@vger.kernel.org
> > What commit id does this fix?
> 
> Sorry Greg, totally unintentionally send this CC to the stable list because
> git wasn't correctly configured.

It's fine to cc: the stable list, we WANT to see patches that are being
sent out like this before they hit the maintainers tree as you get more
review of them.

So no need to change your git configuration, this is fine.

> The patch is still under review.

Agreed, which is why it should be fixed :)

thanks,

greg k-h
