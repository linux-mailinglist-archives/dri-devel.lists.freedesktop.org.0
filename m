Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8189A89E1AB
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 19:36:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE36D112E76;
	Tue,  9 Apr 2024 17:36:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="b/cQhxO1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0744A112E7B
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Apr 2024 17:36:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id DA329CE113E;
 Tue,  9 Apr 2024 17:36:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0DA8C433F1;
 Tue,  9 Apr 2024 17:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1712684181;
 bh=ctYYelSWdAbGCcmFP8PxFNfYiOWz9BWYAT3DYWAexmE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b/cQhxO1WCMqOnY9S4uycJMmiWsSU27lO1Odqne2KmjIxOMH3VRTRQQP7WYFnQd5i
 gAX43/tQ6c0/tS9IgS3rCZiFzng3rwS5WclyNj6yZtePuM0+powxiYSeyWDcNqZywd
 MtStHw7nBiBxDCc74LGqve83c+xGGxQ01HlX8fFM=
Date: Tue, 9 Apr 2024 19:36:18 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Yuguo Pei <purofle@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: fbtft: fb_st7789v: support setting offset
Message-ID: <2024040938-balcony-catapult-5c10@gregkh>
References: <2024040935-naturist-skimmer-391f@gregkh>
 <20240409172806.8527-1-purofle@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240409172806.8527-1-purofle@gmail.com>
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

On Wed, Apr 10, 2024 at 01:28:06AM +0800, Yuguo Pei wrote:
> On Tue, 9 Apr 2024 17:49:25 +0200, Greg KH wrote:
> > So you are now hard-coding the size?
> 
> Yes, the change just helps developers who want to adapt to different screen sizes.

So there is no change?  I don't understand.

> > Is this always going to be 0, if so, why need it at all?
> 
> Not sure. For example, when HEIGHT and WIDTH are 240 and 280, LEFT_OFFSET is 20 and TOP_OFFSET is 0. Different screens may have different offsets.

Then why is this needed?

Don't make changes that are not needed by anyone, especially for code in
drivers/staging/

> 
> In addition, do I need to resend the patch to modify the Signed-off-by?

Of course you do :)

